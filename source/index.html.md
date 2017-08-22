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
first_name | Client First Name
middle_name | Client Middle Name  
last_name | Client Last Name  
second_last_name | Client Second Last Name
short_name | Client Short Name (Client First and Last Name)
client_type | Type of Client
id_number | Client Identification Number
id_type | Client Identification Type
id_expedition_date | Client Identification Expedition Date
account_official | Official of the Account
market_segment | Client Market Segment
activity_cod  | Activity Code
language_cod | Language Code
opening_branch | Opening Branch
third_party_control | Third Party Control
tax_info_check_account | Check Account Tax Information
tax_info_savings_account | Savings Account Tax Information
expedition_city | Client ID Expedition City
birth_date | Client Birth Date
tax_info_certified | Certified Tax Information
tax_info_loans | Loans Tax Information
sequence | Sequence


```json
{
  "clients": [
    {
      "first_name": "Juan",
      "middle_name": "Pedro",
      "last_name":"Perez",
      "second_last_name":"Garcia",
      "short_name":"Juan Perez",
      "client_type":"N",
      "id_number":123456,
      "id_type":"CC",
      "id_expedition_date":"20170606",
      "account_official":"00001",
      "market_segment":"A",
      "activity_cod": "00003",
      "language_cod": "01",
      "opening_branch":"01",
      "third_party_control":"A",
      "tax_info_check_account":"00",
      "tax_info_savings_account":"00",
      "expedition_city":"Bogota",
      "birth_date":"20170606",
      "tax_info_certified":"000",
      "tax_info_loans":"000",
      "sequence":"000001"
    },
    {

      "first_name": "Juan",
      "middle_name": "Pedro",
      "last_name":"Perez",
      "second_last_name":"Garcia",
      "client_type":"N",
      "id_number":123456,
      "id_type":"CC",
      "id_expedition_date":"20170606",
      "opening_branch":"01",
      "expedition_city":"Bogota",
      "birth_date":"20170606",
      "sequence":"000001"
    }
  ]
}
```


## Get Client

This endpoint retrieves all clients.

### HTTP Request

`GET https://api.bankvision.com/clients`

<aside class="success">
Remember you must be authenticated!
</aside>

### BODY Parameters
Parameter | Description
----------|------------
first_name | Client First Name
middle_name | Client Middle Name  
last_name | Client Last Name  
second_last_name | Client Second Last Name
short_name | Client Short Name (Client First and Last Name)
client_type | Type of Client
id_number | Client Identification Number
id_type | Client Identification Type
id_expedition_date | Client Identification Expedition Date
account_official | Official of the Account
market_segment | Client Market Segment
activity_cod  | Activity Code
language_cod | Language Code
opening_branch | Opening Branch
third_party_control | Third Party Control
tax_info_check_account | Check Account Tax Information
tax_info_savings_account | Savings Account Tax Information
expedition_city | Client ID Expedition City
birth_date | Client Birth Date
tax_info_certified | Certified Tax Information
tax_info_loans | Loans Tax Information
sequence | Sequence

```shell
curl "https://api.bankvision.com/clients"
  -H "Authorization: 57hHsakGhAs524...."
```

> The above command returns JSON structured like this:

```json
{
  "clients": [
    {
      "first_name": "Juan",
      "middle_name": "Pedro",
      "last_name":"Perez",
      "second_last_name":"Garcia",
      "short_name":"Juan Perez",
      "client_type":"N",
      "id_number":123456,
      "id_type":"CC",
      "id_expedition_date":"20170606",
      "account_official":"00001",
      "market_segment":"A",
      "activity_cod": "00003",
      "language_cod": "01",
      "opening_branch":"01",
      "third_party_control":"A",
      "tax_info_check_account":"00",
      "tax_info_savings_account":"00",
      "expedition_city":"Bogota",
      "birth_date":"20170606",
      "tax_info_certified":"000",
      "tax_info_loans":"000",
      "sequence":"000001"
    },
    {

      "first_name": "Juan",
      "middle_name": "Pedro",
      "last_name":"Perez",
      "second_last_name":"Garcia",
      "client_type":"N",
      "id_number":123456,
      "id_type":"CC",
      "id_expedition_date":"20170606",
      "opening_branch":"01",
      "expedition_city":"Bogota",
      "birth_date":"20170606",
      "sequence":"000001"
    }
  ]
}
```

## Get a Specific Client

### HTTP Request

