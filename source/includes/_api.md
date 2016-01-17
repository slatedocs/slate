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
  type: "binary",
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
All of the methods in the Simplified API are getter methods that use an `eth_call` RPC request; for transactional requests (`eth_sendTransaction`), see the Full API section below.  This API is simplified in the sense that single requests to this API can be used to fetch a large amount of data, without the need for complicated RPC batch queries.

### getMarketInfo(marketId[, callback])

Reads all information about a market that is stored on-contract.  It also determines the `type` of the market, which can be `binary` (two outcomes; i.e., Yes or No), `categorical` (more than two outcomes, i.e., Multiple Choice), `scalar` (answer can be any of a range of values; i.e., Numerical), or `combinatorial` (for combined wagers on multiple events).  If the market is a combinatorial market, `getMarketInfo` also makes separate RPC request for the individual event descriptions.

```javascript
var options = {
  branch: 1010101,     // branch ID (default: 1010101)
  offset: 10,          // which markets to start  (default: 0)
  numMarketsToLoad: 5, // numMarkets
  combinatorial: true
};
augur.getMarketsInfo(options, function (marketsInfo) { /* ... */ })
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
### getMarketsInfo(options[, callback])

Retrieve a `marketInfo` object for all markets on the specified branch.  The `marketInfo` objects (see above for example) are collected into a single object and indexed by `marketId`.  The `options` parameter is an object which specifies the branch ID (`branch`), and whether or not to send separate RPC requests for combinatorial event descriptions (`combinatorial`).  There are also two fields (`offset` and `numMarketsToLoad`) used to split up the `getMarketsInfo` query into multiple requests.  This is useful if the number of markets on the branch is too large for a single RPC request.

<aside class="notice">Each branch's market IDs are stored as an "array" on the <a href="https://github.com/AugurProject/augur-core/blob/master/src/data%20and%20api/branches.se">branches</a> contract, in the contract's <code>Branches[](markets[], numMarkets, ...)</code> data.  Markets are indexed in the order created; i.e., the first market created has index 0, the second 1, etc.  This ordering allows us to break up a large aggregate request like <code>getMarketsInfo</code> into manageable chunks.

For example, suppose you were displaying markets on separate pages.  You might want to retrieve information about all markets, but, to keep your loading time reasonable, only get 5 markets per request.  To get the first 5 markets, you would set <code>offset</code> to 0 and <code>numMarketsToLoad</code> to 5: <code>augur.getMarketsInfo({offset: 0, numMarketsToLoad: 5}, cb)</code>.  To get the second 5, <code>offset</code> would be 5: <code>augur.getMarketsInfo({offset: 5, numMarketsToLoad: 5}, cb)</code>.  The third 5, <code>offset</code> would be 10: <code>augur.getMarketsInfo({offset: 10, numMarketsToLoad: 5}, cb)</code>, and so on.</aside>

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

Call API
--------

Augur's Call API is made up of "getter" methods that retrieve information from the blockchain (using Ethereum's `eth_call` RPC) but do not write information to the blockchain.

```javascript
// cash contract
var address = "0x639b41c4d3d399894f2a57894278e1653e7cd24c";
augur.getCashBalance(address, function (cashBalance) { /* ... */ });
// example output:
cashBalance = "93016.83621687256922549981"
```
### [cash contract](https://github.com/AugurProject/augur-core/blob/master/src/data%20and%20api/cash.se)
#### getCashBalance(address[, callback])

Gets the play money (CASH) balance of the user account `address`.

```javascript
// info contract
var marketId = "0x9368ff3e9ce1c0459b309fac6dd4e69229b91a42d736197278acab402980fd4";
augur.getCreator(marketId, function (creator) { /* ... */ });
// example output:
creator = "0x639b41c4d3d399894f2a57894278e1653e7cd24c"

augur.getCreationFee(marketId, function (creationFee) { /* ... */ });
// example output:
creationFee = "16"

