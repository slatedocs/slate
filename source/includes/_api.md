API
===

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
