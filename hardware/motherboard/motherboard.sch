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
F 2 "" H 3350 7000 50  0001 C CNN
F 3 "~" H 3350 7000 50  0001 C CNN
	1    3350 7000
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 6800 3250 6700
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5C5CE15B
P 3250 6700
F 0 "#FLG01" H 3250 6775 50  0001 C CNN
F 1 "PWR_FLAG" V 3250 6828 50  0000 L CNN
F 2 "" H 3250 6700 50  0001 C CNN
F 3 "~" H 3250 6700 50  0001 C CNN
	1    3250 6700
	0    -1   -1   0   
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5C5CE27E
P 3350 6700
F 0 "#FLG02" H 3350 6775 50  0001 C CNN
F 1 "PWR_FLAG" V 3350 6828 50  0000 L CNN
F 2 "" H 3350 6700 50  0001 C CNN
F 3 "~" H 3350 6700 50  0001 C CNN
	1    3350 6700
	0    1    1    0   
$EndComp
Wire Wire Line
	3350 6700 3350 6800
Text Notes 5150 7350 0    50   ~ 0
AUDIO UI
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 5C6E4D01
P 1650 6950
F 0 "J1" V 1523 7030 50  0000 L CNN
F 1 "01x02_Screw_ECG" V 1800 7250 50  0000 R CNN
F 2 "" H 1650 6950 50  0001 C CNN
F 3 "~" H 1650 6950 50  0001 C CNN
	1    1650 6950
	0    1    1    0   
$EndComp
$Comp
L ARABEAT:ECG-MODULE U3
U 1 1 5C66A653
P 8350 3100
F 0 "U3" H 8375 4065 50  0000 C CNN
F 1 "ECG-MODULE" H 8375 3974 50  0000 C CNN
F 2 "" H 8000 3700 50  0001 C CNN
F 3 "" H 8000 3700 50  0001 C CNN
	1    8350 3100
	1    0    0    -1  
$EndComp
$Comp
L ARABEAT:MCU-MODULE U2
U 1 1 5C64D1AB
P 6800 3100
F 0 "U2" H 6825 4065 50  0000 C CNN
F 1 "MCU-MODULE" H 6825 3974 50  0000 C CNN
F 2 "" H 6450 3700 50  0001 C CNN
F 3 "" H 6450 3700 50  0001 C CNN
	1    6800 3100
	1    0    0    -1  
$EndComp
Text GLabel 6350 2400 0    50   Input ~ 0
5V
Text GLabel 6350 2500 0    50   Input ~ 0
D0
Text GLabel 6350 2600 0    50   Input ~ 0
D1
Text GLabel 6350 2700 0    50   Input ~ 0
D2
Text GLabel 6350 2800 0    50   Input ~ 0
D3
Text GLabel 6350 2900 0    50   Input ~ 0
D4
Text GLabel 6350 3000 0    50   Input ~ 0
D5
Text GLabel 6350 3100 0    50   Input ~ 0
D6
Text GLabel 6350 3200 0    50   Input ~ 0
D7
Text GLabel 6350 3300 0    50   Input ~ 0
D8
Text GLabel 6350 3400 0    50   Input ~ 0
D9
Text GLabel 6350 3500 0    50   Input ~ 0
D10
Text GLabel 6350 3600 0    50   Input ~ 0
D11
Text GLabel 6350 3700 0    50   Input ~ 0
D12
Text GLabel 6350 3800 0    50   Input ~ 0
D13
Text GLabel 7300 2400 2    50   Input ~ 0
GND
Text GLabel 7300 2900 2    50   Input ~ 0
RST
Text GLabel 7300 3000 2    50   Input ~ 0
AREF
Text GLabel 7300 3100 2    50   Input ~ 0
A7
Text GLabel 7300 3200 2    50   Input ~ 0
A6
Text GLabel 7300 3300 2    50   Input ~ 0
A5
Text GLabel 7300 3400 2    50   Input ~ 0
A4
Text GLabel 7300 3500 2    50   Input ~ 0
A3
Text GLabel 7300 3600 2    50   Input ~ 0
A2
Text GLabel 7300 3700 2    50   Input ~ 0
A1
Text GLabel 7300 3800 2    50   Input ~ 0
A0
Text GLabel 7900 2400 0    50   Input ~ 0
5V
Text GLabel 7900 2700 0    50   Input ~ 0
D2
Text GLabel 7900 2800 0    50   Input ~ 0
D3
Text GLabel 7900 3200 0    50   Input ~ 0
D7
Text GLabel 7900 3600 0    50   Input ~ 0
D11
Text GLabel 7900 3700 0    50   Input ~ 0
D12
Text GLabel 7900 3800 0    50   Input ~ 0
D13
Text GLabel 8850 2400 2    50   Input ~ 0
GND
Text GLabel 8850 2500 2    50   Input ~ 0
ECGN
Text GLabel 8850 2600 2    50   Input ~ 0
ECGP
$Comp
L ARABEAT:PROTO-MODULE U5
U 1 1 5C64C99C
P 9900 3100
F 0 "U5" H 9925 4065 50  0000 C CNN
F 1 "PROTO-MODULE" H 9925 3974 50  0000 C CNN
F 2 "" H 9550 3700 50  0001 C CNN
F 3 "" H 9550 3700 50  0001 C CNN
	1    9900 3100
	1    0    0    -1  
