# Fills

> Response

```json
[
    { 
        "order_id_taker": "bf2b704c-010a-48ca-93fb-d0193f24420a",
        "order_id_maker": "31bf3a89-2a0a-40b0-9327-ec0a5cc3ce3c",
        "product": "ETH-BTC",
        "size": "0.77942322",
        "price": "0.05132",
        "side": "buy",
        "fee": "0.000039000",
        "timestamp": "1511482279491.739"
    },
    {
        "order_id_taker": "c6023aca-333a-44d9-98fe-279e279f3a86",
        "order_id_maker": "7f66a16c-0b47-4bd6-8add-6b2c33366082",
        "product": "ETH-BTC",
        "size": "0.97422208",
        "price": "0.051323",
        "side": "buy",
        "fee": "0.00146133",
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
product | *all* | Limit fills returned to this product
limit | 100 | Number of fills to return (max is 100)
timestamp | *N/A* | Return fills that occurred before this time

E.g. `/fills?product=LTC-BTC&limit=50&timestamp=1511481127561`.

### Keeping track of your fills

We recommend listening to streaming WebSocket match events to maintain an up-to-date view of your fills. It's faster and more accurate than polling this endpoint.

Polling this endpoint is highly discouraged.


### Response

An array of your recent fills.