augur.getDescription(marketId, function (description) { /* ... */ });
// example output:
description = "Will the Sun turn into a red giant and engulf the Earth by the end of 2016?"
```
### [info contract](https://github.com/AugurProject/augur-core/blob/master/src/data%20and%20api/info.se)
#### getCreator(id[, callback])

Gets the address of the account that created `id` (a market or event ID).

#### getCreationFee(id[, callback])

Gets the fee paid by the creator of `id` (a market or event ID).

#### getDescription(item[, callback])

Gets the plaintext (UTF-8) description of `item` (a market or event ID).

```javascript
// branches contract
var branchId = augur.branches.dev;
augur.getNumBranches(function (numBranches) { /* ... */ });
// example output:


augur.getBranches(function (branches) { /* ... */ });
// example output:
branches = ["0xf69b5"]

augur.getMarkets(branchId, function (markets) { /* ... */ })
// example output:
markets = ["-0x519bcdaa60e7259143402153efb9825fc37a5c3d8eee0445b987453d2a23919c",
           "-0xacfe5fbc7654fee0b8873e2db464f5c189a1fa9e6e0ea5f5fa44bf6a08832f7a",
           "-0xb73f41b31a160852d059c870d1c4d205da9b72db6c53588d4426ffe261ccc745",
           "-0x40189b8366a578e807f1381088de10bb4660505ff37d9cfa4be8d2a4eb39c74a",
           "-0x5a2d3e163636f0f35ff25bfe9a87d62185228c970acaae71eb1a469132631406",
           "-0xd7850ae02e616824cfaa2dfbe6129303752e31a7fdbd559f6c4466ec1594f7c6",
           "-0xb52debd79c5baaeec50ef7fa85e9f7b7fca6ddecba38810b070aa4bb8ef06952",
           "-0x5680dadb064bd5942e827dc70b389d2d24a63bd186279c0bea6e2ab46444c4a",
           "-0x98e1eb72b4c1a5973ab2a443ad2ca0b7a90107c2dc2594c33daea307ec39aa1c",
           "0x9368ff3e9ce1c0459b309fac6dd4e69229b91a42d736197278acab402980fd4",
           "-0x679b4b3112994a7c034ae7f6fb4b5e7bcb4a6923e969c24696ee823fbe4e5524"]

augur.getPeriodLength(branchId, function (periodLength) { /* ... */ })
// example output:
periodLength = "1800"

augur.getVotePeriod(branchId, function (reportPeriod) { /* ... */ })
// example output:
reportPeriod = "397"

augur.getNumMarkets(branchId, function (numMarkets) { /* ... */ })
// example output:
numMarkets = "45"

augur.getMinTradingFee(branchId, function (minTradingFee) { /* ... */ })
// example output:
minTradingFee = "0.0078125"

augur.getBranch(0, function (branch) { /* ... */ })
// example output:
branch = "0xf69b5"
```
### [branches contract](https://github.com/AugurProject/augur-core/blob/master/src/data%20and%20api/branches.se)
#### augur.getNumBranches([callback])

Looks up the total number of branches that exist on the current network.

#### augur.getBranches([callback])

Gets an array of all branch IDs on the current network.

#### augur.getMarkets(branch[, callback])

Gets an array of all markets on the specified branch ID `branch`.

#### augur.getPeriodLength(branch[, callback])

Gets the period length for the specified branch ID `branch`.

#### augur.getVotePeriod(branch[, callback])

Looks up the number of the current vote period on the specified branch ID `branch`.

#### augur.getNumMarkets(branch[, callback])

Gets the number of markets on the specified branch ID `branch`.

#### augur.getMinTradingFee(branch[, callback])

Gets the minimum trading fee allowed on the specified branch ID `branch`.

#### augur.getBranch(branchNumber[, callback])

Gets branch ID for the branch with index `branchNumber`.  (Branches are stored as an "array" on-contract; `branchNumber` is the index of the branch within this array.)

```javascript
// events contract
var eventId = "-0x5fa67764c533d97e33ef2cbdc37cd11eb5f187b47c89c88d3d81250ba834cb3";
augur.getEventInfo(eventId, function (eventInfo) { /* ... */ });
// example output:
eventInfo = ["0xf69b5", "13801186", "0", "1", "2", "2"]

