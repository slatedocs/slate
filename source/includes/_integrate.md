# Integrating with your App


## Step 1: Include callstats.js

<aside class="error">
You can track your integration progress from our <a href= "https://dashboard.callstats.io/apps/integration"> dashboard </a>.
</aside>


```javascript
  <script src="https://cdn.socket.io/socket.io-1.4.5.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jsSHA/1.5.0/sha.js"></script>
  <script src="https://api.callstats.io/static/callstats.min.js"></script>
```
> Everything in the `callstats.js` is scoped under the callstats namespace, hence create the object.

```javascript
  var callStats = new callstats(null,io,jsSHA);
```

`callstats.js` depends on other common libraries that should be included in the HEAD tag. No need to include them again if your web application already uses them. However, make note of the socket.io.js version! We currently recommend the use of `socket.io-1.4.5.js` (socket.io.js versions older than 1.0.0 are not supported).


Add the `callstats.js` and related dependencies in the HEAD tag.

<aside class="error">
If you are using require.js, please refer to the following <a href="/#loading-with-requrie-js"> section </a>
</aside>

## Step 2: Initialize()

```javascript
  //initialize the app with application tokens
  var AppID     = "YOUR APPLICATION ID";
  var AppSecret = "YOUR APPLICATION SECRET";

  //localUserID is generated or given by the origin server
  callStats.initialize(AppID, AppSecret, localUserID, csInitCallback, csStatsCallback, configParams);
```

