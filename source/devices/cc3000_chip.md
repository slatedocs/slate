## CC3000 WiFi Breakout Example (improved)

This is an updated version of the original [CC3000 Ubidots Example](http://ubidots.com/docs/devices/cc3000.html). It was submited by [Charles McClelland](http://triembed.org/blog/?page_id=154) and has the following improvements:

- Moved all the print statements to program memory as RAM gets tight
- Added code to validate that a ”201” code was received and the data was sent successfully
- Took out the delay code to reduce blocking and help with retries

Just copy the following code into a .ino file in your Arduino IDE:

```c++

	/* Chip McClelland - CC3000 Ubidots
	BSD license, Please keep my name and credits in any redistribution

	Requirements: 
	  - Account on Ubidots.  http://www.ubidots.com
	  - Sparkfun CC3000 Breakout Board - https://www.sparkfun.com/products/12072
	  - I used a 3.3V 8MHz Sparkfun Pro Micro - https://www.sparkfun.com/products/12587
	Credits:
	  - Sparkfun Library and Example code from Shawn Hymel: https://github.com/sparkfun/SFE_CC3000_Library
	  - Ubidots Demo Code from: Mateo Velez for Ubidots,Inc. Modified 15 Nov 2014
	Configuration:
	  - You will need to add your SSID and password information for WiFi
	  - Connections  
	    Hardware Connections: (Sparkfun 3.3V Pro Micro)
	    Pin       CC3000 Board    Function
	    VCC        +3.3V           POWER
	    GND        GND             GND
	    7          INT             Interrupt (Must be an interrupt pin - Mico has 5)
	    5          EN              WiFi Enable (Can be any ping)
	    10         CS              SPI Chip Select
	    11         MOSI            SPI MOSI
	    12         MISO            SPI MISO
	    13         SCK             SPI Clock
	****************************************************************/

	#include <SPI.h>
	#include <SFE_CC3000.h>
	#include <SFE_CC3000_Client.h>
	// Pins
	#define CC3000_INT      7                                // Needs to be an interrupt pin (D2/D3)
	#define CC3000_EN       5                                // Can be any digital pin
	#define CC3000_CS       10                               // Preferred is pin 10 on Uno
	// Connection info data lengths
	#define IP_ADDR_LEN     4                                // Length of IP address in bytes
	// WiFi Constants
	char ap_ssid[] = "xxxxx";          // SSID of network
	char ap_password[] = "xxxxx";               // Password of network
	unsigned int ap_security = WLAN_SEC_WPA2;      // Choose: WLAN_SEC_UNSEC, WLAN_SEC_WEP, WLAN_SEC_WPA, WLAN_SEC_WPA2
	unsigned int TimeOut = 10000;                  // Milliseconds

	// Ubidots Information
	String token = "xxxxx";  // For your account
	String idvariable = "xxxxx";  // For your variable

	// Global Variables
	SFE_CC3000 wifi = SFE_CC3000(CC3000_INT, CC3000_EN, CC3000_CS);
	SFE_CC3000_Client client = SFE_CC3000_Client(wifi);
	ConnectionInfo connection_info;
	int value = 0;
	unsigned int ReportingInterval = 60000;  // How often do you want to send to Ubidots (in millis)
	unsigned long LastReport = 0;            // Keep track of when we last sent data
	 
	void setup() 
	{
	  // Initialize Serial port
	  Serial.begin(19200);
	  while(!Serial) {}              // Wait for the Serial terminal to reinitialize
	  Serial.println();
	  Serial.println(F("---------------------------"));
	  Serial.println(F("CC3000 - Ubidots Demo Code"));
	  Serial.println(F("---------------------------"));
	  
	  // Initialize CC3000 (configure SPI communications)
	  if (wifi.init() ) {
	    Serial.println(F("CC3000 initialization complete"));
	  } 
	    else {
	    Serial.println(F("Something went wrong during CC3000 init!"));
	  }
	  Serial.print(F("Free RAM Available:"));
	  Serial.println(freeRam());
	}

	void loop() 
	{
	  if (millis() >= LastReport + ReportingInterval) {
	    GetConnected();
	    value = 234;    // This is an arbitrary number - replace with your data point
	    if(Send2Ubidots(String(value))) {
	      Serial.println(F("Data successfully sent to Ubidots"));
	      LastReport = millis();  // Reset the timer
	    }
	    else {
	      Serial.println(F("Data not accepted by Ubidots - try again"));
	    }
	    GetDisconnected();
	  }
	}

	// Here is where we send the information to Ubidots

	boolean Send2Ubidots(String value)
	{
	  char replybuffer[64];          // this is a large buffer for replies
	  int count = 0;
	  int complete = 0;
	  String var = "";
	  String le = "";
	  var="{\"value\":"+ value + "}";
	  int num=var.length();                                       // How long is the payload
	  le=String(num);                                             //this is to calcule the length of var
	  // Make a TCP connection to remote host
	  Serial.println(F("Sending Data to Ubidots"));
	   if (!client.connect("things.ubidots.com", 80)) {
	     Serial.println(F("Error: Could not make a TCP connection"));
	   }   
	   // Make a HTTP GET request
	   client.print(F("POST /api/v1.6/variables/"));
	   client.print(idvariable);
	   client.println(F("/values HTTP/1.1"));
	   client.println(F("Content-Type: application/json"));
	   client.print(F("Content-Length: "));
	   client.println(le);
	   client.print(F("X-Auth-Token: "));
	   client.println(token);
	   client.println(F("Host: things.ubidots.com"));
	   client.println();
	   client.println(var);
	   client.println();
	   // See if Ubidots acknowledges the creation of a new "dot" with a "201" code
	   unsigned long commandClock = millis();                      // Start the timeout clock
	   while(!complete && millis() <= commandClock + TimeOut)         // Need to give the modem time to complete command 
	   {
	      while(!client.available() &&  millis() <= commandClock + TimeOut);  // Keep checking to see if we have data coming in
	      while (client.available()) {
	         replybuffer[count] = client.read();
	         count++;
	         if(count==63) break;
	       }
	      Serial.print(F("count="));
	      Serial.print(count);
	      Serial.print(F(" - Reply: "));
	      for (int i=0; i < count; i++) {
	        if (replybuffer[i] != '\n') Serial.write(replybuffer[i]);
	      }
	      Serial.println("");                           // Uncomment if needed to debug
	      for (int i=0; i < count; i++) {
	        if(replybuffer[i]=='2' && replybuffer[i+1]=='0' && replybuffer[i+2] == '1') {  // here is where we parse "201"
	          complete = 1;
	         break;
	        }
	      }
	    }

	  if (complete ==1) return 1;            // Returns "True"  if we get the 201 response
	  else return 0;
	}

	// Disconnect from Wifi
	void GetDisconnected()
	{
	  Serial.println(F("Disconnecting"));
	  // Close socket
	  if ( !client.close() ) {
	    Serial.println(F("Error: Could not close socket"));
	  }
	  // Disconnect WiFi
	  if ( !wifi.disconnect() ) {
	    Serial.println(F("Error: Could not disconnect from network"));
	  }
	}

	 
	// Connection to Wifi 
	void GetConnected()
	{
	  // Connect using DHCP
	  Serial.print(F("Connecting to SSID: "));
	  Serial.println(ap_ssid);
	  if(!wifi.connect(ap_ssid, ap_security, ap_password, TimeOut)) {
	    Serial.println(F("Error: Could not connect to AP"));
	  }
	  // Gather connection details and print IP address
	  if (!wifi.getConnectionInfo(connection_info)) {
	    Serial.println(F("Error: Could not obtain connection details"));
	  } 
	  else {
	    Serial.print(F("IP Address: "));
	    for (int i = 0; i < IP_ADDR_LEN; i++) {
	      Serial.print(connection_info.ip_address[i]);
	      if ( i < IP_ADDR_LEN - 1 ) {
	        Serial.print(F("."));
	      }
	    }
	    Serial.println();
	  }
	}
	         
	// Debugging code, to check usage of RAM
	// Example Call: Serial.println(freeRam());
	int freeRam () {
	  extern int __heap_start, *__brkval; 
	  int v; 
	  return (int) &v - (__brkval == 0 ? (int) &__heap_start : (int) __brkval); 
	}
```