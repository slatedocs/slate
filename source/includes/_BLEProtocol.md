# BLE Protocol - Packet Structure

## General Format
The general format of the BLE packets being transferred between Neblina and the host applicaion is as follows:
<!---
```c
Bytes#0-3: Header Section
Bytes#4-19: Data Section
```
-->
| Bytes 0-3      | Bytes 4-19    |
|----------------|---------------|
| Header Section | Data Section  |
### Header Section
The header section consists of four bytes.

|  Byte 0 (bit_7) |  Byte 0 (bit_6_0) |  Byte 1   | Byte 2 |   Byte 3 (bit_7)    |Byte 3 (bit_6_0)|
|-----------------|-------------------|-----------|--------|---------------------|----------------|
|    Error Log    |  Subsystem value  |data length|  CRC   |Command/Response Mode|  Command Type  |

###### Byte#0: Subsystem
```c 
Bit#7: (Error Log) 
```
If set to 1, it shows that the packet is an error log command/response associated with the subsystem represented by Bits#6-0. Otherwise, if set to 0, it shows that the packet is a regular command/response associated with the subsystem represented by Bits#6-0.
```c 
Bits#6-0: (Subsystem value)
```
This is the subsystem index, which currently has only two modes: 0x01 (motion engine), 0x02 (power management)

###### Byte#1: Data Section Packet Length
The BLE protocol currently is set to a fixed packet length of 20 bytes including both header and data, where the data section is 16 bytes. Hence, this byte is set to the value of 0x10 = 16.

###### Byte#2: CRC
The 8-bit CRC is calculated over the data section of the packet.

###### Byte#3: Command
```c 
Bit#7: (Command/Response Mode) 
```
This bit, when set to "1", shows that the packet is a command issued to Neblina from the host. When the bit is set to "0", it means that the packet is a response from Neblina to the host. 
```c 
Bits#6-0: (Command Type)
```
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
###### Byte#4: battery level (%), Least Significant Byte (LSB)
###### Byte#5: battery level (%), Most Significant Byte (MSB)
#### Motion Engine Data Section
The data section regarding the motion engine has different representations based on the command, which are explained next.
##### Downsample Command
Neblina is programmed to stream information to the host as per its request. The maximum streaming frequency is 1kHz, and the users can reduce the streaming frequency to 1000/n, where n is an unsigned 16-bit positive integer. Regarding this command, we have the following data section with only 2 valid bytes:
###### Byte#4: n, LSB
###### Byte#5: n, MSB
Currently, the supporting streaming frequencies are multiplicands of 20, i.e., 50Hz, 50Hz/2, 50Hz/3, and so on. Therefore, the value of n should be set as a multiplicand of 20. Overall, the downsample command packet including both header and data sections has the following structure:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2 (CRC)|Byte 3 (command) |Bytes 4-5|Bytes 6-19|
|:----------------:|:-------------:|:----------:|:---------------:|:-------:|:--------:|
|       0x01       |      0x10     |     CRC    |0x81 (downsample)|  factor | Reserved |

##### MotionState Command/Response
In the command mode the packet enables/disables the streaming of the motion state for the target device. If enabled, it basically inquires whether the device changes its motion state either from stop to movement, or from movement to stop. We recommend that after the device power-up you hold the device still for a couple of seconds (2-5 seconds) for initial calibration and orientation convergence. Data section for this packet type is a single byte, which should be set to either 0 or 1 to disable or enable the streaming of the motion states respectively.
###### Byte#4: Enable (1) or Disable (0) Motion State streaming
Overall, the command packet has the following structure:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command) |     Byte 4     | Bytes 5-19 |
|:------------------:|:---------------:|:------------:|:-----------------:|:--------------:|------------|
|        0x01        |       0x10      |      CRC     |0x82 (motion state)| Enable/Disable |  Reserved  |

