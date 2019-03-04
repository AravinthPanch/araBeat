/*******************************************************************************
 *
 *	@brief	MAX30003 ECG
 *
 ********************************************************************************/

/*******************************************************************************
 * Includes
 ********************************************************************************/
#include <Arduino.h>
#include <max30003.h>
#include <plot.h>

/*******************************************************************************
 * Pin Configuration
 ********************************************************************************/

// MAX30003 Interrupt 1 to receive ECG readings
const uint8_t ECG_INT1_PIN = 2;
// Heart Pulse LED on MCU Module
const uint8_t MCU_HEART_PULSE_PIN = 5;
// Heart Pulse to DSP GPIO MP2
const uint8_t DSP_HEART_PULSE_PIN = 6;

/*******************************************************************************
 * Definitions
 ********************************************************************************/
#define CURRENT_SYSTEM_TIME_MS millis()

/*******************************************************************************
 * Variable declarations
 ********************************************************************************/
const uint32_t EINT_STATUS_MASK = 0x800000;   // D[23] bit
const uint32_t DCLOFF_STATUS_MASK = 0x100000; // D[20] bit
const uint32_t RTOR_STATUS_MASK = 0x400;      // D[11] bit
const uint8_t FIFO_OVF_MASK = 0x7;
const uint8_t FIFO_VALID_SAMPLE_MASK = 0x0;
const uint8_t FIFO_FAST_SAMPLE_MASK = 0x1;
const uint8_t ETAG_BITS_MASK = 0x7;
const float RTOR_LSB_RES = 0.0078125f;
const uint8_t RTOR_PRESCALE = 8; // 8ms RTOR resolution is for 32768Hz master clock

max30003 ecg;
plot plotter;

uint32_t ecg_fifo, sample_count, etag_bits[32], rtor;
int16_t ecg_sample[32];
float bpm;

volatile bool ecg_int_flag = 0;

// 120 bpm
const uint16_t MIN_RTOR_INTERVAL = 500;
// 60 bpm
const uint16_t MAX_RTOR_INTERVAL = 1000;
bool heart_pulse_status = LOW;
int16_t heart_pulse_status_test = 1;
uint32_t last_heart_pulse_time_ms = 0;
uint16_t current_rtor_interval_ms = 0;
uint32_t last_rtor_interrupt_time_ms = 0;

const uint8_t DCLOFF_ARRAY_SIZE = 96;
int16_t dcloff_array[DCLOFF_ARRAY_SIZE];
uint8_t dcloff_array_count = 0;
// avg voltage of samples when electrodes touched. It should be just above the avg peak of when electrodes not-touched
const int16_t VOLTAGE_THRESHOLD = 0;
// count of avg voltage of samples above threshold when electrodes touched
uint8_t ABOVE_VOLTAGE_THRESHOLD_COUNT = 0;
// counts to check since electrodes touched, before confirming real touch, to avoid noises
const int16_t DEBOUNCE_ABOVE_VOLTAGE_THRESHOLD_COUNT = 2;

// portion of RTOR when QRS happens
const uint16_t HEART_PULSE_QRS_TIME = 200;
// 72 bpm before RTOR stablized
const uint16_t FAKE_RTOR_INTERVAL_MS = 833;
// time to wait since electrodes touched, before sending the fake rtor, to avoid noises
const uint16_t DEBOUNCE_FAKE_RTOR_INTERVAL_MS = 3 * 1000;
// time after hands off the electrodes
const uint16_t USER_INACTIVE_TIME_MS = 20 * 1000;
// It takes approximately 20 seconds to get stablized RTOR from MAX30003/ Thompkins Algorithm
const uint16_t RTOR_STABILIZING_TIME_MS = 10 * 1000;
// timestamp when electrodes were touched last
uint16_t electrodes_last_touched_time_ms = 0;
// are electrodes touched for the first time after being inactive
bool are_electrodes_touched_for_the_first_time = false;

/*******************************************************************************
 * Functions
 ********************************************************************************/

// interrupt service routine
void ecg_callback()
{
    ecg_int_flag = 1;
}

