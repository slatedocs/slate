## Pagination

> The default limit is 100 items.

```shell
curl -X GET -H "Content-type: application/json" -H "Authorization: Bearer <ACCESS_TOKEN>"
https://api.tradegecko.com/users?limit=20&page=1
```

```ruby
require 'gecko-ruby'
gecko = Gecko::Client.new(OAUTH_ID, OAUTH_SECRET)
access_token = OAuth2::AccessToken.new(gecko.oauth_client, ACCESS_TOKEN)
gecko.access_token = access_token
gecko.User.where(limit: 5, page: 2)
```
 
The TradeGecko API enables pagination by allowing users to include 'limit'
and 'page' parameters on GET requests to index pages. 
