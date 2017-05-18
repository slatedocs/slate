## Confirm an order

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
https://api.dirtylemon.com/v1/orders/{ORDER_ID}/confirm
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.orders.confirm({ORDER_ID})
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
      "id": "55ca8aa1-2f87-4dba-984b-592e39addc77",
      "label": "[skin+hair]",
      "carrier": null,
      "tracking_number": null,
      "tracking_url": null,
      "tracking_status": null,
      "tracking_status_at": null,
      "eta": null,
      "created_at": "2017-05-17T21:54:19.943Z",
      "updated_at": "2017-05-17T21:54:19.943Z"
    }
  ],
  "created_at": "2017-05-17T21:52:32.867Z",
  "updated_at": "2017-05-17T21:54:19.981Z"
}
```

<aside class="notice">
  Calls on this action will fail if the customer isn't confirmed.
</aside>

This endpoint pays and queues an order:

  - Pays an order:
    - Sets the `shipping` object from the customer's shipping address unless already set on creation
    - Charges the customer's [credit card](#cards)
    - Sends the [customer](#customers) a confirmation email
  - Queues an order:
    - Creates [shipments](#shipments) for the order's line items
    - Marks the order as __queued__

For this action to be successful, the same conditions than for paying an order must be met:

  - Customer must be confirmed
  - Customer must have a valid email
  - Customer must have a first name and last name
  - Customer must have a valid shipping address

Only a `created` order can be confirmed.


### HTTP Request

`POST https://api.dirtylemon.com/v1/orders/:order_id/confirm`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| order_id | yes |  |

### Returns

An order object.
