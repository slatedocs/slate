# Coupons

## List all coupons

> Example request

```shell
curl -X GET \
-H 'Authorization: Bearer <TOKEN>' \
https://api.dirtylemon.com/v1/coupons
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.coupons.list()
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
[
  "100%OFF",
  "75%OFF",
  "50%OFF",
  "33%OFF",
  "25%OFF"
]
```

This endpoint lists all coupons.

### HTTP Request

`GET https://api.dirtylemon.com/v1/coupons`

### Returns

A collection of coupons.
