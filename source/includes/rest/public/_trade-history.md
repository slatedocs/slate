# Trade History

> Response

```json
[
	{
		"product": "ETH-BTC",
		"order_id_taker": "bf2b704c-010a-48ca-93fb-d0193f24420a",
		"order_id_maker": "31bf3a89-2a0a-40b0-9327-ec0a5cc3ce3c",
		"size": "0.77942322",
		"price": "0.05132",
		"side": "buy",
		"timestamp": "1511482279492.417"
	},
	{
		"product": "ETH-BTC",
		"order_id_taker": "c6023aca-333a-44d9-98fe-279e279f3a86",
		"order_id_maker": "7f66a16c-0b47-4bd6-8add-6b2c33366082",
		"size": "0.97422208",
		"price": "0.051323",
		"side": "buy",
		"timestamp": "1511482127569.335"
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

Polling this endpoint is discouraged in favor of subscribing to WebSocket events.

### Response

An array of the latest trades.

`side` indicates the taker order side. A `buy` indicates an up-tick and a `sell` indicates a down-tick.
