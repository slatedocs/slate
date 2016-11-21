# Current Partner

## Get Current Partner

```shell
curl -X "GET" "http://partner.url/api/v2/partners/current" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/partners/current')
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
  "partners": [
    {
      "id": 42,
      "domain": "pfm.example.com",
      "product_name": "Money Manager",
      "modules": {
        "mobile": {
          "name": "Mobile Money Manager",
          "logout_url": "https://www.example.com/logout",
          "back_to_online_banking_url": "https://www.example.com/back_to_olb",
          "back_to_online_banking_label": "Back to Online Banking"
        }
      }
    }
  ]
}
```

Return information about the current partner.

`GET /api/v2/partners/current`


### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |

