# Currencies

Currencies are provided and available to load from our system, if a currency is missing please let us know so we can add it.

Besides the normal (fiat) currencies we have now also added some common cryptocurrencies.

Note: ISO 4217 unique currency codes are used as `id` fields of currencies to simlify inclusion as related IDs in documents.

## Get all Currencies

```shell
curl "https://api.spaceinvoices.com/v1/currencies" \
  -H "Authorization: TOKEN"
```
```javascript
```

> Returns:

```json
[
  {
    "id": "EUR",
    "name": "European Union Euro",
    "symbol": "€",
    "type": "fiat"
  },
  {
    "id": "USD",
    "name": "United States Dollar",
    "symbol": "$",
    "type": "fiat"
  },
  {
    "id": "BTC",
    "name": "Bitcoin",
    "symbol": "₿",
    "type": "crypto"
  },
  {
    "id": "ETH",
    "name": "Ether",
    "symbol": "‎Ξ",
    "type": "crypto"
  }
]
```

This endpoint retrieves all Currencies.

### HTTP Request

`GET https://api.spaceinvoices.com/v1/currencies`

### HTTP Response

#### Arguments

|      |     |
| ---: | --- |
| id | Unique ISO 4217 currency ID of model instance |
| name | Name of Currency. |
| symbol | Symbol of currency if available otherwise same as ID. |
| type | Type of currencie. _Either `fiat` or `crypto`_ |
