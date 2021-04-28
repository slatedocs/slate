<hr>
<section>

# Authentication
<a id="authentication-basics"></a>

<span class="description">
Asana supports a few methods of authenticating with the API. Simple cases are usually handled with a Personal Access Token, while multi-user apps utilize OAuth.
</span>

```shell
!
"Authorization: Bearer ACCESS_TOKEN"
```

 * **[OAuth 2.0](/docs/oauth)** We require that applications designed to access the Asana API on behalf of multiple users implement OAuth 2.0.
 * **[Personal Access Token](/docs/personal-access-token)** Personal Access Tokens are designed for accessing the API from the command line or from personal applications.

<a name="oauth" class="jump-anchor"></a>

## OAuth

Most of the time, OAuth is the preferred method of authentication for developers, users, and Asana as a platform.
If you're new to OAuth, take a moment to learn about it here. It's not as scary as you might think!

In addition to learning about how to use OAuth on the Asana platform here, feel free to take a look at the [official OAuth spec][oauth-spec]!

At its core, OAuth is a mechanism for applications to access the Asana API on behalf of a user without the application having
access to the username and password. Instead, apps get a token which they can use with their own application credentials
to make API calls.

<a name="what-is-oauth" class="jump-anchor"></a>
### What is OAuth?

If you're using a library to handle this or already understand OAuth and have
[registered an OAuth application](/docs/register-an-application), you may want to skip ahead to the [quick reference](/docs/quick-reference).

1. If you have not already, you will need to [register an application](/docs/register-an-application). Take note of
the **client ID**, an application's username, and the **client secret**, an application's password (protect it like one)!

2. A user will arrive at your application and click a button that says "Connect with Asana."

3. This takes the customer to the [User Authorization Endpoint](/docs/user-authorization-endpoint), which displays a page
asking the user if they would like to grant access to your third-party application.

4. If the customer clicks "Allow", they are redirected back to the application, bringing along a special code as a
query parameter. (We are assuming the [Authorization Code Grant](/docs/authorization-code-grant) flow, which is the most common.)

5. The application can now use the [Token Exchange Endpoint](/docs/token-exchange-endpoint) to exchange the code, together
with the Client Secret, for a Bearer Token (which lasts an hour) and a Refresh Token (which can be used to fetch new
Bearer Tokens when the current one expires).

6. The application can make requests of the API using this Bearer Token for the next hour.

7. Once the Bearer Token expires, the application can again use the Token Exchange Endpoint to exchange the Refresh
Token for a new Bearer Token. (This can be repeated for as long as the user has authorized the application.)

We definitely recommend using a library to take care of the details of OAuth, but hopefully this helps demystify
the process somewhat.

<a name="register-an-application" class="jump-anchor"></a>
### Register an Application

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
* The endpoint for revoking a token is `https://app.asana.com/-/oauth_revoke`
* Asana supports the Authorization Code Grant flow.
* Once an access token has been obtained your application can make calls on behalf of the user

<a name="user-authorization" class="jump-anchor"></a>
### User Authorization Endpoint

#### Request

> Send a user to oauth_authorize

```html
<a href="https://app.asana.com/-/oauth_authorize
?client_id=753482910
&redirect_uri=https://my.app.com
&response_type=code
&state=thisIsARandomString
&code_challenge_method=S256
&code_challenge=671608a33392cee13585063953a86d396dffd15222d83ef958f43a2804ac7fb2
&scope=default">Authenticate with Asana</a>
```

Your app redirects the user to `https://app.asana.com/-/oauth_authorize`, passing parameters along as a standard query string:

