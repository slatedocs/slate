---
title: Mobius API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://mobius.network/store/developer'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the Mobius API! The Mobius API provides simple access to the Mobius DApp Store and multiple blockchains.

We currently have language examples in Shell using curl with JavaScript, Ruby, and Python examples coming soon! You can view code examples in the dark area to the right, and you can switch the language of the examples with the tabs in the top right.

# Authentication

> To authorize, always include an api_key parameter:

```shell
curl "https://mobius.network/api/v1/ENDPOINT?api_key=API_KEY_HERE"
```

Mobius uses API keys to allow access to the API. You can view your API key at our [developer portal](https://mobius.network/store/developer).

Mobius expects for the API key to be included in all API requests to the server in a parameter that looks like the following:

api_key=API_KEY_HERE

<aside class="notice">
You must replace <code>API_KEY_HERE</code> with your personal API key.
</aside>

# App Store

## Balance

```shell
curl "https://mobius.network/api/v1/app_store/balance?api_key=API_KEY_HERE&app_uid=APP_UID&email=EMAIL"
```

> Returned JSON

```json
{
  "num_credits": 900
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
curl -X POST "https://mobius.network/api/v1/app_store/balance?api_key=API_KEY_HERE&app_uid=APP_UID&email=EMAIL&num_credits=NUM_CREDITS"
```

> Returned JSON

```json
{
  "success": true,
  "num_credits": 900 // number of credits user has after the use
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

# Tokens

## Register

```shell
curl -X POST "https://mobius.network/api/v1/tokens/register?api_key=API_KEY_HERE&token_type=ERC20&name=Augur&symbol=REP&address=0x48c80F1f4D53D5951e5D5438B54Cba84f29F32a5"
```

> Returned JSON

```json
{
  "token_uid": "THE_UID_OF_THE_TOKEN"
}
```

Register a token so you can use it with the other Token API calls.

### HTTP Request

`POST https://mobius.network/api/v1/tokens/register`

### Parameters

Parameter | Description
--------- | -----------
token_type | Currently only supports ERC20.
name | The name of the token.
symbol | The symbol of the token.
address | The address of the token.

## Balance

```shell
curl "https://mobius.network/api/v1/tokens/balance?api_key=API_KEY_HERE&token_uid=TOKEN_UID&address=0x48c80F1f4D53D5951e5D5438B54Cba84f29F32a5"
```

> Returned JSON

```json
{
  "balance": "0x00000000000000000000000000000000000000000000000c9da89f50739987d4"
}
```

Query the number of tokens specified by the token with token_uid that address has.

### HTTP Request

`GET https://mobius.network/api/v1/tokens/balance`

### Parameters

Parameter | Description
--------- | -----------
token_uid | The UID of the token - returned by /register.
address | The address whose balance you want to query.

## Create Address

```shell
curl -X POST "https://mobius.network/api/v1/tokens/create_address?api_key=API_KEY_HERE&token_uid=TOKEN_UID"
```

> Returned JSON

```json
{
  "uid": "8bf6f217-c641-47bc-86da-006b76687da7", // UID of the new address
  "address": "0xe89bb230b39f11e9c870e3115b9e0f569952a2fd",
  "public_key": "the public key", // only if managed=false
  "private_key": "the private key" // only if managed=false
}
```

Create an address for the token specified by token_uid.

### HTTP Request

`POST https://mobius.network/api/v1/tokens/create_address`

### Parameters

Parameter | Description
--------- | -----------
token_uid | The UID of the token - returned by /register.
managed | True if you want Mobius to manage the private key. False if you want to manage the private key. If false, the public and private keys will be returned and never stored by Mobius. Store the private key securely and do not lose it! If you lose the private key any Ether or tokens sent to the address are lost!

## Register Address

```shell
curl -X POST "https://mobius.network/api/v1/tokens/register_address?api_key=API_KEY_HERE&token_uid=TOKEN_UID&address=ADDRESS"
```

> Returned JSON

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

## Transfer Managed

```shell
curl -X POST "https://mobius.network/api/v1/tokens/transfer/managed?api_key=API_KEY_HERE&token_address_uid=TOKEN_ADDRESS_UID&address_to=ADDRESS&num_tokens=NUM_TOKENS"
```

> Returned JSON

```json
{
  "token_address_transfer_uid": "8bf6f217-c641-47bc-86da-006b76687da7" // UID of the transfer - used for querying its status
}
```

Transfer tokens from a Mobius managed address to a specified address. You must have a high enough balance to cover the transaction fees  - on Ethereum this means paying the gas costs. Currently Mobius does not charge any fees itself.

### HTTP Request

`POST https://mobius.network/api/v1/tokens/transfer/managed`

### Parameters

Parameter | Description
--------- | -----------
token_address_uid | The UID of the token - returned by /register.
address_to | The address to send the tokens to.
num_tokens | The number of tokens to trasnfer.

## Transfer Unmanaged

```shell
curl -X POST "https://mobius.network/api/v1/tokens/transfer/unmanaged?api_key=API_KEY_HERE&address_to=ADDRESS&num_tokens=NUM_TOKENS&private_key=PRIVATE_KEY&token_uid=TOKEN_UID"
```

> Returned JSON

```json
{
  "tx_hash": "TRANSACTION_HASH" // The transaction hash
}
```

Perform an ERC20 transfer call sending tokens from the address identified by the private_key to address_to.

### HTTP Request

`POST https://mobius.network/api/v1/tokens/transfer/unmanaged`

### Parameters

Parameter | Description
--------- | -----------
address_to | The address to send the tokens to.
num_tokens | The number of tokens to trasnfer.
private_key | The private key to sign the transaction with - this is the address that sends the tokens and pays the transaction fees. This is never stored by Mobius.
token_uid (optional) | Must specify this or the token_address. If the token is registered in Mobius you can specify the token_uid so the transaction is logged under it.
token_address (optional) | Must specify this or token_uid. If the token is not registered with Mobius you can specify the address of the token here.
gas_price (optional) | Default = 10,000,000,000
gas_limit (optional) | Default = 55,000

## Info

```shell
curl "https://mobius.network/api/v1/tokens/transfer/info?api_key=API_KEY_HERE&token_address_transfer_uid=UID"
```

> Returned JSON

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
