--- 

title: SILA API Documentation

language_tabs: 
   - shell
   - javascript

toc_footers: 
   - <a href='#'>Sign Up for a Developer Key</a> 
   - <a href='https://github.com/lavkumarv'>Documentation Powered by lav</a> 

includes: 
   - errors 

search: true 

--- 

# Introduction 

**Version:** 2018-11-27X 

Welcome to the Sila API! This API gives you the ability to manage sila accounts and transactions directly from your applications.

We have language bindings for cURL and Node.js.

# Authentication

```shell
test
generate signature
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

# /PROTECTEDAPPROVED
## ***POST*** 

### HTTP Request 
`***POST*** /protectedapproved` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | 200 response |

# /GETVENDORDATA
## ***POST*** 

**Summary:** Creates a vendor-specific entry for specialized purposes, such as a Synapse validation key

### HTTP Request 
`***POST*** /getvendordata` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | 200 response |

# /ADDIDENTITY
## ***POST*** 

**Summary:** Add a new national identifier such as Social Security Number

### HTTP Request 
`***POST*** /addidentity` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | 200 response |

# /CHECKTRANSACTION
## ***POST*** 

**Summary:** Verify a transaction

### HTTP Request 
`***POST*** /checktransaction` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | 200 response |

# /ADDCRYPTO
## ***POST*** 

**Summary:** Add an ethereum public key to an existing user

### HTTP Request 
`***POST*** /addcrypto` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | 200 response |

# /CREATEENTITY
## ***POST*** 

**Summary:** Creates a new entity (user, developer, vendor, organization)

### HTTP Request 
`***POST*** /createentity` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | 200 response |

# /CHECKHANDLE
## ***POST*** 

**Summary:** Check if a specific handle is already taken

### HTTP Request 
`***POST*** /checkhandle` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | 200 response |

# /LINKACCOUNT
## ***POST*** 

**Summary:** Link Account message from Plaid

### HTTP Request 
`***POST*** /linkaccount` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | 200 response |

# /VERIFYACCOUNT
## ***POST*** 

**Summary:** Verify a new account by executing two small transactions

### HTTP Request 
`***POST*** /verifyaccount` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | 200 response |

# /issuesila

## ***POST*** 

**Summary:** Issue an amount of sila currency to a user

### HTTP Request 
`***POST*** /issuesila`


```shell
  Curl example
```

```javascript
var message = {
  "amount": 120, // Amount in sila
  "account_name": "default", // Linked account name
  "header": {
    "reference": "00000000-0000-0000-0000-000000000000",
    "created": "2017-09-29T21:40:07Z",
    "handle": "test.silamoney.eth", // User handle
    "version": "v1_0",
    "crypto": "ETH",
    'signature': "SIGNATURE_STRING" // Signature
  },
  "message": "issue_msg"
}
```
**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | 200 response |



See the [Authentication](#authentication) section for details on generating the SIGNATURE_STRING

# /TRANSFERSILA
## ***POST*** 

**Summary:** Transfer an amount of sila currency from one user to another user

### HTTP Request 
`***POST*** /transfersila` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | 200 response |

# /REDEEMSILA
## ***POST*** 

**Summary:** Redeem an amount of sila currency for dollars

### HTTP Request 
`***POST*** /redeemsila` 

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | 200 response |

<!-- Converted with the swagger-to-slate https://github.com/lavkumarv/swagger-to-slate -->
