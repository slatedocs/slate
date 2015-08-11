# Cashflow Bills

## Get Cashflow Bills

```shell
curl -X "GET" "http://partner.url/api/v2/users/:user_id:/cashflow/bills" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/cashflow/bills')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end

```


```csharp
var apiKey = "geezeo-api-key";
var url = "partner.url";
var userId = "user_id";
var sdk = new SDK(apiKey, url, userId);
var billsResponse = sdk.GetCashflowBills();

```

> Response payload

```json
{
  "bills": [
    {
      "id": 387,
      "amount": "-100.0",
      "frequency": "Weekly",
      "name": "Electric Bill",
      "start_date": "2013-07-16",
      "stopped_on": "2013-07-17"
    }
  ]
}
```


Return a list of all cashflow bills defined for a user.

`GET /api/v2/users/:user_id:/cashflow/bills`

### Frequency
Frequency will be one of the values defined below.

| Frequency | | |
| --------- |-----|-----|
|`Daily`|`Every four weeks`|`Every other week`|
|`Every six months`| `Monthly`| `Once`| 
|`Quarterly`| `Twice a month`| `Weekly`|
|`Yearly`|

### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |


## Get Cashflow Bill

```shell
curl -X "GET" "http://partner.url/api/v2/users/:user_id:/cashflow/bills/:cashflow_bill_id:" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/cashflow/bills/:cashflow_bill_id:')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end

```

```csharp
var apiKey = "geezeo-api-key";
var url = "partner.url";
var userId = "user_id";
var sdk = new SDK(apiKey, url, userId);
var billId = 12345;
var billsResponse = sdk.GetCashflowBill(billId);
```


> Response payload

```json
{
  "bills": [
    {
      "id": 387,
      "amount": "-100.0",
      "frequency": "Weekly",
      "name": "Electric Bill",
      "start_date": "2013-07-16",
      "stopped_on": "2013-07-17"
    }
  ]
}
```


Return complete information for a cashflow bill.

`GET /api/v2/users/:user_id:/cashflow/bills/:cashflow_bill_id:`

### Frequency
Frequency will be one of the values defined below.

| Frequency | | |
| --------- |-----|-----|
|`Daily`|`Every four weeks`|`Every other week`|
|`Every six months`| `Monthly`| `Once`| 
|`Quarterly`| `Twice a month`| `Weekly`|
|`Yearly`|



### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user or bill is specified |


## Create Cashflow Bill

```shell
curl -X "POST" "http://partner.url/api/v2/users/:user_id:/cashflow/bills" -u ":geezeo-api-key::" -d ":request_payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/cashflow/bills')
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

```csharp
var apiKey = "geezeo-api-key";
var url = "partner.url";
var userId = "user_id";
var sdk = new SDK(apiKey, url, userId);
var billRequest = new BillRequestModel{
	Bill = new BillModel{
		Amount = 200f,
		Frequency = Frequency.Daily,
		Name = "Test Bill",
		StartDate = new DateTime(2015, 7, 1)
	}
};

var billResponse = sdk.CreateBill(billRequest);
```


> Request Payload

```json
{
  "bill": {
    "amount": -100.0,
    "frequency": "Weekly",
    "name": "Electric Bill",
    "start_date": "2013-07-17"
  }
}
```

> Response payload

```json
{
  "bills": [
    {
      "id": 387,
      "amount": "-100.0",
      "frequency": "Weekly",
      "name": "Electric Bill",
      "start_date": "2013-07-17",
      "stopped_on": null
    }
  ]
}
```

Create a new cashflow bill.

`POST /api/v2/users/:user_id:/cashflow/bills`


### Parameters

| Parameter | Description |
|-----------|-------------|
| `amount` | The bill's amount. If positive, it will be converted to a negative number. __Required__ |
| `frequency` | How often the bill recurs.  __Required__ |
| `name` | The bill's payee. __Required__ |
| `start_date` | The bill's start date, in ISO-8601 format. __Required__ |

### Frequency
Frequency will be one of the values defined below.

| Frequency | | |
| --------- |-----|-----|
|`Daily`|`Every four weeks`|`Every other week`|
|`Every six months`| `Monthly`| `Once`| 
|`Quarterly`| `Twice a month`| `Weekly`|
|`Yearly`|


### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
| 422 Unprocessable Entity | returned when the parameters given were invalid |


## Update Cashflow Bill


```shell
curl -X "PUT" "http://partner.url/api/v2/users/:user_id:/cashflow/bills/:cashflow_bill_id:" -u ":geezeo-api-key::" -d ":request_payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/cashflow/bills/:cashflow_bill_id:')
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
```csharp
var apiKey = "geezeo-api-key";
var url = "partner.url";
var userId = "user_id";
var sdk = new SDK(apiKey, url, userId);
var billId = 12345;
var billRequest = new BillRequestModel{
	Bill = new BillModel{
		Amount = 200f,
		Frequency = Frequency.Daily,
		Name = "Test Bill",
		StartDate = new DateTime(2015, 7, 1)
	}
};

var updated = sdk.UpdateBill(billId, billRequest);
```


> Request payload

```json
{
  "bill": {
    "amount": -100.0,
    "frequency": "Weekly",
    "name": "Electric Bill",
    "start_date": "2013-07-17"
  }
}
```

Update an existing cashflow bill.

`PUT /api/v2/users/:user_id:/cashflow/bills/:cashflow_bill_id:`


### Parameters

| Parameter | Description |
|-----------|-------------|
| `amount` | The bill's amount. If positive, it will be converted to a negative number. __Required__ |
| `frequency` | How often the bill recurs. __Required__ |
| `name` | The bill's payee. __Required__ |
| `start_date` | The bill's start date, in ISO-8601 format. __Required__ |

### Frequency
Frequency will be one of the values defined below.

| Frequency | | |
| --------- |-----|-----|
|`Daily`|`Every four weeks`|`Every other week`|
|`Every six months`| `Monthly`| `Once`| 
|`Quarterly`| `Twice a month`| `Weekly`|
|`Yearly`|

### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user or bill is specified |
| 422 Unprocessable Entity | returned when the parameters given were invalid |


## Stop Cashflow Bill

```shell
curl -X "PUT" "http://partner.url/api/v2/users/:user_id:/cashflow/bills/:cashflow_bill_id:/stop" -u ":geezeo-api-key::" 
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/cashflow/bills/:cashflow_bill_id:/stop')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Put.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end

```

```csharp
var apiKey = "geezeo-api-key";
var url = "partner.url";
var userId = "user_id";
var sdk = new SDK(apiKey, url, userId);
var billId = 12345;

var stopped = sdk.StopBill(billId);
```

Stop a cashflow bill.

`PUT /api/v2/users/:user_id:/cashflow/bills/:cashflow_bill_id:/stop`

### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user or bill is specified |


## Delete Cashflow Bill

```shell
curl -X "DELETE" "http://partner.url/api/v2/users/:user_id:/cashflow/bills/:cashflow_bill_id:" -u ":geezeo-api-key::" 
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/cashflow/bills/:cashflow_bill_id:')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Delete.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end

```
```csharp
var apiKey = "geezeo-api-key";
var url = "partner.url";
var userId = "user_id";
var sdk = new SDK(apiKey, url, userId);
var billId = 12345;
sdk.DeleteBill(billId);
```

Delete a cashflow bill.

`DELETE /api/v2/users/:user_id:/cashflow/bills/:cashflow_bill_id:`

### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user or bill is specified |

