--- 

title: SILA API Documentation

language_tabs: 
   - json
   - shell
   - javascript

toc_footers: 
   - <a href='#'>Sign Up for a Developer Key</a> 

includes: 
   - errors 

search: true 

--- 

# Introduction 

**Version:** 0.1.1

Welcome to the Sila API! 

Within weeks, you should be able to integrate know-your-customer, bank account linking, and tokenized money transfers into your application. We're excited to see what you build.

# Flow

TODO: 

- link to quickstart for setup
- describe how to generate keys/get users to sign messages with plugins
- order of endpoints to call

# Authentication

```json
```

```shell
```

```javascript
// For the purposes of this example, we will let a library do the heavy lifting
// See https://github.com/pubkey/eth-crypto
const EthCrypto = require('eth-crypto');

var request_data = {};

var message = { test: 'message' };
var private_key = 'PRIVATE_KEY';

// Generate the message hash
var msg_hash = EthCrypto.hash.keccak256(JSON.stringify(message));

// Create a signature using your private key
var signature = EthCrypto.sign(private_key, messageHash);

// The EthCrypto library adds a leading '0x' which should be removed from the signature.
signature = signature.substring(2);

request_data.headers.signature = signature;
request_data.body = message;

...

```

This API is secured by validating a signature of the complete message. For example, to authenticate the following message:

Use these examples to generate a signature for the following message: `{ test: 'message' }`

<aside class="notice">Replace `'PRIVATE_KEY'` with your private key</aside>

# Endpoints

## /check_handle

*Checks if a specific handle is already taken.*

A "handle" works like a username in the Sila ecosystem. If an entity has already been created with that handle, it will respond with an error that says the handle is already in use, and the entity will fail to be created.

This endpoint makes sure that the handle you or your user is thinking of using does indeed exist.

### Request Body

```json
{
  "header": {
    "created": 1234567890,
    "auth_handle": "handle.silamoney.eth",
    "user_handle": "user.silamoney.eth",
    "version": "v1_1",
    "crypto": "ETH",
    "reference": "ref"
  },
  "message": "header_msg"
}
```

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `header` | object | This object is required in every call. The information it includes is used to verify the signature. | true |
| `header.created` | integer | Epoch time that the API call was started (in nanoseconds). | true |
| `header.auth_handle` | string | This is the superuser handle used to identify the API consumer making the call. | true |
| `header.user_handle` | string | This is the user handle to check. | true |
| `header.reference` | string | This is an idempotency string used to identify the call you've made. | true |
| `header.version` | string | This tag specifies the version of the API you want to use. (As of writing, the only valid version string to use is `v1_1`.) | true |
| `header.crypto` | string | This tag specifies the blockchain network to use. (As of writing, the only valid crypto tag available is `ETH`.) | true |
| `message` | string | This tag specifies the JSON schema object to validate against. For this call, use `header_msg`. | true |

### Responses

|  Status Code | Description | Message |
| ---- | ----------- | ------- |
| 200 | Handle is free to use. |  |

## /create_entity

*Starts verifcation process on a person and attaches result and specified blockchain address to assigned handle.*

This is the endpoint you will use to create a new user. In the call, you will need to complete all fields and include a valid Ethereum address (not already used in system and not a smart contract). The information provided will be used to verify that this information belongs to a real person, and the results will be returned asynchronously by hitting the **check_kyc** endpoint.

### Request Body

