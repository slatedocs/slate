# Authentication

MDLIVE uses JWT Web Tokens to allow access to our API endpoints.

We grant two types of tokens. The type needed depends on the endpoints that you would like to access.

Endpoints that: | Can use:
--------------- | -------------
do **not** require a patient id | API token
require a patient id | User token


```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: Bearer {jwt_token}"
```

```ruby
# With ruby, you can can add correct header to the request object
RestClient::Request.new(
  :method => :get,
  :url => "sample_url",
  :headers => {
    'Authorization' => 'Bearer {jwt_token}'
  }
).execute
```
> Make sure to replace `{jwt_token}` with your JWT Token.

MDLIVE expects for the token to be included in all API requests to the server in a header that looks like the following:

`Authorization: Bearer {jwt_token}`

<aside class="notice">
Always include 'Bearer', and you must replace <code>{jwt_token}</code> with your token obtained from one of the token endpoints.
</aside>

<aside class="notice">
MDLIVE expects all authentication request to include valid API credentials. To obtain credentials, please reach out to your Account Manager.
</aside>
