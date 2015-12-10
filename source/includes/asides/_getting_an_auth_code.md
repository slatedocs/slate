## Getting an Authorization Code

An authorization code is the key used to retrieve the access token. 
In order to acquire an authorization code, you need to send your user
to the authorization endpoint.

`https://api.tradegecko.com/oauth/authorize?response_type=code&client_id=<CLIENT_ID>&redirect_uri=<REDIRECT_URI>`

`CLIENT_ID` should be set to your application ID. `response_type` should 
always be set to “code”. `REDIRECT_URI` should be set to the URL where 
the user will be redirected back to after the request is authorized.

Once the user has successfully authorized the application, she will be redirected to
the `redirect_uri` with the authorization code as a query parameter.

e.g. `https://my.application.com/auth/app/callback?code=12bc6909c57aaa930`
