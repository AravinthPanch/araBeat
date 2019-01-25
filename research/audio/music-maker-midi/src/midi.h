/**
   Author: Aravinth Panchadcharam
   Email: me@aravinth.info
   Date: 11/07/18.
   Project: araBeat
*/

#include "VS1053.h"
#include <SoftwareSerial.h>

class midi
{
  private:

  public:

    midi();
    void setInstrument(uint8_t chan, uint8_t inst);
    void setChannelVolume(uint8_t chan, uint8_t vol);
    void setChannelBank(uint8_t chan, uint8_t bank);
    void noteOn(uint8_t chan, uint8_t n, uint8_t vel);
    void noteOff(uint8_t chan, uint8_t n, uint8_t vel);
};
