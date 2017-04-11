# Orders

## Order object

> Example object

```json
{
  "id": "fffe3495-f515-41cb-a311-c29fdd275cce",
  "tax": 0,
  "total": 6500,
  "shipping_fee": 0,
  "preordered": false,
  "line_items": [
    {
      "id": "0c71ceec-a444-4347-af51-76ab16330b1d",
      "description": "1 six-pack(s) [detox]",
      "amount": 6500,
      "quantity": 1,
      "product": {
        "sku": "868137000108",
        "name": "[detox]",
        "unit_price": 6500
      },
      "created_at": "2016-06-23T23:51:43.274Z",
      "updated_at": "2016-06-23T23:51:43.274Z"
    }
  ],
  "confirmed_at": "2016-06-23T23:51:55.643Z",
  "canceled_at": null,
  "created_at": "2016-06-23T23:51:43.267Z",
  "updated_at": "2016-06-23T23:51:55.644Z"
}
```

| Attribute  | Type     | Description |
| ---------- | -------- | ------------|
| id           | string   | Unique identifier for the object |
| tax          | integer | Tax amount in cents |
| total        | integer | Total amount in cents |
| shipping_fee | integer | Shipping fee in cents |
| preordered   | boolean | |
| line_items   | list | Array of line item objects |
| confirmed_at | timestamp | Time at which the order has been confirmed |
| canceled_at  | timestamp | Time at which the order has been canceled |
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
  "id": "fffe3495-f515-41cb-a311-c29fdd275cce",
  "tax": 0,
  "total": 6500,
  "shipping_fee": 0,
  "preordered": false,
  "line_items": [
    {
      "id": "0c71ceec-a444-4347-af51-76ab16330b1d",
      "description": "1 six-pack(s) [detox]",
      "amount": 6500,
      "quantity": 1,
      "product": {
        "sku": "868137000108",
        "name": "[detox]",
        "unit_price": 6500
      },
      "created_at": "2016-06-23T23:51:43.274Z",
      "updated_at": "2016-06-23T23:51:43.274Z"
    }
  ],
  "confirmed_at": "2016-06-23T23:51:55.643Z",
  "canceled_at": null,
  "created_at": "2016-06-23T23:51:43.267Z",
  "updated_at": "2016-06-23T23:51:55.644Z"
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
  line_items: [
    {
      quantity: 1
      product: 'sleep'
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
  "id": "fffe3495-f515-41cb-a311-c29fdd275cce",
  "tax": 0,
  "total": 6500,
  "shipping_fee": 0,
  "preordered": false,
  "line_items": [
    {
      "id": "0c71ceec-a444-4347-af51-76ab16230b1d",
      "description": "1 six-pack(s) [sleep]",
      "amount": 6500,
      "quantity": 1,
      "product": {
        "sku": "868137000107",
        "name": "[sleep]",
        "unit_price": 6500
      },
      "created_at": "2016-06-23T23:51:43.274Z",
      "updated_at": "2016-06-23T23:51:43.274Z"
    }
  ],
  "confirmed_at": null,
  "canceled_at": null,
  "created_at": "2016-06-23T23:51:43.267Z",
  "updated_at": "2016-06-23T23:51:55.644Z"
}
```

This endpoint creates an __unconfirmed__ order.

### HTTP Request

`POST https://api.dirtylemon.com/v1/customers/<ID>/orders`

### Arguments

| Parameter | Required | Description |
| --------- | -------- | ------------|
| line_items | yes | List of at least one `line_item` objects |

### Returns

An order object.

## Update an order

> Example request

```js
const dirtylemon = require('dirtylemon');

dirtylemon.orders.update({ORDER_ID}, {
  line_items: [
    {
      quantity: 1
      product: 'energy'
    }
  ]
})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "id": "fffe3495-f515-41cb-a311-c29fdd275cce",
  "tax": 0,
  "total": 6500,
  "shipping_fee": 0,
  "preordered": false,
  "line_items": [
    {
      "id": "0c71ceec-a244-4347-af51-76ab16330b1d",
      "description": "1 six-pack(s) [energy]",
      "amount": 6500,
      "quantity": 1,
      "product": {
        "sku": "868137000108",
        "name": "[energy]",
        "unit_price": 6500
      },
      "created_at": "2016-06-23T23:51:43.274Z",
      "updated_at": "2016-06-23T23:51:43.274Z"
    }
  ],
  "confirmed_at": null,
  "canceled_at": null,
  "created_at": "2016-06-23T23:51:43.267Z",
  "updated_at": "2016-06-23T23:51:55.644Z"
}
```

This endpoint updates an order.

### HTTP Request

`PATCH https://api.dirtylemon.com/v1/orders/<ID>`

### Arguments

| Parameter | Required | Description |
| --------- | -------- | ------------|
| line_items | yes | List of at least one `line_item` objects |

### Returns

An order object.

## Confirm an order

> Example request

```js
const dirtylemon = require('dirtylemon');

dirtylemon.orders.confirm({ORDER_ID})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "id": "fffe3495-f515-41cb-a311-c29fdd275cce",
  "tax": 0,
  "total": 6500,
  "shipping_fee": 0,
  "preordered": false,
  "line_items": [
    {
      "id": "0c71ceec-a444-4347-af51-76ab16330b1d",
      "description": "1 six-pack(s) [detox]",
      "amount": 6500,
      "quantity": 1,
      "product": {
        "sku": "868137000108",
        "name": "[detox]",
        "unit_price": 6500
      },
      "created_at": "2016-06-23T23:51:43.274Z",
      "updated_at": "2016-06-23T23:51:43.274Z"
    }
  ],
  "confirmed_at": "2016-06-23T23:51:55.643Z",
  "canceled_at": null,
  "created_at": "2016-06-23T23:51:43.267Z",
  "updated_at": "2016-06-23T23:51:55.644Z"
}
```

This endpoint confirms an order:

- Charges the customer's credit card
- Create shipments
- Sets the order's `confirmed_at` attribute
- Sends the customer a confirmation email

### HTTP Request

`POST https://api.dirtylemon.com/v1/orders/<ID>/confirm`

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
  "id": "fffe3495-f515-41cb-a311-c29fdd275cce",
  "tax": 0,
  "total": 6500,
  "shipping_fee": 0,
  "preordered": false,
  "line_items": [
    {
      "id": "0c71ceec-a444-4347-af51-76ab16330b1d",
      "description": "1 six-pack(s) [detox]",
      "amount": 6500,
      "quantity": 1,
      "product": {
        "sku": "868137000108",
        "name": "[detox]",
        "unit_price": 6500
      },
      "created_at": "2016-06-23T23:51:43.274Z",
      "updated_at": "2016-06-23T23:51:43.274Z"
    }
  ],
  "confirmed_at": "2016-06-23T23:51:55.643Z",
  "canceled_at": "2016-06-23T23:51:58.643Z",
  "created_at": "2016-06-23T23:51:43.267Z",
  "updated_at": "2016-06-23T23:51:55.644Z"
}
```

This endpoint cancels an order:

- Refunds the customer's credit card
- Cancels shipments
- Sets the order's `canceled_at` attribute
- Sends the customer a cancelation email

### HTTP Request

`DELETE https://api.dirtylemon.com/v1/orders/<ID>`

### Returns

An order object.
