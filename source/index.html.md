---
title: Bitso API Reference

language_tabs:
  - shell: Shell
  - javascript: NodeJS
  - python: Python
  - ruby: Ruby
  - java: Java
  - php: PHP

toc_footers:
  - <a href='https://bitso.com/api_setup'>Sign Up for a Bitso Developer Key</a>
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>

search: true
---

# Introduction

The Bitso API allows you to integrate the Bitso trading platform
with third party applications, such as trading applications, charting programs,
point of sale systems, and much more. Below you will find details on how the
system functions, along with examples in common programming languages.

# General


## HTTP API Responses

Our REST-like APIs will always return a JSON Object.

For successful API calls, our JSON response objects looks like:

`
{   "success": true,
    "payload": {RELEVANT_DATA_HERE}
}
`

For unsuccessful API calls, our JSON response objects look like:

`
{
    "success": false,
    "error": {"message": ERROR_MESSAGE, "code": ERROR_CODE}
}
`

## Developer Testing Server

When working on integrations, we recommend that you use our dev server
before running your code against production. The URL for this server
is `https://api-dev.bitso.com/v3/`

You can fund accounts on the dev server with Testnet Bitcoin and
"Morden" test network Eth.




## Notations

**Major** denotes the cryptocurrency, in our case Bitcoin (BTC) or Ether (ETH).

**Minor** denotes fiat currencies, in our case Mexican Peso (MXN)

An order book is always referred to in the API as "Major_Minor". For example: "**btc_mxn**"

## Precision

We return decimal numbers as strings to preserve full precision across platforms. We recommend you also convert your numbers to string in order to avoid undesired consequences from precision and truncation errors.


## Rate Limits

Rate limits are based on one minute windows. For public API requests, the
limit is 60 requests per minute. For private API requests, the limit is 300
requests per minute. If you exceed these limits, you will get locked out for
one minute. Continuous one minute lockouts may result in a 24-hour block.

## Error Codes

Error codes consist of four digits, first two digits correspond to
error categories, the last two digits define specific errors.

### Unknown Errors: 01 (HTTP 500)
* 0101: "Unknown Error"
* 0102: "Invalid Ripple Withdrawal"

### Authentication Errors: 02 (HTTP 401)
* 0201: Invalid Nonce or Invalid Credentials
* 0202: Your account is currently suspended.
* 0203: Login token is invalid or expired
* 0204: Incorrect PIN

### Validation Errors: 03 (HTTP 400)
* 0301: Unknown Order book
* 0302: Incorrect time frame (not 'hour' or 'minute')
* 0303: Required field missing
* 0304: Required field not valid (email, phone_number)
* 0305: Invalid SMS code (would also apply to correct code but not-correct client id)
* 0306: Order side not in (buy, sell)
* 0307: Order type not in (limit, market)
* 0308: Order request cannot include both minor and major
* 0309: Order request must include either minor or major
* 0310: Incorrect WID (non-existent or does not belong to user)
* 0311: Incorrect FID (non-existent or does not belong to user)
* 0312: Incorrect OID (non-existent or does not belong to user)
* 0313: Selected currency not in (mxn, btc, eth)
* 0314: Auto-trade not available for selected currencies
* 0315: Invalid address
* 0316: Invalid Ripple currency
* 0317: Invalid SPEI number
* 0318: Invalid SPEI numeric_ref
* 0319: Invalid SPEI notes_ref
* 0320: Invalid pagination parameters
* 0321: Incorrect TID (non-existent)
* 0322: Not a Valid URL
* 0323: No associated country code
* 0324: Number already in use
* 0325: Phone already verified
* 0326: Quote is expired or invalid
* 0327: Service unavailable for requesting location
* 0328: Service unavailable for requesting country
* 0329: Market order type must be in (maj, min)
* 0330: Withdrawals locked for this account
* 0331: Invalid referral code for Bitso Transfer
* 0332: Empty PIN
* 0333: PIN locked. Too many attempts
* 0334: Bitso Transfers need either an email, phone_number, or refcode specified
* 0335: Invalid SPEI recipient name
* 0336: No data found for CURP
* 0337: No CURP found for data
* 0338: Multiple CURPs found for data
* 0339: Email is already in use

### System Limit Errors: 04 (HTTP 400)
* 0401: Incorrect price, below the minimum
* 0402: Incorrect price, above than maximum
* 0403: Incorrect major, below the minimum
* 0404: Incorrect major, above the maximum
* 0405: Incorrect minor, below the minimum
* 0406: Incorrect minor, above the maximum
* 0407: Invalid precision

### User Limit Error: 05 (HTTP 400)
* 0501: Exceeds user limit for withdrawals

### Funds Error: 06 (HTTP 400)
* 0601: Not enough btc funds
* 0602: Not enough mxn funds

### Throttling Errors: 08 (HTTP 420)
* 0801: You have hit the request rate-limit

### Unsupported HTTP method (400 error)
* 0901: Unsupported HTTP method


## Client Libraries

The following client libraries will allow you to integrate quickly with our APIs

