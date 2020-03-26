---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - python

search: true
---

# Introduction
Welcome to the FalconX API documentation. The APIs provide developers programmatic access to FalconX services. In case of any questions please contact `support@falconx.io`

# Request For Quote (RFQ)
RFQ process involves the client sending details about the token pair they want to trade along with the quantity. FalconX RFQ API returns the price at which client can buy or sell the requested quantity in the requested token pair. The quote is valid only for a short period of time. If the client accepts the quote before it expires and FalconX sends a confirmation then the trade is considered closed.

# Trading Fees
Please reach out to your Relationship Manager to get a custom fee structure, based on your notional monthly traded volume. 


# Requests
All requests and responses are `application/json` content type and follow typical HTTP response status codes for success and failure.

## API Endpoint
* All HTTP requests must be sent to: `https://api.falconx.io/v1`

### Success
A successful response is indicated by HTTP status code 200 and may contain an optional body. If the response has a body it will be documented under each resource below.

### Common HTTP error codes

| Status Code | Reason |
| ----------- | ------ |
| 400         | Bad Request – Invalid request format|
| 401         | Unauthorized – Invalid API Key|
| 403         | Forbidden – You do not have access to the requested resource|
| 404         | Resource Not Found|
| 500         | Internal Server Error – We had a problem with our server|

### FalconX API Errors
| Error Code | Reason |
| ---------- | ------ |
| ZERO_QUANTITY_t | You cannot request a quantity of zero. |
| TRADING_DISABLED | All trading has been disabled at FalconX at this time and we are not currently accepting quote or execution requests. |
| QUOTE_NOT_AVAILABLE | Our partners were unable to provide a quote. |
| PARTNER_FAILURE | Our partners failed to return a quote. |
| THIN_ORDERBOOK | Our partners' orderbooks were too thin to provide you a quote. |
| MAX_USD_SIZE_LIMIT | You have surpassed the maximum value in USD for which we can provide a quote at this time. |
| PARTNER_TIMEOUT | The request to our partners timed out. |
| INTERNAL_ERROR | Our internal server returned an error. |
| QUANTITY_TOO_SMALL | The quantity you requested is below our platform's minimum trading limit. |
| QUANTITY_TOO_BIG | The quantity you requested is above our platform's maximum trading limit. |
| QUOTE_EXPIRED | The trade was not executed because the quote expired. |
| ACCOUNT_DISABLED | Your account has not yet been approved for trading. |
| ACCOUNT_READ_ONLY | Your account has read-only permission, but does not have permission to trade. |
| INVALID_QUOTE_ID | The given quote ID is invalid. |
| INSUFFICIENT_BALANCE | You do not have sufficient balance to execute this trade. |
| RETRY_ERROR | You cannot execute the same quote twice. The provided quote is under process or already executed. |
| PERMISSION_DENIED | You have insufficient permission to access the quote. |
| MARKET_NOT_ALLOWED | You do not have access to the requested market. |
| MIN_TRADE_LIMIT_BREACH | The trade was not executed because the quantity you requested is less than the minimum allowed. |
| MAX_TRADE_LIMIT_BREACH | The trade was not executed because the quantity you requested is greater than the maximum allowed. |
| MIN_QUOTE_LIMIT_BREACH | Requested quote size is less than the minimum allowed. |
| MAX_QUOTE_LIMIT_BREACH | Requested quote size is greater than the minimum allowed. |
| NO_QUALIFIED_LIQUIDITY_VENUES_AVAILABLE | No qualified liquidity venues were available to serve your quote. |
| TRADE_NOT_FILLED | Your trade was not executed. |
| MAX_NET_BREACHED | Your trade was not executed because you hit your max net outstanding limit. |
| MAX_GROSS_BREACHED | Your trade was not executed because you hit your max gross outstanding limit. |
| QUOTE_EXPIRED_MARKET_VOLATILITY | Your trade was not executed because the quote expired early due to market volatility. |
| UNAUTHORIZED | You are not authorized to access this resource. |
| NO_VALID_EXECUTABLE_QUOTE | Your trade was not executed because it was no longer a valid executable quote. The quote was expired early due to market volatility. |
| EXECUTION_PENDING | Trade execution is in progress. |
| PER_SECOND_RATE_LIMIT | Number of requests per second exceeded the per second rate limit. |
| PER_MINUTE_RATE_LIMIT | Number of requests per minute exceeded the per minute rate limit. |
| PER_HOUR_RATE_LIMIT | Number of requests per hour exceeded the per hour rate limit. |
| API_KEY_DISABLED | Your API Key is pending approval by FalconX. |
| REQUEST_IP_RESTRICTED | Your IP is not whitelisted to access our APIs. |
| WHITELISTED_API_ENDPOINT | Your account does not have access to this endpoint. |
| INVALID_DATE_FORMAT | The input requires an ISO date format. |
| INSUFFICIENT_PARAMETERS_PROVIDED | The number of parameters provided are insufficient. |
| START_DATE_AFTER_END_DATE | The start date cannot be after end date. |
| INSUFFICIENT_BALANCE_TO_WITHDRAW | Withdrawal balance should be less than or equal to the balance in account. |
| INVALID_WITHDRAWAL_AMOUNT | Requested withdrawal amount is invalid. |
| QUOTE_STATUS_NOT_SUCCESS | The quote was not selected for execution because the quote failed. |
| SYNTHETIC_QUOTE | The quote was not selected for execution because it is a synthetic quote. |
| QUOTE_EXPIRED_FOR_SIDE | The quote was not selected for execution because it was expired for the side being executed. |
| VENUE_DISABLED_FOR_SIDE | The quote was not selected for execution because venue was disabled for the side being executed. |

