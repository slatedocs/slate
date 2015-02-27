## Compass Module

This module provides the ability to getting compass readings.

### Tasks

  * `headingInfo` object
  * `watchHeading` function
  * `clearWatch` function

### Objects

#### headingInfo

##### Discussion

This Object contains information about compass heading.

##### Keys

  * `timestamp` required

A Date value. Timestamp of heading information.

  * `heading` required

A Float value. Universal heading. The value 0 means the device is pointed toward magnetic north, 90 means it is pointed east, 180 means it is pointed south, and so on. Must work on all device.

  * `magneticHeading` optional

A Float value. The value in this property represents the heading relative to the magnetic North Pole, which is different from the geographic North Pole. The value 0 means the device is pointed toward magnetic north, 90 means it is pointed east, 180 means it is pointed south, and so on.

  * `trueHeading` optional

A Float value. The value in this property represents the heading relative to the geographic North Pole. The value 0 means the device is pointed toward magnetic north, 90 means it is pointed east, 180 means it is pointed south, and so on.

### Functions

#### watchHeading

```javascript
var watch_id = compass.watchHeading( function (headingInfo) {  
    alert("Heading: " + headingInfo.heading);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`compass.watchHeading( successCallback, errorCallback )`

##### Discussion

Starts watching compass heading information.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is `headingInfo` object.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * A String value. This value used as parameter of clearWatch method to stop updating.

#### clearWatch

```javascript
compass.clearWatch( watch_id );
```

`compass.clearWatch( watchId )`

##### Discussion

Stops heading updating.

##### Arguments

  * `watchId` required

Watch identifier which returned `watchHeading` method.

##### Return Value

  * No return value.