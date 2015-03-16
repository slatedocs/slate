## Audio Module

This module allows playing and recording audio.

### Tasks

  * `BodhiMobileAudioItemState` constant
  * `BodhiMobileAudioItem` object
  * `getAudio` function

### Constants

#### BodhiMobileAudioItemState

##### Discussion

This enum contains variants of [BodhiMobileAudioItem](#bodhimobileaudioitem-class) object states.

  * `BodhiMobileAudioItemState.STOPPED`

Audio record currently stopped.

  * `BodhiMobileAudioItemState.PLAYING`

Audio record currently playing.

  * `BodhiMobileAudioItemState.PAUSED`

Audio record currently paused.

  * `BodhiMobileAudioItemState.RECORDED`

Audio record currently recorded.

### Objects

#### BodhiMobileAudioItem

##### Discussion

This object contains information about audio records and allows developer to record, play and control audio. See [BodhiMobileAudioItem Class](#bodhimobileaudioitem-class) to get more information.

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

Creates new [BodhiMobileAudioItem](#bodhimobileaudioitem-class) object which used for all audio operations.

##### Arguments

  * `options` optional

Object with key-value. Supported keys:

    * `key` optional

A String value. The key in [App Storage](#app-storage-module). If not specified, method will create a new automatically.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `audioItem` \- The created [BodhiMobileAudioItem](#bodhimobileaudioitem-class) object.

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [BodhiMobilePromise](#kernel-promise) object