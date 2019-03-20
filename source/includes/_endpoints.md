# Endpoints

## /check_handle

```plaintext
POST /0.2/check_handle HTTP/1.1
Host: sandbox.silamoney.com
authsignature: [GENERATED AUTHSIGNATURE HEX STRING HERE]
Content-Type: application/json

{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "0.2", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}

***

HTTP/1.1 200 OK

{
  "reference": "ref",
  "message": "user.silamoney.eth is available.",
  "status": "SUCCESS"
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

A "handle" works like a username in the Sila ecosystem. This endpoint ensures that a potential handle is available for use. If an entity has already been created with that handle, this endpoint will respond with a message that says that the handle is already in use and a `"status": "FAILURE"` in the JSON response body.

### Requests

In the `header.user_handle` field, put the handle for which you want to check availability. The entry for `header.auth_handle` should have your developer handle.

The request body format for this endpoint is the [header_msg](#header_msg) JSON object.

An `authsignature` header is required for this request. (Create this using the keypair associated with the `auth_handle`; see [authentication](#authentication) for help generating this signature.)

### Responses

The `status` attribute is a JSON key sent in the response body.

| Status Code | `status` Attribute | Description |
| :---------: | :----------------: | ----------- |
| 200 | `SUCCESS` | Handle sent in `header.user_handle` is available. |
| 200 | `FAILURE` | Handle sent in `header.user_handle` is taken. |
| 400 | `FAILURE` | Handle sent in `header.user_handle` is a reserved handle according to our JSON schema. (Or: request body otherwise does not conform to JSON schema.) |
| 401 | `FAILURE` | Auth signature is absent or derived address does not belong to auth_handle. |

## /register

```plaintext
POST /0.2/register HTTP/1.1
Host: sandbox.silamoney.com
authsignature: [GENERATED AUTHSIGNATURE HEX STRING HERE]
Content-Type: application/json

{
  "header": {
    "reference": "SOME ID",
    "created": 1234567890,
    "user_handle": "user.silamoney.eth",
    "auth_handle": "handle.silamoney.eth",
    "version": "0.2",
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
    "birthdate": "1900-01-31",
    "entity_name": "Example User",
    "first_name": "Example",
    "last_name": "User",
    "relationship": "user"
  }
}

***

HTTP/1.1 200 OK

{
  "reference":"SOME ID",
  "message":"user.silamoney.eth was successfully registered ",
  "status":"SUCCESS"
}
```

```javascript
// JavaScript register example coming soon
```

```python
# Python register example coming soon
```

```java
// Java register example coming soon
```

```go
// Go register example coming soon
```

*Attaches KYC data and specified blockchain address to an assigned handle.*

This is the endpoint you will use to create a new user and attach information that will be used to verify their identity. This does not start verification of the KYC data; it only adds the data to be verified. See [/request_kyc](#request_kyc) and [/check_kyc](#check_kyc) for verifying KYC status.

### Requests

At this endpoint, you will need to complete all fields with user information and include a valid Ethereum address (must not be already used in Sila system and not a smart contract). The private key associated with the `crypto_entry.crypto_address` will be used to generate usersignature headers on some subsequent calls.

This endpoint's request body is the [entity_msg](#entity_msg) JSON object.

An `authsignature` header is required for this request.

### Responses

| Status Code | `status` Attribute | Description |
| :---------: | :----------------: | ----------- | 
| 200 | `SUCCESS` | Handle successfully added to system with KYC data. |
| 400 | `FAILURE` | Invalid request body format, handle already in use, or blockchain address already in use. |
| 401 | `FAILURE` | `authsignature` header was absent or incorrect. |

## /request_kyc

```plaintext
POST /0.2/request_kyc HTTP/1.1
Host: sandbox.silamoney.com
authsignature: [GENERATED AUTHSIGNATURE HEX STRING HERE]
usersignature: [GENERATED USERSIGNATURE HEX STRING HERE]
Content-Type: application/json

{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "0.2", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}

***

HTTP/1.1 200 OK

