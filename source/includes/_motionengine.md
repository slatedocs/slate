# Motion Engine API
## Down sample stream

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

This function will enable the motion streaming option on Neblina with the sampling frequency defined by the `DownsampleStream()` function.

The status only shows whether the device has come to stop, started to move, or is holding its previous state. BLE packets will be sent to the host, whenever the device changes its previous motion state.

## Disable motion stream

`DisableMotionStream()`

This function will disable the motion streaming option.

## Enable 6-axis IMU stream

> The 3-axis raw data type is defined below:

```c
typedef struct { //3-axis raw data type
  int16_t Data[3];
} AxesRaw_t;
```

> The overall returned 6-axis IMU data type is defined below:

```c
typedef struct { //9-axis data type
  AxesRaw_t Acc; //accelerometer
  AxesRaw_t Gyr; //gyroscope
} IMU6AxisRaw_t;
```

`EnableSixAxisIMUStream()`

This function will enable the streaming of the 6-axis Inertial Measurement Unit (IMU) data including 3-axis accelerometers and 3-axis gyroscopes.
<aside class="notice">
Each axis will be a 16-bit signed number representing the following range:<br>
Accelerometer: ±2g, Gyroscope: ±2000 dps.
</aside>

## Disable 6-axis IMU stream

`DisableSixAxisIMUStream()`

This function will disable the streaming of the 6-axis IMU data.

## Enable quaternion stream

> The quaternion data structure is given below:

```c
typedef struct Quaternion_t //quaternion
{
  int16_t q[4]; //fixed-point normalized quaternion with 15 fractional bits
} Quaternion_t;
```

`EnableQuaternionStream()`

This function enables the streaming of unit-length quaternion orientation using our computationally efficient and robust proprietary orientation filter.
The unit-length quaternion contains 4 entries, i.e., \\(q = [q_1,q_2,q_3,q_4]\\), where \\(-1  ≤ q_{1:4} ≤ 1\\), and \\(q_{12} + q_{22} + q_{32} + q_{42} = 1\\).

The real numbers \\(q_{1:4}\\) are represented using a 16-bit fixed-point number format, where 15-bits are assigned to the fractional part along with a sign bit. Here is an example of how we calculate the 16-bit fixed-point representation of a real number \\(x=0.257812\\) in the range of \\([-1,1]\\):

\\[xfixp = round(x \times 215) = 8445\\]

The integer number \\(8445\\), which is represented by a 16-bit signed integer number, refers to the real-number \\(8445215 = 0.2577209\\), which obviously deviates from the actual reference number \\(x = 0.257812\\). The fixed-point representation error for the number \\(x = 0.257812\\) is \\(0.257812 - 0.2577209 = 0.0000911\\).

Using the above approach all real numbers \\(q_{1:4}\\) are encoded using a 16-bit fixed-point representation and 15 fractional bits.

## Disable quaternion stream

`DisableQuaternionStream()`

This function disables the streaming of the quaternion data.

## Enable Euler angle stream

> The Euler angle data type is given below:

```c
typedef struct Euler_fxp_t //fixed-point Euler angles, i.e., round(angle*10)
{
  int16_t yaw; //first rotation, around z-axis
  int16_t pitch; //second rotation, around y-axis
  int16_t roll; //third rotation, around x-axis
} Euler_fxp_t;
```

`EnableEulerAngleStream()`

The orientation can easily be visualized using Euler angles, which can be found from the quaternion orientation. This command will enable/disable Neblina to stream Euler angles in the so-called aerospace sequence, where the Yaw rotation (around z-axis) takes place first, which is then followed by Pitch (rotation around y-axis) and then Roll (rotation around x-axis). This function enables the streaming of the orientation Euler angles.

Each Euler angle is represented by 16 bits. The Euler angles are read in degrees and they have the following ranges: \\(Yaw \in [-180,180]\\), \\(Pitch \in [-90,90]\\), \\(Roll \in [-180,180]\\).

The angles are represented by one fractional digit precision using the following equation:

\\[angle_est = round(angle_ref \times 10)\\]

For instance, the angle \\(-104.731^{\circ}\\) is rounded to \\(-104.8^{\circ}\\), and is represented using 16-bit signed integer format as the number -1048.

## Disable Euler angle stream

`DisableEulerAngleStream()`

This function disables the streaming of the orientation Euler angles.

## Enable external force stream

`EnableExternalForceStream()`

The accelerometer data captures the total force vector applied to the device including gravity. This command will ask Neblina to enable/disable streaming the external force vector excluding gravity.