$EndComp
Text GLabel 9450 2400 0    50   Input ~ 0
5V
Text GLabel 9450 2500 0    50   Input ~ 0
D0
Text GLabel 9450 2600 0    50   Input ~ 0
D1
Text GLabel 9450 2700 0    50   Input ~ 0
D2
Text GLabel 9450 2800 0    50   Input ~ 0
D3
Text GLabel 9450 2900 0    50   Input ~ 0
D4
Text GLabel 9450 3000 0    50   Input ~ 0
D5
Text GLabel 9450 3100 0    50   Input ~ 0
D6
Text GLabel 9450 3200 0    50   Input ~ 0
D7
Text GLabel 9450 3300 0    50   Input ~ 0
D8
Text GLabel 9450 3400 0    50   Input ~ 0
D9
Text GLabel 9450 3500 0    50   Input ~ 0
D10
Text GLabel 9450 3600 0    50   Input ~ 0
D11
Text GLabel 9450 3700 0    50   Input ~ 0
D12
Text GLabel 9450 3800 0    50   Input ~ 0
D13
Text GLabel 10400 2400 2    50   Input ~ 0
GND
Text GLabel 10400 3000 2    50   Input ~ 0
AREF
Text GLabel 10400 3100 2    50   Input ~ 0
A7
Text GLabel 10400 3200 2    50   Input ~ 0
A6
Text GLabel 10400 3300 2    50   Input ~ 0
A5
Text GLabel 10400 3400 2    50   Input ~ 0
A4
Text GLabel 10400 3500 2    50   Input ~ 0
A3
Text GLabel 10400 3600 2    50   Input ~ 0
A2
Text GLabel 10400 3700 2    50   Input ~ 0
A1
Text GLabel 10400 3800 2    50   Input ~ 0
A0
NoConn ~ 10400 2500
NoConn ~ 10400 2600
NoConn ~ 10400 2700
Text GLabel 7300 2800 2    50   Input ~ 0
3V3
Text GLabel 10400 2800 2    50   Input ~ 0
3V3
Text GLabel 1550 6750 1    50   Input ~ 0
ECGN
Text GLabel 1650 6750 1    50   Input ~ 0
ECGP
Text GLabel 3350 6600 1    50   Input ~ 0
5V
Wire Wire Line
	3250 6700 3250 6600
Connection ~ 3250 6700
Text GLabel 3250 6600 1    50   Input ~ 0
GND
Wire Wire Line
	3350 6600 3350 6700
