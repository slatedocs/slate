# Orders

<aside class="notice">
  All actions available on the <code>/orders</code> endpoint will fail if the customer isn't confirmed.
</aside>

## Order object

> Example object

```json
{
  "id": "7baf83af-ef6b-4e3e-b467-c4f07351a287",
  "customer_id": "51f32742-c075-4d38-b2ec-2297b2546b2f",
  "reference": "4d5728",
  "status": "fulfilled",
  "currency": "usd",
  "tax": 0,
  "total": 6500,
  "shipping_fee": 0,
  "preordered": false,
  "coupon": null,
  "shipping": {
    "company": null,
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
      "id": "6a9b1a56-249c-4037-8469-b4416e5e30a1",
      "description": "1 six-pack of [skin+hair]",
      "amount": 6500,
      "quantity": 1,
      "sku": {
        "id": "f0a5ebf3-9a57-4b96-8e25-c8729c212490",
        "currency": "usd",
        "price": 6500
      },
      "created_at": "2017-04-18T18:37:43.674Z",
      "updated_at": "2017-04-18T18:37:43.674Z"
    }
  ],
  "shipments": [
    {
      "label": "1 six-pack of [skin+hair]",
      "carrier": null,
      "tracking_number": null,
      "tracking_url": null,
      "tracking_status": null,
      "tracking_status_details": null,
      "tracking_status_at": null,
      "eta": null,
      "fulfilled_at": null,
      "created_at": "2017-04-18T18:38:26.921Z",
      "updated_at": "2017-04-18T18:38:26.921Z"
    }
  ],
  "created_at": "2017-04-18T18:37:43.634Z",
  "updated_at": "2017-04-18T18:41:28.714Z"
}
```

| Attribute  | Type     | Description |
| ---------- | -------- | ------------|
| id           | string   | Unique identifier for the object |
| customer_id  | string   | Unique identifier for the associated customer |
| reference    | string | Short unique identifier for the object |
| status       | string | Either `created`, `paid`, `canceled`, `fulfilled` or `returned` |
| currency     | string | |
| tax          | integer | Tax amount in cents |
| total        | integer | Total amount in cents |
| shipping_fee | integer | Shipping fee in cents |
| preordered   | boolean | |
| coupon       | string | A `coupon` id |
| shipping     | hash | |
| line_items   | list | Array of `line item` objects |
| shipments    | list | Array of `shipments` objects |
| created_at   | timestamp | Time at which the object was created |
| updated_at   | timestamp | Time at which the object was updated |


## Retrieve an order

> Example request

```shell
curl -X GET \
-H 'Authorization: Bearer <TOKEN>' \
https://api.dirtylemon.com/v1/orders/{ORDER_ID}
```

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

`GET https://api.dirtylemon.com/v1/orders/:order_id`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| order_id | yes |  |

### Returns

