---
title: API Reference

language_tabs:
  - shell: cURL
  - java: Android
  - objective_c: iOS

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

This is an overview of using Lucova SDK & API for integration with Lucova Systems in order to build your own Mobile Commerce Experience. 

We categorize Mobile Commerce Experiences as the solutions you will be providing to consumers for their interaction with physical good and services using your Mobile App.

This would include Payments, Pre-Purchase, Redemptions & Messaging. The documentation here provides details on how to use the following Lucova assets:

* Lucova objective_c and java SDK that handle the interactions with Lucova Terminals installed at merchant locations.
* Lucova Web API for your App's backend server to interact with Lucova Backend Systems.

As you start developing your Mobile App and integrate with Lucova, please ensure you understand how Lucova Mobile Commerce platform works by reviewing the Core Concepts. We have also listed a set of Guiding Principles which will guide you throughout the development and integration process.

# User Management

## User Registration

```java
```

```objective_c
```

```shell
curl -XPOST "https://api.lucova.com/app/register" \
  -d "password=user_password" \
  -d "email=user_email" \
  -u "app_id:app_secret_key"
```

> The above command returns JSON structured like this:

```json
{
    "success": true,
    "_id": "53d003fe81239d70dc000002",
    "auth_token": "9ec3857c8ea411746a78a59bf5630b67",
    "secret_key": "7jsz4L0/0HlB+YgzZt8YY+z5M6FucFeskcYyuddQ6lI=",
    "user_name": "e5bf612c3ea401f9f2900657f1fad640",
    "photo_url": "/images/53/53d003fe81239d70dc000002",
    "jabber_id": "e5bf612c3ea401f9f2900657f1fad640@jabber.lucova.com",
    "jabber_password": "211b1bbdc3a2505fcba49e9066fd1d16"
}
```

Most user specific calls are called with the user's credentials. However, creating a user is called with your app-specific credentials. A random Lucova `user_name` is generated for your user, which should be associated with your app's user account.

### HTTP Request
`POST https://api.lucova.com/app/register`

### Required parameters:

* password
* email

### Optional parameters:

* age
* phone
* dob

<aside class="warning">Do not make registration requests from the client-side app. Registrations with the Lucova backend should be done strictly from your app's own backend. This will protect your app specific `secret_key`.</aside>


## Updating User

> To update user-specific information:

```java
```

```objective_c
```

```shell
curl -XPOST "https://api.lucova.com/user/update"
  -d "new_pin=9876"
  -d "present_pin=9876"
  -d "password=s3cr3t"
  -u "user_name:auth_token"
```

> The above command returns JSON structured like this:

```json
{
    "success": true,
    "auth_token": "608caa37cec9ee4772edec2d22ff58cd",
    "photo_url": "/images/53/5314afb1c90b51338d000001",
    "photo_timestamp": 1406066911,
    "num_credit_cards": 1,
    "full_name": "Vinh Nguyen",
    "pin": "8299"
}
```

When registering a user, an `auth_token` is automatically generated, and your backend should pass this `auth_token` to your app, so the app can make requests directly to the Lucova backend. We recommend you periodically generate a new `auth_token`. This can be done by creating a login request.

### HTTP Request
`POST https://api.lucova.com/user/update`

### Required parameters:

None

### Optional parameters:

* `new_pin`
* `present_pin`
* `password`


<aside class="info">If a attempting to change PIN, and an old PIN is present, the old PIN must be provided as well.</aside>






## Authentication

> To generate a new auth token, use the following:

```java
```

```objective_c
```

```shell
curl "https://api.lucova.com/user/login"
  -u "user_name:user_password"
```

> The above command returns JSON structured like this:

```json
{
    "success": true,
    "auth_token": "608caa37cec9ee4772edec2d22ff58cd",
    "photo_url": "/images/53/5314afb1c90b51338d000001",
    "photo_timestamp": 1406066911,
    "num_credit_cards": 1,
    "full_name": "Vinh Nguyen",
    "pin": "8299"
}
```

When registering a user, an `auth_token` is automatically generated, and your backend should pass this `auth_token` to your app, so the app can make requests directly to the Lucova backend. We recommend you periodically generate a new `auth_token`. This can be done by creating a login request.

### HTTP Request:
`GET https://api.lucova.com/user/login`

### Required parameters:

None

### Optional parameters:

None






<!--
The majority of requests to the Lucova backend require the use of a `auth_token`. From the app developer perspective, the API end-points are broken into two categories:

1. User specific end-points
2. App specific end-points (App-specific administrative routes)

User specific end-points are authenticated against the user's credentials, while App specific end-points are authenticated against the credentials provided when you register with a developer account.

To retrieve an `auth_token`, the user must supply their user_name and password to `/user/login`. A randomly generated `auth_token` is then generated and returned in json format. The user must supply this `auth_token` for all user-specific end-points.
-->

## Reset User PIN

> To reset a user's PIN:

```java
```

```objective_c
```

```shell
curl "https://api.lucova.com/user/reset-pin"
  -d "password=user_password"
  -u "user_name:auth_token"
```

> The above command returns JSON structured like this:

```json
{
    "success": true
}
```

If a user forgets their PIN, they may request a PIN reset by providing their password. 

### HTTP Request
`POST https://api.lucova.com/user/reset-pin`

### Required parameters:

* `password`

