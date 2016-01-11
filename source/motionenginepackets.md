# Motion Engine (0x01)

The motion engine uses subsystem ID 0x01

Regarding the motion engine subsystem a number of commands exist, which are listed below:

```c 
#define Downsample 0x01 //Downsampling factor definition
#define MotionState 0x02 //streaming Motion State
#define IMU_Data 0x03 //streaming the 6-axis IMU data
#define Quaternion 0x04 //streaming the quaternion data
#define EulerAngle 0x05 //streaming the Euler angles
#define ExtForce 0x06 //streaming the external force
#define SetFusionType 0x07 //setting the Fusion type to either 6-axis or 9-axis
#define TrajectoryRecStartStop 0x08 //start/stop recording orientation trajectory
#define TrajectoryInfo 0x09 //Analyzes the current trajectory w.r.t. the pre-recorded one
#define Pedometer 0x0A //streaming pedometer data
#define MAG_Data 0x0B //streaming magnetometer data
#define SittingStanding 0x0C //sitting/standing tracker
#define LockHeadingRef 0x0D //locks the current magnetometer data to the reference 0 degrees heading angle
#define SetAccRange 0x0E //sets the accelerometer full-scale range
#define DisableAllStreaming 0x0F //disables all the streaming options in the motion engine
#define ResetTimeStamp  0x10 //resets the timestamp value to 0
```
Note that the above commands are placed within the header section of the packet in Byte#3.

## Data Section
The data section consists of 16 bytes. The first 4 bytes (Byte 4-7) refer to the timestamp, which is only valid for response packets from Neblina. Hence, for all the commands being sent from the host to Neblina, these four bytes are reserved. The next 12 bytes (Byte 8-19) in the data section could be representing different values depending on the subsystem and the command fields.

### Motion Engine Data Section
The data section regarding the motion engine has different representations based on the command, which are explained next.
#### Downsample Command (0x01)
Neblina is programmed to stream information to the host as per its request. The maximum streaming frequency is 1kHz, and the users can reduce the streaming frequency to 1000/n, where n is an unsigned 16-bit positive integer. Regarding this command, we have the following data section with only 2 valid bytes:
##### Byte#8: n, LSB
##### Byte#9: n, MSB
The representation is little-endian meaning that the least significant byte is put first, followed by higher order bytes, and finally ending with the most significant byte. Currently, the supporting streaming frequencies are multiplicands of 20, i.e., 50Hz, 50Hz/2, 50Hz/3, and so on. Therefore, the value of n should be set as a multiplicand of 20. Overall, the downsample command packet including both header and data sections has the following structure:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2 (CRC)|Byte 3 (command) |Byte 4-7|Bytes 8-9 |Bytes 10-19|
|:----------------:|:-------------:|:----------:|:---------------:|:------:|:--------:|:---------:|
|       0x41       |      0x10     |     CRC    |0x01 (downsample)|Reserved|factor (n)| Reserved  |

In response, Neblina will only send an acknowledge/error packet to indicate the validity and receipt of the command issued by the host.

#### MotionState Command/Response (0x02)
In the command mode the packet enables/disables the streaming of the motion state for the target device. If enabled, it basically inquires whether the device changes its motion state either from stop to movement, or from movement to stop. We recommend that after the device power-up you hold the device still for a couple of seconds (2-5 seconds) for initial calibration and orientation convergence. Data section for this packet type is a single byte, which should be set to either 0 or 1 to disable or enable the streaming of the motion states respectively.
##### Byte#8: Enable (1) or Disable (0) Motion State streaming
Overall, the command packet has the following structure:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command) |Byte 4-7|     Byte 8     | Bytes 9-19 |
|:------------------:|:---------------:|:------------:|:-----------------:|:------:|:--------------:|------------|
|        0x41        |       0x10      |      CRC     |0x02 (motion state)|Reserved| Enable/Disable |  Reserved  |

