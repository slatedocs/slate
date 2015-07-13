# Users

## Get Users

```shell
curl -X "GET" "http://partner.url/api/v2/users" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/users')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end
```

`GET /api/v2/users`

> Response payload

```json
{
  "meta": {
    "current_page": 1,
    "total_pages": 2
  },
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
Return a paginated list of all users.

### Parameters

| Parameter | Description |
|-----------|-------------|
| `page` | Return subsequent pages of results. |


### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |


## Get User

```shell
curl -X "GET" "http://partner.url/api/v2/users/:user_id:" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:')
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

Return information about a user.

`GET /api/v2/users/:user_id:`

### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |

## Create  User

```shell
curl -X "POST" "http://partner.url/api/v2/users" -u ":geezeo-api-key::" -d ":request_payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/users')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Post.new uri.request_uri
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
    "id": "42",
    "login": "bsmith24",
    "first_name": "B",
    "last_name": "Smith",
    "email": "user@example.com",
    "postal_code": "06252",
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
      "login_count": 0,
      "last_login_at": nil,
      "postal_code": "06252",
      "birth_year": 1980,
      "sex": "Male",
      "custom_tags": [
        "Coffee",
        "Food"
      ]
    }
  ]
}
```


Create a new user.
`POST /api/v2/users`


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
| 201 Created | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 422 Unprocessable Entity | returned when the parameters given were invalid |


## Update User

```shell
curl -X "PUT" "http://partner.url/api/v2/users/:user_id:" -u ":geezeo-api-key::" -d ":request_payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:')
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
    "id": 42,
    "login": "bsmith24",
    "first_name": "B",
    "last_name": "Smith",
    "email": "user@example.com",
    "postal_code": "06252",
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
      "custom_tags": [
        "Coffee",
        "Food"
      ]
    }
  ]
}
```

Update an existing user.

`PUT /api/v2/users/:user_id:`


### Parameters

| Parameter | Description |
|-----------|-------------|
| `id` | The user's partner customer id. |
| `login` | The user's login for the PFM. |
| `first_name` | The user's first name. |
| `last_name` | The user's last name. |
| `email` | The user's email address. |
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


## Delete User

```shell
curl -X "DELETE" "http://partner.url/api/v2/users/:user_id:" -u ":geezeo-api-key::" 
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Delete.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end

```

Delete a user.

`DELETE /api/v2/users/:user_id:`

### Status Codes

| Status | Description |
|--------|-------------|
| `204 No Content` | returned when successful |
| `401 Not Authorized` | returned when invalid credentials are provided |
| `404 Not Found` | returned when an invalid user is specified |