`GET https://api.bankvision.com/clients/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the client to retrieve

### BODY Parameters
Parameter | Description
----------|------------
first_name | Client First Name
middle_name | Client Middle Name  
last_name | Client Last Name  
second_last_name | Client Second Last Name
short_name | Client Short Name (Client First and Last Name)
client_type | Type of Client
id_number | Client Identification Number
id_type | Client Identification Type
id_expedition_date | Client Identification Expedition Date
account_official | Official of the Account
market_segment | Client Market Segment
activity_cod  | Activity Code
language_cod | Language Code
opening_branch | Opening Branch
third_party_control | Third Party Control
tax_info_check_account | Check Account Tax Information
tax_info_savings_account | Savings Account Tax Information
expedition_city | Client ID Expedition City
birth_date | Client Birth Date
tax_info_certified | Certified Tax Information
tax_info_loans | Loans Tax Information
sequence | Sequence

```shell
curl "https://api.bankvision.com/clients/2"
  -H "Authorization: 6gfDsjesaHYlmn0892..."
```

> The above command returns JSON structured like this:

```json
{
  "clients": [
    {
      "first_name": "Juan",
      "middle_name": "Pedro",
      "last_name":"Perez",
      "second_last_name":"Garcia",
      "short_name":"Juan Perez",
      "client_type":"N",
      "id_number":123456,
      "id_type":"CC",
      "id_expedition_date":"20170606",
      "account_official":"00001",
      "market_segment":"A",
      "activity_cod": "00003",
      "language_cod": "01",
      "opening_branch":"01",
      "third_party_control":"A",
      "tax_info_check_account":"00",
      "tax_info_savings_account":"00",
      "expedition_city":"Bogota",
      "birth_date":"20170606",
      "tax_info_certified":"000",
      "tax_info_loans":"000",
      "sequence":"000001"
    },
    {

      "first_name": "Juan",
      "middle_name": "Pedro",
      "last_name":"Perez",
      "second_last_name":"Garcia",
      "client_type":"N",
      "id_number":123456,
      "id_type":"CC",
      "id_expedition_date":"20170606",
      "opening_branch":"01",
      "expedition_city":"Bogota",
      "birth_date":"20170606",
      "sequence":"000001"
    }
  ]
}
```

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
first_name | Client First Name
middle_name | Client Middle Name  
last_name | Client Last Name  
second_last_name | Client Second Last Name
short_name | Client Short Name (Client First and Last Name)
client_type | Type of Client
id_number | Client Identification Number
id_type | Client Identification Type
id_expedition_date | Client Identification Expedition Date
account_official | Official of the Account
market_segment | Client Market Segment
activity_cod  | Activity Code
language_cod | Language Code
opening_branch | Opening Branch
third_party_control | Third Party Control
tax_info_check_account | Check Account Tax Information
tax_info_savings_account | Savings Account Tax Information
expedition_city | Client ID Expedition City
birth_date | Client Birth Date
tax_info_certified | Certified Tax Information
tax_info_loans | Loans Tax Information
sequence | Sequence


```json
{
  "clients": [
    {
      "action": "I",
      "first_name": "Juan",
      "middle_name": "Pedro",
      "last_name":"Perez",
      "second_last_name":"Garcia",
      "short_name":"Juan Perez",
      "client_type":"N",
      "id_number":123456,
      "id_type":"CC",
      "id_expedition_date":"20170606",
      "account_official":"00001",
      "market_segment":"A",
      "activity_cod": "00003",
      "language_cod": "01",
      "opening_branch":"01",
      "third_party_control":"A",
      "tax_info_check_account":"00",
      "tax_info_savings_account":"00",
      "expedition_city":"Bogota",
      "birth_date":"20170606",
      "tax_info_certified":"000",
      "tax_info_loans":"000",
      "sequence":"000001"
    },
    {

      "first_name": "Juan",
      "middle_name": "Pedro",
      "last_name":"Perez",
      "second_last_name":"Garcia",
      "client_type":"N",
      "id_number":123456,
      "id_type":"CC",
      "id_expedition_date":"20170606",
      "opening_branch":"01",
      "expedition_city":"Bogota",
      "birth_date":"20170606",
      "sequence":"000001"
    }
  ]
}
```

# Account
## Get Accounts

This endpoint retrieves all accounts that belongs to a specific client. ( Data missing we need more information from core)

### HTTP Request

`GET /clients/<ID>/accounts`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the client to retrive accounts

### BODY Parameters
Parameter | Description
----------|------------
first_name | Client First Name
middle_name | Client Middle Name  
last_name | Client Last Name  
second_last_name | Client Second Last Name
short_name | Client Short Name (Client First and Last Name)
client_type | Type of Client
id_number | Client Identification Number
id_type | Client Identification Type
id_expedition_date | Client Identification Expedition Date
account_official | Official of the Account
market_segment | Client Market Segment
activity_cod  | Activity Code
language_cod | Language Code
opening_branch | Opening Branch
third_party_control | Third Party Control
tax_info_check_account | Check Account Tax Information
tax_info_savings_account | Savings Account Tax Information
expedition_city | Client ID Expedition City
birth_date | Client Birth Date
tax_info_certified | Certified Tax Information
tax_info_loans | Loans Tax Information
sequence | Sequence


```shell
curl "https://api.bankvision.com/clients/<ID>/accounts/"
  -H "Authorization: 57hHsakGhAs524...."
