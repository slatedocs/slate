# Alerts

## Get Alerts

```shell
curl -X "GET" "http://partner.url/api/v2/users/:user_id:/alerts" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/alerts')
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
var alertContainer = sdk.GetAlerts();

/*
AlertContainer contains the following public fields:

		public List<AccountThresholdAlertResponse> AccountThresholdAlerts;
        public List<GoalAlertResponse> GoalAlerts;
        public List<MerchantNameAlertResponse> MerchantNameAlerts;
        public List<SpendingTargetAlertResponse> SpendingTargetAlerts;
        public List<TransactionLimitAlertResponse> TransactionLimitAlerts;
        public List<UpcomingBillAlertResponse> UpcomingBillAlerts;

*/
```

> Response payload

```json
{
  "alerts": [
    {
      "id": 170,
      "options": {
        "threshold_amount": 0.0,
        "threshold_type": "minimum"
      },
      "email_delivery": true,
      "sms_delivery": true,
      "source_type": "Account",
      "source_id": "2944",
      "type": "AccountThresholdAlert",
      "source": {
        "id": 2944,
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
        "fi": {
          "id": 2,
          "name": "CashEdge Test Bank (Agg) - Retail Non 2FA"
        },
        "cashedge_account_type": {
          "name": "Savings",
          "acct_type": "SDA",
          "ext_type": "SDA",
          "group": "Cash"
        }
      }
    },
    {
      "id": 171,
      "options": {
        "percentage": 50
      },
      "email_delivery": true,
      "sms_delivery": true,
      "source_type": "PayoffGoal",
      "source_id": 583,
      "type": "GoalAlert",
      "source": {
        "id": 583,
        "name": "Payoff a car",
        "image_name": "car.jpg",
        "state": "active",
        "status": "risk",
        "initial_value": "10.00",
        "current_value": "200.00",
        "target_value": "0.00",
        "monthly_contribution": "50.00",
        "percent_complete": 5,
        "complete": false,
        "target_completion_on": "2014-05-21",
        "created_at": "2013-01-01T16:54:15Z",
        "updated_at": "2013-10-01T20:21:01Z",
        "links": {
          "accounts": [2944]
        }
      }
    }
  ]
}
```

Return a list of all alerts for a user.

`GET /api/v2/users/:user_id:/alerts`

For c#, the response is wrapped in the AlertContainer class which contains a list of each alert type. 


### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |

## Get Alert

```shell
curl -X "GET" "http://partner.url/api/v2/users/:user_id:/alerts/:alert_id:" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/alerts/:alert_id:')
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
var alertId = 12345;
var alertContainer = sdk.GetAlertById(alertId);
```

> Response payload

```json
{
  "alerts": [
    {
      "id": 170,
      "options": {
        "threshold_amount": 0.0,
        "threshold_type": "minimum"
      },
      "email_delivery": true,
      "sms_delivery": true,
      "source_type": "Account",
      "source_id": "2944",
      "type": "AccountThresholdAlert",
      "source": {
        "id": 2944,
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
        "fi": {
          "id": 2,
          "name": "CashEdge Test Bank (Agg) - Retail Non 2FA"
        },
        "cashedge_account_type": {
          "name": "Savings",
          "acct_type": "SDA",
          "ext_type": "SDA",
          "group": "Cash"
        }
      }
    }
  ]
}
```

Return an alert for the given user.

`GET /api/v2/users/:user_id:/alerts/:alert_id:`

### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |


## Delete Alert

```shell
curl -X "DELETE" "http://partner.url/api/v2/users/:user_id:/alerts/:alert_id:" -u ":geezeo-api-key::" 
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/alerts/:alert_id:')
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
var alertId = 12345;
var alertContainer = sdk.DeleteAlert(alertId);
```

Delete an alert for the given user.

`DELETE /api/v2/users/:user_id:/alerts/:alert_id:`



### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |


## Create Account Threshold Alert

