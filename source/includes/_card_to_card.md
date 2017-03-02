# Create card to card transfer
> `POST https://domain.com/card2card/new/1.0/json`

Charges users card / wallet and creates order for sending money to recipient card
If no source_id specified, fields card_number, cardholder_name, expiration_date and cvv should be specified.
Likewise, if no recipient_id is specified, recipient_country_id, recipient_card_number, recipient_email, recipient_cardholder_name should be specified.

### HTTP Request
`POST https://domain.com/card2card/new/1.0/json`

### Arguments

Parameter | Type | Required | Description
--------- | ----------- | ----------- | -----------
from_sum | number | Required | sum to charge
to_sum | number | Required | sum to send
to_sum_currency | number | Required | sending sum currency id
source_id | string | Optional | id of existing card or wallet
card_number | string | Optional | payment card number
cardholder_name | string | Optional | payment card cardholder name
expiration_date | string | Optional | payment card expiration date
cvv | string | Optional | payment card cvv
save_card_data | boolean | Optional | should card details be saved to partner
recipient_id | string | Optional | id of existing card to card transfer
recipient_country_id | string | Optional | id of recipient country
recipient_card_number | string | Optional | recipient card number
recipient_email | string | Optional | recipient email address
recipient_phone | string | Optional | recipient phone number
recipient_cardholder_name | string | Optional | recipient cardholder name
save_recipient_details | string | Optional | should recipient details be saved to partner

# Search card to card transfers
> `POST https://domain.com/card2card/search/1.0/json`

```
Successful search response
```

```json
[
  {
    "id": null,
    "jsonrpc": "2.0",
    "result": [
      {
        "cardholder_name": "Petr Ivanov",
        "card_number": "1234 **** **** 4321",
        "country_code": "ES",
        "email": "user@email.com"
      },
      {
        "cardholder_name": "Ivan Petrov",
        "card_number": "4444 **** **** 8888",
        "country_code": "RU",
        "email": "user2@email.com"
      }
    ]
  }
]
```

Searches for current user previous card to card transfers by following fields:
- cardholder name
- card number
- email

Returns array of card to card recipients or empty array.

### HTTP Request
`POST https://domain.com/card2card/search/1.0/json`

### Arguments

Parameter | Type | Required | Description
--------- | ----------- | ----------- | -----------
query | string | Required | cardholder name, card number or email
