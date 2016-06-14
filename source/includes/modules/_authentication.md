# Authentication

> To authorize, use this code:

```php
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "X-Authorization: meowmeowmeow"
```

> Make sure to replace `meowmeowmeow` with your API key.

Slyce uses API keys to allow access to the API. You can get you own Slyce API key by contacting our support.

Slyce expects for the API key to be included in all API requests to the server in a header that looks like the following:

`X-Authorization: meowmeowmeow`

<aside class="notice">
You must replace <code>meowmeowmeow</code> with your own API key.
</aside>