```shell
curl -X "POST" "http://partner.url/api/v2/users/:user_id:/alerts/account_thresholds" -u ":geezeo-api-key::" -d ":request_payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/alerts/account_thresholds')
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

var thresholdAlert = new ThresholdAlertRequestModel{
	Alert = new ThresholdAlertModel{
		AccountId = 4394163,
        ThresholdType = ThresholdType.Minimum,
        ThresholdAmount = 80,
        EmailDelivery = true,
        SMSDelivery = false
	}
};

var response = sdk.CreateThresholdAlert(thresholdAlert);
```

> Request payload

```json
{
  "alert": {
    "account_id": 42,
    "threshold_amount": 100,
    "threshold_type": "minimum",
    "email_delivery": 1,
    "sms_delivery": 1
  }
}
```

Create an account threshold alert for the given user.

`POST /api/v2/users/:user_id:/alerts/account_thresholds`


### Parameters

| Parameter name| Parameter Description |
|-----------|-------------|
| `account_id` | The account that this alert should monitor. __Required__ |
| `threshold_amount` | The amount, in dollars, at which the alert will be triggered. __Required__ |
| `threshold_type` | Trigger the alert by going above the (`maximum`) or below the (`minimum`) `alert[threshold_amount]`. Valid values are `maximum` and `minimum`. __Required__ |
| `email_delivery` | Send an email when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |
| `sms_delivery` | Send an SMS message when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |


### Status Codes

| Status | Description |
|--------|-------------|
| 201 Created | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
| 422 Unprocessable Entity | returned when the parameters given were invalid |


## Update Account Threshold Alert

```shell
curl -X "PUT" "http://partner.url/api/v2/users/alerts/account_thresholds/:alert_id:" -u ":geezeo-api-key::" -d ":request_payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/users/alerts/account_thresholds/:alert_id:')
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
var alertId = 12345;

var thresholdAlert = new ThresholdAlertRequestModel{
	Alert = new ThresholdAlertModel{
		AccountId = 4394163,
        ThresholdType = ThresholdType.Minimum,
        ThresholdAmount = 80,
        EmailDelivery = true,
        SMSDelivery = false
	}
};

var updated = sdk.UpdateThresholdAlert(alertId, thresholdAlert);
```

> Request payload

```json
{
  "alert": {
    "threshold_amount": 100,
    "threshold_type": "minimum",
    "email_delivery": 1,
    "sms_delivery": 1
  }
}
```

Update an account threshold alert for the given user.

`PUT /api/v2/users/:user_id:/alerts/account_thresholds/:alert_id:`

### Parameters

| Parameter | Description |
|-----------|-------------|
| `account_id` | The account that this alert should monitor. |
| `threshold_amount` | The amount, in dollars, at which the alert will be triggered. |
| `threshold_type` | Trigger the alert by going above the (`maximum`) or below the (`minimum`) `threshold_amount`. Valid values are `maximum` and `minimum`. |
| `email_delivery` | Send an email when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |
| `sms_delivery` | Send an SMS message when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |


### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
| 422 Unprocessable Entity | returned when the parameters given were invalid |


## Create Goal Alert

```shell
curl -X "POST" "http://partner.url/api/v2/users/:user_id:/alerts/goals" -u ":geezeo-api-key::" -d ":request_payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/alerts/goals')
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
//create Savings Goal

var apiKey = "geezeo-api-key";
var url = "partner.url";
var userId = "user_id";
var sdk = new SDK(apiKey, url, userId);
var alertRequest = new SavingsGoalAlertRequestModel
{
    Alert = new SavingsGoalAlertModel
    {
        Percentage = 85,
        SavingsGoalId = 3998,
        EmailDelivery = true,
        SmsDelivery = false
    }
};

var createdAlert = sdk.CreateSavingsGoalAlert(alertRequest);

// Create Payoff Goal

var apiKey = "geezeo-api-key";
var url = "partner.url";
var userId = "user_id";
var sdk = new SDK(apiKey, url, userId);
var alertRequest = new PayoffGoalAlertRequestModel
{
    Alert = new PayoffGoalAlertModel
    {
        Percentage = 85,
        PayoffGoalId = 3998,
        EmailDelivery = true,
        SmsDelivery = false
    }
};

var createdAlert = sdk.UpdateSavingsGoalAlert(alertRequest);

```

> Request payload

