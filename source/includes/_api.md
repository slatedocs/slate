API
===
```javascript
// After installing, just require augur.js to use it.
var augur = require("augur.js");

// Attempt to connect to a local Ethereum node
augur.connect();

// Connect to a local Ethereum node with IPC support
augur.connect(null, "/home/augur/.ethereum/geth.ipc");

// Connect to one of Augur's public nodes (eth1.augur.net)
augur.connect("http://eth1.augur.net");
```
Augur's [core contracts](https://github.com/AugurProject/augur-core) exist on Ethereum's decentralized network.  The various serialization, networking, and formatting tasks required to communicate with the Augur contracts from a web application are carried out by Augur's sprawling [middleware](http://docs.augur.net/#architecture).

[augur.js](https://github.com/AugurProject/augur.js) includes the Augur JavaScript API, and is the user-facing component of the middleware.  If you want to interact with the Augur contracts from a custom application, augur.js is the recommended way to do so.  The easiest way to install augur.js is using [npm](https://www.npmjs.com/package/augur.js):

`$ npm install augur.js`

To use the Augur API, augur.js can either connect to an Ethereum node, which can be either remote (hosted) or local.  To specify the connection endpoint, pass your RPC/IPC connection info to `augur.connect`.

<aside class="notice"><code>augur.connect</code> also accepts a second argument specifying the path to geth's IPC (inter-process communication) file.  IPC creates a persistent connection using a Unix domain socket (or a named pipe on Windows).  It is significantly faster than HTTP RPC, but requires access to the filesystem, so it cannot be used from the browser.</aside>

```javascript
/**
 * All Augur functions have an optional callback (or callbacks) as their
 * final parameter.
 */

getCashBalance(address[, callback])

getRepBalance(branch, address[, callback])

getBranches([callback])

getMarkets(branch[, callback])

getMarketInfo(market[, callback])

getMarketEvents(market[, callback])

getNumEvents(market[, callback])

getEventInfo(event[, callback])

getBranchID(branch[, callback])

getNonce(id[, callback])

getCurrentParticipantNumber(market[, callback])

getParticipantSharesPurchased(market, participantNumber, outcome[, callback])

getSharesPurchased(market, outcome[, callback])

getEvents(branchId, votePeriod[, callback])

getVotePeriod(branchId[, callback])

getPeriodLength(branchId[, callback])

getBranch(branchIdNumber[, callback])

sendCash(receiver, value[, callback])

cashFaucet([callback])

reputationFaucet([callback])

getDescription(id[, callback])

createEvent(eventObject)
/**
 * - eventObject has the following fields:
 *   - branchId <integer>
 *   - description <string>
 *   - minValue <integer> (will be floating-point)
 *   - maxValue <integer> (will be floating-point)
 *   - numOutcomes <integer>
 *   - expDate <integer> - block number when the event expires
 *   - onSent <function> - callback that fires after the event is broadcast to
 *      the network
 *   - onSuccess <function> - optional callback that fires when augur.js is
 *      able to see your event on the network
 *
 * - Callback functions should accept a single parameter: an event object with
 *      txHash and callReturn fields
 *
 * - Calling createEvent with positional arguments also works:
 *   - createEvent(branchId, description, expDate, minValue, maxValue, numOutcomes[, onSent, onSuccess])
 */

createMarket(marketObject)
/**
 * - marketObject has the following fields:
 *   - branchId <integer>
 *   - description <string>
 *   - minValue <integer> (will be floating-point)
 *   - maxValue <integer> (will be floating-point)
 *   - numOutcomes <integer>
 *   - expDate <integer> - block number when the event expires
 *   - onSent <function> - callback that fires after the event is broadcast to
 *      the network
 *   - onSuccess <function> - optional callback that fires when augur.js is
 *      able to see the new market on the network
 *   - onFailure <function> - optional callback that fires if market creation
 *      errors
 *
 * - Callback functions should accept a single parameter: a market object
 *      txHash and callReturn fields
 *   
 * - Calling createMarket with positional arguments also works:
 *   - createMarket(branchId, description, alpha, liquidity, tradingFee, events[, onSent, onSuccess, onFailed])
 */

buyShares(branchId, market, outcome, amount, nonce[, callback])

sellShares(branchId, market, outcome, amount, nonce[, callback])

sendReputation(branchId, receiver, value[, callback])

getSimulatedBuy(market, outcome, amount[, callback])

> augur.getSimulatedBuy("0xb13d98f933cbd602a3d9d4626260077678ab210d1e63b3108b231c1758ff9971", 1, augur.ONE.toString(16))
["0x0000000000000000000000000000000000000000000000000013b073172aceb2",
 "0x0000000000000000000000000000000000000000000000008de39f2500000000"]

getSimulatedSell(market, outcome, amount[, callback])

> augur.getSimulatedSell("0xb13d98f933cbd602a3d9d4626260077678ab210d1e63b3108b231c1758ff9971", 1, augur.ONE.toString(16))
["0x0000000000000000000000000000000000000000000000000013af84d04feba9",
 "0x0000000000000000000000000000000000000000000000008dd635b900000000"]

getCreator(id[, callback])

> var market = "0xb13d98f933cbd602a3d9d4626260077678ab210d1e63b3108b231c1758ff9971";
> augur.getCreator(market);
"0x0000000000000000000000001c11aa45c792e202e9ffdc2f12f99d0d209bef70"

getCreationFee(id[, callback])

> augur.getCreationFee(market)
"0x00000000000000000000000000000000000000000000000a0000000000000000"

getExpiration(event[, callback]): Event expiration block.

> var event = "0xb2a6de45f349b5ac384b01a785e640f519f0a8597ab2031c964c7f572d96b13c";
> augur.getExpiration(event)
"0x000000000000000000000000000000000000000000000000000000000003d090"

getMarketNumOutcomes(market[, callback]): Number of outcomes in this market as an integer.

> augur.getMarketNumOutcomes(market)
2

price(market, outcome[, callback]): Get the current (instantaneous) price of an outcome.

> augur.price(market_id, 1, function (r) { console.log(r.dividedBy(augur.ONE).toFixed()); })
0.55415210523642599583

getWinningOutcomes(market[, callback])
```

The Augur API is a set of JavaScript bindings for the methods encoded in Augur's [smart contracts](https://github.com/AugurProject/augur-core).  The API method name, as well as its parameters, are generally identical to those of the underlying smart contract method.

In some cases, you may need more flexibility beyond simply mix-and-matching the Augur API methods.  To do this, use [ethrpc](https://github.com/AugurProject/ethrpc)'s lower-level `invoke` method (`augur.rpc.invoke`).  First, build a transaction object manually, then execute it using `invoke`.  The `invoke` method executes a method in a contract already on the network.  It can broadcast transactions to the network and/or capture return values by calling the contract method(s) locally.

```javascript

// The method called here doubles its input argument.
augur.rpc.invoke({
   to: "0x5204f18c652d1c31c6a5968cb65e011915285a50",
   method: "double",
   signature: "i",
   params: 22121, // parameter value(s)
   send: false,
   returns: "number"
});
// this returns:
44242
```

Transaction fields are as follows:

Required:

- to: `<contract address> (hexstring)`
- method: `<function name> (string)`
- signature: `<function signature, e.g. "iia"> (string)`
- params: `<parameters passed to the function>`

Optional:

- send: `<true to sendTransaction, false to call (default)>`
- from: `<sender's address> (hexstring; defaults to the coinbase account)`
- returns: `<"array", "int", "BigNumber", or "string" (default)>`

The `params` and `signature` fields are required if your function accepts parameters; otherwise, these fields can be excluded.  The `returns` field is used only to format the output, and does not affect the actual RPC request.

<aside class="notice"><b><code>invoke</code> currently only works for <a href="https://github.com/ethereum/serpent">Serpent</a> contracts.</b>  The extra datatypes included by <a href="https://github.com/ethereum/solidity">Solidity</a> are not (yet) supported by the <a href="https://github.com/AugurProject/augur-abi">augur-abi</a> encoder.  The augur-abi encoder requires all parameters to be type <code>string</code>, <code>int256</code>, or <code>int256[]</code>.</aside>
