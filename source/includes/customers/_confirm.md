## Confirm a customer

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "confirmation_token": "256120"
}' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}/confirm
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.customers.confirm({CUSTOMER_ID}, {
  confirmation_token: '256120'
})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "id": "6cbda5ea-aa69-4d06-a7eb-a1656bab4e9d",
  "phone_number": "+14185800893",
  "country_code": "CA",
  "email": "dionne.phil@gmail.com",
  "first_name": "Philippe",
  "last_name": "Dionne",
  "time_zone": null,
  "unsubscribed": false,
  "billing_address": {},
  "shipping_address": {},
  "card": {},
  "billing_address_url": null,
  "shipping_address_url": null,
  "card_url": "https://api.dirtylemon.com/l/330993",
  "confirmation_token": "256120",
  "confirmed_at": "2017-05-03T16:02:42.132Z",
  "created_at": "2017-05-03T16:02:41.132Z",
  "updated_at": "2017-05-03T16:02:42.132Z"
}
```

This endpoint confirms a customer's phone number:

  - Promotes the customer's `unconfirmed_phone_number` to `phone_number`
  - Fires a `verification` event

<aside class="notice">
  This will fail if the customer is already confirmed.
</aside>

### HTTP Request

`POST https://api.dirtylemon.com/v1/customers/:customer_id/confirm`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Body params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| confirmation_token | yes | Token generated on customer creation |

### Returns

A customer object.
