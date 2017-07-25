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

> To authorize, use this code:

```ruby
require 'rest-client'
api =
api = Kittn::APIClient.authorize!('meowmeowmeow')
```


```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
```

> Make sure to replace `meowmeowmeow` with your API key.

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
**POST /oauth/token**

For this, we will craft a POST request to https://api.bankvision.com/oauth/token that presents our various bits and asks for a reusable token. The required parameters must be passed as form-urlencoded. The required parameters are:

Parameter | Info
----------|---------
client_id | The client ID issued in the first step.
client_secret | The client secret issued in the first step.
redirect_uri | The callback URI we defined previously.
grant_type | This is authorization_code in the initial request.
code | The authorization code received in the previous step.

The response body that comes back looks like this:

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

**POST /oauth/token**

When we need to refresh our token, we will craft a POST request very similar to the one following the authorization grant. Only a few values are different:

Parameter | Info
----------|----------------
client_id | The client ID issued in the first step.
client_secret | The client secret issued in the first step.
redirect_uri | The callback URI we defined previously.
grant_type | This was authorization_code in the initial request, but now it'll be refresh_token.
refresh_token | The saved refresh token.

##Revoke The Access Token

**POST /oauth/authorize**

Revoke OAuth authorization, deletes the access token.
Post here with client credentials (in basic auth or in params client_id and client_secret) to revoke an access/refresh token. This corresponds to the token endpoint, using the OAuth 2.0 Token Revocation RFC (RFC 7009).

Parameter | Info
----------|----------------
access_token | The client access token
client_id | The client ID issued in the first step.
client_secret | The client secret issued in the first step.
redirect_uri | The callback URI we defined previously.

##Getting Token Information

**GET /oauth/token/info**

Shows details about the token used for authentication.

Header | Info
-------|------
Authorization | Bearer client_token

```shell

curl -H "Authorization: Bearer 53cff8f4a549beb1c38704158b0f6608a2382f094b6947ecc35c2eed4146a17c" \
     api.bankvision.com/oauth/token/info

```


```json
{
  "resource_owner_id":1,
  "scopes":[],
  "expires_in_seconds":7178,
  "application":{"uid":null},
  "created_at":1440460991
}

```

```json

{
  "error":"invalid_request",
  "error_description":"The request is missing a required parameter, includes an unsupported parameter value, or is otherwise malformed."
}

```

##Oauth 2.0 GET Authorization Code

**GET /oauth/authorize/:code**

Provides a page with the authorization code.

```shell

curl http://api.bankvision.com/oauth/authorize/fd0847dbb559752d932dd3c1ac34ff98d27b11fe2fea5a864f44740cd7919ad0

```

```html
<h3>Authorization code:</h3>
<code id="authorization_code">fd0847dbb559752d932dd3c1ac34ff98d27b11fe2fea5a864f44740cd7919ad0</code>

```

##Oauth 2.0 POST Authorization Code

**POST /oauth/authorize**

Post here with response_type=code, client_id, client_secret, redirect_uri, and username. Will create and return an authorization code, then redirect to GET /oauth/authorize/:code with the authorization code.

```shell

curl -F response_type=code \
-F client_id=9b36d8c0db59eff5038aea7a417d73e69aea75b41aac771816d2ef1b3109cc2f \
-F client_secret=d6ea27703957b69939b8104ed4524595e210cd2e79af587744a7eb6e58f5b3d2 \
-F redirect_uri=urn:ietf:wg:oauth:2.0:oob \
-F username=user@example.com \
-X POST http://api.bankvision.com/oauth/authorize

```

```html

Redirect to the GET /oauth/authorize/:code path.

<html><body>You are being <a href="http://localhost:3000/oauth/authorize/fd0847dbb559752d932dd3c1ac34ff98d27b11fe2fea5a864f44740cd7919ad0">redirected</a>.</body></html>

```

##Oauth 2.0 DELETE Authorization Code

**DELETE /oauth/authorize**

Revoke OAuth authorization, deletes the access token.

```shell
curl -F response_type=token \
-F access_token=dbaf97579826846f45fa37a923a4387474070e04323b22f499b7227a860bac920b0ee6560c2  \
-F client_id=9b36d8c0db59eff5038aea7a417d73e69aea75b41aac771816d2ef1b3109cc2f \
-F client_secret=d6ea27703957b69939b8104ed4524595e210cd2e79af587744a7eb6e58f5b3d2 \
-F redirect_uri=urn:ietf:wg:oauth:2.0:oob \
-F username=user@example.com \
-X DELETE http://api.bankvision.com/oauth/authorize

```

```html
Redirect to redirect_uri

```


##Oauth 2.0 GET Aplications Authorization

**GET /oauth/applications**

Revoke OAuth authorization, deletes the access token.

```shell

curl http://localhost:3000/oauth/applications

```

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

**GET /oauth/authorized_applications**

Web user interface for logged-in user displays a list of api client authorizations.

```shell

curl -F username=user@example.com \
-X GET http://api.bankvision.com/oauth/authorized_applications

```

```html
<tr>
  <td>Oauth 2.0 Bankvision Client</td>
  <td>2014-01-28 17:03:24 UTC</td>
  <td><a href="/oauth/authorized_applications/1" class="btn danger" data-confirm="Are you sure?" data-method="delete" rel="nofollow">Revoke</a></td>
</tr>

```

##Oauth 2.0 DELETE Authorized Applications

**DELETE /oauth/authorized_applications/:id**

Destroys the identified api client authorization from a user.

```shell

curl -F username=user@example.com \
-X DELETE http://api.bankvision.com/oauth/authorized_applications/1

```

```html
redirect to /oauth/authorized_applications

```



# Client

## Get Client

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
```

```shell
curl "http://example.com/api/kittens"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let kittens = api.kittens.get();
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Client

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

## Delete a Specific Client

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.delete(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.delete(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -X DELETE
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.delete(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "deleted" : ":("
}
```

This endpoint retrieves a specific kitten.

### HTTP Request

`DELETE http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete

# Account

## Get Balance

This endpoint return the balance for the account of the client.

**GET http://api.bankvision.com/clients/client_id/accounts/account_id/balances**

>The above command returns JSON structured like this:

```json
{

  "account_id":"12345678...",
  "network":"petitioner"
}

```

## Get Transactions

This endpoint return the transactions made by the client for the defined account.

**GET http://api.bankvision.com/clients/client_id/accounts/account_id/transfers**

>The above command returns JSON structured like this:

```json
{
  "account_id":"12345678...",
  "network":"petitioner"
}

```

## GET Payments

This endpoint returns the payments made from the defined account.

**GET http://api.bankvision.com/clients/client_id/accounts/account_id/payments**

>The above command returns JSON structured like this:

```json
{
  "document_id":"100200300",
  "document_type":"CC",
  "account_id":"12345678..."
}

```

##GET Deposits

This endpoint returns the deposits made on the defined account.

**GET http://api.bankvision.com/clients/client_id/accounts/account_id/deposits**

>The above command returns JSON structured like this:

```json
{
  "document_id":"100200300",
  "document_type":"CC",
  "account_id":"12345678..."
}

```
