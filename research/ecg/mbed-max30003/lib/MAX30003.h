/*******************************************************************************
 * Copyright (C) 2017 Maxim Integrated Products, Inc., All Rights Reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL MAXIM INTEGRATED BE LIABLE FOR ANY CLAIM, DAMAGES
 * OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 *
 * Except as contained in this notice, the name of Maxim Integrated
 * Products, Inc. shall not be used except as stated in the Maxim Integrated
 * Products, Inc. Branding Policy.
 *
 * The mere transfer of this software does not imply any licenses
 * of trade secrets, proprietary technology, copyrights, patents,
 * trademarks, maskwork rights, or any other form of intellectual
 * property whatsoever. Maxim Integrated Products, Inc. retains all
 * ownership rights.
 *******************************************************************************
 */
 
 
#ifndef _MAX30003_H_
#define _MAX30003_H_


#include "mbed.h"
 
 
/** 
* @brief Library for MAX30003\n
* The MAX30003 is a complete, biopotential, analog frontend solution for 
* wearable applications. It offers high performance for clinical and fitness 
* applications, with ultra-low power for long battery life. The MAX30003 is a 
* single biopotential channel providing ECG waveforms and heart rate detection.
*
* @code
* #include "mbed.h"
* #include "max32630fthr.h"
* #include "MAX30003.h"
* 
* MAX32630FTHR pegasus(MAX32630FTHR::VIO_3V3);
*
* int main(void) 
* {
*     DigitalOut rLed(LED1, 1);
*     DigitalOut gLed(LED2, 1);
*
*     Serial pc(USBTX, USBRX);
*     pc.baud(115200);
*
*     SPI spiBus(SPI2_MOSI, SPI2_MISO, SPI2_SCK);
*     MAX30003 ecgAfe(spiBus, P5_3);
*
*     while(1)
*     {
*         gLed = !gLed;
*         wait(0.1);
*     }
* }
* @endcode
*/
class MAX30003
{
public:

    ///MAX30003 Registers
    enum Registers_e
    {
        NO_OP          = 0x00,
        STATUS         = 0x01,
        EN_INT         = 0x02,
        EN_INT2        = 0x03,
        MNGR_INT       = 0x04,
        MNGR_DYN       = 0x05,
        SW_RST         = 0x08,
        SYNCH          = 0x09,
        FIFO_RST       = 0x0A,
        INFO           = 0x0F,
        CNFG_GEN       = 0x10,
        CNFG_ALL       = 0x12,
        CNFG_EMUX      = 0x14,
        CNFG_ECG       = 0x15,
        CNFG_RTOR1     = 0x1D,
        CNFG_RTOR2     = 0x1E,
        ECG_FIFO_BURST = 0x20,
        ECG_FIFO       = 0x21,
        RTOR           = 0x25,
        NO_OP2         = 0x7F
    };
    
    ///Status register bits
    union Status_u
    {
        ///Access all bits
        uint32_t all;
        
        ///Access individual bits
        struct BitField_s
        {
            uint32_t loff_nl    : 1;
            uint32_t loff_nh    : 1;
            uint32_t loff_pl    : 1;
            uint32_t loff_ph    : 1;
            uint32_t reserved1  : 4;
            uint32_t pllint     : 1;
            uint32_t samp       : 1;
            uint32_t rrint      : 1;
            uint32_t lonint     : 1;
            uint32_t reserved2  : 8;
            uint32_t dcloffint : 1;
            uint32_t fstint     : 1;
            uint32_t eovf       : 1;
            uint32_t eint       : 1;
            uint32_t reserved3  : 8;
        }bits;
    };
    
    ///Enable Interrupt registers bits
    union EnableInterrupts_u
    {
        ///Access all bits
        uint32_t all;
        
        ///Access individual bits
        struct BitField_s
        {
            uint32_t intb_type    : 2;
            uint32_t reserved1    : 6;
            uint32_t en_pllint    : 1;
            uint32_t en_samp      : 1;
            uint32_t en_rrint     : 1;
            uint32_t en_loint     : 1;
            uint32_t reserved2    : 8;
            uint32_t en_dcloffint : 1;
            uint32_t en_fstint    : 1;
            uint32_t en_eovf      : 1;
            uint32_t en_eint      : 1;
            uint32_t reserved3    : 8;
        }bits;
    };
    
    ///Manage Interrupt register bits
    union ManageInterrupts_u
    {
        ///Access all bits
        uint32_t all;
        
        ///Access individual bits
        struct BitField_s
        {
            uint32_t samp_it   : 4;
            uint32_t clr_samp  : 1;
            uint32_t reserved1 : 1;
            uint32_t clr_rrint : 2;
            uint32_t clr_fast  : 1;
            uint32_t reserved2 : 12;
            uint32_t efit      : 5;
            uint32_t reserved3 : 8;
        }bits;
    };
    
