## Queue an order

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
https://api.dirtylemon.com/v1/orders/{ORDER_ID}/queue
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.orders.queue({ORDER_ID})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "id": "e43b7307-ae29-4359-9ac3-2ea07998ceea",
  "customer_id": "904c2b4b-4a81-4d43-94cc-7d04e16cfb6b",
  "reference": "b3e554",
  "status": "queued",
  "currency": "usd",
  "tax": 571,
  "shipping_fee": 0,
  "subtotal": 6500,
  "total": 7071,
  "preordered": false,
  "coupon_id": "50%OFF",
  "shipping": {
    "name": "Philippe Dionne",
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
      "id": "ebccf38c-ece3-4587-b88d-66fac4c59953",
      "description": "1 six-pack of [skin+hair]",
      "amount": 6500,
      "quantity": 1,
      "sku": {
        "id": "868137000115",
        "currency": "usd",
        "price": 6500
      },
      "created_at": "2017-05-17T21:55:27.805Z",
      "updated_at": "2017-05-17T21:55:27.805Z"
    }
  ],
  "shipments": [
    {
      "id": "d404a8ca-1f8a-425d-b7ed-ce496c27ece2",
      "label": "[skin+hair]",
      "carrier": null,
      "tracking_number": null,
      "tracking_url": null,
      "tracking_status": null,
      "tracking_status_at": null,
      "eta": null,
      "created_at": "2017-05-17T21:55:59.554Z",
      "updated_at": "2017-05-17T21:55:59.554Z"
    }
  ],
  "created_at": "2017-05-17T21:55:27.676Z",
  "updated_at": "2017-05-17T21:55:59.630Z"
}
```

This endpoint queues an order:

  - Marks the order as __queued__

Either a `created` or `paid` order can be queued.


### HTTP Request

`POST https://api.dirtylemon.com/v1/orders/:order_id/queue`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| order_id | yes |  |

### Returns

An order object.
