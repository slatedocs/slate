# Stats

> Response

```json
{
    "product": "ETH-BTC",
    "last_price": "0.04136",
    "price_day_ago": "0.05128",
    "volume": "8883.0512",
    "timestamp": "1511482279492.542"
}
```

### HTTP Request

**`GET /stats/:product`**

### Parameters

Name | Description
---------- | -------
product | A valid product

### Response

`timestamp` represents the time the stats for the requested product were last updated.