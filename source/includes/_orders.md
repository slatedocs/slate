# Orders

<aside class="notice">
  All actions available on the <code>/orders</code> endpoint will fail if the customer isn't confirmed.
</aside>

## Order object

> Example object

```json
{
  "id": "ffffee73-013b-4aa2-91e1-bdefd0b2c41c",
  "customer_id": "634f65a5-8e16-4afb-9e8b-714b8bb6eb7f",
  "reference": "901f7f",
  "state": "created",
  "tax": 0,
  "total": 6500,
  "shipping_fee": 0,
  "preordered": false,
  "coupon": null,
  "shipping_label": {
    "name": "David Chang",
    "company": null,
    "phone_number": null,
    "email": null,
    "street1": "128 Lafayette St",
    "street2": null,
    "street3": null,
    "city": "New York",
    "state": "New York",
    "country": "US",
    "zip": "10013"
  },
  "line_items": [
    {
      "id": "edf7656f-f76c-4d6f-aabd-f1c4b91431bf",
      "description": "1 six-pack(s) [skin+hair]",
      "amount": 6500,
      "quantity": 1,
      "sku": {
        "id": "868137000115",
        "price": 6500
      },
      "created_at": "2017-02-26T17:18:08.341Z",
      "updated_at": "2017-02-26T17:18:25.655Z"
    }
  ],
  "shipments": [
    {
      "label": null,
      "carrier": null,
      "tracking_number": null,
      "tracking_url": null,
      "tracking_status": null,
      "tracking_status_details": null,
      "tracking_status_at": null,
      "eta": null,
      "fulfilled_at": null,
      "created_at": "2017-02-27T10:01:39.749Z",
      "updated_at": "2017-02-28T03:35:17.699Z"
    }
  ],
  "created_at": "2017-02-26T17:16:52.619Z",
  "updated_at": "2017-04-05T20:24:34.842Z"
}
```

| Attribute  | Type     | Description |
| ---------- | -------- | ------------|
| id           | string   | Unique identifier for the object |
| customer_id  | string   | Unique identifier for the associated customer |
| reference    | string | Short unique identifier for the object |
| state        | string | Either `created`, `paid`, `canceled`, `fulfilled` or `returned` |
| tax          | integer | Tax amount in cents |
| total        | integer | Total amount in cents |
| shipping_fee | integer | Shipping fee in cents |
| preordered   | boolean | |
| coupon       | string | A `coupon` id |
| shipping_label | hash | |
| line_items   | list | Array of `line item` objects |
| shipments    | list | Array of `shipments` objects |
| created_at   | timestamp | Time at which the object was created |
| updated_at   | timestamp | Time at which the object was updated |


## Retrieve an order

> Example request

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.orders.retrieve({ORDER_ID})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "id": "ffffee73-013b-4aa2-91e1-bdefd0b2c41c",
  "customer_id": "634f65a5-8e16-4afb-9e8b-714b8bb6eb7f",
  "reference": "901f7f",
  "state": "created",
  "tax": 0,
  "total": 6500,
  "shipping_fee": 0,
  "preordered": false,
  "coupon": null,
  "shipping_label": {
    "name": "David Chang",
    "company": null,
    "phone_number": null,
    "email": null,
    "street1": "128 Lafayette St",
    "street2": null,
    "street3": null,
    "city": "New York",
    "state": "New York",
    "country": "US",
    "zip": "10013"
  },
  "line_items": [],
  "shipments": [],
  "created_at": "2017-02-26T17:16:52.619Z",
  "updated_at": "2017-04-05T20:24:34.842Z"
}
```

This endpoint retrieves a specific order.

### HTTP Request

`GET https://api.dirtylemon.com/v1/orders/<ID>`

### Returns

An order object.

## Create an order

> Example request

```js
const dirtylemon = require('dirtylemon');

dirtylemon.orders.create({CUSTOMER_ID}, {
  coupon: '20%OFF',
  shipping: {
    name: 'Philippe Dionne',
    street1: '1-60 crémazie ouest',
    city: 'Quebec',
    state: 'Quebec',
    country: 'Canada',
    zip: 'g1r1x3'
  },
  line_items: [
    {
      quantity: 1
      sku: '868137000115'
    }
  ]
})
```

> Example response

```http
HTTP/1.1 201 CREATED
```

```json
{
  "id": "2c824c26-967d-497e-a29a-1d1dfab89281",
  "customer_id": "be224ef0-f6da-4518-8cbe-64572cd6d447",
  "reference": "901f7f",
  "status": "created",
  "tax": 0,
  "total": 6500,
  "shipping_fee": 0,
  "preordered": false,
  "coupon": null,
  "shipping": {
    "name": "Philippe Dionne",
    "company": null,
    "phone_number": "14185800893",
    "email": null,
    "street1": "1-60 crémazie ouest",
    "street2": null,
    "street3": null,
    "city": "Quebec",
    "state": "Quebec",
    "country": "Canada",
    "zip": "g1r1x3"
  },
  "line_items": [
    {
      "id": "645ef698-77a3-44ea-b8f0-734682804969",
      "description": "1 six-pack of [skin+hair]",
      "amount": 6500,
      "quantity": 1,
      "sku": {
        "price": 6500
        "id": "868137000115"
      },
      "created_at": "2017-04-14T21:42:36.560Z",
      "updated_at": "2017-04-14T21:42:36.560Z"
    }
  ],
  "shipments": [],
  "created_at": "2017-04-14T21:42:36.518Z",
  "updated_at": "2017-04-14T21:42:37.312Z"
}
```

