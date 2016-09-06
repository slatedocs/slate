---
title: Doordeck API Reference

language_tabs:
  - shell

toc_footers:
  - <a href='mailto:info@doordeck.com'>Contact Doordeck</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the Doordeck API! You can use our API to access Doordeck API endpoints, which can get information on the state of locks, manage access and perform operations.

This API documentation is generated using [Slate](https://github.com/tripit/slate), if you spot any errors please submit a pull request directly on [Github](https://github.com/doordeck/docs/).

# Authentication

> To authorize, use this code:

```shell
curl 'https://api.doordeck.com/auth/token/'
  -X POST
  -H 'content-type: application/json'
  --data-binary '{"email":"EMAIL","password":"PASSWORD"}'
```

> Make sure to replace `USERNAME` and `PASSWORD` with your credentials.

> The above command returns JSON structured like this:

```json
{
  "privateKey":"base 64 encoded private key",
  "publicKey":"base 64 encoded public key",
  "authToken":"JSON Web Token for authentication",
  "refreshToken":"JSON Web Token for refreshing authentication credentials"
}
```

Doordeck uses tokens to permit access to the API. Doordeck expects for the token to be included in all API requests to the server in a header that looks like the following:

`Authorization: Bearer TOKEN`

<aside class="notice">
You must replace <code>TOKEN</code> with your authentication token (the <code>authToken</code> from the login response).
</aside>

Authentication tokens are JSON web tokens, they can be examined to determine their expiry date, the user's ID. JSON web tokens are split into three sections seperated by a `.`, the header, payload and signature - each section can be base64 decoded to read further.

```shell
echo 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE0NzMxNjMwNzUsImlhdCI6MTQ3MzA3NjY3NSwic3ViIjoiNWE1ZjZlODAtM2M1MS0xMWU2LTllNTctY2Y0MGJlMzAxM2ZiIiwic2Vzc2lvbiI6ImZiMmEwMDYwLTczNWYtMTFlNi1iNDg3LTZmMTZmZGE1MzkxNyIsInJlZnJlc2giOmZhbHNlLCJlbWFpbCI6Im1pY2hhZWxAZG9vcmRlY2suY29tIn0.REDCATED' | cut -d. -f2 | base64 -D
```

> The above command returns JSON structured like this:

```json
{
  "exp":1473163075,
  "iat":1473076675,
  "sub":"5a5f6e80-3c51-11e6-9e57-cf40be3013fb",
  "session":"fb2a0060-735f-11e6-b487-6f16fda53917",
  "refresh":false,
  "email":"michael@doordeck.com"
}
```

# Account

## Login

```shell
curl 'https://api.doordeck.com/auth/token/'
  -X POST
  -H 'content-type: application/json'
  --data-binary '{"email":"EMAIL","password":"PASSWORD"}'
```

> Make sure to replace `USERNAME` and `PASSWORD` with your credentials.

> The above command returns JSON structured like this:

```json
{
  "privateKey":"base 64 encoded private key",
  "publicKey":"base 64 encoded public key",
  "authToken":"JSON Web Token for authentication",
  "refreshToken":"JSON Web Token for refreshing authentication credentials"
}
```

This endpoint lets user's attempt to login.

### HTTP Requst

`POST https://api.doordeck.com/auth/token`

### Request Parameters

Parameter | Required | Description
--------- | ------- | -----------
email | true | User's email address
password | true | User's password

### Response

Parameter | Description
--------- | -----------
privateKey | PKCS8 encoded private key wrapped in base 64 encoding to be JSON friendly
publicKey | Base 64 encoded public key
authToken | JSON web token to be used for normal requests
refreshToken | JSON web token to be used for getting new authentication tokens

## Registration

```shell
curl "https://api.doordeck.com/auth/register"
  -X POST
  -H 'content-type: application/json'
  --data-binary '{"email":"EMAIL","password":"PASSWORD"}'
```

> The above command returns JSON structured like this:

```json
{
  "privateKey":"base 64 encoded private key",
  "publicKey":"base 64 encoded public key",
  "authToken":"JSON Web Token for authentication",
  "refreshToken":"JSON Web Token for refreshing authentication credentials"
}
```

This endpoint allows users to register for a Doordeck account.

### HTTP Request

`POST https://api.doordeck.com/auth/register`

### Request Parameters

Parameter | Required | Description
--------- | ------- | -----------
email | true | Email address to register.
password | true | Password for access to account.

<aside class="success">
A validation email will be disptahced to the user's email address upon successful registration.
</aside>

## Refresh Token

```shell
curl "https://api.doordeck.com/token/refresh"
  -H "Authorization: Bearer REFRESH_TOKEN"
```

> The above command returns JSON structured like this:

```json
  {
    "authToken":"JSON Web Token for authentication",
    "refreshToken":"(Optional) JSON Web Token for refreshing authentication credentials"
  }
```

This endpoint refreshes a users' authentication token using their refresh token. Refresh tokens cannot be used for standard requests and have a very long life compared with an authentication token.

### HTTP Request

`GET https://api.doordeck.com/token/refresh`

<aside class="notice">
A refresh token should be used in place of an authentication token for this request.
</aside>

<aside class="notice">
The <code>refreshToken</code> field is optionally returned, if a new refresh token should be stored, otherwise it will not be present.
</aside>

## Logout

```shell
curl "https://api.doordeck.com/token/destroy"
  -H "Authorization: Bearer REFRESH_TOKEN"
```

This endpoint destroys a session associated with an authentication token and any associated refresh token.

### HTTP Request
`POST https://api.doordeck.com/token/destroy`

## Verify Email

```
curl "https://api.doordeck.com/account/email/verify?code=CODE"
  -X PUT
```

> Replace `CODE` with the verification code from the email.

This endpoint is used to verify a user's email address.

### HTTP Request
`PUT https://api.doordeck.com/account/email/verify`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
code | true | Verification code from email.


# Lock Operations

## Get all locks

```shell
curl 'https://api.doordeck.com/device'
  -H "Authorization: Bearer TOKEN"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id":"00000000-0000-0000-0000-000000000000",
    "name":"Home",
    "state":
      {
        "locked":true,
        "connected":true,
        "duration":5.000000000
      },
    "unlockTime":5.000000000,"unlockForever":false
  },
  {
    "id":"00000000-0000-0000-0000-000000000001",
    "name":"Office",
    "state":
      {
        "locked":true,
        "connected":false,
        "duration":10.000000000
      },
    "unlockTime":10.000000000,"unlockForever":false
  }
]
```

This endpoint retrieves all locks a user has access to.

### HTTP Request

`GET https://api.doordeck.com/device`

## Get a single lock

```shell
curl 'https://api.doordeck.com/device/00000000-0000-0000-0000-000000000000'
  -H "Authorization: Bearer TOKEN"
```

> Replace `00000000-0000-0000-0000-000000000000` with the lock's ID.

> The above command returns JSON structured like this:

```json
{
  "id":"00000000-0000-0000-0000-000000000000",
  "name":"Home",
  "state":
    {
      "locked":true,
      "connected":true,
      "duration":5.000000000
    },
  "unlockTime":5.000000000,"unlockForever":false
}
```

This endpoint retrieves information about a specific lock, its usage is prefered over the list lock call for performance reasons.

### HTTP Request

`GET https://api.doordeck.com/device/LOCK_ID`

Replace `LOCK_ID` with the appropiate lock ID.

## Get lock audit trail

```shell
curl 'https://api.doordeck.com/device/00000000-0000-0000-0000-000000000000/log'
  -H "Authorization: Bearer TOKEN"
```
> Replace `00000000-0000-0000-0000-000000000000` with the lock's ID.

> The above command returns JSON structured like this:

```json
[
  {
    "timestamp":1473061669.000000000,
    "type":"DOOR_LOCK",
    "user":null,
    "message":"Door locked"
  },
  {
    "timestamp":1473061664.000000000,
    "type":"DOOR_UNLOCK",
    "user":null,
    "message":"Door unlocked"
  }
]
```

This endpoint retrievs all log events associated with a particular lock.

### HTTP Request

`GET https://api.doordeck.com/device/LOCK_ID/log`

Replace `LOCK_ID` with the appropiate lock ID.

### Event Types
The call returns an enum of event types:

Type | Description
--------- | -----------
DOOR_OPEN | The lock's monitor shows the door is open
DOOR_CLOSE | The lock's monitor shows the door is closed
DOOR_UNLOCK | The lock has changed to the unlock stated
DOOR_LOCK | The lock has changed to the locked state
OWNER_ASSIGNED | The lock's owner has been updated
DEVICE_CONNECTED | Lock has connected to Doordeck platform
DEVICE_DISCONNECTED | Lock has disconected from Doordeck platform

## Update Lock Properties

```shell
curl 'https://api.doordeck.com/device/00000000-0000-0000-0000-000000000000'
  -X PUT
  -H "Authorization: Bearer TOKEN"
  -H 'content-type: application/json'
  --data-binary '{"name":"Home","unlockTime":5}'
```

> Replace `00000000-0000-0000-0000-000000000000` with the lock's ID.

This endpoint allows the name and unlock duration to be updated for an existing lock.

### HTTP Request

`PUT https://api.doordeck.com/device/LOCK_ID`

Replace `LOCK_ID` with the appropiate lock ID.

### Request Parameters

Parameter | Required | Description
--------- | ------- | -----------
name | true | New name of the lock (visible to all users)
unlockTime | true | Value in seconds of how long the lock should remain open, setting this to `0` means the lock must be manually locked every use

## Pair with new lock

```shell
curl 'https://api.doordeck.com/device'
  -X POST
  -H 'Authorization: Bearer TOKEN'
  -H 'content-type: application/json'
  --data-binary '{"key":"KEY","name":"My lock","unlockTime":20}'
```

> Replace `KEY` with the lock's registration key

This endpoint pairs a new, previously unowned lock with a user.

### HTTP Request

`POST https://api.doordeck.com/device`

<aside class="success">
Upon successful registration of a lock, a HTTP 202 is returned along with the location further details can be found about the lock. The lock ID can be extracted from this URL
</aside>

### Request Parameters

Parameter | Required | Description
--------- | ------- | -----------
key  | true | Lock's registration key
name | true | Alias of the lock (visible to all users)
unlockTime | true | Value in seconds of how long the lock should remain open, setting this to `0` means the lock must be manually locked every use

## Lock or unlock

```shell
curl 'https://api.doordeck.com/auth/token/' \
  -X POST \
  -H 'content-type: application/json' \
  --data-binary '{"email":"USERNAME","password":"PASSWORD"}' \
  | jq -r .privateKey \
  | base64 -D \
  | openssl pkcs8 -nocrypt -inform DER -outform PEM -out privatekey.pem

HEADER='{"alg":"RS256","typ":"JWT"}'
BODY='{"iss":"USER_ID","sub":"00000000-0000-0000-0000-000000000000","nbf":1473083829,"iat":1473083829,"exp":1473083889,"operation":{"type":"MUTATE_LOCK","locked":false,"duration":5}}'
HASH=`echo $HEADER.$BODY | openssl dgst -sha256`
SIGNATURE=`echo $HASH | openssl rsautl -sign -inkey privatekey.pem -keyform PEM`
JWT=`echo -n $HEADER | base64`.`echo -n $BODY | base64`.`echo -n $SIGNATURE | base64`

curl 'https://api.doordeck.com/device/00000000-0000-0000-0000-000000000000/execute'
  -X POST
  -H 'authorization: Bearer TOKEN'
  -H 'content-type: application/json;charset=UTF-8'
  --data-binary "$JWT"
```

> Replace `00000000-0000-0000-0000-000000000000` with the lock's ID, `USERNAME` and `PASSWORD` with the appropiate credentials.

This endpoint allows operations to be performed on a lock, typically this is lock and unlock. Requests to this endpoint must be signed and formed as a JSON web token.

### Request Parameters

The header is formed of the following fields.

Parameter | Required | Description
--------- | ------- | -----------
alg | true | `RS256`, RSA signed with a 256 bit SHA hash
typ | true | `JWT`, JSON web token

The body is formed of the following fields.

Parameter | Required | Description
--------- | ------- | -----------
iss | true | Issuer, this should be the user's ID
sub | true | Subject, this should be the lock's ID
nbf | true | Not before, a Unix timestamp indicating the earliest date the request is valid from
iat | true | Issued at, the current Unix timestamp
exp | true | Expires, a Unix timestamp indicating when the request should expire, most requests should only be valid for a few seconds, a minute at most
operation | true | A JSON object containing the instructions of the lock

The operation object definition is as follows

Parameter | Required | Description
--------- | ------- | -----------
type | true | Can be `MUTATE_LOCK`, `ADD_USER`, `REMOVE_USER`
locked | true (if type is `MUTATE_LOCK`) | Boolean indicating if the lock should be locked or unlocked
duration | false (only if type is `MUTATE_LOCK` and `locked` is true) | Number of seconds the lock should be unlocked for
user | true (if type is `ADD_USER`) | ID of user to add
publicKey | true (if type is `ADD_USER`) | Public key of user to add
users | true (if type is `REMOVE_USER`) | List of user IDs to remove
