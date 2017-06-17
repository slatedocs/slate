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
    "shipments": [
      {
        "id": "20a21109-0e00-403b-84cc-62e095c94bca",
        "label": "1 six-pack of [skin+hair]",
        "carrier": "UPS",
        "tracking_number": "9400136897846107013399",
        "tracking_url": "https://track.easypost.com/djE6dHJrX2Y0YTdkMGI1NmJlNDQ1MzdhMjMzN2M2ODlmMGM2OTdm",
        "tracking_status": "delivered",
        "tracking_status_at": "2017-05-03T22:38:23.432Z",
        "eta": "2017-05-03T12:00:00.000Z",
        "created_at": "2017-05-03T22:37:50.357Z",
        "updated_at": "2017-05-03T22:38:23.432Z"
      }
    ],
    "created_at": "2017-05-17T21:52:32.867Z",
    "updated_at": "2017-05-17T21:52:32.867Z"
  }
]
```

This endpoint lists all orders for a given customer. Objects are ordered by `created_at` descending.

### HTTP Request

`GET https://api.dirtylemon.com/v1/customers/:customer_id/orders?limit=100`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Query params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| limit | no | Default to 100 |


### Returns

A collection of orders.