# Authentication

## Generating an API Key

Once you are signed up on FalconX, our customer success team will generate an API key for you. After generating the key you will have the following information which will be required for making any API request:

* `api_key`
* `secret_key`
* `passphrase`

<!-- FalconX generates `key` and `secret` for you but you'll need to choose `passphrase` to further secure your API calls. FalconX only stores the salted hash of your passphrase for
verification. We won't be able to recover your passphrase if lost. -->

## Creating a Request

``` python
# python version: v3.6.7
#
# Requires python-requests. Install with pip:
#
#   pip3 install requests==2.20.0
#
# or, with easy-install:
#
#   easy_install requests==2.20.0

import json, hmac, hashlib, time, requests, base64
from requests.auth import AuthBase

# Create custom authentication for RFQ
class FXRfqAuth(AuthBase):
    def __init__(self, api_key, secret_key, passphrase):
        self.api_key = api_key
        self.secret_key = secret_key
        self.passphrase = passphrase

    def __call__(self, request):
        timestamp = str(time.time())
        request_body = request.body.decode() if request.body else ''
        message = timestamp + request.method + request.path_url + request_body
        hmac_key = base64.b64decode(self.secret_key)
        signature = hmac.new(hmac_key, message.encode(), hashlib.sha256)
        signature_b64 = base64.b64encode(signature.digest())

        request.headers.update({
            'FX-ACCESS-SIGN': signature_b64,
            'FX-ACCESS-TIMESTAMP': timestamp,
            'FX-ACCESS-KEY': self.api_key,
            'FX-ACCESS-PASSPHRASE': self.passphrase,
            'Content-Type': 'application/json'
        })
        return request


api_url = 'https://api.falconx.io/v1/'
auth = FXRfqAuth(API_KEY, API_SECRET, API_PASS)

# Get Quote
params = {
    'token_pair': {
      'base_token': 'BTC',
      'quote_token': 'USD'
    },
    'quantity': {
      'token': 'BTC',
      'value': 10
    },
    'side': 'buy'
}

r = requests.post(api_url + 'quotes', json=params, auth=auth)
print(r.json())
# {"status": "success", "fx_quote_id": "00c884b056f949338788dfb59e495377"...}
```

All REST API requests must contain the following headers:

