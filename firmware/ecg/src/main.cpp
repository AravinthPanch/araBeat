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
const uint8_t MCU_HEART_PULSE_PIN = A1;
// Heart Pulse to DSP GPIO MP2
const uint8_t DSP_HEART_PULSE_PIN = A0;

/*******************************************************************************
 * Definitions
 ********************************************************************************/
#define CURRENT_SYSTEM_TIME_MS millis()
#define RTOR_INTERRUPT_PULSE_ON 10
#define RTOR_INTERRUPT_PULSE_OFF 2
#define STABLE_RTOR_STATUS_UNKNOWN 2
#define STABLE_RTOR_STATUS_FALSE 0
#define STABLE_RTOR_STATUS_TRUE 1
#define DSP_HEART_PULSE_ON HIGH
#define DSP_HEART_PULSE_OFF LOW

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
// 8ms RTOR resolution is for 32768Hz master clock
const uint8_t RTOR_PRESCALE = 8;

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
bool heart_pulse_status = DSP_HEART_PULSE_OFF;
int16_t rtor_interrupt_pulse = 1;
uint32_t heart_pulse_on_time_ms = 0;
uint32_t heart_pulse_off_time_ms = 0;
uint16_t current_rtor_interval_ms = 0;
uint32_t last_rtor_interrupt_time_ms = 0;
uint32_t last_fake_rtor_time_ms = 0;

// portion of RTOR when QRS happens
const uint16_t HEART_PULSE_QRS_TIME = 200;
// 72 bpm before RTOR stablized
const uint16_t FAKE_RTOR_INTERVAL_MS = 833;

// avg voltage of samples when electrodes touched. It should be just above the avg peak of when electrodes not-touched
// count of avg voltage of samples above threshold when electrodes touched
// counts to check since electrodes touched, before confirming real touch, to avoid noises
// time to wait since electrodes touched, before sending the fake rtor, to avoid noises
// It takes approximately 20 seconds to get stablized RTOR from MAX30003/ Thompkins Algorithm

const int16_t HANDS_OFF_TOP_VOLTAGE = -8;
const int16_t HANDS_OFF_BOTTOM_VOLTAGE = -25;
uint16_t hands_off_count = 0;
uint16_t hands_on_count = 0;
uint16_t hands_off_count_threshold = 0;
uint16_t hands_on_count_threshold = 0;
int16_t hands_on_detection_batch_count = 0;
bool hands_on_status = false;
const int16_t hands_on_detection_batch_size = 5;
int16_t stable_rtor_status = STABLE_RTOR_STATUS_UNKNOWN;

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

    Serial.println("#####################");
    Serial.println("araBeat Firmware v0.6");
    Serial.println("#####################");

    // setup outputs
    pinMode(MCU_HEART_PULSE_PIN, OUTPUT);
    pinMode(DSP_HEART_PULSE_PIN, OUTPUT);

    digitalWrite(MCU_HEART_PULSE_PIN, HIGH);
    digitalWrite(DSP_HEART_PULSE_PIN, HIGH);
    delay(200);
    digitalWrite(MCU_HEART_PULSE_PIN, LOW);
    digitalWrite(DSP_HEART_PULSE_PIN, LOW);

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
    if ((CURRENT_SYSTEM_TIME_MS - heart_pulse_on_time_ms) >= HEART_PULSE_QRS_TIME)
    {
        heart_pulse_status = DSP_HEART_PULSE_OFF;
        heart_pulse_off_time_ms = CURRENT_SYSTEM_TIME_MS;
        digitalWrite(MCU_HEART_PULSE_PIN, heart_pulse_status);
        digitalWrite(DSP_HEART_PULSE_PIN, heart_pulse_status);
    }
}

// switch on outputs after RTOR detection
void set_heart_pulse_on(uint16_t rtor_interval_ms)
{
    heart_pulse_status = DSP_HEART_PULSE_ON;
    heart_pulse_on_time_ms = CURRENT_SYSTEM_TIME_MS;
    current_rtor_interval_ms = rtor_interval_ms;
    digitalWrite(MCU_HEART_PULSE_PIN, heart_pulse_status);
    digitalWrite(DSP_HEART_PULSE_PIN, heart_pulse_status);
    plotter.send_data_to_arabeat_gui(plot::RTOR_IN_MS, rtor_interval_ms);
}

