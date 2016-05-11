
# Callbacks and Error Handling

The `callstats.js` provides two callback functions:

1. csStatsCallback
2. csErrorCallback

## csStatsCallback

The `initialize()` API authenticates the javascript WebRTC application with the callstats.io backend, and sets up a trusted relationship with it. The API is extended by adding a `csStatsCallback` parameter. The callback parameter is OPTIONAL.

The `csStatsCallback()` will be called by the callstats.js for each peerconnection independently at regular intervals. By default the interval is set as 10 seconds to make sure we do not overwhelm the app with too many messages. For more inforamtion, please check out blog on [`csStatsCallback()`] (http://www.callstats.io/2015/08/24/statscallback-webrtc-media-quality-status/)

## csErrorCallback

```javascript
function callback(csError, csErrMsg) {
  console.log("Status: errCode= " + csError + " errMsg= " + csErrMsg ); }
}
```

To report different success and failure cases, they can occur during `initialize()` or sending measurements to [callstats.io]({{site.callstats.backend-url}}). The callback takes the form of:

csError and csErrMsg are of type _String_. `csErrMsg` is a descriptive error returned by [callstats.io]({{site.callstats.backend-url}}) or the jQuery library.


