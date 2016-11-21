# Savings Goals

## Savings Goal States

| State      | Description |
|------------|-------------|
| `active`   | The goal is being updated and is capable of generating alerts. |
| `archived` | The goal is no longer being updated or generating alerts. |

## Savings Goal Statuses

| Status     | Description |
|------------|-------------|
| `complete` | The goal has been accomplished. |
| `over`     | The goal's target completion date has passed. |
| `risk`     | The goal is not on target for completion on time. (Its current value is less than 80% of its expected current value). |
| `under`    | The goal is on target for completion on time. |

## Savings Goal Contributions

| Attribute              | Description |
|------------------------|-------------|
| `monthly_contribution` | The average monthly conrtibution (rounded to the nearest ten). |
| `target_contribution`  | The amount that will be contributed to this goal every month. |

## Get Savings Goal Images

```shell
curl -X "GET" "http://partner.url/api/v2/savings_goals" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/savings_goals')
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
var SavigsGoalImages = sdk.GetSavingsGoalImages();
```

> Response payload

```json
{
  "savings_goal_images": [
    {
      "id": "baby.jpg",
      "name": "Save for a baby",
      "url": "http://www.example.com/images/standard_goal_images/baby.jpg?1368824034"
    }
  ]
}

```
Return a list of pre-defined savings goal images.

`GET /api/v2/savings_goals`


### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |

## Get Savings Goals

```shell
curl -X "GET" "http://partner.url/api/v2/users/:user_id:/savings_goals" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/savings_goals')
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
var savingsGoalsResponse = sdk.GetSavingsGoals();
```

> Response payload

