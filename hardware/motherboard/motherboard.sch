EESchema Schematic File Version 4
LIBS:motherboard-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "araBeat : Motherboard v0.2"
Date "2019-02-25"
Rev "v0.2"
Comp "www.aravinth.info"
Comment1 "www.arabeat.aravinth.info"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 5C5CCB23
P 3350 7000
F 0 "J2" V 3223 7080 50  0000 L CNN
F 1 "01x02_Screw_5VDC_IN" V 3500 6950 50  0000 C CNN
F 2 "TE-CONNECTIVITY:282837-2" H 3350 7000 50  0001 C CNN
F 3 "~" H 3350 7000 50  0001 C CNN
	1    3350 7000
	0    1    1    0   
$EndComp
Text Notes 5150 7350 0    50   ~ 0
AUDIO UI
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 5C6E4D01
P 1650 6950
F 0 "J1" V 1523 7030 50  0000 L CNN
F 1 "01x02_Screw_ECG" V 1800 7250 50  0000 R CNN
F 2 "TE-CONNECTIVITY:282837-2" H 1650 6950 50  0001 C CNN
F 3 "~" H 1650 6950 50  0001 C CNN
	1    1650 6950
	0    1    1    0   
$EndComp
$Comp
L ARABEAT:ECG-MODULE U3
U 1 1 5C66A653
P 6950 3100
F 0 "U3" H 6975 4065 50  0000 C CNN
F 1 "ECG-MODULE" H 6975 3974 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x15_P2.54mm_Vertical" H 6600 3700 50  0001 C CNN
F 3 "" H 6600 3700 50  0001 C CNN
	1    6950 3100
	1    0    0    -1  
$EndComp
$Comp
L ARABEAT:MCU-MODULE U2
U 1 1 5C64D1AB
P 5400 3100
F 0 "U2" H 5425 4065 50  0000 C CNN
F 1 "MCU-MODULE" H 5425 3974 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x15_P2.54mm_Vertical" H 5050 3700 50  0001 C CNN
F 3 "" H 5050 3700 50  0001 C CNN
	1    5400 3100
	1    0    0    -1  
$EndComp
Text GLabel 4950 2400 0    50   Input ~ 0
5V
Text GLabel 4950 2500 0    50   Input ~ 0
D0
Text GLabel 4950 2600 0    50   Input ~ 0
D1
Text GLabel 4950 2700 0    50   Input ~ 0
D2
Text GLabel 4950 2800 0    50   Input ~ 0
D3
Text GLabel 4950 2900 0    50   Input ~ 0
D4
Text GLabel 4950 3000 0    50   Input ~ 0
D5
Text GLabel 4950 3100 0    50   Input ~ 0
D6
Text GLabel 4950 3200 0    50   Input ~ 0
D7
Text GLabel 4950 3300 0    50   Input ~ 0
D8
Text GLabel 4950 3400 0    50   Input ~ 0
D9
Text GLabel 4950 3500 0    50   Input ~ 0
D10
Text GLabel 4950 3600 0    50   Input ~ 0
D11
Text GLabel 4950 3700 0    50   Input ~ 0
D12
Text GLabel 4950 3800 0    50   Input ~ 0
D13
Text GLabel 5900 2400 2    50   Input ~ 0
GND
Text GLabel 5900 2900 2    50   Input ~ 0
RST
Text GLabel 5900 3000 2    50   Input ~ 0
AREF
Text GLabel 5900 3100 2    50   Input ~ 0
A7
Text GLabel 5900 3200 2    50   Input ~ 0
A6
Text GLabel 5900 3300 2    50   Input ~ 0
A5
Text GLabel 5900 3400 2    50   Input ~ 0
A4
Text GLabel 5900 3500 2    50   Input ~ 0
A3
Text GLabel 5900 3600 2    50   Input ~ 0
A2
Text GLabel 5900 3700 2    50   Input ~ 0
A1
Text GLabel 5900 3800 2    50   Input ~ 0
A0
Text GLabel 6500 2400 0    50   Input ~ 0
5V
Text GLabel 6500 2700 0    50   Input ~ 0
D2
Text GLabel 6500 2800 0    50   Input ~ 0
D3
Text GLabel 6500 3200 0    50   Input ~ 0
D7
Text GLabel 6500 3600 0    50   Input ~ 0
D11
Text GLabel 6500 3700 0    50   Input ~ 0
D12
Text GLabel 6500 3800 0    50   Input ~ 0
D13
Text GLabel 7450 2400 2    50   Input ~ 0
GND
Text GLabel 7450 2500 2    50   Input ~ 0
ECGN
Text GLabel 7450 2600 2    50   Input ~ 0
ECGP
$Comp
L ARABEAT:PROTO-MODULE U5
U 1 1 5C64C99C
P 8500 3100
F 0 "U5" H 8525 4065 50  0000 C CNN
F 1 "PROTO-MODULE" H 8525 3974 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x15_P2.54mm_Vertical" H 8150 3700 50  0001 C CNN
F 3 "" H 8150 3700 50  0001 C CNN
	1    8500 3100
	1    0    0    -1  
