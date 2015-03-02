## Audio Module

This module allows playing and recording audio.

### Tasks

  * `RBCAudioItemState` constant
  * `RBCAudioItem` object
  * `getAudio` function

### Constants

#### RBCAudioItemState

##### Discussion

This enum contains variants of [RBCAudioItem](#rbcaudioitem-class) object states.

  * `RBCAudioItemState.STOPPED`

Audio record currently stopped.

  * `RBCAudioItemState.PLAYING`

Audio record currently playing.

  * `RBCAudioItemState.PAUSED`

Audio record currently paused.

  * `RBCAudioItemState.RECORDED`

Audio record currently recorded.

### Objects

#### RBCAudioItem

##### Discussion

This object contains information about audio records and allows developer to record, play and control audio. See [RBCAudioItem Class](#rbcaudioitem-class) to get more information.

### Functions

#### getAudio

```javascript
audio.getAudio( function(info) {  
    alert("AudioItem created: " + info.audioItem);
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`audio.getAudio( options, successCallback, errorCallback )`

##### Discussion

Creates new [RBCAudioItem](#rbcaudioitem-class) object which used for all audio operations.

##### Arguments

  * `options` optional

Object with key-value. Supported keys:

    * `key` optional

A String value. The key in [App Storage](#app-storage-module). If not specified, method will create a new automatically.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `audioItem` \- The created [RBCAudioItem](#rbcaudioitem-class) object.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object