```json
{
  "alert": {
    "percentage": 95,
    "payoff_goal_id": 432,
    "email_delivery": 1,
    "sms_delivery": 1
  }
}
```

Create a goal alert for the given user.

`POST /api/v2/users/:user_id:/alerts/goals`

### Parameters

| Parameter | Description |
|-----------|-------------|
| `percentage` | The percent completion at which to trigger the alert. __Required__ |
| `payoff_goal_id` | The ID of the payoff goal to monitor. This or `savings_goal_id` is required to be present. |
| `savings_goal_id` | The ID of the savings goal to monitor. This or `payoff_goal_id` is required to be present. |
| `email_delivery` | Send an email when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |
| `sms_delivery` | Send an SMS message when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |


### Status Codes

| Status | Description |
|--------|-------------|
| 201 Created | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
| 422 Unprocessable Entity | returned when the parameters given were invalid |


## Update Goal Alert

```shell
curl -X "PUT" "http://partner.url/api/v2/users/alerts/goals/:alert_id:" -u ":geezeo-api-key::" -d ":request_payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/users/alerts/goals/:alert_id:')
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
var alertRequest = new GoalAlertRequestModel
{
    Alert = new GoalAlertModel
    {
        Percentage = 85,
        EmailDelivery = true,
        SmsDelivery = false
    }
};

var createdAlert = sdk.UpdateGoalAlert(alertRequest);

```


> Request payload

```json
{
  "alert": {
    "percentage": 95,
    "email_delivery": 1,
    "sms_delivery": 1
  }
}
```

Update a goal alert for the given user.

`PUT /api/v2/users/:user_id:/alerts/goals/:alert_id:`

### Parameters

| Parameter | Description |
|-----------|-------------|
| `percentage` | The percent completion at which to trigger the alert. |
| `payoff_goal_id` | The ID of the payoff goal to monitor. This or `savings_goal_id` is required to be present. |
| `savings_goal_id` | The ID of the savings goal to monitor. This or `payoff_goal_id` is required to be present. |
| `email_delivery` | Send an email when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |
| `sms_delivery` | Send an SMS message when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |

### Response

The response body will be empty.

### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
| 422 Unprocessable Entity` | returned when the parameters given were invalid |


## Create Merchant Name Alert

```shell
curl -X "POST" "http://partner.url/api/v2/users/:user_id:/alerts/merchant_names" -u ":geezeo-api-key::" -d ":request_payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/alerts/merchant_names')
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
var merchantName = "test mart";
var alertRequest = new MerchantNameAlertRequestModel
{
    Alert = new MerchantNameAlertModel
    {
        Name = name,
        EmailDelivery = true,
        SmsDelivery = false
    }
};

var createdAlert = sdk.CreateMerchantNameAlert(alertRequest);
```

> Request payload

```json
{
  "alert": {
    "name": "Starbucks",
    "email_delivery": 1,
    "sms_delivery": 1
  }
}
```

Create a merchant name alert for the given user.

`POST /api/v2/users/:user_id:/alerts/merchant_names`


### Parameters

| Parameter | Description |
|-----------|-------------|
| `name` | The name of the merchant that when found in a transaction will trigger the alert __Required__. |
| `email_delivery` | Send an email when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |
| `sms_delivery` | Send an SMS message when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |

### Status Codes

| Status | Description |
|--------|-------------|
| 201 Created | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
| 422 Unprocessable Entity | returned when the parameters given were invalid |


## Update Merchant Name Alert

```shell
curl -X "PUT" "http://partner.url/api/v2/users/alerts/merchant_names/:alert_id:" -u ":geezeo-api-key::" -d ":request_payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/users/alerts/merchant_names/:alert_id:')
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
var alertId = 12345;
var merchantName = "test mart";
var alertRequest = new MerchantNameAlertRequestModel
{
    Alert = new MerchantNameAlertModel
    {
        Name = name,
        EmailDelivery = true,
        SmsDelivery = false
    }
};

