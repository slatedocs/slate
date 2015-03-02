## Push Notifications Module

This module provides the ability to working with Push Notifications and analogs.

  * On **iOS** used Push Notifications
  * On **Android** used Google Cloud Messaging. Server must send data for push notification with two keys: text - for notification text and title - for notification title
  * On **WP** used MPNS

### Tasks

  * `register` function
  * `unregister` function
  * `setApplicationIconBadgeNumber` function

### Functions

#### register

```javascript
pushNotifications.register( {badge:true, sound:true, alert:true},  
function(info) {  
    alert("Push token: "+info.pushToken);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`pushNotifications.register( options, successCallback, errorCallback )`

##### Discussion

Registers application to Push Notifications.

##### Arguments

  * `options` required

Object with key-value. On different platforms developer must specify different
options:

    * **On iOS**

      * _badge_

A Boolean value. The app accepts notifications that badge the app icon.

      * `sound`

A Boolean value. The app accepts alert sounds as notifications.

      * `alert`

A Boolean value. The app accepts alert messages as notifications.

    * **On Android**
    
      * `senderID`

A String value. The android sender ID.

    * **On WP**

      * `mpnsChannelName`

A String value. The name that the application uses to identify the
notification channel instance.

      * `mpnsServiceName`

A String value. The name that the web service uses to associate itself with
the Push Notification Service.

      * `tileAllowedDomains`

Array of Strings. The list of allowed domains from which to access remote
images.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains keys:

    * `pushToken` \- Push token. (String)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### unregister

```javascript
pushNotifications.unregister( function() {  
    alert("Unregistered");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`pushNotifications.unregister( successCallback, errorCallback )`

##### Discussion

Unregisters application for Push Notifications.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always *null*.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### setApplicationIconBadgeNumber

```javascript
pushNotifications.setApplicationIconBadgeNumber( 4, function() {  
    alert("Badge updated!");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`pushNotifications.setApplicationIconBadgeNumber( badge, successCallback, errorCallback )`

##### Discussion

Sets the number as the badge of the app icon.

##### Arguments

  * `badge` required

An Integer value. The number currently set as the badge of the app icon

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always *null*.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object