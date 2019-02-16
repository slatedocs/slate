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

**/check_handle** makes sure that the handle you or your user is thinking of using does indeed exist.

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

### Request Body

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `header` | object | This object is required in every call. The information it includes is used to verify the signature. | true |
| `header.created` | integer | Epoch time that the API call was started (in nanoseconds). | true |
| `header.auth_handle` | string | This is the superuser handle that is calling the API on behalf of the user. This superuser must have been used to create the user_handle or the call will fail. | true |
| `header.user_handle` | string | This is the user handle for whom the call is being done. | true |



### Responses

|  Status Code | Description |
| ---- | ----------- |
| 200 | 200 response |

## /create_entity

This is the endpoint you will use to create a new user.

### HTTP Request 
`POST /create_entity` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | 200 response |

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

<!-- Converted with the swagger-to-slate https://github.com/lavkumarv/swagger-to-slate -->
