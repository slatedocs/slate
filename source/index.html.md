---
title: Tauros API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - python
  - javascript
  - php

toc_footers:
  - <a href='https://tauros.io/signup'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Change Log

## 2021-08-24

- Update endpoint for query markets orderbooks

- Update endpoint for query markets trades

- Update webhook notification types

## 2021-03-04

- Private websocket deprecation. We recommend to use webhooks instead for realtime account feed.

- Update webhook notification types

- Replace public socket.io by native websocket

- Update get deposit address endpoint

## 2020-07-20

- New public endpoint for quering tickers.

- PHP sample code for requests signing fixed.

## 2020-07-08

- New API Key features:

  - A trusted IP addresses list can be added to an API Key.

- Authentication layer enhanced. Request signing is now required.

  - `Taur-Nonce` header is required for private endpoints. See [what is a nonce](#what-is-a-nonce).
  - `Taur-Signature` header is required for private endpoints. See [message signing](#signing-a-message).

- New withdrawal endpoints:

  - POST /api/v2/wallets/crypto-withdraw/
  - POST /api/v2/wallets/mxn-withdraw/
  - POST /api/v2/wallets/inner-transfer/

- New endpoint for listing user trades (it allows pagination):
- GET /api/v2/trading/my-trades/

# Introduction

Tauros provides a simple and practical REST API to help you to automatically perform nearly all actions you can do in the [Tauros](https://tauros.io) web app.

## General considerations

Before to start developing on the Tauros API consider the following:

- It is recommended to create an account in the [Staging Tauros](https://staging.tauros.io) web app. Staging environment uses testnet coins.
- Enable "Developer Mode" in your profile section to create an API Key and an API Secret.
- The API base url is `https://api.staging.tauros.io/api/` for staging environment and `https://api.tauros.io/api/` for production.
- All private enpoints requests require message signing.
- Check the `success` flag to ensure that your API call succeeded.
- All requests use the `application/json` content type and go over `https`.
- If something goes wrong look at the `msg` field. There you will find the error description.

## HTTP API Responses

Tauros REST API calls will return a JSON Object.

- A typical successful API call will send as response a JSON object that looks like:

`{ "success": true, "msg": null, "payload": { RELATED_DATA_HERE } }`

- An unsuccessful API call will send as response a JSON object that looks like:

`{ "success": false, "msg": ERROR_DESCRIPTION }`

# Authentication

## Create an API Key

In order to use our platform through API calls you must first enable `Developer Mode` in your profile section.
Once enabled, you can create and configure as many API Keys as you need. API keys can be configurated with its own level of permissions.

## API Key Permissions

You can restrict the functionality of API keys. Before creating a key, you must choose what permissions you would like the key to have. The permissions are:

- `trading` - Allows a key to perform trading operations (read, place or delete orders).
- `withdraw` - Allows a key to withdraw funds (**Enable with caution**).
- `reading` - Allows a key to read account data.
- `check_ips` - Designates wheter the client IP must be validated.
- `ips` - List of trusted IP addresses (by default is empty). Checking is done only if `check_ips` permission is enabled.
- `enabled` - Designates wheter the key is enabled to be used.

## Creating a Request

All private requests must include the following headers:

- `'Authorization: Bearer API_KEY'` - Authorization header that includes the API Key.
- `'Taur-Nonce: NONCE'` - A number that uniquely identifies each call to the API (see What is a nonce?).
- `'Taur-Signature: SIGNATURE'`- The base64-encoded signature (see Signing a Message)

All request bodies should have content type `application/json` and be valid JSON.

## What is a nonce?

A nonce is a number that uniquely identifies each API request. A nonce is required for all requests to the private endpoints. It must be included in the `Taur-Nonce` header.

Our nonce is implemented as a counter that must be unique and must increase with each call to the API. For example, assuming a starting nonce of 0, valid subsequent nonce values would be 1, 2, 3, and so on.

## Signing a Message

```shell
API_URL=https://api.staging.tauros.io
API_KEY="TAUROS_API_KEY"
API_SECRET="TAUROS_API_SECRET"

NONCE=$(date +%s)

METHOD=POST

REQUEST_PATH="/api/v1/trading/placeorder/"

DATA='{"market":"BTC-MXN","amount":"0.001","side":"SELL","type":"LIMIT","price":"250000"}'

MESSAGE=$NONCE$METHOD$REQUEST_PATH$DATA

MESSAGE_SHA256=$(echo -n $MESSAGE | openssl dgst -binary -sha256)

API_SECRET_DECODED=$(echo $API_SECRET | base64 -d)

SIGNATURE=$(echo -n $MESSAGE_SHA256 | openssl dgst -binary -sha512 -hmac $API_SECRET_DECODED | base64 | sed ':a;N;$!ba;s/\n//g')

curl -X $METHOD $API_URL$REQUEST_PATH \
  -H "Content-Type: application/json" \
  -H "Taur-Nonce: $NONCE" \
  -H "Taur-Signature: $SIGNATURE" \
  -H "Authorization: Bearer $API_KEY" \
  -d "$DATA";
```

```python
import requests
import json
import time
import hmac
import hashlib
import base64
from urllib.parse import urlencode

api_url = 'https://api.staging.tauros.io'
api_key = 'TAUROS_API_KEY'
api_secret = 'TAUROS_API_SECRET'

path = '/api/v1/trading/placeorder/'

data = {
    "market": "BTC-MXN",
    "amount": "0.001",
    "side": "SELL",
    "type": "LIMIT",
    "price": "250000",
}
method = 'post'
nonce = str(int(1000*time.time()))
request_data = urlencode(data)
message = str(nonce) + method.upper() + path + request_data
api_sha256 = hashlib.sha256(message.encode()).digest()
api_hmac = hmac.new(base64.b64decode(api_secret), api_sha256, hashlib.sha512)
api_signature = base64.b64encode(api_hmac.digest())
signature = api_signature.decode()

headers = {
    'Authorization': 'Bearer {}'.format(api_key),
    'Taur-Signature': signature,
    'Taur-Nonce': nonce,
    'Content-Type': 'application/json',
}

server_res = requests.request(
    method=method,
    url=api_url + path,
    headers=headers,
    data=json.dumps(data),
)

server_res.status_code # 200 ok
server_res.json() # {...}
```

```javascript
const crypto = require("crypto");
const fetch = require("node-fetch");

const URL_API = "https://api.staging.tauros.io";

const api_key = "TAUROS_API_KEY";
const api_secret = "TAUROS_API_SECRET";

let path = "/api/v1/trading/placeorder/";

let method = "POST";

let data = {
  market: "BTC-MXN",
  amount: "0.001",
  side: "SELL",
  type: "LIMIT",
  price: "250000",
};

let nonce = Date.now() / 1000;
nonce = nonce.toString().replace(".", "");

// make signature
let body = JSON.stringify(data);

let message = nonce + method.toUpperCase() + path + body;

let api_sha256 = crypto.createHash("sha256").update(message).digest();

// create a sha512 hmac with the secret
let hmac = crypto.createHmac("sha512", Buffer.from(api_secret, "base64"));

let signature = hmac.update(api_sha256).digest("base64");

let headers = {
  "Content-Type": "application/json",
  Authorization: "Bearer " + api_key,
  "Taur-Nonce": nonce,
  "Taur-Signature": signature,
};

let request = {
  method: method,
  headers: headers,
  body: JSON.stringify(data),
};

fetch(URL_API + path, request)
  .then((res) =>
    res.ok ? res.json() : { status_code: res.status, message: res.statusText }
  )
  .then((json) => {
    console.log(json);
  })
  .catch((err) => {
    console.log(err.message);
  });
```

```php
<?php

$apiUrl = 'https://api.staging.tauros.io';
$apiKey = 'TAUR_API_KEY';
$apiSecret = 'TAUR_API_SECRET';

$path = '/api/v1/enable-developer-mode/';

$data = array(
   "password" => "hola1425"
);

$method = 'post';
$microTime = explode(' ', microtime());
$nonce = $microTime[1] . str_pad(substr($microTime[0], 2, 6), 6, '0');

$requestData = json_encode($data, JSON_FORCE_OBJECT);
$message = $nonce . strtoupper($method) . $path . $requestData;
$apiSha256 = hash('sha256', utf8_encode($message), true);
$apiHmac = hash_hmac('sha512', $apiSha256, base64_decode($apiSecret), true);
$signature = base64_encode($apiHmac);

$headers = array(
    "Content-Type: application/json",
    "Taur-Signature: " . $signature,
    "Taur-Nonce: " . $nonce,
    "Authorization: Bearer " . $apiKey
);

$options = array(
    CURLOPT_POST => true,
    CURLOPT_FOLLOWLOCATION => false,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_HTTPHEADER => $headers,
    CURLOPT_POSTFIELDS => json_encode($data, JSON_FORCE_OBJECT),
);

$handler = curl_init($apiUrl . $path);
curl_setopt_array($handler, $options);
$result = curl_exec($handler);
$status = curl_getinfo($handler, CURLINFO_HTTP_CODE);


if ($result === false) {
    die(curl_error($handler));
}
var_dump($status);
echo "<br>";
var_dump($result);

curl_close($handler);
```

The `Taur-Signature` header (message signature) is generated using HMAC-SHA512 of SHA256(`nonce` + `method` + `requestPath` + `body`) and base64 decoded secret API Key. Where + means string concatenation.

- The `nonce` value is the same as the `Taur-Nonce` header.
- The `body` is the request body string or omitted if there is no request body (for GET requests, mainly).
- The `method` should be UPPER CASE.

### Example API clients

Below are sample API client code libraries that can be used when writing your own API client.

### Python

[https://github.com/coinbtr/tauros-api-python](https://github.com/coinbtr/tauros-api-python)

### Node.js

[https://github.com/coinbtr/tauros-api-nodejs](https://github.com/coinbtr/tauros-api-nodejs)

### Php

[https://github.com/coinbtr/tauros-api-php](https://github.com/coinbtr/tauros-api-php)

# Currencies [PUBLIC]

<aside class="notice">
You can access the following endpoints freely, API KEY is not required.
</aside>
## List available currencies
```shell
curl -X GET "https://api.tauros.io/api/v2/coins/"
```
> The API call will response this:

```json
{
  "success": true,
  "payload": {
    "cryto": [
      {
        "coin": "BTC",
        "coin_name": "Bitcoin",
        "min_withdraw": "0.00050000",
        "fee_withdraw": 0.0002,
        "confirmations_required": 4,
        "coin_icon": "https://static.coinbtr.com/media/coins/BTC_9ItLsUF.png",
        "available_to_deposit": true,
        "available_to_withdraw": true
      },
      {
        "coin": "BEMB",
        "coin_name": "Bitcoin Embassy Bar",
        "min_withdraw": "5.00000000",
        "fee_withdraw": 1,
        "confirmations_required": 10,
        "coin_icon": "https://static.coinbtr.com/media/coins/BEMB_Po8mN3B.png",
        "available_to_deposit": false,
        "available_to_withdraw": true
      },
      {
        "coin": "ZEC",
        "coin_name": "ZCash",
        "min_withdraw": "0.08500000",
        "fee_withdraw": 0.05,
        "confirmations_required": 25,
        "coin_icon": "https://static.coinbtr.com/media/coins/ZEC_hecsnl7.png",
        "available_to_deposit": true,
        "available_to_withdraw": false
      },
      {
        "coin": "LTC",
        "coin_name": "Litecoin",
        "min_withdraw": "0.00500000",
        "fee_withdraw": 0.0035,
        "confirmations_required": 6,
        "coin_icon": "https://static.coinbtr.com/media/coins/LTC_O4Ktdtr.png",
        "available_to_deposit": true,
        "available_to_withdraw": true
      },
      {
        "coin": "XLM",
        "coin_name": "Stellar",
        "min_withdraw": "2.00000000",
        "fee_withdraw": 1,
        "confirmations_required": 10,
        "coin_icon": "https://static.coinbtr.com/media/coins/XLM_UKjRoth.png",
        "available_to_deposit": true,
        "available_to_withdraw": true
      },
      {
        "coin": "BCH",
        "coin_name": "Bitcoin Cash",
        "min_withdraw": "0.00200000",
        "fee_withdraw": 0.001,
        "confirmations_required": 6,
        "coin_icon": "https://static.coinbtr.com/media/coins/BCH_IlW6auL.png",
        "available_to_deposit": true,
        "available_to_withdraw": true
      },
      {
        "coin": "DASH",
        "coin_name": "Dash",
        "min_withdraw": "0.00400000",
        "fee_withdraw": 0.002,
        "confirmations_required": 6,
        "coin_icon": "https://static.coinbtr.com/media/coins/DASH_7yHBf0P.png",
        "available_to_deposit": true,
        "available_to_withdraw": true
      }
    ],
    "fiat": [
      {
        "coin": "MXN",
        "coin_name": "Pesos Mexicanos",
        "min_withdraw": "10.00000000",
        "fee_withdraw": "0.0000",
        "country": "Mexico",
        "coin_icon": "https://static.coinbtr.com/media/coins/MXN_LmmSZ71.png"
      }
    ]
  }
}
```

This endpoint returns all available currencies in Tauros, cryptocurrencies as well as fiat currencies.

### HTTP Request

`GET /v2/coins/`

### Query Parameters

| Parameter | Type   | Required | Description                         |
| --------- | ------ | -------- | ----------------------------------- |
| coin      | String | No       | Cryptocurrency symbol (e.g. 'btc'). |

# Wallet Operations

## Get Deposit Address

This API call will bring you a deposit address for funding your cryptocurrency wallet.

### HTTP Request

`GET /v2/wallets/address/<coin>/`

> The API call will response this:

```json
BTC
{
  "success": true,
  "msg": null,
  "data": {
    "coin": "BTC",
    "address": "2NFfxvXpAWjKng7enFougtvtxxCJ2hQEMo4",
    "address_state": "READY",
    "coin_specific_type": null,
    "coin_specific_value": ""
  }
}
ETH
{
  "success": true,
  "msg": null,
  "data": {
    "coin": "ETH",
    "address": "",
    "address_state": "CREATING",
    "coin_specific_type": null,
    "coin_specific_value": ""
  }
}
XLM
{
  "success": true,
  "msg": null,
  "data": {
    "coin": "XLM",
    "address": "GC435DWBXRSLH3K33ZZR65X4WHMDW6LUZIOTJP4XFY7XJ4NPENZEYFHR",
    "address_state": "CREATING",
    "coin_specific_type": "memoId",
    "coin_specific_value": "8"
  }
}
```

### Body Parameters

| Parameter | Type   | Required | Coins | Description                         |
| --------- | ------ | -------- | ----- | ----------------------------------- |
| coin      | String | Yes      | All   | Cryptocurrency symbol (e.g. 'btc'). |

<aside class="warning">
Extra information is required for certain coins like XEM (Nem) or XLM (Stellar) that need to be included in your transaction for detecting that you're the owner of the funds.
</aside>
* XEM requires a `message` field.
* XLM requires whether a `memoId` or `memoText`.

Most of exchanges or wallets allows you to include this information in your transaction.

## Cryptocurrency Withdraw

This API call allows you to send cryptocurrency to a given destination address.

### HTTP Request

`POST /v2/wallets/crypto-withdraw/`

> The API response will look like this:

```json
{
  "success": true,
  "payload": {
    "txid": "ea3b3df941b229c0d30a7c0e825f4507354aec31ebc082ff0c199e476822c04d",
    "coin": "BTC",
    "isInnerTransfer": false,
    "amount_sent": 0.0007,
    "receiver": "2NAzzENWzPk7iJBe8XscDGLJgrr3zjxdcgW",
    "explorer_link": "https://live.blockcypher.com/btc-testnet/tx/"
  }
}
```

### Body Parameters

| Parameter | Type    | Required | Coins | Description                            |
| --------- | ------- | -------- | ----- | -------------------------------------- |
| nip       | String  | Yes      | All   | Transactional NIP (e.g. '1234').       |
| coin      | String  | Yes      | All   | Cryptocurrency symbol (e.g. 'btc').    |
| address   | String  | Yes      | All   | Destination address.                   |
| amount    | Float   | Yes      | All   | Amount to send.                        |
| memoId    | Integer | No       | XLM   | Memo id attached to the transaction.   |
| memoText  | String  | No       | XLM   | Memo text attached to the transaction. |

<aside class="notice">
Make sure your API key has permission to perform this action.
</aside>

## Tauros Transfer®

_Tauros Transfer®_ allows you to transfer funds to another user registered in Tauros.
Funds are transferred instantly with 0 commission fee.

### HTTP Request

`POST /v2/wallets/inner-transfer/`

> The API response will look like this:

```json
{
  "success": true,
  "msg": "0.001 BTC sent to jhon@mail.com.",
  "payload": {
    "amount_sent": 0.001,
    "coin": "BTC",
    "fee_amount": 0
  }
}
```

### Body Parameters

| Parameter | Type   | Required | Coins | Description                      |
| --------- | ------ | -------- | ----- | -------------------------------- |
| nip       | String | Yes      | All   | Transactional NIP (e.g. '1234'). |
| coin      | String | Yes      | All   | Coin symbol (e.g. 'btc').        |
| recipient | String | Yes      | All   | Receiver's email.                |
| amount    | Float  | Yes      | All   | Amount to send.                  |

## Mexican Pesos Withdraw (SPEI)

> The API response will look like this:

```json
{
  "success": true,
  "msg": "Withdrawal created. Your withdrawal will processed in the next 60 minutes"
}
```

This API call is used to withdraw MXN to a given CLABE.

### HTTP Request

`POST /v2/wallets/mxn-withdraw/`

### Body Parameters

| Parameter   | Type    | Required | Description                                                                             |
| ----------- | ------- | -------- | --------------------------------------------------------------------------------------- |
| nip         | String  | Yes      | Transactional NIP (e.g. '1234')                                                         |
| clabe       | String  | Yes      | 18 digits recipient's CLABE (_Clave Bancaria Estandarizada_).                           |
| amount      | Float   | Yes      | Two decimal presition amount to send.                                                   |
| recipient   | String  | Yes      | Recipient's full name (e.g. José Arcadio Buendía).                                      |
| text_ref    | String  | No       | Payment text reference, also known as "_Concepto_" (e.g. Pizzas).                       |
| numeric_ref | Integer | No       | Seven digits numerical reference, also known as "_Referencia numerica_" (e.g. 1234567). |

## List Balances

This API call is used to retrieve the balances on each of your wallets, including their deposit addresses (if they have been previously generated). There are four types of balances in tauros: `available`, `pending`, `frozen` and `in_orders`.

- `available`: Funds you can spend.

- `pending`: Funds that will be added to your account due to an incoming transfer.

- `frozen`: Frozen funds that will be removed due to and outgoing withdrawal.

- `in_orders`: Funds that are compromised in a limit order that you have previously placed.

### HTTP Request

> The API response will look like this:

```json
{
  "success": true,
  "msg": null,
  "data": [
    {
      "coin": "LTC",
      "balance": 0.0,
      "available": 0.0,
      "pending": 0.0,
      "depositAddress": "DLxcEt3AatMyr2NTatzjsfHNoB9NT62HiF"
    },
    {
      "coin": "BTC",
      "balance": 14.21549076,
      "available": 14.21549076,
      "pending": 0.0,
      "depositAddress": "1Mrcdr6715hjda34pdXuLqXcju6qgwHA31"
    }
  ]
}
```

`GET /v1/data/listbalances/`

### Body Parameters

None

## Get Balance

Alternatively you can request your balance for a specific coin.

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

| Parameter | Type   | Required | Description               |
| --------- | ------ | -------- | ------------------------- |
| coin      | String | No       | Coin symbol (e.g. `btc`). |

## List transfers

> The API response will look like this:

```json
{
  "count": 3,
  "next": "http://api.staging.tauros.io/api/v2/wallets/transfershistory/?limit=3&offset=8",
  "previous": null,
  "results": [
    {
      "sender": null,
      "receiver": "jhon@mail.com",
      "coin": "LTC",
      "coin_name": "Test Litecoin",
      "amount": "2",
      "txId": "93c5e96b149692938d8d0db37e6773f0c2a95e1f2de69efde68b87b92971737b",
      "confirmed": true,
      "created_at": "2019-07-04T10: 23: 03.008961-05: 00",
      "confirmed_at": "2019-07-04T10: 24: 28.156336-05: 00",
      "is_innerTransfer": false,
      "address": "QRca86Fp5wLA5rD87iUfu5rAWTTQndssLp",
      "explorer_link": "https://chain.so/tx/LTCTEST/93c5e96b149692938d8d0db37e6773f0c2a95e1f2de69efde68b87b92971737b",
      "fee_amount": "0",
      "total_amount": 2.0,
      "type": "deposit",
      "description": null,
      "operation": "transfer",
      "coin_icon": "https://staging-static.coinbtr.com/media/coins/LTC.png",
      "status": "DONE",
      "id": 195
    },
    {
      "sender": "jhon@mail.com",
      "receiver": null,
      "coin": "XLM",
      "coin_name": "Test Stellar",
      "amount": "1.1234567",
      "txId": "cd9976f0c34d457891675d58133f1ef83e06c7dc7566cfbf5114457947453755",
      "confirmed": true,
      "created_at": "2019-07-04T12: 09: 12.681467-05: 00",
      "confirmed_at": "2019-07-04T12: 10: 14-05: 00",
      "is_innerTransfer": false,
      "address": "GCWDFWVXGPBHBTJNT5XRPW2WU2XEKLKG7G4N5LW4PPJEURMSVBBEVOI5",
      "explorer_link": "https://testnet.steexp.com/tx/cd9976f0c34d457891675d58133f1ef83e06c7dc7566cfbf5114457947453755",
      "fee_amount": "0",
      "total_amount": 1.1234567,
      "type": "withdrawal",
      "description": null,
      "operation": "transfer",
      "coin_icon": "https://staging-static.coinbtr.com/media/coins/XLM.png",
      "status": "DONE",
      "id": 201
    }
  ]
}
```

This API call is used to retrieve your withdraws and deposits history. Both crypto and fiat transfers will be listed here. Tauros Transfers will have the `is_innerTransfer` flag as `true`.

### HTTP Request

`GET /v2/wallets/transfershistory/`

### Query Parameters

| Parameter | Type    | Required | Description                                                                                        |
| --------- | ------- | -------- | -------------------------------------------------------------------------------------------------- |
| limit     | Integer | No       | Indicates the maximum number of items to return.                                                   |
| offset    | Integer | No       | Indicates the starting position of the query in relation to the complete set of unpaginated items. |
| coin      | String  | No       | Allows to filter by coin (e.g. `btc`).                                                             |
| type      | String  | No       | Filters by type of transfer, wich can be `withdrawals` or `deposits`.                              |

#Trading Operations

<!-- ====================================================================================================== -->
<aside class="notice">
Make sure that your API key has permissions to perform these actions.
</aside>

## Place a new order

> The API response will look like this:

```json
{
  "success": true,
  "msg": "Order successfully placed in orderbook",
  "data": {
    "id": 123456790
  }
}
```

You can place two types of orders: `limit` and `market`. Orders can be placed only if your wallet has enough funds. Once an order is placed, your wallet funds will be frozen. If you cancel your order, the associated funds will be restored. If you cancel an open order that has been partially filled the exchanged funds will not be restored.

### HTTP Request

`POST /v1/trading/placeorder/`

### Body Parameters

| Parameter       | Type            | Required | Description                                                                  |
| --------------- | --------------- | -------- | ---------------------------------------------------------------------------- |
| market          | String          | Yes      | Market where your order will be placed (e.g. `btc-mxn`).                     |
| amount          | String or Float | Yes      | Amount of coins to trade.                                                    |
| side            | String          | Yes      | `buy` or `sell`.                                                             |
| price           | String or Float | Yes\*    | Order price at which you wish to exchange your coins.                        |
| type            | String          | No       | `market` or `limit`. Default is `limit`.                                     |
| is_amount_value | Boolean         | No       | Designates whether the provided `amount` is the order amount or order value. |

- Required only for limit orders

## List my open orders

> The API response will look like this:

```json
{
  "success": true,
  "msg": null,
  "data": [
    {
      "market": "LTC-BTC",
      "side": "BUY",
      "amount": 0.00033699,
      "initial_amount": 0.00033699,
      "filled": 0.0,
      "value": 0.00000508,
      "initial_value": 0.00000508,
      "price": 0.01508999,
      "fee_decimal": 0.00075,
      "fee_percent": 0.075,
      "fee_amount_paid": 0.0,
      "created_at": "2019-03-25T18:24:35.862824Z",
      "is_open": true,
      "amount_received": 0.0,
      "amount_paid": 0.0,
      "left_coin": "LTC",
      "right_coin": "BTC",
      "order_id": 13
    },
    {
      "market": "DASH-BTC",
      "side": "SELL",
      "amount": 0.014,
      "initial_amount": 0.014,
      "filled": 0.0,
      "value": 0.00032204,
      "initial_value": 0.00032204,
      "price": 0.023003,
      "fee_decimal": 0.0,
      "fee_percent": 0.0,
      "fee_amount_paid": 0.0,
      "created_at": "2019-03-27T18:50:52.119514Z",
      "is_open": true,
      "amount_received": 0.0,
      "amount_paid": 0.0,
      "left_coin": "DASH",
      "right_coin": "BTC",
      "order_id": 14
    }
  ]
}
```

This endpoint returns your open orders and their status.

### HTTP Request

`GET /v1/trading/myopenorders/`

### Query Parameters

| Parameter | Type   | Required | Description                                                   |
| --------- | ------ | -------- | ------------------------------------------------------------- |
| market    | String | No       | List your open orders filtering by `market` (e.g. `btc-mxn`). |

## Close an open order

> The API response will look like this:

```json
{
  "success": true,
  "msg": "Order closed"
}
```

This API call allows you to close an open order that you have previously placed. If your order has already been partially filled, that is to say, partially bought or sold, the exchanged funds will not be restored. Full-filled orders will be automatically closed.

### HTTP Request

`POST /v1/trading/closeorder/`

### Body Parameters

| Parameter | Type    | Required | Description |
| --------- | ------- | -------- | ----------- |
| id        | Integer | Yes      | Order id    |

## List my trading history

> The API response will look like this:

```json
{
  "success": true,
  "msg": null,
  "count": 3,
  "next": null,
  "previous": null,
  "payload": [
    {
      "market": "BTC-MXN",
      "amount_paid": 100.0,
      "amount_received": 0.00051077,
      "price": "195000.00",
      "fee_amount": 2.05e-6,
      "side": "BUY",
      "fee": "0.00400000",
      "created_at": "2020-06-03T07:33:18.233149-05:00"
    },
    {
      "market": "BTC-MXN",
      "amount_paid": 0.0001,
      "amount_received": 510.77,
      "price": "195000.00",
      "fee_amount": 2.05,
      "side": "SELL",
      "fee": "0.00200000",
      "created_at": "2020-06-03T07:33:18.233149-05:00"
    },
    {
      "market": "BTC-MXN",
      "amount_paid": 125.0,
      "amount_received": 1.992e-5,
      "price": "160000.00",
      "fee_amount": 8e-8,
      "side": "BUY",
      "fee": "0.00200000",
      "created_at": "2020-06-02T17:59:27.426156-05:00"
    },
    {
      "market": "BTC-MXN",
      "amount_paid": 0.0005,
      "amount_received": 2553.84,
      "price": "195000.00",
      "fee_amount": 10.26,
      "side": "SELL",
      "fee": "0.00200000",
      "created_at": "2020-06-02T12:02:59.894952-05:00"
    }
  ]
}
```

This endpoint retrieves your trading history.

### HTTP Request

`GET /v2/trading/my-trades/<market>/`

### Query Parameters

| Parameter | Type    | Required | Description                                                                                        |
| --------- | ------- | -------- | -------------------------------------------------------------------------------------------------- |
| limit     | Integer | No       | Indicates the maximum number of items to return.                                                   |
| offset    | Integer | No       | Indicates the starting position of the query in relation to the complete set of unpaginated items. |

# Market Data [PUBLIC]

The following API calls retrieve information related to markets.

<aside class="notice">
You can access the following endpoints freely, API KEY is not required.
</aside>

## List Markets (Books)

```shell
curl -X GET "https://api.tauros.io/api/v1/trading/markets/"
```

> The API response will look like this:

```json
{
  "success": true,
  "msg": null,
  "next": null,
  "previous": null,
  "count": 7,
  "payload": [
    {
      "min_amount": "0.00001",
      "max_amount": "500",
      "min_value": "1",
      "max_value": "10000000",
      "name": "BTC-MXN",
      "min_price": "500.00000000",
      "max_price": "16000000.00000000",
      "is_open": true
    },
    {
      "min_amount": "0.0001",
      "max_amount": "1000",
      "min_value": "1",
      "max_value": "1000000",
      "name": "LTC-MXN",
      "min_price": "100.00000000",
      "max_price": "10000000.00000000",
      "is_open": true
    },
    {
      "min_amount": "0.0001",
      "max_amount": "10000",
      "min_value": "0.000025",
      "max_value": "1500",
      "name": "LTC-BTC",
      "min_price": "0.00100000",
      "max_price": "80000.00000000",
      "is_open": false
    },
    {
      "min_amount": "0.0001",
      "max_amount": "100000",
      "min_value": "1",
      "max_value": "10000000",
      "name": "BCH-MXN",
      "min_price": "100.00000000",
      "max_price": "200000.00000000",
      "is_open": true
    },
    {
      "min_amount": "0.001",
      "max_amount": "1000000",
      "min_value": "1",
      "max_value": "1000000",
      "name": "XLM-MXN",
      "min_price": "0.01000000",
      "max_price": "100.00000000",
      "is_open": true
    },
    {
      "min_amount": "0.0005",
      "max_amount": "100000",
      "min_value": "1",
      "max_value": "1000000",
      "name": "DASH-MXN",
      "min_price": "100.00000000",
      "max_price": "50000.00000000",
      "is_open": true
    },
    {
      "min_amount": "5",
      "max_amount": "200000",
      "min_value": "1",
      "max_value": "200000",
      "name": "BEMB-MXN",
      "min_price": "0.01000000",
      "max_price": "100.00000000",
      "is_open": true
    }
  ]
}
```

This API call returns all existing markets (also known as "books") in Tauros.

### HTTP Request

`GET /v2/trading/markets/`

### Query Parameters

| Parameter | Type    | Required | Description                                                                                        |
| --------- | ------- | -------- | -------------------------------------------------------------------------------------------------- |
| limit     | Integer | No       | Indicates the maximum number of items to return.                                                   |
| offset    | Integer | No       | Indicates the starting position of the query in relation to the complete set of unpaginated items. |

## List Market Orders (Orderbook)

```shell

curl -X GET "https://api.tauros.io/api/v2/trading/btc-mxn/orderbook/"
```

> The API response will look like this:

```json
{
    "success": true,
    "msg": null,
    "payload": {
        "bids": [
            {
                "amount": 0.01522842,
                "value": 14999.99,
                "price": "985000.01000000",
                "created_at": "2021-08-24T12:35:22.840257-05:00",
                "id": 2701717
            },
            {
                "amount": 0.01922451,
                "value": 18936.14,
                "price": "985000.00000000",
                "created_at": "2021-08-24T12:33:46.955389-05:00",
                "id": 2700005
            },
            {
                "amount": 0.01103708,
                "value": 10860.48,
                "price": "984000.00000000",
                "created_at": "2021-08-24T12:28:11.791097-05:00",
                "id": 2701221
            },
            {
                "amount": 0.02118121,
                "value": 20780.88,
                "price": "981100.03000000",
                "created_at": "2021-08-24T12:31:16.513011-05:00",
                "id": 2701518
            },
            {
                "amount": 0.00989374,
                "value": 9701.81,
                "price": "980600.04000000",
                "created_at": "2021-08-24T12:35:15.486083-05:00",
                "id": 2701669
            }
        ],
        "asks": [
            {
                "amount": 0.00143773,
                "value": 1437.72,
                "price": "999998.99000000",
                "created_at": "2021-08-24T12:25:04.948124-05:00",
                "id": 2701679
            },
            {
                "amount": 0.00288181,
                "value": 2881.8,
                "price": "999999.00000000",
                "created_at": "2021-08-24T12:25:03.421039-05:00",
                "id": 2701705
            },
            {
                "amount": 0.00453321,
                "value": 4533.2,
                "price": "999999.00000000",
                "created_at": "2021-08-24T12:25:46.939925-05:00",
                "id": 2701707
            },
            {
                "amount": 0.00704473,
                "value": 7044.73,
                "price": "1000000.00000000",
                "created_at": "2021-08-24T11:53:44.788155-05:00",
                "id": 2701491
            },
            {
                "amount": 0.00180851,
                "value": 1824.78,
                "price": "1009000.00000000",
                "created_at": "2021-08-24T12:23:33.689378-05:00",
                "id": 2701703
            }
        ]
    }
}
```

This endpoint retrieves the 50 best sell and buy orders (also known as "orderbook") for a given market.

### HTTP Request

`GET /v2/trading/<market>/orderbook/`

### URL Parameters

| Parameter | Type   | Required | Description                   |
| --------- | ------ | -------- | ----------------------------- |
| market    | String | Yes      | Market name (e.g. `btc-mxn`). |

## List recent trades

```shell

curl -X GET "https://api.tauros.io/api/v2/trading/btc-mxn/trades/"
```

> The API response will look like this:

```json
{
    "success": true,
    "msg": null,
    "payload": [
        {
            "amount": "0.00010010",
            "price": "998991.99000000",
            "created_at": "2021-08-24T12:42:03.347801-05:00",
            "id": 871104,
            "side": "BUY"
        },
        {
            "amount": "0.00035605",
            "price": "983000.01000000",
            "created_at": "2021-08-24T12:28:05.825866-05:00",
            "id": 871102,
            "side": "SELL"
        },
        {
            "amount": "0.00453866",
            "price": "983000.01000000",
            "created_at": "2021-08-24T12:24:34.072911-05:00",
            "id": 871101,
            "side": "SELL"
        },
        {
            "amount": "0.00288759",
            "price": "983000.01000000",
            "created_at": "2021-08-24T12:24:33.991741-05:00",
            "id": 871100,
            "side": "SELL"
        },
        {
            "amount": "0.00040816",
            "price": "980000.01000000",
            "created_at": "2021-08-24T12:15:40.850063-05:00",
            "id": 871096,
            "side": "SELL"
        },
        {
            "amount": "0.00050000",
            "price": "1000000.00000000",
            "created_at": "2021-08-24T12:13:22.922192-05:00",
            "id": 871094,
            "side": "BUY"
        },
        {
            "amount": "0.00103130",
            "price": "980000.01000000",
            "created_at": "2021-08-24T12:13:22.870316-05:00",
            "id": 871093,
            "side": "SELL"
        },
        {
            "amount": "0.01067598",
            "price": "1000000.00000000",
            "created_at": "2021-08-24T12:11:34.027581-05:00",
            "id": 871092,
            "side": "BUY"
        },
        {
            "amount": "0.01837467",
            "price": "999999.00000000",
            "created_at": "2021-08-24T12:11:33.924747-05:00",
            "id": 871091,
            "side": "BUY"
        },
        {
            "amount": "0.02367620",
            "price": "999999.00000000",
            "created_at": "2021-08-24T12:11:33.857104-05:00",
            "id": 871090,
            "side": "BUY"
        }
    ]
}
```

This endpoint returns the last 50 trades for a given market.

### HTTP Request

`GET /v2/trading/<market>/trades/`

### URL Parameters

| Parameter | Type   | Required | Description                   |
| --------- | ------ | -------- | ----------------------------- |
| market    | String | Yes       | Market name (e.g. `btc-mxn`). |

## Tickers

Provides a summary market data (ticker) for all markets.

Fields:

- `high`: Last 24h highest price.
- `low`: Last 24h lowest price.
- `volume`: Last 24h amount traded.
- `last`: Last price.

```shell
curl -X GET "https://api.tauros.io/api/v2/trading/tickers/"
```

> The API response will look like this:

```json
{
  "success": true,
  "msg": null,
  "next": null,
  "previous": null,
  "count": 5,
  "payload": [
    {
      "market": "BTC-MXN",
      "last": 206140.7,
      "high": 206980.14,
      "low": 206018.21,
      "volume": 0.06895091
    },
    {
      "market": "LTC-MXN",
      "last": 934.05,
      "high": 960.78,
      "low": 934.05,
      "volume": 9.58559476
    },
    {
      "market": "BCH-MXN",
      "last": 5040.11,
      "high": 5129.7,
      "low": 4980.85,
      "volume": 0.99706549
    },
    {
      "market": "XLM-MXN",
      "last": 2.14,
      "high": 16.8,
      "low": 2.14,
      "volume": 1681.0954899
    },
    {
      "market": "DASH-MXN",
      "last": 1560.43,
      "high": 1689.77,
      "low": 890.02,
      "volume": 4.05001625
    }
  ]
}
```

### HTTP Request

`GET /v2/trading/tickers/`

### Query Parameters

None

## List trading fees

```shell
curl -X GET "https://api.tauros.io/api/v1/trading/fees/?market=ltc-btc&user_level=1"
```

> The API response will look like this:

```json
[
  {
    "base_coin": "MXN",
    "taker": "0.00400000",
    "maker": "0.00200000",
    "user_level": 1,
    "upper_amount": 999999.99
  },
  {
    "base_coin": "MXN",
    "taker": "0.00350000",
    "maker": "0.00160000",
    "user_level": 1,
    "upper_amount": 2999999.99
  },
  {
    "base_coin": "BTC",
    "taker": "0.00100000",
    "maker": "0.00020000",
    "user_level": 1,
    "upper_amount": 4.99999999
  },
  {
    "base_coin": "MXN",
    "taker": "0.00300000",
    "maker": "0.00120000",
    "user_level": 1,
    "upper_amount": 9999999.99
  },
  {
    "base_coin": "MXN",
    "taker": "0.00250000",
    "maker": "0.00100000",
    "user_level": 1,
    "upper_amount": 10000000
  },
  {
    "base_coin": "BTC",
    "taker": "0.00075000",
    "maker": "0.00015000",
    "user_level": 1,
    "upper_amount": 14.99999999
  },
  {
    "base_coin": "BTC",
    "taker": "0.00050000",
    "maker": "0.00010000",
    "user_level": 1,
    "upper_amount": 49.99999999
  },
  {
    "base_coin": "BTC",
    "taker": "0.00020000",
    "maker": "0.00007500",
    "user_level": 1,
    "upper_amount": 50
  }
]
```

Returns the trading fees. See [Trading fees](https://tauros.io/fees).

### HTTP Request

`GET /v1/trading/fees/`

### Query Parameters

| Parameter  | Type    | Required | Description                                           |
| ---------- | ------- | -------- | ----------------------------------------------------- |
| market     | String  | No       | Market name (e.g. `btc-mxn`).                         |
| user_level | Integer | No       | User level (e.g. 1). By default all users are level 1 |

# Websocket [PUBLIC]

```javascript
// Define a market you want to subscribe
const market = "BTC-MXN";

// Define a channel you want to subscribe

const channel = "orderbook";
//or
const channel = "ticker";
//or
const channel = "trades";

// Define the websocket
const ws = new WebSocket("wss://wsv2-staging.tauros.io");

// connect to the websocket

ws.onopen = function open() {
  console.log("connected to native socket");
  ws.send(
    JSON.stringify({
      action: "subscribe",
      market,
      channel,
    })
  );
  ws.send(
    JSON.stringify({
      action: "subscribe",
      market,
      channel,
    })
  );
  ws.send(
    JSON.stringify({
      action: "subscribe",
      market,
      channel,
    })
  );
};

// Read and manage market data as you want
ws.onmessage = (ev) => {
  if (ev.data.startsWith("Error")) {
    //For error declare function "onerror"
    onerror(ev.data);
    return;
  }
  const data = JSON.parse(ev.data);
  // subscription response
  if (data.action === "subscribe") {
    console.log(data);
    /*
      Place your code here
    */
  }
  // create element
  if (data.channel === channel) {
    console.log(msg);
    /*
      Place your code here
    */
  }
};
//Function onerror
const onerror = (error) => {
  console.log(new Error(`WebSocket error: ${error}`));
};
// For unsubscribing
ws.onclose = () => {
  console.log("disconnected");
};
```

Tauros implements native WebSockets in order to provide real-time market data from our trading engine. The websocket public endpoints are the following:

- `wsv2.tauros.io` for production environment.
- `wsv2-staging.tauros.io` for staging environment.


## Orderbook Channel

> Messages on this channel look like this:

```json
{
  "channel": "orderbook",
  "type": "BTC-MXN",
  "data": {
    "asks": [
      {
        "a": "0.026832",
        "p": "75000.00",
        "v": "2012.4",
        "t": 1553747507445
      },
      {
        "a": "0.031011",
        "p": "75050.00",
        "v": "2327.37",
        "t": 1553747562361
      }
    ],
    "bids": [
      {
        "a": "0.00531345",
        "v": "397.18",
        "p": "74750.00",
        "t": 1553747963921
      },
      {
        "a": "0.0034",
        "v": "253.3",
        "p": "74500.00",
        "t": 1553747925659
      }
    ]
  }
}
```

The orderbook channel provides the top ten SELL and BUY limit orders for the orderbook (or market) specified.

### JSON message returned

`asks` field contains **SELL** orders.

`bids` field contains **BUY** orders.

The `data` field contains an array with `asks` and `bids` orders in the following form:

| Field name | Type    | Description                                |
| ---------- | ------- | ------------------------------------------ |
| a          | String  | Order amount.                              |
| p          | String  | Order price.                               |
| v          | String  | Order value.                               |
| t          | Integer | UTC timestamp with milliseconds precision. |

## Ticker Channel

> Messages on this channel look like this:

```json
{
  "channel": "ticker",
  "market": "BTC-MXN",
  "volume": "0.00389249",
  "high": "1000500.00000000",
  "low": "490000.00000000",
  "last": "1000500.00000000",
  "variation": 0.10004997501249376,
  "trades": [
    {
      "amount": "0.00009995",
      "value": "100.00",
      "price": "1000500.00",
      "side": "BUY",
      "timestamp": 1614883000932.394
    }
  ]
}
```

The orderbook channel provides the top ten SELL and BUY limit orders for the orderbook (or market) specified.

### JSON message returned

`volume` field contains **volume** of market.

`high` field contains **hight** price in last 24h.

`low` field contains **low** price in last 24h.

`last` field contains **last** price.

`variation` field contains percentage **variation** price in 24h.

The `trades` field contains lasts **trades** with the following form:

| Field name | Type    | Description                 |
| ---------- | ------- | --------------------------- |
| amount     | String  | amount coin.                |
| value      | String  | amount in mxn.              |
| price      | String  | price of order.             |
| side       | String  | type of trade (buy or sell) |
| timestamp  | Integer | date and time of trade      |

## Trades Channel

> Messages on this channel look like this:

```json
{
  "channel": "trades",
  "type": "BTC-MXN",
  "data": [
    {
      "a": "0.0034",
      "v": "253.3",
      "p": "74500.00",
      "s": 1,
      "t": 1553747925659
    },
    {
      "a": "0.031011",
      "p": "75050.00",
      "v": "2327.37",
      "s": 0,
      "t": 1553747925659
    }
  ]
}
```

The trades channel provides the last ten trades done for the specified market.

### JSON message returned

The `data` field contains an array with the last trades in the following form:

| Field name | Type    | Description                                            |
| ---------- | ------- | ------------------------------------------------------ |
| a          | String  | Order amount.                                          |
| p          | String  | Order price.                                           |
| v          | String  | Order value.                                           |
| s          | Integer | Taker side. 1 indicates **BUY**, 0 indicates **SELL**. |
| t          | Integer | UTC timestamp with milliseconds precision.             |

#Webhooks

## What is a webhook

Webhooks may be setup to programmatically receive callbacks from Tauros. Webhook notifications are triggered when the specified event occurs, such as a bitcoin withdrawal (`TRANSACTION_HISTORY`) or a SPEI deposit (`CARD_HISTORY`), among others. You can setup and configure a webhook in the [Tauros Developer Section](https://tauros.io/develop).

Tauros servers will make a POST http request to the specified URL with a JSON payload, and expect a HTTP 200 OK.

## Type of notifications

> Messages on this channel look like this:

```json
// Notification standard:
{
  "title": "NOTIFICATION_TITLE",
  "description": "NOTIFICATION_DESCRIPTION",
  "type": "TYPE_OF_NOTIFICATION",
  "date": "2019-02-20T03:05:56.810445Z",
  "object": OBJECT // Order, Trade or Transfer object
}
```

Webhooks can be configurated to notify if some of the following events occur.

Types of notifications:

- New crypto deposit, crypto withdrawal or transfer to portfolio (`TRANSACTION_HISTORY`)
- Card Transaction (Purchase, Spei transfer, transfer to portfolio, among others) (`CARD_HISTORY`)

```json
// Tauros transfer notification sample for sender
{
  "title": "New BTC withdrawal",
   "description": "You have sent 0.001 BTC via Tauros Transfer",
   "type": "TRANSACTION_HISTORY",
   "date": "2020-02-23 19:34:15.004078+00:00",
   "object": {
      "sender": "example1@mail.com",
      "receiver": "emaple2@mail.com",
      "coin": "BTC",
      "coin_name": "Test Bitcoin",
      "amount": "0.001",
      "txId": null,
      "confirmed": true,
      "confirmed_at": "2020-02-23 19:34:14.901017+00:00",
      "is_innerTransfer": true,
      "address": "",
      "explorer_link": null,
      "fee_amount": "0",
      "total_amount": "0.001",
      "type": "withdrawal",
      "description": "My part of papa johns pizza",
      "id": 827
  }
}
```

