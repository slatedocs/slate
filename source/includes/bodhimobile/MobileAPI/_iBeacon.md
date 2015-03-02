## iBeacon Module

This module provides the support for working with iBeacons. Developer can use iBeacon module in 2 variants:

  1. **Can add and monitor regions.**
    * If application in background when device falls into the region of iBeacon user will receive predefined notification.
    * If application in foreground developer can receive iBeacon.didEnterToRegion, iBeacon.didExitFromRegion, iBeacon.didFoundBeaconsInRegion events.
  2. **Can add and monitor separate iBeacon markers.**
    * If application in background when device finds iBeacon marker user will receive predefined notification.
    * If application in foreground developer can receive iBeacon.didFoundBeacon and iBeacon.didLostBeacon events.

Both variants can be used simultaneously. Developer can monitor regions and specific iBeacons in one moment.

### Tasks

  * `notificationInfo` object
  * `regionInfo` object
  * `beaconInfo` object
  * `supported` property
  * `getRegions` function
  * `addRegion` function
  * `checkRegion` function
  * `removeRegion` function
  * `removeAllRegions` function
  * `addBeacon` function
  * `getBeacons` function
  * `removeBeacon` function
  * `removeAllBeacons` function
  * `iBeacon.didEnterToRegion` event
  * `iBeacon.didExitFromRegion` event
  * `iBeacon.didFoundBeaconsInRegion` event
  * `iBeacon.didFoundBeacon` event
  * `iBeacon.didLostBeacon` event

### Objects

#### notificationInfo

```javascript
var notificationInfo = {
  title: 'Region 1',
  message: 'You did enter to region',
  url: 'http://www.google.com'
}; 
```

##### Discussion

This Object contains information about users notifications.

##### Keys

  * `title`

A String value. Local notification title.

  * `message`

A String value. Local notification message.

  * `url`

A String value. Link that will open after application will be opened from notification.

#### regionInfo

```javascript
var regionInfo = {
  uuid: 'b614b5eb-80fa-433b-ba25-dfadc540811a',
  enter_notification: {
    title: 'Region 1',
    message: 'You did enter to region',
    url: 'http://www.google.com'
  }
}; 
```

##### Discussion

This Object contains information about iBeacon region.

##### Keys

  * `uuid` required

A String value. Region's proximity UUID.

  * `enter_notification` required

An `notificationInfo` Object. Contains information about notification that will be displayed if the device entered to the region and application was in background.
    
#### beaconInfo

```javascript
var regionInfo = {
  uuid: 'b614b5eb-80fa-433b-ba25-dfadc540811a',
  major: 1,
  minor: 1,
  found_notification: {
    title: 'iBeacon 1',
    message: 'You did found iBeacon',
    url: 'http://www.google.com'
  }
}; 
```

##### Discussion

This Object contains information about iBeacon.

##### Keys

  * `uuid` required

A String value. iBeacon proximity UUID.

  * `major` required

An Integer value. iBeacon major.

  * `minor` required

An Integer value. iBeacon minor.

  * `proximity` optional

A String value. Can have unknown, immediate, near, far value. Presented only in `iBeacon.didFoundBeaconsInRegion` event.

  * `found_notification` required

An `notificationInfo` Object. Contains information about notification that will be displayed if the device found the iBeacon when application was in background.

### Properties

#### supported

```javascript
var supported = iBeacon.supported;
```

##### Discussion

Returns whether the device supports iBeacons monitoring.

### Functions

#### getRegions

