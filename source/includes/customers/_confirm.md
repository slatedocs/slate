## Confirm a customer

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "confirmation_token": "123456"
}' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}/confirm
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.customers.confirm({CUSTOMER_ID}, {
  confirmation_token: '123456'
})
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
  "id": "32139dfd-87c3-4552-8e91-0d9de718bff6",
  "phone_number": "+14185810827",
  "unconfirmed_phone_number": "+14185810827",
  "country_code": "CA",
  "email": null,
  "first_name": null,
  "last_name": null,
  "confirmation_token": "152200",
  "billing_address_url": null,
  "shipping_address_url": null,
  "card_url": null,
  "confirmed_at": "2017-04-14T18:53:59.246Z",
  "confirmation_sent_at": null,
  "created_at": "2017-04-14T18:48:52.367Z",
  "updated_at": "2017-04-14T18:53:59.253Z"
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
