Events API
==========
```javascript
/**
 * Listen for events emitted by the augur contracts.
 */

// Start listening for events
augur.filters.listen({
  block: function (blockHash) { /* ... */ }),
  collectedFees: function (event) { /* ... */ }),
  payout: function (event) { /* ... */ }),
  penalizationCaughtUp: function (event) { /* ... */ }),
  penalize: function (event) { /* ... */ }),
  registration: function (event) { /* ... */ }),
  submittedReport: function (event) { /* ... */ }),
  submittedReportHash: function (event) { /* ... */ }),
  slashedRep: function (event) { /* ... */ }),
  log_fill_tx: function (event) { /* ... */ }),
  log_short_fill_tx: function (event) { /* ... */ }),
  log_add_tx: function (event) { /* ... */ }),
  log_cancel: function (event) { /* ... */ }),
  marketCreated: function (event) { /* ... */ }),
  tradingFeeUpdated: function (event) { /* ... */ }),
  deposit: function (event) { /* ... */ }),
  withdraw: function (event) { /* ... */ }),
  sentCash: function (event) { /* ... */ }),
  Transfer: function (event) { /* ... */ }),
  Approval: function (event) { /* ... */ }),
  closedMarket: function (event) { /* ... */ })
}, function (listeners) {
  console.log("Listeners ready:", listeners);
});

// Stop filtering
augur.filters.ignore();

// Stop filtering and delete (uninstall) filters
augur.filters.ignore(true);
```
```javascript
/**
 * Search for historical events.
 */

var myAccountAddress = "0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b";

// Look up all markets created by myAccountAddress
var searchParams = {sender: myAccountAddress};
augur.getLogs("marketCreated", searchParams, function (err, logs) { /* ... */ });

// Look up all markets created by myAccountAddress after block number 123 with the topic "elections"
var searchParams = {sender: myAccountAddress, topic: augur.formatTag("elections"), fromBlock: 123};
augur.getLogs("marketCreated", searchParams, function (err, logs) {
  // example output:
  logs = [
    {
      sender: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
      marketID: '0x4a0395ed58ce5a4e180115703d0c89d39811e7918b3a8b8506f9d6f10bec7c06',
      topic: '0x656c656374696f6e730000000000000000000000000000000000000000000000',
      branch: '0x00000000000000000000000000000000000000000000000000000000000f69b5',
      marketCreationFee: '0.01',
      eventBond: '4.5',
      timestamp: 1486805273,
      blockNumber: 171,
      transactionHash: '0x6d866d30264c3a94af0d653ede512db57a17db6af097b291523863902915fe78',
      removed: false
    },
    {
      sender: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
      marketID: '0xab7b688c7445b25cbe014ad0d33568f3c85bccb738d504ad4d08ef5c362e24e6',
      topic: '0x656c656374696f6e730000000000000000000000000000000000000000000000',
      branch: '0x00000000000000000000000000000000000000000000000000000000000f69b5',
      marketCreationFee: '0.010740526194',
      eventBond: '4.5',
      timestamp: 1486805289,
      blockNumber: 180,
      transactionHash: '0x9669f32202b1f2d370d2414f63c03c253d93cf177b6c771e2521e35db08f2d69',
      removed: false
    },
    {
      sender: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
      marketID: '0x1313780ce1a5dac675f4b6d3a83d7bfdafe36dd81ec8709e5d6710eb8931b2b9',
      topic: '0x656c656374696f6e730000000000000000000000000000000000000000000000',
      branch: '0x00000000000000000000000000000000000000000000000000000000000f69b5',
      marketCreationFee: '0.011211935648',
      eventBond: '4.5',
      timestamp: 1486805339,
      blockNumber: 198,
      transactionHash: '0x3601c930e8ef03ddd436c3902dc3d3e771c3093449781ef21cc61ba2c1f7b3be',
      removed: false
    }
  ];
});


// Look up all markets created between block numbers 123 and 190 with the topic "elections", and
// organize them by market creator
var searchParams = {topic: augur.formatTag("elections"), fromBlock: 123, toBlock: 190};
var auxiliaryParams = {index: "sender"};
augur.getLogs("marketCreated", searchParams, auxiliaryParams, function (err, logs) {
  // example output:
  logs = {
    '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b': [
      {
        sender: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
        marketID: '0x4a0395ed58ce5a4e180115703d0c89d39811e7918b3a8b8506f9d6f10bec7c06',
        topic: '0x656c656374696f6e730000000000000000000000000000000000000000000000',
        branch: '0x00000000000000000000000000000000000000000000000000000000000f69b5',
        marketCreationFee: '0.01',
        eventBond: '4.5',
        timestamp: 1486805273,
        blockNumber: 171,
        transactionHash: '0x6d866d30264c3a94af0d653ede512db57a17db6af097b291523863902915fe78',
        removed: false
      },
      {
        sender: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
        marketID: '0xab7b688c7445b25cbe014ad0d33568f3c85bccb738d504ad4d08ef5c362e24e6',
        topic: '0x656c656374696f6e730000000000000000000000000000000000000000000000',
        branch: '0x00000000000000000000000000000000000000000000000000000000000f69b5',
        marketCreationFee: '0.010740526194',
        eventBond: '4.5',
        timestamp: 1486805289,
        blockNumber: 180,
        transactionHash: '0x9669f32202b1f2d370d2414f63c03c253d93cf177b6c771e2521e35db08f2d69',
        removed: false
      }
    ],
    '0x405be667f1a6b2d5149a61057040cade5aada366': [
      {
        sender: '0x405be667f1a6b2d5149a61057040cade5aada366',
        marketID: '0xd3e5a45914d5ba9018054d579b1b8c5a97456dff60d896938893842bf9675e76',
        topic: '0x656c656374696f6e730000000000000000000000000000000000000000000000',
        branch: '0x00000000000000000000000000000000000000000000000000000000000f69b5',
        marketCreationFee: '0.010818318899',
        eventBond: '4.5',
        timestamp: 1486805416,
        blockNumber: 161,
        transactionHash: '0x5a149247a3e382cf9649b9a0fb397c84c764ee9b36ba05a0ce29f2b144c8cab2',
        removed: false
      }
    ]
  };
});

// Look up all markets created before block number 190 with the topic "elections", organize them
// by market creator, and add an extra field {"maxBlockNumber": 190} to each event log
var searchParams = {topic: augur.formatTag("elections"), toBlock: 190};
var auxiliaryParams = {index: "sender", extraField: {name: "maxBlockNumber", value: 190}};
augur.getLogs("marketCreated", searchParams, auxiliaryParams, function (err, logs) {
  // example output:
  logs = {
    '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b': [
      {
        sender: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
        marketID: '0x4a0395ed58ce5a4e180115703d0c89d39811e7918b3a8b8506f9d6f10bec7c06',
        topic: '0x656c656374696f6e730000000000000000000000000000000000000000000000',
        branch: '0x00000000000000000000000000000000000000000000000000000000000f69b5',
        marketCreationFee: '0.01',
        eventBond: '4.5',
        timestamp: 1486805273,
        blockNumber: 171,
        transactionHash: '0x6d866d30264c3a94af0d653ede512db57a17db6af097b291523863902915fe78',
        removed: false,
        maxBlockNumber: 190
      },
      {
        sender: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
        marketID: '0xab7b688c7445b25cbe014ad0d33568f3c85bccb738d504ad4d08ef5c362e24e6',
        topic: '0x656c656374696f6e730000000000000000000000000000000000000000000000',
        branch: '0x00000000000000000000000000000000000000000000000000000000000f69b5',
        marketCreationFee: '0.010740526194',
        eventBond: '4.5',
        timestamp: 1486805289,
        blockNumber: 180,
        transactionHash: '0x9669f32202b1f2d370d2414f63c03c253d93cf177b6c771e2521e35db08f2d69',
        removed: false,
        maxBlockNumber: 190
      }
    ],
    '0x405be667f1a6b2d5149a61057040cade5aada366': [
      {
        sender: '0x405be667f1a6b2d5149a61057040cade5aada366',
        marketID: '0xd3e5a45914d5ba9018054d579b1b8c5a97456dff60d896938893842bf9675e76',
        topic: '0x656c656374696f6e730000000000000000000000000000000000000000000000',
        branch: '0x00000000000000000000000000000000000000000000000000000000000f69b5',
        marketCreationFee: '0.010818318899',
        eventBond: '4.5',
        timestamp: 1486805416,
        blockNumber: 161,
        transactionHash: '0x5a149247a3e382cf9649b9a0fb397c84c764ee9b36ba05a0ce29f2b144c8cab2',
        removed: false,
        maxBlockNumber: 190
      }
    ]
  };
});

// Look up all markets created before block number 190 with the topic "elections", then look up all
// markets created after block number 300, merge the results of these two searches together, organize
// them by market creator, and modify the results of the first search by adding an extra field
// {"firstSearch": true} to its results.
var searchParams = {topic: augur.formatTag("elections"), toBlock: 190};
var auxiliaryParams = {index: "sender", extraField: {name: "firstSearch", value: true}, mergedLogs: {}};
augur.getLogs("marketCreated", searchParams, auxiliaryParams, function (err, logs) {
  var searchParams = {fromBlock: 300};
  auxiliaryParams.extraField = null;
  augur.getLogs("marketCreated", searchParams, auxiliaryParams, function (err, logs) {
    // example output:
    logs = {
      '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b': [
        {
          sender: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
          marketID: '0x4a0395ed58ce5a4e180115703d0c89d39811e7918b3a8b8506f9d6f10bec7c06',
          topic: '0x656c656374696f6e730000000000000000000000000000000000000000000000',
          branch: '0x00000000000000000000000000000000000000000000000000000000000f69b5',
          marketCreationFee: '0.01',
          eventBond: '4.5',
          timestamp: 1486805273,
          blockNumber: 171,
          transactionHash: '0x6d866d30264c3a94af0d653ede512db57a17db6af097b291523863902915fe78',
          removed: false,
          firstSearch: true
        },
        {
          sender: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
          marketID: '0xab7b688c7445b25cbe014ad0d33568f3c85bccb738d504ad4d08ef5c362e24e6',
          topic: '0x656c656374696f6e730000000000000000000000000000000000000000000000',
          branch: '0x00000000000000000000000000000000000000000000000000000000000f69b5',
          marketCreationFee: '0.010740526194',
          eventBond: '4.5',
          timestamp: 1486805289,
          blockNumber: 180,
          transactionHash: '0x9669f32202b1f2d370d2414f63c03c253d93cf177b6c771e2521e35db08f2d69',
          removed: false,
          firstSearch: true
        },
        {
          sender: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
          marketID: '0x6367db025f80e201cda0cc643b8152b548e9ef91bc277e90a9a9ffdfeb11c0e5',
          topic: '0x7265706f7274696e670000000000000000000000000000000000000000000000',
          branch: '0x00000000000000000000000000000000000000000000000000000000000f69b5',
          marketCreationFee: '0.01',
          eventBond: '4.5',
          timestamp: 1486805559,
          blockNumber: 302,
          transactionHash: '0xfc84f7548b4960b91f2721cd8bf77c4e1157f32fd849818f476ae36a3ab227de',
          removed: false
        },
        {
          sender: '0x05ae1d0ca6206c6168b42efcd1fbe0ed144e821b',
          marketID: '0x72b52b8a174c540d69166e2ac96a12eb1163b0f982ee044cdfcc0f5096b5929b',
          topic: '0x656c656374696f6e730000000000000000000000000000000000000000000000',
          branch: '0x00000000000000000000000000000000000000000000000000000000000f69b5',
          marketCreationFee: '0.01',
          eventBond: '4.5',
          timestamp: 1486805595,
          blockNumber: 319,
          transactionHash: '0xd21ff5b3e7fe5e918455b1ae3e1cf6c3d916b4c930d54645a0a425bc8aea52a2',
          removed: false
        }
      ],
      '0x405be667f1a6b2d5149a61057040cade5aada366': [
        {
          sender: '0x405be667f1a6b2d5149a61057040cade5aada366',
          marketID: '0xd3e5a45914d5ba9018054d579b1b8c5a97456dff60d896938893842bf9675e76',
          topic: '0x656c656374696f6e730000000000000000000000000000000000000000000000',
          branch: '0x00000000000000000000000000000000000000000000000000000000000f69b5',
          marketCreationFee: '0.010818318899',
          eventBond: '4.5',
          timestamp: 1486805416,
          blockNumber: 161,
          transactionHash: '0x5a149247a3e382cf9649b9a0fb397c84c764ee9b36ba05a0ce29f2b144c8cab2',
          removed: false,
          firstSearch: true
        }
      ]
    };
  });
});
// (Note: for efficiency, the mergedLogs field in auxiliaryParams is mutated by getLogs.  If this
// bothers you, feel free to use lodash's merge, ES6/7 spread, etc. to accomplish the same thing.
// Also, the tears of functional programmers are delicious.)
```
There are a variety of "events" emitted by the augur contracts.  Each event is triggered by a user doing something on augur: submitting a report, closing a market, filling an open order, etc.

