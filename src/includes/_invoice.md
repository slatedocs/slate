
# Invoice

The `/v1/invoice` endpoint provides the data that can be used to show the pricing
of a rental. Each rental will reference exactly one invoice.  

## Get An Invoice

```shell
curl "https://platform.tier-services.io/v1/invoice/4a35a1bd-fa1a-4b56-ab8d-4b93a2f7534b"
  -H "x-api-key: TIER API KEY"
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "4a35a1bd-fa1a-4b56-ab8d-4b93a2f7534b",
    "type": "invoice",
    "attributes": {
      "invoice_number": "DE-PARTNER-2019-01-01",
      "positions": [
        {
          "gross": {
            "amount": "1.00",
            "currency": "EUR"
          }, 
          "net": {
            "amount": "0.84",
            "currency": "EUR"
          },
          "description":  "UNLOCK_FEE"
        },
        {
          "gross": {
            "amount": "0.38",
            "currency": "EUR"
          }, 
          "net": {
            "amount": "0.45",
            "currency":  "EUR"
          },
          "description":  "RENTAL"
        }
      ],
      "vat_percentage": "19.00",
      "total": {
        "net": {
          "amount": "1.22",
          "currency": "EUR"
        }, 
        "vat": {
          "amount": "0.23",
          "currency":  "EUR"
        },
        "gross": {
          "amount": "1.45",
          "currency": "EUR"
        }
      }
    }
  }
}
```
After having ended a rental, the invoice id will be attached to the rental. This
id can then be used to retrieve the invoice

`GET https://platform.tier-services.io/v1/invoice/<invoice-id>`

## Payment-Specific error codes

>The command

```json
{
  "method": "PATCH",
  "path": "/api/customer/abcdefg123456",
  "headers": {
    "Authorization": "Token samson",
    "Content-Type": "application/json"
  },
  "body": {
    "stripeSourceToken": "invalid_token"
  }
}
```
>returns a JSON structured like this if **the stripe token is invalid**:

```json
 "body": {
    "errors": [
      {
        "code": "InvalidPaymentMethod",
        "title": "Invalid payment method",
        "status": "400"
      }
    ]
  }
}
```

The Tier API uses the following invoice-specific error codes:

Error Code | Meaning
---------- | -------
404 | Not Found -- the invoice could not be found
