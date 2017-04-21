# Addresses

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
  "street1": "128 Lafayette St",
  "street2": null,
  "city": "New York",
  "state": "New York",
  "country": "US",
  "zip": "10013",
  "created_at": "2017-04-07T13:37:52.677Z",
  "updated_at": "2017-04-07T13:37:52.677Z"
}
```

This endpoint creates __shipping__ and __billing__ addresses in one go for a given [customer](#customers). After, customers can always manually update both their shipping and billing addresses by accessing an ephemeral URL provided on the `customer` object.

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
