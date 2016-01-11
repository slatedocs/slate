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
| Bit 7:1 | Bit 0  |
|:-------:|:------:|
|Reserved |SitStand|

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
|       0x40       |      0x16     |     CRC    |0x04 (unit test data)|Timestamp|Acc Data | Gyr Data | Mag Data:|

The Timestamp is in microseconds and it is represented by a 32-bit unsigned integer value in little endian format, i.e., Byte 4 is LSB and Byte 7 is MSB. The 3-axis raw accelerometer (Byte 8-13), gyroscope (Byte 14-19), and magnetometer (Byte 20-25) data are represented by the following data structure:
```c
typedef struct { //3-axis raw data type - 6 bytes
  int16_t Data[3];
} AxesRaw_t;
```
where each axis is a 16-bit signed integer value. The full-range for magnetometer and gyroscope data is ±4 gauss and ±2000 dps, respectively, while the accelerometer range can be set to ±2g, ±4g, ±8g, or ±16g, using a separate motion engine command. The default range for acclerometer data is ±2g.

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2 (CRC)|Byte 3 (command)|Byte 4-7 |   Byte 8-13   |  Bytes 14-19  |
|:----------------:|:-------------:|:----------:|:--------------:|:-------:|:-------------:|:-------------:|
|       0x40       |      0x10     |    CRC     |      0x0B      |TimeStamp|AxesRaw_t (Mag)|AxesRaw_t (Acc)|
