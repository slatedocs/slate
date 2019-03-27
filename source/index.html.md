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
* The base url is `https://api.coinbtr.com/api/v1`.
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
COINBTR_API_KEY='your_api_key'

curl -X GET \
-H "Authorization: Token $COINBTR_API_KEY" \
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
COINBTR_API_KEY='your_api_key'
COIN=btc

curl -X GET "https://api.coinbtr.com/api/v1/data/getdepositaddress/?coin=$COIN" \
-H "Authorization: Token $COINBTR_API_KEY"
```
This API call will bring you a deposit address for funding your cryptocurrency wallet.

### HTTP Request
`GET /data/getdepositaddress/`

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
* XLM requires whether a `memoId` or `memoText`.

Most of exchanges or wallets allows you to include this information in your transaction.

## Cryptocurrency Withdraw

```shell
COINBTR_API_KEY="your_api_key"
ADDRESS="2N9JiEUYgRwKAw6FfnUca54VUeaSYSL9qqG"
COIN="btc"
AMOUNT="0.001"

curl -X POST "https://api.coinbtr.com/api/v1/data/withdraw/" \
-H "Content-Type: application/json" \
-H "Authorization: Token $COINBTR_API_KEY" \
-d "{\"coin\": \"$COIN\", \"address\": \"$ADDRESS\", \"amount\": \"$AMOUNT\"}"
```
This API call allows you to send cryptocurrency to a given destination address.

### HTTP Request
`POST /data/whithdraw/`

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

<aside class="notice">
Make sure your API key has permission to perform this action.
</aside>


## btr pay®

```shell
COINBTR_API_KEY="your_api_key"
EMAIL="jhon@mail.com"
COIN="mxn"
AMOUNT="100" # 100 MXN

curl -X POST "https://api.coinbtr.com/api/v1/data/withdraw/" \
-H "Content-Type: application/json" \
-H "Authorization: Token $COINBTR_API_KEY" \
-d "{\"coin\": \"$COIN\", \"email\": \"$EMAIL\", \"amount\": \"$AMOUNT\"}"
```
*btr pay®* allows you to send funds to another user registered in Coinbtr.
Funds are transferred instantly with 0 commission fee.

### HTTP Request
`POST /data/transfer/`

> The API response will look like this:

```json
{
  "success":true,
  "msg": "100.00 MXN sent to jhon@mail.com.",
  "data": {
    "amount": 100.00,
    "coin": "MXN"
  }
}
```
### Body Parameters

| Parameter | Type | Required | Coins | Description |
|---|---|---|---|---|
| coin | String | Yes | All | Coin symbol (e.g. 'btc'). |
| email | String | Yes | All | Receiver email. |
| amount | Float | Yes | All | Amount to send. |

## Mexican Pesos Withdraw (SPEI)
```shell
COINBTR_API_KEY="your_api_key"
CLABE="002123456789012345"
RECIPIENT="RAMON SANCHEZ CRUZ"
COIN="mxn"
AMOUNT="100" # 100 MXN

curl -X POST "https://api.coinbtr.com/api/v1/data/transfer/" \
-H "Content-Type: application/json" \
-H "Authorization: Token $COINBTR_API_KEY" \
-d "{\"coin\": \"$COIN\", \"clabe\": \"$CLABE\", \"amount\": \"$AMOUNT\", \"recipient\": \"$RECIPIENT\"}"
```
> The API response will look like this:

```json
{
  "success": true,
  "msg": "Withdrawal created. Your withdrawal will processed in the next 60 minutes",
}
```
This API call is used to withdraw MXN to a given CLABE.

### HTTP Request
`POST /data/fiatwithdraw/`

### Body Parameters
| Parameter | Type | Required | Coins | Description |
|---|---|---|---|---|
| coin | String | Yes | MXN | Fiat coin symbol. Currently `MXN` is only supported |
| clabe | String | Yes | MXN | 18 digits recipient's CLABE (*Clave Bancaria Estandarizada*). |
| amount | Float | Yes | MXN | Amount to send. |
| recipient | String | Yes | MXN | Recipient's full name. |

## List Balances
```shell
COINBTR_API_KEY='your_api_key'

curl -X GET "https://api.coinbtr.com/api/v1/data/listbalances/" \
-H "Content-Type: application/json" \
-H "Authorization: Token $COINBTR_API_KEY"
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
`GET /data/listbalances/`

### Body Parameters
None

## Get Balance
Alternatively you can request your balance for a specific coin.

```shell
COINBTR_API_KEY='your_api_key'

curl -X GET "https://api.coinbtr.com/api/v1/data/getbalance/?coin=btc" \
-H "Content-Type: application/json" \
-H "Authorization: Token $COINBTR_API_KEY"
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
`GET /data/getbalance/`

### Body Parameters
| Parameter | Type | Required |  Description |
|---|---|---|---|---|
| coin | String | No | Coin symbol (e.g. `btc`). |

## List transfers
```shell
COINBTR_API_KEY='your_api_key'

