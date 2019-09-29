EESchema Schematic File Version 4
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L RF_Module:ESP-12E U1
U 1 1 5D799B33
P 2500 2400
F 0 "U1" H 2500 3381 50  0000 C CNN
F 1 "ESP-12E" H 2500 3290 50  0000 C CNN
F 2 "nodemcu:ESP-12E_2" H 2500 2400 50  0001 C CNN
F 3 "http://wiki.ai-thinker.com/_media/esp8266/esp8266_series_modules_user_manual_v1.1.pdf" H 2150 2500 50  0001 C CNN
	1    2500 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 1900 3450 1900
Wire Wire Line
	3100 2100 3450 2100
Wire Wire Line
	1900 2000 1550 2000
Wire Wire Line
	3100 1800 3450 1800
$Comp
L pspice:R R1
U 1 1 5D79AE50
P 1300 1800
F 0 "R1" V 1400 1800 50  0000 C CNN
F 1 "10K" V 1300 1800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 1300 1800 50  0001 C CNN
F 3 "~" H 1300 1800 50  0001 C CNN
	1    1300 1800
	0    -1   -1   0   
$EndComp
$Comp
L pspice:R R2
U 1 1 5D79BBEE
P 1300 2000
F 0 "R2" V 1400 2000 50  0000 C CNN
F 1 "10K" V 1300 2000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 1300 2000 50  0001 C CNN
F 3 "~" H 1300 2000 50  0001 C CNN
	1    1300 2000
	0    -1   -1   0   
$EndComp
$Comp
L pspice:R R6
U 1 1 5D79C794
P 4300 2700
F 0 "R6" V 4400 2700 50  0000 C CNN
F 1 "10K" V 4300 2700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P5.08mm_Vertical" H 4300 2700 50  0001 C CNN
F 3 "~" H 4300 2700 50  0001 C CNN
	1    4300 2700
	0    -1   -1   0   
$EndComp
Text Label 3450 1600 0    50   ~ 0
3V3
Text Label 1450 1700 0    50   ~ 0
RST
Text Label 950  2000 0    50   ~ 0
3V3
Text Label 950  1800 0    50   ~ 0
3V3
Text Label 3450 3100 0    50   ~ 0
GND
Text Label 4550 2700 0    50   ~ 0
GND
Text Label 3450 1800 0    50   ~ 0
GPIO0
Text Label 3450 1900 0    50   ~ 0
TX
Text Label 3450 2100 0    50   ~ 0
RX
$Comp
L Device:C C2
U 1 1 5D7A5163
P 6550 3400
F 0 "C2" V 6298 3400 50  0000 C CNN
F 1 "100 nF" V 6389 3400 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W2.0mm_P2.50mm" H 6588 3250 50  0001 C CNN
F 3 "~" H 6550 3400 50  0001 C CNN
	1    6550 3400
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x04_Male J3
U 1 1 5D7ACA73
P 7700 2550
F 0 "J3" H 7808 2831 50  0000 C CNN
F 1 "SERIAL" H 7808 2740 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Horizontal" H 7700 2550 50  0001 C CNN
F 3 "~" H 7700 2550 50  0001 C CNN
	1    7700 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 2450 8300 2450
Wire Wire Line
	7900 2550 8300 2550
Wire Wire Line
	7900 2650 8300 2650
Wire Wire Line
	7900 2750 8300 2750
Text Label 8300 2450 0    50   ~ 0
3V3
Text Label 8300 2550 0    50   ~ 0
TX
Text Label 8300 2650 0    50   ~ 0
RX
Text Label 8300 2750 0    50   ~ 0
GND
$Comp
L Device:CP1 C3
U 1 1 5D7AB693
P 6550 3000
F 0 "C3" V 6298 3000 50  0000 C CNN
F 1 "100nF" V 6389 3000 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 6550 3000 50  0001 C CNN
F 3 "~" H 6550 3000 50  0001 C CNN
	1    6550 3000
	0    1    1    0   
$EndComp
$Comp
L Regulator_Linear:AMS1117-3.3 U2
U 1 1 5D7AF3FE
P 6200 2600
F 0 "U2" H 6200 2842 50  0000 C CNN
F 1 "AMS1117-3.3" H 6200 2751 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 6200 2800 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 6300 2350 50  0001 C CNN
	1    6200 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 2600 6750 2600
