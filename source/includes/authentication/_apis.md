## API Tokens

```shell
curl -X POST {server_url}/auth/auth_token
-H "Content-type: application/json"
-d '{"auth":{"api_key":"yourapikey","password":"yourapipassword"}}'
```

```ruby
RestClient::Request.new(
  :method => :post,
  :url => "{server_url}/auth/auth_token",
  :headers => {
    "Content-type" => "application/json"
  },
  :payload => {
    :auth => {
      :api_key => "yourapikey",
      :password => "yourapipassword"
    }
  }
).execute
```



> The above command returns JSON structured like this:

```json
{
    "jwt": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MDgyNjk2NjQsImF1ZCI6ZmFsc2UsInN1YiI6MX0._gJkRKLkdqwFUviwQw3xT1gP3qA4p2DVfwSana5Celc"
}
```


To obtain an API JWT Token

### HTTP Request

`POST {server_url}/auth/auth_token`

### Header Parameterr

Parameter | Default
--------- | -------
Content-type | application/json


### Request Body

Attribute | Required | Description
--------- | ------- | -----------
auth | true | parent attribute of api_key and password
↳&nbsp;api_key | true | Unique key assigned to you by your account manager
↳&nbsp;password | true | Unique password assigned to key by your account manager