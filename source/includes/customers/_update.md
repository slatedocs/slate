## Update a customer

> Example request

```shell
curl -X PATCH \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "first_name": Elon",
  "last_name": Musk",
  "email": elon@spacex.com"
}' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.customers.update({CUSTOMER_ID}, {
  first_name: 'Elon',
  last_name: 'Musk',
  email: 'elon@spacex.com'
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
  "email": "elon@spacex.com",
  "first_name": "Elon",
  "last_name": "Musk",
  "time_zone": null,
  "unsubscribed": false,
  "billing_address": {},
  "shipping_address": {},
  "card": {},
  "billing_address_url": null,
  "shipping_address_url": null,
  "card_url": "https://api.dirtylemon.com/l/330993",
  "confirmation_token": "256120",
  "confirmed_at": null,
  "created_at": "2017-05-03T16:02:41.132Z",
  "updated_at": "2017-05-03T16:02:41.132Z"
}
```

This endpoint updates a customer.

### HTTP Request

`PATCH https://api.dirtylemon.com/v1/customers/:customer_id`

### Path params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| customer_id | yes |  |

### Body params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| first_name | no |  |
| last_name | no |  |
| email | no |  |

### Returns

A customer object.
