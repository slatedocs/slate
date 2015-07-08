# Payoff Goals

## Payoff Goal States

| State      | Description |
|------------|-------------|
| `active`   | The goal is being updated and is capable of generating alerts. |
| `archived` | The goal is no longer being updated or generating alerts. |

## Payoff Goal Statuses

| Status     | Description |
|------------|-------------|
| `complete` | The goal has been accomplished. |
| `over`     | The goal's target completion date has passed. |
| `risk`     | The goal is not on target for completion on time. (Its current value is less than 80% of its expected current value). |
| `under`    | The goal is on target for completion on time. |

## Payoff Goal Contributions

| Attribute              | Description |
|------------------------|-------------|
| `monthly_contribution` | The average monthly conrtibution (rounded to the nearest ten). |
| `target_contribution`  | The amount that will be contributed to this goal every month. |

## Get Payoff Goal Images

```shell
curl -X "GET" "http://geezeo.dev:3000/api/v2/payoff_goals" -u "%geezeo-api-key%:"
```

```ruby
uri = URI('https://geezeobkdemo.mybankhq.com/api/v2/payoff_goals')
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
  "payoff_goal_images": [
    {
      "id": "credit_card.jpg",
      "name": "Pay off a credit card",
      "url": "http://www.example.com/images/standard_goal_images/credit_card.jpg?1368824034"
    }
  ]
}

```
Return a list of pre-defined payoff goal images.

`GET /api/v2/payoff_goals`


### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |

## Get Payoff Goals

```shell
curl -X "GET" "http://geezeo.dev:3000/api/v2/users/:user_id:/payoff_goals" -u "%geezeo-api-key%:"
```

```ruby
uri = URI('https://geezeobkdemo.mybankhq.com/api/v2/users/:user_id:/payoff_goals')
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
  "payoff_goals": [
    {
      "id": 583,
      "name": "Payoff a car",
      "image_name": "car.jpg",
      "image_url": "https://example.com/images/car.jpg",
      "state": "active",
      "status": "risk",
      "initial_value": "10.00",
      "current_value": "200.00",
      "target_value": "0.00",
      "monthly_contribution": "50.00",
      "percent_complete": 2,
      "complete": false,
      "target_completion_on": "2014-05-21",
      "target_contribution": "50.00",
      "created_at": "2013-01-01T16:54:15Z",
      "updated_at": "2013-10-01T20:21:01Z",
      "links": {
        "accounts": [2944]
      }
    }
  ]
}
```

Return a list of payoff goals for the given user.

`GET /api/v2/users/:user_id:/payoff_goals`


### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |


## Get Payoff Goal

```shell
curl -X "GET" "http://geezeo.dev:3000/api/v2/users/:user_id:/payoff_goals/:payoff_goals_id:" -u "%geezeo-api-key%:"
```

```ruby
uri = URI('https://geezeobkdemo.mybankhq.com/api/v2/users/:user_id:/payoff_goals/:payoff_goals_id:')
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
  "payoff_goals": [
    {
      "id": 583,
      "name": "Payoff a car",
      "image_name": "car.jpg",
      "image_url": "https://example.com/images/car.jpg",
      "state": "active",
      "status": "risk",
      "initial_value": "10.00",
      "current_value": "200.00",
      "target_value": "0.00",
      "monthly_contribution": "50.00",
      "percent_complete": 2,
      "complete": false,
      "target_completion_on": "2014-05-21",
      "target_contribution": "50.00",
      "created_at": "2013-01-01T16:54:15Z",
      "updated_at": "2013-10-01T20:21:01Z",
      "links": {
        "accounts": [2944]
      }
    }
  ]
}
```

Return a payoff goal for the given user.

`GET /api/v2/users/:user_id:/payoff_goals/:payoff_goals_id:`



## Create Payoff Goal

```shell
curl -X "POST" "http://geezeo.dev:3000/api/v2/users/:user_id:/payoff_goals" -u "%geezeo-api-key%:" -d ":request_payload:"
```