### Optional parameters:

None

## Send email receipt

> To reset an email receipt:

```java
```

```objective_c
```

```shell
curl "https://api.lucova.com/user/transaction-email" \
  -d "transaction_id=transaction_id" \
  -u "user_name:auth_token"
```

> The above command returns JSON structured like this:

```json
{
    "success": true
}
```

An email receipt for each transaction is automatically sent out. However this end-point may be used if you wish to allow the user to re-send an email manually.


### HTTP Request
`POST https://api.lucova.com/user/transaction-email`

### Required parameters:

* `transaction_id`

### Optional parameters:

None

# Credit Cards

## Add Credit Card

> To add a Credit Card:

```java
```

```objective_c
```

```shell
curl -XPOST "https://api.lucova.com/user/add-credit-card" \
  -d "card_number=4242424242424242" \
  -d "exp_month=12" \
  -d "exp_year=14" \
  -d "owner_name=Joe Smith" \
  -d "postal_code=cvv" \
  -u "user_name:auth_token"
```

> The above command returns JSON structured like this:

```json
{
    "success":true,
    "new_card": {
        "id":"card_4SMFzk2P7zcNy9",
        "type":"Visa",
        "masked_number":"4242***4242",
        "name":"martin"
    },
    "cards":[
        {
            "id":"card_4R05XRBi0q2UQW",
            "masked_num":"4242***4242"
        },
        {
            "id":"card_4SMFzk2P7zcNy9",
            "masked_num":"4242***4242"
        }
    ],
    "default_card_id":"card_4SMFzk2P7zcNy9"
}
```

### HTTP Request
`POST https://api.lucova.com/user/add-credit-card`

### Required parameters:

* `card_number`
* `exp_month`
* `exp_year`
* `owner_name`
* `postal_code`
* `cvv`

### Optional parameters:

* `set_default`


## Retrieve Credit Cards

> To retrieve all Credit Cards:

```java
```

```objective_c
```

```shell
curl -XGET "https://api.lucova.com/user/retrieve-credit-cards" \
  -u "user_name:auth_token"
```

> The above command returns JSON structured like this:

```json
{
    "success": true,
    "default_card_id": "card_4S3kilNrEzull0",
    "credit_cards": [
        {
            "id":"card_4S3kilNrEzull0",
            "masked_num":"4242***4242"
        },
        {
            "id":"card_4S4QeoitONOxU8",
            "masked_num":"4242***4242"
        }
    ]
}
```

### HTTP Request
`GET https://api.lucova.com/user/retrieve-credit-cards`

### Required parameters:

None

### Optional parameters:

None

## Update Credit Card

At the present moment, you may only update whether a credit card is the user's default card.

> To update a Credit Card:

```java
```

```objective_c
```

```shell
curl -XPUT "https://api.lucova.com/user/modify-credit-card" \
  -d 'cust_id=card_id' \
  -d "set_default=set_default" \
  -u "user_name:auth_token"
```

> The above command returns JSON structured like this:

```json
{
    "success": true,
    "card": {
        "id": "card_4R05XRBi0q2UQW",
        "type":"Visa",
        "masked_number":"4242***4242",
        "name":"martin"
    }
}
```

### HTTP Request
`PUT https://api.lucova.com/user/modify-credit-card`

### Required parameters:

* `cust_id`
* `set_default`

### Optional parameters:

None


## Delete Credit Card

> To delete a Credit Card:

```java
```

```objective_c
```

```shell
curl -XDELETE "https://api.lucova.com/user/delete-credit-card" \
  -d 'card_id=card_id' \
  -u "user_name:auth_token"
```

> The above command returns JSON structured like this:

```json
{
    "success":true
}
```

### HTTP Request
`DELETE https://api.lucova.com/user/delete-credit-card`

### Required parameters:

* `card_id`

### Optional parameters:

None

# Transactions

## List Transaction History

> To list transaction history:

```java
```

```objective_c
```

```shell
curl -XGET "https://api.lucova.com/user/list-transactions" \
  -d 'balance_id=balance_id' \
  -u "user_name:auth_token"
```

> The above command returns JSON structured like this:

```json
{
    "success":true,
    "transactions": {
        "direct":[
            {
                "_id":{"$oid": "53d066d581239d70f5000033"},
                "employee_id":"mock",
                "employee_name":"Wile E. Coyote",
                "user_name":"b7266201d8c2bb5e09fad8e78f769f62",
                "product_desc":"Anvil",
                "amount_cents":10000,
                "redemption":false,
                "node_id":"mock",
                "node_name":"Acme Corp.",
                "node_address":"1 Acme Avenue",
                "terminal_id":"mock_terminal",
                "is_preauth":true,
                "is_mock":true,
                "short_id":"40554",
                "locked":false,
                "transaction_opened":1406166741,
                "transaction_opened_hr":"2014-07-23 21:52:21 -0400",
                "transaction_closed":1406166744,
                "transaction_type":"mock_direct",
                "status":"completed",
                "explicit_confirm":true,
                "tip_cents":1500,
                "total_cents":11500,
                "transaction_closed_hr":"2014-07-23 21:52:24 -0400"
            }
        ]
    }
}
```

### HTTP Request
`DELETE https://api.lucova.com/user/delete-credit-card`

### Required parameters:

None

### Optional parameters:

* `balance_id`

