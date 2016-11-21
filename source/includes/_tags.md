# Tags

## Get Default Tags

```shell
curl -X "GET" "http://partner.url/api/v2/tags" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/tags')
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
  "tags": [
    "Clothing",
    "Education",
    "Entertainment",
    "Diningout",
    "Groceries",
    "Fees",
    "Health",
    "Home",
    "Income",
    "Personal",
    "Payment",
    "Savings",
    "Transfer",
    "Transportation",
    "Travel",
    "Utilities"
  ]
}
```

Return the default tags available to all users.

`GET /api/v2/tags`


### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |


## Get User Tags

```shell
curl -X "GET" "http://partner.url/api/v2/users/:user_id:/tags" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/tags')
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
  "tags": [
    "Coffee",
    "Shoes",
    "Clothing",
    "Education",
    "Entertainment",
    "Diningout",
    "Groceries",
    "Fees",
    "Health",
    "Home",
    "Income",
    "Personal",
    "Payment",
    "Savings",
    "Transfer",
    "Transportation",
    "Travel",
    "Utilities"
  ]
}
```

Return all custom tags a user has entered in addition to the default tags.

`GET /api/v2/users/:user_id:/tags`


### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
