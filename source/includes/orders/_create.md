## Create an order

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
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
  "id": "44024b51-742a-4598-8311-d9a629631987",
  "customer_id": "294e03d6-df4f-4ee1-94be-e334c420381a",
  "reference": "d7590e",
  "status": "created",
  "currency": "usd",
  "tax": 0,
  "shipping_fee": 0,
  "total": 6500,
  "preordered": false,
  "coupon_id": "50%OFF",
  "shipping": {
    "company": null,
    "street1": "1-60 CRÉMAZIE OUEST",
    "street2": "",
    "street3": null,
    "city": "QUEBEC",
    "state": "QC",
    "country": "CA",
    "zip": "G1R 1X3"
  },
  "line_items": [
    {
      "id": "a1b054ee-90cf-4a78-abee-1ce23ef9f06d",
      "description": "1 six-pack of [skin+hair]",
      "amount": 6500,
      "quantity": 1,
      "sku": {
        "id": "868137000115",
        "currency": "usd",
        "price": 6500
      },
      "created_at": "2017-05-02T12:59:07.085Z",
      "updated_at": "2017-05-02T12:59:07.085Z"
    }
  ],
  "shipments": [],
  "created_at": "2017-05-02T12:59:07.060Z",
  "updated_at": "2017-05-02T12:59:07.060Z"
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
| line_items | yes | List of at least one `Line item` objects. |
| coupon | no | String |

### Line item object

| Attribute | Type | Required |
| --------- | -------- | ------------ |
| quantity | Numeric | yes |
| sku | String | yes |

### Returns

An order object.
