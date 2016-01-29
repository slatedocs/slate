# Arduino-GPRS

The GPRS Shield is compatible with all boards which have the same form factor (and pinout) as a standard Arduino Board. The GPRS Shield is configured and controlled via its UART using simple AT commands. Based on the SIM900 module from SIMCOM, the GPRS Shield is like a cell phone. Besides the communications features, the GPRS Shield has 12 GPIOs, 2 PWMs and an ADC.

## Introduction

Here you will learn how to send a simple or multiple values to the Ubidots API  and how to get the last value of one variable of your Ubidots account,using an Arduino GPRS shield and Ubidots library.

## Components

* [Arduino uno](http://arduino.cc/en/Main/ArduinoBoardUno)
  ![Ups!](../images/devices/arduino-uno.png)

* [A GPRS shield SIM900](http://www.seeedstudio.com/depot/GPRS-Shield-V20-p-1379.html)
  ![Ups!](../images/devices/gprs.jpg)

* Arduino IDE 1.6.0 or higher:
    * [Windows](https://www.arduino.cc/download_handler.php?f=/arduino-1.6.7-windows.exe)
    * [Mac](https://www.arduino.cc/download_handler.php?f=/arduino-1.6.7-macosx.zip)
    * [Linux 32 Bits](https://www.arduino.cc/download_handler.php?f=/arduino-1.6.7-linux32.tar.xz)
    * [Linux 64 Bits](https://www.arduino.cc/download_handler.php?f=/arduino-1.6.7-linux64.tar.xz)

* [Ubidots Arduino GPRS library](https://github.com/ubidots/ubidots-arduino-gprs/archive/1.0.0.zip)

## First steps

First of all you will need to set up the Ubidots_Arduino_GPRS library into Arduino IDE, for this please go to Arduino IDE click on Sketch -> Include Library -> Add .ZIP Library. Now go where you saved Ubidots_Arduino_GPRS library and select it.

## Examples with Arduino GPRS shield

When you have done with the first steps go to Sketch -> examples -> Ubidots_Arduino_GPRS and you will see three examples:

### Ubidots save value

This example is to save a variable value to the Ubidots API. The code inside the library is like this:

```c++
#include <Ubidots_Arduino_GPRS.h>
#include <SoftwareSerial.h> 
//Serial Relay - Arduino will patch a 
//serial link between the computer and the GPRS Shield
//at 19200 bps 8-N-1
//Computer is connected to Hardware UART
//GPRS Shield is connected to the Software UART 

#define APN "Your_apn_of_your_SIM_here" 
#define USER "Your_username_here"  // if your apn doesnt have username just put ""
#define PASS "Your_password_here"  // if your apn doesnt have password just put ""
#define TOKEN "Your_token_here"  // Remplace it with your token
#define ID "Your_id_here" // Remplace it with your variable ID
Ubidots client(TOKEN);

void setup() {
  Serial.begin(19200);             // the Serial port of Arduino baud rate.  
  client.powerUpOrDown();
  client.setApn(APN,USER,PASS);
}

void loop() {
  float value = analogRead(A0);  // Reading analog pin A0
  client.saveValue(value,ID);  
  delay(600);  // 600 milliseconds 
}
```


### Ubidots get value

This example is to get the last value of a variable from your Ubidots account. The code inside the library is like this:

```c++
#include <Ubidots_Arduino_GPRS.h>
#include <SoftwareSerial.h> 
//Serial Relay - Arduino will patch a 
//serial link between the computer and the GPRS Shield
//at 19200 bps 8-N-1
//Computer is connected to Hardware UART
//GPRS Shield is connected to the Software UART 

#define APN "Your_apn_of_your_SIM_here" 
#define USER "Your_username_here"  // if your apn doesnt have username just put ""
#define PASS "Your_password_here"  // if your apn doesnt have password just put ""
#define TOKEN "Your_token_here"  // Remplace it with your token
#define ID "Your_id_here" // Remplace it with your variable ID

Ubidots client(TOKEN);  
  
void setup() {
  Serial.begin(19200);             // the Serial port of Arduino baud rate.  
  client.powerUpOrDown();
  client.setApn(APN,USER,PASS);
}

void loop() {
  float value = client.getValue(ID);
  Serial.println(value);
  delay(600);  // 600 milliseconds 
  Serial.println(value);
}

```

### Ubidots save multiple variables 

This example is to send multiple variables to Ubidots API, max quantity of variable is ten, in addition you could send two context inside each variable to the Ubidots API. The code inside the library is like this:

```c++
#include <Ubidots_Arduino_GPRS.h>
#include <SoftwareSerial.h> 
//Serial Relay - Arduino will patch a 
//serial link between the computer and the GPRS Shield
//at 19200 bps 8-N-1
//Computer is connected to Hardware UART
//GPRS Shield is connected to the Software UART 

#define APN "Your_apn_of_your_SIM_here" 
#define USER "Your_username_here"  // if your apn doesnt have username just put ""
#define PASS "Your_password_here"  // if your apn doesnt have password just put ""
#define TOKEN "Your_token_here"  // Remplace it with your token
// You can send 1 to 10 variable at the same time
#define ID1 "Your_id_here" // Remplace it with your variable ID
#define ID2 "Your_id_here" // Remplace it with your variable ID
#define ID3 "Your_id_here" // Remplace it with your variable ID
#define ID4 "Your_id_here" // Remplace it with your variable ID
#define ID5 "Your_id_here" // Remplace it with your variable ID
#define ID6 "Your_id_here" // Remplace it with your variable ID

Ubidots client(TOKEN);  
  
void setup() {
  Serial.begin(19200);             // the Serial port of Arduino baud rate.  
  client.powerUpOrDown();
  client.setApn(APN,USER,PASS);
}

void loop() {
  float value_1 = analogRead(A0);
  float value_2 = analogRead(A1);
  float value_3 = analogRead(A2);
  float value_4 = analogRead(A3);
  float value_5 = analogRead(A4);
  float value_6 = analogRead(A5);
  // To send a value with a context is like: (ID,value,"NAME_CONTEXT:VALUE_CONTEXT","NAME_CONTEXT_2:VALUE_CONTEXT_2")
  // If you don't want to send any context only put "" like this (ID,value,"","")
  // Example:
  // client.add(ID1, value_1, "Color:Red", "Sensor:Temp");

  client.add(ID1,value_1, "name_context_1:value_context_1", "name_context_2:value_context_2"); 
  client.add(ID2,value_2, "name_context_1:value_context_1", "name_context_2:value_context_2");
  client.add(ID3,value_3, "name_context_1:value_context_1", "name_context_2:value_context_2");
  client.add(ID4,value_4, "name_context_1:value_context_1", "name_context_2:value_context_2");
  client.add(ID5,value_5, "name_context_1:value_context_1", "name_context_2:value_context_2");
  client.add(ID6,value_6, "name_context_1:value_context_1", "name_context_2:value_context_2");
  client.sendAll();
}
```


## Conclusion

With Ubidots_Arduino_GPRS library you could send from one to ten variables to the Ubidots API and you could get the last value of one of your variables of your Ubidots account.

## Similar projects...


Check out other cool projects using Ubidots:

* :ref:`devices/fona`
* :ref:`devices/arduino-wiznet`
* :ref:`devices/dragino`
