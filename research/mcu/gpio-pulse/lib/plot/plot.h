/*******************************************************************************
 *    @brief    PLOT
 *
 ********************************************************************************/
#ifndef _PLOT_H_
#define _PLOT_H_

/*******************************************************************************
 * Includes
 ********************************************************************************/
#include <Arduino.h>

/*******************************************************************************
 * Definitions
 ********************************************************************************/

class plot
{
public:
    enum midi_commands_e
    {
        ECG_ANALOG_VOLTAGE = 0xE0,
        DIGITAL_VAL0 = 0x90,
        DIGITAL_ON = 0x00,
        DIGITAL_OFF = 0x00,
    };

    // constructor
    plot();

    // public functions
    void send_data_to_arabeat_gui(midi_commands_e command, unsigned int message);
    void send_data_to_protocentral_gui(int16_t ecg_sample, uint16_t r_to_r, uint16_t bpm);
    void send_data_to_arduino_plotter(int16_t ecg_sample);
};

#endif /*_PLOT_H_*/