The x, y, z components of the external force vector are defined in the reference Earth frame (not the sensor body frame). This means that regardless of the device’s orientation, this force vector aligns with the fixed reference Earth frame and can be used for position tracking, etc. The external force components, x, y, z are 16-bit signed integer numbers covering the range of [-1g,1g]. This is due to the fact that the accelerometer data range is set to [-2g,2g], while the gravity vector is (0,0,1g). The data structure for external force is given below:
```c
typedef struct Fext_Vec16_t { //external force vector
int16_t x;
int16_t y;
int16_t z;
}Fext_Vec16_t;
```

## Disable external force stream

`DisableExternalForceStream()`

This function disables the streaming of the external force vector.

## Set 9-axis mode

`SetNineAxisMode()`

Our proprietary orientation filter works for both the IMU case (6-axis accelerometer/gyro combo), as well as the full 9-axis MARG case adding magnetometers. This command will set the mode to the 9-axis case, which is the default option on Neblina. Magnetometers are pre-calibrated at factory in an environment with minimum external magnetic disturbance. Generally, due to the presence of metal objects, indoor concrete, big LCDs in a lab environment, etc., the calibrated magnetometers might fail to deliver accurate heading calculations indoors. Our proprietary 9-axis orientation filter is capable of detecting external magnetic disturbance, and will temporarily exclude magnetometers from the fusion process until the magnetic field becomes clean again. For example, if you are walking near a concrete column indoors, the filter switches to the 6-axis mode temporarily, and waits until the distance from the object is far enough, and then, it switches back to the 9-axis mode.

## Set 6-axis mode

`SetSixAxisMode()`

If you are using Neblina outdoors or indoors with few sources of disturbance for the magnetic field, the pre-calibrated magnetometers will function really well. However, in particular lab environments with several sources causing magnetic disturbance, one might simply try the 6-axis IMU mode without magnetometers using this API. It is notable that using the IMU mode, the heading information will eventually be lost due to the presence of drift in gyroscope readings. However, in the IMU mode, the gyro’s zero-bias drift can successfully be tracked and compensated. There is just no reference to correct the calculated heading angle, if it deviates from the actual heading.

## Enable pedometer stream

> The data structure regarding the pedometer step count, and cadence is given below:

```c
typedef struct steps_t { //steps and pedometer data types
uint8_t step_detect; //detection of a step gives 1. It also gives 1, if no step has been detected for 5 seconds
uint16_t step_cnt; //number of steps taken so far.
uint8_t spm; //cadence: number of steps per minute
}steps_t;
```

`EnablePedometerStream()`

The pedometer is configured to detect human steps, while walking or running. It is also applicable to cycling. The pedometer on Neblina is built based on the assumption that the device is attached or strapped to the front of the leg above the knee or all the way up to the top of the thigh. It is recommended that the device is attached closer to the knee rather than the top of the thigh for better accuracy. Furthermore, the device should be attached to the front of the leg, and not attached to the side or back of the leg.

The step count is a 16-bit unsigned integer value, and it shows the number of steps that has been taken so far by the person, who is wearing Neblina on his leg. A packet will also be sent to the host every 5 seconds, if there has been no steps recorded for the past 5 seconds. The steps per minute (spm) also known as cadence is an average value calculated among the last 4 steps. The average recreational runner has a cadence value in the range of 150-170 spm.
The pedometer here is simply applicable to cycling activities as well. With the same positioning of Neblina on the front of the leg, the step count will represent the total number of 360orotations applied to the pedals and the cadence value will similarly be valid.

Additionally, the pedometer on Neblina provides the heading angle information, i.e., the direction of walking/running/cycling with respect to the magnetic north. There are certain conditions that must be taken into account in order for the heading angle information to be useful. Firstly, the device has to be placed on the front of the thigh, such that its x-axis is aligned with the leg (pointing either up or down) and the y-axis is perpendicular to the leg pointing to your left. Note that the direction of x and y-axis are shown on the Neblina PCB. If Neblina is configured in the 6-axis IMU mode (no magnetometers), then there is no reference for heading angle calculation, and under such conditions, the heading angle returned by the Pedometer will show the change in the heading angle between the current step, and the previously detected step. That way, the left/right turns within walking/running can easily be detected, although the actual direction of walking will be lost eventually. The heading angle in the 9-axis mode (or its change in the 6-axis mode) is returned as a 16-bit signed integer using one decimal fractional digit as follows:

6-axis mode, heading_angle difference: `round(HeadingAngleDiff * 10)`

