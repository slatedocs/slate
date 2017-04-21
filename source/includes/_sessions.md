# Sessions

## Session object

> Example object

```json
{
  "id": "10125e23-3ad9-46bc-a4c1-e1e8e1a79d16",
  "customer_id": "fffd7e80-1691-41f5-8946-9deeaf0b8640",
  "need_attention": true,
  "tags": [
    "mobile"
  ],
  "topics": [
    "sleep",
    "skin+hair"
  ],
  "created_at": "2017-04-21T14:38:59.691Z",
  "updated_at": "2017-04-21T18:10:51.475Z"
}
```

| Attribute  | Type     | Description |
| ---------- | -------- | ------------|
| id           | string   | Unique identifier for the object |
| customer_id  | string   | Unique identifier for the associated customer |
| need_attention | boolean | Wether the customer needs human attention or not |
| tags         | array   | Custom tags |
| topics       | array   | Custom topics |
| created_at   | timestamp | Time at which the object was created |
| updated_at   | timestamp | Time at which the object was updated |

## Update a session

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "need_attention": true,
  "tags": ["mobile"],
  "topics": ["sleep", "skin+hair"]
}' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}/sessions/{SESSION_ID}
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.messages.create({CUSTOMER_ID}, {SESSION_ID}, {
  need_attention: true,
  tags: ["mobile"],
  topics: ["sleep", "skin+hair"]
})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "id": "10125e23-3ad9-46bc-a4c1-e1e8e1a79d16",
  "customer_id": "fffd7e80-1691-41f5-8946-9deeaf0b8640",
  "need_attention": true,
  "tags": [
    "mobile"
  ],
  "topics": [
    "sleep",
    "skin+hair"
  ],
  "created_at": "2017-04-21T14:38:59.691Z",
  "updated_at": "2017-04-21T18:10:51.475Z"
}
```

This endpoint updates a session.

Updating the `need_attention` attribute to `true`:

  - Pauses the [conversational system](#)
  - Allows a human agent to send messages
  - Notifies a human agent to take action

Updating the `need_attention` attribute to `false`:

  - Resumes the conversational system
  - Disallow a human agent to send messages

<aside class="notice">
  At least one <a href="#messages">message</a>  must have been created for the given customer before attempting to update a session.
</aside>




### HTTP Request

`PATCH https://api.dirtylemon.com/v1/customers/:customer_id/sessions/:session_id/messages`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |
| session_id | yes | Only `current` is accepted. |

### Body params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| need_attention | false | |
| tags           | false | Array of tags. Will erase existing values. |
| topics         | false | Array of topics. Will erase existing values. |

### Returns

A session object.