* [Java](https://github.com/bitsoex/bitso-java)
* [Python](https://github.com/bitsoex/bitso-py)



## Legacy API Docs

Documentation for the v2 API available at [https://bitso.com/api_info/v2](https://bitso.com/api_info/v2)


# Public REST API


## Available Books

```shell
curl "https://api.bitso.com/v3/available_books/"
```

> The JSON object returned by the API looks like this:

```json
{
    "success": true,
    "payload": [{
        "book": "btc_mxn",
        "minimum_amount": ".003",
        "maximum_amount": "1000.00",
        "minimum_price": "100.00",
        "maximum_price": "1000000.00",
        "minimum_value": "25.00",
        "maximum_value": "1000000.00"
    }, {
        "book": "eth_mxn",
        "minimum_amount": ".003",
        "maximum_amount": "1000.00",
        "minimum_price": "100.0",
        "maximum_price": "1000000.0",
        "minimum_value": "25.0",
        "maximum_value": "1000000.0"
    }]
}
```

This endpoint returns a list of existing exchange order books and
their respective order placement limits.

### HTTP Request

`GET https://api.bitso.com/v3/available_books/`


### JSON Response Payload

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**book** | String | Order book symbol | Major_Minor
**minimum_amount** | String | Minimum amount of major when placing orders | Major
**maximum_amount** | String | Maximum amount of major when placing orders | Major
**minimum_price** | String | Minimum price when placing orders | Minor
**maximum_price** | String | Maximum price when placing orders | Minor
**minimum_value** | String | Minimum value amount (amount*price) when placing orders | Minor
**maximum_value** | String | Maximum value amount (amount*price) when placing orders | Minor



## Ticker

```shell
curl "https://api.bitso.com/v3/ticker/?book=btc_mxn"
```

> The JSON object returned by the API looks like this:

```json
{
    "success": true,
    "payload": {
        "book": "btc_mxn",
        "volume": "22.31349615",
        "high": "5750.00",
        "last": "5633.98",
        "low": "5450.00",
        "vwap": "5393.45",
        "ask": "5632.24",
        "bid": "5520.01",
        "created_at": "2016-04-08T17:52:31.000+00:00"
    }
}
```

This endpoint returns trading information from the specified book.

### HTTP Request

`GET https://api.bitso.com/v3/ticker/`

### Query Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**book** |  | YES | Specifies which book to use

### JSON Response Payload

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**book** | String | Order book symbol | Major_Minor
**volume** | String | Last 24 hours volume | Major
**high** | String | Last 24 hours price high | Minor/Major
**last** | String | Last traded price | Minor/Major
**low** | String | Last 24 hours price low | Minor/Major
**vwap** | String | Last 24 hours volume weighted average price: [vwap](http://en.wikipedia.org/wiki/Volume-weighted_average_price) | Minor/Major
**ask** | String | Lowest sell order | Minor/Major
**bid** | String | Highest buy order | Minor/Major
**created_at** | String | Timestamp at which the ticker was generated | ISO 8601 timestamp


## Order Book

```shell
curl "https://api.bitso.com/v3/order_book/?book=btc_mxn"
```

> The JSON object returned by the API looks like this:

```json
{
    "success": true,
    "payload": {
        "asks": [{
            "book": "btc_mxn",
            "price": "5632.24",
            "amount": "1.34491802"
        },{
            "book": "btc_mxn",
            "price": "5633.44",
            "amount": "0.4259"
        },{
            "book": "btc_mxn",
            "price": "5642.14",
            "amount": "1.21642"
        }],
        "bids": [{
            "book": "btc_mxn",
            "price": "6123.55",
            "amount": "1.12560000"
        },{
            "book": "btc_mxn",
            "price": "6121.55",
            "amount": "2.23976"
        }],
        "updated_at": "2016-04-08T17:52:31.000+00:00",
        "sequence": "27214"
    }
}
```

```shell
curl "https://api.bitso.com/v3/order_book/?book=btc_mxn&aggregate=false"
```

> The JSON object returned by the API looks like this:

```json
{
    "success": true,
    "payload": {
        "asks": [{
            "book": "btc_mxn",
            "price": "5632.24",
            "amount": "1.34491802",
            "oid": "VN5lVpgXf02o6vJ6"
        },{
            "book": "btc_mxn",
            "price": "5633.44",
            "amount": "0.4259",
            "oid": "RP8lVpgXf04o6vJ6"
        },{
            "book": "btc_mxn",
            "price": "5642.14",
            "amount": "1.21642",
            "oid": "46efbiv72drbphig"
        }],
        "bids": [{
            "book": "btc_mxn",
            "price": "6123.55",
            "amount": "1.12560000",
            "oid": "11brtiv72drbphig"
        },{
            "book": "btc_mxn",
            "price": "6121.55",
            "amount": "2.23976",
            "oid": "1ywri0yg8miihs80"
        }],
        "updated_at": "2016-04-08T17:52:31.000+00:00",
        "sequence": "27214"
    }
}
```

This endpoint returns a list of all open orders in the specified
book. If the *aggregate* parameter is set to true, orders will be
aggregated by price, and the response will only include the top 50
orders for each side of the book. If the *aggregate* parameter is set
to false, the response will include the full order book.

### HTTP Request

`GET https://api.bitso.com/v3/order_book/`

### Query Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**book** |  | YES | Specifies which book to use
**aggregate** | true  | NO | Specifies if orders should be aggregated by price.


### JSON Response Payload

Returns JSON object with "bids" and "asks". Each is a JSON Array
of open orders and each open order is represented as a JSON object

Field Name | Type | Description
---------- | ---- | -----------
**asks** | JSON Array | List of open asks
**bids** | JSON Array | List of open bids
**updated_at** |  String | Timestamp at which the order was last updated | ISO 8601 timestamp
**sequence** | Long | Increasing integer value for each order book update.

**Asks** and **Bids** in the aggregated order books are JSON Dictionaries with the following fields:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**book** | String | Order book symbol | Major_Minor
**price** | String | Price per unit of major | Minor
**amount** | String | Major amount in order | Major

**Asks** and **Bids** in the unaggregated (full) order books are JSON Dictionaries with the following fields:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**book** | String | Order book symbol | Major_Minor
**price** | String | Price per unit of major | Minor
**amount** | String | Major amount in order | Major
**oid** | String | Order ID |


## Trades

```shell
curl "https://api.bitso.com/v3/trades/?book=btc_mxn"
```

> The JSON Array returned by the API looks like this:

```json
{
    "success": true,
    "payload": [{
        "book": "btc_mxn",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "amount": "0.02000000",
        "maker_side": "buy",
        "price": "5545.01",
        "tid": 55845
    }, {
        "book": "btc_mxn",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "amount": "0.33723939",
        "maker_side": "sell",
        "price": "5633.98",
        "tid": 55844
    }]
}
```

This endpoint returns a list of recent trades from the specified book.

### HTTP Request

`GET https://api.bitso.com/v3/trades/`

### Query Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**book** |   | Yes | Specifies which book to use
**marker** |  | No | Returns objects that are older or newer (depending on 'sort') than the object with this ID
**sort** | desc | No | Specifies ordering direction of returned objects ('asc', 'desc')
**limit** | 25 | No | Specifies number of objects to return. (Max is 100)


### JSON Response Payload

Returns descending JSON Array of transactions. Every element in the array is a JSON object:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**book** | String | Order book symbol | Major_Minor
**created_at** | String | Timestamp at which the trade was executed | ISO 8601 timestamp
**amount** | String | Major amount transacted | Major
**maker_side** | String | Indicates the maker order side (maker order is the order that was open on the order book) |
**price** | String | Price per unit of major | Minor
**tid** | Long | Trade ID |




# Private REST API

The Private REST API is used to manage your account and your orders. These requests must be signed (more on this below).

<aside class="notice">
Private endpoints require API Keys. Make sure you read more about obtaining your private keys <a href="#generating-api-keys">here</a>
</aside>

## Generating API Keys

Bitso uses **API Keys** to allow access to the API.
You can register a new Bitso API key at our [developer portal](https://bitso.com/api_setup).

When setting up a new API, you will need to choose an **API Name** to identify your API.
This name will never be shown anywhere apart from on your API Index page within your account.
You have the option of adding a **Withdrawal Bitcoin Address**, which can be used to lock the API Withdrawal function to a specific Bitcoin address of your choosing. This field is optional.

The two elements you will need to sign requests are:

* Bitso API Key
* Bitso API Secret

## Creating and Signing Requests
```shell
#!/bin/bash
# requires:
# -httpie: https://github.com/jkbrzt/httpie

URL=https://api.bitso.com/v3/balance/
API_KEY="BITSO_KEY"
API_SECRET="BITSO_SECRET"
DNONCE=$(date +%s)
HTTPmethod=GET
JSONPayload=""
RequestPath="/v3/balance/"
SIGNATURE=$(echo -n $DNONCE$HTTPmethod$RequestPath$JSONPayload | openssl dgst -hex -sha256 -hmac $API_SECRET )
AUTH_HEADER="Bitso $API_KEY:$DNONCE:$SIGNATURE"
http GET $URL Authorization:"$AUTH_HEADER"
```


```javascript
var key = "BITSO API KEY";
var secret = "BITSO API SECRET";
var nonce = new Date().getTime();
var http_method="GET";
var json_payload=""
var request_path="/v3/balance/"

// Create the signature
var Data = nonce+http_method+request_path+json_payload;
var crypto = require('crypto');
var signature = crypto.createHmac('sha256', secret).update(Data).digest('hex');

// Build the auth header
var auth_header = "Bitso "+key+":" +nonce+":"+signature;


var options = {
  host: 'bitso.lan',
  port: 80,
  path: '/v3/balance/',
  method: 'GET',
  headers: {
        'Authorization': auth_header
    }
};

// Send request
var http = require('https');
var req = http.request(options, function(res) {
    res.on('data', function (chunk) {
        console.log("body: " + chunk);
    });
});
req.end();
```

```python
#!/usr/bin/python

import time
import hmac
import hashlib
import requests


bitso_key = "BITSO_KEY"
bitso_secret = "BITSO_SECRET"
nonce =  str(int(round(time.time() * 1000)))
http_method = "GET"
request_path = "/v3/balance/"
json_payload = ""

# Create signature
message = nonce+http_method+request_path+json_payload
signature = hmac.new(bitso_secret.encode('utf-8'),
                                            message.encode('utf-8'),
                                            hashlib.sha256).hexdigest()

# Build the auth header
auth_header = 'Bitso %s:%s:%s' % (bitso_key, nonce, signature)

# Send request
response = requests.get("https://api.bitso.com/v3/balance/", headers={"Authorization": auth_header})

print response.content
```


```ruby
#!/usr/bin/ruby
require 'date'
require 'json'
require 'openssl'
require 'typhoeus'

bitso_key = "API_KEY"
bitso_secret = "API_SECRET"
nonce = DateTime.now.strftime('%Q')
http_method = "POST"
request_path = "/v3/orders/"


payload_data = {"book"  => "btc_mxn",
                "side"  => "buy",
                "major" => ".01",
                "price" => "1000",
                "type"  => "limit"}



json_payload = payload_data.to_json

# Create signature
message = nonce+http_method+request_path+json_payload
signature = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), bitso_secret, message)

# Build the auth header
auth_header = "Bitso #{bitso_key}:#{nonce}:#{signature}"

# Send request
response = Typhoeus::Request.new(
  "https://api.bitso.com/v3/orders/",
   method: "POST",
   body: json_payload,
   headers: {"Authorization" => auth_header,
             "Content-Type"  => "application/json"}
).run

puts response.body
```

```java

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.URL;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.net.HttpURLConnection;

public class BitsoJavaExample {
    public static void main(String[] args) throws Exception {
    String bitsoKey = "BITSO API KEY";
    String bitsoSecret = "BITSO API SECRET";
    long nonce = System.currentTimeMillis();
    String HTTPMethod = "GET";
    String RequestPath = "/v3/balance/";
    String JSONPayload = "";

    // Create the signature
    String message = nonce + HTTPMethod + RequestPath + JSONPayload;
    String signature = "";
    byte[] secretBytes = bitsoSecret.getBytes();
    SecretKeySpec localMac = new SecretKeySpec(secretBytes, "HmacSHA256");
    Mac mac = Mac.getInstance("HmacSHA256");
    mac.init(localMac);
    byte[] arrayOfByte = mac.doFinal(message.getBytes());
    BigInteger localBigInteger = new BigInteger(1, arrayOfByte);
    signature = String.format("%0" + (arrayOfByte.length << 1) + "x", new Object[] { localBigInteger });

    String authHeader = String.format("Bitso %s:%s:%s", bitsoKey, nonce, signature);
    String url = "https://api.bitso.com/v3/balance/";
    URL obj = new URL(url);
    HttpURLConnection con = (HttpURLConnection) obj.openConnection();
    con.setRequestProperty("User-Agent", "Bitso Java Example");
    con.setRequestMethod("GET");
    con.setRequestProperty("Authorization", authHeader);

    // Send request
    int responseCode = con.getResponseCode();
    System.out.println("\nSending 'GET' request to URL : " + url);
    System.out.println("Response Code : " + responseCode);

    BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
    String inputLine;
    StringBuffer response = new StringBuffer();

    while ((inputLine = in.readLine()) != null) {
        response.append(inputLine);
    }
    in.close();
    System.out.println(response.toString());
    }
}


```

```php
<?php
  $bitsoKey = "API_KEY";
  $bitsoSecret = "API_SECRET"
  $nonce = round(microtime(true) * 1000);
  $HTTPMethod = "POST";
  $RequestPath = "/v3/orders/";
  $JSONPayload = json_encode(['book'  => 'btc_mxn',
                              'side'  => 'buy',
                              'major' => '.01',
                              'price' => '1000',
                              'type'  => 'limit']);

  // Create signature
  $message = $nonce . $HTTPMethod . $RequestPath . $JSONPayload;
  $signature = hash_hmac('sha256', $message, $bitsoSecret);

  // Build the auth header
  $format = 'Bitso %s:%s:%s';
  $authHeader =  sprintf($format, $bitsoKey, $nonce, $signature);


  // Send request
  $ch = curl_init();
  curl_setopt($ch, CURLOPT_URL, 'https://api.bitso.com/v3/orders/');
  curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
  curl_setopt($ch, CURLOPT_POSTFIELDS, $JSONPayload);
  curl_setopt($ch, CURLOPT_HTTPHEADER, array(
      'Authorization: ' .  $authHeader,
      'Content-Type: application/json'));
  $result = curl_exec($ch);

  echo $result;
?>
```

All REST requests should be valid JSON. You must include 3 fields as a
payload in the "Authorization" header for all Private API Endpoints in order to perform authentication:

* **key** – The API Key you generated
* **nonce** – An integer that must be unique and increasing for each API call (we recommend using a UNIX timestamp)
* **signature** – See below

### Signature

The signature is generated by creating a SHA256 HMAC using the **Bitso API Secret** on the concatenation of **nonce** + **HTTP method** + **requestPath** + **JSON payload** (no ’+’ signs in the concatenated string) and hex encode the output. The **nonce** value should be the same as the **nonce** field in the Authorization header. The **requestPath** and **JSON payload** must, of course, be exactly as the ones used in the request.

### Authorization Header

The header should be constructed, using the fields described above, in
the following form:

**Authorization: Bitso \<key>:\<nonce>:\<signature>**

## Account Status

> The JSON object returned by the API looks like this:

```json
{
    "success": true,
    "payload": {
        "client_id": "1234",
        "first_name": "Claude",
        "last_name":  "Shannon",
        "status": "active",
        "daily_limit": "5300.00",
        "monthly_limit": "32000.00",
        "daily_remaining": "3300.00",
        "monthly_remaining": "31000.00",
        "cash_deposit_allowance": "5300.00",
        "cellphone_number": "verified",
        "cellphone_number_stored":"+525555555555",
        "email_stored":"shannon@maxentro.py",
        "official_id": "submitted",
        "proof_of_residency": "submitted",
        "signed_contract": "unsubmitted",
        "origin_of_funds": "unsubmitted"
    }
}

```
This endpoint returns information concerning the user's account
status, documents uploaded, and transaction limits.

### HTTP Request

`GET https://api.bitso.com/v3/account_status/`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)

### JSON Response Payload


Returns a JSON Array. Every element in the array is a JSON object with the following fields.


Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**client_id** | String | The user's Client ID |
**first_name** | String | The user's first name |
**last_name** | String | The user's last name |
**status** | String | Total balance | Enum of (active, inactive)
**daily_limit** | String | The user's total daily limit  | MXN
**daily_remaining** | String | Remaining amount of user's total daily limit  | MXN
**monthly_limit** | String | The user's total monthly limit  | MXN
**monthly_remaining** | String | Remaining amount of user's total monthly limit  | MXN
**cash_deposit_allowance** | String | Remaining cash allowance today | MXN
**cellphone_number** | String | Status of user's registered cellphone number | Enum of (unsubmitted, submitted, verified)
**cellphone_number_stored** | String | user's registered cellphone number |
**email_stored** | String | user's registered email |
**official_id** | String | Status of user's official ID document | Enum of (unsubmitted, submitted, verified, rejected)
**proof_of_residency** | String | Status of user's 'proof of residency' document | Enum of (unsubmitted, submitted, verified, rejected)
**signed_contract** | String | Status of user's 'signed contract' document  | Enum of (unsubmitted, submitted, verified, rejected)
**origin_of_funds** | String | Status of user's 'origin of funds' document | Enum of (unsubmitted, submitted, verified, rejected)


## Document Upload


> The JSON object returned by the API looks like this:

```json
{
    "success": true
}

```
This endpoint is used to upload KYC documents for verification. [**Coming Soon**]

### HTTP Request

`GET https://api.bitso.com/v3/kyc_documents/`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)

### Body Parameters

Body parameters should be JSON encoded and should be exactly the same
as the JSON payload used to construct the signature.

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**document_type** | - | Yes | Specifies what document you are uploading. Enum of (official_id, proof_of_residency, signed_contract, origin_of_fund)
**filetype** | - | Yes | Specifies filetype for this upload. Enum of (jpg, png)
**file** | - | Yes | Base64 encoded binary file. Max size is 7.5MB


## Mobile Phone Number Registration

> The JSON object returned by the API looks like this:

```json
{
    "success": true,
    "payload": {
        "phone": "5552525252"
    }
}

```
This endpoint is used to register Mobile phone number for
verification.

### HTTP Request

`POST https://api.bitso.com/v3/phone_number/`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)


### Body Parameters

Body parameters should be JSON encoded and should be exactly the same
as the JSON payload used to construct the signature.

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**phone_number** | - | Yes | Mobile phone number to register (10 digits)


### JSON Response Payload

Returns a JSON Object with the following fields.


Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**client_id** | String | User's client ID |
**phone** | String | Registered phone number |

## Mobile Phone Number Verification

> The JSON object returned by the API looks like this:

```json
{
    "success": true,
    "payload": {
        "phone": "5554181042"
    }
}

```
This endpoint is used to verify a registered mobile phone number

### HTTP Request

`POST https://api.bitso.com/v3/phone_verification/`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)


### Body Parameters

Body parameters should be JSON encoded and should be exactly the same
as the JSON payload used to construct the signature.

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**verification_code** | - | Yes | Verification code sent to registered mobile number


### JSON Response Payload

Returns a JSON Object with the following fields.


Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**client_id** | String | User's client ID |
**phone** | String | Registered phone number |



## Account Balance

> The JSON object returned by the API looks like this:

```json
{
    "success": true,
    "payload": {
        "balances": [{
            "currency": "mxn",
            "total": "100.1234",
            "locked": "25.1234",
            "available": "75.0000"
        }, {
            "currency": "btc",
            "total": "4.12345678",
            "locked": "25.00000000",
            "available": "75.12345678"
        }, {
            "currency": "eth",
            "total": "50.1234",
            "locked": "40.1234",
            "available": "10.0000"
        }]
    }
}
```

This endpoint returns information concerning the user's balances for all supported currencies.

### HTTP Request

`GET https://api.bitso.com/v3/balance/`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)

