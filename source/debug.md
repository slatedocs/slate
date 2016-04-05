# Debug subsystem (0x00)

**Important: this subsystem is used to support debug modes of Neblina.  Programmers should not rely on those functions for 
production code.  However, it can be very useful to validate custom protocols, error rates, performance monitors, memory usage, etc.**

## Motivation

Observability and controllability are essential components of the debugging process.  Bugs in distributed systems
such as sensor networks, remotely connected systems are notoriously more difficult to diagnose because when the code
misbehaves, the root cause can be hidden very deep.  By implementing small trace buffers, event counters, error counters,
one can essentially add important visibility into those systems.  This is the reason that this subsystem is implemented
at the core of Neblina.

## Commands

### Debug - Set Interface (0x01)

```c 
#define DEBUG_CMD_SET_INTERFACE 0x01
```

There is also a single command corresponding to the Debug mode, that is to set the interface protocol between the host and Neblina. By default, the interface is set to BLE, but we can set the interface to UART as well. Here is the command code for setting the interface:

| Packet|
|--------|
| Header: Bytes(0-3) |
| Data (4-7): RESERVED |
|Data (8):|
| * 0x00 MCU receives commands and responds to them through the BLE interface|
| * 0x01 MCU receives commands and responds to them through the debug UART interface.|

In response, Neblina will send an acknowledge packet to the host to confirm the successful receipt of the command.

### Debug - Check Motion Engine and Flash Recorder States (0x02)

```c 
#define DEBUG_CMD_MOTENGINE_RECORDER_STATUS 0x02
```

In the command mode, the host can send this packet to Neblina to inquire what streaming options are active on Neblina, and whether the flash recording or playback is ON or not. The command packet is as follows:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2 (CRC)|            Byte 3 (command)          |Byte 4-19|
|:----------------:|:-------------:|:----------:|:------------------------------------:|:-------:|
|       0x40       |      0x10     |     CRC    |0x02 (motion engine & recorder states)|Reserved |

In the response mode, Neblina will first send an acknowledge packet to the host to confirm the successful receipt of the command. Next, the main response packet will be prepared, where Byte#4-7 is reserved, while Byte#8-11 represent the 32-bit motion engine status register, and Byte#12 will show the flash recorder state. Byte#13-19 are also reserved. The full response packet is as follows:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2 (CRC)|Byte 3 (command)|Byte 4-7 |     Byte 8-11      |    Byte 12    |Byte 13-19|
|:----------------:|:-------------:|:----------:|:--------------:|:-------:|:------------------:|:-------------:|:--------:|
|       0x0        |     0x10      |    CRC     |      0x02      |Reserved |Motion Engine Status|Recorder Status| Reserved |

The motion engine and recorder status registers are described next.

##### Motion Engine Status Register (32-bit register, Byte#8-11):
Here is the bit-field declaration for this register:

####### Byte 11-10: Reserved
####### Byte 9:
| Bit 7:3 |   Bit 2    |    Bit 1    | Bit 0  |
|:-------:|:----------:|:-----------:|:------:|
|Reserved |RotationInfo|FingerGesture|SitStand|

####### Byte 8:
|  Bit 7 |Bit 6 |Bit 5 | Bit 4  |  Bit 3   |Bit 2 |Bit 1 |  Bit 0 |
|:------:|:----:|:----:|:------:|:--------:|:----:|:----:|:------:|
|MAG_data|Steps |Motion|IMU_data|Quaternion|Euler |Force |Distance|

Each bit-field shows whether the corresponding motion engine feature has been enabled for streaming (1) or not (0).

##### Flash Recorder/Playback Status Register (Byte#12):
Here is the status value regarding the flash recorder:
```c 
Byte#12 = { 0x00 (Idle state), 0x01 (Playing back), 0x02 (Recording), 0x03-0xFF (unused) } 
```

### Debug - Start/Stop the Motion Engine Unit Test (0x03)
```c 
#define DEBUG_CMD_MOTION_ENG_UNIT_TEST_START_STOP 0x03
```
This command packet will inform Neblina that the unit test procedure for motion engine has started/completed. We have to send the START command before starting the unit test procedure, such that Neblina switches to the unit-test mode. Similarly, we send the STOP command after successful completion of the unit test procedure. If the STOP command is not sent to Neblina, it will not switch back to its normal operation mode. Byte#8 will determine whether the packet is a START (1) command or a STOP (0) command, while all the other bytes in the data section are reserved. Here is the full packet:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2 (CRC)|     Byte 3 (command)      |Byte 4-7|  Byte 8  |Byte 9-19|
|:----------------:|:-------------:|:----------:|:-------------------------:|:------:|:--------:|:-------:|
|       0x40       |      0x10     |     CRC    |0x03 (unit test start/stop)|Reserved|start/stop|Reserved |

Note that in responce, Neblina will just send an acknowledge packet to the host to confirm the successful receipt of the command.

### Debug - Unit Test Motion Engine Data (0x04)
```c 
#define DEBUG_CMD_MOTION_ENG_UNIT_TEST_DATA 0x04
```
This command/response packet has a different length compared to the standard 20-byte packet structure on Neblina. 

In the command mode, the packet sends emulated 9-axis raw sensor data including acclerometers, gyroscopes, and magnetometers, along with a timestamp in microseconds. The command packet consists of 26 bytes, and it has the following structure:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2 (CRC)|  Byte 3 (command)   |Byte 4-7 |Byte 8-13|Byte 14-19|Byte 20-25|
|:----------------:|:-------------:|:----------:|:-------------------:|:-------:|:-------:|:--------:|:--------:|
|       0x40       |      0x16     |     CRC    |0x04 (unit test data)|Timestamp|Acc Data | Gyr Data | Mag Data |

