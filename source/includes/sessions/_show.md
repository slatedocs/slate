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
```

This endpoint retrieves a specific session.

### HTTP Request

`GET https://api.dirtylemon.com/v1/customers/:customer_id/sessions/:session_id`

`GET https://api.dirtylemon.com/v1/customers/:customer_id/sessions/current`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| session_id | yes | Either a session ID or `current` to get the latest session |

### Returns

An session object.
