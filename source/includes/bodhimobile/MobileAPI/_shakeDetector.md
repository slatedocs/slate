## Shake Detector Module

This module provides the ability to detecting when user shakes the device..

### Tasks

  * `startWatch` function
  * `clearWatch` function
  
#### startWatch

```javascript
var watch_id = shakeDetector.startWatch( function () {
    alert("Shake detected");
}, function (error) {
    alert("code: " + error.code + "\nmessage: " + error.message);
});
```

`shakeDetector.startWatch( onDetectCallback, errorCallback )`

##### Discussion

Starts detecting device shaking.

##### Arguments

* `onDetectCallback` optional

Success callback. Called when function finished without errors.

Doesn't have any arguments.

* `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * A String value. This value used as parameter of `clearWatch` method to stop updating.

#### clearWatch

```javascript
shakeDetector.clearWatch( watch_id );
```

`shakeDetector.clearWatch( watchId )`

##### Discussion

Stops detecting device shaking.

##### Arguments

  * `watchId` required

Watch identifier which returned `startWatch` method.

##### Return Value

  * No return value.