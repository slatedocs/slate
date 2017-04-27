# Addresses

## Address object

> Example object

```json
{
  "id": "0b26d7af-9500-48d0-80ae-521ff3f66708",
  "type": "ShippingAddress",
  "street1": "128 Lafayette St",
  "street2": null,
  "city": "New York",
  "state": "New York",
  "country": "US",
  "zip": "10013",
  "created_at": "2017-04-18T20:29:10.884Z",
  "updated_at": "2017-04-18T20:29:10.884Z"
}
```

| Attribute  | Type     | Description |
| ---------- | -------- | ------------|
| id          | string   | Unique identifier for the object |
| type        | string | Either `ShippingAddress` or `BillingAddress` |
| street1     | string |  |
| street2     | string |  |
| city        | string |  |
| state       | string |  |
| country     | string |  |
| zip         | string |  |
| created_at  | timestamp | Time at which the object was created |
| updated_at  | timestamp | Time at which the object was updated |


## Retrieve an address

> Example request

```shell
curl -X GET \
-H 'Authorization: Bearer <TOKEN>' \
https://api.dirtylemon.com/v1/addresses/{ADDRESS_ID}
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.addresses.retrieve({ADDRESS_ID})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "id": "0b26d7af-9500-48d0-80ae-521ff3f66708",
  "type": "ShippingAddress",
  "street1": "128 Lafayette St",
  "street2": null,
  "city": "New York",
  "state": "New York",
  "country": "US",
  "zip": "10013",
  "created_at": "2017-04-18T20:29:10.884Z",
  "updated_at": "2017-04-18T20:29:10.884Z"
}
```

This endpoint retrieves a specific address.

### HTTP Request

`GET https://api.dirtylemon.com/v1/addresses/:address_id`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| address_id | yes |  |

### Returns

An address object.


## Create an address

> Example request

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.addresses.create({CUSTOMER_ID}, {
  street1: "128 Lafayette St",
  city: "New York",
  state: "New York",
  country: "US",
  zip: "10013"
})
```

> Example response

```http
HTTP/1.1 201 CREATED
```

```json
{
  "id": "0b26d7af-9500-48d0-80ae-521ff3f66708",
  "type": "ShippingAddress",
  "street1": "128 Lafayette St",
  "street2": null,
  "city": "New York",
  "state": "New York",
  "country": "US",
  "zip": "10013",
  "created_at": "2017-04-18T20:29:10.884Z",
  "updated_at": "2017-04-18T20:29:10.884Z"
}
```

This endpoint validates, formats and creates __shipping__ and __billing__ addresses in one go for a given [customer](#customers). After, customers can always manually update both their shipping and billing addresses by accessing an ephemeral URL provided on the `customer` object.

### HTTP Request

`POST https://api.dirtylemon.com/v1/customers/:customer_id/addresses`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Body params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| street1 | yes | |
| street2 | no | |
| city | yes | |
| state | yes | |
| country | yes | |
| zip | yes | |

### Returns

An address object.


## Update an address

> Example request

```shell
curl -X PUT \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "street1": "129 Lafayette St",
  "city": "New York",
  "state": "New York",
  "country": "US",
  "zip": "10013"
}' \
https://api.dirtylemon.com/v1/addresses/{ADDRESS_ID}
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.addresses.update({ADDRESS_ID}, {
  street1: "129 Lafayette St",
  city: "New York",
  state: "New York",
  country: "US",
  zip: "10013"
})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "id": "0b26d7af-9500-48d0-80ae-521ff3f66708",
  "type": "ShippingAddress",
  "street1": "129 Lafayette St",
  "street2": null,
  "city": "New York",
  "state": "New York",
  "country": "US",
  "zip": "10013",
  "created_at": "2017-04-18T20:29:10.884Z",
  "updated_at": "2017-04-18T20:29:10.884Z"
}
```

This endpoint updates an address.

### HTTP Request

`PATCH https://api.dirtylemon.com/v1/addresses/:address_id`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| address_id | yes |  |

### Body params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| street1 | no | |
| street2 | no | |
| city | no | |
| state | no | |
| country | no | |
| zip | no | |

### Returns

An address object.


## Validate

> Example request

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.addresses.validate({
  street1: "128 Lafayette St",
  city: "New York",
  state: "New York",
  country: "US",
  zip: "10013"
})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "street1": "128 LAFAYETTE ST",
  "street2": "",
  "city": "NEW YORK",
  "state": "NY",
  "country": "US",
  "zip": "10013-3174"
}
```

This endpoint validates and normalizes an address.

### HTTP Request

`POST https://api.dirtylemon.com/v1/addresses/validate`

### Body params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| street1 | yes | |
| street2 | no | |
| city | yes | |
| state | yes | |
| country | yes | |
| zip | yes | |

### Returns

A valid address object.
