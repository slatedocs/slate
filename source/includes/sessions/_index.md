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
    "id": "4bd53e57-96b7-47d1-948f-6696a8a48907",
    "customer_id": "e930e3de-d8fa-48f2-be69-0912255487c2",
    "need_attention": true,
    "tags": [
      "detox"
    ],
    "topics": [
      "product"
    ],
    "messages": [
      {
        "id": "5ede4f20-a852-4216-b360-f27cac6dda82",
        "session_id": "4bd53e57-96b7-47d1-948f-6696a8a48907",
        "content": "hi",
        "content_type": "text",
        "sender_role": "end-user",
        "sent_at": "2017-05-23T20:46:50.252Z",
        "created_at": "2017-05-23T20:46:50.265Z"
      }
    ],
    "created_at": "2017-05-23T20:46:50.242Z",
    "updated_at": "2017-05-24T18:57:06.913Z"
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
