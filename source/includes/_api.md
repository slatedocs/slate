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
augur.connect("https://eth1.augur.net");
```
The Augur API is a set of JavaScript bindings for the methods encoded in Augur's [smart contracts](https://github.com/AugurProject/augur-core).  The API method name, as well as its parameters, are generally identical to those of the underlying smart contract method.

Augur's [core contracts](https://github.com/AugurProject/augur-core) exist on Ethereum's decentralized network.  The various serialization, networking, and formatting tasks required to communicate with the Augur contracts from a web application are carried out by Augur's sprawling [middleware](http://docs.augur.net/#architecture).

[augur.js](https://github.com/AugurProject/augur.js) includes the Augur JavaScript API, and is the user-facing component of the middleware.  If you want to interact with the Augur contracts from a custom application, augur.js is the recommended way to do so.  The easiest way to install augur.js is using [npm](https://www.npmjs.com/package/augur.js):

`$ npm install augur.js`

To use the Augur API, augur.js can connect to an Ethereum node, which can be either remote (hosted) or local.  To specify the connection endpoint, pass your RPC/IPC connection info to `augur.connect`.

<aside class="notice"><code>augur.connect</code> also accepts a second argument specifying the path to geth's IPC (inter-process communication) file.  IPC creates a persistent connection using a Unix domain socket (or a named pipe on Windows).  It is significantly faster than HTTP RPC, but requires access to the filesystem, so it cannot be used from the browser.</aside>

Simplified API
--------------
```javascript
var branchId = 1010101;
var marketId = "-0x5932c04cfb6df8275387fc5d15a9897d61a2ef598c7e60ae45829e9e1e3409e6";

