## BT Peripheral Module

This module used for working with Bluetooth 4.0 LE Peripherals.

Now supported only Health Thermometer and Battery Service GATT profiles.

### Tasks

  * `STATES` constant
  * `CONNECTION_STATES` constant
  * `peripheralInfo` object
  * `profilesInfo` object
  * `supported` property
  * `start` function
  * `stop` function
  * `getState` function
  * `startDiscovery` function
  * `stopDiscovery` function
  * `connect` function
  * `disconnect` function
  * `btPeripheral.stateChanged` event
  * `btPeripheral.peripheralsChanged` event
  * `btPeripheral.peripheralStateChanged` event
  * `btPeripheral.peripheralInfoChanged` event

### Constants

#### STATES

##### Discussion

This enum contains all states of [BT Peripheral](#bt-peripheral-module) module.

  * `btPeripheral.STATES.Unknown`

State unknown, update imminent.

  * `btPeripheral.STATES.Resetting`

The connection with the system service was momentarily lost, update imminent.

  * `btPeripheral.STATES.Unsupported`

The platform doesn't support the Bluetooth Low Energy.

  * `btPeripheral.STATES.Unauthorized`

The application is not authorized to use the Bluetooth Low Energy.

  * `btPeripheral.STATES.PoweredOff`

Bluetooth is currently powered off.

  * `btPeripheral.STATES.PoweredOn`

Bluetooth is currently powered on and available to use.

#### CONNECTION_STATES

##### Discussion

This enum contains all variants of Peripheral connection state.

  * `btPeripheral.CONNECTION_STATES.Unknown`

Unknown connection state

  * `btPeripheral.CONNECTION_STATES.Disconnected`

Peripheral Device disconnected.

  * `btPeripheral.CONNECTION_STATES.Connecting`

Peripheral Device in connection state.

  * `btPeripheral.CONNECTION_STATES.Connected`

Peripheral Device connected.

  * `btPeripheral.CONNECTION_STATES.Disconnecting`

Peripheral Device in disconnection state.

### Objects

#### peripheralInfo

##### Discussion

This Object contains information about Peripheral Device.

##### Keys

  * `id` required

A String value. Device idenfier. Used in connect and disconnect functions.

  * `name` required

An Integer value. Device Name.

  * `rssi` required

An Integer value. Current Device RSSI.

#### profilesInfo

##### Discussion

This Object contains information about supported GATT profiles which found on Peripheral Device after connection established.

##### Keys

  * `thermometer`

An Object value. Contains information from Health Thermometer GATT profile if
device supports it.

    * `timestamp`

A Date value. This information timestamp.

    * `temp`

A Float value. Current temperature.

    * `measurement`

A String value. Unit of temperature measure. F for Fahrenheit and C for Celsius degrees.

    * `location`

A String value. Location of thermometer.

  * `battery`

An Object value. Contains information from Battery Service GATT profile if
device supports it.

    * `level`

An Integer value. Current device battery level (0-100).

    * `charging`

A Boolean value. **true** if device plugged for charger. Otherwise **false**.

### Properties

#### supported

```javascript
var supported = btPeripheral.supported;
```

##### Discussion

Returns whether the device supports [BT Peripheral](#bt-peripheral-module) module.

### Functions

#### start

```javascript
btPeripheral.start( function() {  
    alert("Started.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`btPeripheral.start( successCallback, errorCallback )`

##### Discussion

Starts working with Bluetooth 4.0 LE. Developer must call this method before using all another functions.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always *null*

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### stop

```javascript
btPeripheral.stop( function() {  
    alert("Stopped.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`btPeripheral.stop( successCallback, errorCallback )`

##### Discussion

Stops working with Bluetooth 4.0 LE. Developer must call this method when all operations with it finished.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always *null*

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### getState

```javascript
btPeripheral.getState( function(info) {  
    alert("Current state: "+info.state);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`btPeripheral.getState( successCallback, errorCallback )`

##### Discussion

Gets current state. Also developer can add listener for btPeripheral.stateChanged event to receive state updates.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `state` \- Current state. See STATES for more info. (Integer)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### startDiscovery

```javascript
btPeripheral.startDiscovery( function() {  
    alert("Discovery Started.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`btPeripheral.startDiscovery( successCallback, errorCallback )`

##### Discussion

Starts scanning for peripherals. Developer can add listener for `btPeripheral.peripheralsChanged` event to receive updates of peripherals list

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always *null*

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### stopDiscovery

```javascript
btPeripheral.stopDiscovery( function() {  
    alert("Discovery Stopped.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`btPeripheral.stopDiscovery( successCallback, errorCallback )`

##### Discussion

Stops scanning for peripherals.

##### Arguments

  * `succesCallback`optional

Success callback. Called when function finished without errors

Callback parameter is always *null*

  * `errorCallback`optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### connect

```javascript
btPeripheral.connect( "46c85837-cc6e-452f-a279-f4731cec164d", function(info) {  
    alert("Peripheral connected.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`btPeripheral.connect( peripheralId, successCallback, errorCallback )`

##### Discussion

Tries to connect to peripheral device. Developer can monitor connection state
with btPeripheral.peripheralStateChanged event.

Also when connection established automatically starts receiving information
from supported GATT profiles. Developer must add listener for
btPeripheral.peripheralInfoChanged event to receive it.

##### Arguments

  * `peripheralId` required

A String value. Idenfier of peripheral device.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always *null*

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### disconnect

```javascript
btPeripheral.disconnect( "46c85837-cc6e-452f-a279-f4731cec164d", function(info) {  
    alert("Peripheral disconnected.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`btPeripheral.disconnect( peripheralId, successCallback, errorCallback )`

##### Discussion

Disconnects from peripheral device.

##### Arguments

  * `peripheralId` required

A String value. Idenfier of peripheral device.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always *null*

  * `errorCallback`optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

### Events

#### btPeripheral.stateChanged

##### Discussion

Event received when changed state of [BT Peripheral](#bt-peripheral-module) module. Working only between start and stop methods calls.

##### Callback Arguments

  * `state` \- New state. See `STATES` for more info. (Integer)

#### btPeripheral.peripheralsChanged

##### Discussion

Event received when list of found peripherals changed. Working only between startDiscovery and stopDiscovery methods calls.

##### Callback Arguments

  * `peripherals` \- The list of found `peripheralInfo` objects. (Array of Object)

#### btPeripheral.peripheralStateChanged

##### Discussion

Event received when connection state of peripheral device changed.

##### Callback Arguments

  * `peripheralId` \- Idenfier of peripheral device. (String)
  * `state` \- New state. See `CONNECTION_STATES` for more info. (Integer)

#### btPeripheral.peripheralInfoChanged

##### Discussion

Event received when supported GATT profile information received.

##### Callback Arguments

  * `peripheralId` \- Idenfier of peripheral device. (String)
  * `info` \- Updated `profilesInfo`. (Object)