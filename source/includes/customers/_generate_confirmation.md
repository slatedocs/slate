## Generate a confirmation token

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}/generate_confirmation
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.customers.generate_confirmation({CUSTOMER_ID})
```

> Example response

```http
HTTP/1.1 201 CREATED
```

This endpoint generates a new confirmation token.

Allows to handle situations when a customer fails to confirm his phone number in the allowed time window.

<aside class="notice">
  <ul>
    <li>This will fail if the customer is already confirmed.</li>
    <li>This will fail if the customer doesn't have an `unconfirmed_phone_number`</li>
  </ul>
</aside>

### HTTP Request

`POST https://api.dirtylemon.com/v1/customers/:customer_id/generate_confirmation`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Returns

Nothing.
