---
title: PaidUp API

language_tabs:
  - shell: cURL

toc_footers:
  - <a href="mailto:support@getpaidup.com">Sign Up for Access Token</a>

search: true
---

# Introduction

PaidUp offers a RESTful API with resource-oriented URLs and uses HTTP response codes to indicate API errors. We use built-in HTTP features, like HTTP authentication and HTTP verbs, which are understood by off-the-shelf HTTP clients. JSON is returned by all API responses, including errors.

# Authentication

Authenticate your account when using the API by including your secret access key, `token`, in the header request. You can request your `token` by emailing <a href="mailto:support@getpaidup.com">support@getpaidup.com</a>. You will need one unique `token` per environment. Your access key carries many privileges, so be sure to keep it secret! Do not share your secret access key in publicly accessible areas such GitHub, client-side code, and so forth.

All API requests must be made over HTTPS. Calls made over plain HTTP will fail. API requests without authentication will also fail.

# Errors

PaidUp uses conventional HTTP response codes to indicate the success or failure of an API request. In general, codes in the `2xx` range indicate success and codes in the `4xx` range indicate an error that failed given the information provided (e.g., a required parameter was omitted, etc.).

Not all errors map cleanly onto HTTP response codes, however. When a request is valid but does not complete successfully, we may return a `402` error code.

# Environments

PaidUp has two environments, one for testing (Stage) and one for running live transactions (Production). Customers, objects, etc. in one environment do not exist in the other and cannot be manipulated by objects in the other.

The Stage and Production environments were designed to function almost identically, however, Stage may be updated from time to time with the latest versions of the API and backend. We strive to maintain backwards compatibility but will inform you in instances where that is not possible.

**STAGE**
[https://stg.getpaidup.com](https://stg.getpaidup.com)

**PRODUCTION**
[https://app.getpaidup.com](https://app.getpaidup.com)

# Workflow

For a visual representation of the proposed workflow for integrating with PaidUp, please visit <a href="https://www.lucidchart.com/publicSegments/view/07276abf-495b-467a-a090-dbbb5c947776/image.png">PaidUp Workflow</a>

# PaidUp Access

> Here is an example of how to build the URL

```html
https://stg.getpaidup.com/token/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJfaWQiOiI1ODA5MGFhMWYyZjU5YzQ2NWFiMmVmM2EiLCJzYWx0IjoiMGI1NWI3MDktYTU1OC00MjFhLTgxNTQtMTA0OGE0ODYzYzI1IiwiaWF0IjoxNDc2OTk1MzY2LCJleHAiOjE0NzY5OTg5NjZ9.-GvBwPiNcEw_y5Mn04LdggxQepsldJq6z86GoZir1s4/cat/55/referring/https%3A%2F%2Facme.com%2F/logo/https%3A%2F%2Facme.com%2Fwp-content%2Fuploads%2F2016%2F07%2Fyp-logo.png
```

To access the PaidUp service, you must build the URL according to the following rules:

base: https://xxx.getpaidup.com/token/`token`/cat/`businessId`/referring/`url_domain`/logo/`url_image`

* `token`: token generated upon authenticating the user
* `cat`: business ID in PaidUp
* `referring`: URL for directing user to original site
* `logo`: URL for image to display to return to original site

<aside class="notice">
  
URLs must be encoded with [http://www.w3schools.com/tags/ref_urlencode.asp](http://www.w3schools.com/tags/ref_urlencode.asp)

</aside>

# API

## Authenticate

> Example Request

```shell
$ curl -X POST -H "Content-Type: application/json" \
  -H "token: gNtrgqbPbmyew97NBaVzzuysHqQATuetrVBXCio4WVs" \
  -H "Cache-Control: no-cache" \
  -d '{
"email": "johndoe@mail.com",
"password": "test123"
}' "https://stg.getpaidup.com/api/v1/wsauth/login"
```
> Example Response

```json
{
  "token" : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJfaWQiOiI1ODA5MGFhMWYyZjU5YzQ2NWFiMmVmM2EiLCJzYWx0IjoiMGI1NWI3MDktYTU1OC00MjFhLTgxNTQtMTA0OGE0ODYzYzI1IiwiaWF0IjoxNDc2OTk1MzY2LCJleHAiOjE0NzY5OTg5NjZ9.-GvBwPiNcEw_y5Mn04LdggxQepsldJq6z86GoZir1s4"
}
```

## User

User objects allow you to create an order and track multiple charges that are associated with the same customer. The API allows you to create your customers.

```json
{
  "email": "johndoe@mail.com",
  "password": "test123",
  "firstName": "John",
  "lastName": "Doe",
  "address": "123 Main St.",
  "city": "Austin",
  "state": "TX",
  "country": "USA",
  "zipCode": "12345",
  "phone" : "5125551212"
}
```

user [/api/v1/user/new]

### User Object

Attribute | Example | Type
--------- | ------- | -----------
email | johndoe@mail.com | string
password | somepassword | string
firstName | john | string
lastName | doe | string
address | 123 Main St. | string
city | Austin | string
state | TX | string
country | USA | string
zipCode | 12345 | string
phone | 5125551212 | string

### Create User

Creates a new user object.

> Example Request

```shell
curl -X POST -H "Content-Type: application/json" \
  -H "token: jLqzcvrJrkpqg7FTDqEzzuysGkQiTN9RUDeXCgmFnQd" \
  -H "Cache-Control: no-cache" \
  -d '{
  "email": "johndoe2@mail.com",
  "password": "test123",
  "firstName": "John",
  "lastName": "Doe",
  "address": "123 Main St.",
  "city": "Austin",
  "state": "TX",
  "country": "USA",
  "zipCode": "12345",
  "phone" : "5125551212"
}' "https://stg.getpaidup.com/api/v1/user/new"
```

> Example Response

```json
{
  "id" : "18735a0cf2f59c465ab2ef3d",
  "email" : "johndoe2@mail.com",
  "password" : "test123",
  "firstName" : "John",
  "lastName" : "Doe",
  "address" : "123 Main St.",
  "city" : "Austin",
  "state" : "TX",
  "country" : "USA",
  "zipCode" : "12345",
  "phone" : "5125551212",
  "getFrom" : "acme"
}
```

