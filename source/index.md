---
title: Augur JavaScript API

language_tabs:
  - javascript
  - python

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

To use augur.js, you must be running a local Ethereum node.  By default, it expects your Ethereum client to be listening on port 8545.  Note that we've only tested with [geth](https://github.com/ethereum/go-ethereum) so far; use with [eth](https://github.com/ethereum/cpp-ethereum) or [pyethapp](https://github.com/ethereum/pyethapp) at your own risk.

To use "send" RPC commands, you will need to unlock your client.  The easiest way to do this is to start geth with the `--unlock` option:
```
$ geth --rpc --rpccorsdomain "http://localhost:8545" --shh --networkid "1010101" --protocolversion "71" --unlock primary
```
augur.js can be installed using npm:
```
$ npm install augur.js
```
After installing, just require augur.js to use it:
```javascript
var Augur = require('augur.js');
Augur.connect();
```
By default, augur.js will look for a localhost Ethereum node listening on port 8545.  To change this, just call pass your RPC connection info (as an object or a URL string) to the `connect` method.  For example:
```javascript
Augur.connect({ protocol: "http", host: "localhost", port: 8545 });
Augur.connect("http://poc9.com:8545");
Augur.connect("127.0.0.1");
```

## How to pass numbers to Augur

There are four acceptable ways to pass numerical inputs to the Augur API:

- primitive JS numbers (e.g., `1010101`): ok for integers, but use strings for floating point numbers (see below)

- stringified numbers (e.g., `"1010101"`)

- hexadecimal strings (e.g., `"0xf69b5"`)

- BigNumbers (e.g., `new BigNumber("1010101")`)

Note that for primitive JS numbers, you will receive an error from the BigNumber library if your input contains more than 15 significant figures.