In the response mode, Neblina will first send an acknowledge packet to the host to confirm the successful receipt of the command. Next, the main response packet will be prepared, where the data section first includes 4 bytes for the timestamp in microseconds (Byte#4-7) as a 32-bit unsigned integer value in little endian format. This means that Byte#4 is the LSB, and Byte#7 is the MSB of the timestamp. Next, we have the motion state data, i.e., a single byte (Byte#8), which is either 0 (stop motion) or 1 (start motion). The whole response packet structure including header is shown below:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command) |Byte 4-7 |    Byte 8    | Bytes 9-19  |
|:------------------:|:---------------:|:------------:|:-----------------:|:-------:|--------------|-------------|
|        0x01        |       0x10      |      CRC     |        0x02       |TimeStamp|  stop/start  |  Reserved   |

#### IMU_Data Command/Response (0x03)
In the command mode, the packet enables/disables the streaming of the 6-axis IMU sensor data, including the 3-axis accelerometer and 3-axis gyroscope. Byte#8 will be a Boolean value representing the Enable/Disable command. The overall command mode IMU_Data packet has the following structure:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command) |Byte 4-7|     Byte 8     | Bytes 9-19 |
|:------------------:|:---------------:|:------------:|:-----------------:|:------:|:--------------:|------------|
|        0x41        |       0x10      |      CRC     | 0x03 (6-axis IMU) |Reserved| Enable/Disable |  Reserved  |

In the response mode, Neblina will first send an acknowledge packet to the host to confirm the successful receipt of the command. Next, the main response packet will be prepared, where the data section first includes 4 bytes for the timestamp (Byte#4-7) in 32-bit unsigned integer and little endian format, which is then followed by 12 bytes (Byte#8-19) with the "IMU6AxisRaw_t" data structure defined below:
```c
typedef struct { //3-axis raw data type - 6 bytes
  int16_t Data[3];
} AxesRaw_t;
typedef struct { //6-axis data type - 12 bytes
  AxesRaw_t Acc; //accelerometer
  AxesRaw_t Gyr; //gyroscope
} IMU6AxisRaw_t;
```
where "AxesRaw_t" is the 3-axis raw data type, and "IMU6AxisRaw_t" is the overall 6-axis IMU data type. Each axis will be a 16-bit signed integer number cast in little endian (least significant byte first). The range of the sensor readings are as follows:
Accelerometer: ±2g (default), Gyroscope: ±2000 dps. The accelerometer range can be changed using another command.

The whole response packet structure including header is shown below:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command) |Byte 4-7 |  Byte 8-19  |
|:------------------:|:---------------:|:------------:|:-----------------:|:-------:|-------------|
|        0x01        |       0x10      |      CRC     |        0x03       |TimeStamp|IMU6AxisRaw_t|

#### Quaternion Command/Response (0x04)
In the command mode, the packet enables/disables the streaming of the quaternion data. Byte#8 will be a Boolean value representing the Enable/Disable command. The overall command mode Quaternion packet has the following structure:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command) |Byte 4-7|     Byte 8     | Bytes 9-19 |
|:------------------:|:---------------:|:------------:|:-----------------:|:------:|:--------------:|------------|
|        0x41        |       0x10      |      CRC     | 0x04 (Quaternion) |Reserved| Enable/Disable |  Reserved  |

In the response mode, Neblina will first send an acknowledge packet to the host to confirm the successful receipt of the command. Next, the main response packet will be prepared, where the data section first includes 4 bytes for the timestamp (Byte#4-7) in 32-bit unsigned integer and little endian format, which is then followed by 8 bytes (Byte#8-15) with the "Quaternion_t" data structure defined below:
```c
typedef struct Quaternion_t //quaternion
{
  int16_t q[4]; //fixed-point normalized quaternion with 15 fractional bits
} Quaternion_t;
```
The unit-length quaternion contains 4 entries, i.e., \\(q = [q_1,q_2,q_3,q_4]\\), where \\(-1  = q_{1:4} = 1\\), and \\(q_{12} + q_{22} + q_{32} + q_{42} = 1\\).

The real numbers \\(q_{1:4}\\) are represented using a 16-bit fixed-point number format, where 15-bits are assigned to the fractional part along with a sign bit. Here is an example of how we calculate the 16-bit fixed-point representation of a real number \\(x=0.257812\\) in the range of \\([-1,1]\\):

\\[xfixp = round(x \times 215) = 8445\\]

The integer number \\(8445\\), which is represented by a 16-bit signed integer number, refers to the real-number \\(8445215 = 0.2577209\\), which obviously deviates from the actual reference number \\(x = 0.257812\\). The fixed-point representation error for the number \\(x = 0.257812\\) is \\(0.257812 - 0.2577209 = 0.0000911\\).

Using the above approach all real numbers \\(q_{1:4}\\) are encoded using a 16-bit fixed-point representation and 15 fractional bits. The bytes are once again packed into the packet in little endian format (least significant byte first).

The whole response packet structure including header is shown below:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command) |Byte 4-7 |   Byte 8-15  | Bytes 16-19 |
|:------------------:|:---------------:|:------------:|:-----------------:|:-------:|--------------|-------------|
|        0x01        |       0x10      |      CRC     |        0x04       |TimeStamp| Quaternion_t |  Reserved   |

#### EulerAngle Command/Response (0x05)
In the command mode, the packet enables/disables the streaming of the Euler Angle data. Byte#8 will be a Boolean value representing the Enable/Disable command. The overall command mode Euler Angle packet has the following structure:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command)  |Byte 4-7|     Byte 8     | Bytes 9-19 |
|:------------------:|:---------------:|:------------:|:------------------:|:------:|:--------------:|------------|
|        0x41        |       0x10      |      CRC     | 0x05 (Euler Angle) |Reserved| Enable/Disable |  Reserved  |

In the response mode, Neblina will first send an acknowledge packet to the host to confirm the successful receipt of the command. Next, the main response packet will be prepared, where the data section first includes 4 bytes for the timestamp (Byte#4-7), which is then followed by 6 bytes (Byte#8-13) with the "Euler_fxp_t" data structure defined below:
```c
typedef struct Euler_fxp_t //fixed-point Euler angles, i.e., round(angle*10)
{
  int16_t yaw; //first rotation, around z-axis
  int16_t pitch; //second rotation, around y-axis
  int16_t roll; //third rotation, around x-axis
} Euler_fxp_t;
```
The orientation can easily be visualized using Euler angles, which can be found from the quaternion orientation. The Euler angles are reported in the so-called aerospace sequence, where the Yaw rotation (around z-axis) takes place first, which is then followed by Pitch (rotation around y-axis) and then Roll (rotation around x-axis). Each Euler angle is represented by 16 bits. The Euler angles are read in degrees and they have the following ranges: \\(Yaw \in [-180,180]\\), \\(Pitch \in [-90,90]\\), \\(Roll \in [-180,180]\\).

The angles are represented by one fractional digit precision using the following equation:

\\[angle_est = round(angle_ref \times 10)\\]

For instance, the angle \\(-104.731^{\circ}\\) is rounded to \\(-104.8^{\circ}\\), and is represented using 16-bit signed integer format as the number -1048. The 16-bit signed integer numbers representing angles are once again packet in little endian format, i.e., the least significant byte is placed first.

The whole response packet structure including header is shown below:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2 (CRC)|Byte 3 (command)|Byte 4-7 | Byte 8-15 |Bytes 14-19|
|:----------------:|:-------------:|:----------:|:--------------:|:-------:|:---------:|:---------:|
|       0x01       |      0x10     |    CRC     |      0x05      |TimeStamp|Euler_fxp_t| Reserved  |

#### ExtForce Command/Response (0x06)
In the command mode, the packet enables/disables the streaming of the external force vector. Byte#8 will be a Boolean value representing the Enable/Disable command. The overall command mode External Force packet has the following structure:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command) |Byte 4-7|     Byte 8     | Bytes 9-19 |
|:------------------:|:---------------:|:------------:|:-----------------:|:------:|:--------------:|------------|
|        0x41        |       0x10      |      CRC     |  0x06 (ExtForce)  |Reserved| Enable/Disable |  Reserved  |

In the response mode, Neblina will first send an acknowledge packet to the host to confirm the successful receipt of the command. Next, the main response packet will be prepared, where the data section first includes 4 bytes for the timestamp (Byte#4-7), which is then followed by 6 bytes (Byte#8-13) with the "Fext_Vec16_t" data structure defined below:
```c
typedef struct Fext_Vec16_t { //external force vector
int16_t x;
int16_t y;
int16_t z;
}Fext_Vec16_t;
```
The accelerometer data captures the total force vector applied to the device including gravity. The x, y, z components of the external force vector are defined in the reference Earth frame (not the sensor body frame). This means that regardless of the device's orientation, this force vector aligns with the fixed reference Earth frame and can be used for position tracking, etc. The external force components, x, y, z are 16-bit signed integer numbers covering the range of [-1g,1g]. This is due to the fact that the accelerometer data range is set to [-2g,2g], while the gravity vector is (0,0,1g). The 16-bit signed integer numbers are packed into bytes in little endian format.

The whole response packet structure including header is shown below:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command) |Byte 4-7 |   Byte 8-13  | Bytes 14-19 |
|:------------------:|:---------------:|:------------:|:-----------------:|:-------:|--------------|-------------|
|        0x01        |       0x10      |      CRC     |        0x06       |TimeStamp| Fext_Vec16_t |  Reserved   |

#### SetFusionType Command (0x07)
The corresponding packet's data section includes only 1 byte (Byte #8), indicating whether the fusion should be set to either 6-axis IMU or 9-axis MARG mode involving magnetometers:

##### Byte#8: 6-axis IMU mode (0) or 9-axis MARG mode (1)
The overall packet structure is as follows:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command)  |Byte 4-7|  Byte 8  | Bytes 9-19 |
|:------------------:|:---------------:|:------------:|:------------------:|:------:|:--------:|------------|
|        0x41        |       0x10      |      CRC     |0x07 (SetFusionType)|Reserved| IMU/MARG |  Reserved  |

In response, Neblina will only send an acknowledge/error packet to indicate the validity and receipt of the command issued by the host.

#### TrajectoryRecStartStop (0x08)
The corresponding packet's data section includes only 1 byte (Byte#8), to determine the start (1) or stop (0) of the orientation recording process. The overall packet structure is as follows:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |       Byte 3 (command)      |Byte 4-7|  Byte 8  |Bytes 9-19|
|:------------------:|:---------------:|:------------:|:---------------------------:|:------:|:--------:|----------|
|        0x41        |       0x10      |      CRC     |0x08 (TrajectoryRecStartStop)|Reserved|start/stop| Reserved |

In response, Neblina will only send an acknowledge/error packet to indicate the validity and receipt of the command issued by the host.

#### TrajectoryInfo Command/Response (0x09)
In the command mode, the packet enables/disables the streaming of the distance from a pre-recorded orientation trajectory, as well as the progress report. Byte#8 will be a Boolean value representing the Enable/Disable command. The overall command mode TrajectoryDistance packet has the following structure:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |   Byte 3 (command)  |Byte 4-7|     Byte 8     | Bytes 9-19 |
|:------------------:|:---------------:|:------------:|:-------------------:|:------:|:--------------:|------------|
|        0x41        |       0x10      |      CRC     |  0x09 (Trajectory)  |Reserved| Enable/Disable |  Reserved  |

In the response mode, Neblina will first send an acknowledge packet to the host to confirm the successful receipt of the command. Next, the main response packet will be prepared, where the data section first includes 4 bytes for the timestamp (Byte#4-7), which is then followed by 6 bytes (Byte#8-13) representing the Euler angle errors in yaw (Byte#8-9), pitch (Byte#10-11), and roll (Byte#12-13) in degrees. Each angle error is a 16-bit signed integer number and it is packed into 2 bytes in little endian format. The next 2 bytes (Byte#14-15) represent a 16-bit unsigned integer number in little endian format showing how many times the recorded track has been repeated. Finally, Byte#16 shows the percentage of completion indicating how much of the recorded track has been covered. The track Counter (Byte#14-15) will be increased by 1, and the percentage value will drop back to zero, when the full track is covered. The whole response packet structure including header is shown below:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2|Byte 3|Byte 4-7 |    Byte 8-13    |Byte 14-15|Byte 16 |Bytes 17-19|
|:----------------:|:-------------:|:----:|:----:|:-------:|:---------------:|:--------:|:------:|:---------:|
|       0x01       |      0x10     | CRC  | 0x09 |TimeStamp|EulerAngle Errors|  Counter |Progress| Reserved  |

#### Pedometer Command/Response (0x0A)
In the command mode, the packet enables/disables the streaming of the Pedometer data. Byte#8 will be a Boolean value representing the Enable/Disable command. The overall command mode Pedometer packet has the following structure:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command)  |Byte 4-7|     Byte 8     | Bytes 9-19 |
|:------------------:|:---------------:|:------------:|:------------------:|:------:|:--------------:|------------|
|        0x41        |       0x10      |      CRC     |  0x0A (Pedometer)  |Reserved| Enable/Disable |  Reserved  |

In the response mode, Neblina will first send an acknowledge packet to the host to confirm the successful receipt of the command. Next, the main response packet will be prepared, where the data section first includes 4 bytes for the timestamp (Byte#4-7), which is then followed by 5 bytes (Byte#8-12) with the following subfields:
##### Byte#8: step count, LSB
##### Byte#9: step count, MSB
##### Byte#10: spm (Cadence)
##### Byte#11: walking direction angle value LSB
##### Byte#12: walking direction angle value MSB
Note that the angle format includes one fractional decimal digit and it is compatible with the Euler angle representations described in the motion engine documentation. The whole response packet structure including header is shown below:

| Byte 0 | Byte 1 | Byte 2 | Byte 3 |Byte 4-7 |Byte 8-9  |Byte 10|  Byte 11-12   |Bytes 13-19|
|:------:|:------:|:------:|:------:|:-------:|:--------:|:-----:|:-------------:|:---------:|
|  0x01  |  0x10  |  CRC   |  0x0A  |TimeStamp|step count|cadence|direction angle| Reserved  |

#### MAG_Data Command/Response (0x0B)
In the command mode, the packet enables/disables the streaming of the 3-axis magnetometer data along with the 3-axis accelerometer data. Byte#8 will be a Boolean value representing the Enable/Disable command. The overall command mode MAG_Data packet has the following structure:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |  Byte 3 (command) |Byte 4-7|     Byte 8     | Bytes 9-19 |
|:------------------:|:---------------:|:------------:|:-----------------:|:------:|:--------------:|------------|
|        0x41        |       0x10      |      CRC     |  0x0B (MAG_Data)  |Reserved| Enable/Disable |  Reserved  |

In the response mode, Neblina will first send an acknowledge packet to the host to confirm the successful receipt of the command. Next, the main response packet will be prepared, where the data section first includes 4 bytes for the timestamp (Byte#4-7), which is then followed by 2*6 bytes (Byte#8-19) with the "AxesRaw_t" data structure defined before in the IMU_Data Command section. The first 6 bytes (Byte#8-13) will be a "AxesRaw_t" data structure for magnetometers, and the next 6 bytes (Byte#14-19) will be another "AxesRaw_t" data structure for accelerometer data. All the bytes are packed in little endian format. Note that the magnetoneter reading in each axis is a 16-bit signed integer representing the range: ±4 gauss.

The whole response packet structure including header is shown below:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2 (CRC)|Byte 3 (command)|Byte 4-7 |   Byte 8-13   |  Bytes 14-19  |
|:----------------:|:-------------:|:----------:|:--------------:|:-------:|:-------------:|:-------------:|
|       0x01       |      0x10     |    CRC     |      0x0B      |TimeStamp|AxesRaw_t (Mag)|AxesRaw_t (Acc)|

#### SittingStanding Command/Response (0x0C)
In the command mode, the packet enables/disables the streaming of sitting/standing modes. Byte#8 will be a Boolean value representing the Enable/Disable command. The overall command mode SittingStanding packet has the following structure:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) |   Byte 3 (command)   |Byte 4-7|     Byte 8     | Bytes 9-19 |
|:------------------:|:---------------:|:------------:|:--------------------:|:------:|:--------------:|------------|
|        0x41        |       0x10      |      CRC     |0x0C (SittingStanding)|Reserved| Enable/Disable |  Reserved  |

IIn the response mode, Neblina will first send an acknowledge packet to the host to confirm the successful receipt of the command. Next, the main response packet will be prepared, where the data section first includes 4 bytes for the timestamp (Byte#4-7), which is then followed by a single byte (Byte#8) indicating whether the person has just stood up (Byte#8 = 0x01), or has just sat down (Byte#8 = 0x00). If the person remains standing/sitting, no response packet will be sent to the host.  Next, we have 4 bytes (Byte#9-12), a 32-bit unsigned integer value packed in little endian format (LSB first), representing the amount of time in seconds the person has been sitting so far (SitTime). The next 4 bytes (Byte#13-16) construct another 32-bit unsigned integer in little endian format, which represents the amount of time in seconds the person has been standing up so far (StandTime). 
Note that if the host disables the streaming of sitting/standing mode, the SitTime and StandTime will be both reset to zero. The last 3 bytes of the packet (Byte#17-19) are reserved. The whole response packet structure including header is shown below:

|Byte 0 |Byte 1|Byte 2|Byte 3|Byte 4-7 | Byte 8  |Byte 9-12|Byte 13-16|Bytes 17-19|
|:-----:|:----:|-----:|:----:|:-------:|:-------:|:-------:|:--------:|:---------:|
| 0x01  | 0x10 | CRC  | 0x0C |TimeStamp|Sit/Stand| SitTime |StandTime | Reserved  |

#### LockHeadingRef Command (0x0D)
Neblina provides the option to lock magnetometer readings to represent the 0 degrees reference heading. When this command is issued, Neblina will wait until the device is positioned on either a horizontal or vertical plane and then the current magnetometer readings will be locked to the zero degrees heading. Therefore, whenever the device points back to the same direction, Neblina will provide correction for the heading angle to reach the reference 0 degrees. The correction is adaptive meaning that if the deviation of the heading angle caused by the Gyroscopes' drift is high enough at the reference heading angle, the correction will be aggressive. However, if the heading info is close to the zero degrees (<15 degrees), the correction will apply smoothly. The full command packet has the following structure:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2|  Byte 3 (command)   |Byte 4-19 |
|:----------------:|:-------------:|:----:|:-------------------:|:--------:|
|       0x41       |      0x10     | CRC  |0x0D (LockHeadingRef)| Reserved |

In response, Neblina will only send an acknowledge packet to indicate the successful receipt of the command issued by the host.

#### SetAccRange Command (0x0E)
This command sets the accelerometer full-scale range to either 2G (Mode 0), 4G (Mode 1), 8G (Mode 2), or 16G (Mode 3). The default mode is 2G. Byte#8 will be set to 0, 1, 2, or 3, representing the mode. The overall SetAccRange packet has the following structure:

| Byte 0 (subsystem) | Byte 1 (length) | Byte 2 (CRC) | Byte 3 (command) |Byte 4-7|Byte 8| Bytes 9-19 |
|:------------------:|:---------------:|:------------:|:----------------:|:------:|:----:|------------|
|        0x41        |       0x10      |      CRC     |0x0E (SetAccRange)|Reserved| Mode |  Reserved  |

In response, Neblina will only send an acknowledge/error packet to indicate the validity and receipt of the command issued by the host.

#### DisableAllStreaming Command (0x0F)
This command disables all the streaming options in the motion engine. The command is useful for the host applications to ensure that there is no streaming traffic on the physical layer. The data section for this command is empty. The full command packet has the following structure:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2|     Byte 3 (command)     |Byte 4-19 |
|:----------------:|:-------------:|:----:|:------------------------:|:--------:|
|       0x41       |      0x10     | CRC  |0x0F (DisableAllStreaming)| Reserved |

#### ResetTimeStamp Command (0x10)
This commands resets the timestamp value to zero. The command is useful for the host application to synchronize with the motion engine's timestamp. The data section for this command is empty. The full command packet has the following structure:

|Byte 0 (subsystem)|Byte 1 (length)|Byte 2|   Byte 3 (command)  |Byte 4-19 |
|:----------------:|:-------------:|:----:|:-------------------:|:--------:|
|       0x41       |      0x10     | CRC  |0x10 (ResetTimeStamp)| Reserved |
