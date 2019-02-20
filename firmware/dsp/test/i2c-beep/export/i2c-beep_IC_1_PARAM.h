/*
 * File:           C:\Users\NBT\Desktop\araBeat\firmware\dsp\test\i2c-beep\export\i2c-beep_IC_1_PARAM.h
 *
 * Created:        Wednesday, February 20, 2019 5:09:55 PM
 * Description:    i2c-beep:IC 1 parameter RAM definitions.
 *
 * This software is distributed in the hope that it will be useful,
 * but is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
 * CONDITIONS OF ANY KIND, without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * This software may only be used to program products purchased from
 * Analog Devices for incorporation by you into audio products that
 * are intended for resale to audio product end users. This software
 * may not be distributed whole or in any part to third parties.
 *
 * Copyright ©2019 Analog Devices, Inc. All rights reserved.
 */
#ifndef __I2C_BEEP_IC_1_PARAM_H__
#define __I2C_BEEP_IC_1_PARAM_H__


/* Module Tone1 - Sine Tone*/
#define MOD_TONE1_COUNT                                3
#define MOD_TONE1_DEVICE                               "IC1"
#define MOD_STATIC_TONE1_ALG0_MASK_ADDR                0
#define MOD_STATIC_TONE1_ALG0_MASK_FIXPT               0x000000FF
#define MOD_STATIC_TONE1_ALG0_MASK_VALUE               SIGMASTUDIOTYPE_INTEGER_CONVERT(255)
#define MOD_STATIC_TONE1_ALG0_MASK_TYPE                SIGMASTUDIOTYPE_INTEGER
#define MOD_TONE1_ALG0_INCREMENT_ADDR                  1
#define MOD_TONE1_ALG0_INCREMENT_FIXPT                 0x000258BF
#define MOD_TONE1_ALG0_INCREMENT_VALUE                 SIGMASTUDIOTYPE_FIXPOINT_CONVERT(0.0183333333333333)
#define MOD_TONE1_ALG0_INCREMENT_TYPE                  SIGMASTUDIOTYPE_FIXPOINT
#define MOD_TONE1_ALG0_ON_ADDR                         2
#define MOD_TONE1_ALG0_ON_FIXPT                        0x00800000
#define MOD_TONE1_ALG0_ON_VALUE                        SIGMASTUDIOTYPE_FIXPOINT_CONVERT(1)
#define MOD_TONE1_ALG0_ON_TYPE                         SIGMASTUDIOTYPE_FIXPOINT

#endif
