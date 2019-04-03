## Authentication Basics
Asana supports a few methods of authenticating with the API.

 * **[OAuth 2.0](#oauth)** We require that applications designed to access the Asana API on behalf of multiple users implement OAuth 2.0.
 * **[Personal Access Token](#personal-access-token)** Personal Access Tokens are designed for accessing the API from the command line or from personal applications.

<a name="oauth" class="jump-anchor"></a>

### OAuth

Most of the time, OAuth is the preferred method of authentication for developers, users, and Asana as a platform.
If you're new to OAuth, take a moment to learn about it here. It's not as scary as you might think!

In addition to learning about how to use OAuth on the Asana platform here, feel free to take a look at the [official OAuth spec][oauth-spec]!

At its core, OAuth is a mechanism for applications to access the Asana API on behalf of a user without the application having
access to the username and password. Instead, apps get a token which they can use with their own application credentials
to make API calls.

<a name="what-is-oauth" class="jump-anchor"></a>
### What is OAuth?

If you're using a library to handle this or already understand OAuth and have
[registered an OAuth application](#register-an-app), you may want to skip ahead to the [quick reference](#quick-reference).

1. If you have not already, you will need to [register an application](#register-an-app). Take note of
the **client ID**, an application's username, and the **client secret**, an application's password (protect it like one)!

2. A user will arrive at your application and click a button that says "Connect with Asana."

3. This takes the customer to the [User Authorization Endpoint](#user-authorization), which displays a page
asking the user if they would like to grant access to your third-party application.

4. If the customer clicks "Allow", they are redirected back to the application, bringing along a special code as a
query parameter. (We are assuming the [Authorization Code Grant](#authorization-code-grant) flow, which is the most common.)

5. The application can now use the [Token Exchange Endpoint](#token-exchange) to exchange the code, together
with the Client Secret, for a Bearer Token (which lasts an hour) and a Refresh Token (which can be used to fetch new
Bearer Tokens when the current one expires).

6. The application can make requests of the API using this Bearer Token for the next hour.

7. Once the Bearer Token expires, the application can again use the Token Exchange Endpoint to exchange the Refresh
Token for a new Bearer Token. (This can be repeated for as long as the user has authorized the application.)

This is just one example using the Authorization Code Grant - applications that run entirely in the browser would
generally use the [Implicit Grant](#implicit-grant) flow instead.

We definitely recommend using a library to take care of the nitty-gritty of OAuth, but hopefully this helps demystify
the process somewhat.

<a name="register-an-app" class="jump-anchor"></a>
### [Register an Application](#register-an-app)

You must first register your application with Asana to receive a client ID and client secret. Fortunately, this process
is fast and easy: <a href="https://app.asana.com/-/account_api" target="_blank" rel="noopener noreferrer"> visit your Account Settings dialog</a>,
click the Apps tab, and "**Add New Application**".

You must supply your new application with:

 * **App Name** - A name for your application. A user will see this name when your application requests permission to access
  their account as well as when they review the list of apps they have authorized.
 * **App URL** - The URL where users can access your application or, in the case of native applications, this can be a link
 to setup or support instructions. Note that this URL must start with "http" or "https".
 * **Redirect URL** - As described in the OAuth specification, this is where the user will be redirected upon successful
  or failed authentications. Native or command line applications should use the special redirect URL
  `urn:ietf:wg:oauth:2.0:oob`. For security reasons, non-native applications **must** supply a "https" URL (more on this below).
 * **Icon** - Optionally, you can upload an icon to enhance the recognizability of the application when users are
 authenticating.

Note that all of these attributes can be changed later, so don't worry too much right away.

Once you have created an app, the details view will include a Client ID, needed to uniquely identify your app to
the Asana API, as well as a Client Secret.

**Note** Your Client Secret is a *secret*, it should never be shared with anyone or checked into source code that others could gain access to.

<a name="quick-reference" class="jump-anchor"></a>
### Quick Reference

* Applications can be created from the ["Apps" tab of your account settings](https://app.asana.com/-/account_api), where you will find your Client ID and Client Secret.
* The endpoint for user authorization is `https://app.asana.com/-/oauth_authorize`
* The endpoint for token exchange is `https://app.asana.com/-/oauth_token`
* Asana supports both the Authorization Code Grant flow, and the Implicit Grant flows.
* Once an access token has been obtained your application can make calls on behalf of the user in the following form:

        curl -H "Authorization: Bearer ACCESS_TOKEN" https://app.asana.com/api/1.0/users/me

<a name="user-authorization" class="jump-anchor"></a>
### User Authorization Endpoint

#### Request

Your app redirects the user to `https://app.asana.com/-/oauth_authorize`, passing parameters along as a standard query string:

| Parameter | Description |
|---|---|
| **client_id** |  *required* The Client ID uniquely identifies the application making the request. |
| **redirect_uri** | *required* The URI to redirect to on success or error. This *must* match the Redirect URL specified in the application settings. |
| **response_type** | *required* Must be one of `code`, `token`, `id_token`, or the space-delimited combination `token id_token`. |
| **state** | *required* Encodes state of the app, which will be returned verbatim in the response and can be used to match the response up to a given request. |
| **scope** | *optional* A space-delimited set of one or more [scopes](#scopes) to get the user's permission to access. Defauts to the `default` OAuth scope if no scopes are specified. |

#### Response

If either the `client_id` or `redirect_uri` do not match, the user will simply see a plain-text error. Otherwise,
all errors will be sent back to the `redirect_uri` specified.

The user then sees a screen giving them the opportunity to accept or reject the request for authorization. In either
case, the user will be redirected back to the `redirect_uri`.

If using the `response_type=code`, your app will receive the following parameters in the query string on successful authorization.
If using the `response_type=token`, these parameters will appear in the URL fragment (the bit following the `#`):

| Parameter | Description |
|---|---|
| **code** | If response_type=code in the request, this is the code your app can exchange for a token |
| **token** | If response_type=token in the request, this is the token your app can use to make requests of the API |
| **state** | The state parameter that was sent with the authorizing request |

<a name="scopes" class="jump-anchor"></a>
### OAuth Scopes

The Asana API supports a small set of OAuth scopes you can request using the
`scope` parameter during the user authorization step of your authentication
flow. Multiple scopes can be requested at once as a space-delimited list of
scopes. An exhaustive list of the supported scopes is provided here:

| Scope | Access provided |
|---|---|
| `default` | Provides access to all endpoints documented in our [API reference](/developers/api-reference). If no scopes are requested, this scope is assumed by default. |
| `openid` | Provides access to [OpenID Connect ID tokens](#openid-connect) and the [OpenID Connect](#openid-connect) user info endpoint. |
| `email` | Provides access to the user's email through the [OpenID Connect](#openid-connect) user info endpoint. |
| `profile` | Provides access to the user's name and profile photo through the [OpenID Connect](#openid-connect) user info endpoint. |

<a name="token-exchange" class="jump-anchor"></a>
### Token Exchange Endpoint

#### Request

If your app received a code from the authorization endpoint, it can now be
exchanged for a proper token, optionally including a *refresh_token*, which can
be used to request new tokens when the current one expires without needing to
redirect or reauthorize the user.

Your app should make a `POST` request to `https://app.asana.com/-/oauth_token`,
passing the parameters as part of a standard form-encoded post body.

| Parameter | Description |
|---|---|
| **grant_type** | *required* One of `authorization_code` or `refresh_token`. See below for more details.|
| **client_id** | *required* The Client ID uniquely identifies the application making the request. |
| **client_secret** | *required* The Client Secret belonging to the app, found in the details pane of the developer console. |
| **redirect_uri** | *required* Must match the `redirect_uri` specified in the original request. |
| **code** | *sometimes required* If `grant_type=authorization_code` this is the code you are exchanging for an authorization token. |
| **refresh_token** | *sometimes required* If `grant_type=refresh_token` this is the refresh token you are using to be granted a new access token. |

The token exchange endpoint is used to exchange a code or refresh token for an access token.

#### Response

In the response, you will receive a JSON payload with the following parameters:

| Parameter | Description |
|---|---|
| **access_token** | The token to use in future requests against the API |
| **expires_in** | The number of seconds the token is valid, typically 3600 (one hour) |
| **token_type** | The type of token, in our case, `bearer` |
| **refresh_token** | If exchanging a code, a long-lived token that can be used to get new access tokens when old ones expire. |
| **data** | A JSON object encoding a few key fields about the logged-in user, currently `id`, `name`, and `email`. |

<a name="authorization-code-grant" class="jump-anchor"></a>
### Authorization Code Grant

To implement the Authorization Code Grant flow (the most typical flow for most applications), there are three steps:

1. Send the user to the authorization endpoint so that they can approve access of your app to their Asana account

        # Send the user to the authorization endpoint. Newlines inserted for readability
        https://app.asana.com/-/oauth_authorize?
        client_id=123&
        redirect_uri=https://myapp.com/oauth
        &response_type=code
        &state=somerandomstate

2. Receive a redirect back from the authorization endpoint with a **code** embedded in the parameters

        # After the user authenticates they will redirected back to your app with a code for your app to exchange.
        # Newlines inserted for readability
        https://myapp.com/oauth?
        code=0%2F817a776a358a5d8d89988562d2b3dc8f&
        state=somerandomstate

3. Exchange the code for a **token** via the token exchange endpoint

The token that you have at the end can be used to make calls to the Asana API on the user's behalf.

<a name="implicit-grant" class="jump-anchor"></a>
### Implicit Grant

The Implicit Grant flow is suitable for in-browser web apps written in
JavaScript or other applications that cannot securely make the `POST` request
containing the client secret to the authorization server without exposing that
secret to the user or others. To implement this flow, there are only two steps:

1. Redirect a user to the authorization endpoint so that they can approve access of your app to their Asana account

        # Send the user to the authorization endpoint. Newlines inserted for readability
        https://app.asana.com/-/oauth_authorize?
        client_id=123&
        redirect_uri=https://myapp.com/oauth&
        response_type=token&
        state=somerandomstate

2. Receive a redirect back from the authorization endpoint with a **token** embedded in the *fragment* portion (the bit following the `#`) of the URL.

        # After the user authenticates they will redirected back to your app with a short-lived access token.
        https://myapp.com/auth#
        access_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdXRob3JpemF0aW9uIjo0NDMxMDYwMjQwODA0Niwic2NvcGUiOiIiLCJpYXQiOjE0Mzg4OTExODEsImV4cCI6MTQzODg5NDc4MX0.kVm8MWD8ahU4hMxT7B7ZrsgAEAw5ebb1yknXlskGfeM&
        token_type=bearer&
        expires_in=3600&
        data=&
        state=somerandomstate

This token can then be used to access the API, in this case typically using CORS.

<a name="secure-redirect" class="jump-anchor"></a>
### Secure Redirect Endpoint

As the redirect from the authorization endpoint in either grant procedure contains a code that is secret between Asana's
authorization servers and your application, this response should not occur in plaintext over an unencrypted `http` connection.
Asana is deprecating this behavior. We're enforcing the use of `https` redirect endpoints for new application registrations, and will soon stop calling back to
`http` apps during the authorization process.

For non-production or personal use, you may wish to check out [stunnel](https://www.stunnel.org/index.html), which can act as a proxy
to receive an encrypted connection, decrypt it, and forward it on to your application. For development work, you may wish to create a
self-signed SSL/TLS certificate for use with your web server; for production work we recommend purchasing a certificate from a
[certificate authority](https://en.wikipedia.org/wiki/Certificate_authority). A short summary of the steps for each of these processes
can be read [here](https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs).

Your application will need to be configured to accept SSL/TLS connections for your redirect endpoint when users become authenticated, but
for many apps, this will simply require a configuration update of your application server. Instructions for
[Apache](https://httpd.apache.org/docs/2.4/ssl/ssl_howto.html) and [Nginx](http://nginx.org/en/docs/http/configuring_https_servers.html)
can be found on their respective websites, and most popular application servers will contain documentation on how to proceed.

<a name="personal-access-token" class="jump-anchor"></a>
### Personal Access Token

Personal Access Tokens are a useful mechanism for accessing the API in scenarios where OAuth would be considered
overkill, such as access from the command line and personal scripts or applications. A user can create many, but not
unlimited, personal access tokens. When creating a token you must give it a description to help you remember what you
created the token for.

Personal Access Tokens should be used similarly to OAuth access tokens when accessing the API, passing them in the
Authorization header:

    curl -H "Authorization: Bearer ACCESS_TOKEN" https://app.asana.com/api/1.0/users/me

You should regularly review the list of personal access tokens you have created and **deauthorize** those that you no
longer need.

**Note**: Remember to keep your tokens secret; treat them just like passwords! They act on your behalf when interacting
with the API. *Don't hardcode them into your programs*; instead, opt to use them as environment variables.

<a name="openid-connect" class="jump-anchor"></a>
### OpenID Connect

Asana also supports the [OpenID Connect](https://openid.net/connect/) protocol for authenticating Asana users with your
applications. This means that, in addition to the normal `code` and `token` response types for the OAuth flow, you can
also use the `id_token` response type. 

For this response type, you are not granted an access token for the API, but
rather given a signed [Json Web Token](https://jwt.io/) containing the user's ID along with some metadata. If you want
to allow users to log into your services using their Asana account, the OpenID Connect protocol is an ideal way to
authenticate an Asana user. To obtain an ID token, you must request the `openid` scope during the authentication flow.

It is also possible to obtain an ID token alongside the normal access token in the implicit flow by using the
(space-delimited) `token id_token` response type, or alongside an authorization code in the authorization code grant
flow by using the (again space-delimited) `code id_token` response type. If you do, the redirect parameters will include
the ID token in addition to everything you would normally receive.

To access additional information about the user in a standardized format, we also expose a
[user info endpoint](https://openid.net/specs/openid-connect-core-1_0.html#UserInfo) that can provide the user's name,
email address, and profile photo. This data is available by making a `GET` request to
`https://app.asana.com/api/1.0/openid-connect/userinfo` with an OAuth access token that has the `openid` scope.
Depending on the scopes tied to that token, you will receive different pieces of data. Refer to our
[list of OAuth scopes](#scopes) to determine which additional scopes you need to get the data you want.

Metadata about our OpenID Connect implementation is also made available through OpenID Connect's
[discovery protocol](https://openid.net/specs/openid-connect-discovery-1_0.html). Making an unauthenticated `GET`
request to `https://app.asana.com/api/1.0/.well-known/openid-configuration` will provide all the details of our
implementation necessary for you to use OpenID Connect with Asana's API.


[client libraries]: ./client-libraries
[omniauth]: https://github.com/intridea/omniauth
[oauth-spec]: http://tools.ietf.org/html/draft-ietf-oauth-v2-31