```javascript
iBeacon.getRegions( function(info) {  
    alert("Monitored regions count: " + info.regions.length);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`iBeacon.getRegions( successCallback, errorCallback )`

##### Discussion

Returns a list of regions which the monitored currently.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `regions` - The list of `regionInfo` objects. (Array of Object)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### addRegion

```javascript
var region = {  
  uuid: "b614b5eb-80fa-433b-ba25-dfadc540811a",  
  enter`notification: {  
    title: "Hello!",  
    message: "You are in region",  
    url: "http://www.google.com"
  }
};

iBeacon.addRegion( region, function(info) {  
    alert("Region added.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`iBeacon.addRegion( region, successCallback, errorCallback )`

##### Discussion

Adds new region to monitoring.

##### Arguments

  * `region` required

A `regionInfo` object. Contains information about new iBeacon region.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `region` - Added `regionInfo` object. (Object)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### checkRegion

```javascript
iBeacon.checkRegion( "b614b5eb-80fa-433b-ba25-dfadc540811a", function(info) {  
    if (info.inside)  
        alert("You are inside.");  
    else  
        alert("You are outside.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`iBeacon.checkRegion( uuid, successCallback, errorCallback )`

##### Discussion

Checks whether the device is within the region with `uuid`.

##### Arguments

  * `uuid` required

A String value. Checked region's proximity UUID.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `region` - Checked `regionInfo` object. (Object)

    * `inside` - `true` if the device is inside the region. Otherwise `false`. (Boolean)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### removeRegion

```javascript
iBeacon.removeRegion( "b614b5eb-80fa-433b-ba25-dfadc540811a", function(info) {  
    alert("Region removed.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`iBeacon.removeRegion( uuid, successCallback, errorCallback )`

##### Discussion

Removes the region with `uuid` from monitoring.

##### Arguments

  * `uuid` required

A String value. Removed region's proximity UUID.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `region` - Removed `regionInfo` object. (Object)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### removeAllRegions

```javascript
iBeacon.removeAllRegions( function() {  
    alert("All regions removed.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`iBeacon.removeAllRegions( successCallback, errorCallback )`

##### Discussion

Removes all regions from monitoring.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always *null*

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### addBeacon

```javascript
var beacon = {  
  uuid: "b614b5eb-80fa-433b-ba25-dfadc540811a",  
  major: 1,  
  minor: 1,  
  found`notification: {  
    title: "Hello!",  
    message: "You found beacon",  
    url: "http://www.google.com"
  }
};  
iBeacon.addBeacon( beacon, function(info) {  
    alert("Beacon added.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`iBeacon.addBeacon( beacon, successCallback, errorCallback )`

##### Discussion

Adds new iBeacon to monitoring.

##### Arguments

  * `options` required

A `beaconInfo` object. Contains information about new iBeacon.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `beacon` - Added `beaconInfo` object. (Object)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### getBeacons

```javascript
iBeacon.getBeacons( function(info) {  
    alert("Monitored beacons count: " + info.beacons.length);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`iBeacon.getBeacons( successCallback, errorCallback )`

##### Discussion

Returns a list of iBeacons which the monitored currently.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `beacons` \- The list of `beaconInfo` objects. (Array of Object)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### removeBeacon

```javascript
var beacon = {  
  uuid: "b614b5eb-80fa-433b-ba25-dfadc540811a",  
  major: 1,  
  minor: 1
};  
iBeacon.removeBeacon( beacon, function(info) {  
    alert("Beacon removed.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`iBeacon.removeBeacon( beacon, successCallback, errorCallback )`

##### Discussion

Removes the iBeacon from monitoring.

##### Arguments

  * `beacon` required

A `beaconInfo` object. Removed iBeacon information. Must contain uuid, major and minor fields.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `beacon` \- Removed `beaconInfo` object. (Object)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### removeAllBeacons

```javascript
iBeacon.removeAllBeacons( function() {  
    alert("All iBeacons removed.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`iBeacon.removeAllBeacons( successCallback, errorCallback )`

##### Discussion

Removes all iBeacons from monitoring.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always *null*

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

### Events

#### iBeacon.didEnterToRegion

##### Discussion

Event received when the device enters to the monitored region.

##### Callback Arguments

  * `region` \- A `regionInfo` object. (Object)

#### iBeacon.didExitFromRegion

##### Discussion

Event received when the device exits from the monitored region.

##### Callback Arguments

  * `region` \- A `regionInfo` object. (Object)

#### iBeacon.didFoundBeaconsInRegion

##### Discussion

Event received when the device updated the list of beacons in the region where it is.

##### Callback Arguments

  * `region` \- regionInfo object. (Object)
  * `beacons` \- The list of beaconInfo objects. (Array of Object)

#### iBeacon.didFoundBeacon

##### Discussion

Event received when the device found the monitored iBeacon.

##### Callback Arguments

  * `beacon` \- A `beaconInfo` object. (Object)

#### iBeacon.didLostBeacon

##### Discussion

Event received when the device lost the monitored iBeacon.

##### Callback Arguments

  * `beacon` \- A `beaconInfo` object. (Object)