augur.getEventBranch(eventId, function (eventBranch) { /* ... */ });
// example output:
eventBranch = "0xf69b5"

augur.getExpiration(eventId, function (expiration) { /* ... */ });
// example output:
expiration = "13801186"

augur.getOutcome(eventId, function (outcome) { /* ... */ });
// example output:
outcome = "0"

augur.getMinValue(eventId, function (minValue) { /* ... */ });
// example output:
minValue = "1"

augur.getMaxValue(eventId, function (maxValue) { /* ... */ });
// example output:
maxValue = "2"

augur.getNumOutcomes(eventId, function (numOutcomes) { /* ... */ });
// example output:
numOutcomes = "2"
```
### [events contract](https://github.com/AugurProject/augur-core/blob/master/src/data%20and%20api/events.se)
#### getEventInfo(eventId[, callback])

Fetches an array of basic information about event `eventId`: branch ID, expiration block number, outcome (`"0"` if not yet resolved), minimum value, maximum value, and number of outcomes.

#### getEventBranch(eventId[, callback])

Gets the branch ID of event `eventId`.

#### getExpiration(eventId[, callback])

Gets the expiration block number of event `eventId`.

#### getOutcome(eventId[, callback])

Gets the outcome (`"0"` if the event is not yet resolved) of event `eventId`.

#### getMinValue(eventId[, callback])

The minimum possible value for event `eventId`.  For binary (yes/no) events, the minimum value is `1`.

#### getMaxValue(eventId[, callback])

The minimum possible value for event `eventId`.  For binary (yes/no) events, the maximum value is `2`.

#### getNumOutcomes(eventId[, callback])

The total number of outcomes for this event.  Binary (yes/no) and scalar (numerical) events always have 2 outcomes; categorical events have more than 2 outcomes.

```javascript
// expiringEvents contract
var branchId = augur.branches.dev;
var reportPeriod = 397;
augur.getEvents(branchId, reportPeriod, function (events) { /* ... */ });
// example output:
events = ["-0xc6481ca18bec443c7831578e5f2de02594041041e0abbf0e8ecafd70197fd1a5",
          "-0xea03728786ca7ddcb91ec3303723ac794b7bcbcb9b3ad48943e797885c6d05ab",
          "-0xdb633b6cdbfbd00c85ca1f093764dcb2b2f0b5284c2324baa6008a3d73e0a1c",
          "-0xd0dbd235c8de8cccd7d8ef96b460c7dc2d19539fb45778f7897c412d4c0a3683",
          "-0x16fe3cb92062b9f43ef9988eb871f346960ff23b5c16222c1ebe5a5e2fc908c6",
          "-0x72162079f64916bccf580430cc1788d9b0873fd1e7de633d118c2d1e931eb47b",
          "-0x80da06cc9b94b559880aab761a40c88f1cc9c9eae7124301eaa246688ed8eee6",
          "-0x8e33043e75d6b8bc9ba5b60edaa159e25f0c84172730026d7c875e35377da13c",
          "-0x2e78a12ce25c171d32d649498babc011152b6509d5880568d77009826c6660e3",
          "-0xd5cbab9a85c1dd2ae692b87f98faa1e4841933d604d78622bb6dbe03d8acde36",
          "-0x7a2c24bec3f16f5edfa06ed6941569f9de70cbe33c768b02617ed89b16be8d8f",
          "-0x399c15976085e8dcf8cb57317c1001013ce8ee5472868b1faa8657edcd1336bd" ]

augur.getNumberEvents(branchId, reportPeriod, function (numberEvents) { /* ... */ });
// example output:
numberEvents = "12"

var eventIndex = 3;
augur.getEvent(branchId, reportPeriod, eventIndex, function (event) { /* ... */ });
// example output:
event = "-0xd0dbd235c8de8cccd7d8ef96b460c7dc2d19539fb45778f7897c412d4c0a3683"

augur.getTotalRepReported(branchId, reportPeriod, function (totalRepReported) { /* ... */ });
// example output:
totalRepReported = "76"

augur.getReporterBallot(branchId, reportPeriod, reporterID, function (reporterBallot) { /* ... */ });
// example output:
reporterBallot = ["1", "2", "1", "1.5", "1", "1.5", "2", "1", "1", "1.5", "1", "1"]

