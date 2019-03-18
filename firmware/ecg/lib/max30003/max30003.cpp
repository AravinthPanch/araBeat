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

    // select the register to write
    SPI.transfer((reg_address << 1) | WREG);

    // write 24 bits (3 bytes) of data
    SPI.transfer(data >> 16);
    SPI.transfer(data >> 8);
    SPI.transfer(data);

    // chip deselect
    digitalWrite(MAX30003_CS_PIN, HIGH);
}

// read SPI registers of max30003
uint32_t max30003::max30003_read_register(uint8_t reg_address)
{
    uint32_t data = 0;
    uint32_t data0 = 0;
    uint32_t data1 = 0;
    uint32_t data2 = 0;

    // chip select
    digitalWrite(MAX30003_CS_PIN, LOW);

    // select the register to read
    SPI.transfer((reg_address << 1) | RREG);

    // read 24 bits (3 bytes) of data from max30003 register
    data0 = SPI.transfer(0xff);
    data1 = SPI.transfer(0xff);
    data2 = SPI.transfer(0xff);
    data = (data0 << 16 | data1 << 8 | data2);

    // chip deselect
    digitalWrite(MAX30003_CS_PIN, HIGH);

    return data;
}

// initialize max30003 chip
void max30003::max30003_init()
{
    // Reset ECG to clear registers
    max30003_write_register(max30003::SW_RST, 0x000000);
    delay(100);

    // General config register setting
    max30003::GeneralConfiguration_u CNFG_GEN_r;
    CNFG_GEN_r.bits.en_ecg = 1;       // Enable ECG channel
    CNFG_GEN_r.bits.en_rbias = 1;     // Enable resistive bias
    CNFG_GEN_r.bits.rbiasv = 0b00;    // Resistive Bias Mode
    CNFG_GEN_r.bits.rbiasn = 1;       // Enable resistive bias on negative input
    CNFG_GEN_r.bits.rbiasp = 1;       // Enable resistive bias on positive input
    CNFG_GEN_r.bits.imag = 0b000;     // Current magnitude
    CNFG_GEN_r.bits.en_dcloff = 0b00; // Enable DC lead-off detection
    CNFG_GEN_r.bits.vth = 0b11;       // Lead-Off Voltage Threshold
    max30003_write_register(max30003::CNFG_GEN, CNFG_GEN_r.all);
    // max30003_write_register(max30003::CNFG_GEN, 0x081007);
    delay(100);

    // Calibration config register setting
    max30003::CalConfiguration_u CNFG_CAL_r;
    CNFG_CAL_r.bits.en_vcal = 1; // Calibration Source (VCALP and VCALN) Enable
    CNFG_CAL_r.bits.vmode = 1;   // Calibration Source Mode Selection = Bipolar
    CNFG_CAL_r.bits.vmag = 1; // Calibration Source Magnitude Selection (VMAG) = 0.50mV
    max30003_write_register(max30003::CNFG_CAL, CNFG_CAL_r.all);
    // max30003_write_register(max30003::CNFG_CAL, 0x720000);
    delay(100);

    // MUX config register setting
    max30003::MuxConfiguration_u CNFG_EMUX_r;
    CNFG_EMUX_r.bits.caln_sel = 3; // Input is connected to VCALN
    CNFG_EMUX_r.bits.calp_sel = 2; // Input is connected to VCALP
    max30003_write_register(max30003::CNFG_EMUX, CNFG_EMUX_r.all);
    // max30003_write_register(max30003::CNFG_EMUX, 0x0B0000);
    delay(100);

    // ECG Config register setting
    max30003::ECGConfiguration_u CNFG_ECG_r;
    CNFG_ECG_r.bits.dlpf = 0b10; // Digital LPF cutoff
    CNFG_ECG_r.bits.dhpf = 1;    // Digital HPF cutoff
    CNFG_ECG_r.bits.gain = 0b01; // ECG gain
    CNFG_ECG_r.bits.rate = 2;    // Sample rate = 128 sps for fMSTR = 32768Hz
    max30003_write_register(max30003::CNFG_ECG, CNFG_ECG_r.all);
    // max30003_write_register(max30003::CNFG_ECG, 0x805000);
    delay(100);

    // R-to-R configuration
    max30003::RtoR1Configuration_u CNFG_RTOR_r;
    CNFG_RTOR_r.bits.wndw = 0b0011;  // WNDW = 96ms
    CNFG_RTOR_r.bits.rgain = 0b1111; // Auto-scale gain
    CNFG_RTOR_r.bits.pavg = 0b11;    // 16-average
    CNFG_RTOR_r.bits.ptsf = 0b0011;  // PTSF = 4/16
    CNFG_RTOR_r.bits.en_rtor = 1;    // Enable R-to-R detection
    max30003_write_register(max30003::CNFG_RTOR1, CNFG_RTOR_r.all);
    // max30003_write_register(max30003::CNFG_RTOR1, 0x3fc600);
    delay(100);

    // Enable interrupts register setting
    max30003::EnableInterrupts_u EN_INT_r;
    EN_INT_r.all = 0;
    EN_INT_r.bits.en_eint = 1;      // Enable EINT interrupt
    EN_INT_r.bits.en_rrint = 1;     // Enable R-to-R interrupt
    EN_INT_r.bits.intb_type = 1;    // CMOS Driver
    EN_INT_r.bits.en_dcloffint = 0; // Enable DC Lead-Off Detection Interrupt
    max30003_write_register(max30003::EN_INT, EN_INT_r.all);

    // Manage interrupts register setting
    max30003::ManageInterrupts_u MNG_INT_r;
    MNG_INT_r.bits.efit = 0b00011;   // Assert EINT w/ 4 unread samples
    MNG_INT_r.bits.clr_rrint = 0b01; // Clear R-to-R on RTOR reg. read back
    max30003_write_register(max30003::MNGR_INT, MNG_INT_r.all);

    // Dyanmic modes config
    max30003::ManageDynamicModes_u MNG_DYN_r;
    MNG_DYN_r.bits.fast = 0; // Fast recovery mode disabled
    max30003_write_register(max30003::MNGR_DYN, MNG_DYN_r.all);

    // Synchronize to begin new ecg recording
    max30003_write_register(max30003::SYNCH, 0x000000);
    delay(100);
}
