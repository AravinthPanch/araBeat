EESchema Schematic File Version 4
LIBS:araBase-atmega2560-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "araBase-atmega2560"
Date "2018-07-31"
Rev "v0.1"
Comp "www.aravinth.info"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 "Baseboard for Atmega2560"
$EndDescr
$Comp
L MCU_Microchip_ATmega:ATmega2560-16AU U1
U 1 1 5B609FCF
P 3950 4100
F 0 "U1" H 4550 1300 50  0000 C CNN
F 1 "ATmega2560-16AU" H 3450 1250 50  0000 C CNN
F 2 "Package_QFP:TQFP-100_14x14mm_P0.5mm" H 3950 4100 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-2549-8-bit-AVR-Microcontroller-ATmega640-1280-1281-2560-2561_datasheet.pdf" H 3950 4100 50  0001 C CNN
	1    3950 4100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 5B60EEBB
P 3650 1050
F 0 "#PWR05" H 3650 900 50  0001 C CNN
F 1 "+5V" H 3665 1223 50  0000 C CNN
F 2 "" H 3650 1050 50  0001 C CNN
F 3 "" H 3650 1050 50  0001 C CNN
	1    3650 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 1200 3950 1150
Wire Wire Line
	3950 1150 3650 1150
Wire Wire Line
	3650 1150 3650 1050
Wire Wire Line
	3950 1150 4050 1150
Wire Wire Line
	4050 1150 4050 1200
Connection ~ 3950 1150
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5B60F092
P 3350 1050
F 0 "#FLG01" H 3350 1125 50  0001 C CNN
F 1 "PWR_FLAG" H 3350 1224 50  0000 C CNN
F 2 "" H 3350 1050 50  0001 C CNN
F 3 "~" H 3350 1050 50  0001 C CNN
	1    3350 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 1050 3350 1150
Wire Wire Line
	3350 1150 3650 1150
Connection ~ 3650 1150
$Comp
L power:GND #PWR06
U 1 1 5B60F283
P 3950 7200
F 0 "#PWR06" H 3950 6950 50  0001 C CNN
F 1 "GND" H 3955 7027 50  0000 C CNN
F 2 "" H 3950 7200 50  0001 C CNN
F 3 "" H 3950 7200 50  0001 C CNN
	1    3950 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 7200 3950 7150
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5B60F2EC
P 4300 7200
F 0 "#FLG02" H 4300 7275 50  0001 C CNN
F 1 "PWR_FLAG" H 4300 7373 50  0000 C CNN
F 2 "" H 4300 7200 50  0001 C CNN
F 3 "~" H 4300 7200 50  0001 C CNN
	1    4300 7200
	-1   0    0    1   
$EndComp
Wire Wire Line
	4300 7200 4300 7150
Wire Wire Line
	4300 7150 3950 7150
Connection ~ 3950 7150
Wire Wire Line
	3950 7150 3950 7000
Text Label 3150 5400 2    50   ~ 0
D6
Text Label 3150 5500 2    50   ~ 0
D7
Text Label 3150 6500 2    50   ~ 0
D4
Text Label 2650 2100 2    50   ~ 0
AREF
Wire Wire Line
	2650 2100 2900 2100
$Comp
L Device:C C1
U 1 1 5B60F821
P 2900 2250
F 0 "C1" H 3015 2296 50  0000 L CNN
F 1 "0.1uF" H 3015 2205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2938 2100 50  0001 C CNN
F 3 "~" H 2900 2250 50  0001 C CNN
	1    2900 2250
	1    0    0    -1  
$EndComp
Connection ~ 2900 2100
Wire Wire Line
	2900 2100 3150 2100
$Comp
L power:GND #PWR04
U 1 1 5B60F910
P 2900 2550
F 0 "#PWR04" H 2900 2300 50  0001 C CNN
F 1 "GND" H 2905 2377 50  0000 C CNN
F 2 "" H 2900 2550 50  0001 C CNN
F 3 "" H 2900 2550 50  0001 C CNN
	1    2900 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 2550 2900 2400
