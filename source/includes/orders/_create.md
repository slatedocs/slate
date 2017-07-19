## Create an order

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "shipping": {
    "phone_number": "+14185800893"
  },
  "line_items": [
    {
      "quantity": 1,
      "sku": "868137000115"
    }
  ],
  "coupon": "50%OFF"
}' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}/orders
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.orders.create({CUSTOMER_ID}, {
  shipping: {
    phone_number: "+14185800893"
  },
  line_items: [
    {
      quantity: 1,
      sku: '868137000115'
    }
  ],
  coupon: '50%OFF'
})
```

> Example response

```http
HTTP/1.1 201 CREATED
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
  "shipments": [],
  "created_at": "2017-05-17T21:52:32.867Z",
  "updated_at": "2017-05-17T21:52:32.867Z"
}
```

This endpoint creates an order:

  - Marks the order as __created__
  - Sets the `shipping` object from the customer's shipping address if present

### HTTP Request

`POST https://api.dirtylemon.com/v1/customers/:customer_id/orders`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Body params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| shipping  | no | [Shipping](#shipping-object) object |
| line_items | yes | List of at least one `Line item` objects. |
| coupon | no | String |

### Shipping object

| Attribute | Type | Required |
| --------- | -------- | ------------ |
| name         | string |  |
| company      | string |  |
| phone_number | string |  |
| email        | string |  |
| street1      | string |  |
| street2      | string |  |
| city         | string |  |
| state        | string |  |
| country      | string |  |
| zip          | string |  |

### Line item object

| Attribute | Type | Required |
| --------- | -------- | ------------ |
| quantity | Numeric | yes |
| sku | String | yes |

### Returns

An order object.