In the response mode, the data section includes 4 bytes for the timestamp in microseconds (Byte#4-7), and then the motion state data, i.e., a single byte (Byte#8), which is either 0 (stop motion) or 1 (start motion). The whole response packet structure including header is shown below:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command) |Byte 4-7 |    Byte 8    | Bytes 9-19 |
|:------------------:|:---------------:|:------------:|:-----------------:|:-------:|--------------|-------------|
|        0x01        |       0x10      |      CRC     |        0x02       |TimeStamp|  stop/start  |  Reserved   |

##### IMU_Data Command/Response
In the command mode, the packet enables/disables the streaming of the 6-axis IMU sensor data, including the 3-axis accelerometer and 3-axis gyroscope. Byte#4 will be a Boolean value representing the Enable/Disable command. The overall command mode IMU_Data packet has the following structure:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command) |     Byte 4     | Bytes 5-19 |
|:------------------:|:---------------:|:------------:|:-----------------:|:--------------:|------------|
|        0x01        |       0x10      |      CRC     | 0x83 (6-axis IMU) | Enable/Disable |  Reserved  |

In the response mode, the data section includes 4 bytes for the timestamp (Byte#4-7), which is then followed by 12 bytes (Byte#8-19) with the "IMU6AxisRaw_t" data structure defined in the motion engine documentation. The whole response packet structure including header is shown below:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command) |Byte 4-7 |  Byte 8-19  |
|:------------------:|:---------------:|:------------:|:-----------------:|:-------:|-------------|
|        0x01        |       0x10      |      CRC     |        0x03       |TimeStamp|IMU6AxisRaw_t|

##### Quaternion Command/Response
In the command mode, the packet enables/disables the streaming of the quaternion data. Byte#4 will be a Boolean value representing the Enable/Disable command. The overall command mode Quaternion packet has the following structure:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command) |     Byte 4     | Bytes 5-19 |
|:------------------:|:---------------:|:------------:|:-----------------:|:--------------:|------------|
|        0x01        |       0x10      |      CRC     | 0x84 (Quaternion) | Enable/Disable |  Reserved  |

In the response mode, the data section includes 4 bytes for the timestamp (Byte#4-7), which is then followed by 8 bytes (Byte#8-15) with the "Quaternion_t" data structure defined in the motion engine documentation. The whole response packet structure including header is shown below:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command) |Byte 4-7 |   Byte 8-15  | Bytes 16-19 |
|:------------------:|:---------------:|:------------:|:-----------------:|:-------:|--------------|-------------|
|        0x01        |       0x10      |      CRC     |        0x04       |TimeStamp| Quaternion_t |  Reserved   |

##### EulerAngle Command/Response
In the command mode, the packet enables/disables the streaming of the Euler Angle data. Byte#4 will be a Boolean value representing the Enable/Disable command. The overall command mode Euler Angle packet has the following structure:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command)  |     Byte 4     | Bytes 5-19 |
|:------------------:|:---------------:|:------------:|:------------------:|:--------------:|------------|
|        0x01        |       0x10      |      CRC     | 0x85 (Euler Angle) | Enable/Disable |  Reserved  |

In the response mode, the data section includes 4 bytes for the timestamp (Byte#4-7), which is then followed by 6 bytes (Byte#8-13) with the "Euler_fxp_t" data structure defined in the motion engine documentation. The whole response packet structure including header is shown below:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2 (CRC)|Byte 3 (command)|Byte 4-7 | Byte 8-15 |Bytes 14-19|
|:----------------:|:-------------:|:----------:|:--------------:|:-------:|:---------:|:---------:|
|       0x01       |      0x10     |    CRC     |      0x05      |TimeStamp|Euler_fxp_t| Reserved  |

##### ExtForce Command/Response
In the command mode, the packet enables/disables the streaming of the external force vector. Byte#4 will be a Boolean value representing the Enable/Disable command. The overall command mode External Force packet has the following structure:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command) |     Byte 4     | Bytes 5-19 |
|:------------------:|:---------------:|:------------:|:-----------------:|:--------------:|------------|
|        0x01        |       0x10      |      CRC     |  0x86 (ExtForce)  | Enable/Disable |  Reserved  |

In the response mode, the data section includes 4 bytes for the timestamp (Byte#4-7), which is then followed by 6 bytes (Byte#8-13) with the "Fext_Vec16_t" data structure defined in the motion engine documentation. The whole response packet structure including header is shown below:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command) |Byte 4-7 |   Byte 8-13  | Bytes 14-19 |
|:------------------:|:---------------:|:------------:|:-----------------:|:-------:|--------------|-------------|
|        0x01        |       0x10      |      CRC     |        0x06       |TimeStamp| Fext_Vec16_t |  Reserved   |

##### SetFusionType Command:
The corresponding packet includes only 1 byte, indicating whether the fusion should be set to either 6-axis IMU or 9-axis MARG mode involving magnetometers:

###### Byte#4: 6-axis IMU mode (0) or 9-axis MARG mode (1)
The overall packet structure is as follows:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command)  |  Byte 4  | Bytes 5-19 |
|:------------------:|:---------------:|:------------:|:------------------:|:--------:|------------|
|        0x01        |       0x10      |      CRC     |0x87 (SetFusionType)| IMU/MARG |  Reserved  |

##### TrajectoryRecStart & TrajectoryRecStop
These two commands do not have a data section.
##### TrajectoryDistance Command/Response
In the command mode, the packet enables/disables the streaming of the distance from a pre-recorded orientation trajectory. Byte#4 will be a Boolean value representing the Enable/Disable command. The overall command mode TrajectoryDistance packet has the following structure:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |   Byte 3 (command)  |     Byte 4     | Bytes 5-19 |
|:------------------:|:---------------:|:------------:|:-------------------:|:--------------:|------------|
|        0x01        |       0x10      |      CRC     |  0x8A (Trajectory)  | Enable/Disable |  Reserved  |

In the response mode, the data section includes 4 bytes for the timestamp (Byte#4-7), which is then followed by 6 bytes (Byte#8-13) representing the Euler angle errors, which have been described by the "EnableTrajectoryDistanceStream()" API function in the motion engine documentation. The whole response packet structure including header is shown below:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2 (CRC)|Byte 3 (command)|Byte 4-7 |    Byte 8-13    | Bytes 14-19 |
|:----------------:|:-------------:|:----------:|:--------------:|:-------:|:---------------:|-------------|
|       0x01       |      0x10     |     CRC    |       0x0A     |TimeStamp|EulerAngle Errors|  Reserved   |

##### Pedometer Command/Response
In the command mode, the packet enables/disables the streaming of the Pedometer data. Byte#4 will be a Boolean value representing the Enable/Disable command. The overall command mode Pedometer packet has the following structure:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command)  |     Byte 4     | Bytes 5-19 |
|:------------------:|:---------------:|:------------:|:------------------:|:--------------:|------------|
|        0x01        |       0x10      |      CRC     |  0x8B (Pedometer)  | Enable/Disable |  Reserved  |

In the response mode, the data section includes 4 bytes for the timestamp (Byte#4-7), which is then followed by 5 bytes (Byte#8-12) with the following subfields:
###### Byte#8: step count, LSB
###### Byte#9: step count, MSB
###### Byte#10: spm (Cadence)
###### Byte#11: walking direction angle value LSB
###### Byte#12: walking direction angle value MSB
Note that the angle format includes one fractional decimal digit and it is compatible with the Euler angle representations described in the motion engine documentation. The whole response packet structure including header is shown below:

| Byte 0 | Byte 1 | Byte 2 | Byte 3 |Byte 4-7 |Byte 8-9  |Byte 10|  Byte 11-12   |Bytes 13-19|
|:------:|:------:|:------:|:------:|:-------:|:--------:|:-----:|:-------------:|:---------:|
|  0x01  |  0x10  |  CRC   |  0x0B  |TimeStamp|step count|cadence|direction angle| Reserved  |

##### MAG_Data Command/Response
In the command mode, the packet enables/disables the streaming of the 3-axis magnetometer data along with the 3-axis accelerometer data. Byte#4 will be a Boolean value representing the Enable/Disable command. The overall command mode MAG_Data packet has the following structure:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command) |     Byte 4     | Bytes 5-19 |
|:------------------:|:---------------:|:------------:|:-----------------:|:--------------:|------------|
|        0x01        |       0x10      |      CRC     |  0x8C (MAG_Data)  | Enable/Disable |  Reserved  |

In the response mode, the data section includes 4 bytes for the timestamp (Byte#4-7), which is then followed by 2*6 bytes (Byte#8-19) with the "AxesRaw_t" data structure defined in the motion engine documentation. The first 6 bytes (Byte#8-13) will be a "AxesRaw_t" data structure for magnetometers, and the next 6 bytes (Byte#14-19) will be another "AxesRaw_t" data structure for accelerometer data. The whole response packet structure including header is shown below:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2 (CRC)|Byte 3 (command)|Byte 4-7 |   Byte 8-13   |  Bytes 14-19  |
|:----------------:|:-------------:|:----------:|:--------------:|:-------:|:-------------:|:-------------:|
|       0x01       |      0x10     |    CRC     |      0x0C      |TimeStamp|AxesRaw_t (Mag)|AxesRaw_t (Acc)|



