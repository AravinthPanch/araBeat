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
        RTOR_IN_MS = 0xE1,
        RTOR_INTERRUPT_PULSE = 0xE2,
        HANDS_ON_COUNT = 0xE3,
        HANDS_OFF_COUNT = 0xE4,
        SAMPLE_COUNT = 0xE5,
        HANDS_ON_COUNT_THRESHOLD = 0xE6,
        HANDS_OFF_COUNT_THRESHOLD = 0xE7,
        STABLE_RTOR_STATUS = 0xE8,
        HEART_PULSE = 0x90,
        HANDS_ON = 0x91,
    };

    // constructor
    plot();

    // public functions
    void send_data_to_arabeat_gui(midi_commands_e command, unsigned int message);
    void send_data_to_protocentral_gui(int16_t ecg_sample, uint16_t rtor, uint16_t bpm);
    void send_data_to_arduino_plotter(int16_t ecg_sample);
};

#endif /*_PLOT_H_*/