Text Label 4750 2500 0    50   ~ 0
SCK
Text Label 4750 2600 0    50   ~ 0
MOSI
Text Label 4750 2700 0    50   ~ 0
MISO
Text Label 4750 4200 0    50   ~ 0
SCL
Text Label 4750 4300 0    50   ~ 0
SDA
Text Label 4750 5100 0    50   ~ 0
RX0
Text Label 4750 5200 0    50   ~ 0
TX0
Text Label 4750 5400 0    50   ~ 0
D5
Text Label 4750 5500 0    50   ~ 0
D2
Text Label 4750 5600 0    50   ~ 0
D3
Text Label 4750 6000 0    50   ~ 0
A0
Text Label 4750 6100 0    50   ~ 0
A1
Text Label 4750 6200 0    50   ~ 0
A2
Text Label 4750 6300 0    50   ~ 0
A3
Text Label 4750 6400 0    50   ~ 0
A4
Text Label 4750 6500 0    50   ~ 0
A5
NoConn ~ 4750 1500
NoConn ~ 4750 1600
NoConn ~ 4750 1700
NoConn ~ 4750 1800
NoConn ~ 4750 1900
NoConn ~ 4750 2000
NoConn ~ 4750 2100
NoConn ~ 4750 2200
NoConn ~ 3150 2400
NoConn ~ 3150 2500
NoConn ~ 3150 2600
NoConn ~ 3150 2700
NoConn ~ 3150 2800
NoConn ~ 3150 2900
NoConn ~ 3150 3000
NoConn ~ 3150 3100
NoConn ~ 4750 3100
NoConn ~ 4750 3000
NoConn ~ 4750 2900
NoConn ~ 4750 2800
NoConn ~ 4750 2400
NoConn ~ 3150 3300
NoConn ~ 3150 3400
NoConn ~ 3150 3500
NoConn ~ 3150 3600
NoConn ~ 3150 3700
NoConn ~ 3150 3800
NoConn ~ 3150 3900
NoConn ~ 3150 4000
NoConn ~ 4750 3300
NoConn ~ 4750 3400
NoConn ~ 4750 3500
NoConn ~ 4750 3600
NoConn ~ 4750 3700
NoConn ~ 4750 3800
NoConn ~ 4750 3900
NoConn ~ 4750 4000
NoConn ~ 3150 4200
NoConn ~ 3150 4300
NoConn ~ 3150 4400
NoConn ~ 3150 4500
NoConn ~ 3150 4600
NoConn ~ 3150 4700
NoConn ~ 3150 4800
NoConn ~ 3150 4900
NoConn ~ 4750 4900
NoConn ~ 4750 4800
NoConn ~ 4750 4700
NoConn ~ 4750 4600
NoConn ~ 4750 4500
NoConn ~ 4750 4400
NoConn ~ 3150 5100
NoConn ~ 4750 5300
NoConn ~ 4750 5700
NoConn ~ 4750 5800
NoConn ~ 3150 5600
NoConn ~ 3150 5700
NoConn ~ 3150 5800
NoConn ~ 3150 6000
NoConn ~ 3150 6100
NoConn ~ 3150 6200
NoConn ~ 3150 6300
NoConn ~ 3150 6400
NoConn ~ 4750 6600
NoConn ~ 4750 6700
$Comp
L Connector_Generic:Conn_02x12_Top_Bottom J1
U 1 1 5B613794
P 7700 2000
F 0 "J1" H 7750 2717 50  0000 C CNN
F 1 "Conn_02x12_Top_Bottom" H 7750 2626 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x12_P2.54mm_Vertical" H 7700 2000 50  0001 C CNN
F 3 "~" H 7700 2000 50  0001 C CNN
	1    7700 2000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 5B613819
P 7000 1500
F 0 "#PWR07" H 7000 1350 50  0001 C CNN
F 1 "+5V" V 7015 1628 50  0000 L CNN
F 2 "" H 7000 1500 50  0001 C CNN
F 3 "" H 7000 1500 50  0001 C CNN
	1    7000 1500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7000 1500 7500 1500
$Comp
L power:GND #PWR08
U 1 1 5B61392C
P 7150 1600
F 0 "#PWR08" H 7150 1350 50  0001 C CNN
F 1 "GND" V 7155 1472 50  0000 R CNN
F 2 "" H 7150 1600 50  0001 C CNN
F 3 "" H 7150 1600 50  0001 C CNN
	1    7150 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	7150 1600 7500 1600
