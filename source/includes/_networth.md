# Networth

## Get Networth

```shell
curl -X "GET" "http://partner.url/api/v2/users/:user_id:/networth" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/networth')
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
var networth = sdk.GetNetworth();
```



> Response payload

```json
{
  "meta": {
    "net_worth": "1000.0",
    "net_worth_change": "2000.0",
    "total_assets": "3000.0",
    "total_debts": "2000.0"
  },
  "assets": [
    {
      "id": 42,
      "balance": "1000.0",
      "name": "Savings",
      "additional_networth_account": false
    },
    {
      "id": 43,
      "balance": "2000.0",
      "name": "Coffee Beans",
      "additional_networth_account": true
    }
  ],
  "debts": [
    {
      "id": 44,
      "balance": "2000.0",
      "name": "Car Loan",
      "additional_networth_account": true
    }
  ],
  "networth_histories": [
    {
      "total": "-1000.0",
      "total_asset": "1000.0",
      "total_debt": "2000.0",
      "month": 08,
      "year": 2013,
      "since_last_month": "-1000.0"
    }
  ]
}
```

Return a user's networth.

`GET /api/v2/users/:user_id:/networth`


### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |


## Create Networth Account

```shell
curl -X "POST" "http://partner.url/api/v2/users/:user_id:/networth/accounts" -u ":geezeo-api-key::" -d ":request_payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/networth/accounts')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth key,''
  request.body = :request_payload:

  response = http.request request

  puts response.body
end

```

```c#
var apiKey = "geezeo-api-key";
var url = "partner.url";
var userId = "user_id";
var sdk = new SDK(apiKey, url, userId);
var networth = new NetworthAccountRequestModel{
	Networth = new NetworthAccountModel{
		AccountType = AccountType.Debt,
		Balance = 1000,
		Name = "House"
	}
}
var networthAccountsResponse = sdk.CreateNetworth(networth);
```


> Request payload

```json
{
  "networth_account": {
    "account_type": "debt",
    "balance": 1000,
    "name": "House"
  }
}
```

Create a networth account.

`POST /api/v2/users/:user_id:/networth/accounts`


### Parameters

| Parameter | Description |
|-----------|-------------|
| `account_type` | Account type ("debt" or "asset"). __Required__ |
| `balance` | Account balance. __Required__ |
| `name` | Account name. __Required__ |

### Status Codes

| Status | Description |
|--------|-------------|
| 201 Created | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
| 422 Unprocessable Entity | returned when the parameters given were invalid |


## Update Networth Account

```shell
curl -X "PUT" "http://partner.url/api/v2/users/:user_id:/networth/accounts/:account_id:" -u ":geezeo-api-key::" -d ":request_payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/networth/accounts/:account_id:')
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

```c#
var apiKey = "geezeo-api-key";
var url = "partner.url";
var userId = "user_id";
var sdk = new SDK(apiKey, url, userId);
var networthId = 12345;
var networth = new NetworthAccountRequestModel{
	Networth = new NetworthAccountModel{
		AccountType = AccountType.Debt,
		Balance = 1000,
		Name = "House"
	}
}
var updated = sdk.UpdateNetworth(networthId, networth);
```


> Request payload


```json
{
  "networth_account": {
        "account_type": "debt",
        "balance": 1000,
        "name": "House"
  }
}
```

Update a networth account.

`PUT /api/v2/users/:user_id:/networth/accounts/:account_id:`

### Parameters

| Parameter | Description |
|-----------|-------------|
| `account_type` | Account type ("debt" or "asset"). __Required__ |
| `balance` | Account balance. __Required__ |
| `name` | Account name. __Required__ |

### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
| 422 Unprocessable Entity | returned when the parameters given were invalid |


## Delete Networth Account

```shell
curl -X "DELETE" "http://partner.url/api/v2/users/:user_id:/networth/accounts/:account_id:" -u ":geezeo-api-key::" 
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/networth/accounts/:account_id:')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Delete.new uri.request_uri
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
var networthId = 12345;
var deleted = sdk.DeleteNetworth(networthId);
```


Delete a networth account.

`DELETE /api/v2/users/:user_id:/networth/accounts/:account_id:`

### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
