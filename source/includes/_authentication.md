# Authentication

## Testing authentication

```shell
# With shell, you can just pass the correct header with each request
curl "https://api.handshq.com/v1/authentication" \
  -H "Accept: application/json"  \
  -H "Authorization: bearer [api_token]"
```

> In all subsequent examples make sure to replace `[api_token]` with your API key.

HandsHQ uses API keys to allow access to the API. You can find your API key in the API tab of your settings page
[here.](https://app.handshq.com/settings/api_configuration)


HandsHQ expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: bearer [api_token]`

<aside class="notice">
You must replace <code>[api_token]</code> with your personal API key.
</aside>


If you need to test that you have a valid API key use the following endpoint:

### HTTP Request

`GET https://api.handshq.com/v1/authentication`

### Response

Successful authentication with return a `200` response, otherwise a `401` will be returned when supplied with an invalid API key.
