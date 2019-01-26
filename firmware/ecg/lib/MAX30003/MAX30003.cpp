/*******************************************************************************
 *
 *	@brief	MAX30003 ECG
 *
 ********************************************************************************/

/*******************************************************************************
 * Includes
 ********************************************************************************/
#include "max30003.h"

/*******************************************************************************
 * Variable declarations
 ********************************************************************************/

/*******************************************************************************
 * Functions
 ********************************************************************************/

// constructor
max30003::max30003(){};

// write SPI registers of max30003
void max30003::max30003_write_register(uint8_t reg_address, uint32_t data)
{
    // chip select
    digitalWrite(MAX30003_CS_PIN, LOW);
    delay(2);

    // select the register to write
    SPI.transfer((reg_address << 1) | WREG);

    // write 24 bits (3 bytes) of data
    SPI.transfer(data >> 16);
    SPI.transfer(data >> 8);
    SPI.transfer(data);

    // chip deselect
    delay(2);
    digitalWrite(MAX30003_CS_PIN, HIGH);
}

// read SPI registers of max30003
uint32_t max30003::max30003_read_register(uint8_t reg_address)
{
    uint32_t data = 0;

    // chip select
    digitalWrite(MAX30003_CS_PIN, LOW);

    // select the register to read
    SPI.transfer((reg_address << 1) | RREG);

    // read 24 bits (3 bytes) of data from max30003 register
    data |= (SPI.transfer(0xff) << 16);
    data |= (SPI.transfer(0xff) << 8);
    data |= SPI.transfer(0xff);

    // chip deselect
    digitalWrite(MAX30003_CS_PIN, HIGH);

    return data;
}

// initialize max30003 chip
void max30003::max30003_init()
{
    max30003_write_register(SW_RST, 0x000000);
    delay(100);
    max30003_write_register(CNFG_GEN, 0x081007);
    delay(100);
    max30003_write_register(CNFG_CAL, 0x720000); // 0x700000
    delay(100);
    max30003_write_register(CNFG_EMUX, 0x0B0000);
    delay(100);
    // d23 - d22 : 10 for 250sps , 00:500 sps
    max30003_write_register(CNFG_ECG, 0x805000);
    delay(100);
    max30003_write_register(CNFG_RTOR1, 0x3fc600);
    max30003_write_register(SYNCH, 0x000000);
    delay(100);
}