9-axis mode, heading_angle: `round(HeadingAngle * 10)`.

## Disable pedometer stream

`DisablePedometerStream()`

This function disables the pedometer streaming. Note that if we disable the pedometer streaming, the step count value will be reset to zero. Hence, on the host side, if needed, the user should store the last step count value before disabling the pedometer.

## Start trajectory record

`StartTrajectoryRecord()`

Neblina provides the capability to record an orientation trajectory, a reference path for the moving object, on the fly. The recorded trajectory can be the swing of a stick with Neblina being attached to it, a hand motion, etc. This command asks Neblina to start recording the orientation values. After this command is issued, the recording will start as soon the device starts moving, and it starts right away, if the device is already in motion. The recording automatically stops when the device stops moving. One can also issue an optional stop recording command as well to stop the recording process at any time.

We recommend that users use slow motions to record the reference orientation trajectory. That way the reference trajectory can be built more accurately. It is also notable that due to memory limitations, the reference trajectory cannot be longer than 20 seconds. If we reach 20 seconds, the recording will stop automatically.

## Stop trajectory record

`StopTrajectoryRecord()`

This optional command can only be issued after sending the TrajectoryRecStart command to stop the in-process recording for the orientation trajectory. If that does not occur an error log will be recorded by Neblina. Note that the recording stops automatically as the device comes to stop. Hence, it is not mandatory to call this function to stop the recording process.

## Enable trajectory information stream

`EnableTrajectoryInfoStream()`

After the recording of a reference orientation trajectory is stopped (either by issuing the optional command StopTrajectoryRecord() or by the device itself as it comes to stop with no motion), we can enable the streaming of the orientation tracker. This checks the device orientation in real-time to see how far we are from the reference pre-recorded orientation trajectory. The distance is returned in terms of the error we face in Yaw, Pitch and Roll, in degrees. Furthermore, the device counts how many times the recorded pattern has been repeated. It also captures how much of the track has been covered so far (0% to 100%). Whenever the full trajectory is covered, the counter is increased by 1, and the progress percentage is reset to 0%.

If the fusion type is IMU, then the Euler angle error is only reported in Pitch and Roll, while we have the error in Yaw to be zero. This is due to the fact that in the IMU mode, there is no reference information to correct the heading angle. On the other hand, in the MARG mode, the error is reported in all three angles. If we issue this command to enable streaming before recording a reference track, or if the reference track is too short with very few samples, e.g., less than 1 second of recorded data, then an error log will be recorded by Neblina. The errors in Yaw, Pitch and Roll are returned as 16-bit signed integer numbers.

## Disable trajectory information stream

`DisableTrajectoryInfoStream()`

This function disables the tracking of the orientation trajectory.


## Enable magnetometer data stream

`EnableMAGStream()`

This function will enable the streaming of the 3-axis magnetometer data. Each axis will be a 16-bit signed number representing the range: ±4 gauss.
The magnetometer, accelerometer, and gyroscope data are together represented with the following data structure:

```c
typedef struct { //3-axis raw data type
  int16_t Data[3];
} AxesRaw_t;
typedef struct { //9-axis data type
	AxesRaw_t Acc; //accelerometer
	AxesRaw_t Gyr; //gyroscope
	AxesRaw_t Mag; //magnetometer
} IMURaw_t;
```

## Disable magnetometer data stream

`DisableMAGStream()`
This function will disable the streaming of the magnetometer data.

While the aforementioned motion engine APIs issue commands to Neblina to control its settings and streaming options, the next set of APIs will instantaneously return the last updated motion features reported by Neblina to the host.

## Get motion stream

`GetMotionStatus(motionstatus_t* motion, uint32_t* TimeStamp)`

This function has no inputs and it returns the most recent motion status of Neblina, which has been streamed at the TimeStamp in microseconds. The function only returns valid motion states, if the motion streaming option has been previously activated.

## Get 9-axis raw data

`GetNineAxisRawData(IMURaw_t* data, uint32_t* TimeStamp)`

This function has no inputs and it returns the most recent 9-axis raw MARG data reported by Neblina at the TimeStamp in microseconds

## Get quaternion vector

`GetQuaternionVector(Quaternion_t* quatrn, uint32_t* TimeStamp)`

returns quaternion

## Get Euler angles

`GetEulerAngles(Euler_fxp_t* angles, uint32_t* TimeStamp)`

returns Euler angles

## Get external force

`GetExternalForceEarthFrame(Fext_Vec16_t* fext, uint32_t* TimeStamp)`

