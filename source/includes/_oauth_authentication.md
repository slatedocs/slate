# Available Oauth2 routes/endpoints for V3 API

## Getting a bearer token (Sign in)

```ruby
require 'rest-client'

RestClient.post(
  'https://app.procurementexpress.com/api/v3/oauth/token',
  {
    email: "example@gmai.com",
    password: 'password',
    grant_type: "grant_type",
  },
  headers = {
    client_id: 'client Iid',
    client_secret: "client secret"
  }
)

response.body
```

```shell
curl https://app.procurementexpress.com/api/v3/oauth/token
  -X POST
  -H "client_id: client id"
  -H "client_secret: client secret"
  -d "email=john@example.com"
  -d "password=password"
  -d "grant_type=grant_type"
```


> The above command returns JSON structured like this:

```json
{
   "access_token": "NoR6Oz8OG5Ci....WXmC_8WE",
    "token_type": "Bearer",
    "expires_in": 7200,
    "refresh_token": "NxmOamX....TqekmatIw",
    "scope": "public",
    "created_at": 1692767229
}
```

### HTTP Request

`POST https://app.procurementexpress.com/api/v3/oauth/token`

### Query Parameters

| Param                | Type   | Description              |
| -------------------- | ------ | ------------------------ |
| email                | string | email                    |
| password             | string | strong password          |
| grant_type           | string | password                 |
| client_id            | header | client_id                |
| client_secret        | header | client_secret            |

## Revoke a token (or Sign out)

```ruby
require 'rest-client'

RestClient.post(
  'https://app.procurementexpress.com/api/v3/oauth/revoke',

    headers = {
        client_id: 'client Iid',
        client_secret: "client secret"
    }
)

response.body
```

```shell
curl https://app.procurementexpress.com/api/v3/oauth/token
  -X POST
  -H "client_id: client id"
  -H "client_secret: client secret"
```

### HTTP Request

`POST https://app.procurementexpress.com/api/v3/oauth/revoke`

### HTTP Request

`Authorization: Bearer <token>`

### Query Parameters

| Param                | Type   | Description              |
| -------------------- | ------ | ------------------------ |
| client_id            | header | client_id                |
| client_secret        | header | client_secret            |

## Check if token is valid

```ruby
require 'rest-client'

RestClient.get(
  'https://app.procurementexpress.com/api/v3/oauth/token/info',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)

response.body
```

```shell
curl https://app.procurementexpress.com/api/v3/oauth/token/info
  -X GET
  -H "authentication_token: your token"
  -H "app_company_id: 1"
```

### HTTP Request

`GET https://app.procurementexpress.com/api/v3/oauth/token/info`

### HTTP Request

`Authorization: Bearer <token>`

## Accessing other resources with token

```ruby
require 'rest-client'

RestClient.get(
  'https://app.procurementexpress.com/api/v3/api/v3/budgets',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)

response.body
```

```shell
curl https://app.procurementexpress.com/api/v3/api/v3/budgets
  -X GET
  -H "authentication_token: your token"
  -H "app_company_id: 1"
```

### HTTP Request

`GET https://app.procurementexpress.com/api/v3/api/v3/budgets`

### HTTP Request

`Authorization: Bearer <token>`