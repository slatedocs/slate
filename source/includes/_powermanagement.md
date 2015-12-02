# Power Management API (0x02)

## Get Battery Level (State of Charge)

```c
GET_BAT_LEVEL 0x00
```


|HEADER(0-3)|Command|Bit 0|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|Reserved|Mode[1:0]|Direction|

Note: When requested over BLE, this command will not get a response out of the Neblina Custom Characteristic.  Bluetooth standardizes the battery information.  To get the battery level via BLE, simply read it from the standard org.bluetooth.characteristic.battery_level characteristic (0x2A19).

This command is usually used internally within Neblina between the application processor and the radio IC.  It would therefore only apply for advanced users who want to program inside the Neblina module.

Regarding the power management's single command, the data consists of only 2 valid bytes (Byte#8-9), representing the percentage of the battery level with one decimal fractional digit precision, i.e., an unsigned integer within the range of [0, 1000]:
Byte#8: battery level (%), Least Significant Byte (LSB)
Byte#9: battery level (%), Most Significant Byte (MSB)