### JSON Response Payload


Returns a JSON Array. Every element in the array is a JSON object with the following fields.


Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**currency** | String | Currency symbol |
**total** | String | Total balance | Currency
**locked** | String | Currency balance locked in open orders | Currency
**available** | String | Currency balance available for use | Currency

## Fees

> The JSON object returned by the API looks like this:

```json
{
    "success": true,
    "payload": {
        "fees": [{
            "book": "btc_mxn",
            "taker_fee_decimal": "0.0001",
            "taker_fee_percent": "0.01",
            "maker_fee_decimal": "0.0001",
            "maker_fee_percent": "0.01"
        }, {
            "book": "eth_mxn",
            "taker_fee_decimal": "0.0001",
            "taker_fee_percent": "0.01",
            "maker_fee_decimal": "0.0001",
            "maker_fee_percent": "0.01"
        }],
        "withdrawal_fees": {
            "btc": "0.001",
            "eth": "0.0025"
        }
    }
}
```

This endpoint returns information on customer fees for all available
order books, and withdrawal fees for applicable currencies.

### HTTP Request

`GET https://api.bitso.com/v3/fees/`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)

### JSON Response Payload

Returns a JSON object with keys, **"fees"** and **"withdrawal_fees"**.

**"fees"** contains a JSON Array. Every element in the array is a JSON object with the following fields.


Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**book** | String | Order book symbol | Major_Minor
**taker_fee_decimal** | String | Customer taker trading fee as a decimal |
**taker_fee_percent** | String | Customer taker trading fee as a percentage |
**maker_fee_decimal** | String | Customer maker trading fee as a decimal |
**maker_fee_percent** | String | Customer maker trading fee as a percentage |
**fee_decimal** | String | **DEPRECATED** Customer trading fee as a decimal (same as **maker_fee_decimal**). This was the field used before we had a Maker/Taker fee schedule. |
**fee_percent** | String | **DEPRECATED** Customer trading fee as a percentage (same as **maker_fee_percent**). This was the field used before we had a Maker/Taker fee schedule. |


**"withdrawal_fees"** is an object keyed by each curency and value of
net amount withdrawal fees denominated in the corresponding currency.


## Ledger

> The JSON object returned by the API looks like this:

```json
{
    "success": true,
    "payload": [{
        "eid": "c4ca4238a0b923820dcc509a6f75849b",
        "operation": "trade",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "balance_updates": [{
            "currency": "btc",
            "amount": "-0.25232073"
        }, {
            "currency": "mxn",
            "amount": "1013.540958479115"
        }],
        "details": {
            "tid": 51756,
            "oid": "wri0yg8miihs80ngk"
        }
    }, {
        "eid": "6512bd43d9caa6e02c990b0a82652dca",
        "operation": "fee",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "balance_updates": [{
            "currency": "mxn",
            "amount": "-10.237787459385"
        }],
        "details": {
            "tid": 51756,
            "oid": "19vaqiv72drbphig"
        }
    }, {
        "operation": "trade",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "balance_updates": [{
            "currency": "eth",
            "amount": "4.86859395"
        }, {
            "currency": "mxn",
            "amount": "-626.77"
        }],
        "details": {
            "tid": 51757,
            "oid": "19vaqiv72drbphig"
        }
    }, {
        "eid": "698d51a19d8a121ce581499d7b701668",
        "operation": "fee",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "balance_updates": [{
            "currency": "eth",
            "amount": "0.04917771"
        }],
        "details": {
            "tid": 51757,
            "oid": "19vaqiv72drbphig"
        }
    }, {
        "eid": "b59c67bf196a4758191e42f76670ceba",
        "operation": "funding",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "balance_updates": [{
            "currency": "btc",
            "amount": "0.48650929"
        }],
        "details": {
            "fid": "fc23c28a23905d8614499816c3ade455",
            "method": "btc",
            "funding_address": "18MsnATiNiKLqUHDTRKjurwMg7inCrdNEp"
        }
    }, {
        "eid": "b0baee9d279d34fa1dfd71aadb908c3f",
        "operation": "funding",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "balance_updates": [{
            "currency": "mxn",
            "amount": "300.15"
        }],
        "details": {
            "fid": "3ef729ccf0cc56079ca546d58083dc12",
            "method": "sp"
        }

    }, {
        "eid": "96e79218965eb72c92a549dd5a330112",
        "operation": "withdrawal",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "balance_updates": [{
            "currency": "mxn",
            "amount": "-200.15"
        }],
        "details": {
            "wid": "c5b8d7f0768ee91d3b33bee648318688",
            "method": "sp"
        }
    }]
}
```

Returns a list of all the user's registered operations.

### HTTP Request

`GET https://api.bitso.com/v3/ledger/`

`GET https://api.bitso.com/v3/ledger/trades/`

`GET https://api.bitso.com/v3/ledger/fees/`

`GET https://api.bitso.com/v3/ledger/fundings/`

`GET https://api.bitso.com/v3/ledger/withdrawals/`


### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)


### Query Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**marker** |  | No | Returns objects that are older or newer (depending on 'sort') than the object with this ID
**sort** | desc | No | Specifies ordering direction of returned objects
**limit** | 25 | No | Specifies number of objects to return. (Max is 100)


### JSON Response Payload

Returns a descending JSON Array of transactions. Every element in the array is a JSON object:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**eid** | String | Entry ID | -
**operation** | String | Indicates type of operation (funding, withdrawal, trade, fee) | -
**created_at** | String | Timestamp at which the operation was recorded | ISO 8601 timestamp
**balance_updates** | JSON object | Updates to user balances for this operation (See dictionary specification below) | -
**details** | JSON object | Specific operation  details | -

### JSON Object for balance_updates

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**currency** | String | Currency for this balance update | -
**balance** | String | Amount added or subtracted to user balance | Currency


### Filter Ledger by operation type

You can specify that the ledger endpoint return only objects that are
a specific operation type.

`GET https://api.bitso.com/v3/ledger/trades/`

`GET https://api.bitso.com/v3/ledger/fundings/`

`GET https://api.bitso.com/v3/ledger/withdrawals/`

`GET https://api.bitso.com/v3/ledger/fees/`

## Withdrawals

> The JSON object returned by the API looks like this:

