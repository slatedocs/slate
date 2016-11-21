# Harvests

## Get Harvest Status

```shell
curl -X "GET" "http://partner.url/api/v2/users/:user_id:/harvest" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/harvest')
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
  "harvests": [
    {
      "status": "complete"
    }
  ]
}
```

Return the status of a harvest for the given user. It will return `working`
while harvesting, and change to `complete` when finished.

`GET /api/v2/users/:user_id:/harvest`

### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |


## Create Harvest

```shell
curl -X "POST" "http://partner.url/api/v2/users/:user_id:/harvest" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/harvest')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Post.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end
```

> Response payload

```json
{
  "harvests": [
    {
      "status": "working",
      "href": "http://example.com/api/v2/users/42/harvest"
    }
  ]
}
```

Start a new harvest for the given user. A new harvest will not be started if
one is already in progress.

`POST /api/v2/users/:user_id:/harvest`


### Status Codes

| Status | Description |
|--------|-------------|
| 201 Created | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |

