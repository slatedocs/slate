---
title: BankVision API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - Code


toc_footers:
  - Web & Digital Banking Team
  - Documentation property of BankVision
includes:
  - errors

search: true
---

# Introduction

Welcome to the BankVision documentation API. If you are reading this page you have been granted permission to use it.  You can use our API to access the corresponding endpoints, which can execute  financial transactions throught our CORE.  In the following  sections you should find every detail about our API endpoints.

We have language bindings in curl. You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

# Authentication

BankVision uses API authorization key to allow access to the API.
You can register a new BankVision APP at our [client developer portal](https://api.bankvision.com).

BankVision expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: Bearer 1535bcad473aec160d7147d22b426ba8c12a97e5bf580bc779eed87ccca23aaf`

<aside class="notice">
This token should be refreshed every 24 hours.
</aside>

BankVision API uses Oauth 2.0 for authorization pourposes. OAuth 2.0 is the industry-standard protocol for authorization. OAuth 2.0 focuses on client developer simplicity while providing specific authorization flows for web applications, desktop applications, mobile phones, and living room devices.

**Oauth 2.0 Authentication**

Function | Docs
--------- | -------
Authorization Code Flow: |  http://tools.ietf.org/html/draft-ietf-oauth-v2-22#section-4.1
Access Token Scopes:  |  http://tools.ietf.org/html/draft-ietf-oauth-v2-22#section-3.3
Refresh token:  |  http://tools.ietf.org/html/draft-ietf-oauth-v2-22#section-1.5
Implicit grant:  |  http://tools.ietf.org/html/draft-ietf-oauth-v2-22#section-4.2
Resource Owner Password Credentials:  |  http://tools.ietf.org/html/draft-ietf-oauth-v2-22#section-4.3
Client Credentials:  |  http://tools.ietf.org/html/draft-ietf-oauth-v2-22#section-4.4
Token Revocation Flow:  |  http://tools.ietf.org/html/rfc7009

**Configuring an Application**

Bankvision will provide you with the credentials to access our [authorization server](https://api.bankvision.com).

When you create your application, you will then receive two numbers: a client ID and a client secret. These two numbers will be used in your app, so store them as appropriate.

**Revoking Access**

If a user wishes to revoke an authorization, they do it via

`https://api.bankvision.com/oauth/authorized_applications`

Revoking authorization to an app is done through the Bankvision applications page at

`https://api.bankvision.com/oauth/applications`

**Requesting the Grant**

In order to prompt the user to grant the access, we need to open a browser window. That window will open https://api.bankvision.com/oauth/authorize?client_id=XXX&response_type=code&redirect_uri=YYY with the following stand-in values:

### Query Parameters

Parameter | Info
----------|---------
XXX | stands for the client ID received in the previous step.
YYY | is the callback URI you configured in the previous step. These must match exactly or your request will be rejected.

When the user grants access to your application, that callback URI will be triggered and we will receive our authorization code. When we see callback://bankapp/callback?code=1928dbb28h... we are really only concerned with the business after the equals sign, of course. That is our authorization code.


**Using the Access Token**
For each request to access a protected resource, you will want to add this HTTP header:
<aside class="notice">
Authorization: Bearer 09ba487fc3df...
</aside>

##Getting an Access Token

For this, we will craft a POST request that presents our various bits and asks for a reusable token. The required parameters must be passed as form-urlencoded. The required parameters are:

### HTTP Request

`POST /oauth/token`

### Query Parameters

Parameter | Info
----------|---------
client_id | The client ID issued in the first step.
client_secret | The client secret issued in the first step.
redirect_uri | The callback URI we defined previously.
grant_type | This is authorization_code in the initial request.
code | The authorization code received in the previous step.

The response body that comes back looks like this:

> Server response

```json
{
  "access_token":"09ba487fc3df...",
  "token_type":"bearer",
  "expires_in":7200,
  "refresh_token":"8c488ab5f75d61...",
  "scope":"public",
  "created_at":"1500926357"
}

```
We'll parse out the access_token, refresh_token and expires_in values. The access_token is what we'll set in all our HTTP headers; it will expire in expires_in seconds. Once that period has passed, we use the refresh_token to get a new access_token.

To this end, to keep from re-authorizing each time the app runs, the refresh_token should be persisted somewhere.

##Renewing the Access Token

When we need to refresh our token, we will craft a POST request very similar to the one following the authorization grant. Only a few values are different:

### HTTP Request

`POST /oauth/token`


### Query Parameters

Parameter | Info
----------|----------------
client_id | The client ID issued in the first step.
client_secret | The client secret issued in the first step.
redirect_uri | The callback URI we defined previously.
grant_type | This was authorization_code in the initial request, but now it'll be refresh_token.
refresh_token | The saved refresh token.

##Revoke The Access Token

Revoke OAuth authorization, deletes the access token.
Post here with client credentials (in basic auth or in params client_id and client_secret) to revoke an access/refresh token. This corresponds to the token endpoint, using the OAuth 2.0 Token Revocation RFC (RFC 7009).

### HTTP Request

`POST /oauth/authorize`


### Query Parameters

Parameter | Info
----------|----------------
access_token | The client access token
client_id | The client ID issued in the first step.
client_secret | The client secret issued in the first step.
redirect_uri | The callback URI we defined previously.

##Getting Token Information

Shows details about the token used for authentication.

### HTTP Request

`GET /oauth/token/info`


### Query Parameters

Header | Info
-------|------
Authorization | Bearer client_token

> Example

```shell

curl -H "Authorization: Bearer 53cff8f4a549beb1c38704158b0f6608a2382f094b6947ecc35c2eed4146a17c" \
     api.bankvision.com/oauth/token/info

```
> Server response

```json
{
  "resource_owner_id":1,
  "scopes":[],
  "expires_in_seconds":7178,
  "application":{"uid":null},
  "created_at":1440460991
}

```
> Invalid response

```json

{
  "error":"invalid_request",
  "error_description":"The request is missing a required parameter, includes an unsupported parameter value, or is otherwise malformed."
}

```

##Oauth 2.0 GET Authorization Code

Provides a page with the authorization code.

### HTTP Request

`GET /oauth/authorize/:code`


> Example

```shell

curl http://api.bankvision.com/oauth/authorize/fd0847dbb559752d932dd3c1ac34ff98d27b11fe2fea5a864f44740cd7919ad0

```
> HTML Response

```html
<h3>Authorization code:</h3>
<code id="authorization_code">fd0847dbb559752d932dd3c1ac34ff98d27b11fe2fea5a864f44740cd7919ad0</code>

```

##Oauth 2.0 POST Authorization Code

Post here with response_type=code, client_id, client_secret, redirect_uri, and username. Will create and return an authorization code, then redirect to GET /oauth/authorize/:code with the authorization code.

### HTTP Request

`POST /oauth/authorize`

> Example

```shell

curl -F response_type=code \
-F client_id=9b36d8c0db59eff5038aea7a417d73e69aea75b41aac771816d2ef1b3109cc2f \
-F client_secret=d6ea27703957b69939b8104ed4524595e210cd2e79af587744a7eb6e58f5b3d2 \
-F redirect_uri=urn:ietf:wg:oauth:2.0:oob \
-F username=user@example.com \
-X POST http://api.bankvision.com/oauth/authorize

```

> HTML Response

```html

Redirect to the GET /oauth/authorize/:code path.

<html><body>You are being <a href="http://localhost:3000/oauth/authorize/fd0847dbb559752d932dd3c1ac34ff98d27b11fe2fea5a864f44740cd7919ad0">redirected</a>.</body></html>

```

##Oauth 2.0 DELETE Authorization Code

Revoke OAuth authorization, deletes the access token.

### HTTP Request

`DELETE /oauth/authorize`


> Example

```shell
curl -F response_type=token \
-F access_token=dbaf97579826846f45fa37a923a4387474070e04323b22f499b7227a860bac920b0ee6560c2  \
-F client_id=9b36d8c0db59eff5038aea7a417d73e69aea75b41aac771816d2ef1b3109cc2f \
-F client_secret=d6ea27703957b69939b8104ed4524595e210cd2e79af587744a7eb6e58f5b3d2 \
-F redirect_uri=urn:ietf:wg:oauth:2.0:oob \
-F username=user@example.com \
-X DELETE http://api.bankvision.com/oauth/authorize

```

> HTML Response

```html
Redirect to redirect_uri

```


##Oauth 2.0 GET Aplications Authorization

Revoke OAuth authorization, deletes the access token.

### HTTP Request

`GET /oauth/applications`


> Example

```shell

curl http://localhost:3000/oauth/applications

```
> HTML Response

```html
HTML page with tabular list of authorized application clients
        <tr id="application_1">
          <td><a href="/oauth/applications/1">Doorkeeper Sinatra Client</a></td>
          <td>urn:ietf:wg:oauth:2.0:oob</td>
          <td><a href="/oauth/applications/1/edit">Edit</a></td>
          <td><a href="/oauth/applications/1" data-confirm="Are you sure?" data-method="delete" rel="nofollow">Destroy</a></td>
        </tr>

```


##Oauth 2.0 GET Authorized Applications

Web user interface for logged-in user displays a list of api client authorizations.

### HTTP Request

`GET /oauth/authorized_applications`


> Example

```shell

curl -F username=user@example.com \
-X GET http://api.bankvision.com/oauth/authorized_applications

```
> HTML Response

```html
<tr>
  <td>Oauth 2.0 Bankvision Client</td>
  <td>2014-01-28 17:03:24 UTC</td>
  <td><a href="/oauth/authorized_applications/1" class="btn danger" data-confirm="Are you sure?" data-method="delete" rel="nofollow">Revoke</a></td>
</tr>

```

##Oauth 2.0 DELETE Authorized Applications

Destroys the identified api client authorization from a user.

### HTTP Request

`DELETE /oauth/authorized_applications/:id`


> Example

```shell
curl -F username=user@example.com \
-X DELETE http://api.bankvision.com/oauth/authorized_applications/1

```
> Response

```html
redirect to /oauth/authorized_applications

```



# Client

## Create Client
This endpoint create a new client. ( Data missing we need more information from core)

### HTTP Request

`POST https://api.bankvision.com/clients`

### BODY Parameters
Parameter | Description
----------|------------
name | Client name
last_name | Client last name
document_type | Client document type
identification | Client identification


## Get Client

```shell
curl "https://api.bankvision.com/clients"
  -H "Authorization: 57hHsakGhAs524...."
```

> The above command returns JSON structured like this:

```json
{
  "clients": [
    {
      "id": 1,
      "name": "Juan",
      "last_name": "Perez",
      "document_type": "CC",
      "identification": 45362727
    },
    {

      "id": 2,
      "name": "Juan",
      "last_name": "Lopez",
      "document_type": "CE",
      "identification": 123453
    }
  ]
}
```

This endpoint retrieves all clients. ( Data missing we need more information from core)

### HTTP Request

`GET https://api.bankvision.com/clients`

<aside class="success">
Remember you must be authenticated!
</aside>

## Get a Specific Client


```shell
curl "https://api.bankvision.com/clients/2"
  -H "Authorization: 6gfDsjesaHYlmn0892..."
```

> The above command returns JSON structured like this:

```json
{
  "client": {
    "id": 2,
    "name": "Max",
    "last_name": "Doe",
    "document_type": 'CC',
    "identification": 10227262
  }
}
```

This endpoint retrieves a specific client. ( Data missing we need more information from core )

### HTTP Request

`GET https://api.bankvision.com/clients/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the client to retrieve

## Delete a Specific Client

```shell
curl "http://api.bankvision.com/clients/2"
  -X DELETE
  -H "Authorization: Jhsk789hY3jsU...."
```


This endpoint delete a specific client.

### HTTP Request

`DELETE https://api.bankvision.com/clients/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the client to delete

## Update a Specific Client

### HTTP Request

`PUT/PATCH https://api.bankvision.com/clients/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the client to update


### BODY Parameters

Parameter | Description
--------- | -----------
name | Client name
last_name | Client last name
document_type | Client document type
identification | Client identification number
phone | Client phone

This endpoint update a specific client. (Data missing we need more information from core )

# Account
## Get Accounts

```shell
curl "https://api.bankvision.com/clients/<ID>/accounts/"
  -H "Authorization: 57hHsakGhAs524...."
```

> The above command returns JSON structured like this:

```json
{
  "accounts": [
    {
      "id": 1,
      "number": "1234555",
      "balance": "2000",
      "type": "S",
      "status": "A"
    },
    {

      "id": 2,
      "number": "983883",
      "balance": "90090",
      "type": "L",
      "status": "B"
    }
  ]
}
```

This endpoint retrieves all accounts that belongs to a specific client. ( Data missing we need more information from core)

### HTTP Request

`GET /clients/<ID>/accounts`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the client to retrive accounts

## Get a Specific Account


```shell
curl "https://api.bankvision.com/clients/2/accounts/1"
  -H "Authorization: 6gfDsjesaHYlmn0892..."
```

> The above command returns JSON structured like this:

```json
{
  "account": {
      "id": 2,
      "number": "983883",
      "balance": "90090",
      "type": "L",
      "status": "B",
      "client": {
        "id": 2,
        "name": "Max",
        "last_name": "Doe",
        "document_type": 'CC',
        "identification": 10227262
      }
  }
}
```

This endpoint retrieves a specific client account. ( Data missing we need more information from core )

### HTTP Request

`GET /clients/<ID>/accounts/<AID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the client to retrieve
AID | The ID of the account to retrieve


## Update a Specific Acccount

### HTTP Request

`PUT/PATCH /clients/<ID>/accounts/<AID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the account owner
AID | The ID of the account to update

### BODY Parameters

Parameter | Description
--------- | -----------
status | Account status
account_type | Account type

This endpoint update a specific client. (Data missing we need more information from core )


## Get Balance

This endpoint return the balance for the account of the client.


### HTTP Request
`GET /clients/<ID>/accounts/<AID>/balance`


### QUERY Parameters

Parameter | Description
--------- | -----------
ID | Client Id
AID | Account Number

>The above command returns JSON structured like this:

```json
{

  "account_id_holder":"Peter Broner",
  "available_balance":"500",
  "block_balance":"100",
  "total_balance":"1000",
  "total_exchange":"200",
  "pending_cancel_balance":"100",
  "message_description":"text"
}

```

## Get Transactions

This endpoint return the transactions made by the client for the defined account.


### HTTP Request
`GET /clients/<ID>/accounts/<AID>/transactions`

### QUERY Parameters
Parameter | Required | Description
----------|----------|-------------
page | false | Pagination: Page number
per_page | false | Pagination: Transactions per page
date | false | Transaction start date
end_date | false | Trasaction end date
trans_type | false | Transaction Type



>The above command returns JSON structured like this:

```json
{
  "":"",
  "":""
}

```
## Create Transfer

This endpoint create a new transfer.

### HTTP Request

`POST /clients/<ID>/accounts/<ID>/transfers`

### BODY Parameters
Parameter | Description
----------|------------
hour | Transaction hour
time | Transaction time
destination_account | Destination account
amount | Transaction amount

>The above command returns JSON structured like this:

```json
{
  "hour":"",
  "time":"",
  "destination_account":"",
  "account_holder":"",
  "amount": "",
  "origin_balance":""
  "transaction_id":"",
  "message_description":""
}

```
## Create Payment

This endpoint create a new payment.

### HTTP Request

`POST /clients/<ID>/accounts/<ID>/payments`

### BODY Parameters
Parameter | Description
----------|------------
hour | Transaction hour
time | Transaction time
amount | Transaction amount

>The above command returns JSON structured like this:

```json
{
  "hour":"",
  "time":"",
  "account_holder":"",
  "amount": "",
  "commision":""
  "transaction_id":"",
  "message_code":"",
  "message_description":""
}

```
## Create a Deposit

This endpoint create a new deposits.

### HTTP Request

`POST /clients/<ID>/accounts/<ID>/deposits`

### BODY Parameters
Parameter | Description
----------|------------
hour | Transaction hour
time | Transaction time
amount | Transaction amount

>The above command returns JSON structured like this:

```json
{
  "hour":"",
  "time":"",
  "account_holder":"",
  "amount": "",
  "commision":""
  "transaction_id":"",
  "message_code":"",
  "message_description":""
}

```
## Create a Withdrawal

This endpoint create a new withdrawal.

### HTTP Request

`POST /clients/<ID>/accounts/<ID>/withdrawals`

### BODY Parameters
Parameter | Description
----------|------------
hour | Transaction hour
time | Transaction time
amount | Transaction amount

>The above command returns JSON structured like this:

```json
{
  "hour":"",
  "time":"",
  "account_holder":"",
  "amount": "",
  "commision":""
  "transaction_id":"",
  "message_code":"",
  "message_description":""
}

```