```json
{
    "success": true,
    "payload": [{
        "wid": "c5b8d7f0768ee91d3b33bee648318688",
        "status": "pending",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "currency": "btc",
        "method": "Bitcoin",
        "amount": "0.48650929",
        "details": {
            "withdrawal_address": "18MsnATiNiKLqUHDTRKjurwMg7inCrdNEp",
            "tx_hash": "d4f28394693e9fb5fffcaf730c11f32d1922e5837f76ca82189d3bfe30ded433"
        }
    }, {
        "wid": "p4u8d7f0768ee91d3b33bee6483132i8",
        "status": "complete",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "currency": "mxn",
        "method": "sp",
        "amount": "2612.70",
        "details": {
            "beneficiary_name": "BERTRAND RUSSELL",
            "beneficiary_bank": "BANAMEX",
            "beneficiary_clabe": "002320700708015728",
            "numeric_reference": "99548",
            "concepto": "Por los 🌮 del viernes",
            "clave_rastreo": "BNET01001604080002076841",
            "cep": {
                "return": {
                    "cda": {
                        "cadenaOriginal": "||1|13062016|13062016|172053|40002|STP|Bitso - BERTRAND RUSSELL|40|646180115400000002|BIT140123U70|BANAMEX|BERTRAND RUSSELL|40|002320700708015728|ND|-|0.00|2612.70|00001000000401205824||",
                        "conceptoPago": "-",
                        "cuentaBeneficiario": "002320700708015728",
                        "cuentaOrdenante": "646180115400000002",
                        "fechaCaptura": "20160613",
                        "fechaOperacion": "20160613",
                        "hora": "17:08:42",
                        "iva": "0.00",
                        "monto": "2612.70",
                        "nombreBeneficiario": "BERTRAND RUSSELL",
                        "nombreInstBeneficiaria": "BANAMEX",
                        "nombreInstOrdenante": "STP",
                        "nombreOrdenante": "Bitso - Russell",
                        "referenciaNumerica": "99548",
                        "rfcCurpBeneficiario": "ND",
                        "rfcCurpOrdenante": "BIT140123U70",
                        "selloDigital": "cd7yUrnmUQ7CG6M+LX7WOZeizOpkTyMlEAunJaP2j5MAaNPZxy+vAJtgiVL73i1LNSrwK10eBb66Rh4\/RxU6AT2S03chQ\/BS1beknH5xPpGQg+wEXeANtnF2lp71lAD6QZ2O0NE4MIDvLhGGjTGklSP+2fS6joTAaV+tLbtrIp8JiR0MOX1rGPC5h+0ZHNvXQkcHJz3s68+iUAvDnQBiSu768b2C4zpHzteGEnJhU8sAdk83spiWogKALAVAuN4xfSXni7GTk9HObTTRdY+zehfWVPdE\/7uQSmMTzOKfPbQU02Jn\/5DdE3gYk6JZ5m70JsUSFBTF\/EVX8hhg0pu2iA==",
                        "serieCertificado": "",
                        "tipoOperacion": "C",
                        "tipoPago": "1"
                    },
                    "estadoConsulta": "1",
                    "url": "http:\/\/www.banxico.org.mx\/cep?i=90646&s=20150825&d=viAKjS0GVYB8qihmG9I%2B9O1VUvrR2td%2Fuo3GyVDn8vBp371tVx5ltRnk4QsWP6KP%2BQvlWjT%2BzfwWWTA3TMk4tg%3D%3D"
                }
            }
        }
    }, {
        "wid": "of40d7f0768ee91d3b33bee64831jg73",
        "status": "complete",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "currency": "mxn",
        "method": "sp",
        "amount": "500.00",
        "details": {
            "beneficiary_name": "ALFRED NORTH WHITEHEAD",
            "beneficiary_bank": "BANAMEX",
            "beneficiary_clabe": "5204165009315197",
            "numeric_reference": "30535",
            "concepto": "-",
            "clave_rastreo": "BNET01001604080002076841",
            "cep": {
                "return": {
                    "cda": {
                        "cadenaOriginal": "||1|07042016|07042016|095656|40002|STP|Bitso - Al|40|646180115400000002|BIT140123U70|BANAMEX|ALFRED NORTH WHITEHEAD|3|5204165009315197|ND|-|0.00|500.00|00001000000401205824||",
                        "conceptoPago": "-",
                        "cuentaBeneficiario": "5204165009315197",
                        "cuentaOrdenante": "646180115400000002",
                        "fechaCaptura": "20160407",
                        "fechaOperacion": "20160407",
                        "hora": "09:56:51",
                        "iva": "0.00",
                        "monto": "500.00",
                        "nombreBeneficiario": "ALFRED NORTH WHITEHEAD",
                        "nombreInstBeneficiaria": "BANAMEX",
                        "nombreInstOrdenante": "STP",
                        "nombreOrdenante": "Bitso - RUSSELL",
                        "referenciaNumerica": "30535",
                        "rfcCurpBeneficiario": "ND",
                        "rfcCurpOrdenante": "BIT140123U70",
                        "selloDigital": "GaXpeaKgkc+gc0w9XgBbRCMmKWLNdSTV5C4CNQ4DL4ZVT+1OBSqNtX\/pv2IGjI7bKjCkaNrKUdaCdFwG6SdZ0nS9KtYSx1Ewg2Irg6x4kSzeHdlzBDr6ygT+bb+weizxcXMARKkciPuSQlyltCrEwSi07yVzachKfcEN8amj2fsEzim7gSyUc3ecKA1n8DX89158fwukKTIg4ECfOLsgueKF8unwbICWHXwRaaxIAA6PVw7O6WwGXxMtMBTCdiT202c8I2SnULFqK9QVJlQ\/YDRXFI4IMMAwGQZWbbmk8gf\/J3Fixy+0lcQV35TBBrbHyFPiaHaRN95yK\/BUxPOhag==",
                        "serieCertificado": "",
                        "tipoOperacion": "C",
                        "tipoPago": "1"
                    },
                    "estadoConsulta": "1",
                    "url": "http:\/\/www.banxico.org.mx\/cep?i=90646&s=20150825&d=3AeATtn9mM9yySMqwClgSTnKIddFN7JVwo38kDBVjOBRtcYVENx1LblV%2BXOHnKEGTfp0g%2BVLM76C3ewQ0c9vpA%3D%3D"
                }
            },
            "folio_origen": "BITSO4405016499736144"
        }
    }]
}
```

Returns detailed info on a user's fund withdrawals.

### HTTP Request


`GET https://api.bitso.com/v3/withdrawals/`

`GET https://api.bitso.com/v3/withdrawals/wid/`

`GET https://api.bitso.com/v3/withdrawals/wid-wid-wid/`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)



### Query Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**limit** | 25 | No | Specifies number of objects to return. (Max is 100)

### JSON Response Payload

Returns a JSON Array of open orders. Every element in the array is a JSON object:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**wid** | String | The unique withdrawal ID | -
**currency** | String | Currency withdrawn | -
**method** | String | Method for this withdrawal (MXN, BTC, ETH). | -
**amount** | String | The withdrawn amount | currency
**status** | String | The status for this withdrawal (pending, processing, complete, failed) | -
**created_at** | String | Timestamp at which the withdrawal as created |ISO 8601 timestamp
**details** | JSON object | Specific withdrawal details | -


## Fundings

> The JSON object returned by the API looks like this:

```json
{
    "success": true,
    "payload": [{
        "fid": "c5b8d7f0768ee91d3b33bee648318688",
        "status": "pending",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "currency": "btc",
        "method": "btc",
        "amount": "0.48650929",
        "details": {
            "funding_address": "18MsnATiNiKLqUHDTRKjurwMg7inCrdNEp",
            "tx_hash": "d4f28394693e9fb5fffcaf730c11f32d1922e5837f76ca82189d3bfe30ded433"
        }
    }, {
        "fid": "p4u8d7f0768ee91d3b33bee6483132i8",
        "status": "complete",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "currency": "mxn",
        "method": "sp",
        "amount": "300.15",
        "details": {
            "sender_name": "BERTRAND RUSSELL",
            "sender_bank": "BBVA Bancomer",
            "sender_clabe": "012610001967722183",
            "receive_clabe": "646180115400467548",
            "numeric_reference": "80416",
            "concepto": "Para el 🐖",
            "clave_rastreo": "BNET01001604080002076841",
            "beneficiary_name": "ALFRED NORTH WHITEHEAD"
        }
    }]
}
```

Returns detailed info on a user's fundings.

### HTTP Request


`GET https://api.bitso.com/v3/fundings/`

`GET https://api.bitso.com/v3/fundings/fid/`

`GET https://api.bitso.com/v3/fundings/fid-fid-fid/`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)


### Query Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**limit** | 25 | No | Specifies number of objects to return. (Max is 100)


### JSON Response Payload

Returns a JSON Array of open orders. Every element in the array is a JSON object:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**fid** | String | The unique funding ID | -
**currency** | String | Currency funded | -
**method** | String | Method for this funding (MXN, BTC, ETH). | -
**amount** | String | The funding amount | currency
**status** | String | The status for this funding (pending, complete, failed) | -
**created_at** | String | Timestamp at which the funding was received |ISO 8601 timestamp
**details** | JSON object | Specific funding details | -

## User Trades

```shell
curl "https://api.bitso.com/v3/user_trades/?book=btc_mxn"
```

> The JSON Array returned by the API looks like this:

```json
{
    "success": true,
    "payload": [{
        "book": "btc_mxn",
        "major": "-0.25232073",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "minor": "1013.540958479115",
        "fees_amount": "-10.237787459385",
        "fees_currency": "mxn",
        "price": "4057.45",
        "tid": 51756,
        "oid": "g81d3y1ywri0yg8m",
        "side": "sell"
    }, {
        "book": "eth_mxn",
        "major": "4.86859395",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "minor": "-626.77",
        "fees_amount": "-0.04917771",
        "fees_currency": "btc",
        "price": "127.45",
        "tid": 51757,
        "oid": "19vaqiv72drbphig",
        "side": "buy"
    }]
}
```

This endpoint returns a list of the user's trades.

### HTTP Request

`GET https://api.bitso.com/v3/user_trades/`

`GET https://api.bitso.com/v3/user_trades/tid/`

`GET https://api.bitso.com/v3/user_trades/tid-tid-tid/`

### Query Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**book** |   | Yes | Specifies which book to use
**marker** |  | No | Returns objects that are older or newer (depending on 'sort') than the object with this ID
**sort** | desc | No | Specifies ordering direction of returned objects
**limit** | 25 | No | Specifies number of objects to return. (Max is 100)


### JSON Response Payload

Returns descending JSON Array of transactions. Every element in the array is a JSON object:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**book** | String | Order book symbol | Major_Minor
**major** | String | Major amount traded | Major
**minor** | String | Minr amount traded | Minor
**price** | String | Price per unit of major | Minor
**side** | String | Indicates the user's side for this trade (buy, sell) |
**fees_currency** | String | Indicates the currency in which the trade fee was charged | -
**fees_amount** | String | Indicates the amount charged as trade fee |
**tid** | Long | Trade ID |
**oid** | String | Users' Order ID |
**created_at** | String | Timestamp at which the trade was executed | ISO 8601 timestamp

## Order Trades

