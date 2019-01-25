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
 
 
#include "MAX30003.h"
 
 
//****************************************************************************
MAX30003::MAX30003(SPI &spiBus, PinName cs):
m_spiBus(spiBus), m_cs(cs, 1)
{
    //empty block
}

//****************************************************************************
MAX30003::~MAX30003()
{
    //empty block
}

//****************************************************************************
uint32_t MAX30003::readRegister(const Registers_e reg)
{
    uint32_t data = 0;
    
    m_cs = 0;
    m_spiBus.write((reg << 1) | 1);
    data |= (m_spiBus.write(0xFF) << 16);
    data |= (m_spiBus.write(0xFF) << 8);
    data |= m_spiBus.write(0xFF);
    m_cs = 1;
    
    return data;
}

//****************************************************************************    
void MAX30003::writeRegister(const Registers_e reg, const uint32_t data)
{
    m_cs = 0;
    m_spiBus.write(reg << 1);
    m_spiBus.write((0x00FF0000 & data) >> 16);
    m_spiBus.write((0x0000FF00 & data) >> 8);
    m_spiBus.write( 0x000000FF & data);
    m_cs = 1;
}
 