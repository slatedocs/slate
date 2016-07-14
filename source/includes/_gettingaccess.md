# Getting Access
<a name="getting-access"></a>
The data offered by us are owned by users. To get access to it, you need to be authorised by them. This is handled by an 
OAuth 2.0 based authorisation process. Using our connect API you can then ask the user to grant you access to certain 
shops (called *connections*).

## Authorization and authentication

Our auth server at `accounts.itembase.com` combines an OAuth server that follows the standardized behaviour described 
in [the OAuth 2.0 RFC specification](https://tools.ietf.org/html/rfc6749) and a login server for user authentication.

As OAuth 2.0 is a widely used standard, we recommend to use one of the many libraries that implement the flow. Some examples:

* [thephpleague/oauth2-client for PHP](https://github.com/thephpleague/oauth2-client)
* [requests/requests-oauthlib for Python](https://github.com/requests/requests-oauthlib)
* [golang/oauth2 for Go](https://github.com/golang/oauth2)
* [Apache Oltu for Java](https://cwiki.apache.org/confluence/display/OLTU/OAuth+2.0+Client+Quickstart)

You have to follow the `authorization_code` grant type / flow.

### Scopes

A scope describes what resources you are able to access and in which way (read, create, edit). During the autorization 
process they are shown to the user in a readable form. Currently itembase supports the following scopes:

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

This would give your client access to APIs that return basic user information and transaction data for user defined shop 
connections.

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

## Getting access to connection data

To get access to connection data you need to use [Connect API](https://swaggerhub.com/api/siib/sandbox-connect-api/2.0). 

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