After the user is authenticated with the origin server (or when the page loads), call `initialize()` with appropriate parameters (see [API section](#callstats-initialize)).  Check the callback for errors.  If the authentication succeeds, `callstats.js` will receive a valid authentication token to make subsequent API calls.

For more information on callbacks, please refer to [csInitCallback](#csinitcallback) and [csStatsCallback](#csstatscallback). Also have a look at [step 8](#step-8-optional-handling-stats-from-statscallback) for csStatsCallback data handling.


## Step 3: addNewFabric()

```javascript
  //adding Fabrics
  var pc_config = {"iceServers": [{url: "stun:stun.example.org:3478"}]};
  var pcObject = new RTCPeerConnection(pc_config);

  function pcCallback (err, msg) {
    console.log("Monitoring status: "+ err + " msg: " + msg);
  };

  // pcObject is created, tell callstats about it
  // pick a fabricUsage enumeration, if pc is sending both media and data: use multiplex.

  var usage = callStats.fabricUsage.multiplex;

  //remoteUserID is the recipient's userID
  //conferenceID is generated or provided by the origin server (webrtc service)
  callStats.addNewFabric(pcObject, remoteUserID, usage, conferenceID, pcCallback);

```

When creating a _PeerConnection_, call `addNewFabric()` with appropriate parameters (see [API section](#callstats-addnewfabric)). It is important to make the request only after the _PeerConnection_ is created. The _PeerConnection_ object MUST NOT be "undefined" or NULL because `callstats.js` uses [`getStats()`](http://dev.w3.org/2011/webrtc/editor/webrtc.html#statistics-model) to query the metrics from the browser internals. The application SHOULD call `addNewFabric()` immediately after the _PeerConnection_ object is created.

Time stamp of `addNewFabric()` is used as a reference point to calculate fabric failure delay or fabric setup delay:

<aside class="error">
<ul>

<li> Fabric failure delay = timestamp of fabricSetupFailed - timestamp of addNewFabric</li>
<li> Fabric setup delay = timestamp of fabricSetup - timestamp of addNewFabric </li>

</ul>
</aside>

In any WebRTC endpoint, where multiple _PeerConnections_ are created between each participant (e.g., audio and video sent over different _PeerConnections_ or a mesh call), the `addNewFabric()` MUST be called for each _PeerConnection_.


## Step 4: reportError()

```javascript
  //adding Fabrics
  var pc_config = {"iceServers": [{url: "stun:stun.example.org:3478"}]};
  var pcObject = new RTCPeerConnection(pc_config);

  function pcCallback (err, msg) {
    console.log("Monitoring status: "+ err + " msg: " + msg);
  };

  function createOfferError(err) {
    callStats.reportError(pcObject, conferenceID, callStats.webRTCFunctions.createOffer, err);
  }

  // remoteUserID is the recipient's userID
  // conferenceID is generated or provided by the origin server (webrtc service)
  // pcObject is created, tell callstats about it
  // pick a fabricUsage enumeration, if pc is sending both media and data: use multiplex.

  var usage = callStats.fabricUsage.multiplex;
  callStats.addNewFabric(pcObject, remoteUserID, usage, conferenceID, pcCallback);

  // let the "negotiationneeded" event trigger offer generation
  pcObject.onnegotiationneeded = function () {
    // create offer
    pcObject.createOffer(localDescriptionCreatedCallback, createOfferErrorCallback);
  }
```

Sometimes WebRTC endpoints fail to establish connectivity, this may occur when user-agents and/or bridges implement differing flavors of the Session Description Protocol (SDP) or may not support some features that others implement.

The WebRTC APIs either have a callback or a Promise associated to them. Since `callstats.js ver. 3.2.x`, WebRTC applications can use `reportError()` to capture at which stage the negotiation fails and pass on the [DomError](http://www.w3.org/TR/dom/#interface-domerror) returned by the callback or Promise to callstats.io. The failure reason will appear both in the conference time-line and aggregate on the main dashboard. See Section enumerating [WebRTC functions](#enumeration-of-wrtcfuncnames) for details. The example below reports error when creating an SDP offer:


<aside class="success">
Congratulations! You have now completed the basic integration steps, read more for advanced features!
</aside>

## Step 5: (OPTIONAL) sendFabricEvent()

```javascript
callStats.sendFabricEvent(pcObject, callStats.fabricEvent.videoPause, conferenceID);

var devices = [];
var device= {
  "deviceId":"default","kind":"videoinput","label":"FaceTime HD Camera","groupId":"2004946474"
}
devices.push(device);
var eventData = {
  deviceList: devices // array of active device
};

callStats.sendFabricEvent(pcObject, callStats.fabricEvent.activeDeviceList, conferenceID, eventData);
```

During the conference, users might perform several actions impacting the measurements and conference analysis. The user might mute the audio or switch off the camera or do screen sharing during a conference. These events can directly impact the measurement data (For example, you can see a significant drop in throughput when camera is switched off). For the list of all possible conference events, please refer [here](#enumeration-of-fabricevent)

Send the appropriate `fabricEvent` via `sendFabricEvent()`.

<!-- - send `fabricSetup` after [`onaddstream` event is fired by the WebRTC API](http://dev.w3.org/2011/webrtc/editor/webrtc.html)
  and the endpoint starts to render media. The callstats javascript expects both local
  and remote endpoints to generate this event. After this event is fired, the
  callstats javascript begins performance monitoring and sending data to the
  [callstats.io]({{site.callstats.backend-url}}) backend. -->

- `fabricSetup` and `fabricSetupFailed` has been **deprecated** in v2.1.0 and v3.10.0,
  respectively, these events are now generated automatically by the JS library.

<!-- - send `fabricFailed` when a call fails to connect to the remote peer or
  to the conferencing server. For example, failing to traverse a NAT or
  middlebox (ICE failure). This event MUST be reported by a local endpoint
  when the call fails without engaging the remote endpoint. In cases where
  the call fails after signaling to the remote endpoint succeeds, each
  endpoint MUST report the event independently. -->

- send `fabricTerminated` when an endpoint or participant disconnects from
  the conference, it notifies callstats.js to stop monitoring
  the local _PeerConnection_. Depending on the implementation of the
  hangup in your WebRTC application (may have to rely on signaling), the
  remote endpoint sends a `fabricTerminated` event before destroying its
  local _PeerConnection_ object.
  callstats.io monitors each
  _PeerConnection_ in real-time, and generates summary statistics when the
  participant leaves. The summary of statistics for each conference is aggregated
  when all the participant have left. If no `fabricTerminated` event is received,
  callstats.io will summarize
  and aggregate the summary statistics _30 seconds_ after the last measurement
  for a conference is received.


## Step 6: (OPTIONAL) associateMstWithUserID()

```javascript
  // After O/A is complete, i.e., onAddStream is fired
  var localUserID  = "Alice";
  var remoteUserID = "Bob";
  var conferenceID = "AliceAndBobAndCharlie";
  var mstLabel = "front-camera";
  // SSRC1 is the SSRCs of the local video stream
  // SSRC2 is the SSRC of the remote video stream, usually received in the remote SDP
  // mstLabel is a developer provided string that lets them identify
  // various tracks (e.g., front-camera, back-camera, without looking at the
  // configurations of the individual MSTs). In this example, we assume it is the
  // front-camera.
  callStats.associateMstWithUserID(pc, localUserID, conferenceID, ssrc1, mstLabel);
  callStats.associateMstWithUserID(pc, remoteUserID, conferenceID, ssrc2, mstLabel);
```

When interacting with the conference server, the developer is most likely going to use the name or identifier associated with the conference server as the `remoteUserID`. A typical conference bridge (for example, [Jitsi Videobridge](https://jitsi.org/Projects/JitsiVideobridge)) transmits [multiple media stream tracks within a peer connection](https://hacks.mozilla.org/2015/06/firefox-multistream-and-renegotiation-for-jitsi-videobridge/). In which case, using a remote participant’s userID is impractical as there maybe several participants.

Since `callstats.js ver. 3.3.x`, we allow mapping [Synchronization Source Identifier (SSRC)](http://tools.ietf.org/html/rfc3550#section-5.1) for a mediastreamtrack to a userID (both local and remote). By default the local and remote _MediaStreamTracks_ are automatically mapped to the localUserID and remoteUserID. With `associateMstWithUserID()`, you can override the actual local and remote userIDs to the correct association. If the DOM identifiers of the video tags associated to each participant, callstats.js will calculate better quality scores for each participant. The code example shows how the API can be integrated:

<img src="/images/2015-mst-association.gif" alt="Associationg userID with MST" width="700"/>


More discussion related to the motivation of `associateMstWithUserID()` is covered in the following [blog post](/2015/07/17/api-update-handling-multiple-media-stream-tracks-callstats/).


## Step 7: (OPTIONAL) sendUserFeedback()

```javascript
  var overallRating = 4; // 1-5 rating, typically according to MOS scale.
  var feedback = {
    "userID": localUserID, //mandatory
    "overall": overallRating, //mandatory
  };
  callStats.sendUserFeedback(conferenceID, feedback, pcCallback);
```

The developers are expected to design an appropriate UI to get user input on quality at the end of the call. Typically, services collect user feedback based on the Mean Opinion Score (MOS). However, it is not neccessary to use all values of the  MOS scale, for example a service using only 2 point scale: it can associate 1 and 5 to bad and excellent, respectively and not use the values 2 to 4.


## Step 8: (OPTIONAL) Handling stats from statsCallback()

The developers can handle the stats received from statsCallback function in a way suitable to their application. It can be used for displaying bitrate or based on the conference quality indicators applications can change their settings etc. For more details check this [blog post](/2015/08/24/statscallback-webrtc-media-quality-status/).