    ///Manage Dynamic Modes register bits
    union ManageDynamicModes_u
    {
        ///Access all bits
        uint32_t all;
        
        ///Access individual bits
        struct BitField_s
        {
            uint32_t reserved1 : 16;
            uint32_t fast_th   : 6;
            uint32_t fast      : 2;
            uint32_t reserved2 : 8;
        }bits;
    };
    
    ///General Configuration bits
    union GeneralConfiguration_u
    {
        ///Access all bits
        uint32_t all;
        
        ///Access individual bits
        struct BitField_s
        {
            uint32_t rbiasn     : 1;
            uint32_t rbiasp     : 1;
            uint32_t rbiasv     : 2;
            uint32_t en_rbias   : 2;
            uint32_t vth        : 2;
            uint32_t imag       : 3;
            uint32_t ipol       : 1;
            uint32_t en_dcloff  : 2;
            uint32_t reserved1  : 5;
            uint32_t en_ecg     : 1;
            uint32_t fmstr      : 2;
            uint32_t en_ulp_lon : 2;
            uint32_t reserved2  : 8;
        }bits;
    };
    
    ///Cal Configuration bits
    union CalConfiguration_u
    {
        ///Access all bits
        uint32_t all;
        
        ///Access individual bits
        struct BitField_s
        {
            uint32_t thigh     : 11;
            uint32_t fifty     : 1;
            uint32_t fcal      : 3;
            uint32_t reserved1 : 5;
            uint32_t vmag      : 1;
            uint32_t vmode     : 1;
            uint32_t en_vcal   : 1;
            uint32_t reserved2 : 9;
            
        }bits;
    };
    
    ///Mux Configuration bits
    union MuxConfiguration_u
    {
        ///Access all bits
        uint32_t all;
        
        ///Access individual bits
        struct BitField_s
        {
            uint32_t reserved1 : 16;
            uint32_t caln_sel  : 2;
            uint32_t calp_sel  : 2;
            uint32_t openn     : 1;
            uint32_t openp     : 1;
            uint32_t reserved2 : 1;
            uint32_t pol       : 1;
            uint32_t reserved3 : 8;
        }bits;
    };
    
    ///ECG Configuration bits
    union ECGConfiguration_u
    {
        ///Access all bits
        uint32_t all;
        
        ///Access individual bits
        struct BitField_s
        {
            uint32_t reserved1 : 12;
            uint32_t dlpf      : 2;
            uint32_t dhpf      : 1;
            uint32_t reserved2 : 1;
            uint32_t gain      : 2;
            uint32_t reserved3 : 4;
            uint32_t rate      : 2;
            uint32_t reserved4 : 8;
        }bits;
    };
    
    ///RtoR1 Configuration bits
    union RtoR1Configuration_u
    {
        ///Access all bits
        uint32_t all;
        
        ///Access individual bits
        struct BitField_s
        {
            uint32_t reserved1 : 8;
            uint32_t ptsf      : 4;
            uint32_t pavg      : 2;
            uint32_t reserved2 : 1;
            uint32_t en_rtor   : 1;
            uint32_t rgain     : 4;
            uint32_t wndw      : 4;
            uint32_t reserved3 : 8;
        }bits;
    };
    
    ///RtoR2 Configuration bits
    union RtoR2Configuration_u
    {
        ///Access all bits
        uint32_t all;
        
        ///Access individual bits
        struct BitField_s
        {
            uint32_t reserved1 : 8;
            uint32_t rhsf      : 3;
            uint32_t reserved2 : 1;
            uint32_t ravg      : 2;
            uint32_t reserved3 : 2;
            uint32_t hoff      : 6;
            uint32_t reserved4 : 10;
        }bits;
    };
    
    ///@brief MAX30003 Constructor
    ///@param spiBus - Reference to spi interface
    ///@param cs - Pin used for chip select
    MAX30003(SPI &spiBus, PinName cs);
    
    ///@brief MAX30003 Destructor
    ~MAX30003();

    ///@brief Read given register.\n
    ///
    ///On Entry:
    ///@param[in] reg - Register to read
    ///
    ///On Exit:
    ///
    ///@returns Read data
    uint32_t readRegister(const Registers_e reg);
    
    ///@brief Write given register.\n
    ///
    ///On Entry:
    ///@param[in] reg - Register to write
    ///@param[in] data - Data to write 
    ///
    ///@returns None
    void writeRegister(const Registers_e reg, const uint32_t data);

private:

    SPI &m_spiBus;
    DigitalOut m_cs;
};
 
#endif /* _MAX30003_H_ */
 