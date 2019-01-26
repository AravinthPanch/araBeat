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
    // Reset ECG to clear registers
    max30003_write_register(max30003::SW_RST, 0);
    delay(100);

    // General config register setting
    max30003::GeneralConfiguration_u CNFG_GEN_r;
    CNFG_GEN_r.bits.en_ecg = 1;    // Enable ECG channel
    CNFG_GEN_r.bits.rbiasn = 1;    // Enable resistive bias on negative input
    CNFG_GEN_r.bits.rbiasp = 1;    // Enable resistive bias on positive input
    CNFG_GEN_r.bits.en_rbias = 1;  // Enable resistive bias
    CNFG_GEN_r.bits.imag = 5;      // Current magnitude = 100nA
    CNFG_GEN_r.bits.en_dcloff = 1; // Enable DC lead-off detection
    // CNFG_GEN_r.bits.vth = 3;    // DC Lead-Off Voltage Threshold Selection VMID ± 500mV
    max30003_write_register(max30003::CNFG_GEN, CNFG_GEN_r.all);
    delay(100);
    // Serial.println("CNFG_GEN_r");
    // Serial.println(CNFG_GEN_r.all, BIN);
    // Serial.println(CNFG_GEN_r.all, HEX);

    // Calibration config register setting
    max30003::CalConfiguration_u CNFG_CAL_r;
    CNFG_CAL_r.bits.en_vcal = 1; // Calibration Source (VCALP and VCALN) Enable
    CNFG_CAL_r.bits.vmode = 1;   // Calibration Source Mode Selection = Bipolar
    CNFG_CAL_r.bits.vmag = 1; // Calibration Source Magnitude Selection (VMAG) = 0.50mV
    max30003_write_register(max30003::CNFG_CAL, CNFG_CAL_r.all);
    delay(100);
    // Serial.println("CNFG_CAL_r");
    // Serial.println(CNFG_CAL_r.all, BIN);
    // Serial.println(CNFG_CAL_r.all, HEX);

    // MUX config register setting
    max30003::MuxConfiguration_u CNFG_EMUX_r;
    CNFG_EMUX_r.bits.caln_sel = 3; // Input is connected to VCALN
    CNFG_EMUX_r.bits.calp_sel = 2; // Input is connected to VCALP
    max30003_write_register(max30003::CNFG_EMUX, CNFG_EMUX_r.all);
    delay(100);
    // Serial.println("CNFG_EMUX_r");
    // Serial.println(CNFG_EMUX_r.all, BIN);
    // Serial.println(CNFG_EMUX_r.all, HEX);

    // ECG Config register setting
    max30003::ECGConfiguration_u CNFG_ECG_r;
    CNFG_ECG_r.bits.dlpf = 1; // Digital LPF cutoff = 40Hz
    CNFG_ECG_r.bits.dhpf = 1; // Digital HPF cutoff = 0.5Hz
    CNFG_ECG_r.bits.gain = 2; // ECG gain = 80V/V
    CNFG_ECG_r.bits.rate = 2; // Sample rate = 128 sps for fMSTR = 32768Hz
    max30003_write_register(max30003::CNFG_ECG, CNFG_ECG_r.all);
    delay(100);
    // Serial.println("CNFG_ECG_r");
    // Serial.println(CNFG_ECG_r.all, BIN);
    // Serial.println(CNFG_ECG_r.all, HEX);

    // R-to-R configuration
    max30003::RtoR1Configuration_u CNFG_RTOR_r;
    CNFG_RTOR_r.bits.wndw = 0b0011;  // WNDW = 96ms
    CNFG_RTOR_r.bits.rgain = 0b1111; // Auto-scale gain
    CNFG_RTOR_r.bits.pavg = 0b11;    // 16-average
    CNFG_RTOR_r.bits.ptsf = 0b0011;  // PTSF = 4/16
    CNFG_RTOR_r.bits.en_rtor = 1;    // Enable R-to-R detection
    max30003_write_register(max30003::CNFG_RTOR1, CNFG_RTOR_r.all);
    delay(100);
    // Serial.println("CNFG_RTOR_r");
    // Serial.println(CNFG_RTOR_r.all, BIN);
    // Serial.println(CNFG_RTOR_r.all, HEX);

    // Synchronize to begin new ecg recording
    max30003_write_register(max30003::SYNCH, 0);
    delay(100);
}
