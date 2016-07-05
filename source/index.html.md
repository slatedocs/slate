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

Our API connects eCommerce services and platforms to each other. We do this by standardizing and normalizing data like transactions and products using [Json schemas](#entities). We also use OAuth2 for auth and built our API in a RESTful manner.

We have built multiple _connectors_ to platforms like eBay, Prestashop and even Gmail. Imagine you want to get all the orders stored inside a Prestashop installation, all you have to do is to initiate an _activation flow_ via our platform, activating our _Prestashop connector_ for the shop owner on the one hand, and activating your service on the other. You can repeat this process for as many connectors as you like without having to deal with platform specifics like formats, authentication, api limitations etc. Our connectors and transformers aim to provide a consistent and user-friendly interface to ALL and ANY eCommerce data.

**To use the full potential of our platform**, you want to learn about [getting access](#getting-access) and [reading and writing data](#reading-and-writing-data). You also want to [create a user account](https://api.itembase.com/google-login) and then [register your application](https://api.itembase.com/api/clients) to get a client_id.

**For a quickstart**, you can just copy and paste the code samples we provide below. These code samples run _getting data_-queries with a predefined user that as has an activated connection and authorized access especially for you.


## Summary

1. To use any API provided by itembase, you have to [register your client](/api/clients) with our servers.
2. To get authorized API access via OAuth 2.0, or to use the itembase API as a sign-on service, [you need to authorize](auth) with this information:
 * A *client id* which identifies your client with the server (one for sandbox, one for production)
 * A *client secret* which you use to perform certain operations during auth process <aside class="warning">keep it in a safe place and **never expose it** to a client</aside>
 * One or more *redirect uris* (on your side) that can be used to send an auth code to you – there is a restricted set of URLs per client
We are following the Oauth2 standard. Check out [this excellent video tutorial by KnpUniversity](https://www.youtube.com/watch?v=io_r-0e3Qcw) which explains OAuth2 very well.<a style="float:right" href="https://www.youtube.com/watch?v=io_r-0e3Qcw" target="_blank"><img src="http://img.youtube.com/vi/io_r-0e3Qcw/0.jpg" alt="OAuth2 in 8 Steps Tutorial by KnpUniversity" width="250" border="5" /></a>
 * You can use the sandbox user "klaus" with password "itembase" for fooling around in the sandbox.
3. By default, only the basic user information is available to you even if you have gained the user's authorization. Therefore you may want to activate the data flow from the data connector to the API. To complete this process, you need:
 * An additional *redirect uri* that is known on our side and where the activation endpoint will redirect after the process finished.
 * Each entity (e.g. /users/{user_id}/transaction) is a valid endpoint. Please refer to the [entities section](#entities) for a list of entities and their json schema definitions.
<aside class="success">Entities that originate from the same data connection have the same <i>source_id</i> attribute.</aside>

## Reporting Issues
Naturally we aim to deliver a reliable, well-behaving and well-documented service. Please tell us if you stumble across an issue you believe we need to address. We have open sourced our documentation as well so that you can raise issues there as well. Please report issues or raise pull requests here:

|Component|Link|Notes
|---|---|---|
|The **API** itself|[github.com/itembase/data-connect-api](https://github.com/itembase/data-connect-api)|Any issues related with our public APIs.|
|*This* **Guides** section|[github.com/itembase/api-guides/issues](https://github.com/itembase/api-guides/issues)||
|**API Documentation** section|[github.com/itembase/api-swagger/issues](https://github.com/itembase/api-guides/issues)|This is the swagger API explorer. Issues with the swagger-ui can be posted [here](https://github.com/swagger-api/swagger-ui).|

## Sandbox vs Production

* On sandbox, there is  **test user** is called `klaus`.
 * His password is `itembase`. You can use his credentials to log in during OAuth flows.
 * His user id is `13ac2c74-7de3-4436-9a6d-2c94dd2b1fd3`. You can use this for getting data.
 * His Magento shop connection id is `860b3402-6041-4194-bc71-986bf697f23c`.
 * His Magento shop is located at `http://sandbox.magento.itembase.io:13001/`
 * We have installed this shop for klaus and activated the connection. You can use this connection to try out the POST and PUT /snippets endpoint.
* The examples in this documentation use an access token for an activated, mock service we set up for this purpose. You should be able to just copy and paste and run them.
* If you write a client for your application, the application needs to be activated for klaus' connection before you can get access to the data via the API. Alternatively, just try out our code examples.
* On the sandbox the activation process needs to be initiated by the API client, not via any GUI. Please refer to the "activation" section below.

<aside class="success">We're working on providing a graphical user interface to initiate the actication process with your registered service, replacing the user interface we currently have on production. We will keep you updated via the developers notes.</aside>

We have separate versions of our services running on our Sandbox and Production systems, see the relevant URLs here:


|Type|Production|Sandbox|
|---|---|---|
|OAuth2 auth URL|https://accounts.itembase.com/oauth/v2/auth|http://sandbox.accounts.itembase.io/oauth/v2/auth|
|OAuth2 token URL|https://accounts.itembase.com/oauth/v2/token|http://sandbox.accounts.itembase.io/oauth/v2/token|
|User info URL|https://users.itembase.com/v1/me|http://sandbox.users.itembase.io/v1/me|
|Activation endpoint|https://solutionservice.itembase.com|http://sandbox.solutionservice.itembase.io|
|Connect API endpoint|https://api.dataconnect.io/connect/v2|https://sandbox.dataconnect.io/connect/v2|
|API endpoint|https://api.itembase.io|http://sandbox.api.itembase.io|

Transport in the production system is over HTTPS.
