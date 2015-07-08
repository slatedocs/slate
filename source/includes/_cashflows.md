# Cashflows

## Get Cashflows Configuration

```shell
curl -X "GET" "http://geezeo.dev:3000/api/v2/users/:user_id:/cashflow" -u "%geezeo-api-key%:"
```

```ruby
uri = URI('https://geezeobkdemo.mybankhq.com/api/v2/users/:user_id:/cashflow')
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
  "cashflows": [
    {
      "id": 42,
      "links": {
        "accounts": [
          854
        ]
      }
    }
  ],
  "accounts": [
    {
      "id": 854,
      "name": "eChecking",
      "balance": "300.54",
      "reference_id": "789274930",
      "aggregation_type": "partner",
      "state": "active",
      "harvest_updated_at": "2013-03-05T12:00:00Z",
      "account_type": "checking",
      "include_in_expenses": true,
      "include_in_budget": true,
      "include_in_cashflow": true,
      "include_in_dashboard": true,
      "include_in_goals": true,
      "include_in_networth": true,
      "fi": null,
      "cashedge_account_type": null
    }
  ]
}
```

Return a user's cashflow configuration and all accounts included in the
cashflow calculation.

`GET /api/v2/users/:user_id:/cashflow`


### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |


## Update Cashflow

```shell
curl -X "PUT" "http://geezeo.dev:3000/api/v2/users/:user_id:/cashflow" -u "%geezeo-api-key%:" -d ":request_payload:"
```

```ruby
uri = URI('https://geezeobkdemo.mybankhq.com/api/v2/users/:user_id:/cashflow')
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
  "cashflow": {
    "account_ids": [
      854
    ]
  }
}
```


Update a user's cashflow configuration.

`PUT /api/v2/users/:user_id:/cashflow`


### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |

