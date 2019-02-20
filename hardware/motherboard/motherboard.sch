EESchema Schematic File Version 4
LIBS:motherboard-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "araBeat : Motherboard"
Date "2019-02-03"
Rev "v0.2"
Comp "www.aravinth.info"
Comment1 "www.arabeat.aravinth.info"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ARABEAT:DSP-MODULE U3
U 1 1 5C5AE633
P 8650 4450
F 0 "U3" H 8675 5765 50  0000 C CNN
F 1 "DSP-MODULE" H 8675 5674 50  0000 C CNN
F 2 "" H 6150 5800 50  0001 C CNN
F 3 "" H 6150 5800 50  0001 C CNN
	1    8650 4450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x10_Counter_Clockwise J1
U 1 1 5C5AF029
P 7150 4450
F 0 "J1" H 7200 5067 50  0000 C CNN
F 1 "J3_02x10_Pin_Header" H 7200 4976 50  0000 C CNN
F 2 "" H 7150 4450 50  0001 C CNN
F 3 "~" H 7150 4450 50  0001 C CNN
	1    7150 4450
	1    0    0    -1  
$EndComp
NoConn ~ 8050 3450
NoConn ~ 8050 3650
NoConn ~ 8050 3850
NoConn ~ 8050 3950
NoConn ~ 8050 4050
NoConn ~ 8050 4150
NoConn ~ 8050 4250
NoConn ~ 8050 4350
NoConn ~ 8050 4450
NoConn ~ 8050 4550
NoConn ~ 8050 4650
NoConn ~ 8050 4750
NoConn ~ 8050 4850
NoConn ~ 8050 4950
NoConn ~ 8050 5050
NoConn ~ 8050 5250
NoConn ~ 8050 5350
NoConn ~ 9300 3550
NoConn ~ 9300 3750
NoConn ~ 9300 3950
NoConn ~ 9300 4150
NoConn ~ 9300 4350
NoConn ~ 9300 4550
NoConn ~ 9300 4750
NoConn ~ 9300 4950
NoConn ~ 9300 5150
NoConn ~ 9300 5350
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 5C5CCB23
P 3500 6700
F 0 "J3" V 3373 6780 50  0000 L CNN
F 1 "01x02_Screw_5VDC_IN" V 3650 6200 50  0000 L CNN
F 2 "" H 3500 6700 50  0001 C CNN
F 3 "~" H 3500 6700 50  0001 C CNN
	1    3500 6700
	0    1    1    0   
$EndComp
Wire Wire Line
	3400 6500 3400 6400
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5C5CE15B
P 3400 6400
F 0 "#FLG0101" H 3400 6475 50  0001 C CNN
F 1 "PWR_FLAG" V 3400 6528 50  0000 L CNN
F 2 "" H 3400 6400 50  0001 C CNN
F 3 "~" H 3400 6400 50  0001 C CNN
	1    3400 6400
	0    -1   -1   0   
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5C5CE27E
P 3500 6400
F 0 "#FLG0102" H 3500 6475 50  0001 C CNN
F 1 "PWR_FLAG" V 3500 6528 50  0000 L CNN
F 2 "" H 3500 6400 50  0001 C CNN
F 3 "~" H 3500 6400 50  0001 C CNN
	1    3500 6400
	0    1    1    0   
$EndComp
Wire Wire Line
	3500 6400 3500 6500
Text Label 3500 6200 1    50   ~ 0
VIN
Wire Wire Line
	10700 4050 10350 4050
NoConn ~ 10350 4150
NoConn ~ 10350 4250
NoConn ~ 10350 4350
NoConn ~ 10350 4450
NoConn ~ 10350 4550
NoConn ~ 10350 4650
NoConn ~ 10350 4750
NoConn ~ 10350 4850
NoConn ~ 10350 4950
NoConn ~ 7450 4050
NoConn ~ 7450 4150
NoConn ~ 7450 4350
NoConn ~ 7450 4450
NoConn ~ 7450 4550
NoConn ~ 7450 4650
NoConn ~ 7450 4750
NoConn ~ 7450 4850
NoConn ~ 7450 4950
NoConn ~ 6950 4950
NoConn ~ 6950 4850
NoConn ~ 6950 4750
NoConn ~ 6950 4650
NoConn ~ 6950 4550
NoConn ~ 6950 4450
NoConn ~ 6950 4250
NoConn ~ 6950 4050
Text Label 3400 6050 3    50   ~ 0
GND
NoConn ~ 8050 3550
NoConn ~ 8050 3750
NoConn ~ 8050 5150
NoConn ~ 9300 5050
NoConn ~ 9300 5250
NoConn ~ 9300 4250
NoConn ~ 9300 3850
NoConn ~ 9300 4050
NoConn ~ 9300 3650
NoConn ~ 9300 3450
NoConn ~ 9300 4850
NoConn ~ 9300 4450
NoConn ~ 9300 4650
$Comp
L Connector_Generic:Conn_02x10_Counter_Clockwise J2
U 1 1 5C5AF269
P 10050 4450
F 0 "J2" H 10100 5067 50  0000 C CNN
F 1 "J4_02x10_Pin_Header" H 10100 4976 50  0000 C CNN
F 2 "" H 10050 4450 50  0001 C CNN
F 3 "~" H 10050 4450 50  0001 C CNN
	1    10050 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 4050 9750 4050
