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
  "id": "d1b32cdb-42aa-4ccf-91a1-6bd78fae33ec",
  "type": "ShippingAddress",
  "street1": "95 GRAND ST",
  "street2": "",
  "city": "NEW YORK",
  "state": "NY",
  "country": "US",
  "zip": "10013-5902",
  "lat": "40.7213413",
  "lng": "-74.0020398",
  "url": "https://api.dirtylemon.com/l/985a40",
  "created_at": "2017-05-16T16:15:24.899Z",
  "updated_at": "2017-05-16T16:15:25.868Z"
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