$EndComp
Text GLabel 8050 2400 0    50   Input ~ 0
5V
Text GLabel 8050 2500 0    50   Input ~ 0
D0
Text GLabel 8050 2600 0    50   Input ~ 0
D1
Text GLabel 8050 2700 0    50   Input ~ 0
D2
Text GLabel 8050 2800 0    50   Input ~ 0
D3
Text GLabel 8050 2900 0    50   Input ~ 0
D4
Text GLabel 8050 3000 0    50   Input ~ 0
D5
Text GLabel 8050 3100 0    50   Input ~ 0
D6
Text GLabel 8050 3200 0    50   Input ~ 0
D7
Text GLabel 8050 3300 0    50   Input ~ 0
D8
Text GLabel 8050 3400 0    50   Input ~ 0
D9
Text GLabel 8050 3500 0    50   Input ~ 0
D10
Text GLabel 8050 3600 0    50   Input ~ 0
D11
Text GLabel 8050 3700 0    50   Input ~ 0
D12
Text GLabel 8050 3800 0    50   Input ~ 0
D13
Text GLabel 9000 2400 2    50   Input ~ 0
GND
Text GLabel 9000 3000 2    50   Input ~ 0
AREF
Text GLabel 9000 3100 2    50   Input ~ 0
A7
Text GLabel 9000 3200 2    50   Input ~ 0
A6
Text GLabel 9000 3300 2    50   Input ~ 0
A5
Text GLabel 9000 3400 2    50   Input ~ 0
A4
Text GLabel 9000 3500 2    50   Input ~ 0
A3
Text GLabel 9000 3600 2    50   Input ~ 0
A2
Text GLabel 9000 3700 2    50   Input ~ 0
A1
Text GLabel 9000 3800 2    50   Input ~ 0
A0
NoConn ~ 9000 2500
NoConn ~ 9000 2600
NoConn ~ 9000 2700
Text GLabel 5900 2800 2    50   Input ~ 0
3V3
Text GLabel 9000 2800 2    50   Input ~ 0
3V3
Text GLabel 1550 6750 1    50   Input ~ 0
ECGN
Text GLabel 1650 6750 1    50   Input ~ 0
ECGP
Text GLabel 3500 5500 1    50   Input ~ 0
5V
Text GLabel 2800 5500 1    50   Input ~ 0
GND
$Comp
L ARABEAT:DSP-MODULE_IDC_J3 U1
U 1 1 5C7588B4
P 6500 5700
F 0 "U1" H 6431 7065 50  0000 C CNN
F 1 "DSP-MODULE_IDC_J3" H 6431 6974 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x10_P2.54mm_Vertical" H 4000 7050 50  0001 C CNN
F 3 "" H 4000 7050 50  0001 C CNN
	1    6500 5700
	1    0    0    -1  
$EndComp
$Comp
L ARABEAT:DSP-MODULE_IDC_J4 U4
U 1 1 5C758C0D
P 8600 5700
F 0 "U4" H 8600 7065 50  0000 C CNN
F 1 "DSP-MODULE_IDC_J4" H 8600 6974 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x10_P2.54mm_Vertical" H 6100 7050 50  0001 C CNN
F 3 "" H 6100 7050 50  0001 C CNN
	1    8600 5700
	1    0    0    -1  
$EndComp
$Comp
L ARABEAT:DSP-MODULE_JST_J3 U6
U 1 1 5C75A43C
P 10450 5050
F 0 "U6" H 10450 5500 50  0000 L CNN
F 1 "DSP-MODULE_JST_J3" H 10100 5400 50  0000 L CNN
F 2 "JST:B4B-PH-K-S(LF)(SN)" H 7950 6400 50  0001 C CNN
F 3 "" H 7950 6400 50  0001 C CNN
F 4 "KiCad / Mfg footprint pins are reversed when compared to RCA interface pinout of Wondom" H 0   0   50  0001 C CNN "Notes"
	1    10450 5050
	1    0    0    -1  
