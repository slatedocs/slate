## List all sessions

> Example request

```shell
curl -X GET \
-H 'Authorization: Bearer <TOKEN>' \
https://api.dirtylemon.com/v1/customers/:customer_id/sessions
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.sessions.list({CUSTOMER_ID})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
[
  {
    "id": "291e01d7-8bce-4ac1-92b2-528dec50e667",
    "customer_id": "6cbda5ea-aa69-4d06-a7eb-a1656bab4e9d",
    "need_attention": false,
    "tags": [],
    "topics": [],
    "created_at": "2017-05-03T16:04:11.223Z",
    "updated_at": "2017-05-03T16:04:11.223Z"
  },
  {
    "id": "35559e1d-0dcc-4872-9b26-bdffb56aef52",
    "customer_id": "6cbda5ea-aa69-4d06-a7eb-a1656bab4e9d",
    "need_attention": true,
    "tags": [
      "detox"
    ],
    "topics": [
      "product",
      "shipping"
    ],
    "created_at": "2017-05-05T13:14:33.959Z",
    "updated_at": "2017-05-05T13:20:26.066Z"
  }
]
```

This endpoint lists all sessions for a given customer. Objects are ordered by `created_at` ascending.

### HTTP Request

`GET https://api.dirtylemon.com/v1/customers/:customer_id/sessions?limit=100`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Query params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| limit | no | Default to 100 |


### Returns

A collection of sessions.
