# Customers

## Customer object

```json
{
  ...
}
```

| Attribute  | Type     | Description |
| ---------- | -------- | ------------|
| id                       | string   | Unique identifier for the object |
| phone_number             | string |  |
| unconfirmed_phone_number | string |  |
| country_code             | string |  |
| email                    | string |  |
| first_name               | string |  |
| last_name                | string |  |
| confirmation_token       | string |  |
| confirmed_at             | timestamp | Time at which the phone number was confirmed |
| confirmation_sent_at     | timestamp | Time at which the confirmation token was sent to the unconfirmed phone number |
| created_at               | timestamp | Time at which the object was created |
| updated_at               | timestamp | Time at which the object was updated |


## Retrieve a customer

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.customers.retrieve({CUSTOMER_ID})
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

This endpoint retrieves a specific customer.

### HTTP Request

`GET https://api.dirtylemon.com/v1/customers/<ID>`

### Returns

A customer object.


## Create a customer

```js
const dirtylemon = require('dirtylemon');

dirtylemon.customers.create({
  unconfirmed_phone_number: '333-333-333',
  country_code: 'US'
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

This endpoint creates an __unconfirmed__ customer, creates a confirmation token and sends it to the specified phone number.

### HTTP Request

`POST https://api.dirtylemon.com/v1/customers`

### Arguments

| Parameter | Required | Description |
| --------- | -------- | ------------|
| unconfirmed_phone_number | yes | Unique phone number |
| country_code | yes | The phone number's ISO 3166 country code |

### Returns

A customer object.

## Update a customer

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.customers.update({CUSTOMER_ID}, {
  first_name: 'Philippe',
  last_name: 'Dionne',
  email: 'phil@example.com'
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

This endpoint updates a customer.

### HTTP Request

`PATCH https://api.dirtylemon.com/v1/customers/<ID>`

### Arguments

| Parameter | Required | Description |
| --------- | -------- | ------------|
| first_name | no |  |
| last_name | no |  |
| email | no |  |

### Returns

A customer object.

## Confirm a customer

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.customers.confirm({CUSTOMER_ID}, {
  confirmation_token: '123456'
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

This endpoint confirms a customer's phone number. Once a customer is created, a confirmation token is sent to the specified phone number and the customer has a short time window, about 5 minutes, to confirm it.

### HTTP Request

`POST https://api.dirtylemon.com/v1/customers/<ID>/confirm`

### Arguments

| Parameter | Required | Description |
| --------- | -------- | ------------|
| confirmation_token | yes | Token previously sent to the customer's phone number |

### Returns

A customer object.


## Generate a confirmation token

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.customers.generate_confirmation({CUSTOMER_ID})
```

> Example response

```http
HTTP/1.1 201 CREATED
```

This endpoint generates a confirmation token and sends it to the specified phone number. Use it to handle situations when a customer fails to confirm his phone number in the allowed time window.

### HTTP Request

`POST https://api.dirtylemon.com/v1/customers/<ID>/generate_confirmation`

### Returns

Nothing.