$EndComp
Text GLabel 10050 4900 0    50   Input ~ 0
ROUT+
Text GLabel 10050 5200 0    50   Input ~ 0
LOUT+
Text GLabel 10050 5000 0    50   Input ~ 0
ROUT-
Text GLabel 10050 5100 0    50   Input ~ 0
LOUT-
Text GLabel 5100 6650 2    50   Input ~ 0
ROUT+
Text GLabel 4950 6850 2    50   Input ~ 0
ROUT-
Text GLabel 6100 6650 2    50   Input ~ 0
LOUT+
Text GLabel 5950 6850 2    50   Input ~ 0
LOUT-
Wire Notes Line
	4300 6300 4300 7450
Wire Notes Line
	4300 7450 6500 7450
Wire Notes Line
	6500 7450 6500 6300
Wire Notes Line
	6500 6300 4300 6300
Text Notes 3100 7350 0    50   ~ 0
POWER UI\n
Wire Notes Line
	2300 7450 2300 6300
Wire Notes Line
	2300 6300 900  6300
Wire Notes Line
	900  6300 900  7450
Wire Notes Line
	900  7450 2300 7450
Text Notes 1500 7350 0    50   ~ 0
ECG UI\n
Text GLabel 6950 4650 2    50   Input ~ 0
GND
Text GLabel 6950 4750 2    50   Input ~ 0
GND
Text GLabel 9100 4850 2    50   Input ~ 0
GND
Text GLabel 9100 4950 2    50   Input ~ 0
GND
Text GLabel 9100 5050 2    50   Input ~ 0
GND
Text GLabel 9100 5150 2    50   Input ~ 0
GND
Text GLabel 9100 5250 2    50   Input ~ 0
GND
Text GLabel 9100 5350 2    50   Input ~ 0
GND
Text GLabel 9100 5450 2    50   Input ~ 0
GND
Text GLabel 9100 5550 2    50   Input ~ 0
GND
Text GLabel 6950 5450 2    50   Input ~ 0
GND
Text GLabel 8100 4650 0    50   Input ~ 0
5V
Text GLabel 9100 4650 2    50   Input ~ 0
GND
Text GLabel 9100 4750 2    50   Input ~ 0
GND
NoConn ~ 8100 4750
NoConn ~ 8100 4850
NoConn ~ 8100 4950
NoConn ~ 8100 5050
NoConn ~ 8100 5150
NoConn ~ 8100 5250
NoConn ~ 8100 5350
NoConn ~ 8100 5450
NoConn ~ 8100 5550
Text GLabel 5950 5150 0    50   Input ~ 0
D6
Text GLabel 5300 4850 0    50   Input ~ 0
A5
Text GLabel 5300 4950 0    50   Input ~ 0
A4
Text GLabel 5950 5250 0    50   Input ~ 0
D8
Text GLabel 5950 4650 0    50   Input ~ 0
D9
NoConn ~ 5950 4750
NoConn ~ 5950 5050
NoConn ~ 5950 5350
NoConn ~ 5950 5450
NoConn ~ 5950 5550
NoConn ~ 6950 4850
NoConn ~ 6950 4950
NoConn ~ 6950 5050
NoConn ~ 6950 5150
NoConn ~ 6950 5250
NoConn ~ 6950 5350
Wire Wire Line
	5950 4850 5500 4850
Wire Wire Line
	5950 4950 5400 4950
$Comp
L Device:R_Small R1
U 1 1 5C771D2D
P 5200 5350
F 0 "R1" H 5141 5304 50  0000 R CNN
F 1 "10K" H 5141 5395 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5200 5350 50  0001 C CNN
F 3 "~" H 5200 5350 50  0001 C CNN
	1    5200 5350
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5C77275C
P 5450 5350
F 0 "R2" H 5391 5304 50  0000 R CNN
F 1 "10K" H 5391 5395 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5450 5350 50  0001 C CNN
F 3 "~" H 5450 5350 50  0001 C CNN
	1    5450 5350
	-1   0    0    1   
$EndComp
Wire Wire Line
	5200 5250 5200 5150
Wire Wire Line
	5200 5150 5400 5150
Wire Wire Line
	5400 5150 5400 4950
Connection ~ 5400 4950
Wire Wire Line
	5400 4950 5300 4950
Wire Wire Line
	5500 4850 5500 5250
Wire Wire Line
	5500 5250 5450 5250
Connection ~ 5500 4850
Wire Wire Line
	5500 4850 5300 4850
