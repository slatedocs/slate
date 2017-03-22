JSON-RPC
========

augur.js communicates with the Ethereum network using the [ethrpc](https://github.com/AugurProject/ethrpc) module, which implements Etherum's generic [JSON-RPC](https://github.com/ethereum/wiki/wiki/JSON-RPC) interface.  In addition to being the building blocks for the Augur API's higher-level methods, ethrpc methods are available directly via `augur.rpc`.

Basic RPC
---------

The `raw` method allows you to send in raw commands (similar to sending in via cURL):

```javascript
augur.rpc.raw("net_peerCount")
"0x10"

augur.rpc.eth("gasPrice")
"0x015f90"
```

Many commonly used functions have named wrappers.  For example, `blockNumber` fetches the current block number:


```javascript
augur.rpc.blockNumber();
"0x35041"
```

Contract upload and download
----------------------------

`publish` broadcasts (uploads) a compiled contract to the network:

```javascript
var txHash = augur.rpc.publish("0x603980600b6000396044567c01000000000000000000000000000000000000000000000000000000006000350463643ceff9811415603757600a60405260206040f35b505b6000f3");
// txHash:
"0x6a532c807eb49d78bf0fb7962743c7f155a4b2fc1258b749df85c88b66fc3316"

// To get the contract's address, after the transaction is sealed (mined), get its receipt:
var address = augur.rpc.getTransactionReceipt(txHash).contractAddress;
// address:
"0x86fb6d1f1bd78cc13c6354b6436b6ea0c144de2e"
```

`getCode` downloads code from a contract already on the Ethereum network:

```javascript
augur.rpc.getCode("0x86fb6d1f1bd78cc13c6354b6436b6ea0c144de2e");
"0x7c010000000000000000000000000000000000000000000000000000000060003504636ffa1caa81141560415760043560405260026040510260605260206060f35b50"
```
