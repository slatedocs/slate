## Filtering

```shell
curl -X GET -H "Content-type: application/json" -H "Authorization: Bearer <ACCESS_TOKEN>"
https://api.tradegecko.com/products?created_at_min=2015-11-04/
```

```ruby
require 'gecko-ruby'
gecko = Gecko::Client.new(OAUTH_ID, OAUTH_SECRET)
access_token = OAuth2::AccessToken.new(gecko.oauth_client, ACCESS_TOKEN)
gecko.access_token = access_token

gecko.Product.where(created_at_min: "2015-11-04")
```

The API also allows filtering of records by passing query parameters
These are the filters currently allowed by the API (where relevant)

###  Index Filters

| Arguments          | Description
|--------------------|--------------------
| **ids**            | An array of object IDs
| **created_at_min** | Return objects only created since
| **created_at_max** | Return objects only created before
| **updated_at_min** | Return objects only updated since
| **updated_at_max** | Return objects only updated before
| **order**          | The order to return the collection i.e "created_at desc"
| **limit**          | See the pagination docs (default is 100)
| **page**           | See the pagination docs

Each object has their own specific filters; we cover those filters in their respective sections.

### HTTP Request
`GET  https://api.tradegecko.com/products?ids=1,2,3&order=created_at+desc&limit=3`

