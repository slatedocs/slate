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
    "version": "v1_1", 
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
| ----------- | ----------- |
| 200 | Handle successfully added to system with KYC data. |

## /request_kyc

```http
POST /0.2/request_kyc HTTP/1.1
Host: sandbox.silamoney.com
authsignature: [GENERATED AUTHSIGNATURE HEX STRING HERE]
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

After having created a user at a handle with [/register](#register), you can start the KYC verification process on the user with this endpoint. The results are asynchronously returned at the [/check_kyc](#check_kyc) endpoint.

### Requests

The request body at this endpoint is the [header_msg](#header_msg) JSON object. 

### Responses

| Status Code | Response Body | Description |
| :---------: | ------------- | ----------- |
| 200 | | |


## /check_kyc

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
    "version": "v1_1", 
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

This endpoint should be run after successfully completing a /register call. Since ID verification is a relatively lengthy process (generally will take around 30 minutes to an hour to complete), /register will never confirm in the response that an entity was verified. Therefore, /check_kyc may be polled until a final confirmation is returned.

The request body at this endpoint is the [header_msg](#header_msg) JSON object. 

### Responses

| Status Code | Response Body | Description |
| ----------- | ------------- | ----------- |
| 200 | | |

## /link_account

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
    "version": "v1_1", 
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

*Uses a provided Plaid public token to link a bank account to a verified entity.*

(Detailed description)

The request body at this endpoint is the [link_account_msg](#) JSON object.

### Responses

| Status Code | Response Body | Description |
| ----------- | ------------- | ----------- |
| 200 | | |

## /get_accounts

```http
POST /0.2/get_accounts HTTP/1.1
Host: sandbox.silamoney.com
authsignature: [GENERATED AUTHSIGNATURE HEX STRING HERE]
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

(Detailed description)

The request body at this endpoint is the [get_accounts_msg](#) JSON object.

### Responses

| Status Code | Response Body | Description |
| ----------- | ------------- | ----------- |
| 200 | | |


## /issue_sila

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
    "version": "v1_1", 
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

The request body at this endpoint is the [issue_msg](#) JSON object.

### Responses

| Status Code | Response Body | Description |
| ----------- | ------------- | ----------- |
| 200 | | |

## /transfer_sila

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
    "version": "v1_1", 
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

The request body at this endpoint is the [transfer_msg](#) JSON object.

### Responses

| Status Code | Response Body | Description |
| ----------- | ------------- | ----------- |
| 200 | | |

## /redeem_sila

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
    "version": "v1_1", 
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
