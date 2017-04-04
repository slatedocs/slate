# Orders

## Order object

```json
{
  ...
}
```

| Attribute  | Type     | Description |
| ---------- | -------- | ------------|
| id           | string   | Unique identifier for the object |
| tax          | integer | Tax amount in cents |
| total        | integer | Total amount in cents |
| shipping_fee | integer | Shipping fee in cents |
| preordered   | boolean | |
| charge       | hash | Charge object |
| refund       | hash | Refund object |
| line_items   | list | Array of line item objects |
| confirmed_at | timestamp | Time at which the order has been confirmed |
| canceled_at  | timestamp | Time at which the order has been cancelled |
| created_at   | timestamp | Time at which the object was created |
| updated_at   | timestamp | Time at which the object was updated |


## Retrieve an order

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
  ...
}
```

This endpoint retrieves a specific order.

### HTTP Request

`GET https://api.dirtylemon.com/v1/customers/<ID>/orders/<ID>`

### Returns

An order object.

## Create an order

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
  ...
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
  ...
}
```

This endpoint updates an order.

### HTTP Request

`PATCH https://api.dirtylemon.com/v1/customers/<ID>/orders/<ID>`

### Arguments

| Parameter | Required | Description |
| --------- | -------- | ------------|
| line_items | yes | List of at least one `line_item` objects |

### Returns

An order object.

## Confirm an order

```js
const dirtylemon = require('dirtylemon');

dirtylemon.orders.confirm({})
```

> Example response

```http
HTTP/1.1 200 OK
```

This endpoint confirms an order and sends the customer a confirmation email.

### HTTP Request

`POST https://api.dirtylemon.com/v1/customers/<ID>/orders/<ID>/confirm`

### Returns

Nothing.


## Cancel an order

```js
const dirtylemon = require('dirtylemon');

dirtylemon.orders.cancel({})
```

> Example response

```http
HTTP/1.1 200 OK
```

This endpoint cancels an order and sends the customer a cancellation email.

### HTTP Request

`DELETE https://api.dirtylemon.com/v1/customers/<ID>/orders/<ID>`

### Returns

Nothing.