curl -X GET "https://api.coinbtr.com/api/v1/data/transfershistory/?coin=btc&type=deposits" \   
-H "Content-Type: application/json" \
-H "Authorization: Token $COINBTR_API_KEY"
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
`GET /data/transfershistory/`

### Body Parameters

| Parameter | Type | Required |  Description |
|---|---|---|---|---|
| coin | String | No | Coin symbol (e.g. `btc`). |
| type | String | No |type of transfer, wich can be `withdrawals` or `deposits`. |

#Trading Operations
<!-- ====================================================================================================== -->
<aside class="notice">
Make sure that your API key has permissions to perform these actions.
</aside>

## Place a new order
```shell
COINBTR_API_KEY='your_api_key'
MKT="btc-mxn"
SIDE="sell"
TYPE="limit"
AMOUNT="0.001" # 0.001 BTC
PRICE="100000" # Means 1 BTC = $100,000.00 MXN

curl -X POST "https://api.coinbtr.com/api/v1/trading/placeorder/" \
-H "Content-Type: application/json" \
-H "Authorization: Token $COINBTR_API_KEY" \
-d "{ \"market\": \"$MKT\", \"amount\": \"$AMOUNT\", \"type\":\"$TYPE\", \"side\": \"$SIDE\", \"price\": \"$PRICE\"}"
```
You can place two types of orders: `limit` and `market`. Orders can be placed only if your wallet has enough funds. Once an order is placed, your wallet funds will be frozen. If you cancel your order, the associated funds will be restored. If you cancel an open order that has been partially filled the exchanged funds will not be restored.
### HTTP Request
`POST /trading/placeorder/`

### Body Parameters

| Parameter | Type | Required |  Description |
|---|---|---|---|---|
| market | String | Yes | Market where your order will be placed (e.g. `btc-mxn`). |
| amount | String | Yes | Amount of coins to trade. |
| side | String | Yes | `buy` or `sell`. |
| type | String | Yes | `market` or `limit`. |
| price | String | Yes | Order price at which you wish to exchange your coins. |

## List my open orders
```shell
COINBTR_API_KEY='your_api_key'

curl -X GET "https://api.coinbtr.com/api/v1/trading/myopenorders/" \
-H "Authorization: Token $COINBTR_API_KEY"
```

> The API response will look like this:

```json
{
  "success":true,
  "msg":null,
  "data":[{
    "market":"LTC-BTC",
    "side":"BUY",
    "amount":0.00033699,
    "initial_amount":0.00033699,
    "filled":0.0,
    "value":0.00000508,
    "initial_value":0.00000508,
    "price":0.01508999,
    "fee_decimal":0.00075,
    "fee_percent":0.075,
    "fee_amount_paid":0.0,
    "created_at":"2019-03-25T18:24:35.862824Z",
    "is_open":true,
    "amount_received":0.0,
    "amount_paid":0.0,
    "left_coin":"LTC",
    "right_coin":"BTC",
    "order_id":13
  },
  {
    "market":"DASH-BTC",
    "side":"SELL",
    "amount":0.014,
    "initial_amount":0.014,
    "filled":0.0,
    "value":0.00032204,
    "initial_value":0.00032204,
    "price":0.023003,
    "fee_decimal":0.0,
    "fee_percent":0.0,
    "fee_amount_paid":0.0,
    "created_at":"2019-03-27T18:50:52.119514Z",
    "is_open":true,
    "amount_received":0.0,
    "amount_paid":0.0,
    "left_coin":"DASH",
    "right_coin":"BTC",
    "order_id":14
  }]
}
```
This endpoint returns your open orders and their status.
### HTTP Request
`GET /trading/myopenorders/`

### Query Parameters

| Parameter | Type | Required |  Description |
|---|---|---|---|---|
| market | String | No | List your open orders filtering by `market` (e.g. `btc-mxn`). |

## Close an open order

```shell
COINBTR_API_KEY='your_api_key'
ORDER_ID=3453

curl -X POST "https://api.coinbtr.com/api/v1/trading/closeorder/" \
-H "Content-Type: application/json" \
-H "Authorization: Token $COINBTR_API_KEY" \
-d "{\"id\": $ORDER_ID}"
```

> The API response will look like this:

```json
{
  "success":true,
  "msg":"Order closed"
}
```
This API call allows you to close an open order that you have previously placed. If your order has already been partially filled, that is to say, partially bought or sold, the exchanged funds will not be restored. Full-filled orders will be automatically closed.

### HTTP Request
`POST /trading/closeorder/`