void setup()
{
    // setup serial port for plotting
    Serial.begin(115200);

    // setup outputs
    pinMode(MCU_HEART_PULSE_PIN, OUTPUT);
    pinMode(DSP_HEART_PULSE_PIN, OUTPUT);

    // setup interrupt
    pinMode(ECG_INT1_PIN, INPUT);
    attachInterrupt(digitalPinToInterrupt(ECG_INT1_PIN), ecg_callback, CHANGE);

    // setup chipselect pin
    pinMode(MAX30003_CS_PIN, OUTPUT);

    // chip deselect
    digitalWrite(MAX30003_CS_PIN, HIGH);

    // setup SPI
    SPI.begin();
    SPI.setBitOrder(MSBFIRST);
    SPI.setDataMode(SPI_MODE0);

    // initialize max30003 chip
    ecg.max30003_init();
}

// switch off outputs after RTOR interval timeout
void check_heart_pulse_off_timer()
{
    if ((CURRENT_SYSTEM_TIME_MS - last_heart_pulse_time_ms) >= HEART_PULSE_QRS_TIME)
    {
        heart_pulse_status = LOW;
        last_heart_pulse_time_ms = CURRENT_SYSTEM_TIME_MS;
        digitalWrite(MCU_HEART_PULSE_PIN, heart_pulse_status);
        digitalWrite(DSP_HEART_PULSE_PIN, heart_pulse_status);
        plotter.send_data_to_arabeat_gui(plot::HEART_PULSE, heart_pulse_status);
    }
}

// switch on outputs after RTOR detection
void set_heart_pulse_on(uint16_t rtor_interval_ms)
{
    if (rtor_interval_ms >= MIN_RTOR_INTERVAL && rtor_interval_ms <= MAX_RTOR_INTERVAL)
    {
        heart_pulse_status = HIGH;
        current_rtor_interval_ms = HEART_PULSE_QRS_TIME;
        digitalWrite(MCU_HEART_PULSE_PIN, heart_pulse_status);
        digitalWrite(DSP_HEART_PULSE_PIN, heart_pulse_status);
        plotter.send_data_to_arabeat_gui(plot::HEART_PULSE, heart_pulse_status);
        plotter.send_data_to_arabeat_gui(plot::RTOR_IN_MS, rtor);
    }
}

// brute force dc lead-off delection
void update_dcloff_array()
{
    for (int i = 0;
         (dcloff_array_count < DCLOFF_ARRAY_SIZE && sample_count > 1 && i < sample_count);
         i++)
    {
        dcloff_array[dcloff_array_count] = ecg_sample[i];
        dcloff_array_count++;
    }
}

// check if electrodes are touched
bool are_electrodes_touched()
{
    bool result = false;
    // count voltages above threshold
    for (int i = 0; i < DCLOFF_ARRAY_SIZE; i++)
    {
        if (dcloff_array[i] >= VOLTAGE_THRESHOLD)
            ABOVE_VOLTAGE_THRESHOLD_COUNT++;
    }

    if (ABOVE_VOLTAGE_THRESHOLD_COUNT >= DEBOUNCE_ABOVE_VOLTAGE_THRESHOLD_COUNT)
    {
        result = true;

        // check if the electrodes are touch for the first time after inactive time
        if ((CURRENT_SYSTEM_TIME_MS - electrodes_last_touched_time_ms) >= USER_INACTIVE_TIME_MS)
            are_electrodes_touched_for_the_first_time = true;
        else
            are_electrodes_touched_for_the_first_time = false;

        electrodes_last_touched_time_ms = millis();
    }

    // reset counter
    dcloff_array_count = 0;
    ABOVE_VOLTAGE_THRESHOLD_COUNT = 0;

    return result;
}

