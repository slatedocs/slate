## RBCConnectionMonitor Class

This object is created by [connection.startMonitoring](#startmonitoring) method and used for checking the server availability.

Once an object is no longer needed developer must necessarily call stop method!

### Tasks

  * `url` property
  * `available` property
  * `onAvailableChanged` function
  * `stop` function

### Properties

#### url

```javascript
// connectionMonitor - is object created with connection.startMonitoring method  
var url = connectionMonitor.url;
```

##### Discussion

The internet address of the monitored server.

#### available

```javascript
// connectionMonitor - is object created with connection.startMonitoring method  
var serverAvailable = connectionMonitor.available;
```

##### Discussion

Current available state. Server available for requests from the device if **available** is **true**.

### Functions

#### onAvailableChanged

```javascript
// connectionMonitor - is object created with connection.startMonitoring method  
connectionMonitor.onAvailableChanged( function(info) {  
    alert("Server " + (info.available ? "" : "not ") + "available");  
});
```

`RBCConnectionMonitor::onAvailableChanged( callback )`

##### Discussion

Registers `callback` to monitor available property changes.

##### Arguments

  * `callback` optional

Callback. Called when available property changed.

Callback parameter is object which contains:

    * `available` \- A Boolean value. The server availability.

##### Return Value

  * `this`

#### stop

```javascript
// connectionMonitor - is object created with connection.startMonitoring method  
connectionMonitor.stop( function() {  
    alert("Monitoring finished.");  
}, function (error) {  
    alert("Error! code: " + error.code + "\nmessage: " + error.message);  
});
```

`RBCConnectionMonitor::stop( successCallback, errorCallback )`

##### Discussion

Stops monitoring and release all resources.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always **null**

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object