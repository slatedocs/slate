Geth
====
```javascript
// After installing, require geth.js to use it
var geth = require("geth");

// The same flags as the geth command line client!
var options = {
    networkid: "10101",
    port: 30303,
    rpcport: 8545,
    mine: null
};

geth.start(options, function (err, proc) {
    if (err) return console.error(err);
    // get your geth on!
});

// When you and geth have had enough lively times, geth.stop kills
// the geth child process:
geth.stop(function () { /* no more lively times :( */ });

// The `stdout`, `stderr`, and `close` listeners can be initially set
// by passing them to `geth.start`.
var listeners = {
    stdout: function (data) {
        process.stdout.write("I got a message!! " + data.toString());
    },
    stderr: function (data) {
        if (data.toString().indexOf("Protocol Versions") > -1) {
            geth.trigger(null, geth.proc);
        }
    },
    close: function (code) {
        console.log("It's game over, man!  Game over!");
    }
};
geth.start(options, listeners, function (err, proc) { /* <3 geth */ });

// Swap out or add listeners after the initial startup:
geth.listen("stdout", "data", function (data) { /* ... */ });
```
[geth.js](https://github.com/ethereumjs/geth.js) is a Node.js module that allows you to start, stop, and monitor [geth](https://github.com/ethereum/go-ethereum) programmatically.  These methods are a bit lower-level than what consumers of Augur's API will require.

geth.js can be installed using npm:

`$ npm install geth`

geth's `start` method accepts a configuration object, which uses the same flags as the geth command line client.  Here, the flags are organized into an object.  Flags that are not accompanied by a value on the command line (for example, `--mine`) should be passed in as `{ flag: null }`.

<aside class="notice"><code>geth.start</code> callback's parameter <code>proc</code> is the geth child process, which is also attached to the <code>geth</code> object (<code>geth.proc</code>) for your convenience.</aside>

The callback for `geth.start` fires after geth has successfully started.  Specifically, it looks for `"IPC service started"` in geth's `stderr` stream.  If you want to change the start callback trigger to something else, this can be done by replacing geth's default listeners.

`geth.trigger` is the callback passed to `geth.start`: its callback is stored so that the startup trigger can be changed if needed.
