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
Neblina is programmed to stream information to the host as per its request. The maximum streaming frequency is 1kHz, and the users can reduce the streaming frequency to 1000/n, where n is an unsigned 16-bit positive integer. Regarding this command, we have the following data section with only 2 valid bytes:
###### Byte#5: n, LSB
###### Byte#6: n, MSB
Currently, the supporting streaming frequencies are multiplicands of 20, i.e., 50Hz, 50Hz/2, 50Hz/3, and so on. Therefore, the value of n should be set as a multiplicand of 20.
##### MotionState Command/Response
In the command mode the packet enables/disables the streaming of the motion state for the target device. If enabled, it basically inquires whether the device changes its motion state either from stop to movement, or from movement to stop. We recommend that after the device power-up you hold the device still for a couple of seconds (2-5 seconds) for initial calibration and orientation convergence. Data section for this packet type is a single byte, which should be set to either 0 or 1 to disable or enable the streaming of the motion states respectively.
###### Byte#5: Enable (1) or Disable (0) Motion State streaming
In the response mode, the data section includes 4 bytes for the timestamp in microseconds (Byte#5-8), and then the motion state data, i.e., a single byte (Byte#9) with the "motionstatus_t" structure defined in the motion engine documentation.
##### IMU_Data Command/Response
In the command mode, the packet enables/disables the streaming of the 6-axis IMU sensor data, including the 3-axis accelerometer and 3-axis gyroscope. Byte#5 will be a Boolean value representing the Enable/Disable command. In the response mode, the data section includes 4 bytes for the timestamp (Byte#5-8), which is then followed by 12 bytes (Byte#9-20) with the "IMU6AxisRaw_t" data structure defined in the motion engine documentation.
##### Quaternion Command/Response
In the command mode, the packet enables/disables the streaming of the quaternion data. Byte#5 will be a Boolean value representing the Enable/Disable command. In the response mode, the data section includes 4 bytes for the timestamp (Byte#5-8), which is then followed by 8 bytes (Byte#9-16) with the "QUAT" data structure defined in the motion engine documentation.
##### EulerAngle Command/Response
In the command mode, the packet enables/disables the streaming of the Euler Angle data. Byte#5 will be a Boolean value representing the Enable/Disable command. In the response mode, the data section includes 4 bytes for the timestamp (Byte#5-8), which is then followed by 6 bytes (Byte#9-14) with the "Euler_fxp" data structure defined in the motion engine documentation.
##### ExtForce Command/Response
In the command mode, the packet enables/disables the streaming of the external force vector. Byte#5 will be a Boolean value representing the Enable/Disable command. In the response mode, the data section includes 4 bytes for the timestamp (Byte#5-8), which is then followed by 6 bytes (Byte#9-14) with the "Fext_Vec16_t" data structure defined in the motion engine documentation.
##### SetFusionType Command:
The corresponding packet includes only 1 byte, indicating whether the fusion should be set to either 6-axis or 9-axis mode:
###### Byte#5: 6-axis mode (0) or 9-axis mode (1)
##### TrajectoryRecStart & TrajectoryRecStop
These two commands do not have a data section.
##### TrajectoryDistance Command/Response
In the command mode, the packet enables/disables the streaming of the distance from a pre-recorded orientation trajectory. Byte#5 will be a Boolean value representing the Enable/Disable command. In the response mode, the data section includes 4 bytes for the timestamp (Byte#5-8), which is then followed by 6 bytes (Byte#9-14) representing the Euler angle errors, which have been described by the "EnableTrajectoryDistanceStream()" API function in the motion engine documentation.
##### Pedometer Command/Response
In the command mode, the packet enables/disables the streaming of the Pedometer data. Byte#5 will be a Boolean value representing the Enable/Disable command. In the response mode, the data section includes 4 bytes for the timestamp (Byte#5-8), which is then followed by 5 bytes (Byte#9-13) with the following subfields:
###### Byte#9: step count, LSB
###### Byte#10: step count, MSB
###### Byte#11: spm (Cadence)
###### Byte#12: walking direction angle value LSB
###### Byte#13: walking direction angle value MSB
Note that the angle format includes one fractional decimal digit and it is compatible with the Euler angle representations described in the motion engine documentation.
##### MAG_Data Command/Response
In the command mode, the packet enables/disables the streaming of the 3-axis magnetometer data along with the 3-axis accelerometer data. Byte#5 will be a Boolean value representing the Enable/Disable command. In the response mode, the data section includes 4 bytes for the timestamp (Byte#5-8), which is then followed by 2*6 bytes (Byte#9-20) with the "AxesRaw_t" data structure defined in the motion engine documentation. The first 6 bytes (Byte#9-14) will be a "AxesRaw_t" data structure for magnetometers, and the next 6 bytes (Byte#15-20) will be another "AxesRaw_t" data structure for accelerometer data.




