## Create a message

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "content": "Hey",
  "content_type": "text",
  "sender_role": "agent"
}' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}/sessions/current/messages
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.messages.create({CUSTOMER_ID}, {
  content: 'Hey',
  content_type: 'text',
  sender_role: 'agent'
})
```

> Example response

```http
HTTP/1.1 201 CREATED
```

```json
{
  "id": "c11ac986-bb0f-46de-89d8-b53f14cc51fc",
  "session_id": "35559e1d-0dcc-4872-9b26-bdffb56aef52",
  "content": "Need help?",
  "content_type": "text",
  "sender_role": "agent",
  "sent_at": "2017-05-05T13:35:06.329Z",
  "created_at": "2017-05-05T13:35:06.345Z"
}
```

This endpoint creates a message:

- Notifies the [customer](#customers) of the message
- Notifies the [conversational system](...) of the message

<aside class="notice">
  Calls on this action will fail if the customer is unsubscribed.
</aside>

### HTTP Request

`POST https://api.dirtylemon.com/v1/customers/:customer_id/sessions/current/messages`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Body params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| content | yes |  |
| content_type | yes |  |
| sender_role | yes | Either `agent` or `init` |

### Returns

A message object.
