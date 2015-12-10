---
title: TradeGecko API Documentation

language_tabs:
  - ruby
  - shell

toc_footers:
  - <a href='https://go.tradegecko.com/register'>Signup for an account</a>
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors
guides:
  - order_flow

asides:
  - creating_an_application
  - getting_an_auth_code
  - requesting_for_an_access_token
  - refreshing_access_tokens
  - making_an_api_call
  - testing_with_oauth
  - omniauth
  - privileged_access_token
  - pagination
  - filtering
  - rate_limiting

resources:
  - account
  - address
  - company
  - contact
  - currency
  - fulfillment
  - fulfillment_line_item
  - image
  - invoice
  - invoice_line_item
  - location
  - note
  - order
  - order_line_item
  - payment_term
  - price_list
  - product
  - purchase_order
  - purchase_order_line_item
  - stock_adjustment
  - stock_adjustment_line_item
  - stock_transfer
  - stock_transfer_line_item
  - tax_component
  - tax_type
  - user
  - variant

search: true
---

# TradeGecko API

Build tools that solve problems for millions of wholesale and retail businesses worldwide.

You can view code examples in the dark area to the right; switch the programming language of the examples with the tabs in the top right.

If anything is missing or seems wrong, please check the [GitHub issues](https://github.com/tradegecko/smaug/issues)
for existing known issues or [create a new issue](https://github.com/tradegecko/smaug/issues/new).

# Authentication

> To authorize, use this code:

```ruby
require 'gecko-ruby'
gecko = Gecko::Client.new(OAUTH_ID, OAUTH_SECRET)
access_token = OAuth2::AccessToken.new(gecko.oauth_client, ACCESS_TOKEN)
gecko.access_token = access_token
gecko.Account.current
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: gordonGecko"
```

> Make sure to replace `gordonGecko` with your API key.

TradeGecko uses API keys to allow access to the API. You can register a new TradeGecko API key at our [developer portal](http://developer.tradegecko.com/).

TradeGecko expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: gordonGecko`

<aside class="notice">
You must replace <code>gordonGecko</code> with your personal API key.
</aside>
