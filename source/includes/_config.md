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


