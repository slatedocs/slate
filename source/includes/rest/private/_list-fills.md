# Fills

## List Fills

> Response

```json
[
    { 
        "taker_order_id": "bf2b704c-010a-48ca-93fb-d0193f24420a",
        "maker_order_id": "31bf3a89-2a0a-40b0-9327-ec0a5cc3ce3c",
        "product": "ETH-BTC",
        "size": "0.77942322",
        "price": "0.05132",
        "side": "buy",
        "fee_maker": "0.00002000",
        "fee_taker": "0.00116913",
        "is_taker": true,
        "timestamp": "1511482279491.739"
    },
    {
        "taker_order_id": "c6023aca-333a-44d9-98fe-279e279f3a86",
        "maker_order_id": "7f66a16c-0b47-4bd6-8add-6b2c33366082",
        "product": "ETH-BTC",
        "size": "0.97422208",
        "price": "0.051323",
        "side": "buy",
        "fee_maker": "0.00002500",
        "fee_taker": "0.00146133",
        "is_taker": true,
        "is_self_trade": true,
        "timestamp": "1511482127568.782"
    }
]
```

List your recent fills, ordered by fill time.

### HTTP Request

**`GET /fills`**

### Query Parameters

Name | Default | Description
---------- | ---- | -------
product | *all* | Limit fills returned to this product.
limit | 100 | Number of orders to return. Max is 100.
timestamp | *N/A* | Return fills that occurred before this time.

E.g. `/fills?product=LTC-BTC&limit=50&timestamp=1511481127561`.

### Keeping track of your fills

We recommend listening to streaming WebSocket match events to maintain an up-to-date view of your fills. It's faster and more accurate than polling this endpoint.

Polling this endpoint is highly discouraged.


### Response

An array of your recent fills.

`is_self_trade` is set to true if your fill results from a self-trade.

`is_taker` is set to **true** when your fill results in taking liquidity from the book. This field is set to true for self-trades.