Wire Wire Line
	9750 4050 9750 4150
Wire Wire Line
	9850 4150 9750 4150
Connection ~ 9750 4150
Wire Wire Line
	9750 4150 9750 4250
Wire Wire Line
	9850 4250 9750 4250
Connection ~ 9750 4250
Wire Wire Line
	9750 4250 9750 4350
Wire Wire Line
	9850 4350 9750 4350
Connection ~ 9750 4350
Wire Wire Line
	9750 4350 9750 4450
Wire Wire Line
	9850 4450 9750 4450
Connection ~ 9750 4450
Wire Wire Line
	9750 4450 9750 4550
Wire Wire Line
	9850 4550 9750 4550
Connection ~ 9750 4550
Wire Wire Line
	9750 4550 9750 4650
Wire Wire Line
	9850 4650 9750 4650
Connection ~ 9750 4650
Wire Wire Line
	9750 4650 9750 4750
Wire Wire Line
	9850 4750 9750 4750
Connection ~ 9750 4750
Wire Wire Line
	9750 4750 9750 4850
Wire Wire Line
	9850 4850 9750 4850
Connection ~ 9750 4850
Wire Wire Line
	9750 4850 9750 4950
Wire Wire Line
	9850 4950 9750 4950
Wire Wire Line
	6950 4150 6300 4150
Wire Wire Line
	6300 4150 6300 4350
Wire Wire Line
	6950 4350 6300 4350
Wire Wire Line
	7450 4250 7700 4250
$Comp
L Connector:Conn_Coaxial J6
U 1 1 5C664C8C
P 4900 6300
F 0 "J6" H 5000 6184 50  0000 L CNN
F 1 "RCA_L_Female" H 4650 6450 50  0000 L CNN
F 2 "" H 4900 6300 50  0001 C CNN
F 3 " ~" H 4900 6300 50  0001 C CNN
	1    4900 6300
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_Coaxial J7
U 1 1 5C665073
P 5550 6300
F 0 "J7" H 5650 6184 50  0000 L CNN
F 1 "RCA_R_Female" H 5250 6450 50  0000 L CNN
F 2 "" H 5550 6300 50  0001 C CNN
F 3 " ~" H 5550 6300 50  0001 C CNN
	1    5550 6300
	-1   0    0    1   
$EndComp
Wire Wire Line
	4900 6100 4900 5950
Wire Wire Line
	5100 5850 5100 6150
Wire Wire Line
	5550 6100 5650 6100
Wire Wire Line
	4900 6550 4650 6550
Wire Wire Line
	4650 6550 4650 5950
Wire Wire Line
	4650 5950 4900 5950
Connection ~ 4900 5950
Wire Wire Line
	4900 5950 4900 5700
Wire Wire Line
	5100 6150 5200 6150
Connection ~ 5100 6150
Wire Wire Line
	5100 6150 5100 6300
Wire Wire Line
	5550 6550 5450 6550
Wire Wire Line
	5450 6550 5450 6000
Wire Wire Line
	5450 6000 5650 6000
Wire Wire Line
	5650 6000 5650 6100
$Comp
L Connector:Screw_Terminal_01x02 J10
U 1 1 5C69EF29
P 5000 6750
F 0 "J10" V 4873 6830 50  0000 L CNN
F 1 "01x02_Screw_Tweeter" V 5150 6300 50  0000 L CNN
F 2 "" H 5000 6750 50  0001 C CNN
F 3 "~" H 5000 6750 50  0001 C CNN
	1    5000 6750
	0    1    1    0   
$EndComp
Wire Wire Line
	5200 6150 5200 6550
Wire Wire Line
	5200 6550 5000 6550
