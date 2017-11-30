<h1 id='ticker-rest'>Ticker</h1>

> Response

```json
{
    "product": "ETH-BTC",
    "price": "0.05132",
    "bid": "0.04",
    "ask": "0.05132",
    "bid_size": "5.00000000",
    "ask_size": "9.22057678",
    "timestamp": "1511482279492.542"
}
```

### HTTP Request

**`GET /ticker/:product`**

Note: the response from this endpoint is updated when the last price of the requested product changes.

### Parameters

Name | Description
---------- | -------
product | A valid product

Polling this endpoint is discouraged in favor of subscribing to WebSocket events.