```ruby
uri = URI('https://geezeobkdemo.mybankhq.com/api/v2/users/:user_id:/payoff_goals')
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

> Request payload

```json
{
  "payoff_goal": {
    "image_name": "car.jpg",
    "name": "Payoff a car",
    "target_contribution": "50.00",
    "account_ids": [
      2189
    ]
  }
}
```

> Response payload

```json
{
  "payoff_goals": [
    {
      "id": 583,
      "name": "Payoff a car",
      "image_name": "car.jpg",
      "image_url": "https://example.com/images/car.jpg",
      "state": "active",
      "status": "risk",
      "initial_value": "10.00",
      "current_value": "200.00",
      "target_value": "0.00",
      "monthly_contribution": "50.00",
      "percent_complete": 2,
      "complete": false,
      "target_completion_on": "2014-05-21",
      "created_at": "2013-01-01T16:54:15Z",
      "updated_at": "2013-10-01T20:21:01Z",
      "links": {
        "accounts": [2189]
      }
    }
  ]
}
```

Create a payoff goal for the given user.

`POST /api/v2/users/:user_id:/payoff_goals`

### Parameters

| Parameter | Description |
|-----------|-------------|
| `image_name` | The image that represents this payoff goal on the Geezeo dashboard. __Required__ |
| `name` | Short name describing this goal. __Required__ |
| `target_contribution` | The amount that will be contributed to this goal every month. __Required unless target_completion_on is included__ |
| `target_completion_on` | The date at which this goal should be obtained. __Required unless target_completion_on is included__ |
| `account_ids` | The IDs of the Geezeo accounts that this payoff goal should be applied to. (The loan being paid-off has also been added to Geezeo) __Required__ |


### Status Codes

| Status | Description |
|--------|-------------|
| 201 Created | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
| 422 Unprocessable Entity | returned when the parameters given were invalid |


## Update Payoff Goal

```shell
curl -X "PUT" "http://geezeo.dev:3000/api/v2/users/payoff_goals/:payoff_goal_id:" -u "%geezeo-api-key%:" -d ":request_payload:"
```

```ruby
uri = URI('https://geezeobkdemo.mybankhq.com/api/v2/users/payoff_goals/:payoff_goal_id:')
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
  "payoff_goal": {
    "image_name": "car.jpg",
    "name": "Payoff a car",
    "target_contribution": "50.00",
    "account_ids": [
      2189
    ]
  }
}
```

Update a payoff goal for the given user.

`PUT /api/v2/users/:user_id:/payoff_goals/:payoff_goal_id:`


### Parameters

| Parameter | Description |
|-----------|-------------|
| `image_name` | The image that represents this payoff goal on the Geezeo dashboard. __Required__ |
| `name` | Short name describing this goal. __Required__ |
| `target_contribution` | The amount that will be contributed to this goal every month. __Required unless target_completion_on is included__ |
| `target_completion_on` | The date at which this goal should be obtained. __Required unless target_completion_on is included__ |
| `account_ids` | The IDs of the Geezeo accounts that this payoff goal should be applied to. (The loan being paid-off has also been added to Geezeo) __Required__ |

### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
| 422 Unprocessable Entity | returned when the parameters given were invalid |


## Delete Payoff Goal

```shell
curl -X "DELETE" "http://geezeo.dev:3000/api/v2/users/:user_id:/payoff_goals/:payoff_goal_id:" -u "%geezeo-api-key%:" 
```

```ruby
uri = URI('https://geezeobkdemo.mybankhq.com/api/v2/users/:user_id:/payoff_goals/:payoff_goal_id:')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Delete.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end

```


Delete a payoff goal for the given user.

`DELETE /api/v2/users/:user_id:/payoff_goals/:payoff_goal_id:`


### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |


## Archive Payoff Goal

```shell
curl -X "PUT" "http://geezeo.dev:3000/api/v2/users/:user_id:/payoff_goals/:payoff_goal_id:/archive" -u "%geezeo-api-key%:" 
```

```ruby
uri = URI('https://geezeobkdemo.mybankhq.com/api/v2/users/payoff_goals/:payoff_goal_id:/archive')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Put.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end

```


Archive a payoff goal for the given user.

`PUT /api/v2/users/:user_id:/payoff_goals/:payoff_goal_id:/archive`

### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |

