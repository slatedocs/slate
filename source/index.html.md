--- 

title: Sila API Documentation

language_tabs:
   - javascript
   - python
   - java
   - go

toc_footers: 
   - <a href='#'>Sign Up for a Developer Key</a> 

search: true 

--- 

# Introduction 

Welcome to the Sila API! 

Sila allows you to usher users through a KYC process, link bank accounts through Plaid, and then transfer money among these users with an underlying stablecoin. Our aim is to make this process simple and accessible, especially for innovators and disruptors.

# Flow

To get set up with using Sila, you'll need to obtain your own "**auth handle**" with a **set of keys**. In order to obtain these, a prospective developer must first go through an automated KYC vetting process. Visit the [quickstart guides](https://guide.silamoney.com/api/) to learn more.

Your keys will double as Ethereum private/public keys. You should *not* plan to hold large amounts of assets at the associated Ethereum address; these will be used in the API's [authentication mechanism](#authentication). While you will never pass your private key in an API call to Sila, you will be signing each request body and sending the resultant signature in a header.

Once you've gotten set up, you'll be ready to follow the recommended flow for using our API endpoints.

## User Registration

Users added to an application must have an Ethereum private key and handle, then they need to be sent through a KYC verification process.

1. Generate a private key for the user (or have them generate/manage it themselves).
2. Either randomly generate a handle or allow the user to pick a handle for themselves. The handle should be checked against the [/check_handle](#check_handle) endpoint for availability.
3. The user must pass in their required KYC information (see [entity message type](#entity_msg)). This information should be used to populate a [/create_entity](#create_entity) request.
4. It may take some time for the KYC process to complete, and a success response from /create_entity only means that the verification process has started, not that the user has been verified. Subsequent [/check_kyc](#check_kyc) requests are the only way to know whether the person's information has been verified. 

*Note that the rest of the endpoints, including /check_kyc, require a signature, not only from the developer's private key, but also from the user's private key.*

## Bank Account Linking

Bank account linking is provided through our partner, Plaid. 

On the client side of your application, integrate [Plaid Link](https://plaid.com/docs/#creating-items-with-plaid-link), obtain the public token from your user's interaction with the interface, then send it on to our [/link_account](#link_account) endpoint.

In order to make public tokens that we can use, you will need to use our public key in your Plaid calls. You should gain access to this key when you register, or you can check out our demo app to see what parameters we use.

As of writing, responses at the /link_account endpoint are synchronous, meaning that a success response indicates a successfully-linked bank account.

## Token Transfers

The SILA token is used to exchange USD value among users. For example, this would be the process of transferring $5.17 from user A to user B:

1. Users A and B successfully pass KYC in our system.
2. Users A and B successfully link their bank accounts.
3. [/issue_sila](#issue_sila) is called for user A, requesting issuance of 517 SILA to their Ethereum address.
4. $5.17 is debited from A's bank account and sent to our backend, where it will be traded for US Treasuries.
5. When the $5.17 transaction is marked as "finally settled," which takes 2-3 business days, 517 SILA are minted at user A's Ethereum address.
6. During this process, you can poll [/get_transactions](#get_transactions) to check the status of this transaction.
7. When user A has 517 SILA, those SILA can be transferred to user B's address either with the [/transfer_sila](#transfer_sila) endpoint or directly over the blockchain (which will incur variable "gas costs" in Ethereum for which the developer is responsible). The transaction can only be tracked with /get_transactions if the /transfer_sila endpoint was called; otherwise, you can use something like Etherscan to monitor the transaction yourself.
8. When user B has 517 SILA at their address, they can then have [/redeem_sila] called for them, requesting 517 SILA to be redeemed.
9. 517 SILA are immediately burned from B's address and the process of crediting $5.17 to their linked bank account from our backend is started. (If crediting fails, perhaps due to the bank account being closed, the transaction will be rolled back, thus re-minting the SILA at B's address.)
10. Thus, A has been debited $5.17 and B has been credited $5.17.

*Note: this does not take any per-transaction fees into account.*

# Authentication

```javascript
// Authentication mechanism example

// For this example, we will use a library for message signing.
// See: https://github.com/pubkey/eth-crypto
const EthCrypto = require('eth-crypto');

// You will need a message (request body contents) and a private key.
// This private key will be an Ethereum private key, hex-encoded 
// and 64 characters in length, omitting any "0x" that might precede it.
var messageJSON = { test: 'message' };
var private_key = 'PRIVATE_KEY';

// Stringify the message. (The string that gets hashed should be
// guaranteed to be the same as what is sent in the request.)
var message = JSON.stringify(messageJSON)

// Generate the message hash using the Keccak 256 algorithm.
var msg_hash = EthCrypto.hash.keccak256(message);

// Create a signature using your private key and the hashed message.
var signature = EthCrypto.sign(private_key, messageHash);

// The EthCrypto library adds a leading '0x' which should be removed from the signature.
signature = signature.substring(2);

// The raw message should then be sent in an HTTP request body, and the signature
// should be sent in a header.
var request_data = {};
request_data.headers.signature = signature;
request_data.body = message;

//...
```

```python
# No signing example here yet. Check back later!
```

```java
// No signing example here yet. Check back later!
```

```go
// Authentication mechanism example

// Imports used:
import (
	"encoding/hex"
	"encoding/json"
	"log"
	"math/big"

	"github.com/ethereum/go-ethereum/crypto"
)

// You will need a message (the contents of the request body
// you will send) and a private key.
// This private key will be an ethereum private key. In this example,
// it should be a hex string 64 characters in length, omitting any "0x" 
// that might precede the number.
privateKey := "PRIVATE_KEY"
messageJSON := map[string]interface{}{
  "test": "message",
}

// Convert a private key from hex to the *ecdsa.PrivateKey type if needed.
pk, err := crypto.HexToECDSA(privateKey)
if err != nil {
  log.Fatal(err) // handle errors however you'd like in your implementation.
}

// Marshal the message to JSON; this function returns bytes.
// (The bytes that get hashed should be guaranteed to be the same as what is sent in the request.)
message, err := json.Marshal(&messageJSON)
if err != nil {
  log.Fatal(err)
}

// Generate the message hash using the Keccak 256 algorithm.
msgHash := crypto.Keccak256(message)

// Create a signature using your private key and the hashed message.
sigBytes, err := crypto.Sign(msgHash, pk)
if err != nil {
  log.Fatal(err)
}

// The signature just created is off by -27 from what the API will expect.
// Correct that by converting the signature bytes to a big int and adding 27.
var offset int64 = 27
var bigSig = new(big.Int).SetBytes(sigBytes)
sigBytes = bigSig.Add(bigSig, big.NewInt(offset)).Bytes()

// The big library takes out any padding, but the resultant signature must be
// 130 characters (65 bytes) long. In some cases, you might find that sigBytes
// now has a length of 64, so you can fix that in this way (this prepends
// the hex value with "0" until the requisite length is reached).
// Example: if you must pass in two digits but your value is 1, you can pass in 01.
var sigBytesLength = 65 // length of a valid signature byte array
var arr = make([]byte, sigBytesLength)
copy(arr[(sigBytesLength-len(sigBytes)):], sigBytes)

// Encode the bytes to a hex string.
sig := hex.EncodeToString(arr)

// The raw message should then be sent in an HTTP request body, and the signature
// should be sent in a header.
log.Println("Message:", string(message))
log.Println("Signature:", sig, "Signature length:", len(sig))

//...
```

This API is secured by validating a signature of the request body (also simply referred to, in this documentation, as a "message").

Each created user and developer application must have a set of Ethereum keys. Whether managed by the developer or the user, the user's private key must be used to sign the request body of most messages, and the developer application keys must be used to sign every message.

<aside class="notice">In the code examples, replace `'PRIVATE_KEY'` with your private key.</aside>

## Zero Knowledge Proof

(TODO: Overview of how Ethereum signatures work to prove ownership of the private key without revealing the private key. Provide a link.)

## Managing Private Keys

- If generating and storing private keys on behalf of users, private keys should be stored in an encrypted form and never be sent over a network.
- If your developer keys or a user's keys are compromised, contact us immediately, and we can deactivate users/linked bank accounts, change addresses, and revert transactions as necessary.

(TODO: more details on recommended practices)

## Security

(TODO: Mention how replay attacks are prevented by enforcing a range on the created timestamp)
(2FA required for users and developers)
(Anything else?)

# Endpoints

## /check_handle

```
POST /0.1/check_handle HTTP/1.1
Host: api.silamoney.com

authsignature: [GENERATED AUTHSIGNATURE HERE]
Content-Type: application/json

{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

```javascript
// check_handle JavaScript example coming soon
```

```python
# check_handle Python example coming soon
```

```java
// check_handle Java example coming soon
```

```go
// check_handle Go example coming soon
```

*Checks if a specific handle is already taken.*

A "handle" works like a username in the Sila ecosystem. If an entity has already been created with that handle, it will respond with an error that says the handle is already in use, and the entity will fail to be created.

This endpoint makes sure that the handle you or your user is thinking of using does indeed exist. In the "user_handle" field, insert the handle for which you want to check availability. The entry for "auth_handle" should have your developer handle.

The request body at this endpoint is the [header_msg](#header_msg) JSON object. 

### Responses

| Status Code | Response Body | Description |
| ----------- | ------------- | ----------- |
| 200 | | |

## /create_entity

```
POST /0.1/check_handle HTTP/1.1
Host: api.silamoney.com

authsignature: [GENERATED AUTHSIGNATURE HERE]
usersignature: [GENERATED USERSIGNATURE HERE]
Content-Type: application/json

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

```javascript
// JavaScript create_entity example coming soon
```

```python
# Python create_entity example coming soon
```

```java
// Java create_entity example coming soon
```

```go
// Go create_entity example coming soon
```

*Starts verification process on a person and attaches result and specified blockchain address to assigned handle.*

This is the endpoint you will use to create a new user. In the call, you will need to complete all fields and include a valid Ethereum address (not already used in system and not a smart contract). The information provided will be used to verify that this information belongs to a real person, and the results will be returned asynchronously by hitting the **check_kyc** endpoint.

This endpoint's request body is the [entity_msg](#entity_msg) JSON object.

### Responses

| Status Code | Response Body | Description |
| ----------- | ------------- | ----------- |
| 200 | | |

## /check_kyc

```
POST /0.1/check_handle HTTP/1.1
Host: api.silamoney.com

authsignature: [GENERATED AUTHSIGNATURE HERE]
Content-Type: application/json

{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

```javascript
// JavaScript example coming soon
```

```python
# Python example coming soon
```

```java
// Java example coming soon
```

```go
// Go example coming soon
```

*Returns whether entity attached to user handle is verified, not valid, or still pending.*

Detailed description here

The request body at this endpoint is the [_msg](#) JSON object. 

### Responses

| Status Code | Response Body | Description |
| ----------- | ------------- | ----------- |
| 200 | | |

## /link_account

```
POST /0.1/check_handle HTTP/1.1
Host: api.silamoney.com

authsignature: [GENERATED AUTHSIGNATURE HERE]
Content-Type: application/json

{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

```javascript
// JavaScript example coming soon
```

```python
# Python example coming soon
```

```java
// Java example coming soon
```

```go
// Go example coming soon
```

*Overview*

Detailed description

The request body at this endpoint is the [_msg](#) JSON object.

### Responses

| Status Code | Response Body | Description |
| ----------- | ------------- | ----------- |
| 200 | | |

## /issue_sila

```
POST /0.1/check_handle HTTP/1.1
Host: api.silamoney.com

authsignature: [GENERATED AUTHSIGNATURE HERE]
Content-Type: application/json

{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

```javascript
// JavaScript example coming soon
```

```python
# Python example coming soon
```

```java
// Java example coming soon
```

```go
// Go example coming soon
```

*Overview*

Detailed description

The request body at this endpoint is the [_msg](#) JSON object.

### Responses

| Status Code | Response Body | Description |
| ----------- | ------------- | ----------- |
| 200 | | |

## /transfer_sila

```
POST /0.1/check_handle HTTP/1.1
Host: api.silamoney.com

authsignature: [GENERATED AUTHSIGNATURE HERE]
Content-Type: application/json

{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

```javascript
// JavaScript example coming soon
```

```python
# Python example coming soon
```

```java
// Java example coming soon
```

```go
// Go example coming soon
```

*Overview*

Detailed description

The request body at this endpoint is the [_msg](#) JSON object.

### Responses

| Status Code | Response Body | Description |
| ----------- | ------------- | ----------- |
| 200 | | |

## /redeem_sila

```
POST /0.1/check_handle HTTP/1.1
Host: api.silamoney.com

authsignature: [GENERATED AUTHSIGNATURE HERE]
Content-Type: application/json

{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

```javascript
// JavaScript example coming soon
```

```python
# Python example coming soon
```

```java
// Java example coming soon
```

```go
// Go example coming soon
```

*Overview*

Detailed description

The request body at this endpoint is the [_msg](#) JSON object.

### Responses

| Status Code | Response Body | Description |
| ----------- | ------------- | ----------- |
| 200 | | |

## /get_transactions

```
POST /0.1/check_handle HTTP/1.1
Host: api.silamoney.com

authsignature: [GENERATED AUTHSIGNATURE HERE]
Content-Type: application/json

{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

```javascript
// JavaScript example coming soon
```

```python
# Python example coming soon
```

```java
// Java example coming soon
```

```go
// Go example coming soon
```

*Overview*

Detailed description

The request body at this endpoint is the [_msg](#) JSON object.

### Responses

| Status Code | Response Body | Description |
| ----------- | ------------- | ----------- |
| 200 | | |

# Message Types

Request bodies, also called "messages," are required to have particularly-structured JSON. These message types have names, making it easier to identify exactly what structure you need in the endpoint you need to use.

We have a public JSON schema [here](https://api.silamoney.com/PROD/getschema?schema=SilaSchema).

## header_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

**Used By Endpoints**:

- [/check_handle](#check_handle)
- [/check_kyc](#check_kyc)

**JSON structure**:

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `header` | object | This object is required in every call. The information it includes is used to verify the signature. Object reference [here](#header) | true |
| `message` | string | This tag specifies the JSON schema object to validate against. For this call, use `header_msg`. | true |

## entity_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

**Used By Endpoints:**

- [/create_entity](#create_entity)

**JSON Structure:**

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `header` | object | Object reference [here](#header). This object is required in every call. The information it includes is used to verify the signature. | true |
| `message` | string | This tag specifies the JSON schema object to validate against. For this call, use `entity_msg`. | true |
| `address` | object | Object reference [here](#address). This object specifies the street address of the person being verified. | true |
| `identity` | object | Object reference [here](#identity). This is used to specify an ID and what kind of ID is being specified. (As of writing, Sila only accepts social security numbers, but this will expand in the future.) | true |
| `contact` | object | Object reference [here](#contact). This is where the verified person's phone number and email address are sent. | true |
| `crypto_entry` | object | Object reference [here](#crypto_entry). Used to specify the blockchain address and network code it runs on. | true |
| `entity` | object | Object definition [here](#entity). Includes names, birthdates, and user type. | true |

## get_users_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

**Used By Endpoints:**

- [/get_users](#)

**JSON Structure:**

TODO

## link_account_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

**Used By Endpoints:**

- [/link_account](#)

**JSON Structure:**

TODO

## get_accounts_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

**Used By Endpoints:**

- [/get_accounts](#)

**JSON Structure:**

TODO

## issue_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

**Used By Endpoints:**

- [/issue_sila](#issue_sila)

**JSON Structure:**

TODO

## transfer_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

**Used By Endpoints:**

- [/transfer_sila](#transfer_sila)

**JSON Structure:**

TODO

## redeem_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

**Used By Endpoints:**

- [/redeem_sila](#redeem_sila)

**JSON Structure:**

TODO

## get_transactions_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

**Used By Endpoints:**

- [/get_transactions](#get_transactions)

**JSON Structure:**

TODO

# Message Object References

These are objects referenced in the [Message Types](#message-types) section.

## header

**Referenced in Message Types:**

- [header_msg](#header_msg)
- [entity_msg](#entity_msg)
- [link_account_msg](#link_account_msg)
- [issue_msg](#issue_msg)
- [transfer_msg](#transfer_msg)
- [redeem_msg](#redeem_msg)
- [get_users_msg](#get_users_msg)
- [get_accounts_msg](#get_accounts_msg)
- [get_transactions_msg](#get_transactions_msg)

**JSON Structure:**

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `header.created` | integer | Epoch time that the API call was started (in nanoseconds). | true |
| `header.auth_handle` | string | This is the superuser handle used to identify the API consumer making the call. | true |
| `header.user_handle` | string | This is the user handle attached to the KYC'd entity. | true |
| `header.reference` | string | This is an idempotency string used to identify the call you've made. | true |
| `header.version` | string | This tag specifies the version of the API you want to use. (As of writing, the only valid version string to use is `v1_1`.) | true |
| `header.crypto` | string | This tag specifies the blockchain network to use. (As of writing, the only valid crypto tag available is `ETH`.) | true |

## address

**Referenced in Message Types:**

- [entity_msg](#entity_msg)

**JSON Structure:**

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `address.address_alias` | string | This is a nickname that can be attached to the address object. While a required field, it can be left blank if desired. | true |
| `address.street_address_1` | string | This is line 1 of a street address. Post office boxes are not accepted in this field. | true |
| `address.street_address_2` | string | This is line 2 of a street address. This may include suite or apartment numbers. | false |
| `address.city` | string | Name of the city where the person being verified is a current resident. | true |
| `address.state` | string | Name of state where verified person is a current resident. (As of writing, this is a required field as the only accepted country is the US, but this may be expected to change in future versions.) | true |
| `address.country` | string | Two-letter country code. (As of writing, the only acceptable value is `US`.) | true |
| `address.postal_code` | string | In the US, this can be the 5-digit ZIP code or ZIP+4 code. | true |

## crypto_entry

**Referenced in Message Types:**

- [entity_msg](#entity_msg)

**JSON Structure:**

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `crypto_entry.crypto_alias` | string | A name to identify the address/code pairing. Can be left blank. | true |
| `crypto_entry.crypto_address` | string | Hex-encoded blockchain address. | true |
| `crypto_entry.crypto_code` | string | Code to identify network address is on. (As of writing, the only acceptable value is `ETH`.) | true |

## identity

**Referenced in Message Types:**

- [entity_msg](#entity_msg)

**JSON Structure:**

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `identity.alias` | string | This describes what kind of ID is being sent. (As of writing, the only accepted value is `SSN`.) | true |
| `identity.identity_value` | string | This is where the ID value would go. | true |

## contact

**Referenced in Message Types:**

- [entity_msg](#entity_msg)

**JSON Structure:**

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `contact.phone` | string | This is the verified person's phone number. Please specify area code at a minimum and country code if anywhere but US. | true |
| `contact.email` | string | This is the verified person's email address. | true |
| `contact.contact_alias` | string | Any name attached to the email/phone pair. If desired, leave empty, but don't leave out. | true |

## entity

**Referenced in Message Types:**

- [entity_msg](#entity_msg)

**JSON Structure:**

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `entity.birthdate` | string | Date of birth/inception. Must be formatted YYYY-MM-DD. | true |
| `entity.entity_name` | string | Full name of entity. This field is used because some names are "Last First" rather than the "First Last" format usually expected in the US. | true |
| `entity.first_name` | string | First name of entity. | true |
| `entity.last_name` | string | Last name of entity. | true |
| `entity.relationship` | string | This is the entity type. Specify `user` in this field to manage the entity as a user. | true |

# Transaction Error Codes

| Error Code | Meaning |
| ---------- | ------- |
|  |  |