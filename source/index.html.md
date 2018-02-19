---
title: Mobius API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell: curl
  - javascript: Node
  - php: PHP
  - python: Python
  - jsx: React Native

toc_footers:
  - <a href='https://mobius.network/store/developer'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the Mobius API! The Mobius API provides simple access to the Mobius DApp Store and multiple blockchains.

## Available Libraries

Mobius is available for Node.js, PHP, Python, React Native, and Shell using
curl. Ruby library coming soon!

You can view code examples in the dark area to the right, and you can switch the language of the examples with the tabs in the top right.

### Node.js

Available as a [package](https://www.npmjs.com/package/@mobius-network/mobius-node) with `npm`:

`npm install @mobius-network/mobius-node --save`

or with `yarn`:

`yarn add @mobius-network/mobius-node`

See the source on [Github](https://github.com/mobius-network/mobius-node)

### PHP

Available as a [package](https://packagist.org/packages/zulucrypto/mobius-php) with `composer`:

`composer require zulucrypto/mobius-php`

See the source on [Github](https://github.com/zulucrypto/mobius-php)

### Python

Available as a [package](https://pypi.org/project/pymobius) with `pip`:

`pip install pymobius`

See the source on [Github](https://github.com/mobius-network/mobius-python)

### React Native

Available as a [package](https://www.npmjs.com/package/@mobius-network/mobius-reactnative) with
`npm`:

`npm install @mobius-network/mobius-reactnative --save`

or with `yarn`:

`yarn add @mobius-network/mobius-reactnative`

See the source on [Github](https://github.com/mobius-network/mobius-react-native)


## Authentication

```shell
# You can pass API key as a query parameter
curl "https://mobius.network/api/v1/ENDPOINT?api_key=API_KEY_HERE"

# or via request header
curl "https://mobius.network/api/v1/ENDPOINT" \
     -H "X-Api-Key: API_KEY_HERE"
```

```javascript
import Mobius from '@mobius-network/mobius-node';

const mobius = new Mobius({
  apiKey: 'API_KEY_HERE',
});
```

```php
<?php

require_once '../vendor/autoload.php';

use \ZuluCrypto\MobiusApi\Mobius;
use \ZuluCrypto\MobiusApi\Exception\MobiusApiException;

$API_KEY ='API_KEY_HERE';
$APP_UID = 'APP_UID_HERE';
$EMAIL   = 'YOUR_EMAIL_HERE';

$mobius = new Mobius($API_KEY);
$appStore = $mobius->getAppStore($APP_UID);
```

```python
from pymobius import Mobius

mobius = Mobius(api_key='API_KEY_HERE')
```

```jsx
import Mobius from '@mobius-network/mobius-reactnative';

const mobius = new Mobius({
  apiKey: 'API_KEY_HERE',
});
```

Mobius uses API keys to allow access to the API. You can view your API key at our [developer portal](https://mobius.network/store/developer).

Mobius expects for the API key to be included in all API requests to the server in a query parameter `api_key`, or
using `X-Api-Key` http header.

<aside class="notice">
You must replace <code>API_KEY_HERE</code> with your personal API key.
</aside>

# App Store

## Balance

```shell
curl -G "https://mobius.network/api/v1/app_store/balance" \
     -H "x-api-key: API_KEY_HERE" \
     -d "app_uid=APP_UID" \
     -d "email=EMAIL"
```

```javascript
mobius.appStore
  .balance({
    appUid: 'APP_UID',
    email: 'EMAIL',
  })
  .then(data => { ... });
```

```php
<?php

$userBalance = $appStore->getBalance($EMAIL);
printf(PHP_EOL.'Balance for %s is : %s' .PHP_EOL,$EMAIL,$userBalance);
```

```python
mobius.app_store.balance(app_uid='APP_UID', email='EMAIL')
```

```jsx
mobius.appStore
  .balance({
    appUid: 'APP_UID',
    email: 'EMAIL',
  })
  .then(data => { ... });
```

> Returned JSON (in JavaScript all keys converted to `camelCase`)

```json
{
  "num_credits": "900"
}
```

Get balance of credits for email. Users transfer credits into apps on the DApp store and you can then query the number of credits a user currently has in your app.

### HTTP Request

`GET https://mobius.network/api/v1/app_store/balance`

### Parameters

Parameter | Description
--------- | -----------
app_uid | The UID of the app. Get it at https://mobius.network/store/developer
email | The email of the user whose balance you want to query.

## Use

```shell
curl "https://mobius.network/api/v1/app_store/use" \
     -H "x-api-key: API_KEY_HERE" \
     -d "app_uid=APP_UID" \
     -d "email=EMAIL" \
     -d "num_credits=NUM_CREDITS"
```

```javascript
mobius.appStore
  .use({
    appUid: 'APP_UID',
    email: 'EMAIL',
    numCredits: 'NUM_CREDITS',
  })
  .then(data => { ... });
```

```php
<?php

$newBalance = $appStore->useBalance($EMAIL, 1);
echo 'After spending it becomes: '.$newBalance.PHP_EOL;
```

```python
mobius.app_store.use(app_uid='APP_UID', email='EMAIL', num_credits=NUM_CREDITS)
```

```jsx
mobius.appStore
  .use({
    appUid: 'APP_UID',
    email: 'EMAIL',
    numCredits: 'NUM_CREDITS',
  })
  .then(data => { ... });
```

> Returned JSON (in JavaScript all keys converted to `camelCase`)

```json
{
  "success": true,
  "num_credits": "900" // number of credits user has after the use
}
```

Use num_credits from user with email. This is similar to charging a users credit card. When a user uses credits in your app it means they are spending them and they are transferred to you. Returns true if successful and false if the user did not have enough credits.

### HTTP Request

`POST https://mobius.network/api/v1/app_store/use`

### URL Parameters

Parameter | Description
--------- | -----------
app_uid | The UID of the app. Get it at https://mobius.network/store/developer
email | The email of the user whose credits you want to use.
num_credits | The number of credits to use.

# Data Marketplace

## Data Feed

```shell
curl -G "https://mobius.network/api/v1/data_marketplace/data_feed" \
     -H "x-api-key: API_KEY_HERE" \
     -d "data_feed_uid=DATA_FEED_UID"
```

```javascript
```

```php
```

```python
```

```jsx
```

> Returned JSON (in JavaScript all keys converted to `camelCase`)

```json
{
  "data_feed": {
    "uid": "DATA_FEED_UID",
    "name": "Palo Alto Temperature",
    "description": "Palo Alto Temperature updated every hour",
    "image_url": "https://mobius.network/data_marketplace/palo-temperature.jpg",
    "price": "1.0",
    "descriptor": {
      "name": "temperature",
      "type": "integer"
    }
  },
  "last_updated": "Tue, 21 Nov 2017 18:15:07 UTC +00:00"
}
```

Returns DataFeed and last update timestamp, updated when new DataPoints are added.

### HTTP Request

`GET https://mobius.network/api/v1/data_marketplace/data_feed`

### Parameters

Parameter     | Description
------------- | -----------
data_feed_uid | The UID of the Data Feed

## Create Data Point

```shell
curl "https://mobius.network/api/v1/data_marketplace/data_feed" \
     -H "x-api-key: API_KEY_HERE" \
     -H "Content-Type: application/json" \
     -d '{ "data_feed_uid": "DATA_FEED_UID", "values": { "temperature": "95" }}'
```

```javascript
```

```php
```

```python
```

```jsx
```

> Returned JSON (in JavaScript all keys converted to `camelCase`)

```json
{
  "data_feed": {
    "uid": "DATA_FEED_UID",
    "name": "Palo Alto Temperature",
    "description": "Palo Alto Temperature updated every hour",
    "image_url": "https://mobius.network/data_marketplace/palo-temperature.jpg",
    "price": "1.0",
    "descriptor": {
      "name": "temperature",
      "type": "integer"
    }
  }
}
```

Creates a new DataPoint for the DataFeed with JSON values. Only the Data Feed
owner is allowed to use this endpoint.

### HTTP Request

`POST https://mobius.network/api/v1/data_marketplace/data_feed`

### Parameters

Parameter     | Description
------------- | -----------
data_feed_uid | The UID of the Data Feed
values        | JSON object representing the DataPoint

## Buy

```shell
curl "https://mobius.network/api/v1/data_marketplace/buy" \
     -H "x-api-key: API_KEY_HERE" \
     -d "data_feed_uid=DATA_FEED_UID" \
     -d "address=ECA_ADDRESS"
```

```javascript
```

```php
```

```python
```

```jsx
```

> Returned JSON (in JavaScript all keys converted to `camelCase`)

```json
{
  "data_feed": {
    "uid": "DATA_FEED_UID",
    "name": "Palo Alto Temperature",
    "description": "Palo Alto Temperature updated every hour",
    "image_url": "https://mobius.network/data_marketplace/palo-temperature.jpg",
    "price": "1.0",
    "descriptor": {
      "name": "temperature",
      "type": "integer"
    }
  }
}
```

Buys a Data Feed and sends its data to a Ethereum Contract Address.

### HTTP Request

`POST https://mobius.network/api/v1/data_marketplace/buy`

### Parameters

Parameter     | Description
------------- | -----------
data_feed_uid | The UID of the Data Feed
address       | Ethereum Contract Address that will receive data

# Tokens

## Register token

```shell
curl "https://mobius.network/api/v1/tokens/register" \
     -H "x-api-key: API_KEY_HERE" \
     -d "token_type=erc20" \
     -d "name=Augur" \
     -d "symbol=REP" \
     -d "issuer=0xE94327D07Fc17907b4DB788E5aDf2ed424adDff6"
```

```javascript
mobius.tokens
  .register({
    tokenType: 'erc20',
    name: 'Augur',
    symbol: 'REP',
    address: '0xE94327D07Fc17907b4DB788E5aDf2ed424adDff6',
  })
  .then(data => { ... });
```

```php
<?php

$token = $mobius->registerToken('erc20', 'Augur', 'REP', '0xE94327D07Fc17907b4DB788E5aDf2ed424adDff6');
printf('Registered token with UID : %s'.PHP_EOL, $token->getTokenUid());
```

```python
mobius.register(token_type='erc20', name='Augur', symbol='REP',
                address='0xE94327D07Fc17907b4DB788E5aDf2ed424adDff6')
```

```jsx
mobius.tokens
  .register({
    tokenType: 'erc20',
    name: 'Augur',
    symbol: 'REP',
    address: '0xE94327D07Fc17907b4DB788E5aDf2ed424adDff6',
  })
  .then(data => { ... });
```

> Returned JSON (in JavaScript all keys converted to `camelCase`)

```json
{
  "uid": "THE_UID_OF_THE_TOKEN",
  "token_type":"erc20",
  "name":"Augur",
  "symbol":"REP",
  "issuer":"0xE94327D07Fc17907b4DB788E5aDf2ed424adDff6"
}
```

Register a token so you can use it with the other Token API calls.

### HTTP Request

`POST https://mobius.network/api/v1/tokens/register`

### Parameters

Parameter  | Description
---------- | -----------
token_type | Supported values: "erc20" or "stellar"
name       | The name of the token.
symbol     | The symbol of the token.
issuer    | The issuer of the token.

## Create address

```shell
curl "https://mobius.network/api/v1/tokens/create_address" \
     -H "x-api-key: API_KEY_HERE" \
     -d "token_uid=TOKEN_UID"
```

```javascript
mobius.tokens
  .createAddress({
    tokenUid: 'TOKEN_UID',
    managed: true,
  })
  .then(data => { ... });
```

```php
<?php

$address = $token->createAddress(true); // managed (bool) true/false
printf('Address created from token created by `registerToken` method : %s'.PHP_EOL,$address['address']);
```

```python
mobius.tokens.create_address(token_uid='TOKEN_UID', managed=true)
```

```jsx
mobius.tokens
  .createAddress({
    tokenUid: 'TOKEN_UID',
    managed: true,
  })
  .then(data => { ... });
```

> Returned JSON (in JavaScript all keys converted to `camelCase`)

```json
{
  "uid": "8bf6f217-c641-47bc-86da-006b76687da7", // UID of the new address
  "address": "0xe89bb230b39f11e9c870e3115b9e0f569952a2fd"
}
```

Create an address for the token specified by token_uid.

### HTTP Request

`POST https://mobius.network/api/v1/tokens/create_address`

### Parameters

Parameter | Description
--------- | -----------
token_uid | The UID of the token - returned by /register.


## Register address

```shell
curl "https://mobius.network/api/v1/tokens/register_address" \
     -H "x-api-key: API_KEY_HERE" \
     -d "token_uid=TOKEN_UID" \
     -d "address=ADDRESS"
```

```javascript
mobius.tokens
  .registerAddress({
    tokenUid: 'TOKEN_UID',
    address: 'ADDRESS',
  })
  .then(data => { ... });
```

```php
<?php

$response = $token->registerAddress($address['address']); // address obtained from `createAddress` method
printf('`UID` of the new address created from address created `createAddress` method  :  %s'.PHP_EOL,$response);
$newAdd=$response;
```

```python
mobius.tokens.register_address(token_uid='TOKEN_UID', address='ADDRESS')
```

```jsx
mobius.tokens
  .registerAddress({
    tokenUid: 'TOKEN_UID',
    address: 'ADDRESS',
  })
  .then(data => { ... });
```

> Returned JSON (in JavaScript all keys converted to `camelCase`)

```json
{
  "uid": "8bf6f217-c641-47bc-86da-006b76687da7" // UID of the new address
}
```

Register an address for the token specified by token_uid. Registered addresses, like created addresses, are monitored for incoming transfers of the token specified via token_uid. When new tokens are transferred into the address, you are alerted via the `token/transfer` webhook callback.

### HTTP Request

`POST https://mobius.network/api/v1/tokens/register_address`

### Parameters

Parameter | Description
--------- | -----------
token_uid | The UID of the token - returned by /register.
address | The address to register


## Get address balance

```shell
curl -G 'https://mobius.network/api/v1/tokens/balance' \
     -H "x-api-key: API_KEY_HERE" \
     -d "token_uid=TOKEN_UID" \
     -d "address=0x48c80F1f4D53D5951e5D5438B54Cba84f29F32a5"
```

```javascript
mobius.tokens
  .balance({
    tokenUid: 'TOKEN_UID',
    address: '0x48c80F1f4D53D5951e5D5438B54Cba84f29F32a5',
  })
  .then(data => { ... });
```

```php
<?php

$response = $token->getBalance($address['address']);
printf('`Balance` of the new address created or address registered  :  %s'.PHP_EOL,$response);
```

```python
mobius.tokens.balance(token_uid='TOKEN_UID', address='ADDRESS')
```

```jsx
mobius.tokens
  .balance({
    tokenUid: 'TOKEN_UID',
    address: '0x48c80F1f4D53D5951e5D5438B54Cba84f29F32a5',
  })
  .then(data => { ... });
```

> Returned JSON (in JavaScript all keys converted to `camelCase`)

```json
{
  "address":"0xE94327D07Fc17907b4DB788E5aDf2ed424adDff6",
  "balance":"31.531687",
  "token": {
    "type_type":"erc20",
    "name": "Augur",
    "symbol": "REP",
    "issuer":"0xE94327D07Fc17907b4DB788E5aDf2ed424adDff6"
  }
}
```

Query the number of tokens specified by the token with token_uid that address has.

### HTTP Request

`GET https://mobius.network/api/v1/tokens/balance`

### Parameters

Parameter | Description
--------- | -----------
token_uid | The UID of the token - returned by /register.
address   | The address whose balance you want to query.

## Create transfer

```shell
curl "https://mobius.network/api/v1/tokens/transfer/managed" \
     -H "x-api-key: API_KEY_HERE" \
     -d "token_address_uid=TOKEN_ADDRESS_UID" \
     -d "address_to=ADDRESS" \
     -d "num_tokens=NUM_TOKENS"
```

```javascript
mobius.tokens
  .transferManaged({
    tokenAddressUid: 'TOKEN_ADDRESS_UID',
    addressTo: 'ADDRESS',
    numTokens: 'NUM_TOKENS',
  })
  .then(data => { ... });
```

```php
<?php

$response = $token->transferManaged($address['address'], 0);
printf('`Transfer` tokens from a Mobius managed address :  %s'.PHP_EOL,$response);
```

```python
mobius.tokens.transfer_managed(token_address_uid='TOKEN_ADDRESS_UID',
                               address_to='ADDRESS', num_tokens=NUM_TOKENS)
```

```jsx
mobius.tokens
  .transferManaged({
    tokenAddressUid: 'TOKEN_ADDRESS_UID',
    addressTo: 'ADDRESS',
    numTokens: 'NUM_TOKENS',
  })
  .then(data => { ... });
```

> Returned JSON (in JavaScript all keys converted to `camelCase`)

```json
{
  "token_address_transfer_uid": "8bf6f217-c641-47bc-86da-006b76687da7" // UID of the transfer - used for querying its status
}
```

Transfer tokens from a Mobius managed address to a specified address. You must have a high enough balance to cover the
transaction fees — on Ethereum this means paying the gas costs. Currently Mobius does not charge any fees itself.

### HTTP Request

`POST https://mobius.network/api/v1/tokens/transfer/managed`

### Parameters

Parameter | Description
--------- | -----------
token_address_uid | Token Address UID (returned by `/create_address`)
address_to | The address to send the tokens to.
num_tokens | The number of tokens to trasnfer.

## Get transfer info

```shell
curl -G "https://mobius.network/api/v1/tokens/transfer/info"
     -H "x-api-key: API_KEY_HERE"
     -d "token_address_transfer_uid=UID"
```

```javascript
mobius.tokens
  .transferInfo({
    tokenAddressTransferUid: 'UID',
  })
  .then(data => { ... });
```

```php
<?php

$response = $token->getTransferInfo($token_address_uid);
printf('Get the `transaction` hash of a Mobius managed token transfer. :  %s'.PHP_EOL,$response);
```

```python
mobius.tokens.transfer_info(token_address_transfer_uid='UID')
```

```jsx
mobius.tokens
  .transferInfo({
    tokenAddressTransferUid: 'UID',
  })
  .then(data => { ... });
```

> Returned JSON (in JavaScript all keys converted to `camelCase`)

```json
{
  "uid": "8bf6f217-c641-47bc-86da-006b76687da7", // The token_address_transfer_uid
  "status": "pending", // error, pending, sent, or complete
  "tx_hash": "TRANSACTION HASH" // hash of the transaction once it has been sent.
}
```

Get the status and transaction hash of a Mobius managed token transfer.

### HTTP Request

`GET https://mobius.network/api/v1/tokens/transfer/info`

### Parameters

Parameter | Description
--------- | -----------
token_address_transfer_uid | The UID of the token address transfer returned by transfer/managed.

# Webhooks

Mobius uses webhook callbacks to alert you of actions. You can specify your webhook callback URL at https://mobius.network/store/developer. All webhooks use the POST method and have a JSON body.

All webhook requests have two headers:

1. Mobius-API-Key - this is your API key. If the value of this header does not match your Mobius API key the request is NOT from Mobius and should be ignored.

2. Mobius-Webhook-ID - a unique identifier so you can identify potentially duplicate calls.

## App Store Deposit

> JSON Body

```json
{
  "action_type": "app_store/deposit",
  "app_uid": "UID",
  "email": "user@gmail.com",
  "num_credits": 500, // Number of credits deposited in this transaction
  "total_num_credits": 1000 // Total number of credits the user has in your app
}
```

Called when a user deposits credits in your app through the DApp store.

## App Store Withdraw

> JSON Body

```json
{
  "action_type": "app_store/withdraw",
  "app_uid": "UID",
  "email": "user@gmail.com",
  "num_credits": 500, // Number of credits deposited in this transaction
  "total_num_credits": 1000 // Total number of credits the user has in your app
}
```

Called when a user withdraws credits in your app through the DApp store.


## Token Transfer

> JSON Body

```json
{
  "action_type": "token/transfer",
  "token_uid": "UID",
  "from": "from address",
  "to": "to address",
  "num_tokens": 500, // Number of tokens trasnferred in this transaction
  "total_num_tokens": 1000, // Total number of tokens in the to address
  "tx_hash": "hash of transaction"
}
```

Called when tokens are transferred into a Mobius created or registered address for a registered token.