| Parameter | Description |
|---|---|
| **client_id** |  *required* The Client ID uniquely identifies the application making the request. |
| **redirect_uri** | *required* The URI to redirect to on success or error. This *must* match the Redirect URL specified in the application settings. |
| **response_type** | *required* Must be either `code` or `id_token`, or the space-delimited combination `code id_token`. |
| **state** | *optional* Encodes state of the app, which will be returned verbatim in the response and can be used to match the response up to a given request. |
| **code_challenge_method** | *PKCE* The hash method used to generate the challenge. Typically `S256`. |
| **code_challenge** | *PKCE* The code challenge used for [PKCE](/docs/proof-key-for-code-exchange-pkce-oauth-extension). |
| **scope** | *optional* A space-delimited set of one or more [scopes](/docs/oauth-scopes) to get the user's permission to access. Defaults to the `default` OAuth scope if no scopes are specified. |


#### Response

If either the `client_id` or `redirect_uri` do not match, the user will simply see a plain-text error. Otherwise,
all errors will be sent back to the `redirect_uri` specified.

The user then sees a screen giving them the opportunity to accept or reject the request for authorization. In either
case, the user will be redirected back to the `redirect_uri`.

> User is redirected to the redirect_uri

```
https://my.app.com?code=325797325&state=thisIsARandomString
```

When using the `response_type=code`, your app will receive the following parameters in the query string on successful authorization.

| Parameter | Description |
|---|---|
| **code** | If response_type=code in the request, this is the code your app can exchange for a token |
| **state** | The state parameter that was sent with the authorizing request |