var reportNum = "0";
augur.getReport(branchId, reportPeriod, reporter, reportNum, function (report) { /* ... */ });
// example output:
report = "1"

augur.getReportHash(branchId, reportPeriod, reporter, function (reportHash) { /* ... */ });
// example output:
reportHash = "-0x4480ed40f94e2cb2ca244eb862df2d350300904a96039eb53cba0e34b8ace90a"

augur.getTotalReputation(branchId, reportPeriod, function (totalReputation) { /* ... */ });
// example output:
totalReputation = "282"

```
### [expiringEvents contract](https://github.com/AugurProject/augur-core/blob/master/src/data%20and%20api/expiringEvents.se)
#### getEvents(branch, reportPeriod[, callback])

Fetches an array of event IDs that are scheduled to be reported on during `reportPeriod`.

#### getNumberEvents(branch, reportPeriod[, callback])

The total number of events scheduled to be reported on during `reportPeriod`.

#### getEvent(branch, reportPeriod, eventIndex[, callback])

Looks up the event ID that has index `eventIndex`.

#### getTotalRepReported(branch, reportPeriod[, callback])

Gets the total amount of Reputation reporting during `reportPeriod`.

#### getReporterBallot(branch, reportPeriod, reporterID[, callback])

Fetches the ballot submitted for `reportPeriod` by address `reporterID`.

#### getReport(branch, reportPeriod, reporter, reportNum[, callback])

The report for reporting event number `reportNum` submitted for `reportPeriod` by address `reporter`.

#### getReportHash(branch, reportPeriod, reporter[, callback])

The report hash submitted for `reportPeriod` by address `reporter`.

#### getTotalReputation(branch, reportPeriod[, callback])

Gets the total amount of Reputation issued on branch `branch` by `reportPeriod`.  (In the live release Reputation is neither created nor destroyed, so this will be a constant value of `11000000`.)

```javascript
// markets contract
var marketId = "0xacc29bf675e03383eaf9beebcc975cdcbefda75322640d67baf3b04d6af198a";
var outcomeId = 5; // 9-outcome categorical market
var amount = 4;
augur.getSimulatedBuy(marketId, outcomeId, amount, function (simulation) { /* ... */ });
// example output:
simulation = ["1.22497628703421360092", "0.5119122035959891813"] // [cost, price]

augur.getSimulatedSell(marketId, outcomeId, amount, function (simulation) { /* ... */ });
// example output:
simulation = ["0.27632515684523433055", "0.03172161728914410592"] // [cost, price]

augur.lsLmsr(marketId, function (cost) { /* ... */ });
// example output:
cost = "32.66160518907426017564"

augur.getMarketEvents(marketId, function (marketEvents) { /* ... */ });
// example output:
marketEvents = ["-0xa65427afe1fc912e973d8dac2a83487aea5f5707a74c3168afb56e5a95b760ea"]

augur.getNumEvents(marketId, function (numEvents) { /* ... */ });
// example output:
numEvents = "1"

augur.getBranchID(marketId, function (branchID) { /* ... */ });
// example output:
branchID = "0xf69b5"

augur.getCurrentParticipantNumber(marketId, function (currentParticipantNumber) { /* ... */ });
// example output:
currentParticipantNumber = "1"

augur.getMarketNumOutcomes(marketId, function (marketNumOutcomes) { /* ... */ });
// example output:
marketNumOutcomes = "9"

var participantNumber = "0";
augur.getParticipantSharesPurchased(marketId, participantNumber, outcomeId, function (participantSharesPurchased) { /* ... */ });
// example output:
participantSharesPurchased = "4"

augur.getSharesPurchased(marketId, outcomeId, function (sharesPurchased) { /* ... */ });
// example output:
sharesPurchased = "32.24854252438022522758"

augur.getWinningOutcomes(marketId, function (winningOutcomes) { /* ... */ });
// example output:
winningOutcomes = ["0", "0", "0", "0", "0", "0", "0", "0", "0"]

