/*******************************************************************************
 *
 *	@brief	MAX30003 ECG
 *
 ********************************************************************************/

/*******************************************************************************
 * Includes
 ********************************************************************************/
#include "MAX30003.h"

/*******************************************************************************
 * Variable declarations
 ********************************************************************************/
char SPI_temp_32b[4];
char SPI_temp_Burst[100];

/*******************************************************************************
 * Functions
 ********************************************************************************/

// constructor
MAX30003::MAX30003(){};

// write SPI registers
void MAX30003::MAX30003_Reg_Write(unsigned char WRITE_ADDRESS, unsigned long data)
{
    // now combine the register address and the command into one byte:
    byte dataToSend = (WRITE_ADDRESS << 1) | WREG;

    // take the chip select low to select the device:
    digitalWrite(MAX30003_CS_PIN, LOW);

    delay(2);
    SPI.transfer(dataToSend); // Send register location
    SPI.transfer(data >> 16); // number of register to wr
    SPI.transfer(data >> 8);  // number of register to wr
    SPI.transfer(data);       // Send value to record into register
    delay(2);

    // take the chip select high to de-select:
    digitalWrite(MAX30003_CS_PIN, HIGH);
}

// read SPI registers
void MAX30003::MAX30003_Reg_Read(uint8_t Reg_address)
{
    uint8_t SPI_TX_Buff;

    digitalWrite(MAX30003_CS_PIN, LOW);

    SPI_TX_Buff = (Reg_address << 1) | RREG;
    SPI.transfer(SPI_TX_Buff); // Send register location

    for (int i = 0; i < 3; i++)
    {
        SPI_temp_32b[i] = SPI.transfer(0xff);
    }

    digitalWrite(MAX30003_CS_PIN, HIGH);
}

// init MAX30003
void MAX30003::MAX30003_begin()
{
    MAX30003_Reg_Write(SW_RST, 0x000000);
    delay(100);
    MAX30003_Reg_Write(CNFG_GEN, 0x081007);
    delay(100);
    MAX30003_Reg_Write(CNFG_CAL, 0x720000); // 0x700000
    delay(100);
    MAX30003_Reg_Write(CNFG_EMUX, 0x0B0000);
    delay(100);
    MAX30003_Reg_Write(CNFG_ECG,
                       0x805000); // d23 - d22 : 10 for 250sps , 00:500 sps
    delay(100);

    MAX30003_Reg_Write(CNFG_RTOR1, 0x3fc600);
    MAX30003_Reg_Write(SYNCH, 0x000000);
    delay(100);
}
