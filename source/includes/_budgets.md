# Budgets

## Get Budgets

```shell
curl -X "GET" "http://geezeo.dev:3000/api/v2/users/:user_id:/budgets" -u "%geezeo-api-key%:"
```

```ruby
uri = URI('https://geezeobkdemo.mybankhq.com/api/v2/users/:user_id:/budgets')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end

```

> The above command returns JSON structured like this:

```json
{
  "meta": {
    "state": "under",
    "total_budget": 300,
    "total_spent": 0,
    "total_remaining": 300,
    "total_percentage": 0.0
  },
  "budgets": [
    {
      "id": 284,
      "name": "Food",
      "month": 7,
      "year": 2013,
      "tag_names": [
        "Diningout"
      ],
      "spent": 0,
      "state": "under",
      "budget_amount": 300,
      "links": {
        "accounts": [396]
      }
    }
  ],
  "accounts": [
    {
      "id": 396,
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
  ]
}
```


Return a list of budgets for the given user.

The state attribute will be one of over, risk, or under. A value of risk means that the current spending on the budget is over the spending limit, prorated for the current month.

'GET /api/v2/users/:user_id:/budgets'


###Status Codes
Status | Description
------ | -----------
200 OK | returned when successful
401 Not Authorized | returned when invalid credentials are provided
404 Not Found | returned when an invalid user is specified


## Get Budget
Return a budget for the given user.

```shell
curl -X "GET" "http://geezeo.dev:3000/api/v2/users/:user_id:/budgets/:budget_id:" -u "%geezeo-api-key%:"
```

```ruby
uri = URI('https://geezeobkdemo.mybankhq.com/api/v2/users/:user_id:/budgets/:budget_id:')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end

```

> The above command returns JSON structured like this:

```json
{
  "budgets": [
    "id": 1234,
    "name": "Food",
    "month": 9,
    "year": 2013,
    "tag_names": [
      "Diningout"
    ],
    "spent": 0,
    "state": "under",
    "budget_amount": 300,
    "links": {
      "accounts": [396],
      "budget_histories": [2468, 2469]
    }
  ],
  "accounts": [
    {
      "id": 396,
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
  ],
  "budget_histories": [
    {
      "id": 2468,
      "budget_amount": 300,
      "month": 8,
      "spent": 0,
      "state": "under",
      "year": 2013
    },
    {
      "id": 2469,
      "budget_amount": 300,
      "month": 7,
      "spent": 0,
      "state": "under",
      "year": 2013
    }
  ]
}
```

For budget histories, the state attribute will be either over or under. For budgets, the state attribute will be one of over, risk, or under. A value of risk means that the current spending on the budget is over the spending limit, prorated for the current month.

'GET /api/v2/users/:user_id:/budgets/:budget_id:'

## Status Codes
Status | Description
------ | -----------
200 OK | returned when successful
401 Not Authorized | returned when invalid credentials are provided
404 Not Found | returned when an invalid user is specified

Create Budget
Create a budget for the given user.

Request
POST /api/v2/users/:user_id:/budgets
{
  "budget": {
    "name": "Bike parts",
    "budget_amount": 200,
    "show_on_dashboard": true,
    "tag_names": [
      "Bikes"
    ]
  }
}
Parameters
Parameter	Description
name	The name of the new budget. Required
budget_amount	The amount of the new budget. Required
tag_names	A list of tags to track. Required
account_list	A list of Geezeo account ids to track.
show_on_dashboard	Display this budget on the dashboard.
other	Only track unbudgeted expenses.
Response
{
  "budgets": [
    "id": 1234,
    "name": "Food",
    "month": 9,
    "year": 2013,
    "tag_names": [
      "Diningout"
    ],
    "spent": 0,
    "state": "under",
    "budget_amount": 300,
    "links": {
      "budget_histories": [2468, 2469]
    }
  ],
  "budget_histories": [
    {
      "id": 2468,
      "budget_amount": 300,
      "month": 8,
      "spent": 0,
      "state": "under",
      "year": 2013
    },
    {
      "id": 2469,
      "budget_amount": 300,
      "month": 7,
      "spent": 0,
      "state": "under",
      "year": 2013
    }
  ]
}
For budget histories, the state attribute will be either over or under. For budgets, the state attribute will be one of over, risk, or under. A value of risk means that the current spending on the budget is over the spending limit, prorated for the current month.

Status Codes
Status	Description
201 Created	returned when successful
401 Not Authorized	returned when invalid credentials are provided
404 Not Found	returned when an invalid user is specified
422 Unprocessable Entity	returned when the parameters given were invalid
Update Budget
Update a budget for the given user.

Request
PUT /api/v2/users/:user_id:/budgets/:budget_id:
Parameters
See Create Budget parameters

Status Codes
Status	Description
204 No Content	returned when successful
401 Not Authorized	returned when invalid credentials are provided
404 Not Found	returned when an invalid user is specified
422 Unprocessable Entity	returned when the parameters given were invalid
Delete Budget
Delete a budget for the given user.

Request
DELETE /api/v2/users/:user_id:/budgets/:budget_id:
Status Codes
Status	Description
204 No Content	returned when successful
401 Not Authorized	returned when invalid credentials are provided
404 Not Found	returned when an invalid user is specified