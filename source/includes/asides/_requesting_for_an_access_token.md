## Requesting for an Access Token

```shell
curl -H "Content-type: application/json" -X POST https://api.tradegecko.com/oauth/token -d '{"client_id": "d38abea2ef61c916a1e131de9fd04146579578f", "client_secret":"2kj2kd07e197f9942ca1876d759e9e9c45bdcdc", "redirect_uri": "https://my.application.com/auth/app/callback", "code": "c3d11b23992f53d748c7b25148da1ac4d838919", "grant_type": "authorization_code"}'
```

```json
{
  "access_token": "57ed301af04bf35b40f255feb5ef469ab2f046aff14",
  "expires_in": 7200,
  "refresh_token": "026b343de07818b3ffebfb3001eff9a00aea43da0 ",
  "scope": "public",
  "token_type": "bearer"
}
```

The access token is a unique key used to make requests to the API. In
order to get an access token, user must make a POST request to
`https://api.tradegecko.com/oauth/token` with the `client_id`,
`client_secret`, `redirect_uri`, `code` and `grant_type` as parameters.
`code` must match the authorization code returned by the
authorization endpoint and `grant_type` must be set to
`authorization_code`
