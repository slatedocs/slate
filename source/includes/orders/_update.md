## Update an order

> Example request

```shell
curl -X PATCH \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "order": {
    "shipping": {
      "name": "Elon Musk"
    }
  }
}' \
https://api.dirtylemon.com/v1/orders/{ORDER_ID}
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.orders.update({ORDER_ID}, {
  shipping: {
    name: 'Elon Musk'
  }
})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "id": "19aaff62-7539-4422-b5a3-85cd06db017f",
  "customer_id": "904c2b4b-4a81-4d43-94cc-7d04e16cfb6b",
  "reference": "16ace0",
  "status": "created",
  "currency": "usd",
  "tax": 571,
  "shipping_fee": 0,
  "subtotal": 6500,
  "total": 7071,
  "preordered": false,
  "coupon_id": "50%OFF",
  "shipping": {
    "name": "Elon Musk",
    "company": null,
    "phone_number": "+14185800893",
    "street1": "95 GRAND ST",
    "street2": "",
    "street3": null,
    "city": "NEW YORK",
    "state": "NY",
    "country": "US",
    "zip": "10013-5902"
  },
  "line_items": [
    {
      "id": "fc0b34eb-4ce2-4b08-b5a4-09ec294125f6",
      "description": "1 six-pack of [skin+hair]",
      "amount": 6500,
      "quantity": 1,
      "sku": {
        "id": "868137000115",
        "currency": "usd",
        "price": 6500
      },
      "created_at": "2017-05-17T21:52:32.901Z",
      "updated_at": "2017-05-17T21:52:32.901Z"
    }
  ],
  "shipments": [],
  "created_at": "2017-05-17T21:52:32.867Z",
  "updated_at": "2017-05-17T21:52:32.867Z"
}
```

This endpoint updates an order.

### HTTP Request

`PATCH https://api.dirtylemon.com/v1/orders/<ID>`

### Arguments

| Parameter | Required | Description |
| --------- | -------- | ------------|
| shipping | yes | [Shipping](#shipping) object |

### Returns

An order object.
