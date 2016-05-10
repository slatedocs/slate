# Loading with requrie.js

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
