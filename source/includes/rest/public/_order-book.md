# Order Book

> Response

```json
{
	"bids":[
		["0.04", "5.00000000", 1],
		["0.039465", "4.24022501", 1]
	],
	"asks":[
		["0.05132", "9.22057678", 1],
		["0.051323", "3.52460275", 1]
	]
}
```

Get a list of open bid and ask levels for a product.

### HTTP Request

**`GET /book/:product`**

### Parameters

Name | Description
---------- | -------
product | A valid product

### Query Parameters

Name | Default | Description
---------- | ---- | -------
limit | 100 | Number of orders, per side, to return (max is 100)

E.g. `/book/ETH-BTC?limit=50`.

Polling this endpoint is discouraged in favor of subscribing to WebSocket events.

### Response

The current bids and asks for a product.

Each item in the `bids` or `asks` array returned is an array consisting of the price, size, and number of orders open at this level.