Text Label 7500 1800 2    50   ~ 0
RESET
Text Label 7500 1900 2    50   ~ 0
SCK
Text Label 7500 2000 2    50   ~ 0
MISO
Text Label 7500 2100 2    50   ~ 0
MOSI
Text Label 7500 2200 2    50   ~ 0
TX0
Text Label 7500 2300 2    50   ~ 0
RX0
Text Label 7500 2400 2    50   ~ 0
SDA
Text Label 7500 2500 2    50   ~ 0
SCL
Text Label 7500 2600 2    50   ~ 0
AREF
Text Label 8000 1500 0    50   ~ 0
A0
Text Label 8000 1600 0    50   ~ 0
A1
Text Label 8000 1700 0    50   ~ 0
A2
Text Label 8000 1800 0    50   ~ 0
A3
Text Label 8000 1900 0    50   ~ 0
A4
Text Label 8000 2000 0    50   ~ 0
A5
Text Label 8000 2100 0    50   ~ 0
D2
Text Label 8000 2200 0    50   ~ 0
D3
Text Label 8000 2300 0    50   ~ 0
D4
Text Label 8000 2400 0    50   ~ 0
D5
Text Label 8000 2500 0    50   ~ 0
D6
Text Label 8000 2600 0    50   ~ 0
D7
$Comp
L Device:C C2
U 1 1 5B614038
P 9550 1550
F 0 "C2" H 9665 1596 50  0000 L CNN
F 1 "0.1uF" H 9665 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 9588 1400 50  0001 C CNN
F 3 "~" H 9550 1550 50  0001 C CNN
	1    9550 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5B61413F
P 10150 1550
F 0 "C3" H 10265 1596 50  0000 L CNN
F 1 "0.1uF" H 10265 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 10188 1400 50  0001 C CNN
F 3 "~" H 10150 1550 50  0001 C CNN
	1    10150 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5B614166
P 10650 1550
F 0 "C5" H 10765 1596 50  0000 L CNN
F 1 "0.1uF" H 10765 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 10688 1400 50  0001 C CNN
F 3 "~" H 10650 1550 50  0001 C CNN
	1    10650 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 1400 9550 1200
Wire Wire Line
	9550 1200 10150 1200
Wire Wire Line
	10150 1200 10150 1400
Wire Wire Line
	10650 1400 10650 1200
Wire Wire Line
	10650 1200 10150 1200
Connection ~ 10150 1200
$Comp
L power:+5V #PWR011
U 1 1 5B6144A9
P 10150 900
F 0 "#PWR011" H 10150 750 50  0001 C CNN
F 1 "+5V" H 10165 1073 50  0000 C CNN
F 2 "" H 10150 900 50  0001 C CNN
F 3 "" H 10150 900 50  0001 C CNN
	1    10150 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 900  10150 1200
Wire Wire Line
	9550 1700 9550 1900
Wire Wire Line
	9550 1900 10150 1900
Wire Wire Line
	10150 1900 10150 1700
Wire Wire Line
	10150 1900 10650 1900
Wire Wire Line
	10650 1900 10650 1700
Connection ~ 10150 1900
$Comp
L power:GND #PWR012
U 1 1 5B614B28
P 10150 2150
F 0 "#PWR012" H 10150 1900 50  0001 C CNN
F 1 "GND" H 10155 1977 50  0000 C CNN
F 2 "" H 10150 2150 50  0001 C CNN
F 3 "" H 10150 2150 50  0001 C CNN
	1    10150 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 2150 10150 1900
$Comp
L Device:R_US R2
U 1 1 5B6151B3
P 10000 3250
F 0 "R2" V 9795 3250 50  0000 C CNN
F 1 "10K" V 9886 3250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 10040 3240 50  0001 C CNN
F 3 "~" H 10000 3250 50  0001 C CNN
	1    10000 3250
	0    1    1    0   
$EndComp
Text Label 10700 3250 0    50   ~ 0
RESET
$Comp
L Device:C C4
U 1 1 5B6153C2
P 10400 3600
F 0 "C4" H 10515 3646 50  0000 L CNN
F 1 "22pF" H 10515 3555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 10438 3450 50  0001 C CNN
F 3 "~" H 10400 3600 50  0001 C CNN
	1    10400 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 3450 10400 3250
Wire Wire Line
	10400 3250 10150 3250
Wire Wire Line
	10400 3250 10700 3250
Connection ~ 10400 3250
$Comp
L power:+5V #PWR010
U 1 1 5B615ACD
P 9650 3250
F 0 "#PWR010" H 9650 3100 50  0001 C CNN
F 1 "+5V" V 9665 3378 50  0000 L CNN
F 2 "" H 9650 3250 50  0001 C CNN
F 3 "" H 9650 3250 50  0001 C CNN
	1    9650 3250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9650 3250 9700 3250
