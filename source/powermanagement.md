# Power Management API (0x02)
Here are the commands associated with the power management subsystem.

```c
#define POWERMGMT_CMD_GET_BAT_LEVEL   0x00
#define POWERMGMT_CMD_GET_TEMPERATURE 0x01
```

## Get Battery Level (State of Charge) Command (0x00)


|HEADER(0-3)|Command|Bit 0|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|Reserved|Mode[1:0]|Direction|

Note: When requested over BLE, this command will not get a response out of the Neblina Custom Characteristic.  Bluetooth standardizes the battery information.  To get the battery level via BLE, simply read it from the standard org.bluetooth.characteristic.battery_level characteristic (0x2A19).

This command is usually used internally within Neblina between the application processor and the radio IC.  It would therefore only apply for advanced users who want to program inside the Neblina module.

Regarding the get battery level command, the data consists of only 2 valid bytes (Byte#8-9), representing the percentage of the battery level with one decimal fractional digit precision, i.e., an unsigned integer within the range of [0, 1000]:
Byte#8: battery level (%), Least Significant Byte (LSB)
Byte#9: battery level (%), Most Significant Byte (MSB)

## Get Board Temperature Command (0x01)
Note: When requested over BLE, this command will not get a response out of the Neblina Custom Characteristic.  Bluetooth standardizes the temperature information.  To get the temperature via BLE, simply read it from the standard org.bluetooth.characteristic.temperature characteristic.

This command is usually used internally within Neblina between the application processor and the radio IC.  It would therefore only apply for advanced users who want to program inside the Neblina module. In the command mode, the packet has reserved bytes for the data section completely. 

In the response mode, Neblina will first send an acknowledge packet confirming the successful receipt of the command. Next, a response packet is prepared to report the board temperature in Celsius degrees as a 16-bit signed integer value (Byte 8-9) with two fractional decimal digits precision, i.e.,

```c
temperature = round(x*100)
```
where x is the actual temperature in Celsius degrees. Hence, we have:

##### Byte#8: temperature, Least Significant Byte (LSB)
##### Byte#9: temperature, Most Significant Byte (MSB)

All other bytes are reserved in the data section.
