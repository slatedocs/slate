## Create a message

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "content": "Hey",
  "content_type": "text",
  "sender_role": "bot"
}' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}/sessions/current/messages
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.messages.create({CUSTOMER_ID}, {
  content: 'Hey',
  content_type: 'text',
  sender_role: 'bot'
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
  "sender_role": "bot",
  "sent_at": "2017-05-05T13:35:06.329Z",
  "created_at": "2017-05-05T13:35:06.345Z"
}
```

This endpoint creates a message.

<aside class="notice">
  <ul>
    <li>This will fail if the customer is unsubscribed.</li>
    <li>This will fail if the customer doesn't have a `phone_number` or `unconfirmed_phone_number`</li>
  </ul>
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
| content_type | yes | Only `text` is accepted |
| sender_role | yes |  |

### Returns

A message object.