An order object.

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
  "coupon": "20%OFF"
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
  coupon: '20%OFF'
})
```

> Example response

```http
HTTP/1.1 201 CREATED
```

```json
{
  "id": "7baf83af-ef6b-4e3e-b467-c4f07351a287",
  "customer_id": "51f32742-c075-4d38-b2ec-2297b2546b2f",
  "reference": "f786e5",
  "status": "created",
  "currency": "usd",
  "tax": 0,
  "total": 6500,
  "shipping_fee": 0,
  "preordered": false,
  "coupon": null,
  "shipping": {
    "company": null,
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
      "id": "6a9b1a56-249c-4037-8469-b4416e5e30a1",
      "description": "1 six-pack of [skin+hair]",
      "amount": 6500,
      "quantity": 1,
      "sku": {
        "id": "f0a5ebf3-9a57-4b96-8e25-c8729c212490",
        "currency": "usd",
        "price": 6500
      },
      "created_at": "2017-04-18T18:37:43.674Z",
      "updated_at": "2017-04-18T18:37:43.674Z"
    }
  ],
  "shipments": [],
  "created_at": "2017-04-18T18:37:43.634Z",
  "updated_at": "2017-04-18T18:37:44.599Z"
}
```

This endpoint creates an order:

  - Marks the order as __created__

For this action to be successful, the following conditions must be met:

  - Customer must have a valid email
  - Customer must have a first name and last name
  - Customer must have a valid shipping address

### HTTP Request

`POST https://api.dirtylemon.com/v1/customers/:customer_id/orders`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Arguments

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
  "id": "7baf83af-ef6b-4e3e-b467-c4f07351a287",
  "customer_id": "51f32742-c075-4d38-b2ec-2297b2546b2f",
  "reference": "b30fd1",
  "status": "paid",
  "currency": "usd",
  "tax": 0,
  "total": 6500,
  "shipping_fee": 0,
  "preordered": false,
  "coupon": null,
  "shipping": {
    "company": null,
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
      "id": "6a9b1a56-249c-4037-8469-b4416e5e30a1",
      "description": "1 six-pack of [skin+hair]",
      "amount": 6500,
      "quantity": 1,
      "sku": {
        "id": "f0a5ebf3-9a57-4b96-8e25-c8729c212490",
        "currency": "usd",
        "price": 6500
      },
      "created_at": "2017-04-18T18:37:43.674Z",
      "updated_at": "2017-04-18T18:37:43.674Z"
    }
  ],
  "shipments": [
    {
      "label": "1 six-pack of [skin+hair]",
      "carrier": null,
      "tracking_number": null,
      "tracking_url": null,
      "tracking_status": null,
      "tracking_status_details": null,
      "tracking_status_at": null,
      "eta": null,
      "fulfilled_at": null,
      "created_at": "2017-04-18T18:38:26.921Z",
      "updated_at": "2017-04-18T18:38:26.921Z"
    }
  ],
  "created_at": "2017-04-18T18:37:43.634Z",
  "updated_at": "2017-04-18T18:38:27.276Z"
}
```

This endpoint pays an order:

  - Charges the customer's credit card
  - Creates shipments for the order's line items
  - Sends the customer a confirmation email
  - Marks the order as __paid__


### HTTP Request

`POST https://api.dirtylemon.com/v1/orders/:order_id/pay`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| order_id | yes |  |

### Returns

