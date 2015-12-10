# EEPROM (0x0C)

The EEPROM subsystem exists only on the ProMotion board and it uses subsystem ID 0x0C. The EEPROM is currently configured to have 2K bytes of data available for read/write operations. Users can assign ID numbers or other features to each individual board and store the information in the EEPROM. The read/write commands can only be done per page, where each page is 8 bytes. This subsystem has only two commands as follows:

```c 
#define EEPROM_Read		0x01 //reads 8-byte chunks of data
#define EEPROM_Write	0x02 //write 8-bytes of data to the EEPROM
```

Note that the above commands are placed within the header section of the packet in Byte#3.

## Data Section
The data section consists of 16 bytes. The first 2 bytes (Byte 4-5) represent the page number. Currently, the configurable EEPROM size is set to 2K bytes, and thus, considering the page sizes of 8 bytes, we can have up to 256 pages. Therefore, the page number value will have the range of 0-255 (Byte 4), and Byte 5 should be set to zero. The next 8 bytes (Byte 6-13), will refer to the read/write data corresponding to a single page. Finally, the last 6 bytes (Byte 14-19) are reserved. Here we explain the two commands in more details:

#### EEPROM_Read Command/Response
In the command mode, the packet commands Neblina to read 8 bytes from a page number. Here is the packet structure:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) | Byte 3 (command) |Byte 4-5|Byte 6-19 |
|:------------------:|:---------------:|:------------:|:----------------:|:------:|:--------:|
|        0x4C        |       0x10      |      CRC     |0x01 (EEPROM_Read)|page nb | Reserved |

In response, Neblina will first send an acknowledge/error packet to confirm the receipt of the command. Next, another response packet with 8 bytes of read data will be sent back to the host:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) | Byte 3 (command) |Byte 4-5|Byte 6-13|Byte 14-19|
|:------------------:|:---------------:|:------------:|:----------------:|:------:|:-------:|:--------:|
|        0x4C        |       0x10      |      CRC     |0x01 (EEPROM_Read)|page nb |read data| Reserved |

#### EEPROM_Read Command/Response
In the command mode, the packet commands Neblina to write 8 bytes to a page number. Here is the packet structure:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) | Byte 3 (command)  |Byte 4-5|Byte 6-13 |Byte 14-19|
|:------------------:|:---------------:|:------------:|:-----------------:|:------:|:--------:|:--------:|
|        0x4C        |       0x10      |      CRC     |0x02 (EEPROM_Write)|page nb |write data| Reserved |

In response, Neblina will only send an acknowledge/error packet to indicate the validity and receipt of the command issued by the host.
