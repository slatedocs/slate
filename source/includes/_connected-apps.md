# Connected Apps Guide

This guide described how your application can request TransferWise customers to grant access to their account to your application. 

Note that asking TransferWise users to copy-paste their Transferwise API access tokens directly into your application is a violating of our security policy.  So please only use proper OAuth authorization flow as described below.
 
## API access

TransferWise uses standard OAuth 2.0 protocol for authentication and authorization. 

Once our partnership begins, we’ll send you API access credentials for the sandbox environment consisting of a Client ID and a Client Secret.
The credentials are needed to complete the authorisation_code grant type of OAuth 2.0 through which the customer will allow your application to be able to act on their behalf.
We also need *redirect_url* from your technical team so that we can limit our callbacks to only that URL, this is URL that we will forward users to after successfully granting your application access to their TransferWise account. Specifying this explicitly makes the integration more secure.
[OAuth 2.0: The Complete Guide](https://auth0.com/blog/oauth2-the-complete-guide/) is a great way to refresh your knowledge about the protocol itself.

### SANDBOX and LIVE environments

* Sandbox API is located at https://api.sandbox.transferwise.tech
* LIVE API is located at https://api.transferwise.com

## Get user authorization

At a high level there are three steps to gaining access to an existing TransferWise account.
<ol>
  <li>Your app redirects the user to TransferWise authorization webpage, which prompts customers to login.<br/>
  </li>
  <li>The user logs in to TransferWise.</li>
  <li> The user agrees to provide access, the TransferWise authorization page then redirects user back to your preconfigured url, including a code you can use to geneate user tokens. e.g.
  `
  https://www.yourapp.com/?code=[CODE]
  `
  </li>
</ol>

These steps are explained in more detail below.

###  1. Your application redirects user to TransferWise authorization webpage

Your website or app opens the following url in the user's browser.

Sandbox:  
`
https://sandbox.transferwise.tech/oauth/authorize?response_type=code&client_id=<your api client id>&redirect_uri=https://www.yourapp.com
` <br/>
Live:  
`
https://api.transferwise.com/oauth/authorize?response_type=code&client_id=<your api client id>&redirect_uri=https://www.yourapp.com
`

Replace *your-api-client-id* and *redirect-uri* with your specific values. 
The redirect URL should be the address you want the user to return to after the authorization flow, which will have been preconfigured when you requested your API access tokens. This can be different across the sandbox and production environments and we can update it for you upon request.

On mobiles apps you should not use `WebView` components to show the authorization page to the users because they are not secure and will not allow users to log in to TransferWise with Google, which is an option used by some of our users. Your app should instead open the device's full browser app.

*Please note that the URL for the authorization page in sandbox is different than URL for API calls.  
In the live environment the api.transferwise.com URL works for the authorization page as well as API calls.*

### 2. The user logs in to TransferWise

Our usual log in screens are presented to the user if they are not already logged in on the browser being used. If enabled for a user they will also be prompted to go through our two-factor authentication procedure.

### 3. The user agrees to grant access and we forward them to your *redirect_url*

Once a user gives your application authorization to connect to TransferWise and access their data, the user is redirected back to your *redirect_url* with a generated code query string value. For example

`https://www.yourapp.com/?code=[CODE]`

Your website or service can then use this code to obtain the access token to act on behalf of the user account described in the [get user tokens](#conncted-apps-guide-get-user-tokens) section.

If you are building your TransferWise integration as a native mobile phone app then the redirect URL should be able to handle returning the user to the correct place in the app.


## Get user tokens
You can now use authorization code returned to you as a query string parameter to obtain user access and refresh tokens. So that you can make calls on behalf of TransferWise user.

> Example Request:

```shell
curl \
-u '[your-api-client-id]:[your-api-client-secret]' \
-d 'grant_type=authorization_code' \
-d 'client_id=[your-api-client-id]' \
-d 'code=[code-from-redirect-uri]' \
-d 'redirect_uri=https://www.yourapp.com' \
'https://api.sandbox.transferwise.tech/oauth/token' 
```

You will be returned an access token and a refresh token.

> Example Response:

```json
  {
    "access_token":"ba8k9935-62f2-475a-60d8-6g45377b4062",
    "token_type":"bearer",
    "refresh_token":"a235uu9c-9azu-4o28-a1kn-e15500o151cx",
    "expires_in": 43199,
    "scope":"transfers"
  }
```
For calling API endpoints you need to provide the user's `access_token` in the request's HTTP header in the format `Authorization: Bearer <access_token>`.
Access tokens are short lived for security reasons, they are only valid for 12 hours by default. When they expire you need to use the `refresh_token` to generate a new access_token.

This means you have to securely store the user's `refresh_token` in order to generate a new `access_token` each time they use your TransferWise integration, or you poll for updated data,

### Request

**`POST https://api.sandbox.transferwise.tech/v1/oauth/token`**

Use Basic Authentication with your api-client-id/api-client-secret as username/pwd.

Field                 | Description                                   | Format
---------             | -------                                       | -----------
grant_type            | "authorization_code"                          | Text
client_id             | your api_client_id                            | Text
code                  | Code  provided to you upon redirect back from authorization flow. See step [Get user authorization](#connected-apps-guide-get-user-authorization).  | Text
redirect_uri          | Redirect page associated with your api client credentials   | Text

### Response

Field                 | Description                                   | Format
---------             | -------                                       | -----------
access_token          | Access token to be used when calling API endpoints on behalf of user. Valid for 12 hours. | uuid
token_type            | "bearer"                                      | Text
refresh_token         | Refresh token which you need to use in order to request new access_token. The lifetime of refresh tokens is 10 years. | uuid
expires_in            | Expiry time in seconds                        | Integer
scope                 | "transfers"                                   | Text

## Refresh user access token

> Example Request:

```shell
      curl \
      'https://api.sandbox.transferwise.tech/oauth/token' \
      -u '[your-api-client-id]:[your-api-client-secret]' \
      -d 'grant_type=refresh_token' \
      -d 'refresh_token=[user's refresh token]'
```

> Example Response:

```json
  {
    "access_token":"be69d566-971e-4e15-9648-85a486195863",
    "token_type":"bearer",
    "refresh_token":"1d0ec7b9-b569-426d-a18d-8dead5b6a3cc",
    "expires_in":43199,
    "scope":"transfers"
  }
```

Access tokens are valid for 12 hours, so upon expiry you need to use refresh_token to generate new access_token. 

In order to maintain an uninterrupted connection, you can request a new access token whenever it’s close to expiring.
There is no need to wait for the actual expiration to happen first. 

### Request

**`POST https://api.sandbox.transferwise.tech/v1/oauth/token`**

Use Basic Authentication with your api-client-id/api-client-secret as username/pwd.

Field                 | Description                                   | Format
---------             | -------                                       | -----------
grant_type            | "refresh_token"                               | Text
refresh_token         | User's refresh_token obtained in [Get user tokens](#connected-apps-guide-get-user-tokens) step. | uuid

### Response

Field                 | Description                                   | Format
---------             | -------                                       | -----------
access_token          | Access token to be used when calling API endpoints on behalf of user. Valid for 12 hours. | uuid
token_type            | "bearer"                                      | Text
refresh_token         | Refresh token which you need to use in order to request new access_token once the existing one expires | uuid
expires_in            | Expiry time in seconds                        | Integer
scope                 | "transfers"                                   | Text

## Token Expiry

It is possible that a user's refresh token will become invalid. This could happen for a number of reasons, for example:

* The user revokes access for your application to their account.
* The user enables enhanced security on their TransferWise account.
* TransferWise revoke tokens due to a security breach of your client secret.

Due to this possibility your application should handle a failing refresh token scenario by sending the user through the authorization code flow as you initially did.
