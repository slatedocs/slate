## List Orders

> Response

```json
[
    {
        "id": "b20265e7-8d28-476a-8758-c6113ad98c0b",
        "product": "ETH-BTC",
        "size": "2.34977543",
        "funds": "0.00000000",
        "filled": "0.00000000",
        "price": "0.053435",
        "side": "sell",
        "type": "limit",
        "timestamp": "1511252206104.628"
    },
    {
        "id": "b361e636-46cd-4a34-a532-d454c9e7b4b6",
        "product": "ETH-BTC",
        "size": "4.52120565",
        "funds": "0.00000000",
        "filled": "0.00000000",
        "price": "0.053147",
        "side": "sell",
        "type": "limit",
        "timestamp": "1511252184729.679"
    }
]
```

List your open orders. Both limit and stop orders are returned, ordered by submission time.

### HTTP Request

**`GET /orders`**

### Query Parameters

You can optionally pass a `limit` query parameter to limit the number of orders returned. By default, 100 items are returned.

Name | Default | Description
---------- | ---- | -------
limit | 100 | Number of orders to return. Max is 100.

E.g. `/orders?limit=50`.

### Keeping track of your order states

We recommend listening to streaming WebSocket order events to maintain an up-to-date view of your open orders. It's faster and in many cases more accurate than polling this endpoint, because an order's state may change between the time you make an HTTP request and receive a response.

Polling this endpoint is highly discouraged.


### Response

An array of your open orders.