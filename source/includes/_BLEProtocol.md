# Neblina - Data Format

## General Format
The general format of the packets being transferred between Neblina and the host application is as follows:
<!---
```c
Bytes#0-3: Header Section
Bytes#4-19: Data Section
```
-->
| Bytes 0-3      | Bytes 4-19    |
|----------------|---------------|
| Header Section | Data Section  |

The **Header Section** is used to route the commands from the application (e.g. an iPhone) to the Neblina module and identify the responses back from Neblina and destined for the application.

Based on the **Header Section** a command will be directed to the appropriate subsystem which can be the radio IC of the Neblina or the motion processor.  In other systems, some commands may be passed on to peripheral devices, so the protocol allows for scalability.  The **Data Section** will vary depending on the subsystem interpreting the command.

For example, commands destined to the Motion Engine subsystem will have a header with 0x01 in the subsystem value.

### Header Section
The header section consists of four bytes.

|  Byte 0 (bit_7) |    Byte 0 (bit_6)   | Byte 0 (bit_5_0) |  Byte 1   | Byte 2 |   Byte 3   |
|-----------------|---------------------|------------------|-----------|--------|------------|
|    Error Log    |Command/Response Mode| Subsystem value  |data length|  CRC   |Command Type|

###### Byte#0: Subsystem
```c 
Bit#7: (Error Log) 
```
If set to 1, it shows that the packet is an error log command/response associated with the subsystem represented by Bits#6-0. Otherwise, if set to 0, it shows that the packet is a regular command/response associated with the subsystem represented by Bits#6-0.
```c 
Bit#6: (Command/Response mode) 
```
If set to 1, it shows that the packet is a command from the host to the target device. Otherwise, the packet is a response from the target to the host.
```c 
Bits#5-0: (Subsystem value)
```
This is the subsystem index, which currently has three modes: 

0. **0x00 [Debug Subsystem](_debug.md)**: Information about the device, special modes, etc.
1. **0x01 [Motion Engine](_motionenginepackets.md)**: Motion data information, orientation, quaternions, trajectories, etc.
2. **0x02 [Power Management](_powermanagement.md)**: Battery information, voltages and other information related to the power management IC
3. **0x03 [Digital IO](_digitalio.md)**: Digital IO on the module
4. **0x04 [LEDs or indicators](_led.md)**: LEDs (unicolor or RGB, backlights)
5. **0x05 [Analog to Digital Converters (ADC)](_adc.md)**
6. **0x06 [Digital to Analog Converters (DAC)](_dac.md)**

###### Byte#1: Data Section Packet Length

In this version of the API, the data format currently is set to a fixed packet length of 20 bytes including both header and data, where the data section is 16 bytes. Hence, this byte is set to the value of 0x10 = 16.  Bytes that are not used by subsystems commands and responses should be padded with zeros when the packets are created.  When packet are interpreted, no assumptions should be made on the content of the packet outside of their defined bytes fields.

Note that this fixed length attribute of the packets may change in future APIs.

###### Byte#2: CRC
The 8-bit CRC is calculated over the data section of the packet.  The polynomial is initialized to 0x00.  

```C
crc = 0;
for (i = 0; i < Len; i++)
{
    e = crc ^ pData[i];
    f = e ^ (e >> 4) ^ (e >> 7);
    crc = (f << 1) ^ (f << 4);
}
```    

The calculations are done as follow:

To create the packet, the CRC byte is set to 0xFF.  Then the CRC computation is performed on the complete packet (based on the length information), including the header.  The CRC byte is then replaced with the computed value.

To validate the CRC, the code first takes a copy of the CRC byte then set it to 0xFF.  It calculates the CRC as for transmission and then compares the calculated CRC against the copied data.

###### Byte#3: Command
Different commands can be issued identified by this field. For the power management subsystem, currently there is only one command as follows:
```c 
#define POWERMGMT_GET_BAT_LEVEL 0
```
There is also a single command corresponding to the Debug mode, that is to set the interface protocol between the host and Neblina. By default, the interface is set to BLE, but we can set the interface to UART as well. Here is the command code for setting the interface:
```c 
#define DEBUG_SET_INTERFACE 1
```