Text Label 5500 2600 0    50   ~ 0
5V
Text Label 6900 2600 0    50   ~ 0
3V3
Text Label 6200 3550 0    50   ~ 0
GND
$Comp
L Device:CP1 C4
U 1 1 5D7B4430
P 5850 3000
F 0 "C4" V 5598 3000 50  0000 C CNN
F 1 "100nF" V 5689 3000 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 5850 3000 50  0001 C CNN
F 3 "~" H 5850 3000 50  0001 C CNN
	1    5850 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5500 2600 5700 2600
Wire Wire Line
	6200 2900 6200 3000
Wire Wire Line
	5700 3000 5700 2600
Connection ~ 5700 2600
Wire Wire Line
	5700 2600 5900 2600
Wire Wire Line
	6000 3000 6200 3000
Connection ~ 6200 3000
Wire Wire Line
	6400 3000 6200 3000
Wire Wire Line
	6700 3000 6750 3000
Wire Wire Line
	6750 3000 6750 2600
Connection ~ 6750 2600
Wire Wire Line
	6750 2600 6800 2600
Wire Wire Line
	6200 3000 6200 3400
Wire Wire Line
	6400 3400 6200 3400
Connection ~ 6200 3400
Wire Wire Line
	6200 3400 6200 3550
Wire Wire Line
	6700 3400 6800 3400
Wire Wire Line
	6800 3400 6800 2600
Connection ~ 6800 2600
Wire Wire Line
	6800 2600 6900 2600
$Comp
L Switch:SW_Push SW2
U 1 1 5D79E0A0
P 6200 1850
F 0 "SW2" H 6200 2135 50  0000 C CNN
F 1 "Boton Reset" H 6200 2044 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_DIP_SPSTx01_Slide_6.7x4.1mm_W6.73mm_P2.54mm_LowProfile_JPin" H 6200 2050 50  0001 C CNN
F 3 "~" H 6200 2050 50  0001 C CNN
	1    6200 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 1850 5800 1850
Wire Wire Line
	6400 1850 6700 1850
Text Label 5600 1850 0    50   ~ 0
GND
Text Label 6800 1850 0    50   ~ 0
RST
$Comp
L Device:CP1 C1
U 1 1 5D7A3683
P 6200 2150
F 0 "C1" V 5948 2150 50  0000 C CNN
F 1 "100nF" V 6039 2150 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 6200 2150 50  0001 C CNN
F 3 "~" H 6200 2150 50  0001 C CNN
	1    6200 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	6050 2150 5800 2150
Wire Wire Line
	5800 2150 5800 1850
Connection ~ 5800 1850
Wire Wire Line
	5800 1850 5600 1850
Wire Wire Line
	6350 2150 6700 2150
Wire Wire Line
	6700 2150 6700 1850
Connection ~ 6700 1850
Wire Wire Line
	6700 1850 6800 1850
Wire Wire Line
	6000 1350 5600 1350
Wire Wire Line
	6400 1350 6800 1350
Text Label 5600 1350 0    50   ~ 0
GND
$Comp
L Switch:SW_Push SW1
U 1 1 5D79D187
P 6200 1350
F 0 "SW1" H 6200 1635 50  0000 C CNN
F 1 "Boton Flash" H 6200 1544 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_DIP_SPSTx01_Slide_6.7x4.1mm_W6.73mm_P2.54mm_LowProfile_JPin" H 6200 1550 50  0001 C CNN
F 3 "~" H 6200 1550 50  0001 C CNN
	1    6200 1350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 5D7F8127
P 7700 3150
F 0 "J5" H 7808 3331 50  0000 C CNN
F 1 "ALIMENTACIÓN" H 7808 3240 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7700 3150 50  0001 C CNN
F 3 "~" H 7700 3150 50  0001 C CNN
	1    7700 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3150 8300 3150
Wire Wire Line
	7900 3250 8300 3250
Text Label 8300 3150 0    50   ~ 0
5V
Text Label 8300 3250 0    50   ~ 0
GND
Text Label 6800 1350 0    50   ~ 0
GPIO0
$Comp
L RF_Module:RFM95W-868S2 U3
U 1 1 5D90EBDF
P 2500 4100
F 0 "U3" H 2500 4781 50  0000 C CNN
F 1 "RFM95W" H 2500 4690 50  0000 C CNN
F 2 "RF_Module:HOPERF_RFM9XW_SMD" H -800 5750 50  0001 C CNN
F 3 "https://www.hoperf.com/data/upload/portal/20181127/5bfcbea20e9ef.pdf" H -800 5750 50  0001 C CNN
	1    2500 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 3600 1600 3600
Text Label 1600 3600 0    50   ~ 0
3V3
Wire Wire Line
	2600 4700 2500 4700
Wire Wire Line
	2500 4700 2400 4700
