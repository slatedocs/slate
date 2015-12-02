# Firmware Management (0x09)

This subsystem is used to extract information on the Neblina firmware structure (version information, API versions, etc.)

## Commands

### Main Firmware Information (0x01)

Requests the firmware information structure

|Command Data Bytes|
|Don't Care (set to all 0)|

The Neblina will respond with the following information regarding its main firmware

|Response Data Bytes|
|----|
|Byte 0 (Protocol API Release): Currently 0x01|
|Byte 1 (KL26 Version Major): VERS.Major (Should be 0x01 at the moment)|
|Byte 2 (KL26 Version Minor): VERS.Minor (Should be 0x02 for Demo 1.0, 0x03 for Demo 1.1)|
|Byte 4 (Build Number LSB)|
|Byte 5 (Build Number MSB)|
|Byte 6 (NRV Version Major) (Should read 0x01 at the moment)|
|Byte 7 (Nordic Version Minor) (0x02 for Demo 1.0, 0x03 for Demo 1.1)|
|Byte 8 (Nordic Build Number LSB)|
|Byte 9 (Nordic Build Number MSB)|

### Bluetooth Firmware Identification (0x02)

Request bluetooth detail identifiers

|Command Data Bytes|
|Don't Care (set to all 0)|

|Response Data Bytes|
| TBD According to Nordic manual |

### 