Text Label 5150 5700 0    50   ~ 0
OUT_L-
Text Label 5150 5850 0    50   ~ 0
OUT_L+
Text Label 6000 6100 0    50   ~ 0
OUT_R-
Text Label 6000 6300 0    50   ~ 0
OUT_R+
$Comp
L Connector:Screw_Terminal_01x02 J11
U 1 1 5C6AA080
P 5650 6750
F 0 "J11" V 5523 6830 50  0000 L CNN
F 1 "01x02_Screw_Sub" V 5800 6550 50  0000 L CNN
F 2 "" H 5650 6750 50  0001 C CNN
F 3 "~" H 5650 6750 50  0001 C CNN
	1    5650 6750
	0    1    1    0   
$EndComp
Wire Wire Line
	5750 6300 5900 6300
Wire Wire Line
	5650 6550 5900 6550
Wire Wire Line
	5900 6550 5900 6300
Wire Notes Line
	4400 7300 6400 7300
Wire Notes Line
	6400 7300 6400 5500
Wire Notes Line
	6400 5500 4400 5500
Wire Notes Line
	4400 5500 4400 7300
Text Notes 5150 7250 0    50   ~ 0
AUDIO UI
Wire Notes Line
	4200 5500 4200 7300
Wire Notes Line
	4200 7300 2700 7300
Wire Notes Line
	2700 7300 2700 5500
Wire Notes Line
	2700 5500 4200 5500
Text Notes 3200 7250 0    50   ~ 0
DC POWER UI
$Comp
L Connector:Screw_Terminal_01x02 J9
U 1 1 5C6E4D01
P 2000 6700
F 0 "J9" V 1873 6780 50  0000 L CNN
F 1 "01x02_Screw_ECG" V 2150 6300 50  0000 L CNN
F 2 "" H 2000 6700 50  0001 C CNN
F 3 "~" H 2000 6700 50  0001 C CNN
	1    2000 6700
	0    1    1    0   
$EndComp
Text Label 1900 6250 1    50   ~ 0
ECGN
Text Label 2000 6250 1    50   ~ 0
ECGP
Wire Notes Line
	2500 5500 2500 7300
Wire Notes Line
	2500 7300 1300 7300
Wire Notes Line
	1300 7300 1300 5500
Wire Notes Line
	1300 5500 2500 5500
Text Notes 1800 7250 0    50   ~ 0
ECG UI
Text Notes 8600 5450 1    50   ~ 0
RCA OUT_L
Text Notes 8800 5450 1    50   ~ 0
RCA OUT_R
Wire Notes Line
	8500 5500 8500 5000
Wire Notes Line
	8500 5000 8850 5000
Wire Notes Line
	8850 5000 8850 5500
Wire Notes Line
	8650 5000 8650 5500
Wire Notes Line
	7200 4000 7200 3350
Wire Notes Line
	7200 3350 8100 3350
Wire Notes Line
	9250 3350 10100 3350
Wire Notes Line
	10100 3350 10100 4000
Text Notes 7250 3300 0    50   ~ 0
2x10 MOLEX Female to \nFemale Cable
Text Notes 9450 3300 0    50   ~ 0
2x10 MOLEX Female to \nFemale Cable
Text Label 10500 4050 0    50   ~ 0
VIN
$Comp
L ARABEAT:ECG-MODULE U2
U 1 1 5C66A653
P 3100 1750
F 0 "U2" H 3125 2715 50  0000 C CNN
F 1 "ECG-MODULE" H 3125 2624 50  0000 C CNN
F 2 "" H 2750 2350 50  0001 C CNN
F 3 "" H 2750 2350 50  0001 C CNN
	1    3100 1750
	1    0    0    -1  
$EndComp
$Comp
L ARABEAT:MCU-MODULE U1
U 1 1 5C64D1AB
P 1450 1750
F 0 "U1" H 1475 2715 50  0000 C CNN
F 1 "MCU-MODULE" H 1475 2624 50  0000 C CNN
F 2 "" H 1100 2350 50  0001 C CNN
F 3 "" H 1100 2350 50  0001 C CNN
	1    1450 1750
	1    0    0    -1  
