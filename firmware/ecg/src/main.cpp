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
}

/*******************************************************************************
 * ECG voltage readout for serial plotting
 *
 * R-R is always above 0 at 20V/V ECG Gain in the serial plotter, when no ac
 * noise is present ac noise in the system comes from laptop charger, monitor HDMI
 ********************************************************************************/
void loop()
{
    // read data from max30003 fifo
    uint32_t ecg_fifo = ecg.max30003_read_register(max30003::ECG_FIFO);

    // extract 24 bits data from fifo as signed integer for plotting
    int16_t ecg_sample = ecg_fifo >> 8;

    // shift out ETG[5:3] & PTG[2:0] bits
    ecg_sample = ecg_fifo >> 6;

    // print ecg voltage to display in serial plotter
    Serial.println(ecg_sample);

    delay(8);
}
