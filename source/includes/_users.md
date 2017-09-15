# Users

## Login

```ruby
require 'rest-client'

response = RestClient.post(
  '/api/v1/login',
  {
    email: 'api@example.com',
    password: 'pass1234'
  }
)

response.body
```

```shell
curl '/api/v1/login[.json]'
  -X POST
  -H "Content-Type: application/json"
  -d "email=api@example.com"
  -d "password=pass1234"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "email": "api@example.com",
  "name": "Api user",
  "phone_number": "98xxxxxxxx",
  "setup_incomplete": false,
  "employer_id": 1,
  "authentication_token": "t0k3n",
  "approval_limit": 0,
  "companies": [
    {
      "id": 1,
      "name": "My Demo Company"
    }
  ]
}
```

This endpoint returns `User` object along with `authentication_token`.

RubberStamp expects for the Authentication token to be included in all API
requests to the server in a header.


### HTTP Request

`POST /api/v1/login[.json]`

### Query Parameters

| Param     | Type    | Description                   |
| --------- | ------- | -----------                   |
| email     | string  | Your registered email address |
| password  | string  | strong password               |

<aside class="success">
Remember — You need to be valid user to get authenticated. If you haven't
registered to Rubberstamp yet, try register api.
</aside>

## Register

```shell
curl '/api/v1/register[.json]'
  -X POST
  -H "Content-Type: application/json"
  -d "email=api@example.com"
  -d "password=strongp@ssw0rd"
  -d "password_confirmation=strongp@ssw0rd"
  -d "name=Api user"
  -d "phone_number=98xxxxxxxx"
```

```ruby
require 'rest-client'

response = RestClient.post(
  '/api/v1/register',
  {
    email: 'api@example.com',
    password: 'pass1234',
    password_confirmation: 'pass1234',
    name: 'Api user',
    phone_number: '98xxxxxx'
  }
)

response.body
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "email": "api@example.com",
  "name": "Api user",
  "phone_number": "98xxxxxxxx",
  "setup_incomplete": true,
  "employer_id": null,
  "authentication_token": "t0k3n",
  "approval_limit": 1000000,
  "companies": null
}
```

This endpoint will register you as a rubberstamp user, send confirmation link
to your email and you can confirm it. It will returns `User` object along 
with `authentication_token`.

### HTTP Request

`POST /api/v1/register[.json]`

### Query Parameters

| Param                 | Type    | Description                   |
| ---------             | ------- | -----------                   |
| email                 | string  | Your registered email address |
| password              | string  | strong password               |
| password_confirmation | string  | password confirmation         |
| name                  | string  | Your First Name and Last Name |
| phone_number          | string  | Phone number                  |
