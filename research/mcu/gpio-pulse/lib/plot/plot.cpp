/*******************************************************************************
 *
 *	@brief	PLOT
 *
 ********************************************************************************/

/*******************************************************************************
 * Includes
 ********************************************************************************/
#include "plot.h"

/*******************************************************************************
 * Variable declarations
 ********************************************************************************/

/*******************************************************************************
 * Functions
 ********************************************************************************/

// constructor
plot::plot(){};

// send data as MIDI messages to araBeat GUI
// the message is intentionally made unsigned to perform bit operations
void plot::send_data_to_arabeat_gui(midi_commands_e command, unsigned int message)
{
    // Send Command Byte
    Serial.write(command);

    if (command >= 0xE0 && command <= 0xEF)
    {
        // the Bit operations are designed assuming that the size of Int is 16
        // bits Returns the first 2 bits (MSB)
        Serial.write(message >> 14);
        // Returns the next 7 bits
        Serial.write((message << 2) >> 9);
        // Returns the last 7 bits (LSB)
        Serial.write((message << 9) >> 9);
    }
    else
    {
        // For Digital values either return 0 or 1
        Serial.write(message);
    }
}

// send data to Protocental GUI
// it works only with ECG Gain 20V/V, otherwise too noisy
void plot::send_data_to_protocentral_gui(int16_t ecg_sample, uint16_t rtor, uint16_t bpm)
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

    data_bytes[9] = rtor;
    data_bytes[10] = rtor >> 8;
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

// send data to Arduino Plotter
void plot::send_data_to_arduino_plotter(int16_t ecg_sample)
{
    Serial.println(ecg_sample);
}