```shell
curl "https://api.bitso.com/v3/order_trades/Jvqrschkgdkc1go3"
```

> The JSON Array returned by the API looks like this:

```json
{
    "success": true,
    "payload": [{
            "book": "btc_mxn",
            "major": "-0.25232073",
            "created_at": "2016-04-08T17:52:31.000+00:00",
            "minor": "1013.540958479115",
            "fees_amount": "-10.237787459385",
            "fees_currency": "mxn",
            "price": "4057.45",
            "tid": 51756,
            "oid": "Jvqrschkgdkc1go3",
            "side": "sell"
        },
        {
            "book": "btc_mxn",
            "major": "-0.25",
            "created_at": "2016-04-08T17:52:31.000+00:00",
            "minor": "513.540958479115",
            "fees_amount": "-10.237787459385",
            "fees_currency": "mxn",
            "price": "4057.45",
            "tid": 51755,
            "oid": "Jvqrschkgdkc1go3",
            "side": "sell"
        }
    ]
}
```

This endpoint returns a list of the user's trades.

### HTTP Request


`GET https://api.bitso.com/v3/order_trades/oid/`


### Query Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**oid** |   | Yes | Specifies which order to get corresponding trades for


### JSON Response Payload

Returns descending JSON Array of transactions. Every element in the array is a JSON object:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**book** | String | Order book symbol | Major_Minor
**major** | String | Major amount traded | Major
**minor** | String | Minr amount traded | Minor
**price** | String | Price per unit of major | Minor
**side** | String | Indicates the user's side for this trade (buy, sell) |
**fees_currency** | String | Indicates the currency in which the trade fee was charged | -
**fees_amount** | String | Indicates the amount charged as trade fee |
**tid** | Long | Trade ID |
**oid** | String | Users' Order ID |
**created_at** | String | Timestamp at which the trade was executed | ISO 8601 timestamp



## Open Orders

> The JSON object returned by the API looks like this:

```json
{
    "success": true,
    "payload": [{
        "book": "btc_mxn",
        "original_amount": "0.01000000",
        "unfilled_amount": "0.00500000",
        "original_value": "56.0",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "updated_at": "2016-04-08T17:52:51.000+00:00",
        "price": "5600.00",
        "oid": "543cr2v32a1h68443",
        "side": "buy",
        "status": "partial-fill",
        "type": "limit"
    }, {
        "book": "btc_mxn",
        "original_amount": "0.12680000",
        "unfilled_amount": "0.12680000",
        "original_value": "507.2",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "updated_at": "2016-04-08T17:52:41.000+00:00",
        "price": "4000.00",
        "oid": "qlbga6b600n3xta7",
        "side": "sell",
        "status": "open",
        "type": "limit"
    }, {
        "book": "btc_mxn",
        "original_amount": "1.12560000",
        "unfilled_amount": "1.12560000",
        "original_value": "6892.66788",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "updated_at": "2016-04-08T17:52:41.000+00:00",
        "price": "6123.55",
        "oid": "d71e3xy2lowndkfm",
        "side": "sell",
        "status": "open",
        "type": "limit"
    }]
}
```

Returns a list of the user's open orders.

### HTTP Request

`GET https://api.bitso.com/v3/open_orders?book=btc_mxn`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)


### Query Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**book** | all  | No | Specifies which book to use
**marker** |  | No | Returns objects that are older or newer (depending on 'sort') than the object with this ID
**sort** | desc | No | Specifies ordering direction of returned objects
**limit** | 25 | No | Specifies number of objects to return. (Max is 100)

### JSON Response Payload

Returns a JSON Array of open orders. Every element in the array is a JSON object:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**oid** | String | The Order ID | -
**book** | String | Order book symbol | Major_Minor
**original_amount** | String | The order's initial major currency amount | Major
**unfilled_amount** | String | The order's unfilled major currency amount | Major
**original_value** | String | The order's initial minor currency amount | Minor
**created_at** | String | Timestamp at which the trade was executed |ISO 8601 timestamp
**updated_at** | String | Timestamp at which the trade was updated (can be null) | ISO 8601 timestamp
**price** | String | The order's price | Minor
**side** | String | The order side (buy, sell) | -
**status** | String | The order's status (queued, open, partial-fill) |
**type** | String | The order type (will always be 'limit' for open orders) | -


## Lookup Orders

> The JSON object returned by the API looks like this:

```json
{
    "success": true,
    "payload": [{
        "book": "btc_mxn",
        "original_amount": "0.01000000",
        "unfilled_amount": "0.00500000",
        "original_value": "56.0",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "updated_at": "2016-04-08T17:52:51.000+00:00",
        "price": "5600.00",
        "oid": "543cr2v32a1h6844",
        "side": "buy",
        "status": "partial-fill",
        "type": "limit"
    }, {
        "book": "btc_mxn",
        "original_amount": "0.12680000",
        "unfilled_amount": "0.12680000",
        "original_value": "507.2",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "updated_at": "2016-04-08T17:52:41.000+00:00",
        "price": "4000.00",
        "oid": "qlbga6b600n3xta7a",
        "side": "sell",
        "status": "open",
        "type": "limit"
    }]
}
```

Returns a list of details for 1 or more orders

### HTTP Request

`GET https://api.bitso.com/v3/orders/<oid>/`

`GET https://api.bitso.com/v3/orders/<oid>-<oid>-<oid>/`


### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)



### JSON Response Payload

Returns a JSON Array of open orders. Every element in the array is a JSON object:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**oid** | String | The Order ID | -
**book** | String | Order book symbol | Major_Minor
**original_amount** | String | The order's initial major currency amount | Major
**unfilled_amount** | String | The order's unfilled major currency amount | Major
**original_value** | String | The order's initial minor currency amount | Minor
**created_at** | String | Timestamp at which the order was created |ISO 8601 timestamp
**updated_at** | String | Timestamp at which the order was updated (can be null) | ISO 8601 timestamp
**price** | String | The order's price | Minor
**side** | String | The order side (buy, sell) | -
**status** | String | The order's status (queued, open, partial-fill, closed) |
**type** | String | The order type (market, limit) | -


## Cancel Order

> The string returned by the API looks like this:

```json
{
    "success": true,
    "payload":[
        "543cr2v32a1h684430tvcqx1b0vkr93wd694957cg8umhyrlzkgbaedmf976ia3v",
        "qlbga6b600n3xta7actori10z19acfb20njbtuhtu5xry7z8jswbaycazlkc0wf1",
        "d71e3xy2lowndkfmde6bwkdsvw62my6058e95cbr08eesu0687i5swyot4rf2yf8"
        ]
}
```

Cancels open order(s)

### HTTP Request

`DELETE https://api.bitso.com/v3/orders/<oid>/`

`DELETE https://api.bitso.com/v3/orders/<oid>-<oid>-<oid>/`

`DELETE https://api.bitso.com/v3/orders/all/`



### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)


### JSON Response Payload

The response is a list of Order IDs (OIDs) for the canceled orders. Orders may not be successfully cancelled if they have been filled, have been already cancelled, or the OIDs are incorrect.

## Place an Order

> The JSON object returned by the API looks like this:

```json
{
    "success": true,
    "payload": {
        "oid": "qlbga6b600n3xta7"
        }
}
```

Places a buy or sell order (both limit and market orders are available)

### HTTP Request

`POST https://api.bitso.com/v3/orders/`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-

### Body Parameters

Body parameters should be JSON encoded and should be exactly the same
as the JSON payload used to construct the signature.

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**book** | - | Yes | Specifies which book to use
**side** | - | Yes | The order side (buy, sell)
**type** | - | Yes | The order type (market, limit) |
**major** | - | No | The amount of major currency for this order. An order must be specified in terms of major or minor, never both.
**minor** | - | No | The amount of minor currency for this order. An order must be specified in terms of major or minor, never both.
**price** | - | No | Price per unit of major. For use only with limit orders | Minor (MXN)
**stop**  | - | No | Price per unit of major at which to stop and place order. For use only with stop orders.


### JSON Response Payload

Returns a JSON object representing the order:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**oid** | String | The Order ID | -
**book** | String | Order book symbol | Major_Minor
**original_amount** | String | The order's initial major currency amount | Major
**unfilled_amount** | String | The order's unfilled major currency amount | Major
**original_value** | String | The order's initial minor currency amount | Minor
**created_at** | String | Timestamp at which the order was created |ISO 8601 timestamp
**updated_at** | String | Timestamp at which the order was updated (can be null) | ISO 8601 timestamp
**price** | String | The order's price | Minor
**side** | String | The order side (buy, sell) | -
**status** | String | The order's status (queued, open, partial-fill, closed) |
**type** | String | The order type (market, limit) | -




## Funding Destination

> The JSON object returned by the API looks like this:

```json
{
    "success": true,
    "payload": {
        "account_identifier_name": "SPEI CLABE",
        "account_identifier": "646180115400346012"             
    }
}
```

Returns account funding information for specified currencies.

### HTTP Request

`GET https://api.bitso.com/v3/funding_destination/`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)


### Query Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**fund_currency** | - | Yes | Specifies which currency to fund with.



### JSON Response Payload

Returns a JSON object representing the order:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**account_identifier_name** | String | Account identifier name to fund with the specified currency. | -
**account_identifier** | String | Identifier to where the funds can be sent to. | -



## Crypto Withdrawals

> The string returned by the API looks like this (example for BTC):

```json
{
    "success": true,
    "payload": {
        "wid": "c5b8d7f0768ee91d3b33bee648318688",
        "status": "pending",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "currency": "btc",
        "method": "btc",
        "amount": "0.48650929",
        "details": {
            "withdrawal_address": "3EW92Ajg6sMT4hxK8ngEc7Ehrqkr9RoDt7",
            "tx_hash": null
        }
    }
}
```

The following endpoints are available for making a cryptocurrency withdrawal from the user's account:

### HTTP Request


Asset | Endpoint
----- | --------
**all** | `POST https://api.bitso.com/v3/crypto_withdrawal/`
**btc** | `POST https://api.bitso.com/v3/bitcoin_withdrawal/`
**eth** | `POST https://api.bitso.com/v3/ether_withdrawal/`
**xrp** | `POST https://api.bitso.com/v3/ripple_withdrawal/`
**bch** | `POST https://api.bitso.com/v3/bcash_withdrawal/`
**ltc** | `POST https://api.bitso.com/v3/litecoin_withdrawal/`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)

### Body Parameters

Body parameters should be JSON encoded and should be exactly the same
as the JSON payload used to construct the signature.

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**currency** | - | Yes | The currency to withdraw (only required for `crypto_withdrawal` endpoint)
**amount** | - | Yes | The amount of the asset to withdraw from your account
**address** | - | Yes | The address to send that amount to
**destination_tag** | - | No | Destination Tag (Ripple XRP only, optional)

