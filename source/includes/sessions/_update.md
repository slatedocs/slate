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
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}/sessions/current
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.sessions.update({CUSTOMER_ID}, {
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

`PATCH https://api.dirtylemon.com/v1/customers/:customer_id/sessions/current`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Body params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| need_attention | false | |
| tags           | false | Array of tags. Will erase existing values. |
| topics         | false | Array of topics. Will erase existing values. |

### Returns

A session object.
