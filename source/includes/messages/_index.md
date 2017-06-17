## List all messages

> Example request

```shell
curl -X GET \
-H 'Authorization: Bearer <TOKEN>' \
https://api.dirtylemon.com/v1/customers/:customer_id/sessions/:session_id/messages
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.messages.list({SESSION_ID}, {CUSTOMER_ID})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
[
  {
    "id": "6e500324-ec66-44b4-8c0b-1d28dbeee868",
    "session_id": "35559e1d-0dcc-4872-9b26-bdffb56aef52",
    "content": "Need help?",
    "content_type": "text",
    "sender_role": "agent",
    "sent_at": "2017-05-05T13:14:34.113Z",
    "created_at": "2017-05-05T13:14:34.115Z"
  },
  {
    "id": "006b42be-2997-417f-ada5-e2d8c434f023",
    "session_id": "35559e1d-0dcc-4872-9b26-bdffb56aef52",
    "content": "Yes please",
    "content_type": "text",
    "sender_role": "end-user",
    "sent_at": "2017-05-05T13:26:41.842Z",
    "created_at": "2017-05-05T13:26:42.107Z"
  }
]
```

This endpoint lists all messages for a given session. Objects are ordered by `sent_at` descending.

### HTTP Request

`GET https://api.dirtylemon.com/v1/customers/:customer_id/sessions/:session_id/messages?limit=100`

`GET https://api.dirtylemon.com/v1/customers/:customer_id/sessions/current/messages?limit=100`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |
| session_id | yes | Session ID or `current` |

### Query params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| limit | no | Default to 100 |


### Returns

A collection of messages.
