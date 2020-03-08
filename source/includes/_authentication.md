# AUTHENTICATION

The Weaver API uses API keys to authenticate requests. You can view and manage your API keys in the Weaver Dashboard or by calling your user profile endpoint using your user auth token.

Authentication to the API is performed via [HTTP Basic Auth](https://en.wikipedia.org/wiki/Basic_access_authentication). Provide your API key as the basic auth username value. You do not need to provide a password.

Test mode secret keys have the prefix `wk_test_` and live mode secret keys have the prefix `wk_prod_`. We plan to eventually introduce restricted API keys for granular permissions.

Your API keys carry many privileges, so be sure to keep them secure! Do not share your secret API keys in publicly accessible areas.

<aside class="notice">
Make sure to replace <code>YOUR_API_KEY</code> with your actual API key.
</aside>

If you are running the shell examples, you can simply export your API key in your current terminal session as such: `export YOUR_API_KEY="<your actual API key>"`


> To authorize, use this code:

```shell
# With curl, you can use -u followed by your API key. Adding `:` after the key will simply tell curl not to ask you for a password.
curl "https://api.getweaver.io/v1/gateways" \
  -u "${YOUR_API_KEY}:"
```

```ruby
# In ruby, we first need to encode the key using Base64 before adding it to the request header
require 'base64'
require 'rest-client'


token = Base64.strict_encode64("YOUR_API_KEY:")
headers = {
  'Authorization': token
}

url = 'https://api.getweaver.io/v1/gateways'

RestClient.get(url, headers: headers)
```
