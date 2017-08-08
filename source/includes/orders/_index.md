## List all orders

> Example request

```shell
curl -X GET \
-H 'Authorization: Bearer <TOKEN>' \
https://api.dirtylemon.com/v1/customers/:customer_id/orders
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.orders.list({CUSTOMER_ID})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
[
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
      "name": "Felipe Dionne",
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
]
```

This endpoint lists all orders for a given customer. Objects are ordered by `created_at` descending.

### HTTP Request

`GET https://api.dirtylemon.com/v1/customers/:customer_id/orders`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Query params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| limit | no | Default to 100 |
| offset | no | Default to 0 |


### Returns

A collection of orders.