<aside class="notice">The events API described here should not be confused with the (entirely unrelated) concept of "events" that Reporters Report on.  We think that the concepts are sufficiently different that the context should always make it clear which kind of "event" is being referred to.  In the event that you encounter an ambiguity, please drop us a note at <a href="mailto:hugs@augur.net">hugs@augur.net</a>, or just violently rage at us on <a href="https://www.reddit.com/r/augur">Reddit</a> or <a href="https://twitter.com/AugurProject">Twitter</a>!</aside>

The augur.js events API includes event listeners, which notify you of events happening now, and a search function for historical events ("logs"):

- *Event listeners* ("filters") can be turned on using the `augur.filters.listen` function.  `augur.filters.listen` accepts two arguments: an object with event labels as keys (see table below) and callbacks for these events as values.  Each callback has a single argument, an object containing the "Data" fields shown in the table below.
- *Event search* can be accomplished with the `augur.getLogs` function.  `augur.getLogs` can search for any combination of an event's *indexed* data fields (enumerated in the table below), and also accepts optional upper- and lower-bound block numbers to further narrow down the search.

The following table shows the events that can be passed to `augur.filters.listen`.  All of these events are optional; if you don't need some of these events for your application, don't include the event in your call to `augur.filters.listen`.  In this table, "Contract" refers to the Ethereum contract on which the event is defined ([source code](https://github.com/AugurProject/augur-core) / [contract addresses](https://github.com/AugurProject/augur-contracts)), "Data (indexed)" refers to fields included in the event log that are searchable using the `augur.getLogs` function.

Label                | Contract            | Event description                                                         | Data (indexed)           | Data (non-indexed)
-------------------- | ------------------- | ------------------------------------------------------------------------- | ------------------------ | ------------------
collectedFees        | collectFees         | Reporter has collected their payment for the previous Reporting cycle     | branch, sender           | cashFeesCollected, newCashBalance, repGain, newRepBalance, totalReportingRep, notReportingBond, period, timestamp
payout               | payout              | Outstanding shares of winning outcomes in a closed market cashed out      | sender, market           | cashPayout, cashBalance, shares, timestamp
penalizationCaughtUp | penalizationCatchup | Penalty paid by Reporter who has missed one or more full Reporting cycles | branch, sender           | penalizedFrom, penalizedUpTo, repLost, newRepBalance, timestamp
penalize             | consensus           | Report compared with consensus outcome, and reporter (possibly) penalized | sender, branch, event    | outcome, oldrep, repchange, p, reportValue, penalizedUpTo, timestamp
registration         | register            | Timestamp for "new" account saved                                         | sender                   | timestamp
submittedReport      | makeReports         | Reporter has revealed a report                                            | sender, branch, event    | salt, report, ethics, timestamp
submittedReportHash  | makeReports         | Reporter has committed to a report                                        | sender, branch, event    | reportHash, encryptedReport, encryptedSalt, ethics, timestamp
slashedRep           | slashRep            | Cheating reporter punished via the "snitch" mechanism                     | branch, sender, reporter | event, repSlashed, slasherBalance, timestamp
log_fill_tx          | trade               | Trade filled                                                              | market, sender, owner    | type, price, amount, tradeid, outcome, timestamp, takerFee, makerFee, onChainPrice, tradeHash, tradeGroupID
log_short_fill_tx    | trade               | Short sell filled (deprecated)                                            | market, sender, owner    | price, amount, tradeid, outcome, timestamp, takerFee, makerFee, numOutcomes, onChainPrice, tradeHash, tradeGroupID
log_add_tx           | buy&sellShares      | New order added to orderbook                                              | market, sender           | type, price, amount, outcome, tradeid, isShortAsk, timestamp, tradeGroupID
log_cancel           | buy&sellShares      | Order removed from orderbook                                              | market, sender           | price, amount, tradeid, outcome, type, cashRefund, timestamp
marketCreated        | createMarket        | New market created                                                        | sender, marketID, topic  | branch, marketCreationFee, eventBond, timestamp
tradingFeeUpdated    | createMarket        | Market trading fee decreased                                              | sender, branch, marketID | tradingFee, timestamp
deposit              | cash                | Convert Ether to Cash at a 1:1 rate                                       | sender                   | value, timestamp
withdraw             | cash                | Convert Cash to Ether at a 1:1 rate                                       | sender, to               | value, timestamp
sentCash             | cash                | Cash transfer                                                             | _from, _to               | _value, timestamp
Transfer             | sendReputation      | Reputation transfer                                                       | _from, _to               | _value, timestamp
Approval             | sendReputation      | Approval to spend Reputation from a different account                     | _owner, _spender         | value, timestamp
closedMarket         | closeMarket         | Market closed: consensus is complete and event outcome has been set       | market, branch, sender   |

In addition to these on-contract events, `augur.filters.listen` also accepts a callback for the `block` listener, which fires whenever a new block arrives.  The argument passed to its callback is the hash (as a hex string) of the new block.

<aside class="success">Events are retrieved either via push notification (if connected via websocket) or by polling the Ethereum node (if using HTTP RPC).  If polling, augur.js will check for new events every 6 seconds.</aside>
