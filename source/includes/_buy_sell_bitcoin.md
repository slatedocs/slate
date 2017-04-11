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

## Buy bitcoin
> `POST https://domain.com/buy_currency/1.0/json`

```
Code request response example
```

```json
{
  "jsonrpc": "2.0",
  "id": null,
  "result": {
    "status": "success",
    "timestamp": "2017-03-22 13:00:16",
    "method": "email",
    "code_id": 358,
    "time": 300000
  }
}
```

```
Successful charge response example
```

```json
{
  "jsonrpc": "2.0",
  "id": null,
  "result": {
    "status": "success"
  }
}
```

```
Unsuccessful charge response example
```

```json
{
  "jsonrpc": "2.0",
  "id": null,
  "result": {
    "status": "error",
    "message": "Something went wrong"
  }
}
```

If user selects saved card or wallet on first request server sends code_id, time in milliseconds to enter pincode and timestamp to enter pin code received in email or as sms.

Request should have either payment_id, either details of a new card (card_number, cardholder_name, expiration_date, cvc).

If user received code to confirm transaction in new request there should be code and code_id arguments specified.

### HTTP Request
`POST /buy_currency/1.0/json`

### Arguments

Parameter | Type | Required | Description
--------- | ----------- | ----------- | -----------
buy_amount | string | Required | amount of BTC to buy
deposit_amount | string | Required | amount of EUR to deposit
payment_id | string | Optional | id of selected payment source in dropdown
account_id | string | Required | id of account to deposit bought currency
save_card | boolean | Optional | mark to save specified card details and its reference
code_id | string | | code id reference to verify
code | string | | code to verify and confirm transaction
cvc | string | | CVV code for charging card
card_number | string | | Card number to charge
cardholder_name | string | | Cardholder name of charging card
expiration_date | string | | Expiration date of charging card in format MM/YY, where MM - is month and YY is year

## Get selling currency rates
> `POST https://domain.com/utils/get_sell_currencies/1.0/json`

Get selling currency rates.
Returns similar response to getting normal currencies but returns actual rate to sell currency.


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

## Sell bitcoin
> `POST https://domain.com/sell_currency/1.0/json`

```
Code request response example
```

```json
{
  "jsonrpc": "2.0",
  "id": null,
  "result": {
    "status": "success",
    "timestamp": "2017-03-22 13:00:16",
    "method": "email",
    "code_id": 358,
    "time": 300000
  }
}
```

```
Successful charge response example
```

```json
{
  "jsonrpc": "2.0",
  "id": null,
  "result": {
    "status": "success"
  }
}
```

```
Unsuccessful charge response example
```

```json
{
  "jsonrpc": "2.0",
  "id": null,
  "result": {
    "status": "error",
    "message": "Something went wrong"
  }
}
```

On first request server sends code_id, time in milliseconds to enter pincode and timestamp to enter pin code received in email or as sms.

If user received code to confirm transaction in new request there should be code and code_id arguments specified.

### HTTP Request
`POST /sell_currency/1.0/json`

### Arguments

Parameter | Type | Required | Description
--------- | ----------- | ----------- | -----------
sell_sum | string | Required | amount of BTC to sell
buy_sum | string | Required | amount of EUR to buy
debit_from | string | Required | id of account to credit BTC from
deposit_to | string | Required | id of account to deposit EUR to
code_id | string | | code id reference to verify
code | string | | code to verify and confirm transaction
