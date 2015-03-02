## Local Notifications Module

This module used for showing scheduled notification for user when the application is in background.  

For example developer can schedule notification about meeting or birthday.  

Different platforms used different methods for it:

  * **On iOS** used local notifications

  * **On Android** used notifications

  * **On Windows Phone** used toasts

### Tasks

  * `notification` object
  * `add` function
  * `cancel` function
  * `cancelAll` function
  * `getScheduled` function
  * `isScheduled` function
  * `received` function
  * `localnotifications.received` event

### Objects

#### notification

```javascript
var notification = {id: "1",  
        title: "Birthday",  
        message: "Today's Birthdays Alexey",  
        badge: 1,  
        fireDate: new Date(2014, 7, 25),  
        repeat: "yearly",  
        otherInfo: null};
```

##### Discussion

This Object contains information about notification. It is simple Object value with predefined keys.

##### Keys

  * `id` required

The property with a String value. The identifier of notification.

  * `title` required

The property with a String value. The title of notification.

  * `message` optional

The property with a String value. The message of notification.

  * `badge` optional

The property with a Number value. This value will be displayed on application
icon when notification will be shown.

  * `fireDate` required

The property with a Date value. The date when notification will be shown.

  * `repeat` optional

The property with a String value. Repeat interval. The value can be one of:
secondly, minutely, hourly, daily, weekly, monthly, yearly

  * `otherInfo` optional

The property with a Object value. Developer defined data.

### Functions

#### add

```javascript
notifications.local.add( newNotification, function () {  
    alert("Notification scheduled");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`notifications.local.add( notification, successCallback, errorCallback )`

##### Discussion

Schedule new notification. If notification with id already exist it will be
rewritten.

##### Arguments

  * `notification` required

The parameter with information about new notification. See `notification` object for more info.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always *null*.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### cancel

```javascript
notifications.local.cancel( existNotification, function () {  
    alert("Notification cancelled");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`notifications.local.cancel( notification, successCallback, errorCallback )`

##### Discussion

Cancel scheduled notification.

##### Arguments

  * `notification` required

The parameter with information about new notification. See `notification` object for more info but really used only `id` key.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always *null*.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### cancelAll

```javascript
notifications.local.cancelAll( function () {  
    alert("All notifications cancelled");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`notifications.local.cancelAll( successCallback, errorCallback )`

##### Discussion

Cancel all scheduled notifications.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always *null*.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### getScheduled

```javascript
notifications.local.getScheduled( function (info) {  
    var text = "";  
    for (var i = 0; i < info.notifications.length; i++) {  
        text += " " + info.notifications[i].id;  
    }  
    alert("All notifications:"+text);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`notifications.local.getScheduled( successCallback, errorCallback )`

##### Discussion

Return all scheduled notifications.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object and can contains keys:

    * `notifications` \- The Array with `notification` objects

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### isScheduled

```javascript
notifications.local.isScheduled( existNotification, function (info) {  
    if (info.isScheduled)  
        alert("Notification Scheduled");  
    else  
        alert("Notification doesn't Scheduled");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`notifications.local.isScheduled(notification, successCallback, errorCallback )`

##### Discussion

Test scheduled notification.

##### Arguments

  * `notification` required

The parameter with information about new notification. See `notification` object for more info but really used only `id` key.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object and can contains keys:

    * `notification` \- The notification object which function received as parameter.
    * `isScheduled` \- The Boolean object. `true` is scheduled instead `false`

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### received

```javascript
notifications.local.received( function(info) {  
    alert("Notification recevied: " + info.notification.id);  
});
```

`notifications.local.received( callback )`

##### Discussion

Register `callback` as observer for localnotifications.received event.

##### Arguments

  * `callback` required

Callback which execute when application oppened by notification.

##### Return Value

  * `this`

### Events

#### localnotifications.received

##### Discussion

Event received when application oppened by notification