# Trade History

## Get Trade History

> Response

```json
[
	{
		"product": "ETH-BTC",
		"taker_order_id": "bf2b704c-010a-48ca-93fb-d0193f24420a",
		"maker_order_id": "31bf3a89-2a0a-40b0-9327-ec0a5cc3ce3c",
		"size": "0.77942322",
		"price": "0.05132",
		"side": "buy",
		"timestamp": "1511482279492.417"
	},
	{
		"product":"ETH-BTC",
		"taker_order_id":"c6023aca-333a-44d9-98fe-279e279f3a86",
		"maker_order_id":"7f66a16c-0b47-4bd6-8add-6b2c33366082",
		"size":"0.97422208",
		"price":0.051323,
		"side":"buy",
		"timestamp":"1511482127569.335"
	}
]
```

Get the latest trades for a product.

### HTTP Request

**`GET /trades/:product`**

### Parameters

Name | Description
---------- | -------
product | A valid product

### Query Parameters

Name | Default | Description
---------- | ---- | -------
limit | 100 | Number of orders, per side, to return (max is 100)
timestamp | *N/A* | Return trades that occurred before this time

E.g. `/trades/ETH-BTC?limit=50&timestamp=1511481127561`.

This endpoint will return the latest 5,000 to 10,000 trades per product. If you need older trade data, you can use the `/candles` endpoint.

Polling this endpoint is discouraged in favor of subscribing to WebSocket events.

### Response

An array of the latest trades.

`side` indicates the taker order side. A `buy` indicates an up-tick and a `sell` indicates a down-tick.
