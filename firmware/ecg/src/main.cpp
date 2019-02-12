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

max30003 ecg;

uint32_t ecg_fifo, sample_count, etag_bits[32], r_to_r;
int16_t ecg_sample[32];
float bpm;
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

// send data to Protocental GUI
// it works only with ECG Gain 20V/V, otherwise too noisy
void send_data_to_pde_plot(int16_t ecg_sample, uint16_t r_to_r, uint16_t bpm)
{
    uint8_t data_bytes[20];

    data_bytes[0] = 0x0A;
    data_bytes[1] = 0xFA;
    data_bytes[2] = 0x0C;
    data_bytes[3] = 0;
    data_bytes[4] = 0x02;

    data_bytes[5] = ecg_sample >> 24;
    data_bytes[6] = ecg_sample >> 16;
    data_bytes[7] = ecg_sample >> 8;
    data_bytes[8] = ecg_sample;

    data_bytes[9] = r_to_r;
    data_bytes[10] = r_to_r >> 8;
    data_bytes[11] = 0x00;
    data_bytes[12] = 0x00;

    data_bytes[13] = bpm;
    data_bytes[14] = bpm >> 8;
    data_bytes[15] = 0x00;
    data_bytes[16] = 0x00;

    data_bytes[17] = 0x00;
    data_bytes[18] = 0x0b;

    for (int i = 0; i < 19; i++)
    {
        Serial.write(data_bytes[i]);
    }
}

// switch led off after R-TO-R interval timeout
bool led_status = LOW;
uint32_t current_time_ms = 0;
uint32_t last_time_ms = 0;
uint16_t interval_time_ms = 800;
void check_rtor_led()
{
    if ((current_time_ms - last_time_ms) >= interval_time_ms)
    {
        last_time_ms = current_time_ms;

        if (led_status == HIGH)
        {
            // Serial.println("timer_out");
            led_status = LOW;
            digitalWrite(led_pin, LOW);
        }
    }
}

// switch led on and set R-TO-R interval timeout
const uint16_t min_rtor_interval = 500;  // 120 bpm
const uint16_t max_rtor_interval = 1000; // 60 bpm
void set_led_timer(uint16_t time_ms)
{
    if (time_ms >= min_rtor_interval && time_ms <= max_rtor_interval)
    {
        // Serial.println("set_led_timer");
        led_status = HIGH;
        digitalWrite(led_pin, HIGH);
        interval_time_ms = time_ms;
    }
}

// brute force dc lead-off delection
const uint8_t dcloff_array_size = 96;
int16_t dcloff_array[dcloff_array_size];
uint8_t dcloff_array_count = 0;
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
int16_t voltage_threshold = 0;
uint8_t above_voltage_threshold_count = 0;
int16_t dcloff_threshold_count_midpoint = 10;
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

    if (above_voltage_threshold_count < dcloff_threshold_count_midpoint)
        result = true;

    // reset counter
    dcloff_array_count = 0;
    above_voltage_threshold_count = 0;

    return result;
}

// if electrodes are touched, fake heartbeat till RTOR interrupt
const uint16_t default_rtor_time_ms = 800;
void check_electrodes()
{
    // if dcloff_array is full, check if electrodes are touched
    if (dcloff_array_count == dcloff_array_size)
    {
        if (are_electrodes_touched())
        {
            set_led_timer(default_rtor_time_ms);
            // Serial.println("Fake It Till You Make It");
        }
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
            r_to_r = ecg.max30003_read_register(max30003::RTOR);

            // extract 14 bits data from r_to_r register
            r_to_r = ((r_to_r >> 10) & 0x3fff);
            // Serial.print(r_to_r * 8);

            set_led_timer(r_to_r * 8);

            // calculate BPM
            bpm = 1.0f / (r_to_r * RTOR_LSB_RES / 60.0f);
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
                // r_to_r must be multiplied by 8 to get the time interval in
                // millisecond 8ms resolution is for 32768Hz master clock
                // send_data_to_pde_plot(ecg_sample[i], (uint16_t)r_to_r * 8, (int16_t)bpm);

                // Serial.print(r_to_r * 8);
                // Serial.print(",");
                Serial.println(ecg_sample[i]);
            }
            update_dcloff_array();
        }
    }
}