// send fake pulses when RTOR detection is unstable
void check_stable_rtor_status()
{
    if (hands_on_status == true &&
        ((CURRENT_SYSTEM_TIME_MS - last_rtor_interrupt_time_ms) > MAX_RTOR_INTERVAL) &&
        ((CURRENT_SYSTEM_TIME_MS - last_fake_rtor_time_ms) > FAKE_RTOR_INTERVAL_MS) &&
        heart_pulse_status == DSP_HEART_PULSE_OFF)
    {
        stable_rtor_status = STABLE_RTOR_STATUS_FALSE;
        last_fake_rtor_time_ms = CURRENT_SYSTEM_TIME_MS;
        set_heart_pulse_on(FAKE_RTOR_INTERVAL_MS);
    }
    else if (hands_on_status == false)
        stable_rtor_status = STABLE_RTOR_STATUS_UNKNOWN;
}

/*******************************************************************************
 * ECG voltage readout for serial plotting
 *
 * R-R is always above 0 at 20V/V ECG Gain in the serial plotter, when no ac
 * noise is present ac noise in the system comes from laptop charger, monitor HDMI
 ********************************************************************************/
void loop()
{
    check_stable_rtor_status();
    check_heart_pulse_off_timer();

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

            rtor_interrupt_pulse = RTOR_INTERRUPT_PULSE_ON;

            // extract 14 bits data from rtor register
            rtor = ((rtor >> 10) & 0x3fff);

            // rtor must be multiplied by prescaler
            rtor = rtor * RTOR_PRESCALE;

            if (rtor >= MIN_RTOR_INTERVAL && rtor <= MAX_RTOR_INTERVAL)
                last_rtor_interrupt_time_ms = millis();

            // switch on outputs
            if (hands_on_status && (rtor >= MIN_RTOR_INTERVAL && rtor <= MAX_RTOR_INTERVAL))
            {
                stable_rtor_status = STABLE_RTOR_STATUS_TRUE;
                set_heart_pulse_on(rtor);
            }

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
                plotter.send_data_to_arabeat_gui(plot::ECG_ANALOG_VOLTAGE, ecg_sample[i]);
                plotter.send_data_to_arabeat_gui(plot::HEART_PULSE, heart_pulse_status);
                plotter.send_data_to_arabeat_gui(plot::RTOR_INTERRUPT_PULSE, rtor_interrupt_pulse);
                rtor_interrupt_pulse = RTOR_INTERRUPT_PULSE_OFF;

                // plotter.send_data_to_protocentral_gui(ecg_sample[i],(uint16_t)rtor, (int16_t)bpm);
                // plotter.send_data_to_arduino_plotter(ecg_sample[i]);

                if (ecg_sample[i] >= HANDS_OFF_TOP_VOLTAGE || ecg_sample[i] <= HANDS_OFF_BOTTOM_VOLTAGE)
                    hands_on_count++;
                else
                    hands_off_count++;
            }

            // hands on detection algorithm
            hands_on_detection_batch_count++;
            hands_off_count_threshold = abs(0.50 * sample_count * 5);
            hands_on_count_threshold = 1;

            if (hands_on_detection_batch_count == hands_on_detection_batch_size)
            {
                plotter.send_data_to_arabeat_gui(plot::HANDS_ON_COUNT, hands_on_count);
                plotter.send_data_to_arabeat_gui(plot::HANDS_OFF_COUNT, hands_off_count);
                plotter.send_data_to_arabeat_gui(plot::HANDS_ON_COUNT_THRESHOLD,
                                                 hands_on_count_threshold);
                plotter.send_data_to_arabeat_gui(
                    plot::HANDS_OFF_COUNT_THRESHOLD, hands_off_count_threshold);
                plotter.send_data_to_arabeat_gui(
                    plot::SAMPLE_COUNT, sample_count * hands_on_detection_batch_size);
                plotter.send_data_to_arabeat_gui(plot::STABLE_RTOR_STATUS, stable_rtor_status);

                if (hands_on_count > hands_on_count_threshold && hands_off_count > hands_off_count_threshold)
                {
                    hands_on_status = true;
                    plotter.send_data_to_arabeat_gui(plot::HANDS_ON, hands_on_status);
                }
                else
                {
                    hands_on_status = false;
                    plotter.send_data_to_arabeat_gui(plot::HANDS_ON, hands_on_status);
                }

                hands_on_detection_batch_count = 0;
                hands_off_count = 0;
                hands_on_count = 0;
            }
        }
    }
}
