## Notifications Module

This module used to notify user about some events in application.

### Tasks

  * `vibrate` function
  * `beep` function
  * `alert` function
  * `showToast` function

### Functions

#### vibrate

```javascript
notifications.vibrate( {vibrate:400, mute:400, repeatCount:3} );
```

`notifications.vibrate( options )`

##### Discussion

Vibrates the device. Developer can configure vibration duration, mute duration
and repeat count

##### Arguments

  * `options` optional

Object with key-value. Supported keys:

    * `vibrate`

The property with a Number value. Determines vibration duration in ms. On iOS `vibrate` always 400 ms.

    * `mute`

The property with a Number value. Determines mute duration in ms between multimple vibrations.

    * `repeatCount`

The property with a Number value. Determines number of repeating "vibrate-mute" operations.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### beep

```javascript
notifications.beep( );
```

`notifications.beep( )`

##### Discussion

The device plays a beep sound.

##### Return Value

  * [RBCPromise](#kernel-promise) object


#### alert

```javascript
notifications.alert( "Title", "Message", "Cancel", ["OK"],  
function(info) {  
    alert("Pressed " + info.button + " button");  
});
```

`notifications.alert( title, message, cancelButton, otherButtons, callback )`

##### Discussion

Shows a custom alert or dialog box.

##### Arguments

  * `title` required

Dialog title. (String)

  * `message` optional

Dialog message. (String)

  * `cancelButton` required

Dialog cancel button title. (String)

  * `otherButtons` optional

Dialog other button titles. (Array of Strings)

  * `callback` optional

Callback. Called when user pressed button in alert or dialog box

Callback parameter is object and can contains keys:

    * `button` \- property with a String value. The name of pressed button.

##### Return Value

  * [RBCPromise](#kernel-promise) object


#### showToast

```javascript
notifications.showToast( "Toast Message", 2000, "bottom",  
function (error) {  
    alert("code: " \+ error.code + "\nmessage: " \+ error.message);  
});
```

`notifications.showToast( message, duration, position, errorCallback )`

##### Discussion

Shows toast notification.

##### Arguments

  * `message` required

Toast message. (String)

  * `duration` required

Duration of toast on the screen in milliseconds. (Integer)

  * `position` required

Position of toast on the screen. (String)

Supported values:

    * **top**
    * **center**
    * **bottom**

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object