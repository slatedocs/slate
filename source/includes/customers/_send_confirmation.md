## Send a confirmation token

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}/send_confirmation
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.customers.send_confirmation({CUSTOMER_ID})
```

> Example response

```http
HTTP/1.1 204 NO CONTENT
```

This endpoint sends the current confirmation token:

  - Fires a `verification` event

On the event, the [conversational system](#) can prompt the customer for confirmation.

<aside class="notice">
  This will fail if the customer is already confirmed.
</aside>

### HTTP Request

`POST https://api.dirtylemon.com/v1/customers/:customer_id/send_confirmation`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Returns

Nothing.
