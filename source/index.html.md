---
title: API Reference

language_tabs:
  - Javascript

toc_footers:
  - <a href='#'>Made by hand in HELSINKI</a>
 
includes:
  - errors

search: true
---

# Introduction

Welcome to the callstats.io API! 

The callstats.io's Javascript client library enables performance monitoring features in browser-based WebRTC endpoints. The communication with [callstats.io]({{site.callstats.backend-url}}) occurs over _Secure HTTP_ (`https://`) and _Secure WebSocket_ (`wss://`). The endpoint (the browser in this case) MUST support [WebSockets](http://socket.io/). Additionally, the origin server MUST allow _Cross-Origin Resource Sharing_ ([CORS](http://enable-cors.org/server.html)) and MAY need to serve its own pages over HTTPS to avoid mixed content warnings.

# Authentication

[callstats.io]({{site.callstats.backend-url}}) offers two authentication
methods:

1. Basic over HTTPS (requires only client implementation)

2. Third Party Authentication (requires changes in both the client and origin server).


## Basic Authentication over HTTPS

The application requires an `AppID` and `AppSecret` to authenticate with [callstats.io]({{site.callstats.backend-url}}). The origin server is expected to pass the `userID` for each endpoint in a WebRTC call. The `callstats.js` internally implements a 4-way handshake, comprising of the following steps request-challenge-response-success/failure. If successful, the callstats.js generates a token valid for {{site.callstats.auth_token_validity}}. The `token` is  subsequently used by the callstats.js to send event and measurement data to [callstats.io]({{site.callstats.backend-url}}).

### Whitelisting