Wire Wire Line
	5450 5450 5450 5800
Wire Wire Line
	5200 5450 5200 5800
$Comp
L Device:LED D1
U 1 1 5C776010
P 3350 6050
F 0 "D1" V 3350 6250 50  0000 R CNN
F 1 "GREEN_PWR_LED" H 4150 6050 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3350 6050 50  0001 C CNN
F 3 "~" H 3350 6050 50  0001 C CNN
	1    3350 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 5550 7100 5550
Wire Wire Line
	5450 5800 7100 5800
Wire Wire Line
	7100 5800 7100 5550
Wire Wire Line
	5200 5800 5450 5800
Connection ~ 5450 5800
Wire Notes Line
	11150 5950 4900 5950
Wire Notes Line
	4900 5950 4900 4150
Wire Notes Line
	4900 4150 11150 4150
Wire Notes Line
	11150 4150 11150 5950
Text Notes 8050 5850 0    50   ~ 0
Wondom DSP - ADAU1701\n
Text GLabel 9000 2900 2    50   Input ~ 0
RST
$Comp
L PJRAN1X1U01X:PJRAN1X1U01X J3
U 1 1 5C749EF2
P 4750 6750
F 0 "J3" H 4741 7028 50  0000 C CNN
F 1 "RCA_L_Female_Tweeter" H 4900 6500 50  0000 C CNN
F 2 "SWITCHCRAFT:PJRAN1X1U01X" H 4750 6750 50  0001 L BNN
F 3 "Conn Phono Jack F 3 POS Solder RA Thru-Hole 3 Terminal 1 Port" H 4750 6750 50  0001 L BNN
F 4 "None" H 4750 6750 50  0001 L BNN "Field4"
F 5 "Unavailable" H 4750 6750 50  0001 L BNN "Field5"
F 6 "PJRAN1X1U01X" H 4750 6750 50  0001 L BNN "Field6"
F 7 "None" H 4750 6750 50  0001 L BNN "Field7"
F 8 "Switchcraft" H 4750 6750 50  0001 L BNN "Field8"
	1    4750 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 6650 5050 6650
Wire Wire Line
	4950 6750 5050 6750
Wire Wire Line
	5050 6750 5050 6650
Connection ~ 5050 6650
Wire Wire Line
	5050 6650 5100 6650
$Comp
L PJRAN1X1U01X:PJRAN1X1U01X J4
U 1 1 5C74C73A
P 5750 6750
F 0 "J4" H 5741 7028 50  0000 C CNN
F 1 "RCA_R_Female_Sub" H 5900 6500 50  0000 C CNN
F 2 "SWITCHCRAFT:PJRAN1X1U01X" H 5750 6750 50  0001 L BNN
F 3 "Conn Phono Jack F 3 POS Solder RA Thru-Hole 3 Terminal 1 Port" H 5750 6750 50  0001 L BNN
F 4 "None" H 5750 6750 50  0001 L BNN "Field4"
F 5 "Unavailable" H 5750 6750 50  0001 L BNN "Field5"
F 6 "PJRAN1X1U01X" H 5750 6750 50  0001 L BNN "Field6"
F 7 "None" H 5750 6750 50  0001 L BNN "Field7"
F 8 "Switchcraft" H 5750 6750 50  0001 L BNN "Field8"
	1    5750 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 6650 6000 6650
Wire Wire Line
	5950 6750 6000 6750
Wire Wire Line
	6000 6750 6000 6650
Connection ~ 6000 6650
Wire Wire Line
	6000 6650 6100 6650
$Comp
L ARABEAT:PROTO-MODULE U7
U 1 1 5C75B3C7
P 10150 3100
F 0 "U7" H 10175 4065 50  0000 C CNN
F 1 "PROTO-MODULE" H 10175 3974 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x15_P2.54mm_Vertical" H 9800 3700 50  0001 C CNN
F 3 "" H 9800 3700 50  0001 C CNN
	1    10150 3100
	1    0    0    -1  
