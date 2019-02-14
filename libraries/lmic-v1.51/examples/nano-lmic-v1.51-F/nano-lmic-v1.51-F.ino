/*******************************************************************************
 * Copytight (c) 2016 Maarten Westenberg based on work of
 * Thomas Telkamp and Matthijs Kooijman porting the LMIC stack to Arduino IDE
 * and Gerben den Hartog for his tiny stack implementation with the AES library
 * that we used in the LMIC stack.
 *
 * Permission is hereby granted, free of charge, to anyone
 * obtaining a copy of this document and accompanying files,
 * to do whatever they want with them without any restriction,
 * including, but not limited to, copying, modification and redistribution.
 * NO WARRANTY OF ANY KIND IS PROVIDED.
 *
 * This example sends a valid LoRaWAN packet with sensor values read.
 * If no sensor is connected the payload is '{"Hello":"World"}', that
 * will be processed by The Things Network server.
 *
 * Note: LoRaWAN per sub-band duty-cycle limitation is enforced (1% in g1, 
 *  0.1% in g2). 
 *
 * Change DevAddr to a unique address for your node 
 * See http://thethingsnetwork.org/wiki/AddressSpace
 *
 * Do not forget to define the radio type correctly in config.h, default is:
 *   #define CFG_sx1272_radio 1
 * for SX1272 and RFM92, but change to:
 *   #define CFG_sx1276_radio 1
 * for SX1276 and RFM95.
 *
 *******************************************************************************/


/*Nodo LoRa ABP Arduino Pro Mini 3v3 Atmega328p 8MHz

  Banda de frecuencia US915 MHz
  Sub Banda 1 (903.9 - 905.3) ---> Configuración del Gateway Single Channel ESP
  Canal 0 (de la sub banda 1) ---> Configuración del Gateway Single Channel ESP
  Canal en el que envia 903.9 MHz (canal 8 de 72)

  Radio HopeRF RFM95w (SX1276) 915MHz 

  Libreria: LMiC v1.5 *Modificada*
    Modificación: lmic.cpp LMIC_disableChannel(u1_t channel) 
      //LMIC.channelMap[channel/4] &= ~(1<<(channel&0xF)); 
      LMIC.channelMap[channel/16] &= ~(1<<(channel&0xF));

  Conexión de pines:
   _____________________________
  |   RFM95w   |Arduino Pro Mini|
  |____________|________________|
  |GND         |GND             |
  |3.3v        |VCC (3.3v)      |
  |MISO        |12              |
  |MOSI        |11              |
  |SCK         |13              |
  |NSS         |10              |
  |DIO0        |4               |
  |DIO1        |5               |
  |DIO2        |7               |
  |____________|________________|

  Modificado por José Manuel Alonso
  E-mail: alonso.651@gmail.com
*/


#define WAIT_SECS 120


#if defined(__AVR__)
#include <avr/pgmspace.h>
#include <Arduino.h>
#elif defined(ARDUINO_ARCH_ESP8266)
#include <ESP.h>
#elif defined(__MKL26Z64__)
#include <Arduino.h>
#else
#error Unknown architecture in aes.cpp
#endif

#include "lmic.h"
#include "hal/hal.h"
#include <SPI.h>

//---------------------------------------------------------
// Sensor declarations
//---------------------------------------------------------

// Frame Counter
int count=0;

// LoRaWAN Application identifier (AppEUI)
// Not used in this example
static const u1_t APPEUI[8] PROGMEM = { 0x02, 0x00, 0x00, 0x00, 0x00, 0xEE, 0xFF, 0xC0 };

// LoRaWAN DevEUI, unique device ID (LSBF)
// Not used in this example
static const u1_t DEVEUI[8] PROGMEM  = { 0x42, 0x42, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF };

// LoRaWAN NwkSKey, network session key 
// Use this key for The Things Network
unsigned char NwkSkey[16] = 		{ 0xE9, 0x01, 0xE2, 0x79, 0x10, 0x18, 0xF1, 0x40, 0xB7, 0xF7, 0xBA, 0x6D, 0x5C, 0x04, 0x01, 0xB7 };

// LoRaWAN AppSKey, application session key
// Use this key to get your data decrypted by The Things Network
unsigned char AppSkey[16] =		{ 0x0E, 0xBE, 0x00, 0xE7, 0x66, 0x10, 0xE5, 0x3A, 0x19, 0x0B, 0xC6, 0x8C, 0x71, 0x1C, 0xAA, 0x22 };

// LoRaWAN end-device address (DevAddr)
// See http://thethingsnetwork.org/wiki/AddressSpace

#define msbf4_read(p)   (u4_t)((u4_t)(p)[0]<<24 | (u4_t)(p)[1]<<16 | (p)[2]<<8 | (p)[3])
unsigned char DevAddr[4] = { 0x26, 0x06, 0x2C, 0xE1 };


