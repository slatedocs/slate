## Connection Module

Getting information about current connection status.

### Tasks

  * `TYPES` constant
  * `STATES` constant
  * `RBCConnectionMonitor` object
  * `type` property
  * `state` property
  * `startMonitoring` function
  * `isOnline` function
  * `typeChanged` function
  * `stateChanged` function
  * `connection.type` event
  * `connection.state` event

### Constants

#### TYPES

##### Discussion

This enum contains all variants of internet connections types.

  * `connection.TYPES.UNKNOWN`

Unknown connection type

  * `connection.TYPES.ETHERNET`

Device connected via Ethernet  

Tip: iOS device doesn't support it.

  * `connection.TYPES.WIFI`

Device connected via Wi-Fi

  * `connection.TYPES.CELL_2G`

Device connected via 2G Cellular 

Tip: iOS device doesn't support it. Used `CELL` instead it.

  * `connection.TYPES.CELL_3G`

Device connected via 3G Cellular  

Tip: iOS device doesn't support it. Used `CELL` instead it.

  * `connection.TYPES.CELL_4G`

Device connected via 4G Cellular  

Tip: iOS device doesn't support it. Used `CELL` instead it.

  * `connection.TYPES.CELL`

Device connected via Cellular  

Tip: This varian used when application cannot determine more info about cellular connection.

  * `connection.TYPES.NONE`

Device not connected to the internet

#### STATES

##### Discussion

This enum contains simple information about internet connection.

  * `connection.STATES.UNKNOWN`

Unknown connection state

  * `connection.STATES.ONLINE`

Device has internet connection.

  * `connection.STATES.OFFLINE`

Device doesn't connected to internet

### Objects

#### RBCConnectionMonitor

##### Discussion

This object contains information about specified server availability for requests from the device. See [RBCConnectionMonitor Class](#rbcconnectionmonitor-class) to get more information.

### Properties

#### type

```javascript
var type = connection.type;
```

##### Discussion

Current internet connection type. See `TYPES` enum for variants.

#### state

```javascript
var state = connection.state;
```

##### Discussion

Current internet connection state. See STATES enum for variants.

### Functions

#### startMonitoring

```javascript
connection.startMonitoring( {url:"http://www.google.com"}, function(info) {  
    alert("Monitor created.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`connection.startMonitoring( options, successCallback, errorCallback )`

##### Discussion

Creates new [RBCConnectionMonitor](#rbcconnectionmonitor-class) object which used for monitoring specified in `options` server.

##### Arguments

  * `options` required

Object with key-value. Supported keys:

    * `url` required

A String value. Monitored server address.

    * `timeout` optional

An Number value. Optional ping timeout in seconds. By default 30 seconds.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `monitor` \- The created [RBCConnectionMonitor](#rbcconnectionmonitor-class) object.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object 

#### isOnline

```javascript
if (connection.isOnline()) {  
    alert("Device online");  
}
```

`connection.isOnline( )`

##### Discussion

Return `true` if device currently connected to internel. Otherwise return `false`.

##### Return Value

  * `true` or `false`

#### typeChanged

```javascript
connection.typeChanged( function(info) {  
    alert("Connection type changed: " + info.type);  
});
```

`connection.typeChanged( callback )`

##### Discussion

Register `callback` as observer for `connection.type` event.

##### Arguments

  * `callback`required

##### Return Value

  * `this`

#### stateChanged

```javascript
connection.stateChanged( function(info) {  
    alert("Connection state changed: " + info.state);  
});
```

`connection.stateChanged( callback )`

##### Discussion

Register `callback` as observer for `connection.state` event.

##### Arguments

  * `callback` required

##### Return Value

  * `this`

### Events

#### connection.type

##### Discussion

Event received when device determines that type of internet connection has been changed. For example if device found wi-fi network instead cellular.

#### connection.state

##### Discussion

Event received when device found or lost internet connection