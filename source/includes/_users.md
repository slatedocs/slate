# Users

## Login

```ruby
require 'uri'
require 'net/http'

url = URI("https://rubberstamp.io/api/v1/login")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Post.new(url)
request.set_form_data({
  "email": "api@example.com",
  "password": "strongp@ssw0rd"
})

response = http.request(request)
puts response.read_body
```

```shell
curl '/api/v1/login[.json]'
  -X POST
  -H "Content-Type: application/json"
  -d "email=api@example.com"
  -d "password=strongp@ssw0rd"
```

```javascript
import axios from 'axios';

axios
  .post('https://rubberstamp.io/api/v1/login', {
    email: 'api@example.com',
    password: 'strongp@ssw0rd',
  })
  .then(function(response) {
    console.log(response);
  })
  .catch(function(error) {
    console.log(error);
  });
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
requests to the server in a header that looks like the following:


### HTTP Request

`POST /api/v1/login[.json]`

### Query Parameters

| Param     | Type    | Description                   |
| --------- | ------- | -----------                   |
| email     | string  | Your registered email address |
| password  | string  | strong password               |

<aside class="success">
Remember — You need to be valid user to get authenticated. Try sign up API if you
don't have account yet.
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