augur.getMarketInfo(marketId, function (marketInfo) { /* ... */ })
// example output:
marketInfo = {
  network: "7",
  traderCount: 1,
  alpha: "0.00790000000000000001",
  traderIndex: 0,
  numOutcomes: 2,
  tradingPeriod: 338,
  tradingFee: "0.01999999999999999998",
  branchId: "0xf69b5",
  numEvents: 1,
  cumulativeScale: "1",
  creationFee: "1000",
  author: "0x1f068eba431ece4a3ce0bc9bf542d78641285e56",
  endDate: 609491,
  participants: {
    0xaff9cb4dcb19d13b84761c040c91d21dc6c991ec: 0
  },
  winningOutcomes: ["0", "0", "0", "0", "0", "0", "0", "0"],
  description: "Will \"Star Wars - The Force Awakens\" gross the highest domestic weekend box office in history (according to box office mojo) on its starting weekend?",
  outcomes: [{
    shares: {
      0xaff9cb4dcb19d13b84761c040c91d21dc6c991ec: "30.20000000000000000004"
    },
    id: 1,
    outstandingShares: "978.45265164437841819801",
    price: "0.88224176534189211081"
  }, {
    shares: {
      0xaff9cb4dcb19d13b84761c040c91d21dc6c991ec: "0"
    },
    id: 2,
    outstandingShares: "948.25265164437841819797",
    price: "0.12401983211394367306"
  }],
  events: [{
    id: "-0x7096f49a6b3844af58d4ec2d7c2517b8ccdcc924fef4c97e23c55e82a7e36178",
    endDate: 609491,
    outcome: "0",
    minValue: "0",
    maxValue: "1",
    numOutcomes: 2
  }],
  price: "0.12401983211394367306",
  _id: "-0x5932c04cfb6df8275387fc5d15a9897d61a2ef598c7e60ae45829e9e1e3409e6"
}
```
Our being-developed-as-we-speak Simplified API is designed for our new, Intrade-style UI.  This API is simplified in the sense that single requests to this API can be used to fetch a large amount of data, without the need for complicated RPC batch queries.  All of the methods in the Simplified API are getter methods that use an `eth_call` RPC request; for transactional requests (`eth_sendTransaction`), see the Full API section below.

### getMarketInfo(marketId[, callback])

Reads all information about a market that is stored on-contract.

```javascript
augur.getMarketsInfo(branchId, function (marketsInfo) { /* ... */ })
// example output:
marketsInfo = {
  "-0x5932c04cfb6df8275387fc5d15a9897d61a2ef598c7e60ae45829e9e1e3409e6": {
    "network": "7",
    "traderCount": 1,
    /* ... */
  },
  "-0x428531d38a8960123e16a2810591c36d523a5269081543f7ac5914408ae63183": {
    "network": "7",
    "traderCount": 4,
    /* ... */
  },
  /* ... */
}
```
### getMarketsInfo(branchId[, callback])

Retrieve a `marketInfo` object for all markets on the specified branch.  The `marketInfo` objects (see above for example) are collected into a single object and indexed by `marketId`.

```javascript
augur.getMostActive(branchId, function (mostActiveMarkets) { /* ... */ })
// example output:
mostActiveMarkets = {
  nodeId: "MOST_ACTIVE",
  nodeType: "MOST_ACTIVE",
  name: "Most Active",
  childNodes: [{
    nodeId: "CONTRACT-0xcd220a762601e471f9efae4c911d0e7380927c571743e060843f105a4a1e96bc",
    nodeType: "CONTRACT",
    name: "Will it rain in New York City on November 12, 2016?",
    childNodes: null,
    id: "-0xcd220a762601e471f9efae4c911d0e7380927c571743e060843f105a4a1e96bc",
    eventName: "Will it rain in New York City on November 12, 2016?",
    imagePath: null,
    displayOrder: 0,
    tickSize: 0.1,
    tickValue: 0.01,
    lastTradePrice: -1.087238e-14,
    lastTradePriceFormatted: "0.00",
    lastTradeCostPerShare: -1.087238e-14,
    lastTradeCostPerShareFormatted: "0.00 CASH",
    sessionChangePrice: 0,
    sessionChangePriceFormatted: "+0.0",
    sessionChangeCostPerShare: 0,
    sessionChangeCostPerShareFormatted: "0.00 CASH",
    totalVolume: 18108.06,
    bestBidPrice: -1.087238e-14,
    bestAskPrice: -1.087238e-14,
    leaf: true
  }, {
    /* ... */
  }],
  leaf: false
}
```
### getMostActive(branchId, callback)

Get and sort all markets by volume from the specified branch.  `branchId` is an optional parameter; if `branchId` is omitted, the default value of `1010101` will be used.  The `callback` function is required; `getMostActive` is asynchronous-only.

```javascript
augur.getMarketsSummary(branchId, function (marketsSummary) { /* ... */ })
// example output:
marketsSummary = [{
  "id": "-0xa6f4865420b455a7a5117c73a89a70fb22a93c5c6567377074ac2a520f6189bf",
  "name": "Will the Sun turn into a red giant and engulf the Earth by the end of 2015?",
  "lastTradePrice": 0.0006151120558214465,
  "lastTradePriceFormatted": "0.00",
  "lastTradeCostPerShare": 0.0006151120558214465,
  "lastTradeCostPerShareFormatted": "0.00 CASH"
}, {
  /* ... */
}]
```
### getMarketsSummary(branchId, callback)

Gets a few "vital statistics" for each market in `branchId`, suitable for an overview or summary display.

```javascript
augur.getPrices(marketId, function (prices) { /* ... */ })
// example output:
prices = {
  "1": [{
    year: 2015,
    day: 15,
    month: 12,
    price: 0.9982875139911898,
    volume: 1.1181621503989734,
    timestamp: 1450205548
  }, {
    year: 2015,
    day: 15,
    month: 12,
    price: 0.9999986905158383,
    volume: 1.0002707146145515,
    timestamp: 1450205782
  }, {
    year: 2015,
    day: 15,
    month: 12,
    price: 0.9999999977785681,
    volume: 1.0000002278530689,
    timestamp: 1450206815
  }, {
    year: 2015,
    day: 15,
    month: 12,
    price: 0.9999999999926208,
    volume: 1.000000000422754,
    timestamp: 1450209572
  }, {
    year: 2015,
    day: 16,
    month: 12,
    price: 0.9999999999999568,
    volume: 1.000000000001524,
    timestamp: 1450248629
  }],
  "2": [{
    year: 2015,
    day: 16,
    month: 12,
    price: 7.34725727567e-9,
    volume: 12.496966951483369,
    timestamp: 1450248854
  }]
}
```
### getPrices(marketId, callback)

Fetches all price changes and volumes for the specified market, ordered by timestamp (most recent record last).  `callback` is required; `getPrices` is asynchronous-only.

```javascript
augur.getClosingPrices(marketId, function (closingPrices) { /* ... */ })
// example output:
closingPrices = {
  "1": [{
    year: 2015,
    day: 15,
    month: 12,
    timestamp: 1450248629,
    closingPrice: 0.9999999999926208,
    volume: 4.118433093289348
  }, {
    year: 2015,
    day: 16,
    month: 12,
    closingPrice: 0.9999999999999568,
    volume: 1.000000000001524,
    timestamp: 1450248629
  }],
  "2": [{
    year: 2015,
    day: 16,
    month: 12,
    closingPrice: 7.34725727567e-9,
    volume: 12.496966951483369,
    timestamp: 1450248854
  }]
}
```
### getClosingPrices(marketId, callback)

Gets the closing price (last trade price of the day) as well as the total volume traded over the day, ordered by timestamp (most recent record last).  `callback` is required; `getClosingPrices` is asynchronous-only.

Full API
--------
```javascript
/**
 * All Augur API methods have optional callback(s) as their
 * final parameter.
 */

depositEther(value[, onSend, onSuccess, onFailed])

withdrawEther(to, value[, onSend, onSuccess, onFailed])

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

sendCash(receiver, value[, onSend, onSuccess, onFailed])

reputationFaucet([onSend, onSuccess, onFailed])

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