```

> The above command returns JSON structured like this:

```json
{
  "accounts": [
    {
      "first_name": "Juan",
      "middle_name": "Pedro",
      "last_name":"Perez",
      "second_last_name":"Garcia",
      "short_name":"Juan Perez",
      "client_type":"N",
      "id_number":123456,
      "id_type":"CC",
      "id_expedition_date":"20170606",
      "account_official":"00001",
      "market_segment":"A",
      "activity_cod": "00003",
      "language_cod": "01",
      "opening_branch":"01",
      "third_party_control":"A",
      "tax_info_check_account":"00",
      "tax_info_savings_account":"00",
      "expedition_city":"Bogota",
      "birth_date":"20170606",
      "tax_info_certified":"000",
      "tax_info_loans":"000",
      "sequence":"000001"
    },
    {

      "first_name": "Juan",
      "middle_name": "Pedro",
      "last_name":"Perez",
      "second_last_name":"Garcia",
      "client_type":"N",
      "id_number":123456,
      "id_type":"CC",
      "id_expedition_date":"20170606",
      "opening_branch":"01",
      "expedition_city":"Bogota",
      "birth_date":"20170606",
      "sequence":"000001"
    }
  ]
}
```

## Get a Specific Account


This endpoint retrieves a specific client account. ( Data missing we need more information from core )

### HTTP Request

`GET /clients/<ID>/accounts/<AID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the client to retrieve
AID | The ID of the account to retrieve

### BODY Parameters
Parameter | Description
----------|------------
first_name | Client First Name
middle_name | Client Middle Name  
last_name | Client Last Name  
second_last_name | Client Second Last Name
short_name | Client Short Name (Client First and Last Name)
client_type | Type of Client
id_number | Client Identification Number
id_type | Client Identification Type
id_expedition_date | Client Identification Expedition Date
account_official | Official of the Account
market_segment | Client Market Segment
activity_cod  | Activity Code
language_cod | Language Code
opening_branch | Opening Branch
third_party_control | Third Party Control
tax_info_check_account | Check Account Tax Information
tax_info_savings_account | Savings Account Tax Information
expedition_city | Client ID Expedition City
birth_date | Client Birth Date
tax_info_certified | Certified Tax Information
tax_info_loans | Loans Tax Information
sequence | Sequence

```shell
curl "https://api.bankvision.com/clients/2/accounts/1"
  -H "Authorization: 6gfDsjesaHYlmn0892..."
```

> The above command returns JSON structured like this:

