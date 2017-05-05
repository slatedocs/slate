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