* `FX-ACCESS-KEY`: The API key as a string
* `FX-ACCESS-SIGN`: The base64-encoded signature (see [Signing a Message](#signing-a-message))
* `FX-ACCESS-TIMESTAMP`: The timestamp in seconds from epoch
* `FX-ACCESS-PASSPHRASE`: The passphrase given to you

All request bodies should have content type `application/json` and should be a valid JSON.

## Signing a Message
The `FX-ACCESS-SIGN` header is generated by creating a sha256 HMAC using the base64-decoded secret key on the prehash string `timestamp + method + requestPath + body` (where + represents string concatenation) and base64-encode the output. The timestamp value is the same as the `FX-ACCESS-TIMESTAMP` header.

The `body` is the request body string or omitted if there is no request body (typically for GET requests).

The `method` should be UPPER CASE.

Remember to first base64-decode the alphanumeric secret string (resulting in 64 bytes) before using it as the key for HMAC. Also, base64-encode the digest output before sending in the header.


## Selecting a Timestamp
The `FX-ACCESS-TIMESTAMP` header must be number of seconds since Unix Epoch in UTC. Decimal values are allowed.

Your timestamp must be within 30 seconds of the API service time or your request will be considered expired and rejected.


# Get Token Pairs

Get the list of all token pairs currently supported.

## HTTP Request

> Request Sample

```shell
# substitute placeholders with correct authorization header values
curl -X GET "https://api.falconx.io/v1/pairs" \
      -H "FX-ACCESS-SIGN: <signature>" \
      -H "FX-ACCESS-TIMESTAMP: <timestamp>" \
      -H "FX-ACCESS-KEY: <api_key>" \
      -H "FX-ACCESS-PASSPHRASE: <passphrase>" \
      -H "Content-Type: application/json"
```

`GET https://api.falconx.io/v1/pairs`



## Response Parameters

> Response Sample

```json
[
  {
    "base_token": "BTC",
    "quote_token": "USD"
  },
  {
    "base_token": "ETH",
    "quote_token": "USD"
  }
]
```

API will return a list of [Token Pair](#token-pair) JSON structure.

<!--
| Parameter     | Type                              | Description |
| ---------     | ------------------------------    | ------------|
| **base_token**        | STRING                            | Base Token
| **quote_token**   | STRING                            |  Quote Token
-->

# Get Quote

Client sends request to get quote to this endpoint. The response contains the timestamp until which the quote is valid. Only a valid quote can be executed.

## HTTP Request
`POST https://api.falconx.io/v1/quotes`

## Request Body

> Request Sample

```json
{
  "token_pair": {
    "base_token": "BTC",
    "quote_token": "USD"
  },
  "quantity": {
    "token": "BTC",
    "value": "10"
  },
  "side": "buy"
}
```


| Parameter  | Type                                | Description |
| ---------  | ----------------------------------- | ------------|
| **token_pair** | JSON                                | Token pair for which the client is requesting quote (See [Token Pair](#token-pair)) |
| **quantity**   | JSON                                | Requested quantity upto 3 decimal places (See [Quantity](#quantity)) |
| **side**       | STRING                              | Side of quote. Possible values: `buy`, `sell` or `two_way`


## Response Parameters

> Response Sample

```json
{
  "status": "success",
  "fx_quote_id": "00c884b056f949338788dfb59e495377",
  "buy_price": 12650,
  "sell_price": null,
  "token_pair": {
    "base_token": "BTC",
    "quote_token": "USD"
  },
  "quantity_requested": {
    "token": "BTC",
    "value": "10"
  },
  "side_requested": "buy",
  "t_quote": "2019-06-27T11:59:21.875725+00:00",
  "t_expiry": "2019-06-27T11:59:22.875725+00:00",
  "is_filled": false,
  "fee_bps": 5,
  "side_executed": null,
  "error": null
}
```


| Parameter     | Type                              | Description |
| ---------     | ------------------------------    | ------------|
| **status**        | STRING                            | Status of the response. Possible values: `success` or `failure`|
| **fx_quote_id**   | STRING                            | FalconX Quote ID. Use this when executing quote
| **buy_price**   | DECIMAL                            | Buy price in quote token
| **sell_price**   | DECIMAL                            | Sell price in quote token
| **token_pair**    | JSON                              | Token pair for which the client is requesting quote (See [Token Pair](#token-pair)) |
| **quantity_requested**      | JSON                              | Requested quantity (See [Quantity](#quantity)) |
| **side_requested**       | STRING                              | Side of quote. Possible values: `buy`, `sell` or `two_way`
| **t_quote**       | STRING                            | Quote time in ISO 8601 date format
| **t_expiry**      | STRING                            | Quote expiry time in ISO 8601 date format
| **is_filled**      | BOOLEAN                          | `true` if quote has been executed successfully else `false`. `false` for quote request
| **fee_bps**      | DECIMAL                          | Fee in basis points applicable on trade execution
| **side_executed**       | STRING                              | Side of quote executed. `null` for quote request
| **error**       | JSON                                | Error info. `null` if no error (see [Error](#error))


# Execute Quote

Execute quote fetched in the [Get Quote](#get-quote) API call.

## HTTP Request
`POST https://api.falconx.io/v1/quotes/execute`

## Request Body

> Request Sample

```json
{
    "fx_quote_id": "00c884b056f949338788dfb59e495377",
    "side": "buy"
}
```

| Parameter  | Type                                | Description
| ---------  | ----------------------------------- | ------------
| **fx_quote_id** | STRING                                 | FalconX Quote ID fetched in the [Get Quote](#get-quote) API call
| **side**       | STRING                              | Side of quote. Possible values: `buy` or `sell`


## Response Parameters

> Response Sample

```json
{
  "status": "success",
  "fx_quote_id": "00c884b056f949338788dfb59e495377",
  "buy_price": 12650,
  "sell_price": null,
  "token_pair": {
    "base_token": "BTC",
    "quote_token": "USD"
  },
  "quantity_requested": {
    "token": "BTC",
    "value": "10"
  },
  "side_requested": "buy",
  "t_quote": "2019-06-27T11:59:21.875725+00:00",
  "t_expiry": "2019-06-27T11:59:22.875725+00:00",
  "is_filled": true,
  "fee_bps": 5,
  "side_executed": "buy",
  "error": null
}
```


| Parameter     | Type                              | Description |
| ---------     | ------------------------------    | ------------|
| **status**        | STRING                            | Status of the response. Possible values: `success` or `failure` or `processing`|
| **fx_quote_id**   | STRING                            | FalconX Quote ID
| **buy_price**   | DECIMAL                            | Buy price in quote token
| **sell_price**   | DECIMAL                            | Sell price in quote token
| **token_pair**    | JSON                              | Token pair for which the client is requesting quote (See [Token Pair](#token-pair)) |
| **quantity_requested**      | JSON                              | Requested quantity (See [Quantity](#quantity)) |
| **side_requested**       | STRING                              | Side of quote. Possible values: `buy`, `sell` or `two_way`
| **t_quote**       | STRING                            | Quote time in ISO 8601 date format
| **t_expiry**      | STRING                            | Quote expiry time in ISO 8601 date format
| **is_filled**      | BOOLEAN | `true` if quote has been executed successfully else `false`
| **fee_bps**      | DECIMAL                          | Fee in basis points applicable on trade execution
| **side_executed**       | STRING                              | Side of quote executed
| **error**       | JSON                                | Error info. `null` if no error (see [Error](#error))

Note: In rare cases the execution status can be `processing` which means that it'll take us few seconds to verify the trade.
In these cases keep checking status of the quote using [Quote Status API](#quote-status) until you receive
`success` or `failure` status.


# Quote Status

Get status of a quote by ID.

## HTTP Request
`GET https://api.falconx.io/v1/quotes/<fx_quote_id>`

## Path Parameters

> Request Sample

```shell
# substitute placeholders with correct authorization header values
curl -X GET "https://api.falconx.io/v1/quotes/00c884b056f949338788dfb59e495377" \
      -H "FX-ACCESS-SIGN: <signature>" \
      -H "FX-ACCESS-TIMESTAMP: <timestamp>" \
      -H "FX-ACCESS-KEY: <api_key>" \
      -H "FX-ACCESS-PASSPHRASE: <passphrase>" \
      -H "Content-Type: application/json"
```


| Parameter         | Type                                | Description
| ---------         | ----------------------------------- | ------------
| **fx_quote_id**   | STRING                         | FalconX Quote ID fetched in the [Get Quote](#get-quote) API call


## Response Parameters

> Response Sample

```json
{
  "status": "success",
  "fx_quote_id": "00c884b056f949338788dfb59e495377",
  "buy_price": 12650,
  "sell_price": null,
  "platform": "api",
  "token_pair": {
    "base_token": "BTC",
    "quote_token": "USD"
  },
  "quantity_requested": {
    "token": "BTC",
    "value": "10"
  },
  "side_requested": "buy",
  "t_quote": "2019-06-27T11:59:21.875725+00:00",
  "t_expiry": "2019-06-27T11:59:22.875725+00:00",  
  "is_filled": true,
  "fee_bps": 5,
  "side_executed": "buy",
  "trader_email": "trader@company.com",
  "error": null
}
```

| Parameter     | Type                              | Description |
| ---------     | ------------------------------    | ------------|
| **status**        | STRING                            | Status of the response. Possible values: `success` or `failure`|
| **fx_quote_id**   | STRING                            | FalconX Quote ID
| **buy_price**   | DECIMAL                            | Buy price in quote token
| **sell_price**   | DECIMAL                            | Sell price in quote token
| **platform** | STRING | Platform for quote. Possible values: `api`, `browser` or `margin`
| **token_pair**    | JSON                              | Token pair for which the client is requesting quote (See [Token Pair](#token-pair)) |
| **quantity_requested**      | JSON                              | Requested quantity (See [Quantity](#quantity)) |
| **side_requested**       | STRING                              | Side of quote. Possible values: `buy`, `sell` or `two_way`
| **t_quote**       | STRING                            | Quote time in ISO 8601 date format
| **t_expiry**      | STRING                            | Quote expiry time in ISO 8601 date format
| **is_filled**      | BOOLEAN | `true` if quote has been executed successfully else `false`
| **fee_bps**      | DECIMAL                          | Fee in basis points applicable on trade execution
| **side_executed**       | STRING                              | Side of quote executed. `null` if not executed
| **trader_email**       | STRING                              | Email of trader who requested the quote
| **error**       | JSON                                | Error info. `null` if no error (see [Error](#error))


# Get Executed Quotes

Get executed quotes between the given time range. Time range should be provided in ISO 8601 date format.


## HTTP Request
`GET https://api.falconx.io/v1/quotes`

## Query Parameters

> Request Sample

```shell
# substitute placeholders with correct authorization header values
curl -X GET "https://api.falconx.io/v1/quotes" \
      --data-urlencode "t_start=2019-06-20T00:00:00+00:00" \
      --data-urlencode "t_end=2019-06-21T00:00:00+00:00" \
      --data-urlencode "platform=api" \
      -H "FX-ACCESS-SIGN: <signature>" \
      -H "FX-ACCESS-TIMESTAMP: <timestamp>" \
      -H "FX-ACCESS-KEY: <api_key>" \
      -H "FX-ACCESS-PASSPHRASE: <passphrase>" \
      -H "Content-Type: application/json"
```


| Parameter         | Type                                | Description
| ---------         | ----------------------------------- | ------------
| **t_start**   | STRING                         | Start of time range in ISO 8601 date format
| **t_end**   | STRING                         | End of time range in ISO 8601 date format
| **platform** | STRING | Platform for quote. Possible values: `api`, `browser` or `margin`. If not present quotes from all platforms are returned

## Response Parameters

> Response Sample

```json
[
  {
    "status": "success",
    "fx_quote_id": "00c884b056f949338788dfb59e495377",
    "buy_price": 12650,
    "sell_price": null,
    "platform": "api",
    "token_pair": {
      "base_token": "BTC",
      "quote_token": "USD"
    },
    "quantity_requested": {
      "token": "BTC",
      "value": "10"
    },
    "side_requested": "buy",
    "t_quote": "2019-06-27T11:59:21.875725+00:00",
    "t_expiry": "2019-06-27T11:59:22.875725+00:00",
    "is_filled": true,
    "fee_bps": 5,
    "side_executed": "buy",
    "trader_email": "trader@company.com",
    "error": null
  }
]
```
API will return a list of the following structure:

| Parameter     | Type                              | Description |
| ---------     | ------------------------------    | ------------|
| **status**        | STRING                            | Status of the response. Possible values: `success` or `failure`|
| **fx_quote_id**   | STRING                            | FalconX Quote ID
| **buy_price**   | DECIMAL                            | Buy price in quote token
| **sell_price**   | DECIMAL                            | Sell price in quote token
| **platform** | STRING | Platform for quote. Possible values: `api`, `browser` or `margin`
| **token_pair**    | JSON                              | Token pair for which the client is requesting quote (See [Token Pair](#token-pair)) |
| **quantity_requested**      | JSON                              | Requested quantity (See [Quantity](#quantity)) |
| **side_requested**       | STRING                              | Side of quote. Possible values: `buy`, `sell` or `two_way`
| **t_quote**       | STRING                            | Quote time in ISO 8601 date format
| **t_expiry**      | STRING                            | Quote expiry time in ISO 8601 date format
| **is_filled**      | BOOLEAN | `true` if quote has been executed successfully else `false`
| **fee_bps**      | DECIMAL                          | Fee in basis points applicable on trade execution
| **side_executed**       | STRING                              | Side of quote executed
| **trader_email**       | STRING                              | Email of trader who requested the quote
| **error**       | JSON                                | Error info. `null` if no error (see [Error](#error))


# Get Balances


Fetches balances for all tokens.

## HTTP Request

`GET https://api.falconx.io/v1/balances`

## Query Parameters

> Request Sample

```shell
# substitute placeholders with correct authorization header values
curl -X GET "https://api.falconx.io/v1/balances?platform=api" \
      -H "FX-ACCESS-SIGN: <signature>" \
      -H "FX-ACCESS-TIMESTAMP: <timestamp>" \
      -H "FX-ACCESS-KEY: <api_key>" \
      -H "FX-ACCESS-PASSPHRASE: <passphrase>" \
      -H "Content-Type: application/json"
```

| Parameter         | Type                                | Description
| ---------         | ----------------------------------- | ------------
| **platform** | STRING | Platform for balance. Possible values: `api`, `browser` or `margin`. If not present balances from all platforms are returned


## Response Parameters

> Response Sample

```json
[
  {
    "token": "BTC",
    "balance": 10,
    "platform": "api"
  },
  {
    "token": "ETH",
    "balance": 100,
    "platform": "api"
  }
]

```


API will return a list of the following structure:

| Parameter     | Type                              | Description |
| ---------     | ------------------------------    | ------------|
| **token**     | STRING                            | Token symbol  
| **balance**   | DECIMAL                           | Balance for that token
| **platform** | STRING | Platform for balance. Possible values: `api`, `browser` or `margin`


# Get Total Balances


Fetches total balances for all tokens combined over all platforms.

## HTTP Request

> Request Sample

```shell
# substitute placeholders with correct authorization header values
curl -X GET "https://api.falconx.io/v1/balances/total" \
      -H "FX-ACCESS-SIGN: <signature>" \
      -H "FX-ACCESS-TIMESTAMP: <timestamp>" \
      -H "FX-ACCESS-KEY: <api_key>" \
      -H "FX-ACCESS-PASSPHRASE: <passphrase>" \
      -H "Content-Type: application/json"
```

`GET https://api.falconx.io/v1/balances/total`



## Response Parameters

> Response Sample

```json
[
  {
    "token": "BTC",
    "total_balance": 10,
  },
  {
    "token": "ETH",
    "total_balance": 100,
  }
]

```


API will return a list of the following structure:

| Parameter     | Type                              | Description |
| ---------     | ------------------------------    | ------------|
| **token**     | STRING                            | Token symbol  
| **total_balance**   | DECIMAL                           | Total Balance for that token


# Get Transfers

Get deposits / withdrawals between the given time range. Time range should be provided in ISO 8601 date format.


## HTTP Request
`GET https://api.falconx.io/v1/transfers`

## Query Parameters

> Request Sample

```shell
# substitute placeholders with correct authorization header values
curl -X GET "https://api.falconx.io/v1/transfers" \
      --data-urlencode "t_start=2019-06-20T00:00:00+00:00" \
      --data-urlencode "t_end=2019-06-21T00:00:00+00:00" \
      --data-urlencode "platform=api" \
      -H "FX-ACCESS-SIGN: <signature>" \
      -H "FX-ACCESS-TIMESTAMP: <timestamp>" \
      -H "FX-ACCESS-KEY: <api_key>" \
      -H "FX-ACCESS-PASSPHRASE: <passphrase>" \
      -H "Content-Type: application/json"
```


| Parameter         | Type                                | Description
| ---------         | ----------------------------------- | ------------
| **t_start**   | STRING                         | Start of time range in ISO 8601 date format
| **t_end**   | STRING                         | End of time range in ISO 8601 date format
| **platform** | STRING | Platform for transfer. Possible values: `api`, `browser` or `margin`. If not present transfers from all platforms are returned

## Response Parameters

> Response Sample

```json
[
  {
    "type": "deposit",
    "platform": "browser",
    "token": "BTC",
    "quantity": 1.0,
    "t_create": "2019-06-20T01:01:01+00:00"
  }
]
```
API will return a list of the following structure:

| Parameter     | Type                              | Description |
| ---------     | ------------------------------    | ------------|
| **type**        | STRING                            | Type of transfer. Possible values: `deposit` or `withdrawal`|
| **platform**   | STRING                            | Platform for transfer. Possible values: `api`, `browser` or `margin`
| **token**   | DECIMAL                            | Token symbol
| **quantity**   | DECIMAL                            | Quantity
| **t_create**    | JSON                              | Time of creation |


# Get 30-day Trailing Volume

Get trading volume for the last 30 days.


## HTTP Request
`GET https://api.falconx.io/v1/get_30_day_trailing_volume`

> Request Sample

```shell
# substitute placeholders with correct authorization header values
curl -X GET "https://api.falconx.io/v1/get_30_day_trailing_volume" \
      -H "FX-ACCESS-SIGN: <signature>" \
      -H "FX-ACCESS-TIMESTAMP: <timestamp>" \
      -H "FX-ACCESS-KEY: <api_key>" \
      -H "FX-ACCESS-PASSPHRASE: <passphrase>" \
      -H "Content-Type: application/json"
```

## Response Parameters

> Response Sample

```json
{
  "end_date": "2019-11-18T06:54:27.623978+00:00",
  "start_date": "2019-10-19T06:54:27.623978+00.00",
  "usd_volume": 69100283.78000,
}
```
API will return a list of the following structure:

| Parameter     | Type                              | Description |
| ---------     | ------------------------------    | ------------|
| **end_date**        | STRING                            | End date of the resultant volume|
| **start_date**   | STRING                            | Start date of the resultant volume
| **usd_volume**   | DECIMAL                            | Total volume traded in USD between start_date and end_date


# Get Trade Volume

Get trading volume between the given time range. Time range should be provided in ISO 8601 date format.


## HTTP Request
`GET https://api.falconx.io/v1/get_trade_volume`

## Query Parameters

> Request Sample

```shell
# substitute placeholders with correct authorization header values
curl -X GET "https://api.falconx.io/v1/get_trade_volume" \
      --data-urlencode "t_start=2019-06-20T00:00:00+00:00" \
      --data-urlencode "t_end=2019-06-21T00:00:00+00:00" \
      -H "FX-ACCESS-SIGN: <signature>" \
      -H "FX-ACCESS-TIMESTAMP: <timestamp>" \
      -H "FX-ACCESS-KEY: <api_key>" \
      -H "FX-ACCESS-PASSPHRASE: <passphrase>" \
      -H "Content-Type: application/json"
```

| Parameter         | Type                                | Description
| ---------         | ----------------------------------- | ------------
| **t_start**   | STRING                         | Start of time range in ISO 8601 date format
| **t_end**   | STRING                         | End of time range in ISO 8601 date format

## Response Parameters

> Response Sample

```json
{
  "end_date": "2019-11-18T06:54:27.623978+00:00",
  "start_date": "2019-10-19T06:54:27.623978+00.00",
  "usd_volume": 69100283.78000,
}
```
API will return a list of the following structure:

| Parameter     | Type                              | Description |
| ---------     | ------------------------------    | ------------|
| **end_date**        | STRING                            | End date of the resultant volume|
| **start_date**   | STRING                            | Start date of the resultant volume
| **usd_volume**   | DECIMAL                            | Total volume traded in USD between start_date and end_date


# Get Trade Limits

Get trade limits for a platform.

## HTTP Request
`GET https://api.falconx.io/v1/get_trade_limits/<platform>`

## Path Parameters

> Request Sample

```shell
# substitute placeholders with correct authorization header values
curl -X GET "https://api.falconx.io/v1/get_trade_limits/browser" \
      -H "FX-ACCESS-SIGN: <signature>" \
      -H "FX-ACCESS-TIMESTAMP: <timestamp>" \
      -H "FX-ACCESS-KEY: <api_key>" \
      -H "FX-ACCESS-PASSPHRASE: <passphrase>" \
      -H "Content-Type: application/json"
```


| Parameter         | Type                                | Description
| ---------         | ----------------------------------- | ------------
| **platform**   | STRING                         | Platform for trade limits. Possible values: api, browser or margin.


## Response Parameters

> Response Sample

```json
{
  "gross_limits": {
    "available": 99774.78,
    "total": 1000000,
    "used": 900225.22
  },
  "net_limits": {
    "available": 81711.78,
    "total": 1000000,
    "used": 918288.22
  }
}
```

| Parameter     | Type                              | Description |
| ---------     | ------------------------------    | ------------|
| **gross_limits**        | JSON                            | Gross Limits, if set, for the platform (see [Trade Limits](#trade-limits))|
| **net_limits**        | JSON                            | Net Limits, if set, for the platform (see [Trade Limits](#trade-limits))|


# Request Withdrawal

Submit a request for withdrawal.

## HTTP Request
`POST https://api.falconx.io/v1/withdraw`

## Query Parameters

> Request Sample

```json
{
  "token": "BTC", 
  "amount": "1", 
  "platform": "browser"
}
```

> Response Sample

```json
# success response
{
    "message": "Withdrawal request submitted successfully",
    "status": "success"
}


# failure response when requested withdrawal amount is more than the current balance
{
    "error": {
        "code": "INSUFFICIENT_BALANCE_TO_WITHDRAW",
        "reason": "Withdrawal balance should be less that or equal to the balance in account."
    },
    "status": "failure"
}
```


| Parameter         | Type                                | Description
| ---------         | ----------------------------------- | ------------
| **token**   | STRING                         | Token to withdraw. E.g. BTC, ETH.
| **amount**   | DECIMAL                         | Quantity of token to withdraw.
| **platform**   | STRING                         | Platform to withdraw from. Possible values: api, browser.


# JSON Structures

## Token Pair

The token pair JSON structure format:

| Parameter     | Type                              | Description |
| ---------     | ------------------------------    | ------------|
| **base_token**     | STRING                            | Base Token  
| **quote_token**   | STRING                            | Quote Token

## Quantity

The quantity JSON structure format:

| Parameter     | Type                              | Description |
| ---------     | ------------------------------    | ------------|
| **token**     | STRING                            | Token symbol
| **value**     | DECIMAL                            | Quantity of token


## Error

The error structure returned by our API will be in the following format:

| Parameter     | Type                              | Description |
| ---------     | ------------------------------    | ------------|
| **code**     | STRING                            | Error code  
| **reason**   | STRING                            | Reason for the error


## Trade Limits

The trade limits JSON structure format:

| Parameter     | Type                              | Description |
| ---------     | ------------------------------    | ------------|
| **remaining**     | DECIMAL                            | Remaining limit in USD
| **total**   | DECIMAL                            | Total limit in USD
| **used**   | DECIMAL                            | Used limit in USD

<!-- The following error codes are supported at the moment:

| Parameter     | Description|
| ---------     | -----------|
| **ERR_1**     | Error due to error 1  
| **ERR_2**     | Error due to error 2      -->       


# Customer Trading Limits

## Rate Limits

> Response Sample

```json
{
  "num_quotes_limit": {
    "per_hour": 60, 
    "per_minute": 24, 
    "per_second": 5
  }
}
```

Rate limit for quoting will be returned in  the following format:

| Parameter                   | Type                              | Description |
| ---------                   | ------------------------------    | ------------|
| **per_hour**   | INTEGER                           | Limit on no. of quote requests per hour
| **per_minute**     | INTEGER                           | Limit on no. of quote requests per minute
| **per_second**      | INTEGER                           | Limit on no. of quote requests per second     

HTTP Request at : `GET https://api.falconx.io/v1/rate_limit`


## Trade Size Limits

> Response Sample

```json
[
  {
    "platform": "browser", 
    "token_pair": {
      "base_token": "BTC", 
      "quote_token": "USD"
    }, 
    "trade_size_limits_in_quote_token": {
      "max": 500000.00, 
      "min": 4000.00
    }
  }, 
  {
    "platform": "api", 
    "token_pair": {
      "base_token": "ETH", 
      "quote_token": "USD"
    }, 
    "trade_size_limits_in_quote_token": {
      "max": 500000.00, 
      "min": 1000.00
    }
  }
]
```

The API will return the minimum and maximum trade size for a token pair in the following format:

| Parameter                      | Type                              | Description |
| ---------                      | ------------------------------    | ------------|
| **platform**                   | STRING                               | Trading Platform (API or Browser)
| **base_token**                 | STRING                               | Base Token
| **quote_token**                | STRING                            | Quote Token
| **min**                        | DECIMAL                           | Minimum allowed trade size in terms of quote token
| **max**                        | DECIMAL                           | Maximum allowed trade size in terms of quote token

HTTP Request at : `GET https://api.falconx.io/v1/trade_sizes`
