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
