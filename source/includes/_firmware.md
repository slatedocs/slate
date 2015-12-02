# Firmware Management (0x09)

This subsystem is used to extract information on the Neblina firmware structure (version information, API versions, etc.)

## Commands

### Main Firmware Information (0x01)

Requests the firmware information structure

|Data Bytes|
|Byte 0 : 0x01 (Neblina Module Request ID)|
|Others : Don't Care (set to all 0)|

The Neblina will respond with the following information regarding its main firmware

|Response Data Bytes|
|----|
|Byte 0 (returns 0x01 - Neblina ID)|
|Byte 1 (Protocol API Release): Currently 0x01|
|Byte 2 (KL26 Version Major): VERS.Major (Should be 0x01 at the moment)|
|Byte 3 (KL26 Version Minor): VERS.Minor (Should be 0x02 for Demo 1.0, 0x03 for Demo 1.1)|
|Byte 4 (KL26 Build Number LSB)|
|Byte 5 (KL26 Build Number MSB)|
|Byte 6 (NRF Version Major) (Should read 0x01 at the moment)|
|Byte 7 (NRF Version Minor) (0x02 for Demo 1.0, 0x03 for Demo 1.1)|
|Byte 8 (NRF Firmware Build Number LSB)|
|Byte 9 (NRF Firmware Build Number MSB)|

### Bluetooth Firmware Identification (0x02)

Request bluetooth detail identifiers

|Command Data Bytes|
|Byte 0: 0x01 (Neblina Identifier)|
|Don't Care (set to all 0)|

|Response Data Bytes|
|Byte 0: 0x01 (Neblina Identifier)|
|Bytes 1-N: TBD According to what Nordic can provide |

### 