augur.price(marketId, outcomeId, function (price) { /* ... */ });
// example output:
price = "0.4882160701306164927"

var address = "0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b";
augur.getParticipantNumber(marketId, address, function (participantNumber) { /* ... */ });
// example output:
participantNumber = "0"

augur.getParticipantID(marketId, participantNumber, function (participantID) { /* ... */ });
// example output:
participantID = "0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b"

augur.getAlpha(marketId, function (alpha) { /* ... */ });
// example output:
alpha = "0.00790000000000000001"

augur.getCumScale(marketId, function (cumScale) { /* ... */ });
// example output:
cumScale = "0.00000000000000000005"

augur.getTradingPeriod(marketId, function (tradingPeriod) { /* ... */ });
// example output:
tradingPeriod = "1075"

augur.getTradingFee(marketId, function (tradingFee) { /* ... */ });
// example output:
tradingFee = "0.00999999999999999999"
```
### [markets contract](https://github.com/AugurProject/augur-core/blob/master/src/data%20and%20api/markets.se)
#### getSimulatedBuy(market, outcome, amount[, callback])

Gets "simulated" results for the proposed buy from the automated market maker, without actually making the trade.  Returns an array with 2 elements: the cost of the trade, and the current LS-LMSR price.

#### getSimulatedSell(market, outcome, amount[, callback])

Gets "simulated" results for the proposed sale from the automated market maker, without actually making the trade.  Returns an array with 2 elements: the cost of the trade, and the current LS-LMSR price.

#### lsLmsr(market[, callback])

Gets the current value of the LS-LMSR's cost function for `market`.

#### getMarketEvents(market[, callback])

Gets an array of event IDs included in `market`.  (Note: only combinatorial markets have more than one event.)

#### getNumEvents(market[, callback])

Get the number of events included in `market`.  (Note: only combinatorial markets have more than one event.)

#### getBranchID(market[, callback])

Gets the branch ID of `market`.

#### getCurrentParticipantNumber(market[, callback])

Gets the current number of participants (traders) in `market`, starting from 0.  (i.e., if there is a single trader, then he is assigned participant number 0, and the "current participant number" is 1.)

#### getMarketNumOutcomes(market[, callback])

Gets the total number of outcomes for `market`.  For binary and scalar markets, this is 2.  For categorical markets, this is equal to the number of categories (choices).  For combinatorial markets, this is the number of possible outcome combinations.

#### getParticipantSharesPurchased(market, participantNumber, outcome[, callback])

The number of shares of `outcome` in `market` purchased by trader number `participantNumber`.  (Note: you can look up `participantNumber` using `augur.getParticipantNumber`.)

#### getSharesPurchased(market, outcome[, callback])

The total number of shares purchased (by all traders) of `outcome` in `market`.

#### getWinningOutcomes(market[, callback])

Gets an array of outcomes showing the winning/correct outcome, or an array of all zeros if `market` has not yet been resolved.

#### price(market, outcome[, callback])

The LS-LMSR's current instantaneous price for `outcome` in `market`.

#### getParticipantNumber(market, address[, callback])

Looks up the participant number for account `address`.

#### getParticipantID(market, participantNumber[, callback])

Looks up the account address for `participantNumber`.

#### getAlpha(market[, callback])

Gets the value of the LS-LMSR parameter alpha for `market`.

#### getCumScale(market[, callback])

Gets the cumulative scale for `market`.

#### getTradingPeriod(market[, callback])

Gets the trading period for `market`.

#### getTradingFee(market[, callback])

Gets the trading fee for `market`, expressed as a proportion.

```javascript
// reporting contract
var branchId = augur.branches.dev;
var address = "0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b"
augur.getRepBalance(branchId, address, function (repBalance) { /* ... */ });
// example output:
repBalance = "47"

var repIndex = 0;
augur.getRepByIndex(branchId, repIndex, function (rep) { /* ... */ });
// example output:
rep = "47"

augur.getReporterID(branchId, repIndex, function (reporterID) { /* ... */ });
// example output:
reporterID = "0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b"

augur.getNumberReporters(branchId, function (numberReporters) { /* ... */ });
// example output:
numberReporters = "38"

