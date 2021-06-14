### OAuth 2
```php
<?php
use Mautic\Auth\ApiAuth;

// $initAuth->newAuth() will accept an array of OAuth settings
$settings = array(
    'baseUrl'      => 'https://your-mautic.com',
    'version'      => 'OAuth2',
    'clientKey'    => '5ad6fa7asfs8fa7sdfa6sfas5fas6asdf8',
    'clientSecret' => 'adf8asf7sf54asf3as4f5sf6asfasf97dd', 
    'callback'     => 'https://your-callback.com'
);

// Initiate the auth object
$initAuth = new ApiAuth();
$auth     = $initAuth->newAuth($settings);

// Initiate process for obtaining an access token; this will redirect the user to the authorize endpoint and/or set the tokens when the user is redirected back after granting authorization

if ($auth->validateAccessToken()) {
    if ($auth->accessTokenUpdated()) {
        $accessTokenData = $auth->getAccessTokenData();
        
        //store access token data however you want
    }
}
```
<aside class="warning">
Mautic supports only the authorization_code, refresh_token and client_credentials grant types.
</aside>

#### Authorization
##### Step One - Obtain Authorization Code

Redirect the user to the authorize endpoint `oauth/v2/authorize`:

<pre class="inline">
GET /oauth/v2/authorize?
    client_id=CLIENT_ID
    &grant_type=authorization_code
    &redirect_uri=https%3A%2F%2Fyour-redirect-uri.com%2Fcallback
    &response_type=code
    &state=UNIQUE_STATE_STRING
</pre>                
(note that the query has been wrapped for legibility)

<aside class="notice">
The state is optional but recommended to prevent CSRF attacks. It should be a uniquely generated string and stored locally in session, cookie, etc. to be compared with the returned value. 
</aside>

<aside class="notice">
Note that the redirect_uri should be URL encoded.
</aside>

<aside class="notice">
As of 1.1.2, Mautic does not leverage OAuth2 scopes.
</aside>

The user will be prompted to login. Once they do, Mautic will redirect back to the URL specified in redirect_uri with a code appended to the query.

It may look something like:
`https://your-redirect-uri.com?code=UNIQUE_CODE_STRING&state=UNIQUE_STATE_STRING`

The state returned should be compared against the original to ensure nothing has been tampered with. 

##### Step Two - Replace with an Access Token

Obtain the value of the code from Step One then immediately POST it back to the access token endpoint `oauth/v2/token` with:

<pre class="inline">
POST /oauth/v2/token

client_id=CLIENT_ID
    &client_secret=CLIENT_SECRET
    &grant_type=authorization_code
    &redirect_uri=https%3A%2F%2Fyour-redirect-uri.com%2Fcallback
    &code=UNIQUE_CODE_STRING
</pre>   
(note that the post body has been wrapped for legibility)

The response returned should be a JSON encoded string:

<pre class="inline">
    {
        access_token: "ACCESS_TOKEN",
        expires_in: 3600,
        token_type: "bearer",
        scope: "",
        refresh_token: "REFRESH_TOKEN"
    }
</pre>

This data should be stored in a secure location and used to authenticate API requests.

#### Refresh Tokens

The response's `expires_in` is the number of seconds the access token is good for and may differ based on what is configured in Mautic. The code handling the authorization process should generate an expiration timestamp based on that value. For example `<?php $expiration = time() + $response['expires_in']; ?>`. If the access token has expired, the refresh_token should be used to obtain a new access token.

By default, the refresh token is valid for 14 days.
- If your application requests a new access token using the refresh token within 14 days, no user interaction is needed. Your application gets both a new access token and a new refresh token (which is valid for another 14 days after it's issued);
- If your application does not request a new token using the refresh token within 14 days, user interaction is required in order to get new tokens.

The refresh token's expiration time is configurable through Mautic's Configuration. 

<aside class="notice">
The application should monitor for a <code>400 Bad Response</code> response when requesting a new access token and redirect the user back through the authorization process.
</aside>

To obtain a new access token, a POST should be made to the access token's endpoint `oauth/v2/token` using the `refresh_token` grant type.

<pre class="inline">
POST /oauth/v2/token
    
client_id=CLIENT_ID
    &client_secret=CLIENT_SECRET
    &grant_type=refresh_token
    &refresh_token=REFRESH_TOKEN
    &redirect_uri=https%3A%2F%2Fyour-redirect-uri.com%2Fcallback
</pre>
(note that the post body has been wrapped for legibility)

The response returned should be a JSON encoded string:

<pre class="inline">
    {
        access_token: "NEW_ACCESS_TOKEN",
        expires_in: 3600,
        token_type: "bearer",
        scope: "",
        refresh_token: "REFRESH_TOKEN"
    }
</pre>

#### Client Credentials

The Client Credentials grant is used when applications request an access token to access their own resources, not on behalf of a user.

To obtain a new access token, a POST should be made to the access token's endpoint `oauth/v2/token` using the `client_credentials` grant type.

<pre class="inline">
POST /oauth/v2/token
    
client_id=CLIENT_ID
    &client_secret=CLIENT_SECRET
    &grant_type=client_credentials
</pre>
(note that the post body has been wrapped for legibility)

The response returned should be a JSON encoded string:

<pre class="inline">
    {
        access_token: "NEW_ACCESS_TOKEN",
        expires_in: 3600,
        token_type: "bearer",
        scope: ""
    }
</pre>

#### Authenticating the API Request

Authenticating the API request with OAuth2 is easy. Choose one of the following methods that is appropriate for the application's needs.

##### Authorization Header

By using an authorization header, any request method can be authenticated.

However, note that this method requires that the server Mautic is installed on passes headers to PHP or has access to the `apache_request_headers()` function. `apache_request_headers()` is not available to PHP running under fcgi. 

<pre class="inline">
Authorization: Bearer ACCESS_TOKEN
</pre>

##### Method Specific

The access token can also be appended to the query or included in the body of a POST.

<pre class="inline">
GET https://your-mautic.com/api/leads?access_token=ACCESS_TOKEN
</pre>

<pre class="inline">
POST https://your-mautic.com/api/leads/new

firstname=John&lastname=Smith&access_token=ACCESS_TOKEN
</pre>
