
# Callbacks and Error Handling

The `callstats.js` provides two callback functions:

- csInitCallback
- csStatsCallback


## csInitCallback

```javascript
function callback(csError, csErrMsg) {
  console.log("Status: errCode= " + csError + " errMsg= " + csErrMsg ); }
}
```

To report different success and failure cases, they can occur during `initialize()` or sending measurements to [callstats.io]({{site.callstats.backend-url}}). The callback takes the form of:

csError and csErrMsg are of type _String_. `csErrMsg` is a descriptive error returned by [callstats.io]({{site.callstats.backend-url}}) or the jQuery library.

## csStatsCallback

```javascript
var reportType = {
  inbound: 'inbound',
  outbound: 'outbound'
};

// callback function to receive the stats
var csStatsCallback = function (stats) {
  var ssrc;
  for (ssrc in stats.streams) {
    console.log("SSRC is: ", ssrc);
    var dataSsrc = stats.streams[ssrc];
    console.log("SSRC Type ", dataSsrc.reportType);
    if (dataSsrc.reportType === reportType.outbound) {
      console.log("RTT is: ", dataSsrc.rtt);
    } else if (dataSsrc.reportType === reportType.inbound) {
      console.log("Inbound loss rate is: ", dataSsrc.fractionLoss);
    }
  }
}

// initialize the callstats js API
var callStats = new callstats();
callStats.initialize(appId, appSecret, myUserId, csInitCallback, csStatsCallback);
```

The `initialize()` API authenticates the javascript WebRTC application with the callstats.io backend, and sets up a trusted relationship with it. The API is extended by adding a `csStatsCallback` parameter. The callback parameter is OPTIONAL.

The `csStatsCallback()` will be called by the callstats.js for each peerconnection independently at regular intervals. By default the interval is set as 10 seconds to make sure we do not overwhelm the app with too many messages. For more inforamtion, please check out blog on [`csStatsCallback()`] (http://www.callstats.io/2015/08/24/statscallback-webrtc-media-quality-status/)




