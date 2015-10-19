# BLE Protocol - Packet Structure

## General Format
The general format of the BLE packets being transferred between Neblina and the host applicaion is as follows:
```c
Bytes#1-4: Header Section
Bytes#5-20: Data Section
```

### Header Section
The header section consists of four bytes.
#### Byte#1: Subsystem
```c 
Bit#7: (Error Log) 
```
If set to 1, it shows that the packet is an error log command/response associated with the subsystem represented by Bits#6-0. Otherwise, if set to 0, it shows that the packet is a regular command/response associated with the subsystem represented by Bits#6-0.
```c 
Bits#6-0: (Subsystem value)
```
This is the subsystem index, which currently has only two modes: 0x01 (motion engine), 0x02 (power management)

#### Byte#2: Data Section Packet Length
The BLE protocol currently is set to a fixed packet length of 20 bytes including both header and data, where the data section is 16 bytes. Hence, this byte is set to the value of 0x10 = 16.

#### Byte#3: CRC
The 8-bit CRC is calculated over the data section of the packet.

#### Byte#4: Command
Different commands can be issued identified by this field. For the power management subsystem, currently there is only one command as follows:
```c 
#define POWERMGMT_GET_BAT_LEVEL 0
```
However, regarding the motion engine subsystem a number of commands exist, which are listed below:
```c 
#define Downsample 0x01 //Downsampling factor definition
#define MotionState 0x02 //streaming Motion State
#define IMU_Data 0x03 //streaming the 6-axis IMU data
#define Quaternion 0x04 //streaming the quaternion data
#define EulerAngle 0x05 //streaming the Euler angles
#define ExtForce 0x06 //streaming the external force
#define SetFusionType 0x07 //setting the Fusion type to either 6-axis or 9-axis
#define TrajectoryRecStart 0x08 //start recording orientation trajectory
#define TrajectoryRecStop 0x09 //stop recording orientation trajectory
#define TrajectoryDistance 0x0A //calculating the distance from a pre-recorded orientation trajectory
#define Pedometer 0x0B //streaming pedometer data
#define MAG_Data 0x0C //streaming magnetometer data
```

### Data Section
The data section consists of 12 bytes, which could be representing different values depending on the subsystem and the command fields.



The Bits6-0 determine, which susbsytem the packet targets, and the most significant bit shows whether the packet targets the corresponding subsystem error log, or it is just a regular command/response for the aforementioned subsystem.


`DownsampleStream(uint16_t n)`

This function sets the streaming frequency divider. The streaming base frequency is 1KHz, and this function will set the frequency to 1000/n Hz. Currently, the default value of `n` is 20 and the acceptable values for `n` are integer multiples of 20, i.e., n = 20, 40, 60, etc. If n is set to another value, Neblina will log this as an error. The host can issue commands to request for the error logs as well, which will be explained later.

## Enable motion stream

> The motion status has the following type, which will be streamed:

```c
typedef enum {
  No_Change = (uint8_t)0x00, //holds its previous state
  Stop_Motion = (uint8_t)0x01, //the device stops moving
  Start_Motion = (uint8_t)0x02, //the device starts moving
} motionstatus_t;
```

`EnableMotionStream()`

This function will enable the motion streaming op