$EndComp
Text GLabel 1000 1050 0    50   Input ~ 0
5V
Text GLabel 1000 1150 0    50   Input ~ 0
D0
Text GLabel 1000 1250 0    50   Input ~ 0
D1
Text GLabel 1000 1350 0    50   Input ~ 0
D2
Text GLabel 1000 1450 0    50   Input ~ 0
D3
Text GLabel 1000 1550 0    50   Input ~ 0
D4
Text GLabel 1000 1650 0    50   Input ~ 0
D5
Text GLabel 1000 1750 0    50   Input ~ 0
D6
Text GLabel 1000 1850 0    50   Input ~ 0
D7
Text GLabel 1000 1950 0    50   Input ~ 0
D8
Text GLabel 1000 2050 0    50   Input ~ 0
D9
Text GLabel 1000 2150 0    50   Input ~ 0
D10
Text GLabel 1000 2250 0    50   Input ~ 0
D11
Text GLabel 1000 2350 0    50   Input ~ 0
D12
Text GLabel 1000 2450 0    50   Input ~ 0
D13
Text GLabel 1950 1050 2    50   Input ~ 0
GND
Text GLabel 1950 1550 2    50   Input ~ 0
RST
Text GLabel 1950 1650 2    50   Input ~ 0
AREF
Text GLabel 1950 1750 2    50   Input ~ 0
A7
Text GLabel 1950 1850 2    50   Input ~ 0
A6
Text GLabel 1950 1950 2    50   Input ~ 0
A5
Text GLabel 1950 2050 2    50   Input ~ 0
A4
Text GLabel 1950 2150 2    50   Input ~ 0
A3
Text GLabel 1950 2250 2    50   Input ~ 0
A2
Text GLabel 1950 2350 2    50   Input ~ 0
A1
Text GLabel 1950 2450 2    50   Input ~ 0
A0
Text GLabel 2650 1050 0    50   Input ~ 0
5V
Text GLabel 2650 1350 0    50   Input ~ 0
D2
Text GLabel 2650 1450 0    50   Input ~ 0
D3
Text GLabel 2650 1850 0    50   Input ~ 0
D7
Text GLabel 2650 2250 0    50   Input ~ 0
D11
Text GLabel 2650 2350 0    50   Input ~ 0
D12
Text GLabel 2650 2450 0    50   Input ~ 0
D13
Text GLabel 3600 1050 2    50   Input ~ 0
GND
Text GLabel 3600 1150 2    50   Input ~ 0
ECGN
Text GLabel 3600 1250 2    50   Input ~ 0
ECGP
$Comp
L ARABEAT:PROTO-MODULE U4
U 1 1 5C64C99C
P 4800 1750
F 0 "U4" H 4825 2715 50  0000 C CNN
F 1 "PROTO-MODULE" H 4825 2624 50  0000 C CNN
F 2 "" H 4450 2350 50  0001 C CNN
F 3 "" H 4450 2350 50  0001 C CNN
	1    4800 1750
	1    0    0    -1  
$EndComp
Text GLabel 4350 1050 0    50   Input ~ 0
5V
Text GLabel 4350 1150 0    50   Input ~ 0
D0
Text GLabel 4350 1250 0    50   Input ~ 0
D1
Text GLabel 4350 1350 0    50   Input ~ 0
D2
Text GLabel 4350 1450 0    50   Input ~ 0
D3
Text GLabel 4350 1550 0    50   Input ~ 0
D4
Text GLabel 4350 1650 0    50   Input ~ 0
D5
Text GLabel 4350 1750 0    50   Input ~ 0
D6
Text GLabel 4350 1850 0    50   Input ~ 0
D7
Text GLabel 4350 1950 0    50   Input ~ 0
D8
Text GLabel 4350 2050 0    50   Input ~ 0
D9
Text GLabel 4350 2150 0    50   Input ~ 0
D10
Text GLabel 4350 2250 0    50   Input ~ 0
D11
Text GLabel 4350 2350 0    50   Input ~ 0
D12
Text GLabel 4350 2450 0    50   Input ~ 0
D13
Text GLabel 5300 1050 2    50   Input ~ 0
GND
Text GLabel 5300 1550 2    50   Input ~ 0
RST
Text GLabel 5300 1650 2    50   Input ~ 0
AREF
Text GLabel 5300 1750 2    50   Input ~ 0
A7
Text GLabel 5300 1850 2    50   Input ~ 0
A6
Text GLabel 5300 1950 2    50   Input ~ 0
A5
Text GLabel 5300 2050 2    50   Input ~ 0
A4
Text GLabel 5300 2150 2    50   Input ~ 0
A3
Text GLabel 5300 2250 2    50   Input ~ 0
A2
Text GLabel 5300 2350 2    50   Input ~ 0
A1
Text GLabel 5300 2450 2    50   Input ~ 0
A0
NoConn ~ 5300 1150
NoConn ~ 5300 1250
NoConn ~ 5300 1350
NoConn ~ 5300 1450
$EndSCHEMATC
