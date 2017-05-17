## Pay an order

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
https://api.dirtylemon.com/v1/orders/{ORDER_ID}/pay
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.orders.pay({ORDER_ID})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "id": "c52c27bb-7da5-44b1-9469-f53891c1ff5d",
  "customer_id": "904c2b4b-4a81-4d43-94cc-7d04e16cfb6b",
  "reference": "edcb11",
  "status": "paid",
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
      "id": "4f602b47-d2d0-4171-a5c4-6f026f68c6f4",
      "description": "1 six-pack of [skin+hair]",
      "amount": 6500,
      "quantity": 1,
      "sku": {
        "id": "868137000115",
        "currency": "usd",
        "price": 6500
      },
      "created_at": "2017-05-17T21:57:01.665Z",
      "updated_at": "2017-05-17T21:57:01.665Z"
    }
  ],
  "shipments": [],
  "created_at": "2017-05-17T21:57:01.492Z",
  "updated_at": "2017-05-17T21:57:25.227Z"
}
```

<aside class="notice">
  Calls on this action will fail if the customer isn't confirmed.
</aside>

This endpoint pays an order:

  - Sets the `shipping` object from the customer's shipping address unless already set on creation
  - Charges the customer's [credit card](#cards)
  - Sends the [customer](#customers) a confirmation email

For this action to be successful, the following conditions must be met:

  - Customer must have a valid email
  - Customer must have a first name and last name
  - Customer must have a valid shipping address

Only a `created` order can be paid.


### HTTP Request

`POST https://api.dirtylemon.com/v1/orders/:order_id/pay`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| order_id | yes |  |

### Returns

An order object.