Floating-point (decimal) values should be passed to augur.js as strings (e.g., instead of `0.07`, use `"0.07"`), for reasons described in [enormous detail](http://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html) elsewhere.

**All numerical parameters passed to augur.js must be either base 10 (decimal) or base 16 (hexadecimal).** Do **not** use the base 2^64 representation that Augur uses internally for fixed-point numbers!  augur.js handles all fixed-point conversions for you.  Do **not** send the Loch Ness monster 3.50*2^64 CASH.  (Probably don't even give him 3.50, but that's a debate for another time.)

## Callbacks

All of augur.js's methods that involve an RPC request take an optional callback function as their last parameter.  If a callback is supplied, the RPC request will be asynchronous; otherwise, it will be synchronous.  Synchronous HTTP RPC is generally not recommended, especially if augur.js is running in the browser, as synchronous RPC requests block the main JS thread (which essentially freezes the browser).

## Augur API

augur.js is primarily a set of JavaScript bindings for the Augur API.  The augur.js function name, as well as the function's parameters, are generally the same as those of the underlying [augur-core](https://github.com/AugurProject/augur-core) functions.

All Augur functions have an optional callback (or callbacks; see below) as their final parameter.  augur.js currently implements the following Augur API functions:

- getCashBalance(address[, callback])

- getRepBalance(branch, address[, callback])

- getBranches([callback])

- getMarkets(branch[, callback])

- getMarketInfo(market[, callback])

- getMarketEvents(market[, callback])

- getNumEvents(market[, callback])

- getEventInfo(event[, callback])

- getBranchID(branch[, callback])

- getNonce(id[, callback])

- getCurrentParticipantNumber(market[, callback])

- getParticipantSharesPurchased(market, participantNumber, outcome[, callback])

- getSharesPurchased(market, outcome[, callback])

- getEvents(branchId, votePeriod[, callback])

- getVotePeriod(branchId[, callback])

- getPeriodLength(branchId[, callback])

- getBranch(branchIdNumber[, callback])

- sendCash(receiver, value[, callback])

- cashFaucet([callback])

- reputationFaucet([callback])

- getDescription(id[, callback])

- createEvent(eventObject)
    - eventObject has the following fields:
        - branchId <integer>
        - description <string>
        - minValue <integer> (will be floating-point)
        - maxValue <integer> (will be floating-point)
        - numOutcomes <integer>
        - expDate <integer> - block number when the event expires
        - onSent <function> - callback that fires after the event is broadcast to the network
        - onSuccess <function> - optional callback that fires when augur.js is able to see your event on the network (asynchronous check every 12 seconds)

    - All callbacks should accept a single parameter: an `event` object with `id` and `txhash` fields
    
    - Calling createEvent(branchId, description, expDate, minValue, maxValue, numOutcomes[, onSent, onSuccess]) with positional arguments also works

- createMarket(marketObject)
    - marketObject has the following fields:
        - branchId <integer>
        - description <string>
        - minValue <integer> (will be floating-point)
        - maxValue <integer> (will be floating-point)
        - numOutcomes <integer>
        - expDate <integer> - block number when the event expires
        - onSent <function> - callback that fires after the event is broadcast to the network
        - onSuccess <function> - optional callback that fires when augur.js is able to see your event on the network (asynchronous check every 12 seconds)
        - onFailure <function> - optional callback that fires if you market creation errors

    - All callbacks should accept a single parameter: a `market` object with `id` and `txhash` fields
    
    - Calling createMarket(branchId, description, alpha, liquidity, tradingFee, events[, onSent, onSuccess, onFailed]) with positional arguments also works

- buyShares(branchId, market, outcome, amount, nonce[, callback])

- sellShares(branchId, market, outcome, amount, nonce[, callback])

- sendReputation(branchId, receiver, value[, callback])

- getSimulatedBuy(market, outcome, amount[, callback])

    ```javascript
    > Augur.getSimulatedBuy("0xb13d98f933cbd602a3d9d4626260077678ab210d1e63b3108b231c1758ff9971", 1, Augur.ONE.toString(16))
    ["0x0000000000000000000000000000000000000000000000000013b073172aceb2",
     "0x0000000000000000000000000000000000000000000000008de39f2500000000"]
    ```

- getSimulatedSell(market, outcome, amount[, callback])

    ```javascript
    > Augur.getSimulatedSell("0xb13d98f933cbd602a3d9d4626260077678ab210d1e63b3108b231c1758ff9971", 1, Augur.ONE.toString(16))
    ["0x0000000000000000000000000000000000000000000000000013af84d04feba9",
     "0x0000000000000000000000000000000000000000000000008dd635b900000000"]
     ```

- getCreator(id[, callback])

    ```javascript
    > var market = "0xb13d98f933cbd602a3d9d4626260077678ab210d1e63b3108b231c1758ff9971";
    > Augur.getCreator(market);
    "0x0000000000000000000000001c11aa45c792e202e9ffdc2f12f99d0d209bef70"
    ```

- getCreationFee(id[, callback])

    ```javascript
    > Augur.getCreationFee(market)
    "0x00000000000000000000000000000000000000000000000a0000000000000000"
    ```

- getExpiration(event[, callback]): Event expiration block.

    ```javascript
    > var event = "0xb2a6de45f349b5ac384b01a785e640f519f0a8597ab2031c964c7f572d96b13c";
    > Augur.getExpiration(event)
    "0x000000000000000000000000000000000000000000000000000000000003d090"
    ```

- getMarketNumOutcomes(market[, callback]): Number of outcomes in this market as an integer.

    ```javascript
    > Augur.getMarketNumOutcomes(market)
    2
    ```

- price(market, outcome[, callback]): Get the current (instantaneous) price of an outcome.

    ```javascript
    > Augur.price(market_id, 1, function (r) { console.log(r.dividedBy(Augur.ONE).toFixed()); })
    0.55415210523642599583
    ```

- getWinningOutcomes(market[, callback])

If you need more flexibility, please refer to the `invoke` function below, which allows you to build a transaction object manually, then broadcast it to the network with `sendTransaction` and/or capture its return value with `call`.

## Batched RPC commands

You can send batched RPC commands using the `batch` method:
```javascript
> var txlist = [{
...         to: "0x3caf506cf3d5bb16ba2c8f89a6591c5160d69cf3",
...         method: "ten"
...     }, {
...         to: "0x5204f18c652d1c31c6a5968cb65e011915285a50",
...         method: "double",
...         signature: "i",
...         params: 3
...     }];
> Augur.batch(txlist)
['10', '6']
```
I'm going to add more user-friendly wrappers soon, which will allow you to batch commands without setting up transaction objects yourself.

## Ethereum JSON-RPC bindings

augur.js sends [JSON-RPC](https://github.com/ethereum/wiki/wiki/JSON-RPC) commands to Ethereum.  Its lower-level RPC functions are described here. 

### Basic RPC commands

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

### Uploading and downloading contracts

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

### Running contract functions

`invoke` executes a function in a contract already on the network:
```javascript
> tx = {
...   to: "0x5204f18c652d1c31c6a5968cb65e011915285a50",
...   method: "double",
...   signature: "i",
...   params: 22121,
...   send: false,
...   returns: "int"
... };

> Augur.invoke(tx)
44242
```
(`execute` and `run` are both aliases for `invoke`.) The function called here `double(22121)` simply doubles its input argument, so the result is as expected.  The transaction fields are as follows:
```
Required:
    - to: <contract address> (hexstring)
    - method: <function name> (string)
    - signature: <function signature, e.g. "iia"> (string)
    - params: <parameters passed to the function>
Optional:
    - send: <true to sendTransaction, false to call (default)>
    - from: <sender's address> (hexstring; defaults to the coinbase account)
    - returns: <"array", "int", "BigNumber", or "string" (default)>
```
The `params` and `signature` fields are required if your function accepts parameters; otherwise, these fields can be excluded.  The `returns` field is used only to format the output, and has no effect on the actual RPC command.

*`invoke` currently only works for Serpent contracts.*  I haven't (yet) included all the different datatypes that Solidity supports in augur.js's encoder -- all parameters are type string, int256, or int256[].  If you need a more flexible ABI encoder, I recommend [pyepm](https://github.com/etherex/pyepm), specifically the `pyepm.api.abi_data` method.

Tests
-----

Unit tests included with augur.js are in the `test` directory:
```
$ npm install mocha it-each
$ node test/runtests.js
```
Note that your local Ethereum node must be running for the tests to run properly.
