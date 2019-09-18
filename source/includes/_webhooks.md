# Webhooks


<a name="overview"></a>
## Overview
Receiving webhook updates for events that take place in the Goji Platform.


### Version information
*Version* : 1.0.0


### URI scheme
*Host* : api-sandbox.goji.investments
*BasePath* : /platformApi
*Schemes* : HTTPS


### Tags

* webhooks


### Consumes

* `application/json`


### Produces

* `application/json`

<a name="securityscheme"></a>
## Security

<a name="basicauth"></a>
### basicAuth
HTTP Basic Authentication over HTTPS. Only valid in Sandbox, HMAC should be used in production.

*Type* : basic


<a name="paths"></a>
## Paths

<a name="registerwebhook"></a>
### Register a url to which POSTs can be made when events occur. See the documentation for more information on the hooks that are supported
```
POST /webhooks
```


#### Description
Register a webhook url.


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**createWebhook**  <br>*optional*|Url to register for callbacks|[Webhook](#webhook)|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|The url was registered successfully.|No Content|
|**400**|Bad request.|[ErrorResponse](#errorresponse)|
|**401**|Unauthorised.|[ErrorResponse](#errorresponse)|
|**500**|Unexpected server error.|[ErrorResponse](#errorresponse)|


#### Produces

* `application/json`


#### Tags

* webhooks


#### Security

|Type|Name|
|---|---|
|**basic**|**[basicAuth](#basicauth)**|



<a name="definitions"></a>
## Definitions

<a name="error"></a>
### Error

|Name|Description|Schema|
|---|---|---|
|**errorCode**  <br>*optional*|The error code.|string|
|**message**  <br>*optional*|The error message.|string|


<a name="errorresponse"></a>
### Error Response

|Name|Schema|
|---|---|
|**errors**  <br>*optional*|< [Error](#error) > array|


<a name="webhook"></a>
### The url for configuring the webhook.

|Name|Description|Schema|
|---|---|---|
|**url**  <br>*optional*|The url to dispatch the webhook to.|string|