You should check that the state is the same in this response as it was in the request. You can read more about the `state`
parameter [here](https://auth0.com/docs/protocols/oauth2/oauth-state).

<a name="scopes" class="jump-anchor"></a>
### OAuth Scopes

The Asana API supports a small set of OAuth scopes you can request using the
`scope` parameter during the user authorization step of your authentication
flow. Multiple scopes can be requested at once as a space-delimited list of
scopes. An exhaustive list of the supported scopes is provided here:

| Scope | Access provided |
|---|---|
| **default** | Provides access to all endpoints documented in our [API reference](/docs/asana). If no scopes are requested, this scope is assumed by default. |
| **openid** | Provides access to [OpenID Connect ID tokens](/docs/openid-connect) and the [OpenID Connect](/docs/openid-connect) user info endpoint. |
| **email** | Provides access to the user's email through the [OpenID Connect](/docs/openid-connect) user info endpoint. |
| **profile** | Provides access to the user's name and profile photo through the [OpenID Connect](/docs/openid-connect) user info endpoint. |

<a name="token-exchange" class="jump-anchor"></a>
### Token Exchange Endpoint

#### Request

When your app receives a code from the authorization endpoint, it can now be
exchanged for a proper token.

If you have a `client_secret`, this request should be sent from your secure server.
The browser should never see your `client_secret`.

> App sends request to oauth_token

```json
{
  "grant_type": "authorization_code",
  "client_id": "753482910",
  "client_secret": "6572195638271537892521",
  "redirect_uri": "https://my.app.com",
  "code": "325797325",
  "code_verifier": "fdsuiafhjbkewbfnmdxzvbuicxlhkvnemwavx"
}
```

Your app should make a `POST` request to `https://app.asana.com/-/oauth_token`,
passing the parameters as part of a standard form-encoded post body.

| Parameter | Description |
|---|---|
| **grant_type** | *required* One of `authorization_code` or `refresh_token`. See below for more details.|
| **client_id** | *required* The Client ID uniquely identifies the application making the request. |
| **client_secret** | *required* The Client Secret belonging to the app, found in the details pane of the developer console. |
| **redirect_uri** | *required* Must match the `redirect_uri` specified in the original request. |
| **code** | *required* This is the code you are exchanging for an authorization token. |
| **refresh_token** | *sometimes required* If `grant_type=refresh_token` this is the refresh token you are using to be granted a new access token. |
| **code_verifier** | *PKCE* This is the string previously used to generate the code_challenge. |

The token exchange endpoint is used to exchange a code or refresh token for an access token.

#### Response

In the response, you will receive a JSON payload with the following parameters:

```json
{
  "access_token": "f6ds7fdsa69ags7ag9sd5a",
  "expires_in": 3600,
  "token_type": "bearer",
  "refresh_token": "hjkl325hjkl4325hj4kl32fjds",
  "data": {
    "id": "4673218951",
    "name": "Greg Sanchez",
    "email": "gsanchez@example.com"
  }
}
```

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

2. Receive a redirect back from the authorization endpoint with a **code** embedded in the parameters

3. Exchange the code via the token exchange endpoint for a `**refresh_token**` and, for convenience, an initial 
   `access_token`.

4. When the short-lived `access_token` expires, the `**refresh_token**` can be used with the token exchange endpoint, 
   without user intervention, to get a fresh `access_token`.

The token that you have at the end can be used to make calls to the Asana API on the user's behalf.

### Proof Key for Code Exchange (PKCE) OAuth Extension

> User Authorization Endpoint

```json
{
  ...
  "code_challenge": "671608a33392cee13585063953a86d396dffd15222d83ef958f43a2804ac7fb2",
  "code_challenge_method": "S256"
}
```

> Token Exchange Endpoint

```json
{
  ...
  "code_verifier": "fdsuiafhjbkewbfnmdxzvbuicxlhkvnemwavx"
}
```

PKCE proves the app that started the authorization flow is the same app that finishes the flow. You can read more about 
it [here](https://www.oauth.com/oauth2-servers/pkce/).

Here's what you need to know:

1. Whenever a user wants to OAuth with Asana, your app server should generate a random string called the 
   `code_verifier`. This string should be saved to the user (as every `code_verifier` should be unique per user). This
   should stay on the app server and only be sent to the [Token Exchange Endpoint](/docs/token-exchange-endpoint).
   
2. Your app server will hash the `code_verifier` with SHA256 to get a string called the `code_challenge`. Your server
   will give the browser **only** the `code_challenge` & `code_challenge_method`. The `code_challenge_method` should be
   the string "S256" to tell Asana we hashed with SHA256. More specifically, code_challenge = 
   BASE64URL-ENCODE(SHA256(ASCII(code_verifier))).
   
3. The browser includes `code_challenge` & `code_challenge_method` when redirecting to the 
   [User Authorization Endpoint](/docs/user-authorization-endpoint).
   
4. The app server should include the `code_verifier` in it's request to the 
   [Token Exchange Endpoint](/docs/token-exchange-endpoint).
   
Asana confirms that hashing the `code_verifier` with the `code_challenge_method` results in the `code_challenge`. This 
proves to Asana the app that hit the User Authorization Endpoint is the same app that hit the Token Exchange 
Endpoint.

<a name="secure-redirect" class="jump-anchor"></a>
### Secure Redirect Endpoint

As the redirect from the authorization endpoint in either grant procedure contains a code that is secret between Asana's
authorization servers and your application, this response should not occur in plaintext over an unencrypted `http` connection.
Because of this, we enforce the use of `https` redirect endpoints for application registrations.

For non-production or personal use, you may wish to check out [stunnel](https://www.stunnel.org/index.html), which can act as a proxy
to receive an encrypted connection, decrypt it, and forward it on to your application. For development work, you may wish to create a
self-signed SSL/TLS certificate for use with your web server; for production work we recommend purchasing a certificate from a
[certificate authority](https://en.wikipedia.org/wiki/Certificate_authority). A short summary of the steps for each of these processes
can be read [here](https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs).

Your application will need to be configured to accept SSL/TLS connections for your redirect endpoint when users become authenticated, but
for many apps, this will simply require a configuration update of your application server. Instructions for
[Apache](https://httpd.apache.org/docs/2.4/ssl/ssl_howto.html) and [Nginx](http://nginx.org/en/docs/http/configuring_https_servers.html)
can be found on their respective websites, and most popular application servers will contain documentation on how to proceed.

<a name="token-deauthorization" class="jump-anchor"></a>
### Token Deauthorization Endpoint
#### Request

An authorization token can be deauthorized or invalidated by making a request to Asana's API.

Your app should make a `POST` request to `https://app.asana.com/-/oauth_revoke`,
passing the parameters as part of a standard form-encoded post body.

| Parameter | Description |
|---|---|
| **client_id** | *required* The Client ID uniquely identifies the application making the request. |
| **client_secret** | *required* The Client Secret belonging to the app, found in the details pane of the developer console. |
| **token** | *required* The Refresh Token that should be deauthorized. Bearer Tokens will be rejected.  |

The body should include a valid Refresh Token, which will cause the Refresh Token and any Associated Bearer Tokens to be deauthorized. Bearer Tokens are not accepted in the request body since a new Bearer Token can always be obtained by reusing an authorized Refresh Token.

#### Response

A successful response with a 200 status code indicates that the token was deauthorized or not found. An unsuccessful response with a 400 status code will be returned if the request was malformed due to missing any required fields or specifying an invalid token (such as a bearer access token).

<a name="personal-access-token" class="jump-anchor"></a>
## Personal Access Token

Personal Access Tokens (PATs) are a useful mechanism for accessing the API in scenarios where OAuth would be considered
overkill, such as access from the command line and personal scripts or applications. A user can create many, but not
unlimited, personal access tokens. When creating a token you must give it a description to help you remember what you
created the token for.

Personal Access Tokens should be used similarly to OAuth access tokens when accessing the API, passing them in the
Authorization header.

> Example cURL request authenticating with a PAT

```shell
!
curl https://app.asana.com/api/1.0/users/me \
  -H "Authorization: Bearer ACCESS_TOKEN"
```

You can generate a Personal Access Token from the Asana [developer console](https://app.asana.com/0/developer-console). See the [Authentication Quick Start](/docs/authentication-quick-start) for detailed instructions on getting started with PATs. 

You should regularly review the list of personal access tokens you have created and deauthorize those that you no
longer need.

Remember to keep your tokens secret; treat them just like passwords! They act on your behalf when interacting
with the API. *Don't hardcode them into your programs*. Instead, opt to use them as environment variables.

<a name="openid-connect" class="jump-anchor"></a>
## OpenID Connect

Asana also supports the [OpenID Connect](https://openid.net/connect/) protocol for authenticating Asana users with your
applications. This means that, in addition to the normal `code` and `token` response types for the OAuth flow, you can
also use the `id_token` response type. 

For this response type, you are not granted an access token for the API, but
rather given a signed [Json Web Token](https://jwt.io/) containing the user's ID along with some metadata. If you want
to allow users to log into your services using their Asana account, the OpenID Connect protocol is an ideal way to
authenticate an Asana user. To obtain an ID token, you must request the `openid` scope during the authentication flow.

It is also possible to obtain an ID token alongside an authorization code in the authorization code grant
flow by using the (space-delimited) `code id_token` response type. If you do, the redirect parameters will include
the ID token in addition to everything you would normally receive.

To access additional information about the user in a standardized format, we also expose a
[user info endpoint](https://openid.net/specs/openid-connect-core-1_0.html#UserInfo) that can provide the user's name,
email address, and profile photo. This data is available by making a `GET` request to
`https://app.asana.com/api/1.0/openid_connect/userinfo` with an OAuth access token that has the `openid` scope.
Depending on the scopes tied to that token, you will receive different pieces of data. Refer to our
[list of OAuth scopes](/docs/oauth-scopes) to determine which additional scopes you need to get the data you want.

Metadata about our OpenID Connect implementation is also made available through OpenID Connect's
[discovery protocol](https://openid.net/specs/openid-connect-discovery-1_0.html). Making an unauthenticated `GET`
request to `https://app.asana.com/api/1.0/.well-known/openid-configuration` will provide all the details of our
implementation necessary for you to use OpenID Connect with Asana's API.


[client libraries]: ./client-libraries
[omniauth]: https://github.com/intridea/omniauth
[oauth-spec]: https://tools.ietf.org/html/rfc6749

<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>

</section>
