# Currency

## Get all Currencies

```shell
curl "http://example.com/api/currency/"
  -H "Authorization: Bearer <TOKEN>"
```

> The above command returns JSON structured like this:

```json
{
  "status_code": 200,
  "message": "Success",
  "body": [
    {
      "id": 1,
      "currency_name": "US Dollar",
      "code": "USD",
      "currency_symbol": "$",
      "image": "http://www.imageurl.com/xonio/crypto/usd.png"
    },
    {
      "id": 2,
      "currency_name": "Bitcoin",
      "code": "BTC",
      "currency_symbol": "",
      "image": "http://www.imageurl.com/xonio/crypto/btc.png"
    }
  ]
}
```

This endpoint retrieves all currencies.

### HTTP Request

`GET http://example.com/api/currency/`

<aside class="success">
200 - Success
</aside>
<aside class="warning">
401 - Unauthorized
</aside>

## Get Rates

<aside class="info">
Default base currency is PHP and base value is 1.
</aside>

```shell
curl "http://example.com/api/currency/rates"
  -H "Authorization: Bearer <TOKEN>"
```

> The above command returns JSON structured like this:

```json
{
  "status_code": 200,
  "message": "Success",
  "body": {
    "date": "@D:2015-12-10T12:34:56",
    "rates": [{
      "id": 1,
      "currency_name": "US Dollar",
      "short_name": "USD",
      "currency_symbol": "$",
      "value": 50.20,
    },
    {
      "id": 2,
      "currency_name": "Bitcoin",
      "short_name": "BTC",
      "currency_symbol": "",
      "value": 0.0000000000531,
    }]
  }
}
```

This endpoint retrieves all currency rates.

### HTTP Request

`GET http://example.com/api/currency/rates`

### URL Parameters

Parameter       | Data Type | Description
----------------|-----------|--------------
code            | String    | The code of the base currency
from            | Double    | The value of the base currency to be converted

<aside class="success">
200 - Success
</aside>
<aside class="warning">
401 - Unauthorized
</aside>