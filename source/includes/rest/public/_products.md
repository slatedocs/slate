# Products

## List Products

> Response

```json
[
    {
        "name": "ETH-BTC",
        "base_asset": "ETH",
        "counter_asset": "BTC",
        "minimum_value": "0.001",
        "precision_price": "6",
        "precision_base": "3",
        "precision_counter": "6"
    },
    {
        "name": "LTC-BTC",
        "base_asset": "LTC",
        "counter_asset": "BTC",
        "minimum_value": "0.001",
        "precision_price": "6",
        "precision_base": "3",
        "precision_counter": "6"
    }
]
```

List products available to trade.

### HTTP Request

**`GET /products`**

### Response

An array of products.

`minimum_value` represents the minimum amount, in counter asset, to place an order.

`precision_price` represents the maximum number of decimals tracked for this product's price. For example, a price precision of 6 means that a product's price is tracked up to the nearest 0.000001. Prices submitted with more decimals will be rounded to the nearest price precision.