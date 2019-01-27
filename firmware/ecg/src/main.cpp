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
max30003 ecg;

const int RTOR_REG_OFFSET = 10;
const float RTOR_LSB_RES = 0.0078125f;

/*******************************************************************************
 * Functions
 ********************************************************************************/
void setup()
{
    // setup serial port for plotting
    Serial.begin(115200);

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

    // while (1)
    // {
    // };
}

// send data to Protocental GUI
// it works only with ECG Gain 20V/V, otherwise too noisy
void send_data_to_pde_plot(int16_t ecg_sample)
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

    data_bytes[9] = 0x00;
    data_bytes[10] = 0x00;
    data_bytes[11] = 0x00;
    data_bytes[12] = 0x00;

    data_bytes[13] = 0x00;
    data_bytes[14] = 0x00;
    data_bytes[15] = 0x00;
    data_bytes[16] = 0x00;

    data_bytes[17] = 0x00;
    data_bytes[18] = 0x0b;

    for (int i = 0; i < 19; i++)
    {
        Serial.write(data_bytes[i]);
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
    // read ecg data from max30003 fifo
    uint32_t ecg_fifo = ecg.max30003_read_register(max30003::ECG_FIFO);

    // shift out ETG[5:3] & PTG[2:0] bits & extract 18 bits data as signed
    // integer for serial plotting
    int16_t ecg_sample = ecg_fifo >> 6;

    // print ecg voltage to display in serial plotter
    Serial.println(ecg_sample);
    // send_data_to_pde_plot(ecg_sample);

    // read r-to-r data from max30003
    uint32_t r_to_r = ecg.max30003_read_register(max30003::RTOR);

    // extract 14 bits data from r_to_r register
    r_to_r = r_to_r >> RTOR_REG_OFFSET;

    // calculate BPM
    float bpm = 1.0f / (r_to_r * RTOR_LSB_RES / 60.0f);

    // print
    // Serial.println(bpm);

    delay(8);
}