```json
{
  "accounts": [
    {
      "first_name": "Juan",
      "middle_name": "Pedro",
      "last_name":"Perez",
      "second_last_name":"Garcia",
      "short_name":"Juan Perez",
      "client_type":"N",
      "id_number":123456,
      "id_type":"CC",
      "id_expedition_date":"20170606",
      "account_official":"00001",
      "market_segment":"A",
      "activity_cod": "00003",
      "language_cod": "01",
      "opening_branch":"01",
      "third_party_control":"A",
      "tax_info_check_account":"00",
      "tax_info_savings_account":"00",
      "expedition_city":"Bogota",
      "birth_date":"20170606",
      "tax_info_certified":"000",
      "tax_info_loans":"000",
      "sequence":"000001"
    },
    {

      "first_name": "Juan",
      "middle_name": "Pedro",
      "last_name":"Perez",
      "second_last_name":"Garcia",
      "client_type":"N",
      "id_number":123456,
      "id_type":"CC",
      "id_expedition_date":"20170606",
      "opening_branch":"01",
      "expedition_city":"Bogota",
      "birth_date":"20170606",
      "sequence":"000001"
    }
  ]
}
```

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
----------|------------
first_name | Client First Name
middle_name | Client Middle Name  
last_name | Client Last Name  
second_last_name | Client Second Last Name
short_name | Client Short Name (Client First and Last Name)
client_type | Type of Client
id_number | Client Identification Number
id_type | Client Identification Type
id_expedition_date | Client Identification Expedition Date
account_official | Official of the Account
market_segment | Client Market Segment
activity_cod  | Activity Code
language_cod | Language Code
opening_branch | Opening Branch
third_party_control | Third Party Control
tax_info_check_account | Check Account Tax Information
tax_info_savings_account | Savings Account Tax Information
expedition_city | Client ID Expedition City
birth_date | Client Birth Date
tax_info_certified | Certified Tax Information
tax_info_loans | Loans Tax Information
sequence | Sequence

This endpoint update a specific account.

```json
{
  "accounts": [
    {
      "first_name": "Juan",
      "middle_name": "Pedro",
      "last_name":"Perez",
      "second_last_name":"Garcia",
      "short_name":"Juan Perez",
      "client_type":"N",
      "id_number":123456,
      "id_type":"CC",
      "id_expedition_date":"20170606",
      "account_official":"00001",
      "market_segment":"A",
      "activity_cod": "00003",
      "language_cod": "01",
      "opening_branch":"01",
      "third_party_control":"A",
      "tax_info_check_account":"00",
      "tax_info_savings_account":"00",
      "expedition_city":"Bogota",
      "birth_date":"20170606",
      "tax_info_certified":"000",
      "tax_info_loans":"000",
      "sequence":"000001"
    },
    {

      "first_name": "Juan",
      "middle_name": "Pedro",
      "last_name":"Perez",
      "second_last_name":"Garcia",
      "client_type":"N",
      "id_number":123456,
      "id_type":"CC",
      "id_expedition_date":"20170606",
      "opening_branch":"01",
      "expedition_city":"Bogota",
      "birth_date":"20170606",
      "sequence":"000001"
    }
  ]
}
```

## Get Balance

This endpoint return the balance for the account of the client.


### HTTP Request
`GET /clients/<ID>/accounts/<AID>/balance`


### QUERY Parameters

Parameter | Description
--------- | -----------
transaction_time | Transaction Time
transaction_date | Transaction Date
account_number | Account Number
origin | Transaction Origin
terminal | Terminal
secuence | Secuence
account_type | Type of Account

```shell
curl "https://api.bankvision.com/clients/<ID>/accounts/balance"
  -H "Authorization: 6gfDsjesaHYlmn0892..."
```

>The above command returns JSON structured like this:

```json
{
  "balance": [
    {
  "transaction_time":"00:06:06",
  "transaction_date":"20170606",
  "account_number":123456,
  "origin":123,
  "terminal":"10",
  "secuence":123456,
  "account_type":"B"
  },
  {

  "S005":"0001",
  "transaction_time":"00:06:06",
  "transaction_date":"20170606",
  "S05A":"0001",
  "account_number":123456,
  "id_number":111222,
  "available_balance":"500,00",
  "total_balance":"500,00",
  "terminal":"01",
  "comision_value":"10",
  "message_cod":10,
  "message_desc":"text",
  "transactional_group":"BV1",
  "secuence":123456,
  "account_type":"O"
    }
  ]
}
```

## Get Transactions

This endpoint return the transactions made by the client for the defined account.


### HTTP Request
`GET /clients/<ID>/accounts/<AID>/transactions`

### QUERY Parameters
Parameter | Required | Description
----------|----------|-------------
transaction_time | true | Pagination: Page number
transaction_date | true | Pagination: Transactions per page
account_origin_type | true | Transaction start date
account_origin_number | true | Origin Account Number  
account_target_type | true | Target Account Number Type
account_target_number | true | Target Account Number
transaction_amount | true | Amount of money to be transfer
sequence | false | Sequence Number for the transaction



