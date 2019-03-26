---
title: Coinbtr API Reference

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

Coinbtr provides a simple and practical REST API to help you to automatically perform nearly all actions you can do in our platform [Coinbtr](https://coinbtr.com).

## General considerations

Before making API calls consider the following:

* All requests use the `application/json` content type and go over `https`.
* The base url is `https://api.coinbtr.com/api/v1/`.
* All requests are `GET` and `POST` requests methods and responses come in a default response object with the result in the `data` field.
* Check the `success` flag to ensure that your API call succeeded.
* If something goes wrong look at the `msg` field. There you will find the error description.

## HTTP API Responses

Coinbtr REST API calls will always return a JSON Object.

* A typical successful API call will response a JSON  object that looks like:

`{
  "success": true,
  "msg": null,
  "data": {
    RELATED_DATA_HERE
    }
  }`

* An unsuccessful API call will response a JSON  object that looks like:

`{
  "success": false,
  "msg": ERROR_DESCRIPTION
}`

# Authentication

## API Key

In order to use our platform through API calls you must request and configure as many API keys as you need. You can configure each API key with its own level of permission. To add, delete or modify your API keys please go to your profile `Settings` > `Manage API Keys`.

<aside class="notice">
API key is always needed for accessing private endpoints.
</aside>
<!-- # Session

## Session information

```shell
COINBTR_TOKEN='your_api_key'

curl -X GET \
-H "Authorization: Token $COINBTR_TOKEN" \
https://api.coinbtr.com/api/v1/user/session
```
This API call will response relevant information about the current session associated to your account and the token key used.

### HTTP Request
> The API call will response this:

```json
{
  "success": true,
  "msg": null,
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
None -->

# Wallet Operations
<!-- ====================================================================================================== -->

## Get Deposit Address

```shell
COINBTR_TOKEN='your_api_key'
COIN=btc

curl -X GET "https://api.coinbtr.com/api/v1/data/getdepositaddress/?coin=$COIN" \
-H "Authorization: Token $COINBTR_TOKEN"
```
This API call will bring you a deposit address for funding your cryptocurrency wallet.

### HTTP Request
`GET /api/v1/data/getdepositaddress/`

> The API call will response this:

```json
{
  "success": true,
  "msg": null,
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

<aside class="warning">
Extra information is required for certain coins like XEM (Nem) or XLM (Stellar) that need to be included in your transaction for detecting that you're the owner of the funds.
</aside>
* XEM requires a `message` field.
* XLM requires wheter a `memoId` or `memoText`.

Most of exchanges or wallets allows you to include this information in your transaction.

## Cryptocurrency Withdraw

```shell
COINBTR_TOKEN="your_api_key"
ADDRESS="2N9JiEUYgRwKAw6FfnUca54VUeaSYSL9qqG"
COIN="btc"
AMOUNT="0.001"

curl -X POST "https://api.coinbtr.com/api/v1/data/withdraw/" \
-H "Content-Type: application/json" \
-H "Authorization: Token $COINBTR_TOKEN" \
-d "{\"coin\": \"$COIN\", \"address\": \"$ADDRESS\", \"amount\": \"$AMOUNT\"}"
```
This API call allows you to send cryptocurrency to a given destination address.

### HTTP Request
`POST /api/v1/data/whithdraw/`

> The API response will look like this:

```json
{
  "success": true,
  "msg": null,
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
| message | String | No | XEM | Message attached to the transaction. |
| memoId | Integer | No | XLM | Memo id attached to the transaction. |
| memoText | String | No | XLM | Memo text attached to the transaction. |

<!-- ## MXN Withdraw (SPEI)
This API call is used to withdraw MXN to a given clabe, card number.

### HTTP Request

### Body Parameters -->

## List Balances
```shell
COINBTR_TOKEN='your_api_key'

curl -X GET "https://api.coinbtr.com/api/v1/data/listbalances/" \
-H "Content-Type: application/json" \
-H "Authorization: Token $COINBTR_TOKEN"
```
This API call is used to retrieve your wallets balances, including their deposit addresses. There are three type of balances in coinbtr: `available`, `pending` and `frozen`.

* `available`: Funds you can spend.

* `pending`: Funds that will be added in your account due to an incoming transfer.

* `frozen`: Frozen funds due to a limit order you have previously placed.


### HTTP Request
> The API response will look like this:

```json
{
	"success": true,
	"message": null,
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
`GET /api/v1/data/listbalances/`

### Body Parameters
None

## Get Balance
Alternatively you can request your balance for a specific coin.

```shell
COINBTR_TOKEN='your_api_key'

curl -X GET "https://api.coinbtr.com/api/v1/data/getbalance/?coin=btc" \
-H "Content-Type: application/json" \
-H "Authorization: Token $COINBTR_TOKEN"
```

> The API response will look like this:

```json
{
  "success": true,
  "msg": null,
  "data": {
    "coin": "btc",
    "coin_name": "Bitcoin",
    "balances": {
      "available": 0.00033191,
      "frozen": 0.00134,
      "pending": 0.0
    }
  }
}
```

### HTTP Request
`GET /api/v1/data/getbalance/`

### Body Parameters
| Parameter | Type | Required |  Description |
|---|---|---|---|---|
| coin | String | No | Cryptocurrency symbol (e.g. `btc`). |

## List transfers
```shell
COINBTR_TOKEN='your_api_key'

curl -X GET "https://api.coinbtr.com/api/v1/data/transfershistory/?coin=btc&type=deposits" \   
-H "Content-Type: application/json" \
-H "Authorization: Token $COINBTR_TOKEN"
```

> The API response will look like this:

```json
{
  "success": true,
  "msg": null,
  "data": {
    "transfers": [{
      "sender": "None",
      "receiver": "jhon@mail.com",
      "coin": "btc",
      "coin_name": "Bitcoin",
      "txId": "bd8d8dc229ccc4a6f06a41e138eae6e10e44b5deec2ff8bbcc26c0b07fb6a466",
      "confirmed": true,
      "created_at": "2019-03-19T20: 11: 37.073628Z",
      "confirmed_at": "2019-03-19T20: 51: 38.808905Z",
      "is_innerTransfer": false,
      "address": "3K4ijxakSQ86Nk26JZuHZa2m7tHjJ3YeSb",
      "explorer_link": "https://www.blockchain.com/es/btc/tx/bd8d8dc229ccc4a6f06a41e138eae6e10e44b5deec2ff8bbcc26c0b07fb6a466",
      "amount": 0.00033699,
      "fee_amount": 0.0,
      "total_amount": 0.00033699,
      "type": "deposit"
    }]
  }
}
```
This API call is used to retrieve your withdraws and deposits history. These can be filtered by type, which can be `withdrawals` or `deposits`, and/or by `coin`.

### HTTP Request
`GET /api/v1/data/transfershistory/`

### Body Parameters

| Parameter | Type | Required |  Description |
|---|---|---|---|---|
| coin | String | No | Cryptocurrency symbol (e.g. `btc`). |
| type | String | No |type of transfer, wich can be `withdrawals` or `deposits`. |

#Trading Operations
<!-- ====================================================================================================== -->
<aside class="notice">
Make sure that your API key has permissions to perform this actions.
</aside>

## Place an new order
```shell
COINBTR_TOKEN='your_api_key'
MKT="btc-mxn"
SIDE="sell"
TYPE="limit"
AMOUNT="0.001" # 0.001 BTC
PRICE="100000" # Means 1 BTC = $100,000.00 MXN

curl -X POST "https://api.coinbtr.com/api/v1/trading/placeorder/" \
-H "Content-Type: application/json" \
-H "Authorization: Token $COINBTR_TOKEN" \
-d "{ \"market\": \"$MKT\", \"amount\": \"$AMOUNT\", \"type\":\"$TYPE\", \"side\": \"$SIDE\", \"price\": \"$PRICE\"}"
```
You can place two types of orders: `limit` and `market`. Orders can be placed only if your account has enough funds. Once an order is placed, your wallet funds will be frozen. If you cancel your order, the associated funds will be restored. If you cancel an open order that has been partially filled the exchanged funds will not be restored.
### HTTP Request
`POST /api/v1/trading/placeorder/`

### Body Parameters

| Parameter | Type | Required |  Description |
|---|---|---|---|---|
| market | String | Yes | Market where your order will be placed (e.g. `btc-mxn`). |
| amount | String | Yes | Amount of coins to trade. |
| side | String | Yes | `buy` or `sell`. |
| type | String | Yes | Type of order which can be `market` or `limit`. |
| price | String | Yes | Order price at which you wish to exchange your coins. |

## Cancel an open order
### HTTP Request
`POST /api/v1/trading/cancel/buylimit`

## List open orders
### HTTP Request
`POST /api/v1/trading/listopenorders`

## Get open order
### HTTP Request
`POST /api/v1/trading/listopenorders`

## List Transactions

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