```json
{
  "header": {
    "reference": "SOME ID",
    "created": 1234567890,
    "user_handle": "user.silamoney.eth",
    "auth_handle": "handle.silamoney.eth",
    "version": "v1_1",
    "crypto": "ETH"
  },
  "message": "entity_msg",
  "address": {
    "address_alias": "home",
    "street_address_1": "123 Main Street",
    "city": "New City",
    "state": "OR",
    "country": "US",
    "postal_code": "97204-1234"
  },
  "identity": {
    "identity_alias": "SSN",
    "identity_value": "123452222"
  },
  "contact": {
    "phone": "503-123-4567",
    "contact_alias": "",
    "email": "example@silamoney.com"
  },
  
  "crypto_entry": {
    "crypto_alias": "Address 1",
    "crypto_address": "0x1234567890abcdef1234567890abcdef12345678",
    "crypto_code": "ETH"
  },
  "entity": {
    "birthdate": "1900-01-01",
    "entity_name": "Example User",
    "first_name": "Example",
    "last_name": "User",
    "relationship": "user"
  }
}
```

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `header` | object | This object is required in every call. The information it includes is used to verify the signature. | true |
| `header.created` | integer | Epoch time that the API call was started (in nanoseconds). | true |
| `header.auth_handle` | string | This is the superuser handle used to identify the API consumer making the call. | true |
| `header.user_handle` | string | This is the user handle attached to the KYC'd entity. | true |
| `header.reference` | string | This is an idempotency string used to identify the call you've made. | true |
| `header.version` | string | This tag specifies the version of the API you want to use. (As of writing, the only valid version string to use is `v1_1`.) | true |
| `header.crypto` | string | This tag specifies the blockchain network to use. (As of writing, the only valid crypto tag available is `ETH`.) | true |
| `message` | string | This tag specifies the JSON schema object to validate against. For this call, use `entity_msg`. | true |
| `address` | object | This object specifies the street address of the person being verified. | true |
| `address.address_alias` | string | This is a nickname that can be attached to the address object. While a required field, it can be left blank if desired. | true |
| `address.street_address_1` | string | This is line 1 of a street address. Post office boxes are not accepted in this field. | true |
| `address.street_address_2` | string | This is line 2 of a street address. This may include suite or apartment numbers. | false |
| `address.city` | string | Name of the city where the person being verified is a current resident. | true |
| `address.state` | string | Name of state where verified person is a current resident. (As of writing, this is a required field as the only accepted country is the US, but this may be expected to change in future versions.) | true |
| `address.country` | string | Two-letter country code. (As of writing, the only acceptable value is `US`.) | true |
| `address.postal_code` | string | In the US, this can be the 5-digit ZIP code or ZIP+4 code. | true |
| `identity` | object | This is used to specify an ID and what kind of ID is being specified. (As of writing, Sila only accepts social security numbers, but this will expand in the future.) | true |
| `identity.alias` | string | This describes what kind of ID is being sent. (As of writing, the only accepted value is `SSN`.) | true |
| `identity.identity_value` | string | This is where the ID value would go. | true |
| `contact` | object | This is where the verified person's phone number and email address are sent. | true |
| `contact.phone` | string | This is the verified person's phone number. Please specify area code at a minimum and country code if anywhere but US. | true |
| `contact.email` | string | This is the verified person's email address. | true |
| `contact.contact_alias` | string | Any name attached to the email/phone pair. If desired, leave empty, but don't leave out. | true |
| `crypto_entry` | object | Used to specify the blockchain address and network code it runs on. | true |
| `crypto_entry.crypto_alias` | string | A name to identify the address/code pairing. Can be left blank. | true |
| `crypto_entry.crypto_address` | string | Hex-encoded blockchain address. | true |
| `crypto_entry.crypto_code` | string | Code to identify network address is on. (As of writing, the only acceptable value is `ETH`.) | true |
| `entity` | object | Includes names, birthdates, and user type. | true |
| `entity.birthdate` | string | Date of birth/inception. Must be formatted YYYY-MM-DD. | true |
| `entity.entity_name` | string | Full name of entity. This field is used because some names are "Last First" rather than the "First Last" format usually expected in the US. | true |
| `entity.first_name` | string | First name of entity. | true |
| `entity.last_name` | string | Last name of entity. | true |
| `entity.relationship` | string | This is the entity type. Specify `user` in this field to manage the entity as a user. | true |

### Responses

| Code | Description |
| ---- | ----------- |
| 200 | 200 response |

## /check_kyc
*Returns whether entity attached to user handle is verified, not valid, or still pending.*

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `header` | object | This object is required in every call. The information it includes is used to verify the signature. | true |
| `header.created` | integer | Epoch time that the API call was started (in nanoseconds). | true |
| `header.auth_handle` | string | This is the superuser handle used to identify the API consumer making the call. | true |
| `header.user_handle` | string | This is the user handle attached to the KYC'd entity. | true |
| `header.reference` | string | This is an idempotency string used to identify the call you've made. | true |
| `header.version` | string | This tag specifies the version of the API you want to use. (As of writing, the only valid version string to use is `v1_1`.) | true |
| `header.crypto` | string | This tag specifies the blockchain network to use. (As of writing, the only valid crypto tag available is `ETH`.) | true |
| `message` | string | This tag specifies the JSON schema object to validate against. For this call, use `header_msg`. | true |

## /link_account

**Summary:** Link Account message from Plaid

### HTTP Request 
`***POST*** /link_account` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | 200 response |

## /issue_sila

**Summary:** Issue an amount of sila currency to a user

### HTTP Request 
`***POST*** /issue_sila`


```shell
  Curl example
```

```javascript
var message = {
  "amount": 120, // Amount in Sila
  "account_name": "default", // Linked account name
  "header": {
    "reference": "your-reference-string-here",
    "created": 1550171834,
    "handle": "test.silamoney.eth", // User handle
    "version": "v1_1",
    "crypto": "ETH",
  },
  "message": "issue_msg"
}
```
**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | 200 response |



See the [Authentication](#authentication) section for details on generating the SIGNATURE_STRING

## /transfer_sila

**Summary:** Transfer an amount of sila currency from one user to another user

### HTTP Request 
`***POST*** /transfer_sila` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | 200 response |

## /redeem_sila

**Summary:** Redeem an amount of sila currency for dollars

### HTTP Request 
`***POST*** /redeem_sila` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | 200 response |

# Message Types

# Transaction Error Codes
