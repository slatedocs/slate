# Orders

## Order object

> Example object

```json
{
  "id": "1526b746-6a39-4958-91bf-a80bba41cdc3",
  "customer_id": "294e03d6-df4f-4ee1-94be-e334c420381a",
  "reference": "6f324c",
  "status": "created",
  "currency": "usd",
  "tax": 0,
  "shipping_fee": 0,
  "total": 6500,
  "preordered": false,
  "coupon_id": null,
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
      "id": "29ed62f3-2a36-4543-b586-508bd6a3313f",
      "description": "1 six-pack of [skin+hair]",
      "amount": 6500,
      "quantity": 1,
      "sku": {
        "id": "868137000115",
        "currency": "usd",
        "price": 6500
      },
      "created_at": "2017-05-01T22:25:46.626Z",
      "updated_at": "2017-05-01T22:25:46.626Z"
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
      "created_at": "2017-05-02T00:10:39.726Z",
      "updated_at": "2017-05-02T00:10:39.726Z"
    }
  ],
  "created_at": "2017-05-01T22:25:46.589Z",
  "updated_at": "2017-05-02T00:19:55.935Z"
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
| shipping_fee | integer | Shipping fee in cents |
| total        | integer | Total amount in cents |
| preordered   | boolean | |
| coupon_id    | string | A `coupon` id |
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
  "id": "1526b746-6a39-4958-91bf-a80bba41cdc3",
  "customer_id": "294e03d6-df4f-4ee1-94be-e334c420381a",
  "reference": "6f324c",
  "status": "created",
  "currency": "usd",
  "tax": 0,
  "shipping_fee": 0,
  "total": 6500,
  "preordered": false,
  "coupon_id": null,
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
      "id": "29ed62f3-2a36-4543-b586-508bd6a3313f",
      "description": "1 six-pack of [skin+hair]",
      "amount": 6500,
      "quantity": 1,
      "sku": {
        "id": "868137000115",
        "currency": "usd",
        "price": 6500
      },
      "created_at": "2017-05-01T22:25:46.626Z",
      "updated_at": "2017-05-01T22:25:46.626Z"
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
      "created_at": "2017-05-02T00:10:39.726Z",
      "updated_at": "2017-05-02T00:10:39.726Z"
    }
  ],
  "created_at": "2017-05-01T22:25:46.589Z",
  "updated_at": "2017-05-02T00:19:55.935Z"
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
  "id": "44024b51-742a-4598-8311-d9a629631987",
  "customer_id": "294e03d6-df4f-4ee1-94be-e334c420381a",
  "reference": "d7590e",
  "status": "paid",
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
  "updated_at": "2017-05-02T12:59:47.818Z"
}
```

<aside class="notice">
  Calls on this action will fail if the customer isn't confirmed.
</aside>

This endpoint pays an order:

  - Charges the customer's [credit card](#cards)
  - Creates [shipments](#shipments) for the order's line items
  - Sends the [customer](#customers) a confirmation email
  - Sets the `shipping` object from the customer's shipping address unless already set on creation
  - Marks the order as __paid__

For this action to be successful, the following conditions must be met:

  - Customer must have a valid email
  - Customer must have a first name and last name
  - Customer must have a valid shipping address


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
  "id": "44024b51-742a-4598-8311-d9a629631987",
  "customer_id": "294e03d6-df4f-4ee1-94be-e334c420381a",
  "reference": "d7590e",
  "status": "fulfilled",
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
  "id": "44024b51-742a-4598-8311-d9a629631987",
  "customer_id": "294e03d6-df4f-4ee1-94be-e334c420381a",
  "reference": "d7590e",
  "status": "returned",
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

This endpoint returns an order:

  - Refunds the [customer](#customers)
  - Marks the order as __returned__


### HTTP Request

`POST https://api.dirtylemon.com/v1/orders/:order_id/return`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| order_id | yes |  |

### Returns

An order object.
