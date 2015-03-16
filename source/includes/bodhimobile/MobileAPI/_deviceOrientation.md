## Device Orientation Module

Locking device orientation in specified mode.

### Tasks

  * `deviceOrientation.MODE` constant
  * `setOrientation` function

### Constants

#### `deviceOrientation.MODE`

##### Discussion

The enum contains variants of supported orientation modes.  
It used in setOrientation method.

  * `deviceOrientation.MODE.AUTO`

UI support all orientations. UI will be working in portrait and landscape
modes.

  * `deviceOrientation.MODE.PORTRAIT`

UI support only portrait orientation. UI will be working only in portrait
mode.

  * `deviceOrientation.MODE.LANDSCAPE`

UI support only landscape orientation. UI will be working only in landscape
mode.

### Functions

#### setOrientation

```javascript
deviceOrientation.setOrientation( deviceOrientation.MODE.PORTRAIT,
function(info) {  
    alert("Orientaion locked in portrait mode");  
}, function (error) {  
    alert("setOrientation! code: " + error.code + "\nmessage: " + error.message);  
});
```

`deviceOrientation.setOrientation( orientation, successCallback, errorCallback )`

##### Discussion

Lock UI in selected **orientation**.

##### Arguments

  * `orientation` required

String with required orientation mode. See [`deviceOrientation.MODE`](#deviceorientation.mode) for more
info.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always **null**.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [BodhiMobilePromise](#kernel-promise) object