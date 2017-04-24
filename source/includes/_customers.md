# Customers

## Customer object

> Example object

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
  "billing_address_url": "https://api.dirtylemon.com/l/6243c9",
  "shipping_address_url": "https://api.dirtylemon.com/l/192b86",
  "card_url": "https://api.dirtylemon.com/l/0896d5",
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
| confirmed_at             | timestamp | Time at which the phone number was confirmed |
| confirmation_sent_at     | timestamp | Time at which the confirmation token was sent to the unconfirmed phone number |
| created_at               | timestamp | Time at which the object was created |
| updated_at               | timestamp | Time at which the object was updated |


## Retrieve a customer

> Example request

```shell
curl -X GET \
-H 'Authorization: Bearer <TOKEN>' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}
```

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
  "billing_address_url": "https://api.dirtylemon.com/l/6243c9",
  "shipping_address_url": "https://api.dirtylemon.com/l/192b86",
  "card_url": "https://api.dirtylemon.com/l/0896d5",
  "confirmed_at": "2016-09-02T09:40:08.004Z",
  "confirmation_sent_at": "2016-09-02T09:40:07.004Z",
  "created_at": "2016-09-02T09:40:06.004Z",
  "updated_at": "2016-09-07T02:12:02.012Z"
}
```

This endpoint retrieves a specific customer. Use this endpoint to generate short and ephemeral URLs allowing the customer to edit his informations.

### HTTP Request

`GET https://api.dirtylemon.com/v1/customers/:customer_id`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Returns

A customer object.


## Create a customer

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "unconfirmed_phone_number": "333-333-333",
  "country_code": "US"
}' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.customers.create({
  unconfirmed_phone_number: '333-333-333',
  country_code: 'US',
  first_name: 'Yogi',
  last_name: 'Berra',
  email: 'yogi@berra.com'
})
```

> Example response

```http
HTTP/1.1 201 CREATED
```

```json
{
  "id": "32139dfd-87c3-4552-8e91-0d9de718bff6",
  "phone_number": null,
  "unconfirmed_phone_number": "+14185810827",
  "country_code": "CA",
  "email": "yogi@berra.com",
  "first_name": "Yogi",
  "last_name": "Berra",
  "confirmation_token": "152200",
  "billing_address_url": null,
  "shipping_address_url": null,
  "card_url": null,
  "confirmed_at": "2017-04-14T18:48:52.367Z",
  "confirmation_sent_at": null,
  "created_at": "2017-04-14T18:48:52.367Z",
  "updated_at": "2017-04-14T18:48:52.967Z"
}
```

With `confirmation`:

  - Creates an __unconfirmed__ customer
  - Fires a `verification` event

Without `confirmation`:

  - Creates a __confirmed__ customer


### HTTP Request

`POST https://api.dirtylemon.com/v1/customers`

### Body params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| confirmation | no | Wether or not to perform the confirmation flow. Default to `true` |
| unconfirmed_phone_number | yes | Unique phone number |
| country_code | yes | The phone number's ISO 3166 country code |
| first_name | no |  |
| last_name | no |  |
| email | no |  |

### Returns

A customer object.

## Update a customer

> Example request

```shell
curl -X PUT \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "email": "yogi@berra.com"
}' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}
```

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
  "billing_address_url": null,
  "shipping_address_url": null,
  "card_url": null,
  "confirmed_at": "2016-09-02T09:40:08.004Z",
  "confirmation_sent_at": "2016-09-02T09:40:07.004Z",
  "created_at": "2016-09-02T09:40:06.004Z",
  "updated_at": "2016-09-07T02:12:02.012Z"
}
```

This endpoint updates a customer.

### HTTP Request

`PATCH https://api.dirtylemon.com/v1/customers/:customer_id`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Body params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| first_name | no |  |
| last_name | no |  |
| email | no |  |

### Returns

A customer object.

## Confirm a customer

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "confirmation_token": "123456"
}' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}/confirm
```

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
  "id": "32139dfd-87c3-4552-8e91-0d9de718bff6",
  "phone_number": "+14185810827",
  "unconfirmed_phone_number": "+14185810827",
  "country_code": "CA",
  "email": null,
  "first_name": null,
  "last_name": null,
  "confirmation_token": "152200",
  "billing_address_url": null,
  "shipping_address_url": null,
  "card_url": null,
  "confirmed_at": "2017-04-14T18:53:59.246Z",
  "confirmation_sent_at": null,
  "created_at": "2017-04-14T18:48:52.367Z",
  "updated_at": "2017-04-14T18:53:59.253Z"
}
```

This endpoint confirms a customer's phone number:

  - Promotes the customer's `unconfirmed_phone_number` to `phone_number`
  - Fires a `verification` event

<aside class="notice">
  This will fail if the customer is already confirmed.
</aside>

### HTTP Request

`POST https://api.dirtylemon.com/v1/customers/:customer_id/confirm`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Body params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| confirmation_token | yes | Token generated on customer creation |

### Returns

A customer object.


## Generate a confirmation token

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}/generate_confirmation
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.customers.generate_confirmation({CUSTOMER_ID})
```

> Example response

```http
HTTP/1.1 201 CREATED
```

This endpoint generates a new confirmation token:

  - Fires a `verification` event

Allows to handle situations when a customer fails to confirm his phone number in the allowed time window, which is usually about 5 minutes.

On the event, the [conversational system](#) can prompt the customer for confirmation.

<aside class="notice">
  This will fail if the customer is already confirmed.
</aside>

### HTTP Request

`POST https://api.dirtylemon.com/v1/customers/:customer_id/generate_confirmation`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Returns

Nothing.