[callstats.io]({{site.callstats.backend-url}}) uses the “Origin” header in the HTTP request to fetch the request’s origin. [RFC6454](http://tools.ietf.org/html/rfc6454#section-4) explains the algorithm used by user-agents to compute the “Origin” header.

[callstats.io]({{site.callstats.backend-url}}) compares the Origin URL sent by the HTTP user-agent in the authentication message with the stored Origin URL for that particular AppID. If the origins match, callstats.io returns a new token and associates the token to the requesting userID. Alternatively, if the origins does not match, callstats.io rejects the request, and denies access to that particular user-agent.

## Third-party Authentication

Instead of relying only on the endpoint for authentication, the callstats.io also implements OAuth, which requires the origin server to handle the challenge-response step of the authentication setup instead of the endpoint.

# Integrating with your Application

## Step 1: Include callstats.js 

`callstats.js` depends on other common libraries that should be included in the HEAD tag. No need to include them again if your web application already uses them. However, make note of the socket.io.js version! We currently recommend the use of `socket.io-1.2.0.js` (socket.io.js versions older than 1.0.0 are not supported).


Add the `callstats.js` and related dependencies in the HEAD tag.

```javascript
  <script src="https://cdn.socket.io/socket.io-1.2.0.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jsSHA/1.5.0/sha.js"></script>
  <script src="https://api.callstats.io/static/callstats.min.js"></script>
```
> Everything in the `callstats.js` is scoped under the callstats namespace, hence create the object.

```javascript
  var callStats = new callstats(null,io,jsSHA);
```


## Step 2: Initialize()

After the user is authenticated with the origin server (or when the page loads), call `initialize()` with appropriate parameters (see [API section](#api)).  Check the callback for errors.  If the authentication succeeds, `callstats.js` will receive an appropriate authentication token to make subsequent API calls.

```javascript
  //initialize the app with application tokens
  var AppID     = "YOUR APPLICATION ID";
  var AppSecret = "YOUR APPLICATION SECRET";

  function initCallback (err, msg) {
    console.log("Initializing Status: err="+err+" msg="+msg);
  }

  //userID is generated or given by the origin server
  callStats.initialize(AppID, AppSecret, userID, initCallback, statsCallback, configParams);
```


## Step 3: addNewFabric()

When creating a _PeerConnection_, call `callStats.addNewFabric()` with appropriate parameters (see [API section](#api)). It is important to make the request only after the _PeerConnection_ is created. The _PeerConnection_ object MUST NOT be "undefined" or NULL because `callstats.js` uses [`getStats()`](http://dev.w3.org/2011/webrtc/editor/webrtc.html#statistics-model) to query the metrics from the browser internals. The application should call `addNewFabric()` immediately after the _PeerConnection_ object is created. 

```javascript
  //adding Fabrics
  var pc_config = {"iceServers": [{url: "stun:stun.example.org:3478"}]};
  var pc = new RTCPeerConnection(pc_config);

  function pcCallback (err, msg) {
    console.log("Monitoring status: "+ err + " msg: " + msg);
  };

  // pc is created, tell callstats about it
  // pick a fabricUsage enumeration, if pc is sending both media and data: use multiplex.

  var usage = callStats.fabricUsage.multiplex;

  //remoteUserID is the recipient's userID
  //conferenceID is generated or provided by the origin server (webrtc service)
  callStats.addNewFabric(pc, remoteUserID, usage, conferenceID, pcCallback);

```

It also uses the event as the initial timestamp to calculate the _establishment time_. Subsequently, when a `fabricSetupFailed` or `fabricSetup` event is fired, the difference between the timestamps gives the _establishment time_.

In any WebRTC endpoint, where multiple _PeerConnections_ are created between each participant (e.g., audio and video sent over different _PeerConnections_ or a mesh call), the `addNewFabric()` MUST be called for each _PeerConnection_.

## Step 4: reportError()

Sometimes WebRTC endpoints fail to establish connectivity, this may occur when user-agents and/or bridges implement differing flavours of the Session Description Protocol (SDP) or may not support some features that others implement.

The WebRTC APIs either have a callback or a Promise associated to them. Since `callstats.js ver. 3.2.x`, WebRTC applications can use `reportError()` to capture at which stage the negotiation fails and pass on the [DomError](http://www.w3.org/TR/dom/#interface-domerror) returned by the callback or Promise to callstats.io. The failure reason will appear both in the conference timeline and aggregate on the main dashboard. See Section enumerating [WebRTC functions](#enumeration-of-wrtcfuncnames) for details. The example below reports error when creating an SDP offer:

```javascript
  //adding Fabrics
  var pc_config = {"iceServers": [{url: "stun:stun.example.org:3478"}]};
  var pc = new RTCPeerConnection(pc_config);

  function pcCallback (err, msg) {
    console.log("Monitoring status: "+ err + " msg: " + msg);
  };

  function createOfferError(err) {
    callStats.reportError(pc, conferenceID, callStats.webRTCFunctions.createOffer, err);
  }

  // remoteUserID is the recipient's userID
  // conferenceID is generated or provided by the origin server (webrtc service)
  // pc is created, tell callstats about it
  // pick a fabricUsage enumeration, if pc is sending both media and data: use multiplex.

  var usage = callStats.fabricUsage.multiplex;
  callStats.addNewFabric(pc, remoteUserID, usage, conferenceID, pcCallback);

  // let the "negotiationneeded" event trigger offer generation
  pc.onnegotiationneeded = function () {
    // create offer
    pc.createOffer(localDescriptionCreated, createOfferError);
  }
```

## Step 5: (OPTIONAL) Conference Events

Send the appropriate `fabricEvent` via `sendFabricEvent()`.

<!-- - send `fabricSetup` after [`onaddstream` event is fired by the WebRTC API](http://dev.w3.org/2011/webrtc/editor/webrtc.html)
  and the endpoint starts to render media. The callstats javascript expects both local
  and remote endpoints to generate this event. After this event is fired, the
  callstats javascript begins performance monitoring and sending data to the
  [callstats.io]({{site.callstats.backend-url}}) backend. -->

- `fabricSetup` and `fabricFailed` has been **deprecated** in v2.1.0 and v3.10.0, 
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
  Hangup() method in WebRTC (may have to rely on signaling), the
  remote endpoint sends a `fabricTerminated` event before destroying its
  local _PeerConnection_ object.
  [callstats.io]({{site.callstats.backend-url}}) monitors each
  _PeerConnection_ in real-time, and generates summary statistics when the
  participant leaves. The summary statistics for each conference is aggregated
  when all the participant have left. If no `fabricTerminated` event is received,
  [callstats.io]({{site.callstats.backend-url}}) will summarize
  and aggregate the summary statistics _30 seconds_ after the last measurement
  for a conference is received.

## Step 6: (OPTIONAL) associateMstWithUserID()

When interacting with the conference server, the developer is most likely going to use the name or identifier associated with the conference server as the `remoteUserID`. A typical conference bridge (for example, [Jitsi Videobridge](https://jitsi.org/Projects/JitsiVideobridge)) transmits [multiple media stream tracks within a peer connection](https://hacks.mozilla.org/2015/06/firefox-multistream-and-renegotiation-for-jitsi-videobridge/). In which case, using a remote participant’s userID is impractical as there maybe several participants.

Since `callstats.js ver. 3.3.x`, we allow mapping [Synchronization Source Identifier (SSRC)](http://tools.ietf.org/html/rfc3550#section-5.1) for a mediastreamtrack to a userID (both local and remote). By default the local and remote _MediaStreamTracks_ are automatically mapped to the localUserID and remoteUserID. With `associateMstWithUserID()`, you can override the actual local and remote userIDs to the correct association. If the DOM ids of the video tags associated to each participant, callstat.js will calculate better quality scores for each participant. The code example shows how the API can be integrated:

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

<img src="/static/images/2015-mst-association.gif" alt="Associationg userID with MST" width="700"/>
> Figure. Associating userID with MST.

More discussion related to the motivation of `associateMstWithUserID()` is covered in the following [blog post](/2015/07/17/api-update-handling-multiple-media-stream-tracks-callstats/).

## Step 7: (OPTIONAL) sendUserFeedback()

The developers are expected  to design an appropriate UI to get user input (of quality) at the end of the call. Typically, services collect user feedback based on the Mean opinion Score (MoS). However, it is not neccessary to use all values of the  MoS scale, for example a service using only 2 point scale: it can associate 1 and 5 to bad and excellent, respectively and not use the values 2 to 4.

```javascript
  var overallRating = 4; // 1-5 rating, typically according to MOS scale.
  var feedback = {
    "userID": localUserID, //mandatory
    "overall": overallRating, //mandatory
  };
  callStats.sendUserFeedback(conferenceID, feedback, pcCallback);
```

## Step 8: (OPTIONAL) Handling stats from statsCallback()

The developers can handle the stats received from statsCallback function in way suitable to their application. It can be used for displaying bitrate or based on the conference quality indicators applications can change their settings etc. For more details check this [blog post](/2015/08/24/statscallback-webrtc-media-quality-status/).

### Integration Progress

After creating an AppID, the {{site.callstats.backend-url}}/newapp helps you integrate the `callstats.js` into your web application. It reports if any of the APIs have been invoked correctly.



# configParams

Using configParams is OPTIONAL, it provides developers a method to enable or disable certain features or functions within the callstats.js library. It is a javascript object with the following OPTIONAL key-value pairs. They are:

* `disableBeforeUnloadHandler`: by default the valus is `false`, i.e., when the user closes the browser window, callstats.js sends a `fabricTerminated` event for every active peerconnection. Setting it to `true` disengages callstats.js's `window.onbeforeunload` handler, and you will need to send the fabricTerminated event for each active peerconnection. See [Step 5](http://www.callstats.io/api/#step-5-optional-conference-events) for more details on `fabricTerminated` event.

* `applicationVersion`: of type _String_, maximum length **30 characters**. If the value is `empty`, `undefined`, or `null`, the dashboard will show an empty string.

```javascript
var configParams = {
  disableBeforeUnloadHandler: true, // disables callstats.js's window.onbeforeunload parameter.
  applicationVersion: "app_version" // Application version specified by the developer.
};
```


# Script loading via requrie.js

The [require.js](http://www.requirejs.org/) helps load dependencies at the origin server. Below is an example snippet:

> Script loading with require.js

```javascript

<script data-main="YOUR REQUIRE JS CONFIG FILE" src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.1.15/require.js"></script>

requirejs.config({
  // 1. define source paths to other dependencies
  paths: {
    //jQuery usage is deprecated from the version 3.10.0 onwards
    callstats: "https://api.callstats.io/static/callstats.min",
    socketio: "https://cdn.socket.io/socket.io-1.2.0",
    sha: "https://cdnjs.cloudflare.com/ajax/libs/jsSHA/1.5.0/sha"
  },
  // 2. define dependency shim; callstats depends on sha and socket.io
  // IMPORTANT: You must preserve naming of variables for $, io and jsSHA
  shim: {
    'socketio': {
        exports: 'io'
    },
    'sha': {
      exports: 'jsSHA'
    },
    'callstats': {
      deps: ['socketio','sha'],
    },
    'WebRTCApp': {
      deps: ['callstats',... <other dependencies> ...],
    }
  }
});

// 3. load your main webRTCApp which depends on callstats
require(['WebRTCApp']);

```
