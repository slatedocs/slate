---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby
  - python
  - javascript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the CoinDCX API!
<aside class="notice">The base URL for the API calls is `https://api.coindcx.com`, base URL for some public endpoint is `https://public.coindcx.com`. However, it will only be used where it is exclusively mentioned in the documentation. </aside>

You can get your API key and Secret as follows
<ul>
  <li>Go to your CoinDCX profile section</li>
  <li>Click `Access API dashboard`</li>
  <li>Click Create API key button and follow the process of verifications</li>
</ul>

> The python version used for API samples is 2.7

# Terminology

### Common

* `target currency` refers to the asset that is the `quantity` of a symbol.
* `base currency` refers to the asset that is the `price` of a symbol.
* `pair` uniquely idenfies the market along with it's exchange, and is available in market details api.
* `ecode` is used to specify the exchange for the given market. Valid values for ecode include:
  - `B`: Binance
  - `I`: CoinDCX
  - `HB`: HitBTC
  - `H`: Huobi
  - `BM`: BitMEX

### Orders

* `status`: used to denote the current status of the given order. Valid values for status include:
  - `init`: order is just created, but not placed in the orderbook
  - `open`: order is successfully placed in the orderbook
  - `partially_filled`: order is partially filled
  - `filled`: order is completely filled
  - `partially_cancelled`: order is partially filled, but cancelled, thus inactive
  - `cancelled`: order is completely or partially cancelled
  - `rejected`: order is rejected (not placed on the exchange

# Public endpoints

## Ticker
### HTTP Request
`GET /exchange/ticker`

```javascript
const request = require('request')

var baseurl = "https://api.coindcx.com"

request.get(baseurl + "/exchange/ticker",function(error, response, body) {
	console.log(body);
})
```
```python
import requests # Install requests module first.

url = "https://api.coindcx.com/exchange/ticker"

response = requests.get(url)
data = response.json()
print(data)
```
> Response

```json
[
  {
    "market": "REQBTC",
    "change_24_hour": "-1.621",
    "high": "0.00002799",
    "low": "0.00002626",
    "volume": "14.10",
    "last_price": "0.00002663",
    "bid": "0.00002663",
    "ask": "0.00002669",
    "timestamp": 1524211224
  }
]
```

### Definitions

<ul>
  <li>bid - Highest bid offer in the orderbook</li>
  <li>ask - Highest ask offer in the orderbook</li>
  <li>high - 24 hour high</li>
  <li>low - 24 hour low</li>
  <li>volume - Volume of the market in last 24 hours.</li>
  <li>timestamp - Time when this ticker was generated</li>
</ul>

<aside>A ticker is generated once every second</aside>


## Markets
### HTTP Request
`GET /exchange/v1/markets`

```javascript
const request = require('request')

var baseurl = "https://api.coindcx.com"

request.get(baseurl + "/exchange/v1/markets",function(error, response, body) {
	console.log(body);
})
```
```python
import requests # Install requests module first.

url = "https://api.coindcx.com/exchange/v1/markets"

response = requests.get(url)
data = response.json()
print(data)

```
> Respose:

```json
[
  "SNTBTC",
  "TRXBTC",
  "TRXETH"
  .
  .
]
```

Returns an array of strings of currently active markets.


## Markets details
### HTTP Request

`GET /exchange/v1/markets_details`

```javascript
const request = require('request')

var baseurl = "https://api.coindcx.com"

request.get(baseurl + "/exchange/v1/markets_details",function(error, response, body) {
	console.log(body);
})
```
```python
import requests # Install requests module first.

url = "https://api.coindcx.com/exchange/v1/markets_details"

response = requests.get(url)
data = response.json()
print(data)
```
> Response:

```json
[
  {
    "coindcx_name": "SNMBTC",
    "base_currency_short_name": "BTC",
    "target_currency_short_name": "SNM",
    "target_currency_name": "Sonm",
    "base_currency_name": "Bitcoin",
    "min_quantity": 1,
    "max_quantity": 90000000,
    "min_price": 5.66e-7,
    "max_price": 0.0000566,
    "min_notional": 0.001,
    "base_currency_precision": 8,
    "target_currency_precision": 0,
    "step": 1,
    "order_types": [ "take_profit", "stop_limit", "market_order", "limit_order" ],
    "symbol": "SNMBTC",
    "ecode": "B",
    "max_leverage": 3,
    "max_leverage_short": null,
    "pair": "B-SNM_BTC",
    "status": "active"
  }
]
```

### Definitions

<ul>
  <li>min_quantity - It is the minimum quantity of target currency (SNT) for which an order may be placed</li>
  <li>max_quantity - It is the maximum quantity of target currency (SNT) for which an order may be placed</li>
  <li>min_notional - It is the minimum amount of base currency (BTC) for which an order may be placed</li>
  <li>base_currency_precision - Number of decimals accepted for the base currency</li>
  <li>target_currency_precision - Number of decimals accepted for the target currency</li>
  <li>step - It is the minimum increment accepted for the target currency</li>
  <li>ecode - (Exchange code) It is the unique identifier for exchanges available on CoinDCX. For example: B(Binance), HB(HITBTC)  </li>
  <li>pair - It is a string created by (ecode, target_currency_short_name, base_currency_short_name). It can be used to connect to DcxStreams socket for API trading.</li>
</ul>


## Trades

<aside class="notice">The base URL for Trades API call is https://public.coindcx.com </aside>

### HTTP request
`GET /market_data/trade_history`

```python
import requests # Install requests module first.

url = "https://public.coindcx.com/market_data/trade_history?pair=B-BTC_USDT&limit=50" # Replace 'B-BTC_USDT' with your desired market pair.

response = requests.get(url)
data = response.json()
print(data)
```
```javascript
const request = require('request')

var baseurl = "https://public.coindcx.com"

// Replace the "B-BTC_USDT" with the desired market pair.
request.get(baseurl + "/market_data/trade_history?pair=B-BTC_USDT&limit=50",function(error, response, body) {
	console.log(body);
})
```

> Response

```json
[
  {
    "p": 11603.88,
    "q": 0.023519,
    "s": "BTCUSDT",
    "T": 1565163305770,
    "m": false
  }
]
```

### Query parameters
| Name   | Required | Example    |
|--------|----------|------------|
| pair   | Yes      | B-SNT_BTC  (`pair` from Market Details API)|
| limit  | No       | Default: 30; Max: 500|



This API provides with a sorted list of most recent 30 trades by default if limit parameter is not passed.
### Definitions
<ul>
  <li>p is the trade price</li>
  <li>q is the quantity</li>
  <li>s is the market name</li>
  <li>T is the timestamp of trade</li>
  <li>m stands for whether the buyer is market maker or not.</li>
</ul>


## Order book
<aside class="notice">The base URL for Order book API call is https://public.coindcx.com </aside>

```javascript
const request = require('request')

var baseurl = "https://public.coindcx.com"

// Replace the "B-BTC_USDT" with the desired market pair.
request.get(baseurl + "/market_data/orderbook?pair=B-BTC_USDT",function(error, response, body) {
	console.log(body);
})
```
```python
import requests # Install requests module first.

url = "https://public.coindcx.com/market_data/orderbook?pair=B-BTC_USDT" # Replace 'SNTBTC' with the desired market pair.

response = requests.get(url)
data = response.json()
print(data)

```
> Response

```json
{
  "bids":{
    "11570.67000000": "0.000871",
    "11570.58000000": "0.001974",
    "11570.02000000": "0.280293",
    "11570.00000000": "5.929216",
    "11569.91000000": "0.000871",
    "11569.89000000": "0.0016",
    ,
    ,
    ,
  },
  "asks":{
   "13900.00000000": "27.04094600",
    "13100.00000000": "15.48547100",
    "12800.00000000": "36.93142200",
    "12200.00000000": "92.04554800",
    "12000.00000000": "72.66595000",
    "11950.00000000": "17.16624600",
    ,
    ,
    ,
  },

```

### HTTP request
`GET /market_data/orderbook`

### Query parameters
| Name   | Required | Example |
|--------|----------|---------|
| pair | Yes      | B-BTC_USDT (`pair` from Market Details API) |

This API provides with a sorted list (in descending order) of bids and asks.

###


## Candles
<aside class="notice">The base URL for Candles API call is https://public.coindcx.com </aside>

```javascript
const request = require('request')

var baseurl = "https://public.coindcx.com"

// Replace the "B-BTC_USDT" with the desired market pair.
request.get(baseurl + "/market_data/candles?pair=B-BTC_USDT&interval=1m",function(error, response, body) {
	console.log(body);
})
```
```python
import requests # Install requests module first.

url = "https://public.coindcx.com/market_data/candles?pair=B-BTC_USDT&interval=1m" # Replace 'SNTBTC' with the desired market pair.

response = requests.get(url)
data = response.json()
print(data)

```
> Response

```json
[
  {
        "open": 0.011803, // open price
        "high": 0.011803, // highest price
        "low": 0.011803, // lowest price
        "volume": 0.35,  // total volume in terms of target currency (in BTC for B-BTC_USDT)
        "close": 0.011803, // close price
        "time": 1561463700000 //open time in ms
  }
  .
  .
  .
],

```

### HTTP request
`GET /market_data/candles`

### Query parameters
| Name   | Required | Example |
|--------|----------|---------|
| pair | Yes      | B-BTC_USDT (`pair` from Market Details API) |
| interval | Yes      | any of the valid intervals given below|
| startTime | No      | timestamp in ms, eg: `1562855417000` |
| endTime | No      | timestamp in ms, eg: `1562855417000`  |
| limit | No      | Default: 500; Max: 1000  |

This API provides with a sorted list (in descending order according to time key) of candlestick bars for given pair. Candles are uniquely identified by their time.

**Valid intervals**

m -> minutes, h -> hours, d -> days, w -> weeks, M -> months

* `1m`
- `5m`
- `15m`
- `30m`
- `1h`
- `2h`
- `4h`
- `6h`
- `8h`
- `1d`
- `3d`
- `1w`
- `1M`


###




# Authentication

<aside class="warning">All the Authenticated API calls use POST method. Parameters are to be passed as JSON in the request body. Every request must contain a timstamp parameter of when the request was generated.</aside>

> To authorize, use this code:

```ruby
  require 'net/http'
  require 'uri'
  require 'json'
  require 'openssl'



  secret = "Your secret key"
  key = "Your API key"


  payload = {
    "side" : "buy",
    "order_type" : "limit_order",
    "price_per_unit": 0.00001724,
    "market" : "SNTBTC",
    "total_quantity" : 100,
    "timestamp": 1524211224
  }.to_json

  signature = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), secret, payload)


  headers = {
    'Content-Type' => 'application/json',
    'X-AUTH-APIKEY' => key,
    'X-AUTH-SIGNATURE' => signature
  }

  uri = URI.parse("https://api.coindcx.com/exchange/v1/orders/create")

  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = true
  request = Net::HTTP::Post.new(uri.path, headers)

  request.body = payload

  response = https.request(request)
```

> Sample order creation with auth

```python
import hmac
import hashlib
import base64
import json
import time
import requests

# Enter your API Key and Secret here. If you don't have one, you can generate it from the website.
key = ""
secret = ""

# Generating a timestamp.
timeStamp = int(round(time.time() * 1000))

body = {
    "side": "buy",  #Toggle between 'buy' or 'sell'.
  "order_type": "limit_order", #Toggle between a 'market_order' or 'limit_order'.
  "market": "SNTBTC", #Replace 'SNTBTC' with your desired market pair.
  "price_per_unit": 0.03244, #This parameter is only required for a 'limit_order'
  "total_quantity": 400, #Replace this with the quantity you want
  "timestamp": timeStamp
}

json_body = json.dumps(body, separators = (',', ':'))

signature = hmac.new(secret, json_body, hashlib.sha256).hexdigest()

url = "https://api.coindcx.com/exchange/v1/orders/create"

headers = {
    'Content-Type': 'application/json',
    'X-AUTH-APIKEY': key,
    'X-AUTH-SIGNATURE': signature
}

response = requests.post(url, data = json_body, headers = headers)
data = response.json()
print(data)

```

```shell

```

```javascript
const request = require('request')
const crypto = require('crypto')

var baseurl = "https://api.coindcx.com"

var timeStamp = Math.floor(Date.now());

// Place your API key and secret below. You can generate it from the website.
key = "";
secret = "";


	body = {
		"side": "buy",	//Toggle between 'buy' or 'sell'.
		"order_type": "limit_order", //Toggle between a 'market_order' or 'limit_order'.
		"market": "SNTBTC", //Replace 'SNTBTC' with your desired market pair.
		"price_per_unit": "0.03244", //This parameter is only required for a 'limit_order'
		"total_quantity": 400, //Replace this with the quantity you want
		"timestamp": timeStamp
	}

	const payload = new Buffer(JSON.stringify(body)).toString();
	const signature = crypto.createHmac('sha256', secret).update(payload).digest('hex')

	const options = {
		url: baseurl + "/exchange/v1/orders/create",
		headers: {
			'X-AUTH-APIKEY': key,
			'X-AUTH-SIGNATURE': signature
		},
		json: true,
		body: body
	}

	request.post(options, function(error, response, body) {
		console.log(body);
	})
```

> Make sure to replace API key and API secret with your own.

The authentication procedure is as follows:
<ul>
  <li>The payload is the parameters object, JSON encoded</li>
`payload = parameters-object -> JSON encode`
  <br><br>
  <li>The signature is the hex digest of an HMAC-SHA256 hash where the message is your payload, and the secret key is your API secret.</li>
`signature = HMAC-SHA256(payload, api-secret).digest('hex')`
</ul>
<br>
 <p>After this, You will have to add following headers into all the authenticated requests</p>

| Header Name      | Value        |
|------------------|--------------|
| X-AUTH-APIKEY    | your-api-key |
| X-AUTH-SIGNATURE | signature    |

<aside class="notice">
You must replace <code>your-api-key</code> and <code>signature</code> with your personal API key and generated signature respectively.
</aside>

# User

## Get balances

```ruby

```

```python
import hmac
import hashlib
import base64
import json
import time
import requests

# Enter your API Key and Secret here. If you don't have one, you can generate it from the website.
key = ""
secret = ""

# Generating a timestamp
timeStamp = int(round(time.time() * 1000))

body = {
    "timestamp": timeStamp
}

json_body = json.dumps(body, separators = (',', ':'))

signature = hmac.new(secret, json_body, hashlib.sha256).hexdigest()

url = "https://api.coindcx.com/exchange/v1/users/balances"

headers = {
    'Content-Type': 'application/json',
    'X-AUTH-APIKEY': key,
    'X-AUTH-SIGNATURE': signature
}

response = requests.post(url, data = json_body, headers = headers)
data = response.json();
print(data);
```

```shell

```

```javascript
const request = require('request')
const crypto = require('crypto')

var baseurl = "https://api.coindcx.com"

var timeStamp = Math.floor(Date.now());
// To check if the timestamp is correct
console.log(timeStamp);

// Place your API key and secret below. You can generate it from the website.
key = "";
secret = ""


body = {
	"timestamp": timeStamp
}

const payload = new Buffer(JSON.stringify(body)).toString();
const signature = crypto.createHmac('sha256', secret).update(payload).digest('hex')

const options = {
	url: baseurl + "/exchange/v1/users/balances",
	headers: {
		'X-AUTH-APIKEY': key,
		'X-AUTH-SIGNATURE': signature
	},
	json: true,
	body: body
}

request.post(options, function(error, response, body) {
	console.log(body);
})
```

> Response:

```json
[
  {
    "currency": "BTC",
    "balance": 1.167,
    "locked_balance": 2.1
  }
]
```

> Locked balance is the balance currently being used by an open order

This endpoint retrieves account's balances.

### HTTP Request

`POST /exchange/v1/users/balances`

<!--######################## START user info ######################## -->
## Get user info

```ruby

```

```python
import hmac
import hashlib
import base64
import json
import time
import requests

# Enter your API Key and Secret here. If you don't have one, you can generate it from the website.
key = ""
secret = ""

# Generating a timestamp
timeStamp = int(round(time.time() * 1000))

body = {
  "timestamp": timeStamp
}

json_body = json.dumps(body, separators = (',', ':'))

signature = hmac.new(secret, json_body, hashlib.sha256).hexdigest()

url = "https://api.coindcx.com/exchange/v1/users/info"

headers = {
    'Content-Type': 'application/json',
    'X-AUTH-APIKEY': key,
    'X-AUTH-SIGNATURE': signature
}

response = requests.post(url, data = json_body, headers = headers)
data = response.json();
print(data);
```

```shell

```

```javascript
const request = require('request')
const crypto = require('crypto')

var baseurl = "https://api.coindcx.com"

var timeStamp = Math.floor(Date.now());
// To check if the timestamp is correct
console.log(timeStamp);

// Place your API key and secret below. You can generate it from the website.
key = "";
secret = ""


body = {
  "timestamp": timeStamp
}

const payload = new Buffer(JSON.stringify(body)).toString();
const signature = crypto.createHmac('sha256', secret).update(payload).digest('hex')

const options = {
  url: baseurl + "/exchange/v1/users/info",
  headers: {
    'X-AUTH-APIKEY': key,
    'X-AUTH-SIGNATURE': signature
  },
  json: true,
  body: body
}

request.post(options, function(error, response, body) {
  console.log(body);
})
```

> Response:

```json
[
  {
    "coindcx_id": "fda259ce-22fc-11e9-ba72-ef9b29b5db2b",
    "first_name": "First name",
    "last_name": "Last name",
    "mobile_number": "000000000",
    "email": "test@coindcx.com"
  }
]
```
> coindcx_id is the user id

This endpoint retrieves user info.

### HTTP Request

`POST /exchange/v1/users/info`

<!--######################## END user info ######################## -->


# Order
Enum definitions for the purpose of order are as follows:

| Name       | Values                    |
|------------|---------------------------|
| side       | buy, sell                 |
| order_type | market_order, limit_order |
| order_status | open, partially_filled, filled, cancelled, rejected, partially_cancelled, init|
| timestamp  | 1524211224                |
| ecode      | I, B, HB                  |

## New order

```ruby

```

```python
import hmac
import hashlib
import base64
import json
import time
import requests

# Enter your API Key and Secret here. If you don't have one, you can generate it from the website.
key = ""
secret = ""

# Generating a timestamp.
timeStamp = int(round(time.time() * 1000))

body = {
    "side": "buy",	#Toggle between 'buy' or 'sell'.
	"order_type": "limit_order", #Toggle between a 'market_order' or 'limit_order'.
	"market": "SNTBTC", #Replace 'SNTBTC' with your desired market pair.
	"price_per_unit": 0.03244, #This parameter is only required for a 'limit_order'
	"total_quantity": 400, #Replace this with the quantity you want
	"timestamp": timeStamp
}

json_body = json.dumps(body, separators = (',', ':'))

signature = hmac.new(secret, json_body, hashlib.sha256).hexdigest()

url = "https://api.coindcx.com/exchange/v1/orders/create"

headers = {
    'Content-Type': 'application/json',
    'X-AUTH-APIKEY': key,
    'X-AUTH-SIGNATURE': signature
}

response = requests.post(url, data = json_body, headers = headers)
data = response.json()
print(data)
```

```shell

```

```javascript
const request = require('request')
const crypto = require('crypto')

var baseurl = "https://api.coindcx.com"

var timeStamp = Math.floor(Date.now());

// Place your API key and secret below. You can generate it from the website.
key = "";
secret = "";


body = {
	"side": "buy",	//Toggle between 'buy' or 'sell'.
	"order_type": "limit_order", //Toggle between a 'market_order' or 'limit_order'.
	"market": "SNTBTC", //Replace 'SNTBTC' with your desired market.
	"price_per_unit": "0.03244", //This parameter is only required for a 'limit_order'
	"total_quantity": 400, //Replace this with the quantity you want
	"timestamp": timeStamp
}

const payload = new Buffer(JSON.stringify(body)).toString();
const signature = crypto.createHmac('sha256', secret).update(payload).digest('hex')

const options = {
	url: baseurl + "/exchange/v1/orders/create",
	headers: {
		'X-AUTH-APIKEY': key,
		'X-AUTH-SIGNATURE': signature
	},
	json: true,
	body: body
}

request.post(options, function(error, response, body) {
	console.log(body);
})

```

> Response:

```json
{
   "orders":[
     {
        "id":"ead19992-43fd-11e8-b027-bb815bcb14ed",
        "market":"TRXETH",
        "order_type":"limit_order",
        "side":"buy",
        "status":"open",
        "fee_amount":0.0000008,
        "fee":0.1,
        "total_quantity":2,
        "remaining_quantity":2.0,
        "avg_price":0.0,
        "price_per_unit":0.00001567,
        "created_at":"2018-04-19T18:17:28.022Z",
        "updated_at":"2018-04-19T18:17:28.022Z"
     }
   ]
}
```


Use this endpoint to place a new order on the exchange

### HTTP Request

`POST /exchange/v1/orders/create`

### Parameters

| Name           | Required | Example      | Description                                    |
|----------------|----------|--------------|------------------------------------------------|
| market         | Yes      | SNTBTC       | The trading pair                               |
| total_quantity | Yes      | 1.101        | Quantity to trade                              |
| price_per_unit | No       | 0.082        | Price per unit (not required for market order) |
| side           | Yes      | buy          | Specify buy or sell                            |
| order_type     | Yes      | market_order | Order Type                                     |
| timestamp      | Yes      | 1524211224   | When was the request generated                 |

## Create multiple orders

<aside class="notice">
Multiple ordering API is only supported for CoinDCX markets. Set ecode parameter as <code>I</code>
</aside>

```ruby

```

```python
import hmac
import hashlib
import base64
import json
import time
import requests

# Enter your API Key and Secret here. If you don't have one, you can generate it from the website.
key = ""
secret = ""

# Generating a timestamp.
timeStamp = int(round(time.time() * 1000))

body = {"orders":[
    "side": "buy",  #Toggle between 'buy' or 'sell'.
    "order_type": "limit_order", #Toggle between a 'market_order' or 'limit_order'.
    "market": "SNTBTC", #Replace 'SNTBTC' with your desired market pair.
    "price_per_unit": 0.03244, #This parameter is only required for a 'limit_order'
    "total_quantity": 400, #Replace this with the quantity you want
    "timestamp": timeStamp,
    "ecode": "I"
  ],
  [
    "side": "buy",  #Toggle between 'buy' or 'sell'.
    "order_type": "limit_order", #Toggle between a 'market_order' or 'limit_order'.
    "market": "SNTBTC", #Replace 'SNTBTC' with your desired market pair.
    "price_per_unit": 0.03244, #This parameter is only required for a 'limit_order'
    "total_quantity": 400, #Replace this with the quantity you want
    "timestamp": timeStamp,
    "ecode": "I"
  ]
}

json_body = json.dumps(body, separators = (',', ':'))

signature = hmac.new(secret, json_body, hashlib.sha256).hexdigest()

url = "https://api.coindcx.com/exchange/v1/orders/create_multiple"

headers = {
    'Content-Type': 'application/json',
    'X-AUTH-APIKEY': key,
    'X-AUTH-SIGNATURE': signature
}

response = requests.post(url, data = json_body, headers = headers)
data = response.json()
print(data)
```

```shell

```

```javascript
const request = require('request')
const crypto = require('crypto')

var baseurl = "https://api.coindcx.com"

var timeStamp = Math.floor(Date.now());

// Place your API key and secret below. You can generate it from the website.
key = "";
secret = "";


body = {"orders": [{
          "side": "buy",  //Toggle between 'buy' or 'sell'.
          "order_type": "limit_order", //Toggle between a 'market_order' or 'limit_order'.
          "market": "BTCINR", //Replace 'SNTBTC' with your desired market.
          "price_per_unit": "466330", //This parameter is only required for a 'limit_order'
          "total_quantity": 0.01, //Replace this with the quantity you want
          "timestamp": timeStamp,
          "ecode": "I"
        },
        {
          "side": "buy",  //Toggle between 'buy' or 'sell'.
          "order_type": "limit_order", //Toggle between a 'market_order' or 'limit_order'.
          "market": "BTCINR", //Replace 'SNTBTC' with your desired market.
          "price_per_unit": "466330", //This parameter is only required for a 'limit_order'
          "total_quantity": 0.01, //Replace this with the quantity you want
          "timestamp": timeStamp,
          "ecode": "I"
        }
      ]}

const payload = new Buffer(JSON.stringify(body)).toString();
const signature = crypto.createHmac('sha256', secret).update(payload).digest('hex')

const options = {
  url: baseurl + "/exchange/v1/orders/create_multiple",
  headers: {
    'X-AUTH-APIKEY': key,
    'X-AUTH-SIGNATURE': signature
  },
  json: true,
  body: body
}

request.post(options, function(error, response, body) {
  console.log(body);
})

```

> Response:

```json
{
   "orders":[
     {
        "id":"ead19992-43fd-11e8-b027-bb815bcb14ed",
        "market":"TRXETH",
        "order_type":"limit_order",
        "side":"buy",
        "status":"open",
        "fee_amount":0.0000008,
        "fee":0.1,
        "total_quantity":2,
        "remaining_quantity":2.0,
        "avg_price":0.0,
        "price_per_unit":0.00001567,
        "created_at":"2018-04-19T18:17:28.022Z",
        "updated_at":"2018-04-19T18:17:28.022Z"
     }
   ]
}
```


Use this endpoint to place a multiple orders on the exchange

### HTTP Request

`POST /exchange/v1/orders/create_multiple`

### Parameters in an array of objects

| Name           | Required | Example      | Description                                    |
|----------------|----------|--------------|------------------------------------------------|
| market         | Yes      | SNTBTC       | The trading pair                               |
| total_quantity | Yes      | 1.101        | Quantity to trade                              |
| price_per_unit | No       | 0.082        | Price per unit (not required for market order) |
| side           | Yes      | buy          | Specify buy or sell                            |
| order_type     | Yes      | market_order | Order Type                                     |
| timestamp      | Yes      | 1524211224   | When was the request generated                 |
| ecode          | Yes      | I            | Exchange code                                  |

##  Order status
```ruby

```

```python
import hmac
import hashlib
import base64
import json
import time
import requests

# Enter your API Key and Secret here. If you don't have one, you can generate it from the website.
key = ""
secret = ""

# Generating a timestamp.
timeStamp = int(round(time.time() * 1000))

body = {
    "id": "ead19992-43fd-11e8-b027-bb815bcb14ed", # Enter your Order ID here.
	"timestamp": timeStamp
}

json_body = json.dumps(body, separators = (',', ':'))

signature = hmac.new(secret, json_body, hashlib.sha256).hexdigest()

url = "https://api.coindcx.com/exchange/v1/orders/status"

headers = {
    'Content-Type': 'application/json',
    'X-AUTH-APIKEY': key,
    'X-AUTH-SIGNATURE': signature
}

response = requests.post(url, data = json_body, headers = headers)
data = response.json()
print(data)
```

```shell

```

```javascript
const request = require('request')
const crypto = require('crypto')

var baseurl = "https://api.coindcx.com"

var timeStamp = Math.floor(Date.now());
// To check if the timestamp is correct
console.log(timeStamp);

// Place your API key and secret below. You can generate it from the website.
key = "";
secret = "";


body = {
	"id": "qwd19992-43fd-14e8-b027-bb815bnb14ed", //Replace it with your Order ID.
	"timestamp": timeStamp
}

const payload = new Buffer(JSON.stringify(body)).toString();
const signature = crypto.createHmac('sha256', secret).update(payload).digest('hex')

const options = {
	url: baseurl + "/exchange/v1/orders/status",
	headers: {
		'X-AUTH-APIKEY': key,
		'X-AUTH-SIGNATURE': signature
	},
	json: true,
	body: body
}

request.post(options, function(error, response, body) {
	console.log(body);
})
```

> Response:

```json
{
  "id":"ead19992-43fd-11e8-b027-bb815bcb14ed",
  "market":"TRXETH",
  "order_type":"limit_order",
  "side":"buy",
  "status":"open",
  "fee_amount":0.0000008,
  "fee":0.1,
  "total_quantity":2,
  "remaining_quantity":2.0,
  "avg_price":0.0,
  "price_per_unit":0.00001567,
  "created_at":"2018-04-19T18:17:28.022Z",
  "updated_at":"2018-04-19T18:17:28.022Z"
}
```


Use this endpoint to fetch status of any order

### HTTP Request

`POST /exchange/v1/orders/status`

### Parameters

| Name      | Required | Example                              | Description                    |
|-----------|----------|--------------------------------------|--------------------------------|
| id        | Yes      | ead19992-43fd-11e8-b027-bb815bcb14ed | The ID of the order            |
| timestamp | Yes      | 1524211224                           | When was the request generated |


##  Multiple order status
```ruby

```

```python
import hmac
import hashlib
import base64
import json
import time
import requests

# Enter your API Key and Secret here. If you don't have one, you can generate it from the website.
key = ""
secret = ""

# Generating a timestamp.
timeStamp = int(round(time.time() * 1000))

body = {
  "ids": ["8a2f4284-c895-11e8-9e00-5b2c002a6ff4", "8a1d1e4c-c895-11e8-9dff-df1480546936"]
}

json_body = json.dumps(body, separators = (',', ':'))

signature = hmac.new(secret, json_body, hashlib.sha256).hexdigest()

url = "https://api.coindcx.com/exchange/v1/orders/status_multiple"

headers = {
    'Content-Type': 'application/json',
    'X-AUTH-APIKEY': key,
    'X-AUTH-SIGNATURE': signature
}

response = requests.post(url, data = json_body, headers = headers)
data = response.json()
print(data)
```

```shell

```

```javascript
const request = require('request')
const crypto = require('crypto')

var baseurl = "https://api.coindcx.com"

var timeStamp = Math.floor(Date.now());
// To check if the timestamp is correct
console.log(timeStamp);

// Place your API key and secret below. You can generate it from the website.
key = "";
secret = "";


body = {
  "ids": ["8a2f4284-c895-11e8-9e00-5b2c002a6ff4", "8a1d1e4c-c895-11e8-9dff-df1480546936"]
}

const payload = new Buffer(JSON.stringify(body)).toString();
const signature = crypto.createHmac('sha256', secret).update(payload).digest('hex')

const options = {
  url: baseurl + "/exchange/v1/orders/status_multiple",
  headers: {
    'X-AUTH-APIKEY': key,
    'X-AUTH-SIGNATURE': signature
  },
  json: true,
  body: body
}

request.post(options, function(error, response, body) {
  console.log(body);
})
```

> Response:

```json
[
  {
    "id":"ead19992-43fd-11e8-b027-bb815bcb14ed",
    "market":"TRXETH",
    "order_type":"limit_order",
    "side":"buy",
    "status":"open",
    "fee_amount":0.0000008,
    "fee":0.1,
    "total_quantity":2,
    "remaining_quantity":2.0,
    "avg_price":0.0,
    "price_per_unit":0.00001567,
    "created_at":"2018-04-19T18:17:28.022Z",
    "updated_at":"2018-04-19T18:17:28.022Z"
  }
]
```


Use this endpoint to fetch status of any order

### HTTP Request

`POST /exchange/v1/orders/status_multiple`

### Parameters

| Name | Required | Example        | Description        |
|------|----------|----------------|--------------------|
| ids  | Yes      | ["id1", "id3"] | Array of order IDs |



##  Active orders
```ruby

```

```python
import hmac
import hashlib
import base64
import json
import time
import requests

# Enter your API Key and Secret here. If you don't have one, you can generate it from the website.
key = ""
secret = ""

# Generating a timestamp.
timeStamp = int(round(time.time() * 1000))

body = {
	"side": "buy", # Toggle between a 'buy' or 'sell' order.
    "market": "SNTBTC", # Replace 'SNTBTC' with your desired market pair.
	"timestamp": timeStamp
}

json_body = json.dumps(body, separators = (',', ':'))

signature = hmac.new(secret, json_body, hashlib.sha256).hexdigest()

url = "https://api.coindcx.com/exchange/v1/orders/active_orders"

headers = {
    'Content-Type': 'application/json',
    'X-AUTH-APIKEY': key,
    'X-AUTH-SIGNATURE': signature
}

response = requests.post(url, data = json_body, headers = headers)
data = response.json()
print(data)
```

```shell

```

```javascript
const request = require('request')
const crypto = require('crypto')

var baseurl = "https://api.coindcx.com"

var timeStamp = Math.floor(Date.now());
// To check if the timestamp is correct
console.log(timeStamp);

// Place your API key and secret below. You can generate it from the website.
key = "";
secret = "";


body = {
	"side": "buy", //Toggle between 'buy' or 'sell'.
	"market": "SNTBTC", //Replace 'SNTBTC' with your desired market pair.
	"timestamp": timeStamp
}

const payload = new Buffer(JSON.stringify(body)).toString();
const signature = crypto.createHmac('sha256', secret).update(payload).digest('hex')

const options = {
	url: baseurl + "/exchange/v1/orders/active_orders",
	headers: {
		'X-AUTH-APIKEY': key,
		'X-AUTH-SIGNATURE': signature
	},
	json: true,
	body: body
}

request.post(options, function(error, response, body) {
	console.log(body);
})
```

> Response:

```json
[
  {
    "id":"ead19992-43fd-11e8-b027-bb815bcb14ed",
    "market":"TRXETH",
    "order_type":"limit_order",
    "side":"buy",
    "status":"open",
    "fee_amount":0.0000008,
    "fee":0.1,
    "total_quantity":2,
    "remaining_quantity":2.0,
    "avg_price":0.0,
    "price_per_unit":0.00001567,
    "created_at":"2018-04-19T18:17:28.022Z",
    "updated_at":"2018-04-19T18:17:28.022Z"
  }
]
```


Use this endpoint to fetch active orders

### HTTP Request

`POST /exchange/v1/orders/active_orders`

### Parameters

| Name      | Required | Example    | Description                    |
|-----------|----------|------------|--------------------------------|
| market    | Yes      | SNTBTC     |                                |
| side      | No       | buy        |                                |
| timestamp | Yes      | 1524211224 | When was the request generated |

## Account Trade history
```ruby

```

```python
import hmac
import hashlib
import base64
import json
import time
import requests

# Enter your API Key and Secret here. If you don't have one, you can generate it from the website.
key = ""
secret = ""

# Generating a timestamp.
timeStamp = int(round(time.time() * 1000))

body = {
  "from_id": 352622,
  "limit": 50
}

json_body = json.dumps(body, separators = (',', ':'))

signature = hmac.new(secret, json_body, hashlib.sha256).hexdigest()

url = "https://api.coindcx.com/exchange/v1/orders/trade_history"

headers = {
    'Content-Type': 'application/json',
    'X-AUTH-APIKEY': key,
    'X-AUTH-SIGNATURE': signature
}

response = requests.post(url, data = json_body, headers = headers)
data = response.json()
print(data)
```

```javascript
const request = require('request')
const crypto = require('crypto')

var baseurl = "https://api.coindcx.com"

var timeStamp = Math.floor(Date.now());
// To check if the timestamp is correct
console.log(timeStamp);

// Place your API key and secret below. You can generate it from the website.
key = "";
secret = "";


body = {
  "from_id": 352622,
  "limit": 50
}

const payload = new Buffer(JSON.stringify(body)).toString();
const signature = crypto.createHmac('sha256', secret).update(payload).digest('hex')

const options = {
  url: baseurl + "/exchange/v1/orders/trade_history",
  headers: {
    'X-AUTH-APIKEY': key,
    'X-AUTH-SIGNATURE': signature
  },
  json: true,
  body: body
}

request.post(options, function(error, response, body) {
  console.log(body);
})
```

> Response
```json
[
  {
    "id":                         564389,
    "order_id":                   "ee060ab6-40ed-11e8-b4b9-3f2ce29cd280",
    "side":                       "buy",
    "fee_amount":                 "0.00001129",
    "ecode":                      "B",
    "quantity":                   67.9,
    "price":                      0.00008272,
    "symbol":                     "SNTBTC",
    "timestamp":                  1533700109811
  }
]
```
Use this endpoint to fetch trades associated with your account

### HTTP Request

`POST /exchange/v1/orders/trade_history`

### Parameters

| Name    | Required | Example | Description                                                                           |
|---------|----------|---------|---------------------------------------------------------------------------------------|
| limit   | No       | 100     | Default 500                                                                           |
| from_id | No       | 28473   | Trade ID after which you want the data. If not supplied, latest trades would be given |



##  Active orders count
```ruby

```

```python
import hmac
import hashlib
import base64
import json
import time
import requests

# Enter your API Key and Secret here. If you don't have one, you can generate it from the website.
key = ""
secret = ""

# Generating a timestamp.
timeStamp = int(round(time.time() * 1000))

body = {
	"side": "buy", # Toggle between a 'buy' or 'sell' order.
    "market": "SNTBTC", # Replace 'SNTBTC' with your desired market pair.
	"timestamp": timeStamp
}

json_body = json.dumps(body, separators = (',', ':'))

signature = hmac.new(secret, json_body, hashlib.sha256).hexdigest()

url = "https://api.coindcx.com/exchange/v1/orders/active_orders_count"

headers = {
    'Content-Type': 'application/json',
    'X-AUTH-APIKEY': key,
    'X-AUTH-SIGNATURE': signature
}

response = requests.post(url, data = json_body, headers = headers)
data = response.json()
print(data)
```

```shell

```

```javascript
const request = require('request')
const crypto = require('crypto')

var baseurl = "https://api.coindcx.com"

var timeStamp = Math.floor(Date.now());
// To check if the timestamp is correct
console.log(timeStamp);

// Place your API key and secret below. You can generate it from the website.
key = "";
secret = "";


body = {
	"side": "buy", //Toggle between 'buy' or 'sell'.
	"market": "SNTBTC", //Replace 'SNTBTC' with your desired market pair.
	"timestamp": timeStamp
}

const payload = new Buffer(JSON.stringify(body)).toString();
const signature = crypto.createHmac('sha256', secret).update(payload).digest('hex')

const options = {
	url: baseurl + "/exchange/v1/orders/active_orders_count",
	headers: {
		'X-AUTH-APIKEY': key,
		'X-AUTH-SIGNATURE': signature
	},
	json: true,
	body: body
}

request.post(options, function(error, response, body) {
	console.log(body);
})
```

> Response:

```json
 { count: 1, status: 200 }
```


Use this endpoint to fetch active orders count

### HTTP Request

`POST /exchange/v1/orders/active_orders_count`

### Parameters

| Name      | Required | Example    | Description                    |
|-----------|----------|------------|--------------------------------|
| market    | Yes      | SNTBTC     |                                |
| side      | No       | buy        |                                |
| timestamp | Yes      | 1524211224 | When was the request generated |


##  Cancel all
```ruby

```

```python
import hmac
import hashlib
import base64
import json
import time
import requests

# Enter your API Key and Secret here. If you don't have one, you can generate it from the website.
key = ""
secret = ""

# Generating a timestamp.
timeStamp = int(round(time.time() * 1000))

body = {
	"side": "buy", # Toggle between a 'buy' or 'sell' order.
    "market": "SNTBTC", # Replace 'SNTBTC' with your desired market pair.
	"timestamp": timeStamp
}

json_body = json.dumps(body, separators = (',', ':'))

signature = hmac.new(secret, json_body, hashlib.sha256).hexdigest()

url = "https://api.coindcx.com/exchange/v1/orders/cancel_all"

headers = {
    'Content-Type': 'application/json',
    'X-AUTH-APIKEY': key,
    'X-AUTH-SIGNATURE': signature
}

response = requests.post(url, data = json_body, headers = headers)
data = response.json()
print(data)
```

```shell

```

```javascript
const request = require('request')
const crypto = require('crypto')

var baseurl = "https://api.coindcx.com"

var timeStamp = Math.floor(Date.now());
// To check if the timestamp is correct
console.log(timeStamp);

// Place your API key and secret below. You can generate it from the website.
key = "";
secret = "";


	body = {
		"side": "buy", //Toggle between 'buy' or 'sell'. Not compulsory
		"market": "SNTBTC", //Replace 'SNTBTC' with your desired market pair.
		"timestamp": timeStamp
	}

	const payload = new Buffer(JSON.stringify(body)).toString();
	const signature = crypto.createHmac('sha256', secret).update(payload).digest('hex')

	const options = {
		url: baseurl + "/exchange/v1/orders/cancel_all",
		headers: {
			'X-AUTH-APIKEY': key,
			'X-AUTH-SIGNATURE': signature
		},
		json: true,
		body: body
	}

	request.post(options, function(error, response, body) {
		console.log(body);
	})
```

> Response:

```json

```


Use this endpoint to cancel multiple active orders in a single API call

### HTTP Request

`POST /exchange/v1/orders/cancel_all`

### Parameters

| Name      | Required | Example    | Description                    |
|-----------|----------|------------|--------------------------------|
| market    | Yes      | SNTBTC     |                                |
| side      | No       | buy        |                                |
| timestamp | Yes      | 1524211224 | When was the request generated |

Sending side param is optional. You may cancel all the sell orders of SNTBTC by sending
<br>
<code>{market: "SNTBTC", side  : "sell"}</code>


Or you may cancel all your orders in SNTBTC market by sending
<br>
<code>{market: "SNTBTC"}</code>


##  Cancel  multiple By Ids
```ruby

```

```python
import hmac
import hashlib
import base64
import json
import time
import requests

# Enter your API Key and Secret here. If you don't have one, you can generate it from the website.
key = ""
secret = ""

# Generating a timestamp.
timeStamp = int(round(time.time() * 1000))

body = {
  "ids": ["8a2f4284-c895-11e8-9e00-5b2c002a6ff4", "8a1d1e4c-c895-11e8-9dff-df1480546936"]
}

json_body = json.dumps(body, separators = (',', ':'))

signature = hmac.new(secret, json_body, hashlib.sha256).hexdigest()

url = "https://api.coindcx.com/exchange/v1/orders/cancel_by_ids"

headers = {
    'Content-Type': 'application/json',
    'X-AUTH-APIKEY': key,
    'X-AUTH-SIGNATURE': signature
}

response = requests.post(url, data = json_body, headers = headers)
data = response.json()
print(data)
```

```shell

```

```javascript
const request = require('request')
const crypto = require('crypto')

var baseurl = "https://api.coindcx.com"

var timeStamp = Math.floor(Date.now());
// To check if the timestamp is correct
console.log(timeStamp);

// Place your API key and secret below. You can generate it from the website.
key = "";
secret = "";


  body = {
    ids: ["8a2f4284-c895-11e8-9e00-5b2c002a6ff4", "8a1d1e4c-c895-11e8-9dff-df1480546936"]
  }

  const payload = new Buffer(JSON.stringify(body)).toString();
  const signature = crypto.createHmac('sha256', secret).update(payload).digest('hex')

  const options = {
    url: baseurl + "/exchange/v1/orders/cancel_by_ids",
    headers: {
      'X-AUTH-APIKEY': key,
      'X-AUTH-SIGNATURE': signature
    },
    json: true,
    body: body
  }

  request.post(options, function(error, response, body) {
    console.log(body);
  })
```

> Response:

```json

```


Use this endpoint to cancel multiple active orders in a single API call

### HTTP Request

`POST /exchange/v1/orders/cancel_by_ids`

### Parameters

| Name | Required | Example        | Description        |
|------|----------|----------------|--------------------|
| ids  | Yes      | ["id1", "id3"] | Array of order IDs |



##  Cancel
```ruby

```

```python
import hmac
import hashlib
import base64
import json
import time
import requests

# Enter your API Key and Secret here. If you don't have one, you can generate it from CoinDCX website.
key = ""
secret = ""

# Generating a timestamp.
timeStamp = int(round(time.time() * 1000))

body = {
    "id": "ead19992-43fd-11e8-b027-bb815bcb14ed", # Enter your Order ID here.
	"timestamp": timeStamp
}

json_body = json.dumps(body, separators = (',', ':'))

signature = hmac.new(secret, json_body, hashlib.sha256).hexdigest()

url = "https://api.coindcx.com/exchange/v1/orders/cancel"

headers = {
    'Content-Type': 'application/json',
    'X-AUTH-APIKEY': key,
    'X-AUTH-SIGNATURE': signature
}

response = requests.post(url, data = json_body, headers = headers)
data = response.json()
print(data)
```

```shell

```

```javascript
const request = require('request')
const crypto = require('crypto')

var baseurl = "https://api.coindcx.com"

var timeStamp = Math.floor(Date.now());
// To check if the timestamp is correct
console.log(timeStamp);

// Place your API key and secret below. You can generate it from the website.
key = "";
secret = "";


body = {
	"id": "ead19992-43fd-11e8-b027-bb815bcb14ed", //Replace this with your Order ID.
	"timestamp": timeStamp
}

const payload = new Buffer(JSON.stringify(body)).toString();
const signature = crypto.createHmac('sha256', secret).update(payload).digest('hex')

const options = {
	url: baseurl + "/exchange/v1/orders/cancel",
	headers: {
		'X-AUTH-APIKEY': key,
		'X-AUTH-SIGNATURE': signature
	},
	json: true,
	body: body
}

request.post(options, function(error, response, body) {
	console.log(body);
})

```

> Response:

```json

```


Use this endpoint to cancel an active orders

### HTTP Request

`POST /exchange/v1/orders/cancel`

### Parameters

| Name      | Required | Example                              | Description                    |
|-----------|----------|--------------------------------------|--------------------------------|
| id        | Yes      | ead19992-43fd-11e8-b027-bb815bcb14ed | The ID of the order            |
| timestamp | Yes      | 1524211224                           | When was the request generated |









<!-- ------------------- START Sockets ---------------------- -->

# Sockets
<!-- <aside class="notice">Sockets are currently available only for the INR market.</aside> -->

## PUBLIC

<h3>To connect to public socket</h3>

Refer to the right panel.

```python
import socketio

socketEndpoint = 'wss://stream.coindcx.com'
sio = socketio.Client()

sio.connect(socketEndpoint, transports = 'websocket')
sio.emit('join', { 'channelName': 'channelName' })

# Listen update on channelName
@sio.on('channelName')
def on_message(response):
    print(response.data)

# leave a channel
sio.emit('leave', { 'channelName' : channelName })

```

```javascript
import io from 'socket.io-client';

const socketEndpoint = "wss://stream.coindcx.com";

const socket = io(socketEndpoint, {
  transports: ['websocket']
});


//Join Channel
socket.emit('join', {
  'channelName': "channelName",
});

//Listen update on channelName
socket.on('eventName', (response) => {
  console.log(response.data);
});

// leave a channel
socket.emit('leave', {
  'channelName': channelName
});
```

## Order book

### Definitions
<ul>
  <li><strong>Channel: </strong>use 'pair' from Markets details API response(Example: B-SNM_BTC,B-XRP_ETH, HB-SWM_BTC).</li>
  <li><strong>Event: </strong>depth-update</li>
</ul>


### Response
<ul>
  <li>a stand for asks</li>
  <li>b stand for bids</li>
</ul>

```python
@sio.on('depth-update')
def on_message(response):
    print(response.data.a) # asks
    print(response.data.b) # bids
```

```javascript
socket.on("depth-update", (response) => {
  console.log(response.data.a); //asks
  console.log(response.data.b); //bids
});
```

> Order book response:

```json
{
  "a": [["251005.00000000", 0.019]],
  "b": [["251009.00000000", 0.029]]
}
```

## Trades

### Definitions
<ul>
  <li><strong>Channel: </strong>use 'pair' from Markets details API response(Example: B-SNM_BTC,B-XRP_ETH, HB-SWM_BTC). </li>
  <li><strong>Event: </strong>new-trade</li>
</ul>


### Response
<ul>
  <li>m stands for whether the buyer is market maker or not</li>
  <li>p is the trade price</li>
  <li>q is the quantity</li>
  <li>T is the timestamp of trade</li>
  <li>s is the symbol(currency)</li>
</ul>

```python
@sio.on('new-trade')
def on_message(response):
  print(response.data)
```

```javascript
socket.on("new-trade", (response) => {
  console.log(response.data);
});
```

> Trade response:

```json
{
  "T": 1545896665076.92,
  "p": 0.9634e-4,
  "q": 0.1e1,
  "s": "XRPBTC",
  "m": true
}
```

## ACCOUNT

<h3>To connect to the account socket</h3>

Get your API key and Secret by simply following these steps:
<ul>
  <li>Go to the profile section on CoinDCX</li>
  <li>Click on `Access API dashboard`</li>
  <li>Click on `Create API key` and follow the process of verification</li>
</ul>

Refer to the right panel.

```python

import socketio
import hmac
import hashlib
import json
socketEndpoint = 'wss://stream.coindcx.com'
sio = socketio.Client()

sio.connect(socketEndpoint, transports = 'websocket')

secret = 'secret'
key = 'key'

body={"channel":"coindcx"}
json_body=json.dumps(body, separators = (',', ':'))
signature=hmac.new(secret, json_body, digestmod=hashlib.sha256).hexdigest()

# Join channel
sio.emit('join', { 'channelName': 'coindcx', 'authSignature': signature, 'apiKey' : key })

# Listen update on eventName
@sio.on('eventName')
def on_message(response):
    print(response.data)

# leave a channel
sio.emit('leave', { 'channelName' : 'coindcx' })

```

```javascript

import io from 'socket.io-client';
const socketEndpoint = "wss://stream.coindcx.com";

//connect to server.
const socket = io(socketEndpoint, {
  transports: ['websocket']
});

const secret = "secret";
const key = "key";


const body = { channel: "coindcx" };
const payload = new Buffer(JSON.stringify(body)).toString();
const signature = crypto.createHmac('sha256', secret).update(payload).digest('hex')

//Join channel
socket.emit('join', {
  'channelName': "coindcx",
  'authSignature': signature,
  'apiKey' : key
});


//Listen update on eventName
socket.on("eventName", (response) => {
  console.log(response.data);
});


// In order to leave a channel
socket.emit('leave', {
  'channelName': 'coindcx'
});
```

## Balances

### Definitions
<ul>
  <li><strong>Channel:</strong> coindcx</li>
  <li><strong>Event:</strong> balance-update</li>
</ul>


### Response
<ul>
  <li>balance is the usable balance</li>
  <li>Locked balance is the balance currently being used by an open order</li>
  <li>currency is the currency like LTC, BTC etc.</li>
</ul>

```python
@sio.on('balance-update')
def on_message(response):
  if response.event == 'balance-update':
    print(response.data)
```

```javascript
socket.on("balance-update", (response) => {
  if (response.event == "balance-update") {
    console.log(response.data);
  }
});
```

> Balance update response:

```json
{
  "balance": "1000.00000000",
  "locked_balance": "1.00000000",
  "currency": "XRP"
}
```

## Trades

### Definitions
<ul>
  <li><strong>Channel:</strong> coindcx</li>
  <li><strong>Event:</strong> trade-update</li>
</ul>

### Response
<ul>
  <li>o is client order id / system generated order id</li>
  <li>t is trade id</li>
  <li>s is symbol/market (LTCBTC)</li>
  <li>p is price</li>
  <li>q is quantity</li>
  <li>T is timestamp</li>
  <li>m stands for whether the buyer is market maker or not.</li>
  <li>f is fee amount</li>
  <li>e is exchange identifier</li>
  <li>x is status</li>
</ul>

```python
@sio.on('trade-update')
def on_message(response):
    print(response.data)
```

```javascript
socket.on("trade-update", (response) => {
  console.log(response.data);
});
```


> Trade update response:

```json
[{
  "o": "28c58ee8-09ab-11e9-9c6b-8f2ae34ea8b0",
  "t": "17105",
  "s": "XRPBTC",
  "p": "0.00009634",
  "q": "1.0",
  "T": 1545896665076.92,
  "m": true,
  "f": "0.000000009634",
  "e": "I",
  "x": "filled"
}]
```
<!-- ------------------- END Sockets ---------------------- -->

<!--

# API call limits
We have rate limits in place to facilitate availability of our resources to a wider set of people. Typically you can place around 4 orders per second. The exact number depends on the server load.
In aggregate, you may call `https//api.coindcx.com` not more than 10 times per second. -->