Connection ~ 2500 4700
Text Label 1600 4700 0    50   ~ 0
GND
Connection ~ 2400 4700
Wire Wire Line
	2400 4700 1600 4700
Wire Wire Line
	3000 3800 3250 3800
Wire Wire Line
	2000 3800 1600 3800
Wire Wire Line
	2000 3900 1600 3900
Wire Wire Line
	2000 4000 1600 4000
Wire Wire Line
	2000 4100 1600 4100
Wire Wire Line
	3000 4500 3250 4500
Wire Wire Line
	3000 4400 3250 4400
Text Label 1600 3800 0    50   ~ 0
SCK
Text Label 1600 3900 0    50   ~ 0
MOSI
Text Label 1600 4000 0    50   ~ 0
MISO
Text Label 1600 4100 0    50   ~ 0
NSS
Text Label 3250 3800 0    50   ~ 0
ANT
Text Label 3250 4400 0    50   ~ 0
DIO1
Text Label 3250 4500 0    50   ~ 0
DIO2
Wire Wire Line
	3100 2400 3450 2400
Wire Wire Line
	3100 2500 3450 2500
Wire Wire Line
	3100 2600 3450 2600
Wire Wire Line
	3100 2700 3800 2700
Wire Wire Line
	3800 2700 3800 2800
Wire Wire Line
	3800 2800 3900 2800
Connection ~ 3800 2700
Wire Wire Line
	3800 2700 4050 2700
Text Label 3900 2800 0    50   ~ 0
NSS
Text Label 3450 2600 0    50   ~ 0
SCK
Text Label 3450 2500 0    50   ~ 0
MOSI
Text Label 3450 2400 0    50   ~ 0
MISO
Wire Wire Line
	3100 2200 3450 2200
Wire Wire Line
	3100 2300 3450 2300
Text Label 3450 2200 0    50   ~ 0
DIO1
Text Label 3450 2300 0    50   ~ 0
DIO2
Wire Wire Line
	2500 3100 3450 3100
Wire Wire Line
	2500 1600 3450 1600
Wire Wire Line
	1550 1800 1650 1800
Wire Wire Line
	1450 1700 1650 1700
Wire Wire Line
	1650 1700 1650 1800
Connection ~ 1650 1800
Wire Wire Line
	1650 1800 1900 1800
Wire Wire Line
	1050 1800 950  1800
Wire Wire Line
	1050 2000 950  2000
Wire Wire Line
	3100 2000 3450 2000
Wire Wire Line
	3100 2800 3450 2800
Text Label 3450 2800 0    50   ~ 0
SDA
Text Label 3450 2000 0    50   ~ 0
SCL
$Comp
L Connector:Conn_Coaxial J2
U 1 1 5D96C96E
P 4150 3800
F 0 "J2" H 4250 3775 50  0000 L CNN
F 1 "Conn_Coaxial" H 4250 3684 50  0000 L CNN
F 2 "Connector_Coaxial:SMA_Amphenol_901-144_Vertical" H 4150 3800 50  0001 C CNN
F 3 " ~" H 4150 3800 50  0001 C CNN
	1    4150 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 3800 3650 3800
Wire Wire Line
	4150 4000 3650 4000
Text Label 3650 3800 0    50   ~ 0
ANT
Text Label 3650 4000 0    50   ~ 0
GND
$Comp
L Connector:Conn_01x04_Male J4
U 1 1 5D982498
P 7700 3850
F 0 "J4" H 7808 4131 50  0000 C CNN
F 1 "OLED" H 7808 4040 50  0000 C CNN
F 2 "Display2:I2C_SSD1306" H 7700 3850 50  0001 C CNN
F 3 "~" H 7700 3850 50  0001 C CNN
	1    7700 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3750 8300 3750
Wire Wire Line
	7900 3850 8300 3850
Wire Wire Line
	7900 3950 8300 3950
Wire Wire Line
	7900 4050 8300 4050
Text Label 8300 3750 0    50   ~ 0
3V3
Text Label 8300 3850 0    50   ~ 0
GND
Text Label 8300 3950 0    50   ~ 0
SCL
Text Label 8300 4050 0    50   ~ 0
SDA
NoConn ~ 2000 4300
NoConn ~ 3000 4000
NoConn ~ 3000 4100
NoConn ~ 3000 4200
NoConn ~ 3000 4300
NoConn ~ 1900 2200
NoConn ~ 1900 2400
NoConn ~ 1900 2500
NoConn ~ 1900 2600
NoConn ~ 1900 2700
NoConn ~ 1900 2800
NoConn ~ 1900 2900
$EndSCHEMATC
