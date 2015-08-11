# Expenses

## Get Expenses

```shell
curl -X "GET" "http://partner.url/api/v2/users/:user_id:/expenses" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/expenses')
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
var expenses = sdk.GetExpenses(null) //pass in either a null or empty search criteria object (new ExpenseSearchCriteriaModel())
```


> Response payload

```json
{
  "expenses": [
    {
      "tag": "Utilities",
      "amount": "1291.96"
    },
    {
      "tag": "Personal",
      "amount": "325.00"
    },
    {
      "tag": "Other",
      "amount": "95.02"
    },
  ]
}
```

Return expenses calculated by tag for the given user.

`GET /api/v2/users/:user_id:/expenses`

### Parameters

| Parameter | Description |
|-----------|-------------|
| `begin_on` | The start date to begin calculating expenses (default: thirty days ago). |
| `end_on` | The end date to begin calculating expenses (default: today). |
| `threshold` | The percentage of the remaining expenses that are grouped into an 'other' tag (default: 80). |


### Request with Threshold

    `GET /api/v2/users/:user_id:/expenses?threshold=100

```csharp
var apiKey = "geezeo-api-key";
var url = "partner.url";
var userId = "user_id";
var sdk = new SDK(apiKey, url, userId);
// Criteria model also has BeginOn and EndOn parameters
var searchCriteria = new ExpenseSearchCriteriaModel{
	Threshold = 100
};

var expenses = sdk.GetExpenses(searchCriteria);

```

### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |


## Helpers

### Get Last Month

Return expenses from last month for the given user.

`GET /api/v2/users/:user_id:/expenses/last_month`

```csharp
var apiKey = "geezeo-api-key";
var url = "partner.url";
var userId = "user_id";
var sdk = new SDK(apiKey, url, userId);
var expenses = sdk.GetExpensesForLastMonth();

```

### Get This Month

Return expenses from this month for the given user.

`GET /api/v2/users/:user_id:/expenses/this_month`

```csharp
var apiKey = "geezeo-api-key";
var url = "partner.url";
var userId = "user_id";
var sdk = new SDK(apiKey, url, userId);
var expenses = sdk.GetExpensesForThisMonth();

```

### Get Last 30 Days

Return expenses from last thirty days for the given user.

`GET /api/v2/users/:user_id:/expenses/last_thirty_days`

```csharp
var apiKey = "geezeo-api-key";
var url = "partner.url";
var userId = "user_id";
var sdk = new SDK(apiKey, url, userId);
var expenses = sdk.GetExpensesForLastThirtyDays();

```

