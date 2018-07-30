# Authentication

```ruby
require 'rest-client'

RestClient.get(
  'https://app.procurmentexpress.com/api/v1/endpoint',
  headers={authentication_token: 'your token'}
)
```

```shell
# With shell, you can just pass the correct header with each request

curl "https://app.procurmentexpress.com/api/v1/endpoint"
  -H "authentication_token: your token"
```

> Make sure to replace `your token` with your actual token.

Authenticate your account when using the API by including your
`authentication_token` in the Header Request.

Make sure your authenticated request are including: `-H "authentication_token: your token"`

