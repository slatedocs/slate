## Update an address

> Example request

```shell
curl -X PATCH \
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
