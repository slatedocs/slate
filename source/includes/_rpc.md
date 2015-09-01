JSON-RPC
========

augur.js communicates with the Ethereum network using the [ethrpc](https://github.com/AugurProject/ethrpc) module, which implements Etherum's generic [JSON-RPC](https://github.com/ethereum/wiki/wiki/JSON-RPC) interface.  In addition to being the building blocks for the Augur API's higher-level methods, ethrpc methods are available directly via `augur.rpc`.

Basic RPC
---------

The `raw` method allows you to send in raw commands (similar to sending in via cURL):

```
> augur.rpc.raw("net_peerCount")
"0x10"

> augur.rpc.eth("gasPrice")
"0x015f90"
```

Many of the commonly used functions have named wrappers.  For example, `blockNumber` fetches the current block number:

```javascript
> augur.rpc.blockNumber()
217153
```

Contract upload and download
----------------------------

`publish` broadcasts (uploads) a compiled contract to the network, and returns the contract's address:

```javascript
> augur.rpc.publish("0x603980600b6000396044567c01000000000000000000000000000000000000000000000000000000006000350463643ceff9811415603757600a60405260206040f35b505b6000f3")
"0xf4549459f9ef8c8898c054a7fc37c286831c2ced"
```

`read` downloads code from a contract already on the Ethereum network:

```javascript
> augur.rpc.read("0x5204f18c652d1c31c6a5968cb65e011915285a50")
"0x7c010000000000000000000000000000000000000000000000000000000060003504636ffa1caa81141560415760043560405260026040510260605260206060f35b50"
```

Filters
-------

```javascript
// Create a filter for transactions on any of the augur contract addresses
augur.filters.start_contracts_listener();

// "Heartbeat" check for new transactions every 5 seconds
augur.filters.heartbeat(function (message) {
    console.log("new transaction:", message);
});

// Stop heartbeat polling
augur.filters.stop_heartbeat();

// Clear the contract transactions filter
augur.filters.clear_contracts_filter();
```

The contracts-listener filter watches for new transactions and calls back with the augur-related transaction(s); for example, shares purchased/sold.

<aside class="warning">Due to a geth bug affecting multi-address filters, all-contract filters <b>will not work</b> until <a href="https://github.com/ethereum/go-ethereum/pull/1751">ethereum/go-ethereum#1751</a> is merged.</aside>