// if electrodes are touched, fake heartbeat till RTOR interrupt
void check_electrodes()
{
    // if dcloff_array is full, check if electrodes are touched
    if (dcloff_array_count == DCLOFF_ARRAY_SIZE)
    {
        if (are_electrodes_touched() &&
            ((CURRENT_SYSTEM_TIME_MS - are_electrodes_touched_for_the_first_time) >=
             DEBOUNCE_FAKE_RTOR_INTERVAL_MS))
        {
            plotter.send_data_to_arabeat_gui(plot::ELECTRODES_TOUCHED, 1);

            if ((CURRENT_SYSTEM_TIME_MS - are_electrodes_touched_for_the_first_time) <= RTOR_STABILIZING_TIME_MS)
                set_heart_pulse_on(FAKE_RTOR_INTERVAL_MS);
        }
        else
            plotter.send_data_to_arabeat_gui(plot::ELECTRODES_TOUCHED, 0);
    }
}

/*******************************************************************************
 * ECG voltage readout for serial plotting
 *
 * R-R is always above 0 at 20V/V ECG Gain in the serial plotter, when no ac
 * noise is present ac noise in the system comes from laptop charger, monitor HDMI
 ********************************************************************************/
void loop()
{
    // check_electrodes();

    if (ecg_int_flag)
    {
        ecg_int_flag = 0;
        uint32_t status = ecg.max30003_read_register(max30003::STATUS);

        // DC Lead-off detection interrupt
        if ((status & DCLOFF_STATUS_MASK) == DCLOFF_STATUS_MASK)
        {
            // Serial.println("DC Lead-off detected");
        }

        // R-to-R readout interrupt
        if ((status & RTOR_STATUS_MASK) == RTOR_STATUS_MASK)
        {
            // Read RtoR register
            rtor = ecg.max30003_read_register(max30003::RTOR);

            last_rtor_interrupt_time_ms = millis();

            // extract 14 bits data from rtor register
            rtor = ((rtor >> 10) & 0x3fff);

            // rtor must be multiplied by 8 to get the time interval in millisecond 8ms resolution is for 32768Hz master clock
            rtor = rtor * 8;

            // switch on outputs
            set_heart_pulse_on(rtor);
            heart_pulse_status_test = 2;

            // calculate BPM
            bpm = 1.0f / (rtor * RTOR_LSB_RES / 60.0f);
        }

        // ECG readout interrupt
        if ((status & EINT_STATUS_MASK) == EINT_STATUS_MASK)
        {
            // reset sample counter
            sample_count = 0;

            do
            {
                // read ecg data from max30003 fifo
                ecg_fifo = ecg.max30003_read_register(max30003::ECG_FIFO);

                // shift out ETAG[5:3] & PTAG[2:0] bits & extract 18 bits data
                // as signed integer for serial plotting
                ecg_sample[sample_count] = ecg_fifo >> 8;

                // extract ETAG[5:3] bits
                etag_bits[sample_count] = (ecg_fifo >> 3) & ETAG_BITS_MASK;

                // increase sample count
                sample_count++;

                // if sample was last in FIFO, then exit
            } while (etag_bits[sample_count - 1] == FIFO_VALID_SAMPLE_MASK ||
                     etag_bits[sample_count - 1] == FIFO_FAST_SAMPLE_MASK);

            // if FIFO is overflowed, reset FIFO
            if (etag_bits[sample_count - 1] == FIFO_OVF_MASK)
                ecg.max30003_write_register(max30003::FIFO_RST, 0);

            // Print results
            for (int i = 0; (sample_count > 1 && i < sample_count); i++)
            {
                // plotter.send_data_to_protocentral_gui(ecg_sample[i], (uint16_t)rtor, (int16_t)bpm);
                // plotter.send_data_to_arduino_plotter(ecg_sample[i]);

                // plotter.send_data_to_arabeat_gui(plot::ECG_ANALOG_VOLTAGE, ecg_sample[i]);
                // plotter.send_data_to_arabeat_gui(plot::HEART_PULSE, heart_pulse_status);

                Serial.print(ecg_sample[i]);
                Serial.print(",");
                Serial.print(heart_pulse_status);
                Serial.print(",");
                Serial.println(heart_pulse_status_test);

                heart_pulse_status_test = 1;
            }

            check_heart_pulse_off_timer();
            // update_dcloff_array();
        }
    }
}
