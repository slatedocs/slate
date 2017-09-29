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
    name: 'Philippe Musk'
  }
})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "id": "0e4ce262-3e40-4c3a-9763-baa284c0873c",
  "customer_id": "6547bfaf-9cd9-43bf-abf5-6e3fd22df2a2",
  "reference": "19d5b0",
  "status": "queued",
  "currency": "usd",
  "tax": 288,
  "shipping_fee": 0,
  "total": 3538,
  "coupon_id": "50OFF",
  "shipping": {
    "name": "Philippe Dionne",
    "company": null,
    "phone_number": "+14185800893",
    "email": "philippe@dirtylemon.com",
    "street1": "128 LAFAYETTE ST",
    "street2": null,
    "city": "NEW YORK",
    "state": "NY",
    "country": "US",
    "zip": "10013-3174"
  },
  "line_items": [
    {
      "id": "d872ccd2-70f5-438a-9075-1386f85616c8",
      "description": "1 six-pack of [sleep]",
      "amount": 6500,
      "quantity": 1,
      "sku": {
        "id": "868137000122",
        "currency": "usd",
        "price": 6500
      },
      "created_at": "2017-08-08T14:23:04.319Z",
      "updated_at": "2017-08-08T14:23:04.319Z"
    }
  ],
  "shipments": [
    {
      "id": "a7681e95-68d2-450e-bf32-73562c4d74c6",
      "carrier": "UPS",
      "rate": "10.67",
      "tracking_number": "1Z034864P299368312",
      "tracking_url": "https://track.easypost.com/djE6dHJrXzg1MjQ1MTQ0YWEzNzQzMjBhNTc2NjgwMzdiMmIzMjVi",
      "tracking_status": "pre_transit",
      "tracking_status_at": "2017-08-08T14:26:44.000Z",
      "eta": "2017-08-08T14:26:44.000Z",
      "sku": {
        "id": "868137000122"
      },
      "created_at": "2017-08-08T14:25:20.559Z",
      "updated_at": "2017-08-08T14:26:47.249Z"
    }
  ],
  "created_at": "2017-08-08T14:23:04.204Z",
  "updated_at": "2017-08-08T14:25:20.591Z"
}
```

This endpoint updates an order.

### HTTP Request

`PATCH https://api.dirtylemon.com/v1/orders/<ID>`

### Arguments

| Parameter | Required | Description |
| --------- | -------- | ------------|
| shipping | yes | [Shipping](#shipping-object) object |

### Returns

An order object.