### Body Parameters
| Parameter | Type | Required |  Description |
|---|---|---|---|---|
| id | Integer | Yes | Order id |

## List my trading history
```shell
COINBTR_API_KEY='your_api_key'

curl -X GET "https://api.coinbtr.com/api/v1/trading/history/" \
-H "Authorization: Token $COINBTR_API_KEY"
```

> The API response will look like this:

```json
{
  "success":true,
  "msg":null,
  "data":{
    "all":[{
      "market":"XEM-BTC",
      "side":"SELL",
      "amount_paid":4.0,
      "amount_received":6.82e-05,
      "price":1.705e-05,
      "fee_amount":0.0,
      "created_at":"2019-01-07T20:11:22.820012Z",
      "left_coin":"XEM",
      "right_coin":"BTC",
      "filled_as":"maker",
      "closed_at":"2019-01-07T20:11:56.457616Z"
    },
    {
      "market":"XEM-BTC",
      "side":"SELL",
      "amount_paid":4.0,
      "amount_received":6.82e-05,
      "price":1.705e-05,
      "fee_amount":0.0,
      "created_at":"2019-01-04T04:06:53.187436Z",
      "left_coin":"XEM",
      "right_coin":"BTC",
      "filled_as":"maker",
      "closed_at":"2019-01-07T20:11:56.383562Z"
    }],
    "taker":[],
    "maker":[{
      "market":"XEM-BTC",
      "side":"SELL",
      "amount_paid":4.0,
      "amount_received":6.82e-05,
      "price":1.705e-05,
      "fee_amount":0.0,
      "created_at":"2019-01-04T04:06:53.187436Z",
      "left_coin":"XEM",
      "right_coin":"BTC",
      "filled_as":"maker",
      "closed_at":"2019-01-07T20:11:56.383562Z"
    },
    {
      "market":"XEM-BTC",
      "side":"SELL",
      "amount_paid":4.0,
      "amount_received":6.82e-05,
      "price":1.705e-05,
      "fee_amount":0.0,
      "created_at":"2019-01-07T20:11:22.820012Z",
      "left_coin":"XEM",
      "right_coin":"BTC",
      "filled_as":"maker",
      "closed_at":"2019-01-07T20:11:56.457616Z"
    }]
  }
}
```
This endpoint retrieves your trading history.

The `all` field contains maker and taker history ordered by most recent. Filtering by `market` is optional.

### HTTP Request
`GET /trading/history/`

### Query Parameters
| Parameter | Type | Required |  Description |
|---|---|---|---|---|
| market | String | No | List your trades filtering by `market` (e.g. `btc-mxn`). |


#Market Data [PUBLIC]
The following API calls retrieve information related to markets.

<aside class="notice">
You can access the following endpoints freely, API KEY is not required.
</aside>

## List Markets (Books)
```shell
curl -X GET "https://api.coinbtr.com/api/v1/trading/markets/"
```
> The API response will look like this:

```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "name": "BTC-MXN",
      "base": "MXN",
      "quote": "BTC"
    },
    {
      "id": 2,
      "name": "LTC-MXN",
      "base": "MXN",
      "quote": "LTC"
    },
    {
      "id": 3,
      "name": "DASH-MXN",
      "base": "MXN",
      "quote": "DASH"
    },
    {
      "id": 4,
      "name": "DASH-BTC",
      "base": "BTC",
      "quote": "DASH"
    },
    {
      "id": 3,
      "name": "LTC-BTC",
      "base": "BTC",
      "quote": "LTC"
    },
    {
      "id": 5,
      "name": "ZEC-BTC",
      "base": "BTC",
      "quote": "ZEC"
    }
  ]
}

```
This API call returns all existing markets (also known as "books") in Coinbtr.

### HTTP Request
`GET /trading/markets/`

### Query Parameters
| Parameter | Type | Required |  Description |
|---|---|---|---|---|
| market | String | No | Market name (e.g. `btc-mxn`). |

## List Market Orders (Orderbook)

```shell
MKT="btc-mxn"

curl -X GET "https://api.coinbtr.com/api/v1/trading/orders/?market=$MKT"
```
> The API response will look like this:

