---
title: CoinBTR API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - python

toc_footers:
  - <a href='https://coinbtr.com/signup'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

CoinBTR provides a simple and practical REST API to help you to automatically perform nearly all actions you can do in our platform [CoinBTR](https://coinbtr.com).

## General considerations

Before making API calls consider the following:

* All requests use the `application/json` content type and go over `http`. The base url is `https://coinbtr.com/api/v1/`.
* All requests are `GET` and `POST` requests and all responses come in a default response object with the result in the `data` field.
* Always check the `success` flag to ensure that your API call succeeded.
* If something goes wrong look at the `msg` field. There you will find the error description and error code.

## HTTP API Responses

CoinBTR REST API calls will always return a JSON Object.

* A successful API call will response a JSON  object that looks like:

`{
  "success": true,
  "msg":"",
  "data": {
    RELATED_DATA_HERE
    }
  }`

* An unsuccessful API call will response a JSON  object that looks like:

`{
  "success": false,
  "msg": {
    "error": ERROR_MESSAGE,
    "code": ERROR_CODE
  }
}`

## Error codes

# Authentication

## API Key

In order to use our platform through API calls you must request and configure as many API keys as you need. You can configure each API key with its own level of permission. To add, delete or modify your API keys please go to your profile `Settings` > `Manage API Keys`.

<aside class="notice">
API key is always needed for accessing private methods.
</aside>
<aside class="warning">
You must have 2FA enabled to create an API key.
</aside>
# Session

## Session information

```shell
COINBTR_TOKEN='your_api_key'

curl -X GET \
-H "Authorization: Token $COINBTR_TOKEN" \
https://coinbtr.com/api/v1/user/session
```
This API call will response relevant information about the current session associated to your account and the token key used.

### HTTP Request
> The API call will response this:

```json
{
  "success": true,
  "msg": "",
  "data": {
    "username": "jhon@mail.com",
    "ip":"189.200.10.0",
    "token": {
      "expires": "date",
      "permissions": {
        "withdraw": true,
        "deposit": true,
        "trade": false
      }
    }
  }
}
```
`GET /api/v1/user/session`
### Body Parameters
None

# Wallet Operations

## Get Deposit Address

```shell
COINBTR_TOKEN='your_api_key'
COIN=btc

curl -X GET \
-H "Authorization: Token $COINBTR_TOKEN" \
https://coinbtr.com/api/v1/wallet/getdepositaddress?coin=$COIN
```
This API call will bring you a deposit address for funding your cryptocurrency wallet.

### HTTP Request
`GET /api/v1/wallet/getdepositaddress/?coin=btc`

> The API call will response this:

```json
{
  "success": true,
  "msg": "",
  "data": {
    "coin":"btc",
    "address": "2NFfxvXpAWjKng7enFougtvtxxCJ2hQEMo4",
  }
}
```
### Body Parameters

| Parameter | Type | Required | Coins | Description |
|---|---|---|---|---|
| coin | String | Yes | All | Cryptocurrency symbol (e.g. 'btc'). |

## Cryptocurrency Withdraw

```shell
COINBTR_TOKEN='your_api_key'
ADDRESS='2N9JiEUYgRwKAw6FfnUca54VUeaSYSL9qqG'
COIN=btc
AMOUNT=0.001

curl -X POST \
-H "Content-Type: application/json" \
-H "Authorization: Token $COINBTR_TOKEN" \
-d "{ \"coin\": \"$COIN\", \"address\": \"$ADDRESS\", \"amount\": $AMOUNT }" \
https://coinbtr.com/api/v1/wallet/withdraw
```
This API call allows you to send cryptocurrency to a given destination address.

### HTTP Request
`POST /api/v1/wallet/whithdraw`

> The API response will look like this:

```json
{
  "success": true,
  "msg": "",
  "data": {
    "coin":"BTC",
    "txid": "a4b50c3f7fb5dd9273f5be69661b79eed61570421f76ec903ad914d39980549e",
    "status": "signed",
    "date": "2018-07-02T04:57:55.942Z"
  }
}
```
### Body Parameters

| Parameter | Type | Required | Coins | Description |
|---|---|---|---|---|
| coin | String | Yes | All | Cryptocurrency symbol (e.g. 'btc'). |
| address | String | Yes | All | Destination address. |
| amount | Float | Yes | All | Amount to send. |

## MXN Withdraw (SPEI)
This API call is used to withdraw MXN to a given clabe, card number.

### HTTP Request

### Body Parameters

## List Balances
```shell
COINBTR_TOKEN='your_api_key'

curl -X GET \
-H "Content-Type: application/json" \
-H "Authorization: Token $COINBTR_TOKEN" \
https://coinbtr.com/api/v1/wallet/listbalances
```

This API call is used to retrieve your wallets balances, including their deposit addresses.

### HTTP Request
> The API response will look like this:

```json
{
	"success": true,
	"message": "",
	"data": [{
			"coin": "LTC",
			"balance": 0.00000000,
			"available": 0.00000000,
			"pending": 0.00000000,
			"depositAddress": "DLxcEt3AatMyr2NTatzjsfHNoB9NT62HiF"
		}, {
			"coin": "BTC",
			"balance": 14.21549076,
			"available": 14.21549076,
			"pending": 0.00000000,
			"depositAddress": "1Mrcdr6715hjda34pdXuLqXcju6qgwHA31"
		}
	]
}
```
`GET /api/v1/wallet/listbalances`

### Body Parameters
None

## Get Balance
### HTTP Request
`GET /api/v1/wallet/getbalance`

## List Withdraws
This API call is used to retrieve your withdraws history.

### HTTP Request
`GET /api/v1/wallet/listwithdraws`

## List Deposits
### HTTP Request
`GET /api/v1/wallet/listdeposits`

#Trading Operations
<aside class="notice">
Make sure that your API key has permissions to perform this actions.
</aside>
## Place a buy limit order
### HTTP Request
`POST /api/v1/trading/place/buylimit`

## Place a sell limit order
```shell
COINBTR_TOKEN='your_api_key'
MKT=BTC-LTC
AMOUNT=0.0001

curl -X POST \
-H "Content-Type: application/json" \
-H "Authorization: Token $COINBTR_TOKEN" \
-d "{ \"market\": \"$MKT\", \"amount\": \"$AMOUNT\" }" \
https://coinbtr.com/api/v1/trading/selllimit
```

This endpoint is used to place a sell order in a given market.
### HTTP Request
`POST /api/v1/trading/place/selllimit`

## Cancel an open order
### HTTP Request
`POST /api/v1/trading/cancel/buylimit`

## List open orders
### HTTP Request
`POST /api/v1/trading/listopenorders`

## Get open order
### HTTP Request
`POST /api/v1/trading/listopenorders`

## List Trasactions

## Get Transaction

#Market- Public API Methods

## List Books

This endpoint returns a list of existing exchange order books and their respective order placement limits.
`GET /market/listbooks`

## Get Order Book
### HTTP Request
`GET /market/getorderbook`

## Get tiker
### HTTP Request
`GET /market/gettiker`

## Get 24H Volume
### HTTP Request
`GET /market/get24hvolume`

## Get Currencies
### HTTP Request
`GET /market/getcurrencies`

#Coin specific implementations
There are aditional data that you most provide for certain cryptocurrencies operations.

## Nem (XEM) withdraws

## Monero (XMR) withdraws

##
