JSON-RPC
========

augur.js communicates with the Ethereum network using Etherum's generic [JSON-RPC](https://github.com/ethereum/wiki/wiki/JSON-RPC) interface.

Basic RPC
---------

The `raw` method allows you to send in raw commands (similar to sending in via cURL):

```
> Augur.raw("net_peerCount")
"0x10"

> Augur.eth("gasPrice")
"0x015f90"
```

Many of the commonly used functions have named wrappers.  For example, `blockNumber` fetches the current block number:

```javascript
> Augur.blockNumber()
217153
```

Contract upload and download
----------------------------

`publish` broadcasts (uploads) a compiled contract to the network, and returns the contract's address:

```javascript
> Augur.publish("0x603980600b6000396044567c01000000000000000000000000000000000000000000000000000000006000350463643ceff9811415603757600a60405260206040f35b505b6000f3")
"0xf4549459f9ef8c8898c054a7fc37c286831c2ced"
```

`read` downloads code from a contract already on the Ethereum network:

```javascript
> Augur.read("0x5204f18c652d1c31c6a5968cb65e011915285a50")
"0x7c010000000000000000000000000000000000000000000000000000000060003504636ffa1caa81141560415760043560405260026040510260605260206060f35b50"
```

On-chain contract methods
-------------------------

`invoke` executes a function in a contract already on the network:

```javascript
> tx = {
   to: "0x5204f18c652d1c31c6a5968cb65e011915285a50",
   method: "double",
   signature: "i",
   params: 22121,
   send: false,
   returns: "int"
};

> Augur.invoke(tx)
44242
```

(Both `execute` and `run` are aliases for `invoke`.) The function called here `double(22121)` simply doubles its input argument, so the result is as expected.  The transaction fields are as follows:

Required:
- to: `<contract address> (hexstring)`
- method: `<function name> (string)`
- signature: `<function signature, e.g. "iia"> (string)`
- params: `<parameters passed to the function>`

Optional:
- send: `<true to sendTransaction, false to call (default)>`
- from: `<sender's address> (hexstring; defaults to the coinbase account)`
- returns: `<"array", "int", "BigNumber", or "string" (default)>`

The `params` and `signature` fields are required if your function accepts parameters; otherwise, these fields can be excluded.  The `returns` field is used only to format the output, and has no effect on the actual RPC command.

*`invoke` currently only works for Serpent contracts.*  The extra datatypes that Solidity includes are not (yet) supported by augur.js's encoder.  In our encoder, all parameters are type `string`, `int256`, or `int256[]`.  If you need a more flexible ABI encoder, I recommend [pyepm](https://github.com/etherex/pyepm), specifically the `pyepm.api.abi_data` method.
