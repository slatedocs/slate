# Neblina - Data Format

## General Format

### Nomenclature, byte ordering, bit ordering

The Neblina platform is meant to be network-centric.  To support this concept globally and allow the packets to be transported over various mediums a lightweight stack was defined.  

The transport medium for the packets could be UDP, TCP, Bluetooth LE Characteristic (main focus of this project), Serial Interface, light pulses or electrical pulses.  The protocol is meant to be as stateless as possible.

The general format of the packets being transferred between Neblina and the host application is as follows:

| Bytes 0-3      | Bytes 4-255 (currently limited to 4-19)    |
|----------------|----------------|
| Header Section | Data Section (16 bytes in this API)  |

**Limitation**: At this time, the Data Section spans bytes 4-19 (complete packet is maxed at 20 bytes).  The protocol supports larger packets, but for the best use of the BLE MTU, a special effort is made to ensure that no packet exceed 20 bytes.  This allows more efficient transfer of real-time characteristic updates when streaming motion data.

The **Header Section** is used to route the commands from the application (e.g. an iPhone) to the Neblina module and identify the responses back from Neblina and destined for the application.

Based on the **Header Section** a command will be directed to the appropriate subsystem which can be the radio IC of the Neblina or the motion processor.  In other systems, some commands may be passed on to peripheral devices, so the protocol allows for scalability.  The **Data Section** will vary depending on the subsystem interpreting the command.

For example, commands destined to the Motion Engine subsystem will have a header with 0x01 in the subsystem value.

### Header Section
The header section consists of four bytes.

|  Byte 0  |  Byte 1 | Byte 2 |   Byte 3   |
|----------|---------|--------|------------|
|    **Control Byte (PKT_TYPE/SUB)** | data length|  CRC   |Command Type|

Control Byte Details

|  Bit 7:5 (PKT_TYPE) |   Bit 4:0 (SUB)  |
|:-------------------:|:----------------:|
|     Packet Type     |  Subsystem Code  |


#### Byte 0: Control Byte
`Bit 7:5 = (PKT_TYPE) Packet Type`

This field generally determines the type of the packet. Currently, the types include: regular command/response packets, error log command/response packets, and an acknowledge response packet from Neblina to a command issued by the host. The 8 possible combinations of the packet type field are described below:

|  Bit 7:5 (PKT_TYPE) |                    Description                    |
|:-------------------:|---------------------------------------------------|
|         000         |Regular response packet from Neblina with data     |
|         001         |Acknowledge from Neblina to a command from the host|
|         010         |Regular command packet from the host               |
|         011         |Reserved                                           |
|         100         |Error log response from Neblina                    |
|         101         |Reserved                                           |
|         110         |Error log command from the host                    |
|         111         |Reserved                                           |

Note that the above packet types are all associated with the subsystem represented by the *SUB* field. 

<!---
```c 
Bit#7: (ERR) Error Log Indicator
```
If set to 1, it shows that the packet is an error log command/response associated with the subsystem represented by *SUB*. Otherwise, if set to 0, it shows that the packet is a regular command/response associated with the subsystem represented by *SUB*.

```c 
Bit#6: (CR) Command/Response Indicator
```
If set to 1, it shows that the packet is a command from the host to the target device. Otherwise, the packet is a response from the target to the host. *Note: Target is usually the Neblina module or one of its component, host is a tablet or smartphone*

```c 
Bit#5: (ACK) Acknowledge Indicator
```
If set to 1, it shows that the packet is a simple acknowledge response from Neblina to a command issued by the host.
--->

`Bits 4:0 = (SUB) Subsystem Identifier`

This is the subsystem identifier:

0. **0x00 [Debug Subsystem](/debug.html)**: Information about the device, special modes, etc.
1. **0x01 [Motion Engine](/../motionenginepackets.html)**: Motion data information, orientation, quaternions, trajectories, acceleration, magnetic, etc.
2. **0x02 [Power Management](/powermanagement.html)**: Battery information, voltages and other information related to the power management IC
3. **0x03 [Digital IO](/digitalio.html)**: Digital IO on the module
4. **0x04 [LEDs or indicators](/led.html)**: LEDs (unicolor or RGB, backlights)
5. **0x05 [Analog to Digital Converters (ADC)](/adc.html)**: Access to module ADCs
6. **0x06 [Digital to Analog Converters (DAC)](/dac.html)**: Access to module DACs
7. **0x07 [I2C Subsystem](/i2c.html)**: Access to I2C subsystems (for programmers)
8. **0x08 [SPI Subsystem](/spi.html)**: Access to SPI subsystems (for programmers)
9. **0x09 [Firmware Management](/firmware.html)**: Firmware versions, firmware checks, self-test, serial numbers
10. **0x0A [Cryptography](/security.html)**: Cryptography peripherals, data security
11. **0x0B [Storage](/norflash.html)**: NOR Flash Recorder: recording several hours of streaming data
12. **0x0C [EEPROM](/eeprom.html)**: EEPROM Read/Write: board ID, features, etc. 

#### Byte 1: Data Section Packet Length

In this version of the API, the data format currently is set to a fixed packet length of 20 bytes (including both header and data), where the data section is 16 bytes. Hence, this byte is set to the value of 0x10 = 16.  Bytes that are not used by subsystems commands and responses should be padded with zeros when the packets are created.  When packet are interpreted, no assumptions should be made on the content of the packet outside of their defined bytes fields.

Note that this fixed length attribute of the packets may change in future APIs.

#### Byte 2: CRC
The 8-bit CRC is calculated over both the header and data sections of the packet. The polynomial is initialized to 0x00.

```c
crc = 0;
for (i = 0; i < Len; i++)
{
    e = crc ^ pData[i];
    f = e ^ (e >> 4) ^ (e >> 7);
    crc = (f << 1) ^ (f << 4);
}
```    

The calculations are done as follows:

To create the packet, the CRC byte is set to 0xFF.  Then the CRC computation is performed on the complete packet (based on the length information), including the header. The CRC byte is then replaced with the computed value.

To validate the CRC, the code first takes a copy of the CRC byte then sets it to 0xFF.  It calculates the CRC as for transmission and then compares the calculated CRC against the copied data.

#### Byte 3: Command

Commands are defined per subsystem.  Refer to the appropriate section of the documentation for command details.

Different commands can be issued identified by this field. For the power management subsystem, currently there is only one command as follows:

`#define POWERMGMT_GET_BAT_LEVEL 0`

There is also a single command corresponding to the Debug mode, that is to set the interface protocol between the host and Neblina. By default, the interface is set to BLE, but we can set the interface to UART as well. Here is the command code for setting the interface:

`#define DEBUG_SET_INTERFACE 1`