augur.repIDToIndex(branchId, address, function (repIndex) { /* ... */ });
// example output:
repIndex = "0"

augur.getTotalRep(branchId, function (totalRep) { /* ... */ });
// example output:
totalRep = "1796"

var ballot = ["1", "2", "1", "1.5", "1", "1.5", "2", "1", "1", "1.5", "1", "1"];
var salt = "0xbd352b6e2858ba27d8b7639afd2e34954803338e0e54cae7dcdf93f97f315225";
hashReport(ballot, salt, function (reportHash) { /* ... */ });
// example output:
reportHash = "-0x4480ed40f94e2cb2ca244eb862df2d350300904a96039eb53cba0e34b8ace90a"
```
### [reporting contract](https://github.com/AugurProject/augur-core/blob/master/src/data%20and%20api/reporting.se)
#### getRepBalance(branch, address[, callback])

The Reputation balance on `branch` of account `address`.

#### getRepByIndex(branch, repIndex[, callback])

The Reputation balance on `branch` of reporter number `repIndex`.

#### getReporterID(branch, index[, callback])

Looks up a reporter's ID (address) by reporter number `index`.

#### getNumberReporters(branch[, callback])

The total number of reporters on `branch`.

#### repIDToIndex(branch, repID[, callback])

Looks up a reporter's number (index) by address `repID`.

#### getTotalRep(branch[, callback])

The total amount of Reputation on `branch`.

#### hashReport(ballot, salt[, callback])

Calculates the SHA256 hash of `ballot` using `salt`.

```javascript
// buy&sellShares contract
augur.getNonce(id, function (nonce) { /* ... */ });
// example output:
"0"
```
### [buy&sellShares contract](https://github.com/AugurProject/augur-core/blob/master/src/functions/buy%26sellShares.se)
#### getNonce(id[, callback])

Gets a trading nonce.

```javascript
// makeReports contract
var branchId = augur.branches.dev;
var report = ["1", "2", "1", "1.5", "1", "1.5", "2", "1", "1", "1.5", "1", "1"];
var reportPeriod = 397;
augur.checkReportValidity(branchId, report, reportPeriod, function (isValid) { /* ... */ });
// example output:
isValid = "1"
```
### [makeReports contract](https://github.com/AugurProject/augur-core/blob/master/src/functions/makeReports.se)
#### checkReportValidity(branch, report, reportPeriod[, callback])

Checks the validity of `report` made on `branch` for `reportPeriod`.  A valid report is the correct length, is made before 2 reporting periods have elapsed, and is created by a valid reporting address.  Returns 1 if valid, -1 if invalid because the report is the wrong length (i.e., doesn't match the number of events being reported on), or -2 if invalid for another reason.

Transaction API
---------------

Augur's Transaction API is made up of "setter" methods that can both read from and write to the blockchain using Ethereum's `eth_sendTransaction` RPC.

```javascript
// faucets contract
var branchId = augur.branches.dev;
augur.reputationFaucet(branchId, onSent, onSuccess, onFailed);
// example outputs:
```
### [faucets contract](https://github.com/AugurProject/augur-core/blob/master/src/functions/faucets.se)
#### reputationFaucet(branch[, onSent, onSuccess, onFailed])

When invoked, grants 47 free Reputation.  (This is only available during testing, of course.)

```javascript
// cash contract
augur.sendCash(receiver, value[, onSent, onSuccess, onFailed]);
// example output:

augur.sendCashFrom(to, value, from[, onSent, onSuccess, onFailed]);
// example output:

augur.depositEther(value[, onSent, onSuccess, onFailed]);
// example output:

augur.withdrawEther(to, value[, onSent, onSuccess, onFailed]);
// example output:

```
### [cash contract](https://github.com/AugurProject/augur-core/blob/master/src/data%20and%20api/cash.se)
#### sendCash(receiver, value[, onSent, onSuccess, onFailed])

#### sendCashFrom(to, value, from[, onSent, onSuccess, onFailed])

#### depositEther(value[, onSent, onSuccess, onFailed])

#### withdrawEther(to, value[, onSent, onSuccess, onFailed])

```javascript
// checkQuorum contract
var branchId = augur.branches.dev;
augur.checkQuorum(branchId, onSent, onSuccess, onFailed)
// example output:

