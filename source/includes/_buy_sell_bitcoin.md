# Buy and sell currency

## Get available buy and sell limit
> `POST https://domain.com/btc/get_buy_limit/1.0/json`

Get user available limit to buy and sell currency

```
Response example
```

```json
{
  "id": null,
  "jsonrpc": "2.0",
  "result": {
    "status": "success",
    "limit": 300,
    "currency": "EUR"
  }
}
```

## Get buying currency rates
> `POST https://domain.com/utils/get_buy_currencies/1.0/json`

Get buying currency rates.
Returns similar response to getting normal currencies but returns actual rate to buy currency.


```
Response example
```

```json
{
    "id": null,
    "jsonrpc": "2.0",
    "result": [
        {
            "data-custom-class": "_btc",
            "name": "BTC",
            "rate": 0.000903674686878194,
            "symbol": "\u0243",
            "symbol-pos": "after",
            "value": "btc"
        },
        {
            "data-custom-class": "_eur",
            "name": "EUR",
            "rate": 1,
            "symbol": "\u20ac",
            "symbol-pos": "after",
            "value": "eur"
        }
    ]
}
```
