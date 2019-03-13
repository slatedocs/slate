# Endpoints

## /check_handle

```http
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

### Responses

The `status` attribute is a JSON key sent in the response body.

| Status Code | `status` Attribute | Description |
| :---------: | :------------------: | ----------- |
| 200 | `"SUCCESS"` | Handle sent in `header.user_handle` is available. |
| 200 | `"FAILURE"` | Handle sent in `header.user_handle` is taken. |
| 400 | `"FAILURE"` | Handle sent in `header.user_handle` is a reserved handle according to our JSON schema. |

## /register

```http
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
    "birthdate": "1900-01-01",
    "entity_name": "Example User",
    "first_name": "Example",
    "last_name": "User",
    "relationship": "user"
  }
}

HTTP/1.1 200 OK

{

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

### Responses

| Status Code | Description |
| :---------: | ----------- |
| 200 | Handle successfully added to system with KYC data. |

## /request_kyc

```http
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

HTTP/1.1 200 OK

{
  
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

### Responses

| Status Code | Description |
| :---------: | ------------- |
| 200 | The verification process for the user registered under `header.user_handle` has been successfully started. |

## /check_kyc

```http
POST /0.2/check_handle HTTP/1.1
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

*Returns whether entity attached to user handle is verified, not valid, or still pending.*

This endpoint should be run after successfully completing [/register](#register) and [/request_kyc](#request_kyc) calls. 

Since ID verification is a relatively lengthy process (generally will take around 30 minutes to an hour to complete), /request_kyc will never confirm in its response that an entity was verified. Therefore, /check_kyc may be polled until a final confirmation is returned.

### Requests

The request body at this endpoint is the [header_msg](#header_msg) JSON object.

The handle for which KYC confirmation is being checked should be in the `header.user_handle` field.

### Responses

| Status Code | Description |
| :---------: | ------------- |
| 200 | Request was successful. |

## /link_account

```http
POST /0.2/check_handle HTTP/1.1
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

*Uses a provided Plaid public token to link a bank account to a verified entity.*

This endpoint accepts results from customer interaction with a [Plaid Link](https://plaid.com/docs/#integrating-with-link) integration.

Your frontend Plaid integration will need to use a public key from Sila, be set to the "production" environment, and use the "auth" product. Its onSuccess function will return a public token and metadata object. (For an example of how this looks, you can look at Plaid's documentation and review our demo app.)

### Requests

The request body at this endpoint is the [link_account_msg](#) JSON object.

The `public_token` key is a required field and must have the public token returned in the onSuccess function of Plaid Link. 

The `account_name` key is not required, but can be used to set a custom name to identify the linked checking account. If not provided, the linked account's name will be "default". We highly recommend specifying a custom name. *Note: user handles cannot have two linked accounts with the same name.*

The `selected_account_id` is not required; if provided, it should be an account ID in the array of selected accounts returned in the metadata object from Plaid Link. Currently, we do not link multiple accounts at once; you will need to send only one account ID. If no account ID is provided, we will link the first checking account we encounter from the array of accounts the customer has at their chosen bank.

### Responses

| Status Code | Description |
| :---------: | ----------- |
| 200 | Account successfully linked. |

## /get_accounts

```http
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

The request body at this endpoint is the [get_accounts_msg](#) JSON object.

### Responses

| Status Code | Description |
| :---------: | ----------- |
| 200 | Successful call. |

## /issue_sila

```http
POST /0.2/check_handle HTTP/1.1
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

*Debits a specified account and issues tokens to the address belonging to the requested handle*

The /issue_sila endpoint starts the debit of a user's linked bank account; once that monetary transaction has officially settled, a process that takes about two business days to complete, the handle's blockchain address will be issued SILA tokens.

**Important note**: SILA tokens are pegged to the value of $0.01 USD. To request the debit of $795.43, for instance, you would request `"amount": 79543`.

Issuance and redemption requests also have a minimum amount of 1000 SILA ($10.00 USD). (Transfer requests have no minimum amount.)

Keep in mind that, because ACH (automated clearing house) transactions take such a long time to clear, results must be returned asynchronously. You can check the results of a transaction using the [/get_transactions](#get_transactions) endpoint.

### Requests

The request body at this endpoint is the [issue_msg](#) JSON object.

The `amount` field is the amount of SILA tokens to issue, which is equivalent to a dollar amount x 100, or a number of cents. For example, to debit $1 from a user's account, you would request an amount of 100.

The `account_name` field is the name of the handle's linked account from which to debit the equivalent dollar amount.

### Responses

| Status Code | Description |
| :---------: | ----------- |
| 200 | Debit/issuance process started. |

## /transfer_sila

```http
POST /0.2/check_handle HTTP/1.1
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
  "amount": 127,
  "destination": "user2.silamoney.eth"
}

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

*Overview*

Detailed description

### Requests

The request body at this endpoint is the [transfer_msg](#) JSON object.

### Responses

| Status Code | Description |
| :---------: | ----------- |
| 200 | |

## /redeem_sila

```http
POST /0.2/check_handle HTTP/1.1
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

*Overview*

Detailed description

The request body at this endpoint is the [redeem_msg](#) JSON object.

### Responses

| Status Code | Response Body | Description |
| ----------- | ------------- | ----------- |
| 200 | | |

## /get_transactions

```http
POST /0.2/check_handle HTTP/1.1
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

*Overview*

Detailed description

The request body at this endpoint is the [get_transactions_msg](#) JSON object.

### Responses

| Status Code | Response Body | Description |
| ----------- | ------------- | ----------- |
| 200 | | |