var updated = sdk.UpdateMerchantNameAlert(alertId, alertRequest);
```


> Request payload

```json
{
  "alert": {
    "name": "Starbucks",
    "email_delivery": 1,
    "sms_delivery": 1
  }
}
```

Update a merchant name alert for the given user.

`PUT /api/v2/users/:user_id:/alerts/merchant_names/:alert_id:`

### Parameters

| Parameter | Description |
|-----------|-------------|
| `name` | The name of the merchant that when found in a transaction will trigger the alert. |
| `email_delivery` | Send an email when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |
| `sms_delivery` | Send an SMS message when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |


### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
| 422 Unprocessable Entity | returned when the parameters given were invalid |


## Create Spending Target Alert

> Request payload

```shell
curl -X "POST" "http://partner.url/api/v2/users/:user_id:/alerts/spending_targets" -u ":geezeo-api-key::" -d ":request_payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/alerts/spending_targets')
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
var budgetId = 56789;
var percentage = 70;
var alertRequest = new SpendingTargetAlertRequestModel
{
    Alert = new SpendingTargetAlertModel
    {
        BudgetId = budgetId,
        Percentage = percentage,
        EmailDelivery = true,
        SmsDelivery = false
    }
};

var createdAlert = sdk.CreateSpendingTargetAlert(alertRequest);
```


```json
{
  "alert": {
    "budget_id": 2213,
    "percentage": 70,
    "email_delivery": 1,
    "sms_delivery": 1
  }
}
```

Create a spending target alert for the given user.

`POST /api/v2/users/:user_id:/alerts/spending_targets`


### Parameters

| Parameter | Description |
|-----------|-------------|
| `budget_id`  | The ID of the budget to add the alert to. __Required__ |
| `percentage` | The integer percentage of the budget that when exceeded will trigger the alert. __Required__ |
| `email_delivery` | Send an email when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |
| `sms_delivery` | Send an SMS message when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |


### Status Codes

| Status | Description |
|--------|-------------|
| 201 Created | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
| 422 Unprocessable Entity | returned when the parameters given were invalid |


## Update Spending Target Alert

```shell
curl -X "PUT" "http://partner.url/api/v2/users/alerts/spending_targets/:alert_id:" -u ":geezeo-api-key::" -d ":request_payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/users/alerts/spending_targets/:alert_id:')
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
var alertId = 12345;
var budgetId = 56789;
var percentage = 70;
var alertRequest = new SpendingTargetAlertRequestModel
{
    Alert = new SpendingTargetAlertModel
    {
        BudgetId = budgetId,
        Percentage = percentage,
        EmailDelivery = true,
        SmsDelivery = false
    }
};

var updated = sdk.UpdateSpendingTargetAlert(alertId, alertRequest);
```

> Request payload

```json
{
  "alert": {
    "budget_id": 2213,
    "percentage": 70,
    "email_delivery": 1,
    "sms_delivery": 1
  }
}
```

Update a spending target alert for the given user.

`PUT /api/v2/users/:user_id:/alerts/spending_targets/:alert_id:`


### Parameters

| Parameter | Description |
|-----------|-------------|
| `budget_id` | The budget ID of the alert. |
| `percentage` | The integer percentage of the budget that when exceeded will trigger the alert. |
| `email_delivery` | Send an email when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |
| `sms_delivery` | Send an SMS message when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |


### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
| 422 Unprocessable Entity | returned when the parameters given were invalid |


## Create Transaction Limit Alert

```shell
curl -X "POST" "http://partner.url/api/v2/users/:user_id:/alerts/transaction_limits" -u ":geezeo-api-key::" -d ":request_payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/alerts/transaction_limits')
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
var accountId = 56789;
var limit = 100;
var alertRequest = new TransactionLimitAlertRequestModel
{
    Alert = new TransactionLimitAlertModel
    {
        AccountId = accountId,
        Limit = limit,
        EmailDelivery = true,
        SmsDelivery = false
    }
};

