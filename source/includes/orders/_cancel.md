## Cancel an order

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
https://api.dirtylemon.com/v1/orders/{ORDER_ID}/cancel
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.orders.cancel({ORDER_ID})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "id": "44024b51-742a-4598-8311-d9a629631987",
  "customer_id": "294e03d6-df4f-4ee1-94be-e334c420381a",
  "reference": "d7590e",
  "status": "canceled",
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
  "shipments": [
    {
      "label": "1 six-pack of [skin+hair]",
      "carrier": null,
      "tracking_number": null,
      "tracking_url": null,
      "tracking_status": null,
      "tracking_status_at": null,
      "eta": null,
      "created_at": "2017-05-02T12:59:47.539Z",
      "updated_at": "2017-05-02T12:59:47.539Z"
    }
  ],
  "created_at": "2017-05-02T12:59:07.060Z",
  "updated_at": "2017-05-02T13:00:15.910Z"
}
```

This endpoint cancels an order:

  - If the order's status was __paid__:
    - Refunds the customer's [credit card](#cards)
    - Cancels previously created [shipments](#shipments)
    - Sends the [customer](#customers) a cancelation email
    - Marks the order as __canceled__
  - If the order's status was __created__
    - Marks the order as __canceled__


### HTTP Request

`POST https://api.dirtylemon.com/v1/orders/:order_id/cancel`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| order_id | yes |  |

### Returns

An order object.