$EndComp
Text GLabel 9700 2400 0    50   Input ~ 0
5V
Text GLabel 9700 2500 0    50   Input ~ 0
D0
Text GLabel 9700 2600 0    50   Input ~ 0
D1
Text GLabel 9700 2700 0    50   Input ~ 0
D2
Text GLabel 9700 2800 0    50   Input ~ 0
D3
Text GLabel 9700 2900 0    50   Input ~ 0
D4
Text GLabel 9700 3000 0    50   Input ~ 0
D5
Text GLabel 9700 3100 0    50   Input ~ 0
D6
Text GLabel 9700 3200 0    50   Input ~ 0
D7
Text GLabel 9700 3300 0    50   Input ~ 0
D8
Text GLabel 9700 3400 0    50   Input ~ 0
D9
Text GLabel 9700 3500 0    50   Input ~ 0
D10
Text GLabel 9700 3600 0    50   Input ~ 0
D11
Text GLabel 9700 3700 0    50   Input ~ 0
D12
Text GLabel 9700 3800 0    50   Input ~ 0
D13
Text GLabel 10650 2400 2    50   Input ~ 0
GND
Text GLabel 10650 3000 2    50   Input ~ 0
AREF
Text GLabel 10650 3100 2    50   Input ~ 0
A7
Text GLabel 10650 3200 2    50   Input ~ 0
A6
Text GLabel 10650 3300 2    50   Input ~ 0
A5
Text GLabel 10650 3400 2    50   Input ~ 0
A4
Text GLabel 10650 3500 2    50   Input ~ 0
A3
Text GLabel 10650 3600 2    50   Input ~ 0
A2
Text GLabel 10650 3700 2    50   Input ~ 0
A1
Text GLabel 10650 3800 2    50   Input ~ 0
A0
NoConn ~ 10650 2500
NoConn ~ 10650 2600
NoConn ~ 10650 2700
Text GLabel 10650 2800 2    50   Input ~ 0
3V3
Text GLabel 10650 2900 2    50   Input ~ 0
RST
$Comp
L Device:Jumper_NO_Small JP2
U 1 1 5C75DDB8
P 3500 6400
F 0 "JP2" V 3454 6448 50  0000 L CNN
F 1 "5V_Jumper" V 3545 6448 50  0000 L CNN
F 2 "TE-CONNECTIVITY:382811-8" H 3500 6400 50  0001 C CNN
F 3 "~" H 3500 6400 50  0001 C CNN
	1    3500 6400
	0    1    1    0   
$EndComp
Wire Wire Line
	3350 6600 3500 6600
Wire Wire Line
	3500 6600 3500 6500
Wire Wire Line
	3500 6300 3500 6050
$Comp
L Device:R_Small R3
U 1 1 5C764120
P 3050 6050
F 0 "R3" H 2991 6004 50  0000 R CNN
F 1 "1K" H 2991 6095 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3050 6050 50  0001 C CNN
F 3 "~" H 3050 6050 50  0001 C CNN
	1    3050 6050
	0    1    1    0   
$EndComp
Wire Wire Line
	3150 6050 3200 6050
$Comp
L Device:Jumper_NO_Small JP1
U 1 1 5C7652AE
P 2800 6400
F 0 "JP1" V 2754 6352 50  0000 R CNN
F 1 "GND_Jumper" V 2845 6352 50  0000 R CNN
F 2 "TE-CONNECTIVITY:382811-8" H 2800 6400 50  0001 C CNN
F 3 "~" H 2800 6400 50  0001 C CNN
	1    2800 6400
	0    -1   1    0   
$EndComp
Wire Wire Line
	2800 6050 2950 6050
Wire Wire Line
	2800 5500 2800 5600
Wire Wire Line
	2800 6500 2800 6600
Wire Wire Line
	2800 6600 3250 6600
Wire Notes Line
	4200 7450 2500 7450
Wire Notes Line
	2500 7450 2500 5150
Wire Notes Line
	2500 5150 4200 5150
Wire Notes Line
	4200 5150 4200 7450
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5C77094D
P 3500 5600
F 0 "#FLG0101" H 3500 5675 50  0001 C CNN
F 1 "PWR_FLAG" V 3500 5750 50  0000 L CNN
F 2 "" H 3500 5600 50  0001 C CNN
F 3 "~" H 3500 5600 50  0001 C CNN
	1    3500 5600
	0    1    1    0   
$EndComp
Connection ~ 3500 5600
Wire Wire Line
	3500 5600 3500 5500
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5C770BAD
P 2800 5600
F 0 "#FLG0102" H 2800 5675 50  0001 C CNN
F 1 "PWR_FLAG" V 2800 5150 50  0000 L CNN
F 2 "" H 2800 5600 50  0001 C CNN
F 3 "~" H 2800 5600 50  0001 C CNN
	1    2800 5600
	0    -1   -1   0   
$EndComp
Connection ~ 2800 5600
Wire Wire Line
	3350 6600 3350 6800
Wire Wire Line
	3250 6600 3250 6800
