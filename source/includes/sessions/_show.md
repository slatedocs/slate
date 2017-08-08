## Retrieve a session

> Example request

```shell
curl -X GET \
-H 'Authorization: Bearer <TOKEN>' \
https://api.dirtylemon.com/v1/customers/:customer_id/sessions/{SESSION_ID}
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.sessions.retrieve({CUSTOMER_ID}, {SESSION_ID})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "id": "7cb0a876-5d34-4e03-b725-932606041626",
  "customer_id": "d78c6a9e-ff0a-4fd6-b1cc-d2a31cc002d5",
  "need_attention": true,
  "tags": [
    "detox"
  ],
  "topics": [
    "product"
  ],
  "messages": [
    {
      "id": "4bada73e-14f2-4306-9752-51b4008251a4",
      "session_id": "7cb0a876-5d34-4e03-b725-932606041626",
      "content": "Need help?",
      "content_type": "text",
      "sender_role": "agent",
      "sent_at": "2017-05-24T19:32:54.060Z",
      "created_at": "2017-05-24T19:32:54.062Z"
    }
  ],
  "created_at": "2017-05-24T19:32:54.048Z",
  "updated_at": "2017-05-24T20:00:00.929Z"
}
```

This endpoint retrieves a specific session. Messages are ordered by `sent_at` ascending.

### HTTP Request

`GET https://api.dirtylemon.com/v1/customers/:customer_id/sessions/:session_id`

`GET https://api.dirtylemon.com/v1/customers/:customer_id/sessions/current`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| session_id | yes | Either a session ID or `current` to get the latest session |

### Returns

An session object.