The Timestamp is in microseconds and it is represented by a 32-bit unsigned integer value in little endian format, i.e., Byte 4 is LSB and Byte 7 is MSB. The 3-axis raw accelerometer (Byte 8-13), gyroscope (Byte 14-19), and magnetometer (Byte 20-25) data are represented by the following data structure:
```c
typedef struct { //3-axis raw data type - 6 bytes
  int16_t Data[3];
} AxesRaw_t;
```
where each axis is a 16-bit signed integer value. The full-range for magnetometer and gyroscope data is ±4 gauss and ±2000 dps, respectively, while the accelerometer range for the unit-test mode is ±2g.

In the response mode, Neblina will send all the updated motion engine features to the host. The response packet is 71 bytes and has the following structure:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2 (CRC)|  Byte 3 (command)   |   Byte 4-70    |
|:----------------:|:-------------:|:----------:|:-------------------:|:--------------:|
|       0x00       |      0x43     |     CRC    |0x04 (unit test data)|Motion_Feature_t|

where
```c
typedef struct Motion_Feature_t{ //all motion engine features
	uint8_t motion; //0: no change in motion, 1: stops moving, 2: starts moving
	IMURaw_t IMUData; //18 bytes
	Quaternion_t quatrn; //8 bytes
	Euler_fxp_t angles; //6 bytes
	Fext_Vec16_t force; //6 bytes
	Euler_fxp_t angles_err; //6 bytes: error in Euler angles compared to a reference trajectory
	uint16_t motiontrack_cntr; //shows how many times the pre-recorded track has been repeated
	uint8_t motiontrack_progress; //the percentage showing how much of a pre-recorded track has been covered
	uint32_t TimeStamp; //4 bytes: in microseconds
	steps_t steps; //4 bytes
	int16_t direction; 
	sit_stand_t sit_stand; //9 bytes
}Motion_Feature_t;
```
More information about the motion engine data structures can be found here:
https://github.com/Motsai/documentation/blob/master/source/motionenginepackets.md

### Debug - Get Firmware Versions (0x05)
```c 
#define DEBUG_CMD_GET_FW_VERSION 0x05
```
In the command mode, the packet requests for the Neblina's version number as well as other information. The command packet has no data field and is structured as follows:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2 (CRC)|       Byte 3 (command)     |Byte 4-19|
|:----------------:|:-------------:|:----------:|:--------------------------:|:-------:|
|       0x40       |      0x10     |     CRC    |0x05 (Get Firmware Versions)|Reserved |

In response, Neblina will provide the requested information using the following data structure:
```c
typedef struct {
	uint8_t API_Release; //API release version
	FWVersion_t KL26; //Freescale's KL26 firmware version
	FWVersion_t Nordic; //Nordic firmware version
	uint64_t devid; //device ID
}Neblina_FWVersions_t;
```
where
```c
typedef struct {
	uint8_t major; //major revision
	uint8_t minor; //minor revision
	uint8_t build; //build number
}FWVersion_t;
```

The response packet will thus have the following structure:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2 (CRC)|      Byte 3 (command)      |     Byte 4-18      |Byte 19 |
|:----------------:|:-------------:|:----------:|:--------------------------:|:------------------:|:------:|
|       0x00       |      0x10     |     CRC    |0x05 (Get Firmware Versions)|Neblina_FWVersions_t|Reserved|


### Debug - Dump Data (0x06)
```c 
#define DEBUG_CMD_DUMP_DATA 0x06
```
This packet is always a response packet and is sent from Neblina to the host to display (print) some hex data. The packet length might vary from 4 to 20 bytes including the header section. The data section contains the dump data that is needed to be displayed by the host, which could be between 0 to 16 bytes. Byte 1 will determine the packet's data section (dump data) length. Here is the full resposne packet:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2 (CRC)|Byte 3 (command)|  Byte 4-END  |
|:----------------:|:-------------:|:----------:|:--------------:|:------------:|
|       0x40       |     0-16      |     CRC    |   Debug Dump   |  Dump Data   |


### Debug - Stream the BLE Received Signal Strength Indicator, RSSI (0x07)
```c 
#define DEBUG_CMD_STREAM_RSSI 0x07
```
In the command mode, the packet enables/disables the streaming of the BLE signal strength, i.e., RSSI, in dB, if there is a BLE connection. Byte#8 will determine whether the RSSI information should be streamed or not. The command packet is given below:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2 (CRC)| Byte 3 (command) |Byte 4-7|    Byte 8    |Byte 9-19|
|:----------------:|:-------------:|:----------:|:----------------:|:------:|:------------:|:-------:|
|       0x40       |      0x10     |     CRC    |0x07 (Stream RSSI)|Reserved|Enable/Disable|Reserved |

In the response mode, if there is a BLE connection between Neblina and the host, and if the RSSI streaming is ON, Neblina will send the RSSI value to the host every few seconds (between 2-5 seconds) utilizing a moving average filter. The response packet includes the Timestamp (Byte 4-7) as well as the RSSI value in dB as an 8-bit signed integer, which is represented by Byte 8. The full response packet is given below:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2 (CRC)| Byte 3 (command) |Byte 4-7 |Byte 8|Byte 9-19|
|:----------------:|:-------------:|:----------:|:----------------:|:-------:|:----:|:-------:|
|       0x0        |      0x10     |     CRC    |0x07 (Stream RSSI)|Timestamp| RSSI |Reserved |
