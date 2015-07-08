# Cashflow Events

A cashflow event is the individual occurrence of a bill or income.

## Get Cashflow Events

```shell
curl -X "GET" "http://geezeo.dev:3000/api/v2/users/:user_id:/cashflow/events" -u "%geezeo-api-key%:"
```

```ruby
uri = URI('https://geezeobkdemo.mybankhq.com/api/v2/users/:user_id:/cashflow/events')
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
  "events": [
    {
      "id": 599,
      "amount": "-100.0",
      "memo": "memo",
      "name": "name",
      "paid": true,
      "scheduled_date": "2013-07-18",
      "links": {
        "bill": 273,
        "income": 441
      }
    }
  ],
  "balances": [
    {
      "balance": 0,
      "date": "2013-07-24"
    }
  ],
  "bills": [
    {
      "id": 273,
      "amount": "-100.0",
      "frequency": "Once",
      "name": "name",
      "start_date": "2013-07-16",
      "stopped_on": "2013-07-17"
    }
  ],
  "incomes": [
    {
      "id": 441,
      "amount": "100.0",
      "frequency": "Once",
      "name": "name",
      "start_date": "2013-07-16",
      "stopped_on": "2013-07-17"
    }
  ]
}
```

Return a list of all cashflow events for a user during a specified date range.

`GET /api/v2/users/:user_id:/cashflow/events`

### Parameters

| Parameter | Description |
|-----------|-------------|
| `begin_on` | Limit results to after this date (inclusive), in ISO-8601 format. Defaults to today if `end_on` is not provided, or 31 days before `end_on` if `end_on` is provided. |
| `end_on` | Limit results to before this date (inclusive), in ISO-8601 format. Defaults to 31 days after begin_on. |



__Note:__ Daily cashflow balances are calculated based on current account balances.  These daily balances are only available for the current and future cashflow dates.

### Request with  specific dates

`GET /api/v2/users/:user_id:/cashflow/events?begin_on=2013-10-18&end_on=2013-11-18`


## Update Cashflow Event

```shell
curl -X "PUT" "http://geezeo.dev:3000/api/v2/users/:user_id:/cashflow/events/:cashflow_event_id:" -u "%geezeo-api-key%:" -d ":request_payload:"
```

```ruby
uri = URI('https://geezeobkdemo.mybankhq.com/api/v2/users/:user_id:/events/bills/:cashflow_event_id:')
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
  "event": {
    "memo": "memo",
    "paid": true
  }
}
```

Update an existing cashflow event.


`PUT /api/v2/users/:user_id:/cashflow/events/:cashflow_event_id:`


### Parameters

| Parameter | Description |
|-----------|-------------|
| `memo` | The event's memo. |
| `paid` | True if the event has been paid; false otherwise. |

### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
| 422 Unprocessable Entity | returned when the parameters given were invalid |


## Delete Cashflow Event

```shell
curl -X "DELETE" "http://geezeo.dev:3000/api/v2/users/:user_id:/cashflow/events/:cashflow_event_id:" -u "%geezeo-api-key%:" 
```

```ruby
uri = URI('https://geezeobkdemo.mybankhq.com/api/v2/users/:user_id:/cashflow/events/:cashflow_event_id:')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Delete.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end

```


Delete a cashflow event.

`DELETE /api/v2/users/:user_id:/cashflow/events/:cashflow_event_id:`

### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |

