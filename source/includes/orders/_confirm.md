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
      "carrier": null,
      "rate": null,
      "tracking_number": null,
      "tracking_url": null,
      "tracking_status": null,
      "tracking_status_at": null,
      "eta": null,
      "sku": {
        "id": "868137000122"
      },
      "created_at": "2017-08-08T14:25:20.559Z",
      "updated_at": "2017-08-08T14:25:20.559Z"
    }
  ],
  "created_at": "2017-08-08T14:23:04.204Z",
  "updated_at": "2017-08-08T14:25:20.591Z"
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
