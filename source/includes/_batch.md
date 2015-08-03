Batching
========

```javascript
/**
 * Batch RPC request that gets the cash and reputation balances for account
 * 0x63524e3fe4791aefce1e932bbfb3fdf375bfad89.
 */

var myAccount = "0x63524e3fe4791aefce1e932bbfb3fdf375bfad89";

var batch = augur.createBatch();

batch.add("getCashBalance", [myAccount], callback);
batch.add("getRepBalance", [augur.branches.dev, myAccount], callback);

batch.execute();

// Manual batching

var txlist = [{
    to: "0x3caf506cf3d5bb16ba2c8f89a6591c5160d69cf3",
    method: "ten"
}, {
    to: "0x5204f18c652d1c31c6a5968cb65e011915285a50",
    method: "double",
    signature: "i",
    params: 3
}];

augur.batch(txlist);

// returns: ['10', '6']
```

augur.js implements [batch RPC](http://www.jsonrpc.org/specification#batch), which can help reduce overhead if you're making several API calls that can be run in parallel (i.e., do not depend on each other's results).

For finer-grained control over the batched commands, you can also use augur.js's lower-level `augur.batch` method directly.  `augur.batch` accepts manually constructed transaction objects.
