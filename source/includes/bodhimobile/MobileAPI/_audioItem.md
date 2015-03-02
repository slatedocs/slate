## RBCAudioItem Class

This object is created by [audio.getAudio](#getaudio) method and it used for recording and playback audio.

Once an object is no longer needed developer must necessarily call close method!

### Tasks

  * `key` property
  * `state` property
  * `duration` property
  * `position` property
  * `startPlaying` function
  * `stopPlaying` function
  * `pausePlaying` function
  * `getDuration` function
  * `seekTo` function
  * `startRecording` function
  * `stopRecording` function
  * `setVolume` function
  * `onStateChanged` function
  * `onDurationChanged` function
  * `onPositionChanged` function
  * `close` function

### Properties

#### key

```javascript
// audioItem - is object created with audio.getAudio method  
var appStorageKey = audioItem.key;
```

##### Discussion

The key in [App Storage](#app-storage-module) associated with audio record.

#### state

```javascript
// audioItem - is object created with audio.getAudio method  
var state = audioItem.state;
```

##### Discussion

Current audio item state. See variants in [RBCAudioItemState](#rbcaudioitemstate).  
Developer can control changes after registering **callback** in `onStateChanged` method.

#### duration

```javascript
// audioItem - is object created with audio.getAudio method  
var duration = audioItem.duration;
```

##### Discussion

Audio record duration. Developer can control changes after registering **callback** in `onDurationChanged` method.

#### position

```javascript
// audioItem - is object created with audio.getAudio method  
var position = audioItem.position;
```

##### Discussion

Current audio record position. Developer can control changes after registering **callback** in `onPositionChanged` method.

### Functions

#### startPlaying

```javascript
// audioItem - is object created with audio.getAudio method  
audioItem.startPlaying( function() {  
    alert("Success.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`RBCAudioItem::startPlaying( successCallback, errorCallback )`

##### Discussion

Starts playing audio record.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always **null**.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### stopPlaying

```javascript
// audioItem - is object created with audio.getAudio method  
audioItem.stopPlaying( function() {  
    alert("Success.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`RBCAudioItem::stopPlaying( successCallback, errorCallback )`

##### Discussion

Stop playing audio record.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always **null**.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### pausePlaying

```javascript
// audioItem - is object created with audio.getAudio method  
audioItem.pausePlaying( function() {  
    alert("Success.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`RBCAudioItem::pausePlaying( successCallback, errorCallback )`

##### Discussion

Pause audio record playing.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always **null**.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### getDuration

```javascript
// audioItem - is object created with audio.getAudio method  
audioItem.getDuration( function(info) {  
    alert("Audio record duration: "+info.duration);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`RBCAudioItem::getDuration( successCallback, errorCallback )`

##### Discussion

Returns current audio record duration. After calling this method duration property updated automatically.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `duration` \- Duration of audio record. (Float)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### seekTo

```javascript
// audioItem - is object created with audio.getAudio method  
audioItem.seekTo( 1.5, function(info) {  
    alert("Position changed.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`RBCAudioItem::seekTo( position, successCallback, errorCallback )`

##### Discussion

Moves current playing position.

##### Arguments

  * `position` required

A Float value. New playing position. In Seconds.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always **null**.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### startRecording

```javascript
// audioItem - is object created with audio.getAudio method  
audioItem.startRecording( function() {  
    alert("Success.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`RBCAudioItem::startRecording( successCallback, errorCallback )`

##### Discussion

Starts recording audio.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always **null**.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### stopRecording

```javascript
// audioItem - is object created with audio.getAudio method  
audioItem.stopRecording( function() {  
    alert("Success.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`RBCAudioItem::stopRecording( successCallback, errorCallback )`

##### Discussion

Stops recording audio.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always **null**.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### setVolume

```javascript
// audioItem - is object created with audio.getAudio method  
audioItem.setVolume( 0.7, function(info) {  
    alert("Volume changed.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`RBCAudioItem::setVolume( volume, successCallback, errorCallback )`

##### Discussion

Changes volume for audio record.

##### Arguments

  * `volume` required

A Float value. New volume. Value must be in range [0..1].

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always **null**.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### onStateChanged

```javascript
// audioItem - is object created with audio.getAudio method  
audioItem.onStateChanged( function(info) {  
    alert("New Audio Item State: " + info.state);  
});
```

`RBCAudioItem::onStateChanged( callback )`

##### Discussion

Registers `callback` to monitor state property changes.

##### Arguments

  * `callback` optional

Callback. Called when state property changed.

Callback parameter is object which contains:

    * `state` \- [RBCAudioItemState](#rbcaudioitemstate)

##### Return Value

  * `this`

#### onDurationChanged

```javascript
// audioItem - is object created with audio.getAudio method  
audioItem.onDurationChanged( function(info) {  
    alert("New Audio Item Duration: " + info.duration);  
});
```

`RBCAudioItem::onDurationChanged( callback )`

##### Discussion

Registers `callback` to monitor duration property changes.

##### Arguments

  * `callback` optional

Callback. Called when duration property changed.

Callback parameter is object which contains:

    * `duration` \- A Float value. New audio record duration.

##### Return Value

  * `this`

#### onPositionChanged

```javascript
// audioItem - is object created with audio.getAudio method  
audioItem.onPositionChanged( function(info) {  
    alert("New Audio Item Position: "+info.position);  
});
```

`RBCAudioItem::onPositionChanged( callback )`

##### Discussion

Registers `callback` to monitor position property changes.

##### Arguments

  * `callback` optional

Callback. Called when position property changed.

Callback parameter is object which contains:

    * `position` \- A Float value. New playing position.

##### Return Value

  * `this`

#### close

```javascript
// audioItem - is object created with audio.getAudio method  
audioItem.close( function() {  
    alert("Audio Item Closed.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`RBCAudioItem::close( successCallback, errorCallback )`

##### Discussion

Closes audio item and release all resources.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always **null**

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object