### JSON Response Payload

Returns a JSON object representing the order:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**wid** | String | Unique Withdrawal ID | -
**status** | String | Status of the withdrawal request (pending, complete) | -
**created_at** | String | Timestamp at which the withdrawal request was created | ISO 8601 timestamp
**currency** | String | Currency specified for this withdrawal (e.g. BTC) | -
**method** | String | Method for this withdrawal (e.g. BTC). | -
**amount** | String | Amount to withdraw. | units of e.g. BTC
**details** | String | Method specific details for this withdrawal | -



## SPEI Withdrawal

> The string returned by the API looks like this:

```json
{
    "success": true,
    "payload": {
        "wid": "p4u8d7f0768ee91d3b33bee6483132i8",
        "status": "pending",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "currency": "mxn",
        "method": "sp",
        "amount": "300.15",
        "details": {
            "sender_name": "JUAN ESCUTIA",
            "receive_clabe": "012610001967722183",
            "sender_clabe": "646180115400467548",
            "numeric_reference": "80416",
            "concepto": "Tacos del viernes",
            "clave_rastreo": null,
            "beneficiary_name": "FRANCISCO MARQUEZ"
        }
    }
}
```

Triggers a SPEI withdrawal from your account.
These withdrawals are immediate during banking hours for some banks (M-F 9:00AM - 5:00PM Mexico City Time), 24 hours for others.


### HTTP Request

`POST https://api.bitso.com/v3/spei_withdrawal/`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)

### Body Parameters

Body parameters should be JSON encoded and should be exactly the same
as the JSON payload used to construct the signature.

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**amount** | - | Yes | The amount of MXN to withdraw from your account
**recipient_given_names** | - | Yes | The recipient's first and middle name(s)
**recipient_family_names** | - | Yes | The recipient's last name
**clabe** | - | Yes | The [CLABE](https://en.wikipedia.org/wiki/CLABE) number where the funds will be sent to
**notes_ref** | - | No | The alpha-numeric reference number for this SPEI
**numeric_ref** | - | No | The numeric reference for this SPEI (max. 7 digits)


### JSON Response Payload

Returns a JSON object representing the order:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**wid** | String | Unique Withdrawal ID | -
**status** | String | Status of the withdrawal request (pending, complete) | -
**created_at** | String | Timestamp at which the withdrawal request was created | ISO 8601 timestamp
**currency** | String | Currency specified for this withdrawal (MXN) | -
**method** | String | Method for this withdrawal (SPEI Transfer) | -
**amount** | String | Amount to withdraw | -
**details** | String | Method specific details for this withdrawal | -

## Bank Codes

> The JSON object returned by the API looks like this:

```json
{
    "success": true,
    "payload": [{
        "code": "01",
        "name": "Banregio"
    }, {
        "code": "02",
        "name": "BBVA"
    }]
}
```

This endpoint returns codes and bank names to be used in the Debit Card WIthdrawal and Phone Number Withdrawal endpoints

### HTTP Request

`GET https://api.bitso.com/v3/mx_bank_codes/`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)

### JSON Response Payload


Returns a JSON Array. Every element in the array is a JSON object with the following fields.


Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**code** | String | Corresponding bank's code |
**name** | String | Corresponding bank's name |


## Debit Card Withdrawal

> The string returned by the API looks like this:

```json
{
    "success": true,
    "payload": {
        "wid": "p4u8d7f0768ee91d3b33bee6483132i8",
        "status": "pending",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "currency": "mxn",
        "method": "sp",
        "amount": "300.15",
        "details": {
            "sender_name": "JUAN ESCUTIA",
            "receive_clabe": "012610001967722183",
            "sender_clabe": "646180115400467548",
            "numeric_reference": "80416",
            "concepto": "Tacos del viernes",
            "clave_rastreo": null,
            "beneficiary_name": "FRANCISCO MARQUEZ"
        }
    }
}
```

Triggers a Debit Cards withdrawal from your account.
These **withdrawals are immediate** during banking hours for some
banks (M-F 9:00AM - 5:00PM Mexico City Time), 24 hours for others.



### HTTP Request

`POST https://api.bitso.com/v3/debit_card_withdrawal/`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)


### Body Parameters

Body parameters should be JSON encoded and should be exactly the same
as the JSON payload used to construct the signature.


Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**amount** | - | Yes | The amount of MXN to withdraw from your account
**recipient_given_names** | - | Yes | The recipient's first and middle name(s)
**recipient_family_names** | - | Yes | The recipient's last name
**card_number** | - | Yes | The debit card number where the funds will be sent to
**bank_code** | - | Yes | The bank code for this card's issuer as returned by the "Bank Codes" endpoint



### JSON Response Payload

Returns a JSON object representing the order:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**wid** | String | Unique Withdrawal ID | -
**status** | String | Status of the withdrawal request (pending, complete) | -
**created_at** | String | Timestamp at which the withdrawal request was created | ISO 8601 timestamp
**currency** | String | Currency specified for this withdrawal (MXN) | -
**method** | String | Method for this withdrawal (Debit Card Withdrawal) | -
**amount** | String | Amount to withdraw | -
**details** | String | Method specific details for this withdrawal | -


## Phone Number Withdrawal

> The string returned by the API looks like this:

```json
{
    "success": true,
    "payload": {
        "wid": "p4u8d7f0768ee91d3b33bee6483132i8",
        "status": "pending",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "currency": "mxn",
        "method": "sp",
        "amount": "300.15",
        "details": {
            "sender_name": "JUAN ESCUTIA",
            "receive_clabe": "012610001967722183",
            "sender_clabe": "646180115400467548",
            "numeric_reference": "80416",
            "concepto": "Tacos del viernes",
            "clave_rastreo": null,
            "beneficiary_name": "FRANCISCO MARQUEZ"
        }
    }
}
```

Triggers a withdrawal from your account to a phone number. (Phone
number must be registered for SPEI Transfers with their corresponding bank)
These **withdrawals are immediate** during banking hours for some
banks (M-F 9:00AM - 5:00PM Mexico City Time), 24 hours for
others.



### HTTP Request

`POST https://api.bitso.com/v3/phone_withdrawal/`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)


### Body Parameters

Body parameters should be JSON encoded and should be exactly the same
as the JSON payload used to construct the signature.

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**amount** | - | Yes | The amount of MXN to withdraw from your account
**recipient_given_names** | - | Yes | The recipient's first and middle name(s)
**recipient_family_names** | - | Yes | The recipient's last name
**phone_number** | - | Yes | The phone number associated with the account where the funds will be sent to
**bank_code** | - | Yes | The bank code for this card's issuer as returned by the "Bank Codes" endpoint



### JSON Response Payload

Returns a JSON object representing the order:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**wid** | String | Unique Withdrawal ID | -
**status** | String | Status of the withdrawal request (pending, complete) | -
**created_at** | String | Timestamp at which the withdrawal request was created | ISO 8601 timestamp
**currency** | String | Currency specified for this withdrawal (MXN) | -
**method** | String | Method for this withdrawal (Debit Card Withdrawal) | -
**amount** | String | Amount to withdraw | -
**details** | String | Method specific details for this withdrawal | -



# WebSocket API

## General

The **Trades channel** send a message whenver a new trade is executed in the corresponding order book.

The **Orders channel** maintains an up-to-date list of the top 20 asks and the top 20 bids, new messages are sent across the channel whenever there is a change in either top 20.

