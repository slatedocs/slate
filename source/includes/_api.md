API
===
```javascript
// After installing, just require augur.js to use it.
var augur = require("augur.js");

// Attempt to connect to a local Ethereum node
augur.connect();

// Connect to a local Ethereum node with IPC support
augur.connect(null, "/home/augur/.ethereum/geth.ipc");

// Connect to Augur's public node (eth3.augur.net)
augur.connect("https://eth3.augur.net");
```
The Augur API is a set of JavaScript bindings for the methods encoded in Augur's [smart contracts](https://github.com/AugurProject/augur-core).  The API method name, as well as its parameters, are generally identical to those of the underlying smart contract method.

Augur's [core contracts](https://github.com/AugurProject/augur-core) exist on Ethereum's decentralized network.  The various serialization, networking, and formatting tasks required to communicate with the Augur contracts from a web application are carried out by Augur's sprawling [middleware](http://docs.augur.net/#architecture).

[augur.js](https://github.com/AugurProject/augur.js) includes the Augur JavaScript API, and is the user-facing component of the middleware.  If you want to interact with the Augur contracts from a custom application, augur.js is the recommended way to do so.  The easiest way to install augur.js is using [npm](https://www.npmjs.com/package/augur.js):

`$ npm install augur.js`

To use the Augur API, augur.js can connect to an Ethereum node, which can be either remote (hosted) or local.  To specify the connection endpoint, pass your RPC/IPC connection info to `augur.connect`.

<aside class="notice"><code>augur.connect</code> also accepts a second argument specifying the path to geth's IPC (inter-process communication) file.  IPC creates a persistent connection using a Unix domain socket (or a named pipe on Windows).  It is significantly faster than HTTP RPC, but requires access to the filesystem, so it cannot be used from the browser.</aside>

Trading
-------

Traders submit bids and asks.  Orders are executed if another trader will match/offer better terms.  Orders executed first come first served.  UI offers users the best prices first, in case another trader has already picked up those orders by broadcasting their transaction first (UI can also check this in the transaction pool).  The UI includes multiple backup/fallback orders in their transactions that the user would still be willing to trade (provided they're within her limit parameters).  Orders are never executed at worse prices than their limit prices (but can be better).  Orders can be partially filled.

### How to trade

- To go long, buy on exchange via bid or buy a complete set of all outcomes and sell everything else
- To go short buy a whole set and sell the one you don't like (or call the `short_sell` function)
- Spreads still stay tight due to super easy arbitrage from buy/sell complete sets
- To sell shares held buy the other outcomes and turn in a complete set or sell directly via asks.  Whichever is cheaper should be done first.

When someone enters an order in the UI the following happens:

- Find all orders on the book that can fill that order, so price is <= if buying and >= if selling 
- Call `trade(max_value, max_amount, trade_ids:arr)` which will return the amount of money that still isn't filled at the end of trading 
- If it returns 0 for the max value and amounts the UI is done
- If it returns a positive number, place a buy or sell order on the book for the amount it returns using `buy(amount, price, market_id, outcome)` or `sell(amount, price, market_id, outcome)`
- This will then `log(type=log_add_tx, $market_id, msg.sender, $type, $price, $amount, $outcome, trade_id)` where type is either `BID` or `ASK`, rest is self explanatory
- The UI calls `get_trade_ids(market_id)` to get a list of all open orders on the book 
- Then to populate the order books for each outcome in the UI: `get_trade(id)`
- If `> max` or `< min` don't show order

Pending transactions and what orders have already been picked up in pending broadcasted transactions are shown in the book.  These orders are removed if the other side has already been taken in the transaction pool (those orders get executed first on Ethereum anyway based on time precedence and default gas price).  If not processed / taken up, those orders are placed back on the book.  If two orders at same price are placed on the book, the one placed first is executed first.

Simplified API
--------------
```javascript
var branchId = 1010101;
var marketId = "-0xb196c4ce182399271e6ed434eb3f2210ae5e427c8ac0604c2cb2261694951d9";

augur.getMarketInfo(marketId, function (marketInfo) { /* ... */ })
// example output:
marketInfo = {
  "network": "2",
  "traderCount": 1,
  "makerFees": "0.5",
  "traderIndex": 0,
  "numOutcomes": 4,
  "tradingPeriod": 99010560000,
  "tradingFee": "0.01999999999999999998",
  "branchId": "0xf69b5",
  "numEvents": 1,
  "cumulativeScale": "18446744073709551616",
  "creationBlock": 920838,
  "volume": "43.05000000000000000017",
  "creationFee": "8.99999999999999967469",
  "author": "0x15f6400a88fb320822b689607d425272bea2175f",
  "tags": ["politics", "US elections", "political parties"],
  "type": "categorical",
  "endDate": 1485158400000,
  "participants": {
    "0x15f6400a88fb320822b689607d425272bea2175f": 0
  },
  "winningOutcomes": ["0", "0", "0", "0", "0", "0", "0", "0"],
  "description": "Which political party's candidate will win the 2016 U.S. Presidential Election? Choices: Democratic, Republican, Libertarian, other",
  "outcomes": [
    {
      "shares": {
        "0x15f6400a88fb320822b689607d425272bea2175f": "0"
      },
      "id": 1,
      "outstandingShares": "1.25"
    },
    {
      "shares": {
        "0x15f6400a88fb320822b689607d425272bea2175f": "1.25"
      },
      "id": 2,
      "outstandingShares": "1.25"
    },
    {
      "shares": {
        "0x15f6400a88fb320822b689607d425272bea2175f": "1.25"
      },
      "id": 3,
      "outstandingShares": "1.25"
    },
    {
      "shares": {
        "0x15f6400a88fb320822b689607d425272bea2175f": "1.25"
      },
      "id": 4,
      "outstandingShares": "1.25"
    }
  ],
  "events": [
    {
      "id": "-0xd91b9481ee9c2902198aa46c45d099afb7240f0d582ca06e646da628ec8618d8",
      "endDate": 1485158400000,
      "outcome": "0",
      "minValue": "10",
      "maxValue": "20",
      "numOutcomes": 4,
      "type": "categorical"
    }
  ],
  "_id": "-0xb196c4ce182399271e6ed434eb3f2210ae5e427c8ac0604c2cb2261694951d9"
}
```
All of the methods in the Simplified API are getter methods that use an `eth_call` RPC request; for transactional requests (`eth_sendTransaction`), see the Full API section below.  This API is simplified in the sense that single requests to this API can be used to fetch a large amount of data, without the need for complicated RPC batch queries.

### getMarketInfo(marketId[, callback])

Reads all information about a market that is stored on-contract.  It also determines the `type` of the market, which can be `binary` (two outcomes; i.e., Yes or No), `categorical` (more than two outcomes, i.e., Multiple Choice), `scalar` (answer can be any of a range of values; i.e., Numerical), or `combinatorial` (for combined wagers on multiple events).  If the market is a combinatorial market, `getMarketInfo` also makes separate RPC request for the individual event descriptions.

```javascript
var options = {
  branch: 1010101,     // branch ID (default: 1010101)
  offset: 10,          // which markets to start  (default: 0)
  numMarketsToLoad: 5  // numMarkets
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

<aside class="notice">Each branch's market IDs are stored as an "array" on the <a href="https://github.com/AugurProject/augur-core/blob/forking/src/data_api/branches.se">branches</a> contract, in the contract's <code>Branches[](markets[], numMarkets, ...)</code> data.  Markets are indexed in the order created; i.e., the first market created has index 0, the second 1, etc.  This ordering allows us to break up a large aggregate request like <code>getMarketsInfo</code> into manageable chunks.

For example, suppose you were displaying markets on separate pages.  You might want to retrieve information about all markets, but, to keep your loading time reasonable, only get 5 markets per request.  To get the first 5 markets, you would set <code>offset</code> to 0 and <code>numMarketsToLoad</code> to 5: <code>augur.getMarketsInfo({offset: 0, numMarketsToLoad: 5}, cb)</code>.  To get the second 5, <code>offset</code> would be 5: <code>augur.getMarketsInfo({offset: 5, numMarketsToLoad: 5}, cb)</code>.  The third 5, <code>offset</code> would be 10: <code>augur.getMarketsInfo({offset: 10, numMarketsToLoad: 5}, cb)</code>, and so on.</aside>

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
### [cash contract](https://github.com/AugurProject/augur-core/blob/forking/src/data_api/cash.se)
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
### [info contract](https://github.com/AugurProject/augur-core/blob/forking/src/data_api/info.se)
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

augur.getBranchByNum(0, function (branch) { /* ... */ })
// example output:
branch = "0xf69b5"
```
### [branches contract](https://github.com/AugurProject/augur-core/blob/forking/src/data_api/branches.se)
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

#### augur.getBranchByNum(branchNumber[, callback])

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
### [events contract](https://github.com/AugurProject/augur-core/blob/forking/src/data_api/events.se)
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
### [expiringEvents contract](https://github.com/AugurProject/augur-core/blob/forking/src/data_api/expiringEvents.se)
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
// trades contract
var trade_id = "-0x22daf7fdff22ff716fd8108c011d1c0e69a7ab4a2b087f65dda2fc77ea044ba1";

augur.get_trade(trade_id, function (trade) { /* ... */ });
// example output:
trade = {
  id: '-0x22daf7fdff22ff716fd8108c011d1c0e69a7ab4a2b087f65dda2fc77ea044ba1',
  type: 'sell',
  market: '-0xb196c4ce182399271e6ed434eb3f2210ae5e427c8ac0604c2cb2261694951d9',
  amount: '1',
  price: '0.5',
  owner: '0x15f6400a88fb320822b689607d425272bea2175f',
  block: 920945,
  refhash: '-0x6489ea153782b05c74a7ea4389036db78133e773c4ad895c0c7041d0b0d98fc4',
  outcome: '1'
}
```
### [trades contract](https://github.com/AugurProject/augur-core/blob/forking/src/data_api/trades.se)
#### get_trade(trade_id[, callback])

Gets the details of trade `trade_id`.  (To get the `trade_id`s for a given market, call `augur.get_trade_ids(market)`.)

```javascript
// markets contract
var marketId = "-0xb196c4ce182399271e6ed434eb3f2210ae5e427c8ac0604c2cb2261694951d9";

augur.get_trade_ids(marketId, function(trade_ids) { /* ... */ });
// example output:
trade_ids = [
  '-0xd2cbbef4aa237c97c7c412885b283a0fa517cc7a58f37e981f0cc2e01338bbbf',
  '-0xec12b8e92e92b83534ba5948c0ea22752f6975e5eef96b46e4f6d558314347a7',
  '-0xef272ceaabdc90b0c99248caaf34198e2d88d973e30a485118ab30598a95097e',
  '-0x22daf7fdff22ff716fd8108c011d1c0e69a7ab4a2b087f65dda2fc77ea044ba1'
]

var outcomeId = 5; // 8-outcome categorical market
var amount = 4;

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

var address = "0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b";
augur.getParticipantNumber(marketId, address, function (participantNumber) { /* ... */ });
// example output:
participantNumber = "0"

augur.getParticipantID(marketId, participantNumber, function (participantID) { /* ... */ });
// example output:
participantID = "0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b"

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
### [markets contract](https://github.com/AugurProject/augur-core/blob/forking/src/data_api/markets.se)
#### get_trade_ids(market[, callback])

Gets an array of trade IDs.  Each trade ID represents a buy or sell order that is sitting on `market`'s order book (i.e., has not yet been matched).  To get detailed information about the trade, call `augur.get_trade(trade_id)`.

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

#### getParticipantNumber(market, address[, callback])

Looks up the participant number for account `address`.

#### getParticipantID(market, participantNumber[, callback])

Looks up the account address for `participantNumber`.

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
### [reporting contract](https://github.com/AugurProject/augur-core/blob/forking/src/data_api/reporting.se)
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

```javascript
// makeReports contract
var branchId = augur.branches.dev;
var report = ["1", "2", "1", "1.5", "1", "1.5", "2", "1", "1", "1.5", "1", "1"];
var reportPeriod = 397;
augur.checkReportValidity(branchId, report, reportPeriod, function (isValid) { /* ... */ });
// example output:
isValid = "1"
```
### [makeReports contract](https://github.com/AugurProject/augur-core/blob/forking/src/functions/makeReports.se)
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
### [faucets contract](https://github.com/AugurProject/augur-core/blob/forking/src/functions/faucets.se)
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
### [cash contract](https://github.com/AugurProject/augur-core/blob/forking/src/data_api/cash.se)
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
### [checkQuorum contract](https://github.com/AugurProject/augur-core/blob/forking/src/functions/checkQuorum.se)
#### checkQuorum(branchId[, onSent, onSuccess, onFailed])

Determines whether consensus is ready to run.  If there aren't enough events in a vote period, push the events to the current period and increment the vote period.  Verifies if there are sufficient future events at stake; the minimum threshold is presently set at 200.  If the number of future events is not above this minimum threshold, then the branch stalls.  Returns 1 if ready, 0 otherwise.

```javascript
// buy&sellShares contract
var marketId = "-0xb196c4ce182399271e6ed434eb3f2210ae5e427c8ac0604c2cb2261694951d9";
var outcome = 1;
var amount = "0.1";
var price = "0.5";

augur.sell({
  amount: amount,
  price: price,
  market: marketId,
  outcome: outcome,
  onSent: function (sentResponse) { /* ... */ },
  onSuccess: function (successResponse) { /* ... */ },
  onFailed: function (failedResponse) { /* ... */ }
});
// example outputs:
sentResponse = {
  txHash: '0x24fa2a803f42253bbaa900af9badd32d75a728299e66ce9a0dce6a2a264307ca',
  callReturn: '-0xb33524aac9866c6cfb74305e92958b150e0a1c1849dbcf606f18d861c4362467'
}
successResponse = {
  blockHash: '0x0cde35b78f6102a59c07c0c4279166864e34518fd6672af988cd9224acdfc9c6',
  blockNumber: '0xe0ddb',
  from: '0x15f6400a88fb320822b689607d425272bea2175f',
  gas: '0x2fd618',
  gasPrice: '0x4a817c800',
  input: '0x24cd95b300000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000008000000000000000f4e693b31e7dc66d8e1912bcb14c0ddef51a1bd83753f9fb3d34dd9e96b6ae270000000000000000000000000000000000000000000000000000000000000001',
  nonce: '0x1006ff',
  to: '0xa16ced61576483990d0d821a5fc344a3429ba755',
  transactionIndex: '0x0',
  value: '0x0',
  callReturn: '-0xb33524aac9866c6cfb74305e92958b150e0a1c1849dbcf606f18d861c4362467',
  txHash: '0x24fa2a803f42253bbaa900af9badd32d75a728299e66ce9a0dce6a2a264307ca'
}

augur.buy({
  amount: amount,
  price: price,
  market: marketId,
  outcome: outcome,
  onSent: function (sentResponse) { /* ... */ },
  onSuccess: function (successResponse) { /* ... */ },
  onFailed: function (failedResponse) { /* ... */ }
});
// example outputs:
sentResponse = {
  txHash: '0xbeacc3547fd07d7cd0bde16d404f3554eb4515561fb21bc6a5231459238085c0',
  callReturn: '-0x5c354ef67fc3306a984bd1e8722fa3342b02fe6ba690b2d7aecc766c927891f'
}
successResponse = {
  blockHash: '0x7f940ad92362787b0f788c8c092e12791f8c588edc10de43091cf989bf5dd615',
  blockNumber: '0xe0e4d',
  from: '0x15f6400a88fb320822b689607d425272bea2175f',
  gas: '0x2fd618',
  gasPrice: '0x4a817c800',
  input: '0x3651cae40000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000851eb851eb851eb8f4e693b31e7dc66d8e1912bcb14c0ddef51a1bd83753f9fb3d34dd9e96b6ae270000000000000000000000000000000000000000000000000000000000000001',
  nonce: '0x100701',
  to: '0xa16ced61576483990d0d821a5fc344a3429ba755',
  transactionIndex: '0x0',
  value: '0x0',
  callReturn: '-0x5c354ef67fc3306a984bd1e8722fa3342b02fe6ba690b2d7aecc766c927891f',
  txHash: '0xbeacc3547fd07d7cd0bde16d404f3554eb4515561fb21bc6a5231459238085c0'
}
```
### [buy&sellShares contract](https://github.com/AugurProject/augur-core/blob/forking/src/functions/buy%26sellShares.se)
#### buy(amount, price, market, outcome[, onSent, onSuccess, onFailed])

Buy `amount` shares of `outcome` in `market`.

#### sell(amount, price, market, outcome[, onSent, onSuccess, onFailed])

Sell `amount` shares of `outcome` in `market`.

```javascript
// trade contract
augur.trade({
  max_value: 1,
  max_amount: 0,
  trade_ids: ["-0x22daf7fdff22ff716fd8108c011d1c0e69a7ab4a2b087f65dda2fc77ea044ba1"],
  onTradeHash: function (tradeHash) { /* ... */ },
  onCommitSent: function (sentResponse) { /* ... */ },
  onCommitSuccess: function (successResponse) { /* ... */ },
  onCommitFailed: function (failedResponse) { /* ... */ },
  onNextBlock: function (blockNumber) { /* ... */ },
  onTradeSent: function (sentResponse) { /* ... */ },
  onTradeSuccess: function (successResponse) { /* ... */ },
  onTradeFailed: function (failedResponse) { /* ... */ }
});
// example outputs:
sentResponse = {
  txHash: '0x1437c2e44379169076db42d12fb4f0fab1d330f84ab152900a703ee13f814bf7',
  callReturn: '0'
}
successResponse = {
  blockHash: '0x3f19ec7209de63043cf5031bb4a38df4bcf6e610f6874dfac87e7ad42e830708',
  blockNumber: '0xe10e0',
  from: '0x15f6400a88fb320822b689607d425272bea2175f',
  gas: '0x2fd618',
  gasPrice: '0x4a817c800',
  input: '0xf5c3624f0000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600000000000000000000000000000000000000000000000000000000000000001c630a59f0e14a6695e8078027b13184f00c79e72e606390eab9bd395bdfa1a83',
  nonce: '0x10074f',
  to: '0xb44cd937904ba0e309204ffc1413e094f2a84ee5',
  transactionIndex: '0x0',
  value: '0x0',
  callReturn: '0',
  txHash: '0x1437c2e44379169076db42d12fb4f0fab1d330f84ab152900a703ee13f814bf7'
}
```
### [trade contract](https://github.com/AugurProject/augur-core/blob/forking/src/functions/trade.se)
#### trade(max_value, max_amount, trade_ids[, onSent, onSuccess, onFailed])

Matches an order or orders (specified using an array parameter `trade_ids`) already on the books. `max_value` is the maximum amount to spend to buy (including fees).  `max_amount` is the maximum number of shares to sell.

```javascript
// completeSets contract
var marketId = "-0xb196c4ce182399271e6ed434eb3f2210ae5e427c8ac0604c2cb2261694951d9";
var outcome = 1;
var amount = "0.1";

augur.buyCompleteSets({
  marketId: marketId,
  amount: amount,
  onSent: function (sentResponse) { /* ... */ },
  onSuccess: function (successResponse) { /* ... */ },
  onFailed: function (failedResponse) { /* ... */ }
});
// example outputs:
sentResponse = {
  txHash: '0x536411add36fc39a8bb8cf310d4f26468f78fde7901721e0aea5b392f59661fe',
  callReturn: '1'
}
successResponse = {
  blockHash: '0x45498bd80813e9711b86f5ca8ff1ceec0a306a2e1f9d9e884094c78eb24c00bd',
  blockNumber: '0xe0e60',
  from: '0x15f6400a88fb320822b689607d425272bea2175f',
  gas: '0x2fd618',
  gasPrice: '0x4a817c800',
  input: '0xbefa1c86f4e693b31e7dc66d8e1912bcb14c0ddef51a1bd83753f9fb3d34dd9e96b6ae27000000000000000000000000000000000000000000000000199999999999999a',
  nonce: '0x100704',
  to: '0x3eb691ebc786d06eb97954d84e6528f72c4be74a',
  transactionIndex: '0x1',
  value: '0x0',
  callReturn: '1',
  txHash: '0x536411add36fc39a8bb8cf310d4f26468f78fde7901721e0aea5b392f59661fe' 
}

augur.sellCompleteSets({
  marketId: marketId,
  amount: amount,
  onSent: function (sentResponse) { /* ... */ },
  onSuccess: function (successResponse) { /* ... */ },
  onFailed: function (failedResponse) { /* ... */ }
});
// example outputs:
sentResponse = {
  txHash: '0x60ce607ee24c62a60c42837f2ee2a0833fff68c1be23a3805e0271763e04c1b3',
  callReturn: '1'
}
successResponse = {
  blockHash: '0x326d77dc3891132df8b74cfcf6f27f589e13557c2db40abeae17eae33f026a96',
  blockNumber: '0xe0e63',
  from: '0x15f6400a88fb320822b689607d425272bea2175f',
  gas: '0x2fd618',
  gasPrice: '0x4a817c800',
  input: '0xe30d0ad7f4e693b31e7dc66d8e1912bcb14c0ddef51a1bd83753f9fb3d34dd9e96b6ae270000000000000000000000000000000000000000000000010000000000000000',
  nonce: '0x100706',
  to: '0x3eb691ebc786d06eb97954d84e6528f72c4be74a',
  transactionIndex: '0x1',
  value: '0x0',
  callReturn: '1',
  txHash: '0x60ce607ee24c62a60c42837f2ee2a0833fff68c1be23a3805e0271763e04c1b3'
}
```

### [completeSets contract](https://github.com/AugurProject/augur-core/blob/forking/src/functions/completeSets.se)
#### buyCompleteSets(marketId, amount[, limit, onSent, onSuccess, onFailed])

Buy `amount` shares of all outcomes of `marketId` from the automated market maker.

#### sellCompleteSets(marketId, amount[, limit, onSent, onSuccess, onFailed])

Sell `amount` shares of all outcomes of `marketId` from the automated market maker.

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
### [createBranch contract](https://github.com/AugurProject/augur-core/blob/forking/src/functions/createBranch.se)
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
### [sendReputation contract](https://github.com/AugurProject/augur-core/blob/forking/src/functions/sendReputation.se)
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
### [makeReports contract](https://github.com/AugurProject/augur-core/blob/forking/src/functions/makeReports.se)
#### report(branchId, report, reportPeriod, salt[, onSent, onSuccess, onFailed])

Submits an array of reports `report` for report period `reportPeriod` on branch `branchId`.

#### submitReportHash(branchId, reportHash, reportPeriod[, onSent, onSuccess, onFailed])

Submits the SHA256 hash of the reports array `reportHash` for report period `reportPeriod` on branch `branchId`.

#### slashRep(branchId, reportPeriod, salt, report, reporter[, onSent, onSuccess, onFailed])

Slashes the Reputation of address `reporter` for `report` on branch `branchId`.

```javascript
// createEvent contract
var description = "What will the high temperature (in degrees Fahrenheit) be in San Francisco, California, on July 1, 2016?";
var expirationBlock = augur.utils.date_to_block(augur, "7-2-2016");
augur.createEvent({
  branchId: augur.branches.dev,
  description: description,
  expirationBlock: expirationBlock,
  minValue: 0,
  maxValue: 120,
  numOutcomes: 2,
  onSent: function (sentResponse) { /* ... */ },
  onSuccess: function (successResponse) { /* ... */ },
  onFailed: function (failedResponse) { /* ... */ }
});
// example outputs:
sentResponse =  {
  txHash: '0x5ed66d25e36b6b4cb6e15c97d6c85c43060af75cdbfed4d562426d24ed37fb05',
  callReturn: '-0x90fb310e94df790eaab7266034ae3807b147696bcf57a72f71db338f86718875'
}
successResponse = {
  nonce: '0x532',
  blockHash: '0x44818f0c59f089ffc55c147bd72eab5c755a34288826a40c1a695d711d5ef02c',
  blockNumber: '0x72e2',
  transactionIndex: '0x0',
  from: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
  to: '0x9fe69262bbaa47f013b7dbd6ca5f01e17446c645',
  value: '0x0',
  gas: '0x2fd618',
  gasPrice: '0xba43b7400',
  input: '0x130dd1b300000000000000000000000000000000000000000000000000000000000f69b500000000000000000000000000000000000000000000000000000000000000c00000000000000000000000000000000000000000000000000000000000129ad90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007800000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000068576861742077696c6c2074686520686967682074656d70657261747572652028696e20646567726565732046616872656e686569742920626520696e2053616e204672616e636973636f2c2043616c69666f726e69612c206f6e204a756c7920312c20323031363f000000000000000000000000000000000000000000000000',
  callReturn: '-0x90fb310e94df790eaab7266034ae3807b147696bcf57a72f71db338f86718875',
  txHash: '0x5ed66d25e36b6b4cb6e15c97d6c85c43060af75cdbfed4d562426d24ed37fb05'
}
```
### [createEvent contract](https://github.com/AugurProject/augur-core/blob/forking/src/functions/createEvent.se)
#### createEvent(branchId, description, expirationBlock, minValue, maxValue, numOutcomes[, onSent, onSuccess, onFailed])

Creates an event on branch `branchId` with `description`, expiration block number of `expirationBlock`, minimum value `minValue`, maximum value `maxValue`, and `numOutcomes` possible outcomes.

```javascript
// createMarket contract
augur.createMarket({
  branchId: augur.branches.dev,
  description: description,
  tradingFee: "0.02",
  makerFees: "0.5",
  tags: ["example tag", "other example tag", "nonsense"],
  extraInfo: "An even longer description / link to more info!",
  events: ["-0x90fb310e94df790eaab7266034ae3807b147696bcf57a72f71db338f86718875"],
  onSent: function (sentResponse) { /* ... */ },
  onSuccess: function (successResponse) { /* ... */ },
  onFailed: function (failedResponse) { /* ... */ }
});
// example outputs:
sendResponse = {
  txHash: '0x643462835b9899318ead8f47a1c43232b04a1dfeda8fba213e8c3d8a0c4651e0',
  callReturn: '-0x3bb8d91f2481d886fe94acd4d1ffe3339ec60524aeb55ceb5a6c6c8631a796c2'
}
successResponse = {
  nonce: '0x535',
  blockHash: '0x60a299bc290af601300f2a17686947159073537884aa71fc18fe3628735c5f24',
  blockNumber: '0x72e7',
  transactionIndex: '0x0',
  from: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
  to: '0x448c01a2e1fd6c2ef133402c403d2f48c99993e7',
  value: '0x0',
  gas: '0x2fd618',
  gasPrice: '0xba43b7400',
  input: '0x08d19b3f00000000000000000000000000000000000000000000000000000000000f69b500000000000000000000000000000000000000000000000000000000000000c00000000000000000000000000000000000000000000000000205bc01a36e2eb200000000000000000000000000000000000000000000000a0000000000000000000000000000000000000000000000000000000000000000051eb851eb851eb800000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000000068576861742077696c6c2074686520686967682074656d70657261747572652028696e20646567726565732046616872656e686569742920626520696e2053616e204672616e636973636f2c2043616c69666f726e69612c206f6e204a756c7920312c20323031363f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016f04cef16b2086f15548d99fcb51c7f84eb8969430a858d08e24cc70798e778b',
  callReturn: '-0x3bb8d91f2481d886fe94acd4d1ffe3339ec60524aeb55ceb5a6c6c8631a796c2',
  txHash: '0x643462835b9899318ead8f47a1c43232b04a1dfeda8fba213e8c3d8a0c4651e0'
}
```
### [createMarket contract](https://github.com/AugurProject/augur-core/blob/forking/src/functions/createMarket.se)
#### createMarket(branchId, description, tradingFee, events, tags, makerFees, extraInfo, onSent, onSuccess, onFailed)

Creates a market on branch `branchId` with `description`, trading fee (as a proportion) of `tradingFee`, maker fees (proportion of trading fees paid by the order creator, as opposed to the person matching the order) `makerFees`, topics/categories `tags`, and more detailed description and/or link to more info `extraInfo`, and containing event IDs supplied in an array `events`.  Regular (non-combinatorial) markets always have a single event; combinatorial markets allow up to 3 events.

```javascript
// closeMarket contract
var marketId = "-0x3bb8d91f2481d886fe94acd4d1ffe3339ec60524aeb55ceb5a6c6c8631a796c2";
augur.closeMarket({
  branchId: augur.branches.dev,
  marketId: marketId,
  onSent: function (sentResponse) { /* ... */ },
  onSuccess: function (successResponse) { /* ... */ },
  onFailed: function (failedResponse) { /* ... */ }
});
// example outputs:
sentResponse = {
  txHash: '0x2b48ff35e52c9963503d573c15b559c53e6b34e2ba8f1be3d4d63709239bd8f2',
  callReturn: '0'
}
successResponse = {
  nonce: '0x536',
  blockHash: '0x107c03ea39f081c462db612b7acbb8c6e3abfbdeb16fb7f2e27a680590092f9e',
  blockNumber: '0x7301',
  transactionIndex: '0x0',
  from: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
  to: '0xcece47d6c0a6a1c90521f38ec5bf7550df983804',
  value: '0x0',
  gas: '0x2fd618',
  gasPrice: '0xba43b7400',
  input: '0x60aea93e00000000000000000000000000000000000000000000000000000000000f69b5c44726e0db7e2779016b532b2e001ccc6139fadb514aa314a5939379ce58693e',
  callReturn: '0',
  txHash: '0x2b48ff35e52c9963503d573c15b559c53e6b34e2ba8f1be3d4d63709239bd8f2'
}
```
### [closeMarket contract](https://github.com/AugurProject/augur-core/blob/forking/src/functions/closeMarket.se)
#### closeMarket(branchId, marketId[, onSent, onSuccess, onFailed])

Closes market with ID `marketId` on branch `branchId`.

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
