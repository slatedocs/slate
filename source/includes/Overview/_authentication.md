# Authentication

## OAuth2.0

TSheets uses OAuth2 for authentication and authorization of our API. [OAuth2](http://oauth.net/2/) is a protocol designed to let third-party applications authenticate to perform actions as a user, without getting the user's password. There are several libraries available that implement the protocol, a good list can be found at the [OAuth2](http://oauth.net/2/) home page. Through the use of OAuth2, you'll go through the process of obtaining a token and then you'll use that token in every request made to the API to verify your identity.

## Obtaining a Token

Before you can make any request of the API, you must first authenticate. Once you've authenticated, you will be given an access token that may be used for all subsequent requests.

<aside class="notice">
 If you need a small number of access tokens, implementing the full OAuth2 flow can be cumbersome. Sometimes you just want a token for something simple like a command-line utility or script.

 As a convenience to you, we allow access tokens to be created through the web UI via the API Add-on preferences page (<code>Add-ons -> API -> click 'Preferences'</code>). You can also extend the expiration date on these tokens via the web UI, so that you don't have to deal with refreshing tokens. <bold>Remember to keep your access tokens secret; treat them just like passwords!</bold>
</aside>

Performing the OAuth2 token request flow requires an OAuth client ID and an OAuth client secret. To obtain these application credentials, you will need to install the API Add-On in your TSheets account and follow the instructions found there. The **OAuth client secret should never be shared**.

There are 2 steps required in order to obtain an access token, as described below.
### Step 1. Authorization Request

This first step consists of a user authorizing your application to access their information on TSheets. To do this, you'll create a link somewhere on your site that they can use to initiate the process. The link will contain several parameters that are necessary for TSheets to consider it valid. The user should use a web browser to follow the link and perform the authorization request.

Once the user is directed to access the authorization endpoint at TSheets ('authorization server' in OAuth2-speak), two things will happen:

 * The user ('resource owner' in OAuth2-speak) will need to log in using their TSheets credentials.
 * Once they've successfully logged in, they're given a choice of whether or not to grant your application access to their data within TSheets. If they do, TSheets will generate an authorization _code_ and redirect the user back to your `redirect_uri` with the authorization code as one of the parameters in the request.

 The link that a user will follow to perform an authorization request is made to the /authorize end-point:

 <code class="standout">https://rest.tsheets.com/api/v1/authorize</code>

 An example of a link that calls this URL is shown below:

<code class="standout">https://rest.tsheets.com/api/v1/authorize?response_type=code&client_id=MYAPPCLIENTID&redirect_uri=https://somedomain.com/callback&state=MYSTATE</code>