```shell
curl "https://api.bankvision.com/clients/<ID>/accounts/transactions"
  -H "Authorization: 6gfDsjesaHYlmn0892..."
```

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
transaction_time | true | Pagination: Page number
transaction_date | true | Pagination: Transactions per page
account_origin_type | true | Transaction start date
account_origin_number | true | Origin Account Number  
account_target_type | true | Target Account Number Type
account_target_number | true | Target Account Number
transaction_amount | true | Amount of money to be transfer
sequence | false | Sequence Number for the transaction

```shell
curl "https://api.bankvision.com/clients/<ID>/accounts/transfers"
  -H "Authorization: 6gfDsjesaHYlmn0892..."
```

>The above command returns JSON structured like this:

```json
{
  "transfers": [
    {
      "transaction_time": "06:06:00",
      "transaction_date": "20170606",
      "account_origin_type": "O",
      "account_origin_number": 645789,
      "account_target_type": "S",
      "account_target_number":123456,
      "transaction_amount":"500,00",
      "sequence":123456
    },
    {

      "transaction_time": "06:06:00",
      "transaction_date": "20170606",
      "account_origin_type": "O",
      "account_origin_number": 645789,
      "account_target_type": "S",
      "account_target_number":123456,
      "transaction_amount":"500,00",
      "discount_target_number":"10",
      "total_balance_target":"1000,00",
      "available_balance_target":"900,00",
      "message_cod":"10",
      "message_desc":"lunch payment",
      "transactional_group":"20",
      "sequence":123456,
      "terminal":001,
      "comision_value":10,
      "transaction_type":"002",
      "origin":"R01"
    }
  ]
}
```


## Create Payment

This endpoint create a new payment.

### HTTP Request

`POST /clients/<ID>/accounts/<ID>/payments`

### BODY Parameters
Parameter | Description
----------|------------
transaction_time | Transaction Hour
transaction_date | Transaction Date
account_number | Account Number
transaction_amount | Amount

```shell
curl "https://api.bankvision.com/clients/<ID>/accounts/payments"
  -H "Authorization: 6gfDsjesaHYlmn0892..."
```

>The above command returns JSON structured like this:

```json
{
  "payments": [
    {
      "transaction_time": "06:06:00",
      "transaction_date": "20170606",
      "account_number": 646789,
      "transaction_amount": "500,00",
    },
    {

      "transaction_time": "06:06:00",
      "transaction_date": "20170606",
      "account_number": 646789,
      "client_name": "Juan Perez",
      "transaction_amount": "500,00",
      "message_cod":10,
      "message_desc":"lunch payment"
    }
  ]
}
```

## Create a Deposit

This endpoint create a new deposits.

### HTTP Request

`POST /clients/<ID>/accounts/<ID>/deposits`

### BODY Parameters
Parameter | Description
----------|------------
transaction_time | Transaction Hour
transaction_date | Transaction Date
account_number | Account Number
transaction_amount | Amount

```shell
curl "https://api.bankvision.com/clients/<ID>/accounts/deposits"
  -H "Authorization: 6gfDsjesaHYlmn0892..."
```

>The above command returns JSON structured like this:

```json
{
  "deposits": [
    {
      "transaction_time": "06:06:00",
      "transaction_date": "20170606",
      "account_number": 646789,
      "transaction_amount": "500,00",
    },
    {

      "transaction_time": "06:06:00",
      "transaction_date": "20170606",
      "account_number": 646789,
      "client_name": "Juan Perez",
      "transaction_amount": "500,00",
      "message_cod":10,
      "message_desc":"lunch payment"
    }
  ]
}
```

## Create a Withdrawal

This endpoint create a new withdrawal.

### HTTP Request

`POST /clients/<ID>/accounts/<ID>/withdrawals`

### BODY Parameters
Parameter | Description
----------|------------
transaction_time | Transaction Hour
transaction_date | Transaction Date
account_number | Account Number
transaction_amount | Amount

```shell
curl "https://api.bankvision.com/clients/<ID>/accounts/withdrawals"
  -H "Authorization: 6gfDsjesaHYlmn0892..."
```

>The above command returns JSON structured like this:

```json
{
  "withdrawals": [
    {
      "transaction_time": "06:06:00",
      "transaction_date": "20170606",
      "account_number": 646789,
      "transaction_amount": "500,00",
    },
    {

      "transaction_time": "06:06:00",
      "transaction_date": "20170606",
      "account_number": 646789,
      "client_name": "Juan Perez",
      "transaction_amount": "500,00",
      "message_cod":10,
      "message_desc":"lunch payment"
    }
  ]
}
```
