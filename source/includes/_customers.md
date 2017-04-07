# Customers

## Customer object

```json
{
  "id": "fffd7e80-1691-41f5-8946-9deeaf0b8640",
  "phone_number": "+13333333333",
  "unconfirmed_phone_number": "+13333333333",
  "country_code": "US",
  "email": "customer@example.com",
  "first_name": "Yogi",
  "last_name": "Berra",
  "confirmation_token": "123456",
  "billing_address_url": "/customers/fffd7e80-1691-41f5-8946-9deeaf0b8640/addresses/3412e1d6-2208-4b54-9ae9-a479ed663cde/edit?t=6959409667137177",
  "shipping_address_url": "/customers/fffd7e80-1691-41f5-8946-9deeaf0b8640/addresses/a78c2359-4388-4ed1-87cb-1caa19d80507/edit?t=6959409667137177",
  "card_url": "/customers/fffd7e80-1691-41f5-8946-9deeaf0b8640/card/edit?t=6959409667137177",
  "confirmed_at": "2016-09-02T09:40:08.004Z",
  "confirmation_sent_at": "2016-09-02T09:40:07.004Z",
  "created_at": "2016-09-02T09:40:06.004Z",
  "updated_at": "2016-09-07T02:12:02.012Z"
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
| billing_address_url      | string | Ephemeral url allowing the user to edit his billing address with a form |
| shipping_address_url     | string | Ephemeral url allowing the user to edit his shipping address with a form |
| card_url                 | string | Ephemeral url allowing the user to edit his credit card with a form |
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
  "id": "fffd7e80-1691-41f5-8946-9deeaf0b8640",
  "phone_number": "+13333333333",
  "unconfirmed_phone_number": "+13333333333",
  "country_code": "US",
  "email": "customer@example.com",
  "first_name": "Yogi",
  "last_name": "Berra",
  "confirmation_token": "123456",
  "billing_address_url": "/customers/fffd7e80-1691-41f5-8946-9deeaf0b8640/addresses/3412e1d6-2208-4b54-9ae9-a479ed663cde/edit?t=6959409667137177",
  "shipping_address_url": "/customers/fffd7e80-1691-41f5-8946-9deeaf0b8640/addresses/a78c2359-4388-4ed1-87cb-1caa19d80507/edit?t=6959409667137177",
  "card_url": "/customers/fffd7e80-1691-41f5-8946-9deeaf0b8640/card/edit?t=6959409667137177",
  "confirmed_at": "2016-09-02T09:40:08.004Z",
  "confirmation_sent_at": "2016-09-02T09:40:07.004Z",
  "created_at": "2016-09-02T09:40:06.004Z",
  "updated_at": "2016-09-07T02:12:02.012Z"
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
  "id": "fffd7e80-1691-41f5-8946-9deeaf0b8640",
  "phone_number": null,
  "unconfirmed_phone_number": "+13333333333",
  "country_code": "US",
  "email": "customer@example.com",
  "first_name": "Yogi",
  "last_name": "Berra",
  "confirmation_token": null,
  "billing_address_url": "/customers/fffd7e80-1691-41f5-8946-9deeaf0b8640/addresses/3412e1d6-2208-4b54-9ae9-a479ed663cde/edit?t=6959409667137177",
  "shipping_address_url": "/customers/fffd7e80-1691-41f5-8946-9deeaf0b8640/addresses/a78c2359-4388-4ed1-87cb-1caa19d80507/edit?t=6959409667137177",
  "card_url": "/customers/fffd7e80-1691-41f5-8946-9deeaf0b8640/card/edit?t=6959409667137177",
  "confirmed_at": null,
  "confirmation_sent_at": null,
  "created_at": "2016-09-02T09:40:06.004Z",
  "updated_at": "2016-09-02T09:40:06.004Z"
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
  email: 'yogi@berra.com'
})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "id": "fffd7e80-1691-41f5-8946-9deeaf0b8640",
  "phone_number": "+13333333333",
  "unconfirmed_phone_number": "+13333333333",
  "country_code": "US",
  "email": "yogi@berra.com",
  "first_name": "Yogi",
  "last_name": "Berra",
  "confirmation_token": "123456",
  "billing_address_url": "/customers/fffd7e80-1691-41f5-8946-9deeaf0b8640/addresses/3412e1d6-2208-4b54-9ae9-a479ed663cde/edit?t=6959409667137177",
  "shipping_address_url": "/customers/fffd7e80-1691-41f5-8946-9deeaf0b8640/addresses/a78c2359-4388-4ed1-87cb-1caa19d80507/edit?t=6959409667137177",
  "card_url": "/customers/fffd7e80-1691-41f5-8946-9deeaf0b8640/card/edit?t=6959409667137177",
  "confirmed_at": "2016-09-02T09:40:08.004Z",
  "confirmation_sent_at": "2016-09-02T09:40:07.004Z",
  "created_at": "2016-09-02T09:40:06.004Z",
  "updated_at": "2016-09-07T02:12:02.012Z"
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
  "id": "fffd7e80-1691-41f5-8946-9deeaf0b8640",
  "phone_number": "+13333333333",
  "unconfirmed_phone_number": "+13333333333",
  "country_code": "US",
  "email": "customer@example.com",
  "first_name": "Yogi",
  "last_name": "Berra",
  "confirmation_token": "123456",
  "billing_address_url": "/customers/fffd7e80-1691-41f5-8946-9deeaf0b8640/addresses/3412e1d6-2208-4b54-9ae9-a479ed663cde/edit?t=6959409667137177",
  "shipping_address_url": "/customers/fffd7e80-1691-41f5-8946-9deeaf0b8640/addresses/a78c2359-4388-4ed1-87cb-1caa19d80507/edit?t=6959409667137177",
  "card_url": "/customers/fffd7e80-1691-41f5-8946-9deeaf0b8640/card/edit?t=6959409667137177",
  "confirmed_at": "2016-09-02T09:40:08.004Z",
  "confirmation_sent_at": "2016-09-02T09:40:07.004Z",
  "created_at": "2016-09-02T09:40:06.004Z",
  "updated_at": "2016-09-07T02:12:02.012Z"
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