```json
{
  "savings_goals": [
    {
      "id": 583,
      "name": "Save for a Baby",
      "image_name": "baby.jpg",
      "image_url": "https://example.com/images/baby.jpg",
      "state": "active",
      "status": "risk",
      "initial_value": "10.00",
      "current_value": "200.00",
      "target_value": "2000.00",
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

Return a list of all savings goals for the given user.

`GET /api/v2/users/:user_id:/savings_goals`


### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |


## Get Savings Goal

```shell
curl -X "GET" "http://partner.url/api/v2/users/:user_id:/savings_goals/:savings_goals_id:" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/savings_goals/:savings_goals_id:')
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
var savingsGoalId = 12345;
var savingsGoalsResponse = sdk.GetSavingsGoal(savingsGoalId);
```

> Response payload

```json
{
  "savings_goals": [
    {
      "id": 583,
      "name": "Save for a Baby",
      "image_name": "baby.jpg",
      "image_url": "https://example.com/images/baby.jpg",
      "state": "active",
      "status": "risk",
      "initial_value": "10.00",
      "current_value": "200.00",
      "target_value": "2000.00",
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

Return a savings goal for the given user.

`GET /api/v2/users/:user_id:/savings_goals/:savings_goals_id:`


### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |


## Create Savings Goal

```shell
curl -X "POST" "http://partner.url/api/v2/users/:user_id:/savings_goals" -u ":geezeo-api-key::" -d ":request_payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/savings_goals')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Post.new uri.request_uri
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
var savingsGoalRequest = new SavingsGoalRequest{
	SavingsGoal = new SavingsGoalModel{
       AccountId = 4394169,
       ImageName = "house.jpg",
       Name = GoalName,
       LockedBalance = 200.00,
       TargetContribution = 50.00,
       TargetValue = 2000.00
	}
};

var savingsGoalsResponse = sdk.CreateSavingsGoal(savingsGoalRequest);
```

> Request payload

```json
{
  "savings_goal": {
    "account_id": 2189,
    "image_name": "baby.jpg",
    "name": "Save for a Baby",
    "locked_balance": "200.00",
    "target_contribution": "50.00",
    "target_value": "2000.00"
  }
}
```

Create a savings goal for the given user.

POST /api/v2/users/:user_id:/savings_goals


### Parameters

| Parameter | Description |
|-----------|-------------|
| `image_name` | The image that represents this payoff goal on the Geezeo dashboard. __Required__ |
| `name` | Short name describing this goal. __Required__ |
| `locked_balance` | The amount to reserve in the account (that will not apply to the goal) |
| `target_contribution` | The amount that will be contributed to this goal every month. __Required unless target_completion_on is included__ |
| `target_completion_on` | The date at which the target_value should be obtained. __Required unless target_completion_on is included__ |
| `target_value` | The total amount to be saved for this goal. __Required__ |
| `account_id` | The ID of the account that this savings goal should be added to. __Required__ |

### Status Codes

| Status | Description |
|--------|-------------|
| 201 Created | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
| 422 Unprocessable Entity | returned when the parameters given were invalid |


## Update Savings Goal

```shell
curl -X "PUT" "http://partner.url/api/v2/users/savings_goals/:savings_goal_id:" -u ":geezeo-api-key::" -d ":request_payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/users/savings_goals/:savings_goal_id:')
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
var savingsGoalId = 12345;
var savingsGoalRequest = new SavingsGoalRequest{
	SavingsGoal = new SavingsGoalModel{
       AccountId = 4394169,
       ImageName = "house.jpg",
       Name = GoalName,
       LockedBalance = 200.00,
       TargetContribution = 50.00,
       TargetValue = 2000.00
	}
};

var updated = sdk.UpdateSavingsGoal(savingsGoalId, savingsGoalRequest);
```

> Request payload

```json
{
  "savings_goal": {
    "account_id": 2189,
    "image_name": "baby.jpg",
    "name": "Save for a Baby",
    "locked_balance": "200.00",
    "target_contribution": "50.00",
    "target_value": "2000.00"
  }
}
```

Update a savings goal for the given user.

`PUT /api/v2/users/:user_id:/savings_goals/:savings_goals_id:`


### Parameters

| Parameter | Description |
|-----------|-------------|
| `image_name` | The image that represents this payoff goal on the Geezeo dashboard. __Required__ |
| `name` | Short name describing this goal. __Required__ |
| `locked_balance` | The amount to reserve in the account (that will not apply to the goal) |
| `target_contribution` | The amount that will be contributed to this goal every month. __Required unless target_completion_on is included__ |
| `target_completion_on` | The date at which the target_value should be obtained. __Required unless target_completion_on is included__ |
| `target_value` | The total amount to be saved for this goal. __Required__ |
| `account_id` | The ID of the account that this savings goal should be added to. __Required__ |



### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
| 422 Unprocessable Entity | returned when the parameters given were invalid |

## Delete Savings Goal

```shell
curl -X "DELETE" "http://partner.url/api/v2/users/:user_id:/savings_goals/:savings_goal_id:" -u ":geezeo-api-key::" 
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/savings_goals/:savings_goal_id:')
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
var savingsGoalId = 12345;
var savingsGoalRequest = new SavingsGoalRequest{
	SavingsGoal = new SavingsGoalModel{
       AccountId = 4394169,
       ImageName = "house.jpg",
       Name = GoalName,
       LockedBalance = 200.00,
       TargetContribution = 50.00,
       TargetValue = 2000.00
	}
};

var deleted = sdk.DeleteSavingsGoal(savingsGoalId);
```


Delete a savings goal for the given user.

`DELETE /api/v2/users/:user_id:/savings_goals/:savings_goals_id:`

### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |

## Archive Savings Goal

```shell
curl -X "PUT" "http://partner.url/api/v2/users/:user_id:/savings_goals/:savings_goal_id:/archive" -u ":geezeo-api-key::" 
```

```ruby
uri = URI('https://partner.url/api/v2/users/savings_goals/:savings_goal_id:/archive')
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
var savingsGoalId = 12345;
var archived = sdk.ArchiveSavingsGoal(savingsGoalId);
```


Archive a savings goal for the given user.

`PUT /api/v2/users/:user_id:/savings_goals/:savings_goals_id:/archive`

### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |

