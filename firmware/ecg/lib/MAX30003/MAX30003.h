/*******************************************************************************
 *    @brief    MAX30003 header
 *
 ********************************************************************************/
#ifndef _MAX30003_H_
#define _MAX30003_H_

/*******************************************************************************
 * Includes
 ********************************************************************************/
#include <Arduino.h>
#include <SPI.h>

/*******************************************************************************
 * Definitions
 ********************************************************************************/
// chipselect pin on mcu
#define MAX30003_CS_PIN 7

// SPI registers mask
#define WREG 0x00
#define RREG 0x01

class max30003
{
public:
    /// MAX30003 Registers
    enum Registers_e
    {
        NO_OP = 0x00,
        STATUS = 0x01,
        EN_INT = 0x02,
        EN_INT2 = 0x03,
        MNGR_INT = 0x04,
        MNGR_DYN = 0x05,
        SW_RST = 0x08,
        SYNCH = 0x09,
        FIFO_RST = 0x0A,
        INFO = 0x0F,
        CNFG_GEN = 0x10,
        CNFG_ALL = 0x12,
        CNFG_EMUX = 0x14,
        CNFG_ECG = 0x15,
        CNFG_RTOR1 = 0x1D,
        CNFG_RTOR2 = 0x1E,
        ECG_FIFO_BURST = 0x20,
        ECG_FIFO = 0x21,
        RTOR = 0x25,
        NO_OP2 = 0x7F
    };

    /// Status register bits
    union Status_u {
        /// Access all bits
        uint32_t all;

        /// Access individual bits
        struct BitField_s
        {
            uint32_t loff_nl : 1;
            uint32_t loff_nh : 1;
            uint32_t loff_pl : 1;
            uint32_t loff_ph : 1;
            uint32_t reserved1 : 4;
            uint32_t pllint : 1;
            uint32_t samp : 1;
            uint32_t rrint : 1;
            uint32_t lonint : 1;
            uint32_t reserved2 : 8;
            uint32_t dcloffint : 1;
            uint32_t fstint : 1;
            uint32_t eovf : 1;
            uint32_t eint : 1;
            uint32_t reserved3 : 8;
        } bits;
    };

    /// Enable Interrupt registers bits
    union EnableInterrupts_u {
        /// Access all bits
        uint32_t all;

        /// Access individual bits
        struct BitField_s
        {
            uint32_t intb_type : 2;
            uint32_t reserved1 : 6;
            uint32_t en_pllint : 1;
            uint32_t en_samp : 1;
            uint32_t en_rrint : 1;
            uint32_t en_loint : 1;
            uint32_t reserved2 : 8;
            uint32_t en_dcloffint : 1;
            uint32_t en_fstint : 1;
            uint32_t en_eovf : 1;
            uint32_t en_eint : 1;
            uint32_t reserved3 : 8;
        } bits;
    };

    /// Manage Interrupt register bits
    union ManageInterrupts_u {
        /// Access all bits
        uint32_t all;

        /// Access individual bits
        struct BitField_s
        {
            uint32_t samp_it : 4;
            uint32_t clr_samp : 1;
            uint32_t reserved1 : 1;
            uint32_t clr_rrint : 2;
            uint32_t clr_fast : 1;
            uint32_t reserved2 : 12;
            uint32_t efit : 5;
            uint32_t reserved3 : 8;
        } bits;
    };

    /// Manage Dynamic Modes register bits
    union ManageDynamicModes_u {
        /// Access all bits
        uint32_t all;

        /// Access individual bits
        struct BitField_s
        {
            uint32_t reserved1 : 16;
            uint32_t fast_th : 6;
            uint32_t fast : 2;
            uint32_t reserved2 : 8;
        } bits;
    };

    /// General Configuration bits
    union GeneralConfiguration_u {
        /// Access all bits
        uint32_t all;

        /// Access individual bits
        struct BitField_s
        {
            uint32_t rbiasn : 1;
            uint32_t rbiasp : 1;
            uint32_t rbiasv : 2;
            uint32_t en_rbias : 2;
            uint32_t vth : 2;
            uint32_t imag : 3;
            uint32_t ipol : 1;
            uint32_t en_dcloff : 2;
            uint32_t reserved1 : 5;
            uint32_t en_ecg : 1;
            uint32_t fmstr : 2;
            uint32_t en_ulp_lon : 2;
            uint32_t reserved2 : 8;
        } bits;
    };

    /// Cal Configuration bits
    union CalConfiguration_u {
        /// Access all bits
        uint32_t all;

        /// Access individual bits
        struct BitField_s
        {
            uint32_t thigh : 11;
            uint32_t fifty : 1;
            uint32_t fcal : 3;
            uint32_t reserved1 : 5;
            uint32_t vmag : 1;
            uint32_t vmode : 1;
            uint32_t en_vcal : 1;
            uint32_t reserved2 : 9;

        } bits;
    };

    /// Mux Configuration bits
    union MuxConfiguration_u {
        /// Access all bits
        uint32_t all;

        /// Access individual bits
        struct BitField_s
        {
            uint32_t reserved1 : 16;
            uint32_t caln_sel : 2;
            uint32_t calp_sel : 2;
            uint32_t openn : 1;
            uint32_t openp : 1;
            uint32_t reserved2 : 1;
            uint32_t pol : 1;
            uint32_t reserved3 : 8;
        } bits;
    };

    /// ECG Configuration bits
    union ECGConfiguration_u {
        /// Access all bits
        uint32_t all;

        /// Access individual bits
        struct BitField_s
        {
            uint32_t reserved1 : 12;
            uint32_t dlpf : 2;
            uint32_t dhpf : 1;
            uint32_t reserved2 : 1;
            uint32_t gain : 2;
            uint32_t reserved3 : 4;
            uint32_t rate : 2;
            uint32_t reserved4 : 8;
        } bits;
    };

    /// RtoR1 Configuration bits
    union RtoR1Configuration_u {
        /// Access all bits
        uint32_t all;

        /// Access individual bits
        struct BitField_s
        {
            uint32_t reserved1 : 8;
            uint32_t ptsf : 4;
            uint32_t pavg : 2;
            uint32_t reserved2 : 1;
            uint32_t en_rtor : 1;
            uint32_t rgain : 4;
            uint32_t wndw : 4;
            uint32_t reserved3 : 8;
        } bits;
    };

    /// RtoR2 Configuration bits
    union RtoR2Configuration_u {
        /// Access all bits
        uint32_t all;

        /// Access individual bits
        struct BitField_s
        {
            uint32_t reserved1 : 8;
            uint32_t rhsf : 3;
            uint32_t reserved2 : 1;
            uint32_t ravg : 2;
            uint32_t reserved3 : 2;
            uint32_t hoff : 6;
            uint32_t reserved4 : 10;
        } bits;
    };

    // constructor
    max30003();

    // public functions
    void max30003_init();
    uint32_t max30003_read_register(uint8_t reg_address);
    void max30003_write_register(uint8_t reg_address, uint32_t data);
};

#endif /*_MAX30003_H_*/
