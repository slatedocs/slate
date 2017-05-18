## Update an address

> Example request

```shell
curl -X PATCH \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "street1": "128 Lafayette St",
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
  "id": "d1b32cdb-42aa-4ccf-91a1-6bd78fae33ec",
  "type": "ShippingAddress",
  "street1": "128 LAFAYETTE ST",
  "street2": "",
  "city": "NEW YORK",
  "state": "NY",
  "country": "US",
  "zip": "10013-3174",
  "lat": "40.7213413",
  "lng": "-74.0020398",
  "url": "https://api.dirtylemon.com/l/985a40",
  "created_at": "2017-05-16T16:15:24.899Z",
  "updated_at": "2017-05-16T16:18:07.860Z"
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


### Event

Fires a `address.updated` event with payload:

```json
{
  "id": "address_id"
}
```