$Comp
L Device:D_Small D2
U 1 1 5B6161AF
P 10000 2850
F 0 "D2" H 10000 3055 50  0000 C CNN
F 1 "100V" H 10000 2964 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 10000 2850 50  0001 C CNN
F 3 "~" V 10000 2850 50  0001 C CNN
	1    10000 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 2850 9700 2850
Wire Wire Line
	9700 2850 9700 3250
Connection ~ 9700 3250
Wire Wire Line
	9700 3250 9850 3250
Wire Wire Line
	10100 2850 10400 2850
Wire Wire Line
	10400 2850 10400 3250
$Comp
L power:GND #PWR013
U 1 1 5B616BCA
P 10400 3950
F 0 "#PWR013" H 10400 3700 50  0001 C CNN
F 1 "GND" H 10405 3777 50  0000 C CNN
F 2 "" H 10400 3950 50  0001 C CNN
F 3 "" H 10400 3950 50  0001 C CNN
	1    10400 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 3950 10400 3750
$Comp
L power:GND #PWR02
U 1 1 5B618E7D
P 1750 2800
F 0 "#PWR02" H 1750 2550 50  0001 C CNN
F 1 "GND" V 1755 2672 50  0000 R CNN
F 2 "" H 1750 2800 50  0001 C CNN
F 3 "" H 1750 2800 50  0001 C CNN
	1    1750 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 5B61AC88
P 2500 5200
F 0 "D1" H 2491 5416 50  0000 C CNN
F 1 "LEDY" H 2491 5325 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2500 5200 50  0001 C CNN
F 3 "~" H 2500 5200 50  0001 C CNN
	1    2500 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R1
U 1 1 5B61AE67
P 2900 5200
F 0 "R1" V 2695 5200 50  0000 C CNN
F 1 "10K" V 2786 5200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 2940 5190 50  0001 C CNN
F 3 "~" H 2900 5200 50  0001 C CNN
	1    2900 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	3050 5200 3150 5200
Wire Wire Line
	2750 5200 2650 5200
$Comp
L power:GND #PWR03
U 1 1 5B61C496
P 2200 5200
F 0 "#PWR03" H 2200 4950 50  0001 C CNN
F 1 "GND" V 2205 5072 50  0000 R CNN
F 2 "" H 2200 5200 50  0001 C CNN
F 3 "" H 2200 5200 50  0001 C CNN
	1    2200 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	2200 5200 2350 5200
Wire Wire Line
	2550 1500 2750 1500
$Comp
L power:GND #PWR01
U 1 1 5B620AB3
P 2000 1500
F 0 "#PWR01" H 2000 1250 50  0001 C CNN
F 1 "GND" V 2005 1372 50  0000 R CNN
F 2 "" H 2000 1500 50  0001 C CNN
F 3 "" H 2000 1500 50  0001 C CNN
	1    2000 1500
	0    1    1    0   
$EndComp
NoConn ~ 3150 5300
$Comp
L Device:LED D3
U 1 1 5B626F87
P 10400 4700
F 0 "D3" H 10391 4916 50  0000 C CNN
F 1 "LEDG" H 10391 4825 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 10400 4700 50  0001 C CNN
F 3 "~" H 10400 4700 50  0001 C CNN
	1    10400 4700
	-1   0    0    1   
$EndComp
$Comp
L Device:R_US R3
U 1 1 5B626F8E
P 10000 4700
F 0 "R3" V 9795 4700 50  0000 C CNN
F 1 "10K" V 9886 4700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 10040 4690 50  0001 C CNN
F 3 "~" H 10000 4700 50  0001 C CNN
	1    10000 4700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10150 4700 10250 4700
$Comp
L power:GND #PWR015
U 1 1 5B626F96
P 10700 4700
F 0 "#PWR015" H 10700 4450 50  0001 C CNN
F 1 "GND" V 10705 4572 50  0000 R CNN
F 2 "" H 10700 4700 50  0001 C CNN
F 3 "" H 10700 4700 50  0001 C CNN
	1    10700 4700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10700 4700 10550 4700
$Comp
L power:+5V #PWR014
U 1 1 5B626F9D
P 9650 4700
F 0 "#PWR014" H 9650 4550 50  0001 C CNN
F 1 "+5V" V 9665 4828 50  0000 L CNN
F 2 "" H 9650 4700 50  0001 C CNN
F 3 "" H 9650 4700 50  0001 C CNN
	1    9650 4700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9650 4700 9850 4700
