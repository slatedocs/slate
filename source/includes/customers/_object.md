## Customer object

> Example object

```json
{
  "id": "fffd7e80-1691-41f5-8946-9deeaf0b8640",
  "phone_number": "+13333333333",
  "unconfirmed_phone_number": "+13333333333",
  "country_code": "US",
  "email": "customer@example.com",
  "first_name": "Yogi",
  "last_name": "Berra",
  "confirmation_token": "123456",
  "billing_address_url": "https://api.dirtylemon.com/l/6243c9",
  "shipping_address_url": "https://api.dirtylemon.com/l/192b86",
  "card_url": "https://api.dirtylemon.com/l/0896d5",
  "confirmed_at": "2016-09-02T09:40:08.004Z",
  "confirmation_sent_at": "2016-09-02T09:40:07.004Z",
  "created_at": "2016-09-02T09:40:06.004Z",
  "updated_at": "2016-09-07T02:12:02.012Z"
}
```

| Attribute  | Type     | Description |
| ---------- | -------- | ------------|
| id                       | string   | Unique identifier for the object |
| phone_number             | string |  |
| unconfirmed_phone_number | string |  |
| country_code             | string | The phone number's ISO 3166 country code |
| email                    | string |  |
| first_name               | string |  |
| last_name                | string |  |
| confirmation_token       | string |  |
| billing_address_url      | string | Ephemeral url allowing the user to edit his billing address with a form |
| shipping_address_url     | string | Ephemeral url allowing the user to edit his shipping address with a form |
| card_url                 | string | Ephemeral url allowing the user to edit his credit card with a form |
| confirmed_at             | timestamp | Time at which the phone number was confirmed |
| confirmation_sent_at     | timestamp | Time at which the confirmation token was sent to the unconfirmed phone number |
| created_at               | timestamp | Time at which the object was created |
| updated_at               | timestamp | Time at which the object was updated |
