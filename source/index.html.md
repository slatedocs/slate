---
title: BankVision API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - Code


toc_footers:
  - Innovation Management Team
  - Documentation property of BankVision
includes:
  - errors

search: true
---

# Introduction

Welcome to the BankVision documentation API. If you are reading this page you have been granted permission to use it.  You can use our API to access the corresponding endpoints, which can execute  financial transactions throught our CORE.  In the following  sections you should find every detail about out API endpoints.

We have language bindings in Java. You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

# Authentication

> To authorize, use this code:

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
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

BankVision uses API keys to allow access to the API.
You can register a new BankVision API token at our [developer portal](http://example.com/developers).

BankVision expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: XAXAXAXAXAXAXA`

<aside class="notice">
This token should be refreshed every 24 hours.
</aside>

BankVision API uses Doorkeeper for authorization porposes. Doorkeeper is an OAuth 2 provider for Rails. It's built on top of Rails engines.

**Supported Features**

Function | Docs
--------- | -------
Authorization Code Flow: |  http://tools.ietf.org/html/draft-ietf-oauth-v2-22#section-4.1
Access Token Scopes:  |  http://tools.ietf.org/html/draft-ietf-oauth-v2-22#section-3.3
Refresh token:  |  http://tools.ietf.org/html/draft-ietf-oauth-v2-22#section-1.5
Implicit grant:  |  http://tools.ietf.org/html/draft-ietf-oauth-v2-22#section-4.2
Resource Owner Password Credentials:  |  http://tools.ietf.org/html/draft-ietf-oauth-v2-22#section-4.3
Client Credentials:  |  http://tools.ietf.org/html/draft-ietf-oauth-v2-22#section-4.4
Token Revocation Flow:  |  http://tools.ietf.org/html/rfc7009

**Routes in our system**

 |  |  |  |
--------- | --------- | ------- | -----------
  |  GET  |  /oauth/authorize/:code(.:format)  |  doorkeeper/authorizations#show
oauth_authorization  |  GET  |  /oauth/authorize(.:format)  |  doorkeeper/authorizations#new
  |  POST  |  /oauth/authorize(.:format)  |  doorkeeper/authorizations#create
  |  DELETE  |  /oauth/authorize(.:format)  |  doorkeeper/authorizations#destroy
oauth_token  |  POST  |  /oauth/token(.:format)  |  doorkeeper/tokens#create
oauth_revoke  |  POST  |  /oauth/revoke(.:format)  |  doorkeeper/tokens#revoke
oauth_applications  |  GET  |  /oauth/applications(.:format)  |  doorkeeper/applications#index
  |  POST  |  /oauth/applications(.:format)  |  doorkeeper/applications#create
oauth_application  |  GET  |  /oauth/applications/:id(.:format)  |  doorkeeper/applications#show
  |  PATCH  |  /oauth/applications/:id(.:format)  |  doorkeeper/applications#update
  |  PUT  |  /oauth/applications/:id(.:format)  |  doorkeeper/applications#update
  |  DELETE  |  /oauth/applications/:id(.:format)  |  doorkeeper/applications#destroy

##GET Authorization Code

**GET /oauth/authorize/:code**

Provides a page with the authorization code.

```Java

COMMAND

require 'BankVision'

api = BankVision::APIClient.authorize!('XAXAXAXAXAXAXA')

COMMAND OUTPUT

<h3>Authorization code:</h3>
<code id="authorization_code">fd0847dbb559752d932dd3c1ac34ff98d27b11fe2fea5a864f44740cd7919ad0</code>

```

##POST Authorization Code

**POST /oauth/authorize**

Post here with response_type=code, client_id, client_secret, redirect_uri, and username. Will create and return an authorization code, then redirect to GET /oauth/authorize/:code with the authorization code.

```Java

COMMAND

curl -F response_type=code \
-F client_id=9b36d8c0db59eff5038aea7a417d73e69aea75b41aac771816d2ef1b3109cc2f \
-F client_secret=d6ea27703957b69939b8104ed4524595e210cd2e79af587744a7eb6e58f5b3d2 \
-F redirect_uri=urn:ietf:wg:oauth:2.0:oob \
-F username=user@example.com \
-X POST http://localhost:3000/oauth/authorize

COMMAND OUTPUT

Redirect to the GET /oauth/authorize/:code path.

<html><body>You are being <a href="http://localhost:3000/oauth/authorize/fd0847dbb559752d932dd3c1ac34ff98d27b11fe2fea5a864f44740cd7919ad0">redirected</a>.</body></html>

```

##DELETE Authorization Code

**DELETE /oauth/authorize**

Revoke OAuth authorization, deletes the access token.

```Java

COMMAND

curl -F response_type=token \
-F access_token=dbaf97579826846f45fa37a923a4387474070e04323b22f499b7227a860bac920b0ee6560c2  \
-F client_id=9b36d8c0db59eff5038aea7a417d73e69aea75b41aac771816d2ef1b3109cc2f \
-F client_secret=d6ea27703957b69939b8104ed4524595e210cd2e79af587744a7eb6e58f5b3d2 \
-F redirect_uri=urn:ietf:wg:oauth:2.0:oob \
-F username=user@example.com \
-X DELETE http://localhost:3000/oauth/authorize

COMMAND OUTPUT

Redirect to redirect_uri

```

##POST Token

**POST /oauth/token**

Post here with authorization code for authorization code grant type or username and password for password grant type, or refresh token for refresh token type.

```Java

COMMAND

curl -F grant_type=authorization_code \
-F client_id=9b36d8c0db59eff5038aea7a417d73e69aea75b41aac771816d2ef1b3109cc2f \
-F client_secret=d6ea27703957b69939b8104ed4524595e210cd2e79af587744a7eb6e58f5b3d2 \
-F code=fd0847dbb559752d932dd3c1ac34ff98d27b11fe2fea5a864f44740cd7919ad0 \
-F redirect_uri=urn:ietf:wg:oauth:2.0:oob \
-X POST http://localhost:3000/oauth/token

COMMAND OUTPUT

{"access_token":"dbaf9757982a9e738f05d249b7b5b4a266b3a139049317c4909f2f263572c781","token_type":"bearer","expires_in":7200,"refresh_token":"76ba4c5c75c96f6087f58a4de10be6c00b29ea1ddc3b2022ee2016d1363e3a7c","scope":"public"}

COMMAND PASSWORD GRANT

curl -F grant_type=password \
-F username=user@example.com \
-F password=doorkeeper \
-X POST http://localhost:3000/oauth/token

COMMAND OUTPUT  

{"access_token":"0ddb922452c983a70566e30dce16e2017db335103e35d783874c448862a78168",
"token_type":"bearer",
"expires_in":7200,
"refresh_token":"f2188c4165d912524e04c6496d10f06803cc08ed50271a0b0a73061e3ac1c06c",
"scope":"public"}

COMMAND REFRESH TOKEN GRANT

curl -F grant_type=refresh_token \
-F client_id=9b36d8c0db59eff5038aea7a417d73e69aea75b41aac771816d2ef1b3109cc2f \
-F client_secret=d6ea27703957b69939b8104ed4524595e210cd2e79af587744a7eb6e58f5b3d2 \
-F refresh_token=c65b265611713028344a2c285dfdc4e28f9ce2dbc36b9f7e12f626a3d106a304 \
-X POST http://localhost:3000/oauth/token

COMMAND OUTPUT

{"access_token":"ad0b5847cb7d254f1e2ff1910275fe9dcb95345c9d54502d156fe35a37b93e80",
"token_type":"bearer",
"expires_in":30,
"refresh_token":"cc38f78a5b8abe8ee81cdf25b1ca74c3fa10c3da2309de5ac37fde00cbcf2815",
"scope":"public"}

COMMAND OUTPUT FAILED RESPONSE

{"error":"invalid_grant",
"error_description":"The provided authorization grant is invalid, expired, revoked, does not match the redirection URI used in the authorization request, or was issued to another client."}

```

##POST Token Revoke

**POST /oauth/revoke**

Revoke OAuth authorization, deletes the access token.

```Java

COMMAND -  Token revoke with client credentials in params

curl -F client_id=9b36d8c0db59eff5038aea7a417d73e69aea75b41aac771816d2ef1b3109cc2f \
-F client_secret=d6ea27703957b69939b8104ed4524595e210cd2e79af587744a7eb6e58f5b3d2 \
-F token=dbaf9757982a9e738f05d249b7b5b4a266b3a139049317c4909f2f263572c781 \
-X POST http://localhost:3000/oauth/revoke

COMMAND OUTPUT

{}

COMMAND - token revoke with client credentials in basic auth

curl -F token=dbaf9757982a9e738f05d249b7b5b4a266b3a139049317c4909f2f263572c781 \
-u '9b36d8c0db59eff5038aea7a417d73e69aea75b41aac771816d2ef1b3109cc2f:d6ea27703957b69939b8104ed4524595e210cd2e79af587744a7eb6e58f5b3d2' \
-X POST http://localhost:3000/oauth/revoke

COMMAND OUTPUT

{}

```

##GET Aplications Authorization

**GET /oauth/applications**

Revoke OAuth authorization, deletes the access token.

```Java

COMMAND

curl http://localhost:3000/oauth/applications

COMMAND OUTPUT

HTML page with tabular list of authorized application clients
        <tr id="application_1">
          <td><a href="/oauth/applications/1">Doorkeeper Sinatra Client</a></td>
          <td>urn:ietf:wg:oauth:2.0:oob</td>
          <td><a href="/oauth/applications/1/edit">Edit</a></td>
          <td><a href="/oauth/applications/1" data-confirm="Are you sure?" data-method="delete" rel="nofollow">Destroy</a></td>
        </tr>

```

##API for managing authorized api clients

**POST /oauth/applications**

Creates an authorized application with client id and secret. This is form submission from the page served by
 /oauth/applications/new

**GET /oauth/applications/new**

Serves a web form for editing a new authorized api client.

**GET /oauth/applications/:id/edit**

Serves a web form for editing the specified authorized api client.

**GET /oauth/applications/:id**

Displays a web page with details of a specified authorized api client.

**PUT /oauth/applications/:id**

Updates an authorized api client. This is form submission from the page served by /oauth/applications/:id/edit

**DELETE /oauth/applications/:id**

Deletes the specified authorized api client

##GET Authorized Applications

**GET /oauth/authorized_applications**

Web user interface for logged-in user displays a list of api client authorizations.

```Java

COMMAND

curl -F username=user@example.com \
-X GET http://localhost:3000/oauth/authorized_applications

COMMAND OUTPUT

<tr>
  <td>Doorkeeper Sinatra Client</td>
  <td>2014-01-28 17:03:24 UTC</td>
  <td><a href="/oauth/authorized_applications/1" class="btn danger" data-confirm="Are you sure?" data-method="delete" rel="nofollow">Revoke</a></td>
</tr>

```

##DELETE Authorized Applications

**DELETE /oauth/authorized_applications/:id**

Destroys the identified api client authorization from a user.

```Java

COMMAND

curl -F username=user@example.com \
-X DELETE http://localhost:3000/oauth/authorized_applications/1

COMMAND OUTPUT

redirect to /oauth/authorized_applications

```

##GET Token Information

**GET /oauth/token/info**

Shows details about the token used for authentication.

```Java

COMMAND

curl -H "Authorization: Bearer 53cff8f4a549beb1c38704158b0f6608a2382f094b6947ecc35c2eed4146a17c" \
     localhost:3000/oauth/token/info

COMMAND OUTPUT

{"resource_owner_id":1,
"scopes":[],
"expires_in_seconds":7178,
"application":{"uid":null},
"created_at":1440460991}

COMMAND OUTPUT - Token not found

{"error":"invalid_request",
"error_description":"The request is missing a required parameter, includes an unsupported parameter value, or is otherwise malformed."}

```

##POST Token Revoke

**POST /oauth/revoke**

Revokes the given token, requires authentication.

```Java

COMMAND

curl -F token=53cff8f4a549beb1c38704158b0f6608a2382f094b6947ecc35c2eed4146a17c \
 -H "Authorization: Bearer 53cff8f4a549beb1c38704158b0f6608a2382f094b6947ecc35c2eed4146a17c" \
 -X POST localhost:3000/oauth/revoke

COMMAND OUTPUT

Always returns 200 OK, even if token doesn't exist or has already been revoked.

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

## Get Transactions
