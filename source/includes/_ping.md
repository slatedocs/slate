# Ping

## Get Ping

```shell
curl -X "GET" "http://partner.url/api/v2/ping" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/ping')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end
```

```c#
var apiKey = "geezeo-api-key";
var url = "partner.url";
var userId = "user_id";
var sdk = new SDK(apiKey, url, userId);
var pingResponse = sdk.Ping();
//response object includes a bool value indicating success
```


> Response payload

```json
{
  "response": "PONG"
}
```

Verify connectivity to the API.

`GET /api/v2/ping`


### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
