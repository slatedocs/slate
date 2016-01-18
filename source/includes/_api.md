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

Validates `report` made on `branch` for `reportPeriod`.  A valid report is the correct length, is made before 2 reporting periods have elapsed, and is created by a valid reporting address.  Returns 1 if valid, -1 if invalid because the report is the wrong length (i.e., doesn't match the number of events being reported on), or -2 if invalid for another reason.

Transaction API
---------------

Augur's Transaction API is made up of "setter" methods that can both read from and write to the blockchain using Ethereum's `eth_sendTransaction` RPC.  Under the hood, the API uses augur.js's convenience wrapper for `eth_sendTransaction`, `augur.transact`.

### Callbacks

All Transaction API methods accept three callback functions:

#### onSent(sentResponse)

Fires when the initial `eth_sendTransaction` response is received.  If the transaction was broadcast to the network without problems, `sentResponse` will have two fields: `txHash` (the transaction hash as a hex string) and `callReturn` (the value returned by the invoked contract method).  The optional `returns` field in the `tx` object sent to `augur.transact` can be used to specify the format of the `callReturn` value.

#### onSuccess(successResponse)

Fires when the transaction is successfully incorporated into a block and added to the blockchain, as indicated by a nonzero `blockHash` value.  `successResponse` is structured the same way as `eth_getTransactionByHash` responses (see code example for details), with the addition of a `callReturn` field which contains the contract method's return value.

#### onFailed(failedResponse)

Fires if the transaction is unsuccessful.  `failedResponse` has `error` (error code) and `message` (error description) fields, describing the way in which the transaction failed.

No callbacks are required; if none are supplied, then the transaction hash (or error) will simply be returned.  In this case, the transaction has been broadcast to the Ethereum network, but further confirmation of the transaction and/or lookups of its return value will need to be done manually.  If an `onSent` but not an `onSuccess` callback is provided, the transaction will be broadcast, and `onSent` will be passed an `sentResponse` object containing `txHash` and `callReturn` fields, but `augur.rpc` will not poll the network repeatedly to check on the status of the transaction.

### Arguments

All Transaction API methods accept either positional or object arguments.  Examples are shown using object arguments (to make the field names clear).  The arguments are displayed in order from left-to-right (top-to-bottom if multiple lines are needed).  For positional arguments, `onSent`, `onSuccess`, and `onFailed` should always be the last three arguments, in that order.

```javascript
// transaction object (generated by the buyShares method)
var tx = {
  "to": "0x2e5a882aa53805f1a9da3cf18f73673bca98fa0f",
  "method": "buyShares",
  "signature": "iiiiii",
  "from": "0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b",
  "params": [
    "0xf69b5",
    "-0x130158e01e01cc67d3d8803f88493b8aadc6654be759fbf2d40105506b41daa3",
    1,
    "0x199999999999999a",
    "0",
    0
  ],
  "returns": "unfix",
  "send": true
};

// onSent callback fires when the initial eth_sendTransaction response
// is received
var onSent = function (sentResponse) {
  console.log("transaction sent:", sentResponse);  
};

// onSuccess callback fires
var onSuccess = function (successResponse) {
  console.log("transaction successful:", successResponse);
};

// onFailed callback fires when the transaction is malformed, fails to confirm,
// or an object with an error field is received
var onFailed = function (failedResponse) {
  console.error("transaction failed:", failedResponse);
};

augur.transact(tx, onSent, onSuccess, onFailed);
// example outputs:
sentResponse = {
  txHash: '0xdf096e249638df143118f562868e90285579819e59b09f0784b95fa5fd920413',
  callReturn: '0.05959702938270431576'
}
successResponse = {
  nonce: '0x4e1',
  blockHash: '0xb8e4e78c9cf949729bbb7b94e942d8d63e67e9f48b394f3208cf0d2928e44bad',
  blockNumber: '0x6a5f',
  transactionIndex: '0x0',
  from: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
  to: '0x2e5a882aa53805f1a9da3cf18f73673bca98fa0f',
  value: '0x0',
  gas: '0x2fd618',
  gasPrice: '0xba43b7400',
  input: '0x7d9e764100000000000000000000000000000000000000000000000000000000000f69b5ecfea71fe1fe33982c277fc077b6c47552399ab418a6040d2bfefaaf94be255d0000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000199999999999999a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
  callReturn: '0.05959702938270431576',
  txHash: '0xdf096e249638df143118f562868e90285579819e59b09f0784b95fa5fd920413'
}
failedResponse = {
  error: 501,
  message: 'polled network but could not confirm transaction'
}
```
### transact(tx[, onSent, onSuccess, onFailed])

<aside class="warning">While it is possible to use <code>augur.transact</code> directly, it is generally easier and less error-prone to use one of the named API functions documented in the following sections.  Readers who want to use the Transaction API and aren't terribly curious about the augur.js/ethrpc plumbing under the hood should jump to the next section!</aside>

`augur.transact` carries out the following "send-call-confirm" sequence:

1. `augur.transact` sends an `eth_sendTransaction` RPC request (or `eth_sendRawTransaction` for transactions which are already signed), which broadcasts the transaction to the Ethereum network.  If an error is received, then the error is passed to `onFailed` and `augur.transact` terminates.  If a transaction hash is received, then this transaction is added to the `augur.rpc.txs` object (which is indexed by transaction hash, e.g. `augur.rpc.txs[txHash]`) and assigned a `status` of `"pending"`.

2. `augur.rpc.confirmTx` uses `eth_getTransactionByHash` to look up the transaction's exact ABI-encoded inputs.  It then sends an `eth_call` RPC using these inputs to get the invoked method's return value (if any).  If the return value is an error, then the error is passed to `onFailed` and `augur.transact` terminates.  Otherwise, `augur.rpc.encodeResult` encodes the return value (as specified in the `returns` field of the `tx` input), and an object with `txHash` and `callReturn` fields is passed to `onSent`.

3. Every `augur.rpc.TX_POLL_INTERVAL` milliseconds, `augur.rpc.txNotify` looks up the transaction using `eth_getTransactionByHash`.  If `augur.rpc.txNotify` receives a `null` response, `augur.rpc.txs[txHash].status` is set to `"failed"`.  A null response indicates that the transaction has been (silently) removed from geth's transaction pool.  This can happen if the transaction is a duplicate of another transaction that has not yet cleared the transaction pool (and therefore geth does not fire a duplicate transaction error), or if the transaction's nonce (but not its other fields) is a duplicate.  In the former case, the duplicate transaction is assumed to be an accidental submission, a `TRANSACTION_NOT_FOUND` error is passed to `onFailed`, and the `augur.transact` sequence terminates.  The latter case arises when the transaction was signed client-side -- and therefore its nonce was also generated client-side -- then submitted using `eth_sendRawTransaction` (instead of `eth_sendTransaction`).  Network latency, client-side errors, and other factors can result in duplicate raw transaction nonces.  In this case, `augur.rpc.txs[txHash].status` is set to `"resubmitted"`, the transaction's nonce is incremented, and `augur.transact` is executed with the new transaction.

4. If `augur.rpc.txNotify` receives a non-null transaction object, then `augur.rpc.checkBlockHash` checks to see if the transaction's `blockHash` field is a nonzero value, indicating that it has been successfully incorporated into a block and attached to the blockchain.  If `blockHash` is zero, then after `augur.rpc.TX_POLL_INTERVAL` elapses, `augur.rpc.txNotify` again looks up the transaction; this step repeats at most `augur.rpc.TX_POLL_MAX` times, after which `augur.rpc.txs[txHash].status` is set to `"unconfirmed"`, the `TRANSACTION_NOT_CONFIRMED` error is passed to `onFailed`, and the sequence terminates.  If `blockHash` is non-zero, then `augur.rpc.txs[txHash].status` is set to `"confirmed"`.  A `callReturn` field is added to the transaction object, which is then passed to `onSuccess`, completing the sequence.

<aside class="notice">The <code>augur.rpc</code> object is simply an instance of <a href="https://github.com/AugurProject/ethrpc">ethrpc</a> that has its state synchronized with the <code>augur</code> object.</aside>

The first argument to `augur.transact` is a "transaction object".

```javascript
// faucets contract
var branch = augur.branches.dev;
augur.reputationFaucet({
  branch: branch,
  onSent: function (sentResponse) { /* ... */ },
  onSuccess: function (successResponse) { /* ... */ },
  onFailed: function (failedResponse) { /* ... */ }
});
// example outputs:
sentResponse = {
  txHash: '0x7aeeacf586d3afa89dc7ca41a4df52307d1a91c33b8726552d3f84b041b5850e',
  callReturn: '1'
}
successResponse = {
  nonce: '0x4e4',
  blockHash: '0x1fb89b98f59e8a1803556e99c6e2772992ad9bd199e638ccf5e9bff9aa595ffe',
  blockNumber: '0x6ab8',
  transactionIndex: '0x0',
  from: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
  to: '0x509592c96eee7e19f6a34772fd8783cb072ca3c6',
  value: '0x0',
  gas: '0x2fd618',
  gasPrice: '0xba43b7400',
  input: '0x988445fe00000000000000000000000000000000000000000000000000000000000f69b5',
  callReturn: '1',
  txHash: '0x7aeeacf586d3afa89dc7ca41a4df52307d1a91c33b8726552d3f84b041b5850e'
}
```
### [faucets contract](https://github.com/AugurProject/augur-core/blob/master/src/functions/faucets.se)
#### reputationFaucet(branch[, onSent, onSuccess, onFailed])

Sets the Reputation balance of the sending account to 47.  (Only available during testing, of course!)

```javascript
// cash contract
augur.sendCash({
  to: "0x639b41c4d3d399894f2a57894278e1653e7cd24c",
  value: 1,
  onSent: function (sentResponse) { /* ... */ },
  onSuccess: function (successResponse) { /* ... */ },
  onFailed: function (failedResponse) { /* ... */ }
});
// example outputs:
sentResponse = {
  txHash: '0xff5ad9bdfc9e1ffce3f1014ead5feea6ce4ff15b4a4aaa8734ef4e18338a7bfb',
  callReturn: '1'
}
successResponse = {
  nonce: '0x4e6',
  blockHash: '0xc1fd7a7897560f153cd37053389ac079942661c11f6b9296928481188e4b2b5d',
  blockNumber: '0x6ade',
  transactionIndex: '0x0',
  from: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
  to: '0xe4714fcbdcdba49629bc408183ef40d120700b8d',
  value: '0x0',
  gas: '0x2fd618',
  gasPrice: '0xba43b7400',
  input: '0x693200ce000000000000000000000000639b41c4d3d399894f2a57894278e1653e7cd24c0000000000000000000000000000000000000000000000010000000000000000',
  callReturn: '1',
  txHash: '0xff5ad9bdfc9e1ffce3f1014ead5feea6ce4ff15b4a4aaa8734ef4e18338a7bfb'
}

augur.sendCashFrom({
  to: to,
  value: value,
  from: from,
  onSent: function (sentResponse) { /* ... */ },
  onSuccess: function (successResponse) { /* ... */ },
  onFailed: function (failedResponse) { /* ... */ }
});
// example outputs:
sentResponse = {
  txHash: '0xb2dc04cb4b5f3bb4b0a1dec50d539f31cf048918f62da6bfd202a0a546a32b62',
  callReturn: '1'
}
successResponse = {
  nonce: '0x4e7',
  blockHash: '0x220870218f6e62037139c4d86ba21fad96497ec8bcc3735999dc81e0bc099b21',
  blockNumber: '0x6ae4',
  transactionIndex: '0x0',
  from: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
  to: '0xe4714fcbdcdba49629bc408183ef40d120700b8d',
  value: '0x0',
  gas: '0x2fd618',
  gasPrice: '0xba43b7400',
  input: '0x80b97fc0000000000000000000000000639b41c4d3d399894f2a57894278e1653e7cd24c000000000000000000000000000000000000000000000001000000000000000000000000000000000000000005ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
  callReturn: '1',
  txHash: '0xb2dc04cb4b5f3bb4b0a1dec50d539f31cf048918f62da6bfd202a0a546a32b62'
}

augur.depositEther({
  value: 2,
  onSent: function (sentResponse) { /* ... */ },
  onSuccess: function (successResponse) { /* ... */ },
  onFailed: function (failedResponse) { /* ... */ }
});
// example outputs:
sentResponse = {
  txHash: '0x2cb4c0f6796b102fb6b1dead8cb85d91f2af330057eb69a6f6f9814617d04a56',
  callReturn: '2000000000000000000'
}
successResponse = {
  nonce: '0x4e8',
  blockHash: '0x81cfb01f897dd7df9ca898f4fd232f5c0957f59596a35b1ef552e37516cdfc38',
  blockNumber: '0x6af0',
  transactionIndex: '0x0',
  from: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
  to: '0xe4714fcbdcdba49629bc408183ef40d120700b8d',
  value: '0x1bc16d674ec80000',
  gas: '0x2fd618',
  gasPrice: '0xba43b7400',
  input: '0x98ea5fca',
  callReturn: '2000000000000000000',
  txHash: '0x2cb4c0f6796b102fb6b1dead8cb85d91f2af330057eb69a6f6f9814617d04a56'
}

augur.withdrawEther({
  to: "0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b,
  value: 2,
  onSent: function (sentResponse) { /* ... */ },
  onSuccess: function (successResponse) { /* ... */ },
  onFailed: function (failedResponse) { /* ... */ }
});
// example outputs:
sentResponse = {
  txHash: '0x3f44c75513667dee7dcf0a5f08e7be32751fbc2c5c52a8a29018682941ee4895',
  callReturn: '1'
}
successResponse = {
  nonce: '0x4e9',
  blockHash: '0xde4deb916d67631e63e8aed4fefec7839a09be9b3cd8b3914fe48d9751a159a4',
  blockNumber: '0x6af3',
  transactionIndex: '0x0',
  from: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
  to: '0xe4714fcbdcdba49629bc408183ef40d120700b8d',
  value: '0x0',
  gas: '0x2fd618',
  gasPrice: '0xba43b7400',
  input: '0x698f6e9d00000000000000000000000005ae1d0ca6206c6168b42efcd1fbe0ed144e821b0000000000000000000000000000000000000000000000001bc16d674ec80000',
  callReturn: '1',
  txHash: '0x3f44c75513667dee7dcf0a5f08e7be32751fbc2c5c52a8a29018682941ee4895'
}
```
### [cash contract](https://github.com/AugurProject/augur-core/blob/master/src/data%20and%20api/cash.se)
#### sendCash(to, value[, onSent, onSuccess, onFailed])

Sends `value` units of CASH to address `to`.  Returns the value sent if successful.

#### sendCashFrom(to, value, from[, onSent, onSuccess, onFailed])

Sends `value` units of CASH to address `to` from address `from`.  Returns the value sent if successful.

#### depositEther(value[, onSent, onSuccess, onFailed])

Exchange `value` units of Ether for an equivalent number of CASH tokens.  Returns the amount sent (in Wei).

#### withdrawEther(to, value[, onSent, onSuccess, onFailed])

Exchange `value` CASH tokens for an equivalent number of Ether tokens.  The withdrawn CASH is sent to address `to`.  Returns 1 if successful, 0 otherwise.

```javascript
// checkQuorum contract
var branchId = augur.branches.dev;
augur.checkQuorum({
  branchId: branchId,
  onSent: function (sentResponse) { /* ... */ },
  onSuccess: function (successResponse) { /* ... */ },
  onFailed: function (failedResponse) { /* ... */ }
});
// example outputs:
sentResponse = {
  txHash: '0x45bc69d4aaf9e9bc8d8524d6b4a33f3289d56d150ab4b58c3e85a480db851f47',
  callReturn: '0'
}
successResponse = {
  nonce: '0x4e3',
  blockHash: '0x0211c8bd326e9e71bfadb19258ea787080626fe9940a4c197dea31edbe93c3c6',
  blockNumber: '0x6a97',
  transactionIndex: '0x0',
  from: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
  to: '0x8caf2c0ce7cdc2e81b58f74322cefdef440b3f8d',
  value: '0x0',
  gas: '0x2fd618',
  gasPrice: '0xba43b7400',
  input: '0x27138bfb00000000000000000000000000000000000000000000000000000000000f69b5',
  callReturn: '0',
  txHash: '0x45bc69d4aaf9e9bc8d8524d6b4a33f3289d56d150ab4b58c3e85a480db851f47'
}
```
### [checkQuorum contract](https://github.com/AugurProject/augur-core/blob/master/src/functions/checkQuorum.se)
#### checkQuorum(branchId[, onSent, onSuccess, onFailed])

Determines whether consensus is ready to run.  If there aren't enough events in a vote period, push the events to the current period and increment the vote period.  Verifies if there are sufficient future events at stake; the minimum threshold is presently set at 200.  If the number of future events is not above this minimum threshold, then the branch stalls.  Returns 1 if ready, 0 otherwise.

```javascript
// buy&sellShares contract
var branchId = augur.branches.dev;
var marketId = "-0x130158e01e01cc67d3d8803f88493b8aadc6654be759fbf2d40105506b41daa3";
var outcome = 1;
var amount = "0.1";
augur.buyShares({
  branchId: branchId,
  marketId: marketId,
  outcome: outcome,
  amount: amount,
  nonce: null,
  limit: null,
  onSent: function (sentResponse) { /* ... */ },
  onSuccess: function (successResponse) { /* ... */ },
  onFailed: function (failedResponse) { /* ... */ }
});
// example outputs:
sentResponse = {
  txHash: '0x5b99e6d18716da6be2c9c50795d92c0b716eb0a0012dcf2e73f96b9c0ee1b2b2',
  callReturn: '1.23722604990455573688'
}
successResponse = {
  nonce: '0x4dc',
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
  txHash: '0x5b99e6d18716da6be2c9c50795d92c0b716eb0a0012dcf2e73f96b9c0ee1b2b2'
}

augur.sellShares({
  branchId: branchId,
  marketId: marketId,
  outcome: outcome,
  amount: amount,
  nonce: null,
  limit: null,
  onSent: function (sentResponse) { /* ... */ },
  onSuccess: function (successResponse) { /* ... */ },
  onFailed: function (failedResponse) { /* ... */ }
});
// example outputs:
sentResponse = {
  txHash: '0x0c93b30f4e001b5aaf367470346874e15f4fb14acf024572a3aaac6515ab4adb',
  callReturn: '0.07115672415962748134'
}
successResponse = {
  nonce: '0x4e2',
  blockHash: '0xc9b8506031f455cf9de3145e637b9bae13a79d8ed5c6f4eed257d483b0b6cdbb',
  blockNumber: '0x6a79',
  transactionIndex: '0x0',
  from: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
  to: '0x2e5a882aa53805f1a9da3cf18f73673bca98fa0f',
  value: '0x0',
  gas: '0x2fd618',
  gasPrice: '0xba43b7400',
  input: '0x314f177c00000000000000000000000000000000000000000000000000000000000f69b5ecfea71fe1fe33982c277fc077b6c47552399ab418a6040d2bfefaaf94be255d0000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000199999999999999a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
  callReturn: '0.07115672415962748134',
  txHash: '0x0c93b30f4e001b5aaf367470346874e15f4fb14acf024572a3aaac6515ab4adb'
}
```
### [buy&sellShares contract](https://github.com/AugurProject/augur-core/blob/master/src/functions/buy%26sellShares.se)
#### buyShares(branchId, marketId, outcome, amount[, nonce, limit, onSent, onSuccess, onFailed])

Buy `amount` shares of `outcome` in `marketId` from the automated market maker.

#### sellShares(branchId, marketId, outcome, amount[, nonce, limit, onSent, onSuccess, onFailed])

Sell `amount` shares of `outcome` in `marketId` from the automated market maker.

```javascript
// createBranch contract
augur.createSubbranch({
  description: "Ground0:Party at Ground Zero",
  periodLength: 25,
  parent: augur.branches.dev,
  tradingFee: "0.02",
  onSent: function (sentResponse) { /* ... */ },
  onSuccess: function (successResponse) { /* ... */ },
  onFailed: function (failedResponse) { /* ... */ }
});
// example outputs:
sentResponse = {
  txHash: '0x29b169c0bd087aefd2f2dcd7b54c6ac08a3d8d78c6030a18980d059650f39117',
  callReturn: '-0xab9869bbaf19cc580a5c6d4571cd7eac02e98ed6ef127c69478bfb43762d4d13'
}
successResponse = {
  nonce: '0x4f0',
  blockHash: '0xe521198ffbbd9c53bbe7e773502a08482ebe3cdebbb0053a1bf44487b834d43a',
  blockNumber: '0x6b7f',
  transactionIndex: '0x0',
  from: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
  to: '0x5f67ab9ff79be97b27ac8f26ef9f4b429b82e2df',
  value: '0x0',
  gas: '0x2fd618',
  gasPrice: '0xba43b7400',
  input: '0x5c5c65010000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000001900000000000000000000000000000000000000000000000000000000000f69b5000000000000000000000000000000000000000000000000051eb851eb851eb8000000000000000000000000000000000000000000000000000000000000001c47726f756e64303a50617274792061742047726f756e64205a65726f00000000',
  callReturn: '-0xab9869bbaf19cc580a5c6d4571cd7eac02e98ed6ef127c69478bfb43762d4d13',
  txHash: '0x29b169c0bd087aefd2f2dcd7b54c6ac08a3d8d78c6030a18980d059650f39117'
}
```
### [createBranch contract](https://github.com/AugurProject/augur-core/blob/master/src/functions/createBranch.se)
#### createSubbranch(description, periodLength, parent, tradingFee[, onSent, onSuccess, onFailed])

Creates a new sub-branch of branch `parent`.  The description format is branchName:description.  `periodLength` is given in blocks.  Returns the new branch's ID if successful.  Otherwise, returns -1 if there is a bad input or the parent doesn't exist, -2 if there is insufficient funds to create the branch or if the branch already exists.

```javascript
// sendReputation contract
augur.sendReputation({
  branchId: augur.branches.dev,
  to: "0x0da70d5a92d6cfcd4c12e2a83950676fdf4c95f9",
  value: 10,
  onSent: function (sentResponse) { /* ... */ },
  onSuccess: function (successResponse) { /* ... */ },
  onFailed: function (failedResponse) { /* ... */ }
});
// example outputs:
sentResponse = {
  txHash: '0x1460b261654f24bf0bbb436f1766b68a94f476c57d4998e26da75114f56cc5a8',
  callReturn: '10'
}
successResponse = {
  nonce: '0x4f1',
  blockHash: '0x2ad3f1071758d9efcb4d2458236128fdaa76585c3c4d551f50c26d2a50a2e38f',
  blockNumber: '0x6b97',
  transactionIndex: '0x0',
  from: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
  to: '0x35152caa07026203a1add680771afb690d872d7d',
  value: '0x0',
  gas: '0x2fd618',
  gasPrice: '0xba43b7400',
  input: '0xa677135c00000000000000000000000000000000000000000000000000000000000f69b50000000000000000000000000da70d5a92d6cfcd4c12e2a83950676fdf4c95f900000000000000000000000000000000000000000000000a0000000000000000',
  callReturn: '10',
  txHash: '0x1460b261654f24bf0bbb436f1766b68a94f476c57d4998e26da75114f56cc5a8'
}
```
### [sendReputation contract](https://github.com/AugurProject/augur-core/blob/master/src/functions/sendReputation.se)
#### sendReputation(branchId, to, value[, onSent, onSuccess, onFailed])

Sends `value` Reputation tokens on branch `branchId` to address `to`.  Returns the value sent if successful.

```javascript
// makeReports contract
var branchId = augur.branches.dev;
var report = ["1", "2", "1", "1.5", "1", "1.5", "2", "1", "1", "1.5", "1", "1"];
var reportPeriod = 397;
var salt = "0xb3017088d3de23f9611dbf5d23773b5ad38621bab84aa79a0621c8800aeb4c33";
augur.report({
  branchId: branchId,
  report: report,
  reportPeriod: reportPeriod,
  salt: salt,
  onSent: function (sentResponse) { /* ... */ },
  onSuccess: function (successResponse) { /* ... */ },
  onFailed: function (failedResponse) { /* ... */ }
});
// example outputs:
sentResponse = 

augur.submitReportHash({
  branchId: branchId,
  reportHash: reportHash,
  reportPeriod: reportPeriod,
  salt: salt,
  onSent: function (sentResponse) { /* ... */ },
  onSuccess: function (successResponse) { /* ... */ },
  onFailed: function (failedResponse) { /* ... */ }
});
// example outputs:
sentResponse = 

augur.slashRep({
  branchId: branchId,
  reportPeriod: reportPeriod,
  salt: salt,
  report: report,
  reporter: "0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b",
  onSent: function (sentResponse) { /* ... */ },
  onSuccess: function (successResponse) { /* ... */ },
  onFailed: function (failedResponse) { /* ... */ }
});
// example outputs:
sentResponse = 

```
### [makeReports contract](https://github.com/AugurProject/augur-core/blob/master/src/functions/makeReports.se)
#### report(branchId, report, reportPeriod, salt[, onSent, onSuccess, onFailed])

Submits an array of reports `report` for report period `reportPeriod` on branch `branchId`.

#### submitReportHash(branchId, reportHash, reportPeriod[, onSent, onSuccess, onFailed])

Submits the SHA256 hash of the reports array `reportHash` for report period `reportPeriod` on branch `branchId`.

#### slashRep(branchId, reportPeriod, salt, report, reporter[, onSent, onSuccess, onFailed])

Slashes the Reputation of address `reporter` for `report` on branch `branchId`.

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
