Filters
=======
```javascript
// Start filtering
augur.filters.listen({
    block: function (blockHash) {
        console.log("new block:", blockHash);
    },
    contracts: function (augurTx) {
        console.log("augur transaction:", augurTx);
    },
    creation: function (newMarket) {
        console.log("new market created:", newMarket.marketId);
    },
    price: function (updatedPrice) {
        console.log("updated price:", updatedPrice);
    }
});

// Stop filtering
augur.filters.ignore();

// Stop filtering and uninstall filters
augur.filters.ignore(true);

/**
 * Example filter results
 */

// block
blockHash = "0x999553c632fa10f3eb2af9a2be9ab612726372721680e3f76441f75f7c879a2f"

// contracts (topics and data fields vary by contract and method)
augurTx = {
    address: "0xc1c4e2f32e4b84a60b8b7983b6356af4269aab79",
    topics: [
        "0x1a653a04916ffd3d6f74d5966492bda358e560be296ecf5307c2e2c2fdedd35a",
        "0x00000000000000000000000005ae1d0ca6206c6168b42efcd1fbe0ed144e821b",
        "0x3557ce85d2ac4bcd36be7f3a6e0f63cfa6b18d34908b810ed41e44aafb399b44",
        "0x0000000000000000000000000000000000000000000000000000000000000001"
    ],
    data: [
        "0x000000000000000000000000000000000000000000000001000000000000d330",
        "0xfffffffffffffffffffffffffffffffffffffffffffffffeffffffffffffffa3"
    ],
    blockNumber: "0x110d",
    logIndex: "0x0",
    blockHash: "0x0000000000000000000000000000000000000000000000000000000000000000",
    transactionHash: "0x8481c76a1f88a203191c1cd1942963ff9f1ea31b1db02f752771fef30133798e",
    transactionIndex: "0x0"
}

// creation
newMarket = {
    marketId: "-0xcaa8317a2d53b432c94180c591f09c30594e72cb6f747ef12be1bb5504c664bc",
    blockNumber: "4689"
}

// price
updatedPrice = {
    user: "0x00000000000000000000000005ae1d0ca6206c6168b42efcd1fbe0ed144e821b",
    marketId: "-0xcaa8317a2d53b432c94180c591f09c30594e72cb6f747ef12be1bb5504c664bc",
    outcome: "1",
    price: "1.00000000000000002255",
    cost: "-1.00000000000000008137",
    blockNumber: "4722"
}

```
augur.js binds the RPC commands associated with Ethereum's blockchain (transaction/block) filters, as well as whisper filters.  Messages "caught" by filters are retrieved by polling the Ethereum node; the filtering "heartbeat" checks for new messages every 5 seconds.  The three primary types of blockchain filters augur.js uses are:

Filter | Message contents
------ | ----------------
block | new blockhashes
contracts | transactions involving any Augur contract
creation | new market's ID and creation blocknumber
price | market price updates

Passing callback functions for `block`, `contracts`, `creation` and/or `price` to the `augur.filters.listen` method will start polling the block, contracts, creation and price filters, respectively.

<aside class="notice">You can adjust the polling interval by changing the value of <code>augur.filters.PULSE</code>.  By default it is set to <code>5000</code> (5 seconds).</aside>