This endpoint creates an order.

### HTTP Request

`POST https://api.dirtylemon.com/v1/customers/<ID>/orders`

### Arguments

| Parameter | Required | Description |
| --------- | -------- | ------------|
| coupon | no | String |
| shipping | no | A `Shipping` object. If none provided, the customer's shipping informations will be used by default. |
| line_items | yes | List of at least one `Line item` objects. |

### Shipping object

| Attribute | Type | Required |
| --------- | -------- | ------------ |
| name | String | yes |
| company | String | no |
| street1 | String | yes |
| street2 | String | no |
| street3 | String | no |
| city | String | yes |
| state | String | yes |
| country | String | yes |
| zip | String | yes |

### Line item object

| Attribute | Type | Required |
| --------- | -------- | ------------ |
| quantity | Numeric | yes |
| sku | String | yes |

### Returns

An order object.


## Pay an order

> Example request

```js
const dirtylemon = require('dirtylemon');

dirtylemon.orders.pay({ORDER_ID})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "id": "ffffee73-013b-4aa2-91e1-bdefd0b2c41c",
  "customer_id": "634f65a5-8e16-4afb-9e8b-714b8bb6eb7f",
  "reference": "901f7f",
  "state": "paid",
  "tax": 0,
  "total": 6500,
  "shipping_fee": 0,
  "preordered": false,
  "coupon": null,
  "shipping_label": {
    "name": "David Chang",
    "company": null,
    "phone_number": null,
    "email": null,
    "street1": "128 Lafayette St",
    "street2": null,
    "street3": null,
    "city": "New York",
    "state": "New York",
    "country": "US",
    "zip": "10013"
  },
  "line_items": [],
  "shipments": [],
  "created_at": "2017-02-26T17:16:52.619Z",
  "updated_at": "2017-04-05T20:24:34.842Z"
}
```

This endpoint pays an order:

- Charges the customer's credit card
- Creates shipments for the order's line items
- Sends the customer a confirmation email


### HTTP Request

`POST https://api.dirtylemon.com/v1/orders/<ID>/pay`

### Returns

An order object.


## Cancel an order

> Example request

```js
const dirtylemon = require('dirtylemon');

dirtylemon.orders.cancel({ORDER_ID})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "id": "ffffee73-013b-4aa2-91e1-bdefd0b2c41c",
  "customer_id": "634f65a5-8e16-4afb-9e8b-714b8bb6eb7f",
  "reference": "901f7f",
  "state": "canceled",
  "tax": 0,
  "total": 6500,
  "shipping_fee": 0,
  "preordered": false,
  "coupon": null,
  "shipping_label": {
    "name": "David Chang",
    "company": null,
    "phone_number": null,
    "email": null,
    "street1": "128 Lafayette St",
    "street2": null,
    "street3": null,
    "city": "New York",
    "state": "New York",
    "country": "US",
    "zip": "10013"
  },
  "line_items": [],
  "shipments": [],
  "created_at": "2017-02-26T17:16:52.619Z",
  "updated_at": "2017-04-05T20:24:34.842Z"
}
```

This endpoint cancels an order:

- Refunds the customer's credit card
- Cancels previously created shipments
- Sends the customer a cancelation email


### HTTP Request

`POST https://api.dirtylemon.com/v1/orders/<ID>/cancel`

### Returns

An order object.


## Fulfill an order

> Example request

```js
const dirtylemon = require('dirtylemon');

dirtylemon.orders.fulfill({ORDER_ID})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "id": "ffffee73-013b-4aa2-91e1-bdefd0b2c41c",
  "customer_id": "634f65a5-8e16-4afb-9e8b-714b8bb6eb7f",
  "reference": "901f7f",
  "state": "fulfilled",
  "tax": 0,
  "total": 6500,
  "shipping_fee": 0,
  "preordered": false,
  "coupon": null,
  "shipping_label": {
    "name": "David Chang",
    "company": null,
    "phone_number": null,
    "email": null,
    "street1": "128 Lafayette St",
    "street2": null,
    "street3": null,
    "city": "New York",
    "state": "New York",
    "country": "US",
    "zip": "10013"
  },
  "line_items": [],
  "shipments": [],
  "created_at": "2017-02-26T17:16:52.619Z",
  "updated_at": "2017-04-05T20:24:34.842Z"
}
```

This endpoint fulfills an order.


### HTTP Request

`POST https://api.dirtylemon.com/v1/orders/<ID>/fulfill`

### Returns

An order object.