var createdAlert = sdk.CreateTransactionLimitAlert(alertRequest);
```


> Request payload

```json
{
  "alert": {
    "account_id": 42,
    "limit": 100,
    "email_delivery": 1,
    "sms_delivery": 1
  }
}
```

Create a transaction limit alert for the given user.

`POST /api/v2/users/:user_id:/alerts/transaction_limits`


### Parameters

| Parameter | Description |
|-----------|-------------|
| `account_id` | The account ID of the alert. __Required__ |
| `limit` | The integer amount (in dollars) of a transaction that when exceeded will trigger the alert. __Required__ |
| `email_delivery` | Send an email when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |
| `sms_delivery` | Send an SMS message when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |

### Status Codes

| Status | Description |
|--------|-------------|
| 201 Created | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
| 422 Unprocessable Entity | returned when the parameters given were invalid |


## Update Transaction Limit Alert

```shell
curl -X "PUT" "http://partner.url/api/v2/users/alerts/transaction_limits/:alert_id:" -u ":geezeo-api-key::" -d ":request_payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/users/alerts/transaction_limits/:alert_id:')
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
var alertId = 12345;
var accountId = 56789;
var limit = 100;
var alertRequest = new TransactionLimitAlertRequestModel
{
    Alert = new TransactionLimitAlertModel
    {
        AccountId = accountId,
        Limit = limit,
        EmailDelivery = true,
        SmsDelivery = false
    }
};

var updated = sdk.UpdateTransactionLimitAlert(alertId, alertRequest);
```


> Request payload

```json
{
  "alert": {
    "account_id": 42,
    "limit": 100,
    "email_delivery": 1,
    "sms_delivery": 1
  }
}
```

Update a transaction limit alert for the given user.

`PUT /api/v2/users/:user_id:/alerts/transaction_limits/:alert_id:`


### Parameters

| Parameter | Description |
|-----------|-------------|
| `account_id` | The account ID of the alert. |
| `limit` | The integer amount (in dollars) of a transaction that when exceeded will trigger the alert. |
| `email_delivery` | Send an email when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |
| `sms_delivery` | Send an SMS message when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |


### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
| 422 Unprocessable Entity | returned when the parameters given were invalid |


## Create Upcoming Bill Alert

```shell
curl -X "POST" "http://partner.url/api/v2/users/:user_id:/alerts/upcoming_bills" -u ":geezeo-api-key::" -d ":request_payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/alerts/upcoming_bills')
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
var cashflowTransactionId = 56789;
var days = 10;
var alertRequest = new UpcomingBillAlertRequestModel
{
    Alert = new UpcomingBillAlertModel
    {
        CashflowTransactionId = cashflowTransactionId,
        Days = days,
        EmailDelivery = true,
        SmsDelivery = false
    }
};

var createdAlert = sdk.CreateUpcomingBillAlert(alertRequest);
```


> Request payload

```json
{
  "alert": {
    "cashflow_transaction_id": 2213,
    "days": 2,
    "email_delivery": 1,
    "sms_delivery": 1
  }
}
```

Create an upcoming bill alert for the given user.

`POST /api/v2/users/:user_id:/alerts/upcoming_bills`


### Parameters

| Parameter | Description |
|-----------|-------------|
| `cashflow_transaction_id` | The ID of the cashflow transaction to associate this bill to. __Required__ |
| `days` | The integer number of days before the bill that this alert should be triggered (must be between 0 and 21 days). __Required__ |
| `email_delivery` | Send an email when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |
| `sms_delivery` | Send an SMS message when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |


### Status Codes

| Status | Description |
|--------|-------------|
| 201 Created | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
| 422 Unprocessable Entity | returned when the parameters given were invalid |


## Update Upcoming Bill Alert

```shell
curl -X "PUT" "http://partner.url/api/v2/users/alerts/upcoming_bills/:alert_id:" -u ":geezeo-api-key::" -d ":request_payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/users/alerts/upcoming_bills/:alert_id:')
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
var alertId = 12345;
var cashflowTransactionId = 56789;
var days = 10;
var alertRequest = new UpcomingBillAlertRequestModel
{
    Alert = new UpcomingBillAlertModel
    {
        CashflowTransactionId = cashflowTransactionId,
        Days = days,
        EmailDelivery = true,
        SmsDelivery = false
    }
};

