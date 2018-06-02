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

CoinBTR provides a simple and practical REST API to help you to automatically perform nearly all actions you can at `coinbtr.com`.


## General considerations

Before making API calls consider the following:

* All requests use the `application/json` content type and go over `https`. The base url is `https://api.coinbtr.com/v1/`.
* All requests are `GET`, `POST` and `PUT` requests and all responses come in a default response object with the result in the result field.
* Always check the `success` flag to ensure that your API call succeeded.

## HTTP API Responses

CoinBTR REST API calls will always return a JSON Object.

* Successful API calls will response a JSON  objects that looks like:

`{
  "success": true,
  "msg":"",
  "data": {
    RELATED_DATA_HERE
    }
  }`

* Unsuccessful API calls will response a JSON  objects that looks like:

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

In the spirit of keeping things simple, we offer an easy to manage API Key authentication method. You can have multiple API keys, each with their own level of rights. To manage your API keys please go to Settings > Manage API Keys.

# Profile Operations

## Profile information
### HTTP Request
`GET /api/v1/wallet/user/profile`

```shell
curl "api_endpoint_here"
  -H "Authorization: meowmeowmeow"
```

## Session information
### HTTP Request
`GET /api/v1/user/session`

# Wallet Operations

## Get Deposit Address

```shell
COINBTR_TOKEN='your_token_id'
COIN=btc

curl -X POST \
-H "Content-Type: application/json" \
-H "Authorization: Token $COINBTR_TOKEN" \
-d "{ \"coin\": \"$COIN\" }" \
https://coinbtr.com/api/v1/wallet/getdepositaddress
```

This API call will bring you a deposit address funding cryptocurrency wallet.


### HTTP Request
`GET /api/v1/wallet/getdepositaddress`

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

## Withdraw
```shell
COINBTR_TOKEN='your_token_id'
ADDRESS='2N9JiEUYgRwKAw6FfnUca54VUeaSYSL9qqG'
COIN=btc
AMOUNT=0.001

curl -X POST \
-H "Content-Type: application/json" \
-H "Authorization: Token $COINBTR_TOKEN" \
-d "{ \"coin\": \"$COIN\", \"address\": \"$ADDRESS\", \"amount\": $AMOUNT }" \
https://coinbtr.com/api/v1/wallet/withdraw
```
This API call allows you to send cryptocurrencies to a given destination address.


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

## List Balances
```shell
COINBTR_TOKEN='your_token_id'

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
	"success" : true,
	"message" : "",
	"data" : [{
			"coin" : "LTC",
			"balance" : 0.00000000,
			"available" : 0.00000000,
			"pending" : 0.00000000,
			"depositAddress" : "DLxcEt3AatMyr2NTatzjsfHNoB9NT62HiF"
		}, {
			"coin" : "BTC",
			"balance" : 14.21549076,
			"available" : 14.21549076,
			"pending" : 0.00000000,
			"depositAddress" : "1Mrcdr6715hjda34pdXuLqXcju6qgwHA31"
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
### HTTP Request
`GET /api/v1/wallet/listwithdraws`

## List Deposits
### HTTP Request
`GET /api/v1/wallet/listdeposits`

#Trading Operations

## Place a buy limit order
### HTTP Request
`POST /api/v1/trading/place/buylimit`

## Place a sell limit order
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


> In order of getting acces to the API. You need to get a customized API key from profile > settings > API Keys. Make sure to allow the proper

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
```

> Make sure to replace `meowmeowmeow` with your API key.

Kittn uses API keys to allow access to the API. You can register a new Kittn API key at our [developer portal](http://example.com/developers).

Kittn expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow`

<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside>


# Kittens

## Get All Kittens

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
```

```shell
curl "http://example.com/api/kittens"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let kittens = api.kittens.get();
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

## Delete a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.delete(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.delete(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -X DELETE
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.delete(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "deleted" : ":("
}
```

This endpoint deletes a specific kitten.

### HTTP Request

`DELETE http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete
