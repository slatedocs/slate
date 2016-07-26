# Getting Access
<a name="getting-access"></a>
Since the data offered by our APIs is owned by users, you need to be authorised by them to access it. This can be achieved by implementing two steps:

* An OAuth 2.0 *authorisation code* flow where the user authorises your client 
* The connect API to ask the user to grant you access to certain shops (called *connections*)

In most cases those steps are interchangeable:

![First OAuth, then Connect API](images/connect_api_flow_a.png "Version a of getting access")
![First Connect API, then OAuth](images/connect_api_flow_b.png "Version b of getting access")

## Authorization and authentication with OAuth 2.0

Our auth server at `accounts.itembase.com` combines an OAuth server that follows the standard behaviour described in [the OAuth 2.0 RFC specification](https://tools.ietf.org/html/rfc6749) and a login server for user authentication.

As OAuth 2.0 is a widely used standard, we recommend to use one of the many libraries that implement the flow. Some examples:

* [thephpleague/oauth2-client for PHP](https://github.com/thephpleague/oauth2-client)
* [requests/requests-oauthlib for Python](https://github.com/requests/requests-oauthlib)
* [golang/oauth2 for Go](https://github.com/golang/oauth2)
* [Apache Oltu for Java](https://cwiki.apache.org/confluence/display/OLTU/OAuth+2.0+Client+Quickstart)

You have to follow the `authorization_code` grant type / flow and use the following URLs:

|Type|Production|Sandbox|
|---|---|---|
|Auth URL|https://accounts.itembase.com/oauth/v2/auth|https://sandbox.accounts.itembase.io/oauth/v2/auth|
|Token URL|https://accounts.itembase.com/oauth/v2/token|https://sandbox.accounts.itembase.io/oauth/v2/token|
|User info URL|https://users.itembase.com/v1/me|https://sandbox.users.itembase.io/v1/me|

Continue reading for more information on scopes and user info.

### OAuth 2.0 Scopes

A scope describes what resources you are able to access and in which way (read, create, edit). During the autorization process they are shown to the user in a readable form. Currently itembase supports the following scopes:

|Scope item|Readable form|Description|
|---|---|---|
|user.minimal|Read general user information|Information include e.g. user id, mail address etc. Needed for the /me call after authorization – Should always be included|
|user.instances.read|Request information about itembase components in use|Read activated services of a user|
|user.instances.write|Initiate new connections with itembase components|Activate new services for a user|
|connection.transaction|Read transactions from connected platforms|Get access to transaction data of connected shops|
|connection.product|Read product data from connected platforms|Get access to product data of connected shops|
|connection.profile|Read profile data from connected platforms|Get access to specific account data of a connected shop|
|connection.buyer|Read customer information from connected platforms|Get access to customer data of a connected shop|

The scope is a space seperated list of the scope items listed above. A valid example would be:

```
user.minimal connection.transaction
```

This would give your client access to APIs that return basic user information and transaction data for user defined shop connections.

### Getting basic user information

For almost all API calls at itembase you need a user id. Most OAuth libraries get the basic user information that include 
this for you automatically as soon as you fetched your first access token. In case yours doesn't do that, here's how you 
can do it and how the user response looks like. 

<iframe src="//api.apiembed.com/?source=http://sandbox.static.dataconnect.io/files/get_me.har&targets=shell:curl,node:unirest,java:unirest,python:requests,php:curl,ruby:native,objc:nsurlsession,go:native" frameborder="0" scrolling="no" width="100%" height="300px" seamless></iframe>

This responds with basic user information, one of them is the `uuid` of the itembase user:

```json
{
  "uuid": "13ac2c74-7de3-4436-9a6d-2c94dd2b1fd3",
  "username": "klaus",
  "email": "klaus@trash-mail.com",
  "first_name": "Klaus",
  "middle_name": "Dieter",
  "last_name": "Meier",
  "name_format": "first middle last",
  "locale": "en",
  "preferred_currency": "GBP",
  "password_set": true
}
```

Access tokens and refresh tokens should be securely stored on your server along with the `uuid` they are valid for. You 
can also create a user on your side or match the one that was currently logged in with the data you receive from this call.

### Example: OAuth 2.0 implementation

We strongly recommend to use a standard OAuth 2.0 client library in your application. However, we provide a quick example here in case you still need to follow the actual steps of the OAuth 2.0 flow.

#### Step 1: Authorisation code link

Give this authorisation link to the user (he has to open this in his browser, so you could redirect him there):

```
https://sandbox.accounts.itembase.io/oauth/v2/auth?response_type=code&client_id=CLIENT_ID&scope=user.minimal+connection.transaction&redirect_uri=CALLBACK_URI
```

Here is an explanation of the components of this link:

* **https://sandbox.accounts.itembase.io/oauth/v2/auth**: the OAuth 2.0 authorisation endpoint
* **response_type=code**: specifies that we are using *authorization_code* grant type
* **client_id=CLIENT_ID**: your application's client id
* **scope=user.minimal+connection.transaction**: the url encoded scope (access level) you are requesting
* **redirect_uri=CALLBACK_URI**: the url encoded callback uri where the service will redirect after the code was granted 

#### Step 2: User authorises the application

When a user was redirected to the authorisation URL (step 1), they first log in or register (unless this already happened). After that they will be asked to authorise your application.

#### Step 3: Application receives authorization code

After the user granted access to your application (step 2), the service redirects to the application callback uri that was given in the first step along with an *authorization code*. Assuming that your callback uri is `https://someservice.com/connect` it would look something like this:

```
https://someservice.com/connect?code=AUTHORIZATION_CODE
```

#### Step 4: Application requests Access Token

After the application received the authorization code (step 3), it does a *server side* request to exchange the code with the first Access Token:

```
https://sandbox.accounts.itembase.io/oauth/v2/token?client_id=CLIENT_ID&client_secret=CLIENT_SECRET&grant_type=authorization_code&code=AUTHORIZATION_CODE&redirect_uri=CALLBACK_URI
```

This request **must be done on server side** because you need your client secret. Here is an explanation of the components of this URL:

* **https://sandbox.accounts.itembase.io/oauth/v2/token**: the OAuth 2.0 token endpoint
* **client_id=CLIENT_ID**: your application's client id
* **client_secret=CLIENT_SECRET**: your application's client secret
* **grant_type=authorisation_code**: specifies that we are using an authorization code to get an Access Token
* **code=AUTHORIZATION_CODE**: the authorization code you received
* **redirect_uri=CALLBACK_URI**: the url encoded callback uri (this is just needed for additional security)

#### Step 5: Application receives the Access Token

If the code authorization code was valid, the application receives the first Access Token as a response:

```json
{
  "access_token": "MjU5MGM0YjJkZmIyZDZmZmE3NGQwZGZkMzYxNTBhYjA2M2Vj",
  "expires_in": 2592000,
  "token_type": "bearer",
  "scope": "user.minimal",
  "refresh_token": "ODk3YjA5MjM3YzNjMzQ1NjY5NDZiZGZjMDI2ODQ1NazZ2Vj"
}
```

The token is valid for a given user and will expire after a certain time. With this token you can access our APIs. As most of them require a *user id*, you can also use it to get basic user information (see above).

#### Step 6: Receiving new Access Tokens with Refresh Tokens

When receiving an AccessToken (step 5), it also includes a Refresh Token. Those tokens are valid for much longer than access tokens and can be used to receive new Access Tokens without the user. This requires the following call (*server side*):

```
https://sandbox.accounts.itembase.io/oauth/v2/token?client_id=CLIENT_ID&client_secret=CLIENT_SECRET&grant_type=refresh_token&refresh_token=REFRESH_TOKEN
```

* **https://sandbox.accounts.itembase.io/oauth/v2/token**: the OAuth 2.0 token endpoint
* **client_id=CLIENT_ID**: your application's client id
* **client_secret=CLIENT_SECRET**: your application's client secret
* **grant_type=refresh_token**: specifies that we are using a refresh token to get an Access Token
* **refresh_token=REFRESH_TOKEN**: the refresh token you received

This will respond with a new pair of Access Token and Refresh Token (see step 5). Please note that the new refresh token **replaces** the old one!

## Getting access to connection data

To get access to connection data you need to use [Connect API](https://swaggerhub.com/api/thommy/connect_api/2.0). 

The Connect API works with three entities:

* `Connectors`, which describe a platform available through our APIs (e.g. eBay)
* `Connections`, which describe single instances of `Connectors` that are owned by a user (e.g. the eBay store of a single user)
* `Links`, which describe a data flow between two `Connections` (e.g. the eBay store of a single user is `linked` to your solution, so you receive data from it) 

Each connector at itembase is described with a so-called component ID. The following core connectors are currently supported:

|Connector|Component id production|Component id sandbox|
|---|---|---|
|eBay|6|6|
|Shopify|7|n/a|
|SEO shop|20|n/a|
|Big Commerce|12|n/a|
|Magento|11|30|
|Prestashop|14|14|
|Gambio|34|n/a|
|WooCommerce|22|n/a|
|Virtuemart|23|n/a|

### Possible use cases

By combining the connect API and the authorisation (see above) in the right way, the following flows are possible:

1. Authenticating a user (sign up or login) for your client ("Login with itembase")
1. Authorising a user (sign up or login) for your client with a certain Connector (e.g. "Login with eBay")
1. Getting all available Connections owned by an already authorised user
1. Asking an already authorised user to link an existing or a new Connection to your Solution

Lets take a look at some examples.

### Example 1: Add an ebay store to an authorised user

Prerequisites:

* You already obtained an access token for an authorised user via the OAuth flow
* You obtained the existing connections and/or links of a user

As an example how to get user connections you can do the following for `klaus`:

<iframe src="//api.apiembed.com/?source=http://sandbox.static.dataconnect.io/files/get_user_connections.har&targets=shell:curl,node:unirest,java:unirest,python:requests,php:curl,ruby:native,objc:nsurlsession,go:native" frameborder="0" scrolling="no" width="100%" height="300px" seamless></iframe>

For more details refer to [Connect API documentation](https://swaggerhub.com/api/siib/sandbox-connect-api/2.0).

Now let's add user store:

<iframe src="//api.apiembed.com/?source=http://sandbox.static.dataconnect.io/files/post_link2.har&targets=shell:curl,node:unirest,java:unirest,python:requests,php:curl,ruby:native,objc:nsurlsession,go:native" frameborder="0" scrolling="no" width="100%" height="300px" seamless></iframe>

This will activate your client for the existing eBay store with connection ID `SOME-UUID` by user `SOME-USER-ID`

As your own client also has a connector id, this will be automatically added:

```json
{
  "id": "cc51d6f69ac4c5d00fa0af05aaa977201c432248",
  "connections": [
    {
      "id": "SOME-UUID",
      "connector_id": 6,
      "status": "connection.valid"
    },
    {
      "id": null,
      "connector_id": 1467287667226799671,
      "status": "connection.pending"
    }
  ],
  "expires_in": 1200,
  "_links": [
    {
      "rel": "self",
      "href": "/connect/v2/links/cc51d6f69ac4c5d00fa0af05aaa977201c432248"
    },
    {
      "rel": "process",
      "href": "/connect/v2/process/links/cc51d6f69ac4c5d00fa0af05aaa977201c432248"
    }
  ]
}
```

To continue, you have to redirect the user to the URL given in the `links` section as `process`. You should also provide 
a `redirect_uri` as GET parameter when redirecting there. The value for `redirect_uri` must be url-encoded.

If given, this is where the user will be lead when the process finished. The token will be added as the GET parameter `iblink`.

Sometimes there might some error happened in between, so you may also receive error message via GET parameter `error`.

**The token is only valid for a limited amount of time, given in <i>expires_in</i>.**

### Example 2: Signing up a new user with eBay

<aside class="warning">The feature is currently in BETA and might not be stable</aside>

Prerequisites: you have a client id to use the dataconnect API. If not - just [create one](https://api.itembase.com/google-login) 

<iframe src="//api.apiembed.com/?source=http://sandbox.static.dataconnect.io/files/post_link.har&targets=shell:curl,node:unirest,java:unirest,python:requests,php:curl,ruby:native,objc:nsurlsession,go:native" frameborder="0" scrolling="no" width="100%" height="300px" seamless></iframe>

This will:

* Authenticate a user
* Add a new eBay (connector id 6) store to their account
* Activate your client for the new eBay store

As your own client also has a connector id, this will be automatically added:

```json
{
  "id": "cc51d6f69ac4c5d00fa0af05aaa977201c432248",
  "connections": [
    {
      "id": null,
      "connector_id": 6,
      "status": "connection.pending"
    },
    {
      "id": null,
      "connector_id": 1467287667226799671,
      "status": "connection.pending"
    }
  ],
  "expires_in": 1200,
  "_links": [
    {
      "rel": "self",
      "href": "/connect/v2/links/cc51d6f69ac4c5d00fa0af05aaa977201c432248"
    },
    {
      "rel": "process",
      "href": "/connect/v2/process/links/cc51d6f69ac4c5d00fa0af05aaa977201c432248"
    }
  ]
}
```

<aside class="warning">The link is only valid for a limited amount of time, given in <i>expires_in</i>.</aside>

To continue, you have to redirect the user to the URL given in the `links` section as `process`. You should also provide 
a `redirect_uri` as GET parameter when redirecting there. The value for `redirect_uri` must be url-encoded.

If given, this is where the user will be lead when the process finished. The token will be added as the GET parameter `iblink`.

Sometimes there might some error happened in between, so you may also receive error message via GET parameter `error`.

**After that you want to trigger the OAuth flow immediately as this didn't happen yet.**
