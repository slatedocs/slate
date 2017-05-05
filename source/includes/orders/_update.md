## Update an order

> Example request

```js
const dirtylemon = require('dirtylemon');

dirtylemon.orders.update({ORDER_ID}, {
  line_items: [
    {
      quantity: 1
      product: 'energy'
    }
  ]
})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
TODO
```

This endpoint updates an order.

### HTTP Request

`PATCH https://api.dirtylemon.com/v1/orders/<ID>`

### Arguments

| Parameter | Required | Description |
| --------- | -------- | ------------|
| line_items | yes | List of at least one `Line item` objects. |
| coupon | no | String |

### Returns

An order object.