```
### [checkQuorum contract](https://github.com/AugurProject/augur-core/blob/master/src/functions/checkQuorum.se)
#### checkQuorum(branch[, onSent, onSuccess, onFailed])

```javascript
// buy&sellShares contract
augur.buyShares(augur.branches.dev, marketId, outcomeId, amount, null, null, console.log, console.log, console.log)
// example outputs:
{ txHash: '0x5b99e6d18716da6be2c9c50795d92c0b716eb0a0012dcf2e73f96b9c0ee1b2b2',
  callReturn: '1.23722604990455573688' }
{ nonce: '0x4dc',
  blockHash: '0xf32b439e5993add2af5133fad6c8b35c6552f16f4279ca7aeb3acc9def7c3c2d',
  blockNumber: '0x6a2c',
  transactionIndex: '0x0',
  from: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
  to: '0x2e5a882aa53805f1a9da3cf18f73673bca98fa0f',
  value: '0x0',
  gas: '0x2fd618',
  gasPrice: '0xba43b7400',
  input: '0x7d9e764100000000000000000000000000000000000000000000000000000000000f69b50acc29bf675e03383eaf9beebcc975cdcbefda75322640d67baf3b04d6af198a0000000000000000000000000000000000000000000000000000000000000005000000000000000000000000000000000000000000000004333333333333333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
  callReturn: '1.23722604990455573688',
  txHash: '0x5b99e6d18716da6be2c9c50795d92c0b716eb0a0012dcf2e73f96b9c0ee1b2b2' }

sellShares(branch, market, outcome, amount[, nonce, limit, onSent, onSuccess, onFailed])
```
### [buy&sellShares contract](https://github.com/AugurProject/augur-core/blob/master/src/functions/buy%26sellShares.se)
#### buyShares(branch, market, outcome, amount[, nonce, limit, onSent, onSuccess, onFailed])

```javascript
// createBranch contract
createSubbranch(description, periodLength, parent, tradingFee[, onSent, onSuccess, onFailed])
```
### [createBranch contract](https://github.com/AugurProject/augur-core/blob/master/src/functions/createBranch.se)

```javascript
// sendReputation contract
sendReputation(branch, to, value[, onSent, onSuccess, onFailed])
```
### [sendReputation contract](https://github.com/AugurProject/augur-core/blob/master/src/functions/sendReputation.se)

```javascript
// makeReports contract
report(branch, report, reportPeriod, salt[, onSent, onSuccess, onFailed])
submitReportHash(branch, reportHash, reportPeriod[, onSent, onSuccess, onFailed])
slashRep(branch, reportPeriod, salt, report, reporter[, onSent, onSuccess, onFailed])
```
### [makeReports contract](https://github.com/AugurProject/augur-core/blob/master/src/functions/makeReports.se)

```javascript
// createEvent contract
createEvent(branch, description, expDate, minValue, maxValue, numOutcomes[, onSent, onSuccess, onFailed])
```
### [createEvent contract](https://github.com/AugurProject/augur-core/blob/master/src/functions/createEvent.se)

```javascript
// createMarket contract
createMarket(branch, description, alpha, liquidity, tradingFee, events[, onSent, onSuccess, onFailed])
```
### [createMarket contract](https://github.com/AugurProject/augur-core/blob/master/src/functions/createMarket.se)

```javascript
// closeMarket contract
closeMarket(branch, market[, onSent, onSuccess, onFailed])
```
### [closeMarket contract](https://github.com/AugurProject/augur-core/blob/master/src/functions/closeMarket.se)

```javascript
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

Events/logging API
------------------

```javascript
// trade events (price history data)
getPrices(market, callback)
getClosingPrices(market, callback)
getPriceHistory(branch, callback)
getOutcomePriceHistory(market, outcome, callback)
getMarketPriceHistory(market, callback)
```

```javascript
// market creation events (block numbers)
getCreationBlocks(branch, callback)
getMarketCreationBlock(market, callback)
```

Invoke
------

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
