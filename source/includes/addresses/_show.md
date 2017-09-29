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
  "id": "4530fad5-c939-4a59-be3a-9467c1b389bf",
  "type": "ShippingAddress",
  "street1": "128 LAFAYETTE ST",
  "street2": "",
  "city": "NEW YORK",
  "state": "NY",
  "country": "US",
  "zip": "10013-3174",
  "lat": "40.7213413",
  "lng": "-74.0020399",
  "url": "http://localhost:5000/l/1cb4d262",
  "created_at": "2017-08-08T13:50:47.881Z",
  "updated_at": "2017-08-08T14:14:20.390Z"
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
