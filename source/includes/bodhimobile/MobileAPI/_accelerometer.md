## Accelerometer Module

This module provides the ability to getting current readings of the accelerometer.

### Tasks

  * `accelerationItem` object
  * `getCurrentAcceleration` function
  * `watchAcceleration` function
  * `clearWatch` function
  
### Objects

#### accelerationItem

##### Discussion

This Object contains information about triaxial acceleration.

##### Keys

  * `x` required

A Float value. Acceleration in the x axis.

  * `y` required

A Float value. Acceleration in the y axis.

  * `z` required

A Float value. Acceleration in the z axis.

  * `timestamp` required

A Date value. Timestamp of acceleration information.

### Functions

#### getCurrentAcceleration

```javascript
accelerometer.getCurrentAcceleration( function (accelerationItem) {
    alert("x: " + accelerationItem.x + ", y: " + accelerationItem.y + ", z: " + accelerationItem.z);
}, function (error) {
    alert("code: " + error.code + "\nmessage: " + error.message);
});
```

`accelerometer.getCurrentAcceleration( options, successCallback, errorCallback )`

##### Discussion

Gets current readings of the device acceleration one time. To monitor acceleration changes use `watchAcceleration`.

##### Arguments

  * `options` optional

Object with key-value. Supported keys:

    * `updateInterval`

A Float value. The maximum length of time (milliseconds) that is allowed to pass from the method call until the corresponding callbacks executes.

* `succesCallback` optional

Success callback. Called when function finished without errors.

Callback parameter is `accelerationItem` object.

* `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object


#### watchAcceleration

```javascript
var watch_id = accelerometer.watchAcceleration( function (positionInfo) {
    alert("x: " + accelerationItem.x + ", y: " + accelerationItem.y + ", z: " + accelerationItem.z);
}, function (error) {
    alert("code: " + error.code + "\nmessage: " + error.message);
});
```

`accelerometer.watchAcceleration( options, successCallback, errorCallback )`

##### Discussion

Starts watching the device acceleration.

##### Arguments

  * `options` optional

Object with key-value. Supported keys:

    * `updateInterval`

A Float value. The time interval between calls of `successCallback` function.

* `succesCallback` optional

Success callback. Called when function finished without errors.

Callback parameter is `accelerationItem` object.

* `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * A String value. This value used as parameter of `clearWatch` method to stop updating.

#### clearWatch

```javascript
accelerometer.clearWatch( watch_id );
```

`accelerometer.clearWatch( watchId )`

##### Discussion

Stops heading geolocation position.

##### Arguments

  * `watchId` required

Watch identifier which returned `watchAcceleration` method.

##### Return Value

  * No return value.