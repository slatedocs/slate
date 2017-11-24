## Cancel an Order

> **Cancel an order.**

> Request

```json
{
  "id": "9d335cce-d581-45f6-8efc-bdab3d61c6e2",
  "product": "ETH-BTC"
}
```

> Response

```json
{
  "id": "9d335cce-d581-45f6-8efc-bdab3d61c6e2"
}
```

### HTTP Request

**`POST /cancel-order`**

### Parameters

Name | Description
---------- | -------
id | The ID of the order to cancel
product | The product the order is open for

Providing `product` is optional, but it's recommended because it greatly speeds up the cancel operation by skipping the id-to-product lookup.

### Response

A `200` status with the `id` of the cancelled order.

If an order could not be cancelled (if it has been already filled, does not exist, etc.), an error is returned.