$Comp
L Device:R_US R4
U 1 1 5B627B81
P 10100 5800
F 0 "R4" V 9895 5800 50  0000 C CNN
F 1 "10K" V 9986 5800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 10140 5790 50  0001 C CNN
F 3 "~" H 10100 5800 50  0001 C CNN
	1    10100 5800
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R5
U 1 1 5B627BC1
P 10100 6200
F 0 "R5" V 9895 6200 50  0000 C CNN
F 1 "10K" V 9986 6200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 10140 6190 50  0001 C CNN
F 3 "~" H 10100 6200 50  0001 C CNN
	1    10100 6200
	0    -1   -1   0   
$EndComp
Text Label 9950 5800 2    50   ~ 0
SCL
Text Label 9950 6200 2    50   ~ 0
SDA
$Comp
L power:+5V #PWR0101
U 1 1 5B627D1C
P 10500 5650
F 0 "#PWR0101" H 10500 5500 50  0001 C CNN
F 1 "+5V" H 10515 5823 50  0000 C CNN
F 2 "" H 10500 5650 50  0001 C CNN
F 3 "" H 10500 5650 50  0001 C CNN
	1    10500 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 5800 10500 5800
Wire Wire Line
	10500 5800 10500 5650
Wire Wire Line
	10250 6200 10500 6200
Wire Wire Line
	10500 6200 10500 5800
Connection ~ 10500 5800
Wire Notes Line
	9100 6500 9100 500 
Wire Notes Line
	9100 2450 11150 2450
Wire Notes Line
	9100 4400 11150 4400
Wire Notes Line
	9100 5250 11150 5250
$Comp
L LM3940IMP-3.3:LM3940IMP-3.3 U2
U 1 1 5B60D045
P 7800 4350
F 0 "U2" H 7800 4715 50  0000 C CNN
F 1 "LM3940IMP-3.3" H 7800 4624 50  0000 C CNN
F 2 "LM3940IMP-3.3:SOT230P696X180-4N" H 7800 4350 50  0001 L BNN
F 3 "LM3940IMP-3.3" H 7800 4350 50  0001 L BNN
F 4 "1A Low Dropout Regulator for 5V to 3.3V Conversion 4-SOT-223 -40 to 125" H 7800 4350 50  0001 L BNN "Field4"
F 5 "Texas Instruments" H 7800 4350 50  0001 L BNN "Field5"
F 6 "1.13 USD" H 7800 4350 50  0001 L BNN "Field6"
F 7 "Good" H 7800 4350 50  0001 L BNN "Field7"
F 8 "SOT-223 Texas Instruments" H 7800 4350 50  0001 L BNN "Field8"
	1    7800 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR016
U 1 1 5B60F85E
P 6700 4350
F 0 "#PWR016" H 6700 4200 50  0001 C CNN
F 1 "+5V" V 6715 4478 50  0000 L CNN
F 2 "" H 6700 4350 50  0001 C CNN
F 3 "" H 6700 4350 50  0001 C CNN
	1    6700 4350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6700 4350 6900 4350
Text Label 8700 4350 0    50   ~ 0
3.3V
Wire Wire Line
	8500 4350 8600 4350
$Comp
L Device:C_Small C6
U 1 1 5B611738
P 6900 5050
F 0 "C6" H 6992 5096 50  0000 L CNN
F 1 "100nF" H 6992 5005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6900 5050 50  0001 C CNN
F 3 "~" H 6900 5050 50  0001 C CNN
	1    6900 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 4950 6900 4350
Connection ~ 6900 4350
Wire Wire Line
	6900 4350 7100 4350
$Comp
L power:GND #PWR017
U 1 1 5B612512
P 7800 5400
F 0 "#PWR017" H 7800 5150 50  0001 C CNN
F 1 "GND" H 7805 5227 50  0000 C CNN
F 2 "" H 7800 5400 50  0001 C CNN
F 3 "" H 7800 5400 50  0001 C CNN
	1    7800 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 4650 7100 4550
Wire Wire Line
	7800 5350 6900 5350
Wire Wire Line
	6900 5350 6900 5150
$Comp
L Device:CP1_Small C7
U 1 1 5B616364
P 8600 5050
F 0 "C7" H 8691 5096 50  0000 L CNN
F 1 "33uF" H 8691 5005 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_5x5.8" H 8600 5050 50  0001 C CNN
F 3 "~" H 8600 5050 50  0001 C CNN
	1    8600 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 4950 8600 4350
