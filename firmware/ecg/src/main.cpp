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
 * Variable declarations
 ********************************************************************************/
// D2 on Arduino Nano
const uint8_t int1_pin = 2;
// RTOR LED pin
const uint8_t led_pin = 3;

const uint32_t EINT_STATUS_MASK = 0x800000;   // D[23] bit
const uint32_t DCLOFF_STATUS_MASK = 0x100000; // D[20] bit
const uint32_t RTOR_STATUS_MASK = 0x400;      // D[11] bit
const uint8_t FIFO_OVF_MASK = 0x7;
const uint8_t FIFO_VALID_SAMPLE_MASK = 0x0;
const uint8_t FIFO_FAST_SAMPLE_MASK = 0x1;
const uint8_t ETAG_BITS_MASK = 0x7;
const float RTOR_LSB_RES = 0.0078125f;
const uint8_t RTOR_PRESCALE = 8; // 8ms RTOR resolution is for 32768Hz master clock
const uint16_t MIN_RTOR_INTERVAL = 500;  // 120 bpm
const uint16_t MAX_RTOR_INTERVAL = 1000; // 60 bpm

max30003 ecg;
plot plotter;

uint32_t ecg_fifo, sample_count, etag_bits[32], rtor;
int16_t ecg_sample[32];
float bpm;

bool pulse_status = LOW;
uint32_t current_time_ms = 0;
uint32_t last_time_ms = 0;
uint16_t interval_time_ms = 800;
uint32_t last_rtor_interrupt_time_ms = 0;

const uint8_t dcloff_array_size = 96;
int16_t dcloff_array[dcloff_array_size];
uint8_t dcloff_array_count = 0;

// avg voltage of samples when electrodes touched
const int16_t voltage_threshold = 0; // 0V in the graph
// count of avg voltage of samples above threshold when electrodes touched
uint8_t above_voltage_threshold_count = 0;
// counts to check since electrodes touched, before confirming real touch, to avoid noises
const int16_t debounce_above_voltage_threshold_count = 2;

const uint16_t fake_rtor_time_ms = 833; // 72 bpm
// time to wait since electrodes touched, before sending the fake rtor, to avoid noises
const uint16_t debounce_fake_rtor_time_ms = 3 * 1000;
uint16_t electrodes_last_touched_time_ms = 0;
bool are_electrodes_touched_for_the_first_time = false;
const uint16_t user_inactive_time_ms = 20 * 1000;
// It takes approximately 20 seconds to get stablized RTOR from MAX30003/ Thompkins Algorithm
const uint16_t rtor_stabilizing_time_ms = 10 * 1000;

/*******************************************************************************
 * Functions
 ********************************************************************************/
// interrupt service routine
volatile bool ecg_int_flag = 0;
void ecg_callback()
{
    ecg_int_flag = 1;
}

void setup()
{
    // setup serial port for plotting
    Serial.begin(115200);

    // setup status LED
    pinMode(led_pin, OUTPUT);

    // setup interrupt
    pinMode(int1_pin, INPUT);
    attachInterrupt(digitalPinToInterrupt(int1_pin), ecg_callback, CHANGE);

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

// switch led off after R-TO-R interval timeout
void check_rtor_led()
{
    if ((current_time_ms - last_time_ms) >= interval_time_ms)
    {
        last_time_ms = current_time_ms;

        if (pulse_status == HIGH)
        {
            // Serial.println("timer_out");
            pulse_status = LOW;
            digitalWrite(led_pin, pulse_status);
            plotter.send_data_to_arabeat_gui(plot::HEART_PULSE, pulse_status);
        }
    }
}

// switch led on and set R-TO-R interval timeout
void send_heart_pulse(uint16_t time_ms)
{
    if (time_ms >= MIN_RTOR_INTERVAL && time_ms <= MAX_RTOR_INTERVAL)
    {
        pulse_status = HIGH;
        interval_time_ms = time_ms;
        digitalWrite(led_pin, pulse_status);
        plotter.send_data_to_arabeat_gui(plot::HEART_PULSE, pulse_status);
        plotter.send_data_to_arabeat_gui(plot::RTOR_IN_MS, rtor);
    }
}

// brute force dc lead-off delection
void update_dcloff_array()
{
    for (int i = 0;
         (dcloff_array_count < dcloff_array_size && sample_count > 1 && i < sample_count);
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
    for (int i = 0; i < dcloff_array_size; i++)
    {
        if (dcloff_array[i] >= voltage_threshold)
            above_voltage_threshold_count++;
    }
    // Serial.println(above_voltage_threshold_count);

    if (above_voltage_threshold_count >= debounce_above_voltage_threshold_count)
    {
        result = true;

        // check if the electrodes are touch for the first time after inactive time
        if ((current_time_ms - electrodes_last_touched_time_ms) >= user_inactive_time_ms)
            are_electrodes_touched_for_the_first_time = true;
        else
            are_electrodes_touched_for_the_first_time = false;

        electrodes_last_touched_time_ms = millis();
    }

    // reset counter
    dcloff_array_count = 0;
    above_voltage_threshold_count = 0;

    return result;
}

// if electrodes are touched, fake heartbeat till RTOR interrupt
void check_electrodes()
{
    // if dcloff_array is full, check if electrodes are touched
    if (dcloff_array_count == dcloff_array_size)
    {
        if (are_electrodes_touched() &&
            ((current_time_ms - are_electrodes_touched_for_the_first_time) >= debounce_fake_rtor_time_ms))
        {
            plotter.send_data_to_arabeat_gui(plot::ELECTRODES_TOUCHED, 1);

            if ((current_time_ms - are_electrodes_touched_for_the_first_time) <= rtor_stabilizing_time_ms)
                send_heart_pulse(fake_rtor_time_ms);
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
    current_time_ms = millis();
    check_electrodes();
    check_rtor_led();

    if (ecg_int_flag)
    {
        ecg_int_flag = 0;
        uint32_t status = ecg.max30003_read_register(max30003::STATUS);
        // Serial.print("#");
        // Serial.println(status, BIN);

        // DC Lead-off detection interrupt
        if ((status & DCLOFF_STATUS_MASK) == DCLOFF_STATUS_MASK)
        {
            // Serial.println("DC Lead-off detected");
        }

        // R-to-R readout interrupt
        if ((status & RTOR_STATUS_MASK) == RTOR_STATUS_MASK)
        {
            // Serial.println("R-to-R readout");

            // Read RtoR register
            rtor = ecg.max30003_read_register(max30003::RTOR);

            last_rtor_interrupt_time_ms = millis();

            // extract 14 bits data from rtor register
            rtor = ((rtor >> 10) & 0x3fff);

            // rtor must be multiplied by 8 to get the time interval in millisecond 8ms resolution is for 32768Hz master clock
            rtor = rtor * 8;

            // Serial.print(rtor );
            send_heart_pulse(rtor);

            // calculate BPM
            bpm = 1.0f / (rtor * RTOR_LSB_RES / 60.0f);
            // Serial.println(bpm);
        }

        // ECG readout interrupt
        if ((status & EINT_STATUS_MASK) == EINT_STATUS_MASK)
        {
            // Serial.println("ECG readout");

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
                plotter.send_data_to_arduino_plotter(ecg_sample[i]);

                plotter.send_data_to_arabeat_gui(plot::ECG_ANALOG_VOLTAGE, ecg_sample[i]);
                plotter.send_data_to_arabeat_gui(plot::HEART_PULSE, pulse_status);
            }
            update_dcloff_array();
        }
    }
}
