## Refreshing Access Tokens

The refresh token is a unique key used to request for a new access token whenever
the current access token becomes expired. In order to refresh an access token, user must make a POST request to
`https://api.tradegecko.com/oauth/token` with the `client_id`,
`client_secret`, `redirect_uri`, `refresh_token` and `grant_type` as parameters.

`refresh_token` must match the refresh token returned by the
authorization endpoint and `grant_type` must be set to `refresh_token`.

```shell
curl -H "Content-type: application/json" -X POST https://api.tradegecko.com/oauth/token -d '{"client_id": "9eb02720054", "client_secret": "b1d41094b83", "redirect_uri": "http://my.application.com/auth/callback", "refresh_token": "9582f8a45255", "grant_type": "refresh_token"}'
```

```ruby
  
```

```json
{
  "access_token": "439fc57cf1525e51555",
  "expires_in": 7200,
  "refresh_token": "ecfa1a22bd612cc1d8",
  "scope": "public",
  "token_type": "bearer"
}
```

> **Note:** When a token is refreshed, a new refresh token is
> generated and this should be the one used the next time token refresh
> is invoked. Using an expired refresh token would return this error.

```json
{
  "error": "invalid_request",
  "error_description": "The request is missing a required parameter, includes an unsupported parameter value, or is otherwise malformed."
}
```
