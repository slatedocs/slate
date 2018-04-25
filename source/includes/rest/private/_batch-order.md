## Batch Orders

> **Place two limit orders followed by a cancel order.**

> Request

```json
{
  "product": "ETH-BTC",
  "orders": [{
    "side": "buy",
    "size": "15",
    "price": "0.03664"
  },
  {
    "side": "sell",
    "size": "12",
    "price": "0.054663",
    "condition": "PO"
  },
  {
    "id": "6c26914e-40f4-11e8-842f-0ed5f89f718b",
    "cancel": true
  }]
}
```

> Response

```json
[{
  "id": "3e89d474-0569-4ea9-9f5e-6f81c1984d2f",
  "type": "limit",
  "side": "buy",
  "size": "15.00000000",
  "price": "0.03664",
  "filled": "0.00000000",
  "timestamp": "1511487005839.417"
},
{
  "id": "9d97aec3-5e86-4eac-a1b4-8404423837b2",
  "type": "limit",
  "side": "sell",
  "size": "12.00000000",
  "price": "0.054663",
  "condition": "PO",
  "filled": "0.00000000",
  "timestamp": "1511487005839.427"
},
{
  "id": "6c26914e-40f4-11e8-842f-0ed5f89f718b"
}]
```

### HTTP Request

**`POST /batch-order`**

### Parameters

Name | Description
---------- | -------
product | A valid product
orders | An array of up to 10 new order or cancel order requests

Orders will be executed by the matching engine in the order they are submitted.

For cancellation requests, `cancel: true` must be set.

Your account must have sufficient balance to honor all the new orders requests you place in your batch order.

### Response

An array of order responses.
