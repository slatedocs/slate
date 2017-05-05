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
