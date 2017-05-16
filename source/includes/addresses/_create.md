## Create an address

> Example request

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.addresses.create({CUSTOMER_ID}, {
  street1: "95 Grand St",
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
