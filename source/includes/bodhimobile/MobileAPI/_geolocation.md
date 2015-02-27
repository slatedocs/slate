## Geolocation Module

This module provides the ability to getting geolocation coordinates.

### Tasks

  * `coordinatesInfo` object
  * `positionInfo` object
  * `getCurrentPosition` function
  * `watchPosition` function
  * `clearWatch` function
  
### Objects

#### coordinatesInfo

##### Discussion

This Object contains information about geolocation coordinates.

##### Keys

  * `latitude` required

A Float value. The latitude in degrees. Positive values indicate latitudes north of the equator. Negative values indicate latitudes south of the equator.

  * `longitude` required

A Float value. The longitude in degrees. Measurements are relative to the zero meridian, with positive values extending east of the meridian and negative values extending west of the meridian.

  * `accuracy` required

A Float value. The radius of uncertainty for the location, measured in meters.

  * `altitude` required

A Float value. The altitude measured in meters. Positive values indicate altitudes above sea level. Negative values indicate altitudes below sea level.

  * `altitudeAccuracy` required

A Float value. The accuracy of the altitude value in meters.

  * `speed` required

A Float value. The instantaneous speed of the device in meters per second.

  * `course` optional

A Float value. The course of the location in degrees true North.

#### positionInfo

##### Discussion

This Object contains information about geolocation position.

##### Keys

  * `timestamp` required

A Date value. Timestamp of coordinates information.

  * `coordinates` required

An `coordinatesInfo` Object.

### Functions

#### getCurrentPosition

```javascript
geolocation.getCurrentPosition( {}, function (positionInfo) {
    alert("Latitude: " + positionInfo.coordinates.latitude + ", Longitude: " + positionInfo.coordinates.longitude);
}, function (error) {
    alert("code: " + error.code + "\nmessage: " + error.message);
});
```

`geolocation.getCurrentPosition( options, successCallback, errorCallback )`

##### Discussion

Gets current geolocation position one time. To monitor position changes use `watchPosition`.

##### Arguments

  * `options` required

Object with key-value. Supported keys:

    * `timeout`

A Float value. The maximum length of time (milliseconds) that is allowed to pass from the method call until the corresponding callbacks executes.

    * `maximumAge`

A Float value. Accept a cached position whose age is no greater than the specified time in milliseconds.

    * `enableHighAccuracy`

A Boolean value. Provides a hint that the application needs the best possible results.

* `succesCallback` optional

Success callback. Called when function finished without errors.

Callback parameter is `positionInfo` object.

* `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object


#### watchPosition

```javascript
var watch_id = geolocation.watchPosition( {}, function (positionInfo) {
    alert("Latitude: " + positionInfo.coordinates.latitude + ", Longitude: " + positionInfo.coordinates.longitude);
}, function (error) {
    alert("code: " + error.code + "\nmessage: " + error.message);
});
```

`geolocation.watchPosition( options, successCallback, errorCallback )`

##### Discussion

Starts watching current geolocation position.

##### Arguments

  * `options` required

Object with key-value. Supported keys:

    * `timeout`

A Float value. The maximum length of time (milliseconds) that is allowed to pass from the method call until the corresponding callbacks executes.

    * `maximumAge`

A Float value. Accept a cached position whose age is no greater than the specified time in milliseconds.

    * `enableHighAccuracy`

A Boolean value. Provides a hint that the application needs the best possible results.

* `succesCallback` optional

Success callback. Called when function finished without errors.

Callback parameter is `positionInfo` object.

* `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * A String value. This value used as parameter of `clearWatch` method to stop updating.

#### clearWatch

```javascript
geolocation.clearWatch( watch_id );
```

`geolocation.clearWatch( watchId )`

##### Discussion

Stops heading geolocation position.

##### Arguments

  * `watchId` required

Watch identifier which returned `watchPosition` method.

##### Return Value

  * No return value.