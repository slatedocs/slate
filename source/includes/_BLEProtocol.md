# BLE Protocol - Packet Structure

## General Format
The general format of the BLE packets being transferred between Neblina and the host applicaion is as follows:
```c
Bytes#1-4: Header Section
Bytes#5-20: Data Section
```

### Header Section
The header section consists of four bytes.
###### Byte#1: Subsystem
```c 
Bit#7: (Error Log) 
```
If set to 1, it shows that the packet is an error log command/response associated with the subsystem represented by Bits#6-0. Otherwise, if set to 0, it shows that the packet is a regular command/response associated with the subsystem represented by Bits#6-0.
```c 
Bits#6-0: (Subsystem value)
```
This is the subsystem index, which currently has only two modes: 0x01 (motion engine), 0x02 (power management)

###### Byte#2: Data Section Packet Length
The BLE protocol currently is set to a fixed packet length of 20 bytes including both header and data, where the data section is 16 bytes. Hence, this byte is set to the value of 0x10 = 16.

###### Byte#3: CRC
The 8-bit CRC is calculated over the data section of the packet.

###### Byte#4: Command
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
#### Power Management Data Section
Regarding the power management's single command, the data consists of only 2 valid bytes, representing the percentage of the battery level with one decimal fractional digit precision, i.e., an unsigned integer within the range of [0, 1000]:
###### Byte#5: battery level (%), Least Significant Byte (LSB)
###### Byte#6: battery level (%), Most Significant Byte (MSB)
#### Motion Engine Data Section
The data section regarding the motion engine has different representations based on the command, which are explained next.
##### Downsample Command
Neblina is programmed to stream information to the host as per its request. The maximum streaming frequency is 1kHz, and the users can reduce the streaming frequency to 1000/n, where n is an unsigned 16-bit positive integer. Regarding this command, we have to set the following input arguments:
###### Byte#5: n, LSB
###### Byte#6: n, MSB




