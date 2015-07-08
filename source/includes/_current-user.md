# Current User

This endpoint operates on the currently authenticated user (OAuth user authentication is required).

## Get Current User

```shell
curl -X "GET" "http://geezeo.dev:3000/api/v2/users/current" -u "%geezeo-api-key%:"
```

```ruby
uri = URI('https://geezeobkdemo.mybankhq.com/api/v2/users/current')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end
```

> Response payload

```json
{
  "users": [
    {
      "id": "42",
      "login": "jsmith42",
      "first_name": "Alice",
      "last_name": "Smith",
      "email": "user@example.com",
      "login_count": 1,
      "last_login_at": "2013-09-29T15:16:36Z",
      "postal_code": "06252",
      "birth_year": 1980,
      "sex": "Male",
      "custom_tags": []
    }
  ]
}
```

Return information about the currently authenticated user.

`GET /api/v2/users/current`


### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |


## Update Current User

```shell
curl -X "PUT" "http://geezeo.dev:3000/api/v2/users/current" -u "%geezeo-api-key%:" -d ":request_payload:"
```

```ruby
uri = URI('https://geezeobkdemo.mybankhq.com/api/v2/users/current')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Put.new uri.request_uri
  request.basic_auth key,''
  request.body = :request_payload:

  response = http.request request

  puts response.body
end

```

> Request payload

```json
{
  "user": {
    "login": "bsmith24",
    "first_name": "B",
    "last_name": "Smith",
    "email": "user@example.com",
    "postal_code": 06252,
    "birth_year": 1980,
    "sex": "Male",
    "custom_tags": ["Coffee", "Food"]
  }
}
```

> Response payload

```json
{
  "users": [
    {
      "id": "42",
      "href": "http://example.com/api/v2/users/42",
      "login": "bsmith42",
      "first_name": "B",
      "last_name": "Smith",
      "email": "user@example.com",
      "login_count": 1,
      "last_login_at": "2013-09-29T15:16:36Z",
      "postal_code": "06252",
      "birth_year": 1980,
      "sex": "Male",
      "custom_tags": ["Coffee", "Food"]
    }
  ]
}
```

Update the currently authenticated user.

`PUT /api/v2/users/current`


### Parameters

| Parameter | Description |
|-----------|-------------|
| `id` | The user's partner customer id. __Required__ |
| `email` | The user's email address. __Required__ |
| `first_name` | The user's first name. __Required__ |
| `last_name` | The user's last name. __Required__ |
| `login` | The user's login for the PFM. |
| `postal_code` | The user's postal code. |
| `birth_year` | The year the user was born. |
| `sex` | The sex of the user. Either "Male" or "Female". |
| `custom_tags` | A list of tags the user has added. |


### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 422 Unprocessable Entity | returned when the parameters given were invalid |


## Delete Current User

```shell
curl -X "DELETE" "http://geezeo.dev:3000/api/v2/users/current" -u "%geezeo-api-key%:" 
```

```ruby
uri = URI('https://geezeobkdemo.mybankhq.com/api/v2/users/current')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Delete.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end

```

Delete the currently authenticated user.

`DELETE /api/v2/users/current`

### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |