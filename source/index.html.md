---
title: API Guides

language_tabs:
  - shell

toc_footers:
  - <a href='https://api.itembase.com/api/clients'>Register Your Application</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - gettingaccess
  - gettingdata
  - entities

search: true
---

# Introduction

Our RESTful API connects eCommerce services and platforms to each other. We do this by standardizing and normalizing data 
like transactions and products using [JSON schemas](#entities). For authorization and authentication we are using OAuth2. 

We have built multiple **connectors** to platforms like eBay, Prestashop and even Gmail. Imagine you want to get all the 
orders stored inside a Prestashop installation, all you have to do is to initiate an **activation flow** via our platform, 
activating our **Prestashop connector** for the shop owner on the one hand, and activating your service on the other. 
You can repeat this process for as many connectors as you like without having to deal with platform specifics like formats, 
authentication, api limitations etc. Our connectors and transformers aim to provide a consistent and user-friendly 
interface to ALL and ANY eCommerce data.

To move on you will need to [create a user account](https://api.itembase.com/google-login). After that you will 
[register your application](https://api.itembase.com/api/clients) to get OAuth2 credentials.

**For a quickstart** you can just copy and paste the code samples we provide below. They are using a predefined user 
with activated connection and never-expire token.

## Summary

1. To use any API provided by itembase, you have to [register your client](https://api.itembase.com/google-login)
2. To get authorized API access via OAuth 2.0, or to use the itembase API as a sign-on service, you need to authorize 
with the following information:
 * A **client id** which identifies your client with the server (one for sandbox, one for production)
 * A **client secret** which you use to perform certain operations during auth process **keep it in a safe place and never expose it!**
 * One or more **redirect uris** (on your side) that can be used to send an auth code to you – there is a restricted set 
 of URLs per client
We are following the Oauth2 standard. Check out [this excellent video tutorial by KnpUniversity](https://www.youtube.com/watch?v=io_r-0e3Qcw) 
which explains OAuth2 very well.
 * You can use the sandbox user "klaus" with password "itembase" for fooling around in the sandbox.
3. By default, only the basic user information is available to you even if you have gained the user's authorization. 
Therefore you may want to activate the data flow from the data connector to the API. To complete this process, you need:
 * An additional **redirect uri** that is known on our side and where the activation endpoint will redirect after the process finished.
 * Each entity (e.g. /users/{user_id}/transaction) is a valid endpoint. Please refer to the [entities section](#entities) 
 for a list of entities and their json schema definitions.

**Entities that originate from the same data connection have the same <i>source_id</i> attribute!**

## Reporting Issues

Naturally we aim to deliver a reliable, well-behaving and well-documented service. Please tell us if you stumble across 
an issue you believe we need to address. We have open sourced our documentation as well so that you can raise issues 
there as well. Please report issues or raise pull requests here:

|Component|Link|Notes
|---|---|---|
|The **API** itself|[github.com/itembase/data-connect-api](https://github.com/itembase/data-connect-api)|Any issues related with our public APIs.|
|This **Guides** section|[github.com/itembase/api-guides/issues](https://github.com/itembase/api-guides/issues)||
|**API Documentation** section|[github.com/itembase/api-swagger/issues](https://github.com/itembase/api-guides/issues)|This is the swagger API explorer. Issues with the swagger-ui can be posted [here](https://github.com/swagger-api/swagger-ui).|

## Sandbox vs Production

* On sandbox, there is  **test user** is called `klaus`.
 * His password is `itembase`. You can use his credentials to log in during OAuth flows.
 * His user id is `13ac2c74-7de3-4436-9a6d-2c94dd2b1fd3`. You can use this for getting data.
 * His Magento shop connection id is `860b3402-6041-4194-bc71-986bf697f23c`.
 * His Magento shop is located at [http://sandbox.magento.dataconnect.io:13001](http://sandbox.magento.dataconnect.io:13001)
 * We have installed this shop for klaus and activated the connection. You can use this connection to try out the POST 
 and PUT /snippets endpoint.
* The examples in this documentation use an access token for an activated, mock service we set up for this purpose. 
You should be able to just copy and paste and run them.
* If you write a client for your application, the application needs to be activated for klaus' connection before you can 
get access to the data via the API. Alternatively, just try out our code examples.
* On the sandbox the activation process needs to be initiated by the API client, not via any GUI. Please refer to the 
"activation" section below.

<aside class="warning">We're working on providing the GUI to initiate the activation process with your registered service, 
replacing the one available on production. We will keep you updated via the developers notes.</aside>

We have separate versions of our services running on our Sandbox and Production systems, see the relevant URLs:

|Type|Production|Sandbox|
|---|---|---|
|OAuth2 auth URL|https://accounts.itembase.com/oauth/v2/auth|https://sandbox.accounts.itembase.io/oauth/v2/auth|
|OAuth2 token URL|https://accounts.itembase.com/oauth/v2/token|https://sandbox.accounts.itembase.io/oauth/v2/token|
|User info URL|https://users.itembase.com/v1/me|https://sandbox.users.itembase.io/v1/me|
|Activation endpoint|https://solutionservice.itembase.com|https://sandbox.solutionservice.itembase.io|
|Connect API endpoint|https://api.dataconnect.io/connect/v2|https://sandbox.dataconnect.io/connect/v2|
|API endpoint|https://api.itembase.io|https://sandbox.api.itembase.io|

Transport in the production system is only via HTTPS.
