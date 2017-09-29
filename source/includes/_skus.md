# SKUs

## List all SKUs

> Example request

```shell
curl -X GET \
-H 'Authorization: Bearer <TOKEN>' \
https://api.dirtylemon.com/v1/skus
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.skus.list()
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
[
  {
    "id": "868137000122",
    "price": 6500,
    "product": {
      "id": "6c5d6686-67a0-40ca-87fc-7fb72b728cd1",
      "name": "[sleep]",
      "description": "sleep"
    }
  },
  {
    "id": "868137000108",
    "price": 6500,

    "product": {
      "id": "8a51c496-3219-46ee-a80f-995bb938d974",
      "name": "[detox]",
      "description": "detox"
    }
  },
  {
    "id": "868137000115",
    "price": 6500,
    "product": {
      "id": "8e41aef8-8789-46de-972f-f50cf657088d",
      "name": "[skin+hair]",
      "description": "skin"
    }
  },
  {
    "id": "868137000139",
    "price": 5000,
    "product": {
      "id": "b5293b46-591c-4cbe-bb1b-ae8a81e6c742",
      "name": "[energy]",
      "description": "energy"
    }
  }
]
```

This endpoint lists all skus.

### HTTP Request

`GET https://api.dirtylemon.com/v1/skus`

### Returns

A collection of skus.
