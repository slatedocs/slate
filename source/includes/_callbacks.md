
# Callbacks and Error Handling

The `callstats.js` provides two callback functions:

1. csStatsCallback
2. csErrorCallback

## csStatsCallback

## csErrorCallback

1. to report different success and failure cases, they can occur during `initialize()` or sending measurements to [callstats.io]({{site.callstats.backend-url}}). The callback takes the form of:

```javascript
function callback(csError, csErrMsg) {
  console.log("Status: errCode= " + csError + " errMsg= " + csErrMsg ); }
}
```

csError and csErrMsg are of type _String_. `csErrMsg` is a descriptive error returned by [callstats.io]({{site.callstats.backend-url}}) or the jQuery library.


---