Connection ~ 3350 6700
$Comp
L Connector:Conn_Coaxial J3
U 1 1 5C7558FB
P 4850 7000
F 0 "J3" H 4950 6884 50  0000 L CNN
F 1 "RCA_L_Female_Tweeter" H 4850 7150 50  0000 C CNN
F 2 "" H 4850 7000 50  0001 C CNN
F 3 " ~" H 4850 7000 50  0001 C CNN
	1    4850 7000
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_Coaxial J4
U 1 1 5C755B5F
P 5800 7000
F 0 "J4" H 5900 6884 50  0000 L CNN
F 1 "RCA_R_Female_Sub" H 5750 7150 50  0000 C CNN
F 2 "" H 5800 7000 50  0001 C CNN
F 3 " ~" H 5800 7000 50  0001 C CNN
	1    5800 7000
	-1   0    0    1   
$EndComp
$Comp
L ARABEAT:DSP-MODULE_IPC_J3 U1
U 1 1 5C7588B4
P 6500 5700
F 0 "U1" H 6431 7065 50  0000 C CNN
F 1 "DSP-MODULE_IPC_J3" H 6431 6974 50  0000 C CNN
F 2 "" H 4000 7050 50  0001 C CNN
F 3 "" H 4000 7050 50  0001 C CNN
	1    6500 5700
	1    0    0    -1  
$EndComp
$Comp
L ARABEAT:DSP-MODULE_IPC_J4 U4
U 1 1 5C758C0D
P 8600 5700
F 0 "U4" H 8600 7065 50  0000 C CNN
F 1 "DSP-MODULE_IPC_J4" H 8600 6974 50  0000 C CNN
F 2 "" H 6100 7050 50  0001 C CNN
F 3 "" H 6100 7050 50  0001 C CNN
	1    8600 5700
	1    0    0    -1  
$EndComp
$Comp
L ARABEAT:DSP-MODULE_RCA_J3 U6
U 1 1 5C75A43C
P 10450 5050
F 0 "U6" H 10450 5500 50  0000 L CNN
F 1 "DSP-MODULE_RCA_J3" H 10100 5400 50  0000 L CNN
F 2 "" H 7950 6400 50  0001 C CNN
F 3 "" H 7950 6400 50  0001 C CNN
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
Text GLabel 5050 7000 2    50   Input ~ 0
ROUT+
Text GLabel 4850 6800 1    50   Input ~ 0
ROUT-
Text GLabel 6000 7000 2    50   Input ~ 0
LOUT+
Text GLabel 5800 6800 1    50   Input ~ 0
LOUT-
Wire Notes Line
	4300 6300 4300 7450
Wire Notes Line
	4300 7450 6500 7450
Wire Notes Line
	6500 7450 6500 6300
Wire Notes Line
	6500 6300 4300 6300
Wire Notes Line
	4100 7450 4100 6300
Wire Notes Line
	4100 6300 2500 6300
Wire Notes Line
	2500 6300 2500 7450
Wire Notes Line
	2500 7450 4100 7450
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
Text GLabel 7800 4650 0    50   Input ~ 0
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
F 2 "" H 5200 5350 50  0001 C CNN
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
F 2 "" H 5450 5350 50  0001 C CNN
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
Wire Wire Line
	7800 4650 7900 4650
$Comp
L Device:LED D1
U 1 1 5C776010
P 7600 5100
F 0 "D1" V 7638 4982 50  0000 R CNN
F 1 "PWR_LED" V 7547 4982 50  0000 R CNN
F 2 "" H 7600 5100 50  0001 C CNN
F 3 "~" H 7600 5100 50  0001 C CNN
	1    7600 5100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7600 4950 7600 4850
Wire Wire Line
	7600 4850 7900 4850
Wire Wire Line
	7900 4850 7900 4650
Connection ~ 7900 4650
Wire Wire Line
	7900 4650 8100 4650
Text GLabel 7600 5400 3    50   Input ~ 0
GND
Wire Wire Line
	7600 5400 7600 5250
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
Text GLabel 10400 2900 2    50   Input ~ 0
RST
$EndSCHEMATC
