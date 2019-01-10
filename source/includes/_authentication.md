# Authentication

> To authorize, use this code:


```shell
# With shell, you can just pass the correct header with each request
curl "https://api.handshq.com/v1/auth" \
  -H "Content-Type: application/json"  \
  -H "Authorization: bearer [api_token]"
```

> Make sure to replace `[api_token]` with your API key.

HandsHQ uses API keys to allow access to the API. You can find your API key in the API tab of your settings page.

HandsHQ expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: bearer [api_token]`

<aside class="notice">
You must replace <code>[api_token]</code> with your personal API key.
</aside>
