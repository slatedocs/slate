# Addresses

## Validate

```js
const dirtylemon = require('dirtylemon');

dirtylemon.addresses.validate({
  street1: '60 Crémazie Ouest',
  street2: 'Apt. 2',
  city: 'Quebec',
  state: 'Quebec',
  country: 'Canada',
  zip: 'G1R 1X3',
})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{}
```

This endpoint validates an address.

### HTTP Request

`POST https://api.dirtylemon.com/v1/addresses/validate`

### Arguments

| Parameter | Required | Description |
| --------- | -------- | ------------|
| name | no | |
| company | no | |
| phone | no | |
| email | no | |
| street1 | yes | |
| street2 | yes | |
| street3 | no | |
| city | yes | |
| state | yes | |
| country | yes | |
| zip | yes | |

### Returns

A valid address object.