The **Diff-Orders** channel will send across any modifications to the
order book. Specifically, any state changes in existing orders
(including orders not in the top 20), and any new orders. An order
could be removed, in which case it won't have an 'a' field (amount),
or an order could have been partially filled (you can look up an
order's state via the lookup_order endpoint) which will be reflected
in the amount field. Each message contains a sequence number, which
are increasing integer values, each new message incrementing the
sequence number by one. If you see a sequence number that is more than
one value that the previous, this means a message has been dropped and
you need to update the order book to get to correct state. In theory,
you can get a copy of the full order book via REST once, and keep it
up to date by using the diff-orders channel with the following
algorithm:

1. Subscribe to the diff-orders channel.
2. Queue any message that come in to this channel.
3. Get the full orderbook from the REST orderbook endpoint.
4. Playback the queued message, discarding the ones with sequence
number below or equal to the one from the REST orderbook.
5. Apply the next queued messages to your local order book data
structure.
6. Apply real-time messages to your local orderbook as they come in
   trough the stream.



An order's timestamp field is immutable. Even if the amount field is mutated, or the order removed, the timestamp field remains as it was when the order was created. Note that a timestamp is not unique. Different orders can have the same timestamp.

### How to connect

> Create a WebSocket instance:

```blab
websocket = new WebSocket('wss://ws.bitso.com');
```

> Subscribe to each channel you wish to connect to:

```blab
websocket.onopen = function() {
    websocket.send(JSON.stringify({ action: 'subscribe', book: 'btc_mxn', type: 'trades' }));
    websocket.send(JSON.stringify({ action: 'subscribe', book: 'btc_mxn', type: 'diff-orders' }));
    websocket.send(JSON.stringify({ action: 'subscribe', book: 'btc_mxn', type: 'orders' }));
};
```

> The server will acknowledge each subscription to a channel with a message. For example, a successful subscription to the 'trades' channel
will be acknowledged in the following manner:

```blab
{action: "subscribe", response: "ok", time: 1455831538045, type: "trades"}
```

> Once you've succesfully subscribed to a channel, listen for messages and handle them appropriately:

```blab
websocket.onmessage = function(message){
                var data = JSON.parse(message.data);

                if (data.type == 'trades' && data.payload) {

                }
                else if (data.type == 'diff-orders' && data.payload) {

                }
                else if (data.type == 'orders' && data.payload) {

                }
            };
```

### Example Implementation

Use this example native javascript implementation for your reference:
[https://bitso.com/demo_ws.html](https://bitso.com/demo_ws.html)

## Trades Channel

> Messages on this channel look like this:

```json
{
  "type": "trades",
  "book": "btc_mxn",
  "payload": [
    {
      "i": 72022,
      "a": "0.0035",
      "r": "7190",
      "v": "25.16"
    }
  ]
}
```

### Client subscription message

`{ action: 'subscribe', book: 'btc_mxn', type: 'trades' }`

### Server subscription response message

`{action: "subscribe", response: "ok", time: 1455831538045, type: "trades"}`

### Server JSON message

The payload contains an array with one or more trades of the following form:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**i** | Number | A unique number identifying the transaction | -
**a** | String | Amount | Major
**r** | String | Rate | Minor
**v** | String | Value | Minor
**t** | Number | Maker side, 0 indicates buy 1, indicates sell | -
**mo** | String | Maker Order ID | -
**to** | String | Taker Order ID | -

## Diff-Orders

> Messages on this channel look like this:

```json
{
  "type": "diff-orders",
  "book": "btc_mxn",
  "sequence": 2734,
  "payload": [
    {
      "d": 1455315979682,
      "r": "7251.1",
      "t": 1,
      "a": "0.29437179",
      "v": "2134.51",
      "o": 'VM7lVpgXf04o6vJ6'
    }
  ]
}
```

### Client subscription message

`websocket.send(JSON.stringify({ action: 'subscribe', book: 'btc_mxn', type: 'diff-orders' }));`

### Server subscription response message

`{action: "subscribe", response: "ok", time: 1455831538047, type: "diff-orders"}`

### Server JSON Message

The payload contains an array with one or more orders of the following form:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**d** | Number | Unix timestamp | Milliseconds
**r** | String | Rate | Minor
**t** | Number | 0 indicates buy 1 indicates sell | -
**a** | String | Amount | Major
**v** | String | Value | Minor
**o** | String | Order ID | -

## Orders

> Messages on this channel look like this:

```json
{
  "type": "orders",
  "book": "btc_mxn",
  "payload": {
    "bids": [
      {
        "r": "7185",
        "a": "0.001343",
        "v": "9.64",
        "t": 1,
        "d": 1455315394039
      },
      {
        "r": "7183.01",
        "a": "0.007715",
        "v": "55.41",
        "t": 1,
        "d": 1455314938419
      },
      {
        "r": "7183",
        "a": "1.59667303",
        "v": "11468.9",
        "t": 1,
        "d": 1455314894615
      }
    ],
    "asks": [
      {
        "r": "7251.1",
        "a": "0.29437179",
        "v": "2134.51",
        "t": 0,
        "d": 1455315979682
      },
      {
        "r": "7251.72",
        "a": "1.32057812",
        "v": "9576.46",
        "t": 0,
        "d": 1455303931277
      }
    ]
  }
}
```

### Client Subscription message

`{ websocket.send(JSON.stringify({ action: 'subscribe', book: 'btc_mxn', type: 'orders' }));`

### Server subscription response message

`{action: "subscribe", response: "ok", time: 1455831538048, type: "orders"}`

### Server JSON message

The payload contains a JSON with two keys, one for the bids and the other for asks on the order book. Both bids and asks contain orders of the following form:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**r** | String | Rate | Minor
**a** | String | Amount | Major
**v** | String | Value | Minor
**t** | Number | 0 indicates buy 1 indicates sell | -
**d** | Number | Unix timestamp | Milliseconds

# Transfer API

<aside class="notice">
Access to this API is available on request, and not enabled by default. Users won't be able to use this API unless Bitso has enabled it on their account.
</aside>

## General

Bitso’s powerful Transfer API allows for simple integration for routing Bitcoin payments directly through to a choice of Mexican Peso end-points.

The workflow breaks down in the following steps:

1. Request quote
2. Create transfer using quote
3. Send bitcoins to address given
4. After 1 confirmation, pesos are delivered

The quote acquired in step #1 is valid for 60 seconds. Once this is used to create a transfer (#2), that transfer is then valid for 60 seconds from creation (within which time the Bitcoin transaction to satisfy it must be ‘seen’ by our servers – this typically happens within 20 seconds).

Once the transfer is satisfied, the Bitcoin transaction must be confirmed before a further action takes place. Typically this takes around a maximum of 10 minutes, but can be a little longer.

The transfer can be monitored throughout the process by making a request to the URL returned with the transfer creation.

### Authentication

The Transfer API is accessible via an API key created for your account. For full details on creating an API key and how to sign your API requests, please refer to:
[the authentication section](#creating-and-signing-requests)

## Requesting a Quote

> The JSON object returned by the API looks like this:

```json
{
   "success":true,
   "payload":{
      "btc_amount":"0.14965623",
      "currency":"MXN",
      "rate":"3340.99",
      "gross":"500.00",
      "outlets":{
         "sp":{
            "id":"sp",
            "name":"SPEI Transfer",
            "required_fields":[
               "recipient_given_names",
               "recipient_family_names",
               "clabe",
               "bank_name"
            ],
            "minimum_transaction":"500.00",
            "maximum_transaction":"2500000.00",
            "daily_limit":"10000.00",
            "fee":"12.00",
            "net":"488.00",
            "available":"1",
            "verification_level_requirement":"0"
         },
         "vo":{
            "id":"vo",
            "name":"Voucher",
            "required_fields":[
               "email_address"
            ],
            "minimum_transaction":"25.00",
            "maximum_transaction":"9999.00",
            "fee":"0.00",
            "daily_limit":"0.00",
            "net":"500.00",
            "available":"1",
            "verification_level_requirement":"0"
         },
         "bw":{
            "id":"bw",
            "name":"Bank Wire",
            "required_fields":[
               "recipient_full_name",
               "account_holder_address",
               "bank_name",
               "bank_address",
               "account_number",
               "swift",
               "other_instructions"
            ],
            "minimum_transaction":"1000.00",
            "maximum_transaction":"2500000.00",
            "daily_limit":"2500000.00",
            "fee":"500.00",
            "net":"0.00",
            "available":"1",
            "verification_level_requirement":"0"
         }
      },
      "created_at":"2016-04-08T17:52:31.000+00:00",
      "expires_at":"2016-04-08T18:02:31.000+00:00"
   }
}
```

### HTTP Request

`POST https://api.bitso.com/v3/transfer_quote`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)



### Body Parameters

Body parameters should be JSON encoded and should be exactly the same
as the JSON payload used to construct the signature.

Parameter | Required | Description
--------- | -------- | -----------
**from_currency** | Yes | The cryptocurrency that you wish to send. This will be converted to the to_currency fiat currency
**from_amount** | No | Mutually exclusive with to_amount. Either this, or to_amount should be present in the request. The total amount in Crypto, as provided by the user.
**to_amount** | No | Mutually exclusive with from_amount. Either this, or from_amount should be present in the request. The total amount in Fiat currency. Use this if you prefer specifying amounts in fiat instead of cryptocurrency.
**to_currency** | Yes | An ISO 4217 fiat currency symbol (ie, “MXN”). This is the resulting currency from the transfer.
**full** | No | (optional, defaults to False) - Show the required_fields for each payment outlet as an array of {id, name} objects. This accepts either True or False. When not provided or if the value is False, the required_fields for each Payment Outlet are returned as an array of id strings. For more information about required_fields, please refer to the Payment Outlet Documentation.


## Creating a Transfer

> The JSON object returned by the API looks like this:

```json
{
   "success":true,
   "payload":{
      "from_currency":"BTC",
      "from_amount":"0.14965623",
      "from_pending":"0",
      "from_received":"0",
      "confirmation_code":"9b2a4",
      "created_at":"2016-04-08T17:52:31.000+00:0",
      "currency":"MXN",
      "currency_amount":"0",
      "currency_fees":"0",
      "currency_settled":"0",
      "expires_epoch":"2016-04-08T18:02:31.000+00:0",
      "fields":{
         "phone_number":"5555252525"
      },
      "id":"9b2a431b98597312e99cbff1ba432cbf",
      "payment_outlet_id":"pm",
      "status":"pending",
      "qr_img_uri":"https:\/\/chart.googleapis.com\/chart?chl=bitcoin%3AmgKZfNdFJgztvfvhEaGgMTQRQ2iHCadHGa%3Famount%3D0.14965623&chs=400x400&cht=qr&choe=UTF-8&chld=L%7C0",
      "user_uri":"https:\/\/api.bitso.com\/v3\/transfer\/9b2a431b98597312e99cbff1ba432cbf",
      "wallet_address":"3AmgKZfNdFJgztvfvhEaGgMTQRQ2iHCadHGa"
   }
}
```

### HTTP Request

`POST https://api.bitso.com/v3/transfer_create`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)



### Body Parameters

Body parameters should be JSON encoded and should be exactly the same
as the JSON payload used to construct the signature.

Parameter | Required | Description
--------- | -------- | -----------
**from_currency** | Yes | The cryptocurrency that you wish to send. This will be converted to the to_currency fiat currency
**from_amount** | No | Mutually exclusive with to_amount. Either this, or to_amount should be present in the request. The total amount in Crypto, as provided by the user.
**to_amount** | No | Mutually exclusive with from_amount. Either this, or from_amount should be present in the request. The total amount in Fiat currency. Use this if you prefer specifying amounts in fiat instead of cryptocurrency.
**to_currency** | Yes | An ISO 4217 fiat currency symbol (ie, “MXN”). This is the resulting currency from the transfer.
**rate** | Yes | This is the rate (e.g. BTC/MXN), as acquired from the transfer_quote method. You must request a quote in this way before creating a transfer.
**payment_outlet** | Yes | The outlet_id as provided by quote method. See below for more information on available outlets.
**required_field1** | Yes | Each of the other ‘required fields’, as stipulated in the quote method for the chosen payment_outlet.
**required_field2** | Yes |

## Reviewing a Transfer

Make requests to the transfer review end point at any time to monitor the status of your transfer.

### HTTP Request

`GET https://api.bitso.com/v3/transfer/<transfer_id>`

### Response

Parameter | Required | Description
--------- | -------- | -----------
**status** | Yes | **pending**: waiting for the bitcoin transaction to be seen, **confirming**: transaction has been seen, and now waiting for a network confirmation, **completed**: transaction has completed, and funds dispatched via the outlet specified.

## Currently Available Outlets

### SPEI

SPEI is Mexico’s lightning fast and inexpensive inter-bank transfer system (akin to SEPA in Europe, and vastly superior to ACH).

All bank accounts in Mexico can be identified by their special 18-digit SPEI account number, otherwise known as a ‘CLABE’.

Transfers executed via SPEI are typically concluded within a few seconds (within banking hours).

### Debit Cards

Send tansfers directly to debit cards from any mexican bank. Note
that the "institution_code" is obtained from the
[bank_codes](#bank-codes) endpoint.

### Voucher

Bitso offers the ability to issue voucher codes redeemable on Bitso.com, and delivered by email. Simply specify the amount and email address, and the recipient can at any time register on Bitso.com and redeem their code.

### Bank Wire

Execute a standard international bank wire via this outlet.

### Cash

Deliver cash for collection by a recipient at any of thousands of cash-out locations across Mexico

# Remittance API

<aside class="notice">
Access to this API is available on request, and not enabled by default. Users won't be able to use this API unless Bitso has enabled it on their account.
</aside>

## General

Using the Remittance API, partners can generate orders for cash pick-up at payment points across the length and breadth of Mexico.

### Authentication

The Transfer API is accessible via an API key created for your account. For full details on creating an API key and how to sign your API requests, please refer to:
[the authentication section](#creating-and-signing-requests)


## Create Remittance

> The string returned by the API looks like this:

```json
{
    "success": true,
    "payload": {
        "wid": "p4u8d7f0768ee91d3b33bee6483132i8",
        "status": "complete",
        "created_at": "2016-04-08T17:52:31.000+00:00",
        "currency": "mxn",
        "method": "bt",
        "amount": "300.15",
        "details": {
            "reference": "123451245",
            "collection_reference": "XXXX123456789"
        }
    }
}
```

Triggers a withdrawal from your account to create a cash-out order for collection at a specified location.


### HTTP Request

`POST https://api.bitso.com/v3/remittance_create/`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)


### Body Parameters

Body parameters should be JSON encoded and should be exactly the same
as the JSON payload used to construct the signature.

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**amount** | - | Yes | The amount of MXN to send for the remittance
**sender_first_name** | - | Yes | The sender's first and middle name(s)
**sender_last_name** | - | Yes | The sender's family name(s)
**sender_address** | - | Yes | The sender's address
**sender_phone** | - | Yes | The sender's phone number
**sender_countycity** | - | Yes | The sender's county or city
**sender_state** | - | Yes | The sender's state
**receiver_first_name** | - | Yes | The beneficiary's first and middle name(s)
**receiver_last_name** | - | Yes | The beneficiary's family name(s)
**receiver_address** | - | Yes | The beneficiary's address
**receiver_phone** | - | Yes | The beneficiary's phone number
**receiver_city** | - | Yes | The beneficiary's city
**receiver_state** | - | Yes | The beneficiary's state
**payout_point_id** | - | Yes | The specified payout point ID (taken from the remittance_locations endpoint)



### JSON Response Payload

Returns a JSON object representing the order:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**wid** | String | Unique Withdrawal ID | -
**status** | String | Status of the withdrawal request (pending, complete) | -
**created_at** | String | Timestamp at which the withdrawal request was created | ISO 8601 timestamp
**currency** | String | Currency specified for this withdrawal (MXN) | -
**method** | String | Method for this withdrawal (Debit Card Withdrawal) | -
**amount** | String | Amount to withdraw | -
**details** | String | Contains the reference identifier for cash-out order, needed to alter the order and for recipient to collect payment. | -



## Cancel Remittance

> The string returned by the API looks like this:

```json
{
    "success": true,
    "payload": {
        "reference": "XYZ123"
    }
}
```

Triggers the cancellation of a previously created cash-out order.


### HTTP Request

`POST https://api.bitso.com/v3/remittance_cancel/`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)


### Body Parameters

Body parameters should be JSON encoded and should be exactly the same
as the JSON payload used to construct the signature.

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**reference** | - | Yes | The reference code for the cash-out order
**reason** | - | Yes | The reason for cancellation


### JSON Response Payload

Returns a JSON object representing the order:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**reference** | String | Reference of the order in question | -




## Remittance Change Beneficiary Name

> The string returned by the API looks like this:

```json
{
    "success": true,
    "payload": {
        "reference": "XYZ123"
    }
}
```

Change the beneficiary name of a previously created cash-out order.


### HTTP Request

`POST https://api.bitso.com/v3/remittance_change_name/`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)