Connection ~ 8600 4350
Wire Wire Line
	8600 4350 8700 4350
Wire Wire Line
	7800 5400 7800 5350
Wire Wire Line
	7800 5350 8600 5350
Wire Wire Line
	8600 5350 8600 5150
Connection ~ 7800 5350
Wire Wire Line
	7100 4650 7100 4950
Wire Wire Line
	7100 4950 7800 4950
Wire Wire Line
	7800 4950 7800 5350
Connection ~ 7100 4650
Text Label 7500 1700 2    50   ~ 0
3.3V
Wire Notes Line
	6950 6550 6200 6550
Wire Notes Line
	6200 6550 6200 500 
Wire Notes Line
	9100 3300 6200 3300
$Comp
L dk_Tactile-Switches:FSM4JSMATR S1
U 1 1 5B6192FC
P 2350 1400
F 0 "S1" H 2350 1747 60  0000 C CNN
F 1 "RESET" H 2350 1641 60  0000 C CNN
F 2 "digikey-footprints:Switch_Tactile_SMD_6x6mm" H 2550 1600 60  0001 L CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 2550 1700 60  0001 L CNN
F 4 "450-1759-1-ND" H 2550 1800 60  0001 L CNN "Digi-Key_PN"
F 5 "FSM4JSMATR" H 2550 1900 60  0001 L CNN "MPN"
F 6 "Switches" H 2550 2000 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 2550 2100 60  0001 L CNN "Family"
F 8 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=2-1437565-7&DocType=Customer+Drawing&DocLang=English" H 2550 2200 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/FSM4JSMATR/450-1759-1-ND/2271638" H 2550 2300 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 2550 2400 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 2550 2500 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2550 2600 60  0001 L CNN "Status"
	1    2350 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 1300 2750 1300
Wire Wire Line
	2750 1300 2750 1500
Connection ~ 2750 1500
Wire Wire Line
	2750 1500 3150 1500
Wire Wire Line
	2150 1500 2100 1500
Wire Wire Line
	2100 1500 2100 1300
Wire Wire Line
	2100 1300 2150 1300
Connection ~ 2100 1500
Wire Wire Line
	2100 1500 2000 1500
$Comp
L CSTCE16M0V53-R0:CSTCE16M0V53-R0 Y1
U 1 1 5B61FEDA
P 1750 2200
F 0 "Y1" H 1750 2467 50  0000 C CNN
F 1 "16MHz" H 1750 2376 50  0000 C CNN
F 2 "CSTCE16M0V53-R0:OSC_CSTCE16M0V53-R0" H 1750 2200 50  0001 L BNN
F 3 "https://www.digikey.de/product-detail/en/murata-electronics-north-america/CSTCE16M0V53-R0/490-1198-1-ND/584635?utm_source=snapeda&utm_medium=aggregator&utm_campaign=symbol" H 1750 2200 50  0001 L BNN
F 4 "SMD-3 Murata" H 1750 2200 50  0001 L BNN "Field4"
F 5 "CSTCE16M0V53-R0" H 1750 2200 50  0001 L BNN "Field5"
F 6 "Ceramic Resonator 16MHz ??0.5% _Tol_ ??0.3% _Stability_ 15pF 40Ohm 3-Pin CSMD T/R" H 1750 2200 50  0001 L BNN "Field6"
F 7 "Murata" H 1750 2200 50  0001 L BNN "Field7"
F 8 "490-1198-1-ND" H 1750 2200 50  0001 L BNN "Field8"
	1    1750 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 2200 1250 1700
Wire Wire Line
	1250 1700 3150 1700
Wire Wire Line
	2250 2200 2250 1900
Wire Wire Line
	2250 1900 3150 1900
Wire Wire Line
	1750 2800 1750 2700
$Comp
L Device:R_US R6
U 1 1 5B629C42
P 1750 3400
F 0 "R6" V 1545 3400 50  0000 C CNN
F 1 "1M" V 1636 3400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 1790 3390 50  0001 C CNN
F 3 "~" H 1750 3400 50  0001 C CNN
	1    1750 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	1600 3400 1250 3400
Wire Wire Line
	1250 3400 1250 2200
Connection ~ 1250 2200
Wire Wire Line
	2250 2200 2250 3400
Wire Wire Line
	2250 3400 1900 3400
Connection ~ 2250 2200
$EndSCHEMATC