Connection ~ 2800 6050
Wire Wire Line
	2800 6050 2800 6300
Connection ~ 3500 6050
Wire Wire Line
	3500 5600 3500 6050
Wire Wire Line
	2800 5600 2800 6050
$Comp
L Connector:TestPoint TP1
U 1 1 5C767325
P 1300 3000
F 0 "TP1" H 1242 3027 50  0000 R CNN
F 1 "SCL" H 1242 3118 50  0000 R CNN
F 2 "TestPoint:TestPoint_Keystone_5000-5004_Miniature" H 1500 3000 50  0001 C CNN
F 3 "~" H 1500 3000 50  0001 C CNN
	1    1300 3000
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 5C76793B
P 1600 3000
F 0 "TP2" H 1542 3027 50  0000 R CNN
F 1 "SDA" H 1542 3118 50  0000 R CNN
F 2 "TestPoint:TestPoint_Keystone_5000-5004_Miniature" H 1800 3000 50  0001 C CNN
F 3 "~" H 1800 3000 50  0001 C CNN
	1    1600 3000
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 5C768E63
P 1900 3000
F 0 "TP3" H 1842 3027 50  0000 R CNN
F 1 "MISO" H 1842 3118 50  0000 R CNN
F 2 "TestPoint:TestPoint_Keystone_5000-5004_Miniature" H 2100 3000 50  0001 C CNN
F 3 "~" H 2100 3000 50  0001 C CNN
	1    1900 3000
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 5C769523
P 2200 3000
F 0 "TP4" H 2142 3027 50  0000 R CNN
F 1 "MOSI" H 2142 3118 50  0000 R CNN
F 2 "TestPoint:TestPoint_Keystone_5000-5004_Miniature" H 2400 3000 50  0001 C CNN
F 3 "~" H 2400 3000 50  0001 C CNN
	1    2200 3000
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP5
U 1 1 5C76A83B
P 2500 3000
F 0 "TP5" H 2442 3027 50  0000 R CNN
F 1 "SCK" H 2442 3118 50  0000 R CNN
F 2 "TestPoint:TestPoint_Keystone_5000-5004_Miniature" H 2700 3000 50  0001 C CNN
F 3 "~" H 2700 3000 50  0001 C CNN
	1    2500 3000
	-1   0    0    1   
$EndComp
Text GLabel 1900 3000 1    50   Input ~ 0
D12
Text GLabel 2200 3000 1    50   Input ~ 0
D11
Text GLabel 2500 3000 1    50   Input ~ 0
D13
Text GLabel 1300 3000 1    50   Input ~ 0
A5
Text GLabel 1600 3000 1    50   Input ~ 0
A4
$Comp
L Connector:TestPoint TP6
U 1 1 5C76D96D
P 2800 3000
F 0 "TP6" H 2742 3027 50  0000 R CNN
F 1 "5V" H 2742 3118 50  0000 R CNN
F 2 "TestPoint:TestPoint_Keystone_5000-5004_Miniature" H 3000 3000 50  0001 C CNN
F 3 "~" H 3000 3000 50  0001 C CNN
	1    2800 3000
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP7
U 1 1 5C76DD3D
P 3050 3000
F 0 "TP7" H 2992 3027 50  0000 R CNN
F 1 "3V3" H 2992 3118 50  0000 R CNN
F 2 "TestPoint:TestPoint_Keystone_5000-5004_Miniature" H 3250 3000 50  0001 C CNN
F 3 "~" H 3250 3000 50  0001 C CNN
	1    3050 3000
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP8
U 1 1 5C76E2EC
P 3350 3000
F 0 "TP8" H 3292 3027 50  0000 R CNN
F 1 "GND" H 3292 3118 50  0000 R CNN
F 2 "TestPoint:TestPoint_Keystone_5000-5004_Miniature" H 3550 3000 50  0001 C CNN
F 3 "~" H 3550 3000 50  0001 C CNN
	1    3350 3000
	-1   0    0    1   
$EndComp
Text GLabel 2800 3000 1    50   Input ~ 0
5V
Text GLabel 3350 3000 1    50   Input ~ 0
GND
Text GLabel 3050 3000 1    50   Input ~ 0
3V3
Wire Notes Line
	1100 3400 3800 3400
Wire Notes Line
	3800 2700 1100 2700
Wire Notes Line
	1100 2700 1100 3400
Wire Notes Line
	3800 2700 3800 3400
Text Notes 2150 3350 0    50   ~ 0
TEST POINTS\n
$EndSCHEMATC