### Body Parameters

Body parameters should be JSON encoded and should be exactly the same
as the JSON payload used to construct the signature.

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**reference** | - | Yes | The reference code for the cash-out order
**new_name** | - | Yes | The new name for the beneficiary
**reason** | - | Yes | The reason for change


### JSON Response Payload

Returns a JSON object representing the order:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**reference** | String | Reference of the order in question | -



## Remittance Change Beneficiary Phone

> The string returned by the API looks like this:

```json
{
    "success": true,
    "payload": {
        "reference": "XYZ123"
    }
}
```

Change the beneficiary phone number of a previously created cash-out order.


### HTTP Request

`POST https://api.bitso.com/v3/remittance_change_phone/`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)


### Body Parameters

Body parameters should be JSON encoded and should be exactly the same
as the JSON payload used to construct the signature.

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**reference** | - | Yes | The reference code for the cash-out order
**new_phone** | - | Yes | The new phone number for the beneficiary
**reason** | - | Yes | The reason for change


### JSON Response Payload

Returns a JSON object representing the order:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**reference** | String | Reference of the order in question | -




## Remittance Change Sender Name

> The string returned by the API looks like this:

```json
{
    "success": true,
    "payload": {
        "reference": "XYZ123"
    }
}
```

Change the sender name of a previously created cash-out order.


### HTTP Request

`POST https://api.bitso.com/v3/remittance_change_sender/`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)


### Body Parameters

Body parameters should be JSON encoded and should be exactly the same
as the JSON payload used to construct the signature.

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**reference** | - | Yes | The reference code for the cash-out order
**new_name** | - | Yes | The new name for the sender
**reason** | - | Yes | The reason for change


### JSON Response Payload

Returns a JSON object representing the order:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**reference** | String | Reference of the order in question | -




## Remittance Payout Locations

> The string returned by the API looks like this:

```json
{
    "success": true,
    "payload": [{
            "ID": 1234,
            "city": "Ciudad de Rafael Lara Grajales",
            "state": "Puebla",
            "payer": "Payer Name",
            "address": "Payer Address",
            "zipCode": "Payer ZIP",
            "reference": "",
            "phoneNumber": "Payer Phone",
            "currency": "PESOS",
            "paymentLimit": 300,
            "monday": "10:00 a 18:00",
            "tuesday": "10:00 a 18:00",
            "wednesday": "10:00 a 18:00",
            "thursday": "10:00 a 18:00",
            "friday": "10:00 a 18:00",
            "saturday": "11:00 a 17:00",
            "sunday": "11:00 a 17:00"
        },
        {
            "ID": 1235,
            "city": "Santa Maria La Alta",
            "state": "Puebla",
            "payer": "Payer Name",
            "address": "Payer Address",
            "zipCode": "Payer ZIP",
            "reference": "",
            "phoneNumber": "Payer Phone",
            "currency": "PESOS",
            "paymentLimit": 500,
            "monday": "09:00 a 18:00",
            "tuesday": "09:00 a 18:00",
            "wednesday": "09:00 a 18:00",
            "thursday": "09:00 a 18:00",
            "friday": "09:00 a 18:00",
            "saturday": "09:00 a 18:00",
            "sunday": "CERRADO"
        }
    ]
}
```

Get a list of all available cash payout locations.


### HTTP Request

`GET https://api.bitso.com/v3/remittance_locations/`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)


### Body Parameters

Body parameters should be JSON encoded and should be exactly the same
as the JSON payload used to construct the signature.

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**state** | - | No | Limit results to a particular state.
**city** | - | No | Limit results to a particular city.
**zipcode** | - | No | Limit results to a particular ZIP code.


### JSON Response Payload

Returns a JSON array containing all of the available payout locations meeting the criteria:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**ID** | String | The unique ID for the payout location for use in specifying a new cash-out order | -

# Webhooks

## Registering URLs

Users can register a callback url that will get hit with payloads
corresponding to certain events described below. (Callback urls that take more than 5 seconds to respond will timeout)

> The JSON object returned by the API looks like this:

```json
{
    "success": true,
    "payload": "Succesfully registered URL: <callback_url>"
}
```

### HTTP Request

`POST https://api.bitso.com/v3/webhooks/`

### Authorization Header Parameters

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**key** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**signature** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)
**nonce** | - | Yes | See [Creating and Signing Requests](#creating-and-signing-requests)

### Body Parameters

Body parameters should be JSON encoded and should be exactly the same
as the JSON payload used to construct the signature.

Parameter | Default | Required | Description
--------- | ------- | -------- | -----------
**callback_url** |  | Yes | Specifies a url that will be hit on events

## Fundings

Users that register a webhook will get a POST payload to that URL
with the following fields on deposits.

> The JSON Object posted to the webhook URL looks like this

```json
{
    "event": "funding",
    "payload":

    {
        "fid": "p4u8d7f0768ee91d3b33bee6483132i8",
        "status": "complete",
        "created_at": "2016-04-08T17:52:31+00:00",
        "currency": "mxn",
        "method": "sp",
        "method_name": "Transferencia SPEI",
        "amount": "300.15",
        "details": {
            "sender_name": "HUGO HERNANDEZ MANZANO",
            "sender_bank": "BBVA Bancomer",
            "sender_clabe": "012610001967722183",
            "receive_clabe": "646180115400467548",
            "numeric_reference": "80416",
            "concepto": "Para el 🐖",
            "clave_rastreo": "BNET01001604080002076841",
            "beneficiary_name": "HUGO HERNANDEZ MANZANO"
        }
    }
}
```

### JSON  Payload

Returns a JSON object with the following fields:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**fid** | String | The unique funding ID | -
**currency** | String | Currency funded | -
**method** | String | Method for this funding (mxn, btc, eth). | -
**method_name** | String | Long name for the method | -
**amount** | String | The funding amount | currency
**status** | String | The status for this funding (pending, complete, cancelled) | -
**created_at** | String | Timestamp at which the funding was received |ISO 8601 timestamp
**details** | JSON object | Specific funding details, may vary depending on funding method | -

## Withdrawals

Users that register a webhook will get a POST payload to that URL
with the following fields on withdrawals.

> The JSON Object posted to the webhook URL looks like this

```json
{
    "event": "withdrawal",
    "payload":

    {
        "wid": "p4u8d7f0768ee91d3b33bee6483132i8",
        "status": "complete",
        "created_at": "2017-07-09T19:22:38+00:00",
        "currency": "xrp",
        "method": "rp",
        "method_name": "Ripple",
        "amount": "57",
        "details": {
            "address": "r9cZA1mLK5R5Am25ArfXFmqgNwjZgnfk59",
            "destination_tag": "64136557",
            "ripple_transaction_hash": "33EA42FC7A06F062A7B843AF4DC7C0AB00D6644DFDF4C5D354A87C035813D321"
        }
    }
}
```

### JSON  Payload

Returns a JSON object with the follwing fields:

Field Name | Type | Description | Units
---------- | ---- | ----------- | -----
**wid** | String | The unique withdrawal ID | -
**currency** | String | Currency withdrawn | -
**method** | String | Method for this withdrawal (btc, eth). | -
**method_name** | String | Long name for the method | -
**amount** | String | The withdrawal amount | currency
**status** | String | The status for this withdrawal (pending, complete, cancelled) | -
**created_at** | String | Timestamp at which the withdrawal was received |ISO 8601 timestamp
**details** | JSON object | Specific withdrawal details, may vary depending on withdrawal method | -
