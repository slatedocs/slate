# Callbacks

All of augur.js's methods that involve an RPC request take an optional callback function as their last parameter.  If a callback is supplied, the RPC request will be asynchronous; otherwise, it will be synchronous.  Synchronous HTTP RPC is generally not recommended, especially if augur.js is running in the browser, as synchronous RPC requests block the main JS thread (which essentially freezes the browser).
