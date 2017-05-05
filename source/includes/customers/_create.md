## Create a customer

> Example request

```shell
curl -X POST \
-H 'Authorization: Bearer <TOKEN>' \
-H 'Content-Type: application/json' \
-d '{
  "unconfirmed_phone_number": "1 333-333-333"
}' \
https://api.dirtylemon.com/v1/customers/{CUSTOMER_ID}
```

```javascript
const dirtylemon = require('dirtylemon');

dirtylemon.customers.create({
  unconfirmed_phone_number: "+14185800893",
  first_name: "Philippe",
  last_name: "Dionne",
  email: "dionne.phil@gmail.com"
})
```

> Example response

```http
HTTP/1.1 201 CREATED
```

```json
{
  "id": "6cbda5ea-aa69-4d06-a7eb-a1656bab4e9d",
  "unconfirmed_phone_number": "+14185800893",
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
  "confirmed_at": null,
  "created_at": "2017-05-03T16:02:41.132Z",
  "updated_at": "2017-05-03T16:02:41.132Z"
}
```

With `confirmation`:

  - Creates an __unconfirmed__ customer
  - Fires a `verification` event

Without `confirmation`:

  - Creates a __confirmed__ customer


### HTTP Request

`POST https://api.dirtylemon.com/v1/customers`

### Body params

| Parameter | Required | Description |
| --------- | -------- | ------------|
| confirmation | no | Wether or not to perform the confirmation flow. Default to `true` |
| unconfirmed_phone_number | yes | Unique phone number |
| first_name | no |  |
| last_name | no |  |
| email | no |  |

### Returns

A customer object.
