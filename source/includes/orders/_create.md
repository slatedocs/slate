## Create an order

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "shipping": {
    "name": "Felipe Dionne"
  },
  "line_items": [
    {
      "quantity": 1,
      "sku": "868137000122"
    }
  ],
  "coupon": "50OFF"
}' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}/orders
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.orders.create({CUSTOMER_ID}, {
  shipping: {
    name: "Felipe Dionne"
  },
  line_items: [
    {
      quantity: 1,
      sku: '868137000122'
    }
  ],
  coupon: '50OFF'
})
```

> Example response

```http
HTTP/1.1 201 CREATED
```

```json
{
  "id": "0e4ce262-3e40-4c3a-9763-baa284c0873c",
  "customer_id": "6547bfaf-9cd9-43bf-abf5-6e3fd22df2a2",
  "reference": "19d5b0",
  "status": "created",
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
    "street2": "",
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
  "shipments": [],
  "created_at": "2017-08-08T14:23:04.204Z",
  "updated_at": "2017-08-08T14:23:05.661Z"
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