{
  "reference":"ref",
  "message":"user.silamoney.eth submitted for KYC review",
  "status":"SUCCESS"
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

*Starts KYC verification process on a registered user handle.*

After having created a user at a handle with [/register](#register), you can start the KYC verification process on the user with this endpoint. The verification results for a handle are asynchronously returned at the [/check_kyc](#check_kyc) endpoint.

### Requests

The request body at this endpoint is the [header_msg](#header_msg) JSON object. 

`header.user_handle` should have the registered handle to be verified.

An `authsignature` header is required for this request.

### Responses

| Status Code | `status` Attribute | Description |
| :---------: | :----------------: | ----------- |
| 200 | `SUCCESS` | The verification process for the user registered under `header.user_handle` has been successfully started. |
| 400 | `FAILURE` | Invalid request body format. |
| 401 | `FAILURE` | `authsignature` or `usersignature` header was absent or incorrect. |

## /check_kyc

```plaintext
POST /0.2/check_kyc HTTP/1.1
Host: sandbox.silamoney.com
authsignature: [GENERATED AUTHSIGNATURE HEX STRING HERE]
usersignature: [GENERATED USERSIGNATURE HEX STRING HERE]
Content-Type: application/json

{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "0.2", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}

***

HTTP/1.1 200 OK

{
  "reference":"ref",
  "message":"KYC passed for user.silamoney.eth",
  "status":"SUCCESS"
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

This endpoint should be run after successfully completing [/register](#register) and [/request_kyc](#request_kyc) calls. 

Since ID verification is a relatively lengthy process (generally will take around 30 minutes to an hour to complete), /request_kyc will never confirm in its response that an entity was verified. Therefore, /check_kyc may be polled until a final confirmation is returned.

### Requests

The request body at this endpoint is the [header_msg](#header_msg) JSON object.

The handle for which KYC confirmation is being checked should be in the `header.user_handle` field.

Both `authsignature` and `usersignature` headers are required for this request. (The `usersignature` header should be generated with the keypair associated with the user; see [authentication](#authentication) section for more details.)

### Responses

| Status Code | `status` Attribute | Description |
| :---------: | :----------------: | ----------- |
| 200 | `SUCCESS` | The user handle has successfully passed KYC verification. |
| 200 | `FAILURE` | The user handle has not successfully passed KYC verification (may be pending, not have been registered, or have failed; `message` attribute will contain "pending" or "failed" substring).
| 400 | `FAILURE` | Invalid request body format. |
| 401 | `FAILURE` | `authsignature` or `usersignature` header was absent or incorrect. |

## /link_account

```plaintext
POST /0.2/link_account HTTP/1.1
Host: sandbox.silamoney.com
authsignature: [GENERATED AUTHSIGNATURE HEX STRING HERE]
usersignature: [GENERATED USERSIGNATURE HEX STRING HERE]
Content-Type: application/json

{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "0.2", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "link_account_msg",
  "public_token": "Plaid token from customer session",
  "account_name": "Custom Account Name",
  "selected_account_id": "optional_selected_account_id"
}

***

HTTP/1.1 200 OK

{
  "status": "SUCCESS"
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

*Uses a provided Plaid public token to link a bank account to a verified entity.*

This endpoint accepts results from customer interaction with a Plaid Link integration.

Your frontend Plaid integration will need to: 

- use a public key from Sila
- be set to the "production" environment
- use the "auth" product

Its onSuccess function will return a public token and metadata object. (For an example of how this looks, you can look at Plaid's [documentation](https://plaid.com/docs/#integrating-with-link) and review our demo app.)

### Requests

The request body at this endpoint is the [link_account_msg](#link_account_msg) JSON object.

The `public_token` key is a required field and must have the public token returned in the onSuccess function of Plaid Link. 

The `account_name` key is not required, but can be used to set a custom name to identify the linked checking account. If not provided, the linked account's name will be "default". We highly recommend specifying a custom name. *Note: user handles cannot have two linked accounts with the same name.*

The `selected_account_id` is not required; if provided, it should be an account ID in the array of selected accounts returned in the metadata object from Plaid Link. Currently, we do not link multiple accounts at once; you will need to send only one account ID. If no account ID is provided, we will link the first checking account we encounter from the array of accounts the customer has at their chosen bank.

Both `authsignature` and `usersignature` headers are required for this request.

### Responses

| Status Code | `status` Attribute | Description |
| :---------: | :----------------: | ----------- |
| 200 | `SUCCESS` | Bank account successfully linked. |
| 200 | `FAILURE` | Bank account not successfully linked (public token may have expired; tokens expire in 30 minutes after creation).
| 400 | `FAILURE` | Invalid request body format. |
| 401 | `FAILURE` | `authsignature` or `usersignature` header was absent or incorrect. |

## /get_accounts

```plaintext
POST /0.2/get_accounts HTTP/1.1
Host: sandbox.silamoney.com
authsignature: [GENERATED AUTHSIGNATURE HEX STRING HERE]
usersignature: [GENERATED USERSIGNATURE HEX STRING HERE]
Content-Type: application/json

{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "0.2",
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "get_accounts_msg"
}

***

HTTP/1.1 200 OK

{
  
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

*Gets basic bank account names linked to user handle.*

This will return a list of account names, along with basic account information, linked to the requested user handle. These are the accounts that were linked using the [/link_account](#link_account) endpoint.

### Requests

The request body at this endpoint is the [get_accounts_msg](#get_accounts_msg) JSON object.

Both `authsignature` and `usersignature` headers are required for this request.

### Responses

| Status Code | Description |
| :---------: | ----------- |
| 200 | Successfully fetched array of accounts. |
| 400 | Invalid request body format. |
| 401 | `authsignature` or `usersignature` header was absent or incorrect. |

## /issue_sila

```plaintext
POST /0.2/issue_sila HTTP/1.1
Host: sandbox.silamoney.com
authsignature: [GENERATED AUTHSIGNATURE HEX STRING HERE]
usersignature: [GENERATED USERSIGNATURE HEX STRING HERE]
Content-Type: application/json

{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "0.2", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "issue_msg",
  "amount": 1000,
  "account_name": "default"
}

***

HTTP/1.1 200 OK

{
  
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

*Debits a specified account and issues tokens to the address belonging to the requested handle.*

The /issue_sila endpoint starts the debit of a user's linked bank account; once that transaction has officially settled, a process that takes about two business days to complete, the handle's blockchain address will be issued SILA tokens.

SILA tokens are pegged to the value of $0.01 USD. To request the debit of $795.43, for instance, you would request `"amount": 79543`.

Keep in mind that, especially because ACH (automated clearing house) transactions take such a long time to clear, results must be returned asynchronously. You can check the results of a transaction using the [/get_transactions](#get_transactions) endpoint.

**Important Note**: No transaction fees are charged in this beta version of the API. Expect this to change in upcoming future versions.

### Requests

The request body at this endpoint is the [issue_msg](#issue_msg) JSON object.

The `amount` field is the amount of SILA tokens to issue, which is equivalent to a dollar amount x 100, or a number of cents. For example, to debit $1 from a user's account, you would request an amount of 100.

The `account_name` field is the name of the handle's linked account from which to debit the equivalent dollar amount.

Both `authsignature` and `usersignature` headers are required for this request.

### Responses

| Status Code | `status` Attribute | Description |
| :---------: | :----------------: | ----------- |
| 200 | `SUCCESS` | Issuance process started. |
| 200 | `FAILURE` | Issuance process not started; see `message` attribute. |
| 400 | `FAILURE` | Invalid request body format. |
| 401 | `FAILURE` | `authsignature` or `usersignature` header was absent or incorrect. |

## /transfer_sila

```plaintext
POST /0.2/transfer_sila HTTP/1.1
Host: sandbox.silamoney.com
authsignature: [GENERATED AUTHSIGNATURE HEX STRING HERE]
usersignature: [GENERATED USERSIGNATURE HEX STRING HERE]
Content-Type: application/json

{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "0.2", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "transfer_msg",
  "amount": 13,
  "destination": "user2.silamoney.eth"
}

***

HTTP/1.1 200 OK

{
  
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

*Starts a transfer of the requested amount of SILA to the requested destination handle.*

This request triggers a transfer of SILA tokens over the blockchain, going from the current authenticated user to the specified destination handle.

In theory, SILA tokens can be transferred from any blockchain address to any blockchain address. This endpoint assumes that the recipient has been registered with Sila and has a handle. During Sila's beta phase, token transfers are restricted to whitelisted addresses (addresses which belong to KYC-verified users). After full launch, tokens will be transferable to any address.

Since the Ethereum platform is currently the only platform we support (though we plan to support others), this will create one blockchain transaction. When other platforms are added, transfers from one platform to another will result in burning of tokens from an address on one platform to minting of tokens to an address on a different platform (two different blockchain transactions).

**Important Note**: No transaction fees are charged in this beta version of the API. Expect this to change in upcoming future versions.

### Requests

The request body at this endpoint is the [transfer_msg](#transfer_msg) JSON object.

Both `authsignature` and `usersignature` headers are required for this request.

### Responses

| Status Code | `status` Attribute | Description |
| :---------: | :----------------: | ----------- |
| 200 | `SUCCESS` | Transfer process started. |
| 200 | `FAILURE` | Transfer process not started; see `message` attribute. |
| 400 | `FAILURE` | Invalid request body format. |
| 401 | `FAILURE` | `authsignature` or `usersignature` header was absent or incorrect. |

## /redeem_sila

```plaintext
POST /0.2/redeem_sila HTTP/1.1
Host: sandbox.silamoney.com
authsignature: [GENERATED AUTHSIGNATURE HEX STRING HERE]
usersignature: [GENERATED USERSIGNATURE HEX STRING HERE]
Content-Type: application/json

{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "0.2", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "redeem_msg",
  "amount": 1000,
  "account_name": "default"
}

***

HTTP/1.1 200 OK

{
  
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

*Burns given amount of SILA at the handle's blockchain address and credits their named bank account in the equivalent monetary amount.*

This is the reverse process of /issue_sila; tokens are removed from the handle's associated address, then the process of crediting the named bank account is started. 

If the bank account cannot be credited (for instance, if the account has been closed), this operation will roll back and re-mint the tokens at the handle's address.

**Important Note**: No transaction fees are charged in this beta version of the API. Expect this to change in upcoming future versions.

### Requests

The request body at this endpoint is the [redeem_msg](#redeem_msg) JSON object.

Both `authsignature` and `usersignature` headers are required for this request.

### Responses

| Status Code | `status` Attribute | Description |
| :---------: | :----------------: | ----------- |
| 200 | `SUCCESS` | Redemption process started. |
| 200 | `FAILURE` | Redemption process not started; see `message` attribute. |
| 400 | `FAILURE` | Invalid request body format. |
| 401 | `FAILURE` | `authsignature` or `usersignature` header was absent or incorrect. |

## /get_transactions

```plaintext
POST /0.2/get_transactions HTTP/1.1
Host: sandbox.silamoney.com
authsignature: [GENERATED AUTHSIGNATURE HEX STRING HERE]
usersignature: [GENERATED USERSIGNATURE HEX STRING HERE]
Content-Type: application/json

{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "0.2", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "get_transactions_msg",
  "search_filters": {
    "transaction_id": "some UUID string assigned by Sila",
    "reference_id": "the reference string sent in the header object when transaction request was made",
    "show_timelines": false,
    "sort_ascending": false,
    "max_sila_amount": 1300,
    "min_sila_amount": 1000,
    "statuses": ["pending", "successful", "failed", "complete"],
    "start_epoch": 1234567860,
    "end_epoch": 1234567891,
    "page": 1,
    "per_page": 20,
    "transaction_types": ["issue", "redeem", "transfer"]
  }
}

***

HTTP/1.1 200 OK

{
  
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

*Gets array of user handle's transactions with detailed status information.*

### Requests

The request body at this endpoint is the [get_transactions_msg](#get_transactions_msg) JSON object.

The `search_filters` object and all of its nested keys are optional. They can be used to filter the transactions that are returned.

Results are paginated; by default, the first 20 results are returned in descending order of date transaction was started. You can request up to 100 results per page (`"per_page": 100`) and sort them in ascending order of date transaction was started (`"sort_ascending": true`) if desired.

Both `authsignature` and `usersignature` headers are required for this request.

### Responses

| Status Code | Description |
| :---------: | ----------- |
| 200 | Able to return transaction information. |

## Contract Endpoint: /silaBalance

```plaintext
POST /silaBalance HTTP/1.1
Host: test.silatokenapi.silamoney.com
Content-Type: application/json

{
  "address": "0xabc123abc123abc123"
}

***

HTTP/1.1 200 OK

1000
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

*Gets Sila balance for a given blockchain address.*

This endpoint uses a different host and connects directly to the blockchain to query for an address's SILA balance.

### Requests

The request body is in JSON and has a single key, `address`. It accepts a string value and expects a correctly-formatted blockchain address.

No signatures are required in the headers of this request.

### Responses

Success responses at this endpoint are returned in plain text rather than JSON and are always numeric. `0` indicates the address holds no SILA tokens. `1000` would indicate the address holds 1000 SILA tokens, the equivalent of $10.00 USD.

| Status Code | Response | Description |
| :---------: | -------- | ----------- |
| 200 | (A plaintext numeric value) | Successful request. |
| 500 | `{"message": "Internal Server Error"}` | The provided address value is not an address. |

## Contract Endpoint: /isBetalisted

```plaintext
POST /isBetalisted HTTP/1.1
Host: test.silatokenapi.silamoney.com
Content-Type: application/json

{
  "address": "0xabc123abc123abc123"
}

***

HTTP/1.1 200 OK

true
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

*Checks that a given blockchain address is added to our temporary whitelist ("betalist").*

This endpoint uses a different host and connects directly to the blockchain to query for a matching address in the contract's betalist.

### Requests

The request body is in JSON and has a single key, `address`. It accepts a string value and expects a correctly-formatted blockchain address.

No signatures are required in the headers of this request.

### Responses

Success responses at this endpoint come back in raw text rather than JSON: `true` or `false`.

| Status Code | Response | Description |
| :---------: | -------- | ----------- |
| 200 | `true` | The provided address is betalisted. |
| 200 | `false` | The provided address is not betalisted. |
| 500 | `{"message": "Internal Server Error"}` | The provided address value is not an address. |