```json

  "success": true,
  "msg": null,
  "data": {
    "market": "BTC-MXN",
    "asks": [
      {
        "market": "BTC-MXN",
        "side": "SELL",
        "initial_amount": 0.16743,
        "amount": 0.16743,
        "filled": 0.0,
        "value": 12724.68,
        "initial_value": 12724.68,
        "price": 76000.0,
        "left_coin": "BTC",
        "right_coin": "MXN",
        "created_at": "2019-03-27T20:40:14.686939Z"
      },
      {
        "market": "BTC-MXN",
        "side": "SELL",
        "initial_amount": 0.252654,
        "amount": 0.252654,
        "filled": 0.0,
        "value": 19226.96,
        "initial_value": 19226.96,
        "price": 76100.0,
        "left_coin": "BTC",
        "right_coin": "MXN",
        "created_at": "2019-03-27T20:40:33.609201Z"
      }
    ],
    "bids": [
      {
        "market": "BTC-MXN",
        "side": "BUY",
        "initial_amount": 0.00269,
        "amount": 0.00269,
        "filled": 0.0,
        "value": 200.4,
        "initial_value": 200.4,
        "price": 74500.0,
        "left_coin": "BTC",
        "right_coin": "MXN",
        "created_at": "2019-03-27T20:42:09.944029Z"
      },
      {
        "market": "BTC-MXN",
        "side": "BUY",
        "initial_amount": 0.002,
        "amount": 0.002,
        "filled": 0.0,
        "value": 148.0,
        "initial_value": 148.0,
        "price": 74000.0,
        "left_coin": "BTC",
        "right_coin": "MXN",
        "created_at": "2019-03-27T20:41:09.127862Z"
      }
    ]
  }
}
```
This endpoint retrieves the 50 best sell and buy orders (also known as "orderbook") for a given market.

### HTTP Request
`GET /trading/orders/`

### Query Parameters
| Parameter | Type | Required |  Description |
|---|---|---|---|---|
| market | String | Yes | Market name (e.g. `btc-mxn`). |

## List last trades
```shell
MKT="ltc-btc"

curl -X GET "https://api.coinbtr.com/api/v1/trading/trades/?market=$MKT"
```
> The API response will look like this:

```json
{
  "success": true,
  "msg": null,
  "data": [
    {
      "created_at": "2019-02-20T03:20:53.549954Z",
      "price": "0.01276979",
      "amount": 1.0,
      "value": 0.01278
    },
    {
      "created_at": "2019-02-20T03:20:25.106036Z",
      "price": "0.01276979",
      "amount": 1.0,
      "value": 0.01278
    },
    {
      "created_at": "2019-02-20T03:20:05.758377Z",
      "price": "0.01276979",
      "amount": 1.0,
      "value": 0.01278
    },
    {
      "created_at": "2019-02-20T03:19:41.953355Z",
      "price": "0.01273489",
      "amount": 1.0,
      "value": 0.01277
    },
    {
      "created_at": "2019-02-20T03:07:43.574070Z",
      "price": "0.01270000",
      "amount": 1.0,
      "value": 0.01276979
    },
    {
      "created_at": "2019-02-20T03:05:56.810445Z",
      "price": "0.00426700",
      "amount": 0.1,
      "value": 0.00127697
    }
  ]
}
```
This endpoint returns the last 50 trades for a given market.

### HTTP Request
`GET /trading/trades/`

### Query Parameters
| Parameter | Type | Required |  Description |
|---|---|---|---|---|
| market | String | No | Market name (e.g. `btc-mxn`). |

## List trading fees
```shell
curl -X GET "https://api.coinbtr.com/api/v1/trading/fees/?market=ltc-btc&user_level=1"
```
> The API response will look like this:

```json
[
  {
    "market": "LTC-BTC",
    "taker": "0.00095000",
    "maker": "0.00075000",
    "user_level": 1,
    "lower_amount": 0.0,
    "upper_amount": 9.99999999
  },
  {
    "market": "LTC-BTC",
    "taker": "0.00090000",
    "maker": "0.00070000",
    "user_level": 1,
    "lower_amount": 10.0,
    "upper_amount": 19.99999999
  },
  {
    "market": "LTC-BTC",
    "taker": "0.00085000",
    "maker": "0.00065000",
    "user_level": 1,
    "lower_amount": 20.0,
    "upper_amount": 49.99999999
  },
  {
    "market": "LTC-BTC",
    "taker": "0.00075000",
    "maker": "0.00060000",
    "user_level": 1,
    "lower_amount": 50.0,
    "upper_amount": 499.99999999
  },
  {
    "market": "LTC-BTC",
    "taker": "0.00070000",
    "maker": "0.00055000",
    "user_level": 1,
    "lower_amount": 500.0,
    "upper_amount": 1799.99999999
  },
  {
    "market": "LTC-BTC",
    "taker": "0.00065000",
    "maker": "0.00050000",
    "user_level": 1,
    "lower_amount": 1800.0,
    "upper_amount": 10000.0
  }
]
```
Returns the trading fees. See [Trading fees](https://coinbtr.com/fees).

### HTTP Request
`GET /trading/fees/`

### Query Parameters
| Parameter | Type | Required |  Description |
|---|---|---|---|---|
| market | String | No | Market name (e.g. `btc-mxn`). |
| user_level | Integer | No | User level (e.g. 1). |