var updated = sdk.UpdateUpcomingBillAlert(alertId, alertRequest);
```



> Request payload

```json
{
  "alert": {
    "cashflow_transaction_id": 2213,
    "days": 2,
    "email_delivery": 1,
    "sms_delivery": 1
  }
}
```

Update an upcoming bill alert for the given user.

`PUT /api/v2/users/:user_id:/alerts/upcoming_bills/:alert_id:`


### Parameters

| Parameter | Description |
|-----------|-------------|
| `cashflow_transaction_id` | The cashflow transaction ID of this bill. |
| `days` | The integer number of days before the bill that this alert should be triggered (must be between 0 and 21 days). |
| `email_delivery]` | Send an email when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |
| `sms_delivery` | Send an SMS message when the alert is triggered. Valid values are `0` (false) and `1` (true). Defaults to `0`. |


### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
| 422 Unprocessable Entity | returned when the parameters given were invalid |


## Get Notifications

```shell
curl -X "GET" "http://partner.url/api/v2/users/:user_id:/alerts/notifications" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/alerts/notifications')
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
var notifications = sdk.GetNotifications();
```

> Response payload

```json
{
  "notifications": [
    {
      "id": 50,
      "message": "Your account balance has fallen below $500.",
      "alert_type": "AccountThresholdAlert",
      "created_at": "2013-01-01T16:54:15Z"
    },
    {
      "id": 51,
      "message": "Your savings balance has fallen below $1000.",
      "alert_type": "AccountThresholdAlert",
      "created_at": "2013-01-01T16:54:15Z"
    }
  ]
}
```

Return a list of notifications created by triggered alerts.

`GET /api/v2/users/:user_id:/alerts/notifications`


### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |


## Get Notification

```shell
curl -X "GET" "http://partner.url/api/v2/users/:user_id:/alerts/notifications/:notification_id:" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/alerts/notifications/:notification_id:')
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
var notificationId = 12345;
var notification = sdk.GetNotificationById(notificationId);
```

> Response payload

```json
{
  "notifications": [
    {
      "id": 50,
      "message": "Your account balance has fallen below $500.",
      "alert_type": "AccountThresholdAlert"
    }
  ]
}
```

Return a notification.

`GET /api/v2/users/:user_id:/alerts/notifications/:notification_id:`


### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |


## Delete Notification

```shell
curl -X "DELETE" "http://partner.url/api/v2/users/:user_id:/alerts/notifications/:notification_id:" -u ":geezeo-api-key::" 
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/alerts/notifications/:notification_id:')
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
var notificationId = 12345;
var deleted = sdk.DeleteAlertNotification(notificationId);
```

Delete/dismiss a notification.

`DELETE /api/v2/users/:user_id:/alerts/notifications/:notification_id:`


### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |


## Get Destinations

```shell
curl -X "GET" "http://partner.url/api/v2/users/:user_id:/alerts/destinations" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/alerts/destinations')
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
var destinations = sdk.GetAlertDestinations();
```

> Response payload

```json
{
  "meta": {
    "partner_sms_enabled": true,
  },
  "destinations": {
    "email_address": "user@example.com",
    "sms_number": "5555551234"
  }
}
```

Return alerts destination data.

`GET /api/v2/users/:user_id:/alerts/destinations`


Alerts will not be delivered for partners that have not enabled sms alerts (indicated by `partner_sms_enabled`).

### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |


## Update Destinations

```shell
curl -X "PUT" "http://partner.url/api/v2/users/alerts/destinations" -u ":geezeo-api-key::" -d ":request_payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/users/alerts/destinations')
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

var email = "myemail@geezeo.com";
var smsNumber = "1238765432";

var destinationRequest = new AlertDestinationsRequestModel
{
     Destinations = new AlertDestinationsModel
     {
          EmailAddress = email,
          SmsNumber = smsNumber
     }
};

var updated = sdk.UpdateAlertDestination(destinationRequest);
```

> Request payload

```json
{
  "destinations": {
    "email_address": "user@example.com",
    "sms_number": "5555551234"
  }
}
```

Update alerts destination data.

`PUT /api/v2/users/:user_id:/alerts/destinations`


### Parameters

| Parameter | Description |
|-----------|-------------|
| `email_address` | Email address for alert delivery. |
| `sms_number` | SMS number for alert delivery (10-digit, no spaces or separators e.g. `5555551234`). |

### Response

Response body will be empty.

### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
| 422 Unprocessable Entity | returned when the parameters given were invalid |
