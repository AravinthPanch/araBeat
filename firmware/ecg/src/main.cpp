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
    Serial.begin(115200);

    // setup chipselect pin
    pinMode(MAX30003_CS_PIN, OUTPUT);

    // chip deselect
    digitalWrite(MAX30003_CS_PIN, HIGH);

    SPI.begin();
    SPI.setBitOrder(MSBFIRST);
    SPI.setDataMode(SPI_MODE0);

    // initialize MAX30003
    ecg.max30003_begin();
}

/*******************************************************************************
 * ECG voltage readout for serial plotting
 ********************************************************************************/
void loop()
{
    // read data from max30003 fifo
    uint32_t ecg_fifo = ecg.max30003_read_register(ECG_FIFO);

    // extract 24 bits data from fifo as signed integer for plotting
    int16_t ecg_sample = ecg_fifo >> 8;

    // shift out ETG[5:3] & PTG[2:0] bits
    ecg_sample = ecg_fifo >> 6;

    // print ecg voltage to display in serial plotter
    // R-R is always above 0
    Serial.println(ecg_sample);

    delay(8);
}
