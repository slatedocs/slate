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

## /register

```
POST /0.1/register HTTP/1.1
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

This endpoint should be run after successfully completing a /register call. Since ID verification is a relatively lengthy process (generally will take around 30 minutes to an hour to complete), /register will never confirm in the response that an entity was verified. Therefore, /check_kyc may be polled until a final confirmation is returned.

The request body at this endpoint is the [header_msg](#header_msg) JSON object. 

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

*Uses a provided Plaid public token to link a bank account to a verified entity.*

(Detailed description)

The request body at this endpoint is the [link_account_msg](#) JSON object.

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

The request body at this endpoint is the [issue_msg](#) JSON object.

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

The request body at this endpoint is the [transfer_msg](#) JSON object.

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

The request body at this endpoint is the [redeem_msg](#) JSON object.

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

The request body at this endpoint is the [get_transactions_msg](#) JSON object.

### Responses

| Status Code | Response Body | Description |
| ----------- | ------------- | ----------- |
| 200 | | |
