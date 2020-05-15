# Authentication

```shell
curl -X "GET" "https://apisandbox.bilendo.de/" \
    -H "Authorization: Token token=YOUR-API-TOKEN"
```

Bilendo uses API tokens to allow access to the API. You can get your API-Token in your Bilendo-Account under your [account settings](https://apisandbox.bilendo.de/account/api).

Once you have your token, you must include it with Bilendo API requests as the HTTP headers.

Header Name | Header Value
--------- | -------
Authorization | Token token=YOUR-API-TOKEN

<aside class="success">
  Note that all API requests are made over SSL (HTTPS).
</aside>