An order object.


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
  "id": "7baf83af-ef6b-4e3e-b467-c4f07351a287",
  "customer_id": "51f32742-c075-4d38-b2ec-2297b2546b2f",
  "reference": "4d5728",
  "status": "canceled",
  "currency": "usd",
  "tax": 0,
  "total": 6500,
  "shipping_fee": 0,
  "preordered": false,
  "coupon": null,
  "shipping": {
    "company": null,
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
      "id": "6a9b1a56-249c-4037-8469-b4416e5e30a1",
      "description": "1 six-pack of [skin+hair]",
      "amount": 6500,
      "quantity": 1,
      "sku": {
        "id": "f0a5ebf3-9a57-4b96-8e25-c8729c212490",
        "currency": "usd",
        "price": 6500
      },
      "created_at": "2017-04-18T18:37:43.674Z",
      "updated_at": "2017-04-18T18:37:43.674Z"
    }
  ],
  "shipments": [
    {
      "label": "1 six-pack of [skin+hair]",
      "carrier": null,
      "tracking_number": null,
      "tracking_url": null,
      "tracking_status": null,
      "tracking_status_details": null,
      "tracking_status_at": null,
      "eta": null,
      "fulfilled_at": null,
      "created_at": "2017-04-18T18:38:26.921Z",
      "updated_at": "2017-04-18T18:38:26.921Z"
    }
  ],
  "created_at": "2017-04-18T18:37:43.634Z",
  "updated_at": "2017-04-18T18:41:28.714Z"
}
```

This endpoint cancels an order:

  - If the order's status was __paid__:
    - Refunds the customer's credit card
    - Cancels previously created shipments
    - Sends the customer a cancelation email
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


## Fulfill an order

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
https://api.dirtylemon.com/v1/orders/{ORDER_ID}/fulfill
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.orders.fulfill({ORDER_ID})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "id": "7baf83af-ef6b-4e3e-b467-c4f07351a287",
  "customer_id": "51f32742-c075-4d38-b2ec-2297b2546b2f",
  "reference": "4d5728",
  "status": "fulfilled",
  "currency": "usd",
  "tax": 0,
  "total": 6500,
  "shipping_fee": 0,
  "preordered": false,
  "coupon": null,
  "shipping": {
    "company": null,
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
      "id": "6a9b1a56-249c-4037-8469-b4416e5e30a1",
      "description": "1 six-pack of [skin+hair]",
      "amount": 6500,
      "quantity": 1,
      "sku": {
        "id": "f0a5ebf3-9a57-4b96-8e25-c8729c212490",
        "currency": "usd",
        "price": 6500
      },
      "created_at": "2017-04-18T18:37:43.674Z",
      "updated_at": "2017-04-18T18:37:43.674Z"
    }
  ],
  "shipments": [
    {
      "label": "1 six-pack of [skin+hair]",
      "carrier": null,
      "tracking_number": null,
      "tracking_url": null,
      "tracking_status": null,
      "tracking_status_details": null,
      "tracking_status_at": null,
      "eta": null,
      "fulfilled_at": null,
      "created_at": "2017-04-18T18:38:26.921Z",
      "updated_at": "2017-04-18T18:38:26.921Z"
    }
  ],
  "created_at": "2017-04-18T18:37:43.634Z",
  "updated_at": "2017-04-18T18:41:28.714Z"
}
```

This endpoint fulfills an order:

  - Marks the order as __fulfilled__


### HTTP Request

`POST https://api.dirtylemon.com/v1/orders/:order_id/fulfill`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| order_id | yes |  |

### Returns

An order object.


## Return an order

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
https://api.dirtylemon.com/v1/orders/{ORDER_ID}/return
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.orders.return({ORDER_ID})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "id": "7baf83af-ef6b-4e3e-b467-c4f07351a287",
  "customer_id": "51f32742-c075-4d38-b2ec-2297b2546b2f",
  "reference": "4d5728",
  "status": "returned",
  "currency": "usd",
  "tax": 0,
  "total": 6500,
  "shipping_fee": 0,
  "preordered": false,
  "coupon": null,
  "shipping": {
    "company": null,
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
      "id": "6a9b1a56-249c-4037-8469-b4416e5e30a1",
      "description": "1 six-pack of [skin+hair]",
      "amount": 6500,
      "quantity": 1,
      "sku": {
        "id": "f0a5ebf3-9a57-4b96-8e25-c8729c212490",
        "currency": "usd",
        "price": 6500
      },
      "created_at": "2017-04-18T18:37:43.674Z",
      "updated_at": "2017-04-18T18:37:43.674Z"
    }
  ],
  "shipments": [
    {
      "label": "1 six-pack of [skin+hair]",
      "carrier": null,
      "tracking_number": null,
      "tracking_url": null,
      "tracking_status": null,
      "tracking_status_details": null,
      "tracking_status_at": null,
      "eta": null,
      "fulfilled_at": null,
      "created_at": "2017-04-18T18:38:26.921Z",
      "updated_at": "2017-04-18T18:38:26.921Z"
    }
  ],
  "created_at": "2017-04-18T18:37:43.634Z",
  "updated_at": "2017-04-18T18:41:28.714Z"
}
```

This endpoint returns an order:

  - Refunds the customer
  - Marks the order as __returned__


### HTTP Request

`POST https://api.dirtylemon.com/v1/orders/:order_id/return`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| order_id | yes |  |

### Returns

An order object.
