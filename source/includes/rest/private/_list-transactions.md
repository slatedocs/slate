# Transactions

> Response

```json
[
    {
        "id": "5a1763b061c5ebb76371872d",
        "asset": "BTC",
        "amount": "0.00002000",
        "type": "fee",
        "timestamp": "1511482279491.739"
    },
    {
        "id": "5a1763b061c5ebb76371872e",
        "asset": "BTC",
        "amount": "0.04000000",
        "type": "trade",
        "timestamp": "1511482279491.739"
    },
    {
        "id": "5a136c8e61c5ebb76369bb36",
        "asset": "BTC",
        "amount": "1.00000000",
        "txid": "88129031ad5650faa1e1f0e42829e1dcb7f75d069b9d44b8ade27a2d3ab868bd",
        "type": "deposit",
        "timestamp": "1511222409359.000"
    }
]
```

List your transactions.

A transaction is an entry in your account ledger that affects your account balance. It can be an external transfer, such as a deposit or withdrawal, or an internal transfer, such as a trade or a fee.

### HTTP Request

**`GET /transactions/:asset`**

### Parameters

Name | Description
--------- | -------
asset | Asset for which to return transactions

`asset` is required. E.g. `BTC`, `LTC`, `ETH`, etc.

### Query Parameters

Name | Default | Description
---------- | ---- | -------
type | all | Can be `all`, `deposit`, `withdraw`, `trade`, or `fee`
limit | 100 | Number of transactions to return (max is 100)
timestamp | *N/A* | Return transactions that occurred before this time

E.g. `/transactions/BTC?type=deposit&limit=50&timestamp=1511481127561`.

### Order settlement

There is a small window between an order being **executed** by the matching engine and **settled** by the post-trade system. `trade` and `fee` transactions appear once the order is settled.

### Response

An array of transactions on your account.