// ----------------------------------------------------------------------------
// APPLICATION CALLBACKS
// ----------------------------------------------------------------------------

// Define the single channel and data rate (SF) to use
// int channel = 7;
// int dr = DR_SF7;

// Disables all channels, except for the one defined above, and sets the
// data rate (SF). This only affects uplinks; for downlinks the default
// channels or the configuration from the OTAA Join Accept are used.
//
// Not LoRaWAN compliant; FOR TESTING ONLY!
//
void forceTxSingleChannelDr() {
    for(int j=0; j<71; j++) { // For EU; for US use i<71
        if(j != 8) {
            LMIC_disableChannel(j);
        }
    }
    // Set data rate (SF) and transmit power for uplink
    LMIC_setDrTxpow(DR_SF7, 14);
}

// provide application router ID (8 bytes, LSBF)
void os_getArtEui (u1_t* buf) {
    memcpy(buf, APPEUI, 8);
}

// provide device ID (8 bytes, LSBF)
void os_getDevEui (u1_t* buf) {
    memcpy(buf, DEVEUI, 8);
}

// provide device key (16 bytes)
void os_getDevKey (u1_t* buf) {
    memcpy(buf, NwkSkey, 16);
}

int debug=1;
uint8_t mydata[64];
static osjob_t sendjob;

// Pin mapping
// These settings should be set to the GPIO pins of the device
// you want to run the LMIC stack on.
//
lmic_pinmap pins = {
  .nss = 10,			// Connected to pin D10
  .rxtx = 0, 			// For placeholder only, Do not connected on RFM92/RFM95
  .rst = 0,  			// Needed on RFM92/RFM95? (probably not)
  .dio = {4, 5, 7},		// Specify pin numbers for DIO0, 1, 2
						// connected to D4, D5, D7 
};

void onEvent (ev_t ev) {
    //debug_event(ev);

    switch(ev) {
      // scheduled data sent (optionally data received)
      // note: this includes the receive window!
      case EV_TXCOMPLETE:
          // use this event to keep track of actual transmissions
          Serial.print("EV_TXCOMPLETE, tiempo: ");
          Serial.print((millis() / 1000)/2);
          Serial.println(" Segundos");
          if(LMIC.dataLen) { // data received in rx slot after tx
              //debug_buf(LMIC.frame+LMIC.dataBeg, LMIC.dataLen);
              Serial.println("Data Received");
          }
          break;
       default:
          break;
    }
}

void do_send(osjob_t* j){
	  delay(1);													// XXX delay is added for Serial
      Serial.print("Tiempo: ");
      Serial.print((millis() / 1000)/2);
      Serial.println(" Segundos");
      // Show TX channel (channel numbers are local to LMIC)
      Serial.print("Enviado. Canal: ");
      Serial.println(LMIC.txChnl);
      Serial.print("Opmode check: ");
      // Check if there is not a current TX/RX job running
    if (LMIC.opmode & (1 << 7)) {
      Serial.println("OP_TXRXPEND, not sending");
    } 
	else {
	
	  //Serial.print("ready to send: ");
	  strcpy((char *) mydata,"Arduino Pro Mini"); 
	  LMIC_setTxData2(1, mydata, strlen((char *)mydata), 0);
    }
    // Schedule a timed job to run at the given timestamp (absolute system time)
    os_setTimedCallback(j, os_getTime()+sec2osticks(WAIT_SECS), do_send);
         
}

// ====================================================================
// SETUP
//
void setup() {
  Serial.begin(115200);

  // LMIC init
  os_init();
  // Reset the MAC state. Session and pending data transfers will be discarded.
  #if defined(CFG_us915)
  LMIC.freq = 903900000;
  #endif
  LMIC_reset();
  // Set static session parameters. Instead of dynamically establishing a session 
  // by joining the network, precomputed session parameters are be provided.
  LMIC_setSession (0x1, msbf4_read(DevAddr), (uint8_t*)NwkSkey, (uint8_t*)AppSkey);
  // Disable data rate adaptation
  LMIC_setAdrMode(0);
  // Disable link check validation
  LMIC_setLinkCheckMode(0);
  // Disable beacon tracking
  LMIC_disableTracking ();
  // Stop listening for downstream data (periodical reception)
  LMIC_stopPingable();
  // Set data rate and transmit power (note: txpow seems to be ignored by the library)
  //LMIC_setDrTxpow(DR_SF7,14);

  // Only use one channel and SF
  forceTxSingleChannelDr();
  //
#if defined(__AVR__)
	Serial.println("AVR arch");
#elif defined(ARDUINO_ARCH_ESP8266)
	Serial.println("ESP arch");
#elif defined(__MKL26Z64__)
	Serial.println("Teensy arch");
#else
	Serial.println("WARNING. Unknown Arch");
#endif

}

// ================================================================
// LOOP
//
void loop() {

	do_send(&sendjob);
	while(1) {
		os_runloop_once(); 
		delay(100);
	}
}

