# API Enums

## Enumeration of fabricUsage

Usage       | Description
------------- | -----------
`multiplex`  | Describes a _PeerConnection_ carrying multiple media streams on the same port.
`audio`  | Describes an audio-only _PeerConnection_.
`video`  | Describes a video-only _PeerConnection_.
`screen`  | Describes a screen-sharing _PeerConnection_. 
`data`  | Describes a _PeerConnection_ with only DataChannels.
`unbundled`  | Describes a _PeerConnection_ carrying media streams on different ports.

When using a single _PeerConnection_ between a pair of userIDs for sending and receiving audio and video, application MUST use `multiplex`.

<!-- Currently monitoring DATA traffic is NOT SUPPORTED, because the browser does not yet implement any DataChannel statistics. -->


## Enumeration of fabricEvent

Name  | Description
---------  | -----------
`fabricSetupFailed`  | The _PeerConnection_ failed to set up communication between the two endpoints.
`fabricHold` | The fabric is currently not sending and receiving any media, but the connection is still active.
`fabricResume`  | The fabric is resuming communication wiht the remote endpoint.
`audioMute` | The fabric is currently not sending any Audio, but MAY be sending video.
`audioUnmute` | The fabric is resuming Audio communication.
`videoPause` | The fabric is currently not sending any Video, but MAY be sending audio.
`videoResume` | The fabric is resuming Video communication.
`fabricTerminated`  | The _PeerConnection_ is destroyed and is no longer sending or receiving any media.
`screenSharingStart`  | The _PeerConnection_ started the screen sharing.
`screenSharingStop`  | The _PeerConnection_ stopped the screen sharing.
`dominantSpeaker`  | The userID reports that it is the dominant speaker and not the remote participants.
  

## Enumeration of wrtcFuncNames

Function Name  | Description
---------  | -----------
`getUserMedia`  | The failure occured in getUserMedia function (added in callstats.js version 3.4.x).
`createOffer`  | The failure occured in createOffer function.
`createAnswer`  | The failure occured in createAnswer function.
`setLocalDescription`  | The failure occured in setLocalDescription function.
`setRemoteDescription`  | The failure occured in setRemoteDescription function.
`addIceCandidate`  | The failure occured in addIceCandidate function.
`iceConnectionFailure`  | Ice connection failure detected by the application.
`signalingError`  | Signaling related errors in the application.


## csError Types

Function Name  | Description
---------  | -----------
`httpError`  | HTTP error, the `csErrMsg` string is reported by [`jQuery.ajax()`](http://api.jquery.com/jQuery.ajax/).
`authError`  | Authentication failed, AppID or AppSecret is incorrect.
`wsChannelFailure`  | Connection failed, could not connect to callstats.io over WebSockets.
`csProtoError`  | The client library is sending malformed messages. 
`success`  | The backend has accepted the request and the endpoint is authenticated, or capable of sending measurement data.
`appConnectivityError`  | The connectivity checks for given _PeerConnection_ object failed, i.e., iceConnectionState is set to disconnected.

- `csProtoError`: This may happen due to a change in the metrics or formatting of the current statistics API implemented by the browser.