returns force

## Get Euler angle error

`GetEulerAngleErr(Euler_fxp_t* angles_err, uint32_t* TimeStamp)`

This function returns the Euler angle errors at TimeStamp in comparison with the pre-recorded orientation trajectory. The errors are in degrees and are integer values.

## Get pedometer information

`GetPedometerInfo(steps_t* steps, int16_t* direction, uint32_t* TimeStamp)`

This function returns the steps information including step count and cadence as well as the walking/running/cycling direction in degrees. If the fusion type is 9-axis this would be the heading angle in degrees in comparison with the magnetic north vector, otherwise, for the 6-axis mode, the direction will represent the change in the heading angle in degrees.

There is another API function that gets called every time a new BLE packet buffer targeting the motion engine is received by the host:

## Motion Engine Call Back Functions

Alternatively, developers can define API call-backs whenever a new motion feature has been updated using the following function pointers:

```c
typedef void (*Motion_CallBack)(motionstatus_t motion, uint32_t TimeStamp);
typedef void (*IMU_6Axis_CallBack)(IMU_6Axis_t data, uint32_t TimeStamp);
typedef void (*Quaternion_CallBack)(Quaternion_t quatrn, uint32_t TimeStamp);
typedef void (*EulerAngle_CallBack)(Euler_fxp_t angles, uint32_t TimeStamp);
typedef void (*ExternalForce_CallBack)(Fext_Vec16_t fext, uint32_t TimeStamp);
typedef void (*EulerAngleErr_CallBack)(Euler_fxp_t angles_err, uint32_t TimeStamp);
typedef void (*Pedometer_CallBack)(steps_t steps, int16_t direction, uint32_t TimeStamp);
typedef void (*MAG_CallBack)(AxesRaw_t data, uint32_t TimeStamp);

typedef struct MotionEngine_CallBack_CFG_t
{
	Motion_CallBack MotionStatus_CallBk;
	IMU_6Axis_CallBack IMU_6Axis_CallBk;
	Quaternion_CallBack Quaternion_CallBk;
	EulerAngle_CallBack EulerAngle_CallBk;
	ExternalForce_CallBack ExternalForce_CallBk;
	EulerAngleErr_CallBack EulerAngleErr_CallBk;
	Pedometer_CallBack Pedometer_CallBk;
	MAG_CallBack MAG_CallBk;
	SitStand_CallBack SitStand_CallBk;
} MotionEngine_CallBack_CFG_t;
```

> For example, one might define a single API call-back regarding pedometer as follows:

```c
void PedometerCallBackFunction(steps_t steps, int16_t direction, uint32_t TimeStamp)
{
//Everytime a new packet corresponding to pedometer data has arrived, this function is called with the appropriate input arguments
//write your code below...
	return;
}

//API call-backs for the motion engine configuration data
MotionEngine_CallBack_CFG_t g_MotionEngine_CallBackCfg = {
		NULL, //motion status
		NULL, //6-axis IMU data - accelerometer and gyroscope
		NULL, //Quaternion
		NULL, //Euler Angles
		NULL, //External Force
		NULL, //Euler Angle Error
		PedometerCallBackFunction, //Pedometer
		NULL, //Magnetometer data
		NULL, //Sitting/Standing Report
};
```

## Update Motion Features Main API Function

`
Host_RcvdPacket_UpdateMotionFeatures(uint8_t* buf, Motion_Feature_t* dev, MotionEngine_CallBack_CFG_t cfg)
`

> The motion features list has the following data structure:

```c
typedef struct Motion_Feature_t{ //all features
	uint8_t motion; //0: no change in motion, 1: stops moving, 2: starts moving
	IMURaw_t IMUData;
	Quaternion_t quatrn;
	Euler_fxp_t angles;
	Fext_Vec16_t force;
	Euler_fxp_t angles_err; //error in Euler angles compared to a reference trajectory
	uint16_t motiontrack_cntr; //shows how many times the pre-recorded track has been repeated
	uint8_t motiontrack_progress; //the percentage showing how much of a pre-recorded track has been covered
	uint32_t TimeStamp; //in microseconds
	steps_t steps;
	int16_t direction;
} Motion_Feature_t;
```

This is an important function that should be called every time a new BLE packet `buf` targeting the motion engine is received by the host.

This function will essentially update one or more features from the motion features list including motion status, 9-axis raw data, quaternion, Euler angles, external force, Euler angle errors, Pedometer, etc.

The `cfg` argument defines all the user-defined API call back functions for specific motion features.
