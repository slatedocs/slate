## Making an API call

```shell
curl -X GET -H "Content-type: application/json" -H "Authorization: Bearer <ACCESS_TOKEN>"
https://api.tradegecko.com/accounts %>/
```

```ruby
require 'gecko-ruby'
gecko = Gecko::Client.new(OAUTH_ID, OAUTH_SECRET)
access_token = OAuth2::AccessToken.new(gecko.oauth_client, ACCESS_TOKEN)
gecko.access_token = access_token
gecko.Account.where()
```

The TradeGecko API is entirely JSON based. In order to make an authenticated call
to the API, you must include your access token with the call.
OAuth2 uses a BEARER token that is passed along in an Authorization
header.

