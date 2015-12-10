## Privileged Access Tokens
> Once you have obtained your Privileged Access Token, you can use cURL or Ruby to check if it is working.

```shell
curl -X GET -H "Content-type: application/json" -H "Authorization: Bearer <ACCESS_TOKEN>"
https://api.tradegecko.com/accounts/
```

```ruby
require 'gecko-ruby'
gecko = Gecko::Client.new(OAUTH_ID, OAUTH_SECRET)
access_token = OAuth2::AccessToken.new(gecko.oauth_client, ACCESS_TOKEN)
gecko.access_token = access_token
gecko.Account.current
```

<aside class="notice">
Important: Do not disclose your Privileged Access Tokens to anyone else.
</aside>

You can now generate Privileged Access Tokens to be used for accessing the TradeGecko API.
These keys do not have an expiry which means that you can access the API using the privileged token
without the need for a refresh token. In any case that your privileged key gets compromised, you should
immediately revoke them through the [TradeGecko App List](https://go.tradegecko.com/oauth/applications).


