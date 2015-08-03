Callbacks
=========

```javascript
/**
 * Check account 0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b's cash balance.
 */

var address = "0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b";

// Synchronous
var showMeTheMoney = augur.getCashBalance(address);
// '98855.99999999999999994145'

// Asynchronous
augur.getCashBalance(address, function (showMeTheMoney) {
    console.log(showMeTheMoney);
});
// prints 98855.99999999999999994145

/**
 * Send 50 cash to 0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b.  Because this
 * submits a transaction to the network, it can only be done asynchronously.
 */

var amountToSend = 50;
var cb = {
    onSent: function (res) { console.log("Sent:", res); },
    onSuccess: function (res) { console.log("Success!", res); },
    onFailed: function (res) { console.log("Failed:", res); }
};

augur.sendCash(address, amountToSend, cb.onSent, cb.onSuccess, cb.onFailed);

// Printed almost immediately; the callReturn field is the sendCash method's
// return value.  If the transaction was sent successfully, callReturn will
// be the amount of cash sent.  txHash (the transaction hash) uniquely
// identifies this transaction, and can be used to look it up.
Sent: {
    txHash: '0xd5743b5b3bfdec989692b69d68fd8c979120e82cd199fdd80cff36dba42befbe',
    callReturn: '50'
}

// Printed after about 12 seconds, when the transaction is detected to have a
// non-null blockHash value.
Success! {
    nonce: '0x6f',
    blockHash: '0x2f10d8cdb8b2746a5ed24f4021caffae3f25abca297622984c2baa69db0ac50f',
    blockNumber: '0x2c58',
    transactionIndex: '0x0',
    from: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
    to: '0xe4714fcbdcdba49629bc408183ef40d120700b8d',
    value: '0x0',
    gas: '0x2fd618',
    gasPrice: '0x11102181f5e',
    input: '0x693200ce00000000000000000000000005ae1d0ca6206c6168b42efcd1fbe0ed144e821b0000000000000000000000000000000000000000000000320000000000000000',
    callReturn: '50',
    txHash: '0xd5743b5b3bfdec989692b69d68fd8c979120e82cd199fdd80cff36dba42befbe'
}
```

Augur API methods that submit transactions to the network (using the `eth_sendTransaction` RPC) take three callbacks, in the following order:

- onSent: fires when the transaction has been broadcast to the network.
- onSuccess: fires when the transaction has been successfully incorporated into a block.
- onFailed: fires if the RPC request returns an error.

The `onSent` callback is required; `onSuccess` and `onFailed` are both optional.  If the `onSuccess` callback is supplied, augur.js will poll the network every 12 seconds with `eth_getTransaction`, until the transaction record contains a non-null `blockHash` value, or a maximum of 12 requests have been made.

Augur API methods that perform RPC requests that do not submit transactions to the network (using the `eth_call` RPC) take a single optional callback as their last parameter.  Unlike transaction RPCs, call RPCs can be synchronous.  If a callback is supplied, the RPC request will be asynchronous; otherwise, it will be synchronous.

<aside class="notice">Synchronous HTTP RPC is generally not recommended, especially if augur.js is running in the browser.  Synchronous RPC requests block the main JavaScript thread, which essentially freezes the browser!</aside>
