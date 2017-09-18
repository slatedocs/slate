# Budgets

## Create a Budget

```ruby
require 'rest-client'

RestClient.post(
  'https://app.rubberstamp.io/api/v1/budgets',
  {
    budget: {
      amount: 100.0,
      name: 'Test',
      currency_id: 1,
      creator_id: 1,
      allow_anyone_to_approve_a_po: false
    }
  },
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl https://app.rubberstamp.io/api/v1/budgets
  -X POST
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "budget[amount]=100.0"
  -d "budget[name]=Test"
  -d "budget[currency_id]=1"
  -d "budget[creator_id=1]"
  -d "budget[allow_anyone_to_approve_a_po]=false"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "company_id": 1,
  "name": "Test",
  "amount": "100.0",
  "cost_code": null,
  "cost_type": null,
  "archived": false,
  "currency_id": 1,
  "base_amount": "100.0",
  "base_rate": "1.0",
  "allow_anyone_to_approve_a_po": false,
  "start_date": null,
  "end_date": null,
  "summary": "Test"
}
```

Create a new Budget and returns the Budget object that is created.

### HTTP Request

`POST https://app.rubberstamp.io/api/v1/budgets`

### Query Parameters

| Param                                | Type    | Description                    |
| ----                                 | ---     | ---------                      |
| authentication_token                 | header  | Authentication token           |
| app_company_id                       | header  | registered company id          |
| budget[amount]                       | double  | Budget Amount                  |
| budget[name]                         | string  | Budget Name                    |
| budget[cost_code]                    | string  | Budget cost code               |
| budget[cost_type]                    | string  | Budget cost type               |
| budget[currency_id]                  | integer | Budget currency                |
| budget[creator_id]                   | integer | Budget creator                 |
| budget[allow_anyone_to_approve_a_po] | boolean | Allow anyone to  approve a PO? |
| budget[start_date]                   | date    | Budget start date              |
| budget[end_date]                     | date    | Budget end date                |




## GET All Budgets

```ruby
require 'rest-client'

RestClient.get(
  'https://app.rubberstamp.io/api/v1/budgets',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/budgets'
  -X GET
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "company_id": 1,
    "name": "Advocacy",
    "amount": "50000.0",
    "cost_code": "2017",
    "cost_type": null,
    "archived": false,
    "currency_id": 1,
    "base_amount": "50000.0",
    "base_rate": "1.0",
    "allow_anyone_to_approve_a_po": false,
    "start_date": 1483401600,
    "end_date": 1519862400,
    "summary": "Advocacy : 2017"
  },
  {
    "id": 2,
    "company_id": 1,
    "name": "Audit And Accountancy Fees",
    "amount": "9000.0",
    "cost_code": "2017",
    "cost_type": null,
    "archived": false,
    "currency_id": 1,
    "base_amount": "9000.0",
    "base_rate": "1.0",
    "allow_anyone_to_approve_a_po": false,
    "start_date": 1483401600,
    "end_date": 1519862400,
    "summary": "Audit And Accountancy Fees : 2017"
  },
  {
    "id": 3,
    "company_id": 1,
    "name": "Board Expenses",
    "amount": "100.0",
    "cost_code": "2017",
    "cost_type": null,
    "archived": false,
    "currency_id": 1,
    "base_amount": "100.0",
    "base_rate": "1.0",
    "allow_anyone_to_approve_a_po": false,
    "start_date": 1483401600,
    "end_date": 1519862400,
    "summary": "Board Expenses : 2017"
  }
]
```

Returns a list of Budgets.

### HTTP Request

`GET https://app.rubberstamp.io/api/v1/budgets`

### Query Parameters

| Param                | Type   | Description           |
| ----                 | -----  | ----------            |
| authentication_token | header | Authentication token  |
| app_company_id       | header | registered company id |





## Get a specific Budget

```ruby
require 'rest-client'

RestClient.get(
  'https://app.rubberstamp.io/api/v1/budgets/1',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/budgets/1'
  -X GET
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "company_id": 1,
  "name": "Advocacy",
  "amount": "50000.0",
  "cost_code": "2017",
  "cost_type": null,
  "archived": false,
  "currency_id": 1,
  "base_amount": "50000.0",
  "base_rate": "1.0",
  "allow_anyone_to_approve_a_po": false,
  "start_date": 1483401600,
  "end_date": 1519862400,
  "summary": "Advocacy : 2017"
}
```

Retrieves the details of an existing budget. You need to supply the unique
budget id that was returned upon budget creation.

### HTTP Request

`GET https://app.rubberstamp.io/api/v1/budgets/:id`

### URL Parameters

| Params               | Type    | Description                      |
| -----                | -----   | ----------                       |
| authentication_token | header  | Authentication token             |
| app_company_id       | header  | registered company id            |
| ID                   | integer | The ID of the budget to retrieve |



## Update a Budget

```ruby
require 'rest-client'

RestClient.put(
  'https://app.rubberstamp.io/api/v1/budgets/1',
  {
    budget: {
      amount: 200.0,
    }
  },
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/budgets/1'
  -X PUT
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "budget[amount]=200.0"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "company_id": 1,
  "name": "Test",
  "amount": "200.0",
  "cost_code": null,
  "cost_type": null,
  "archived": false,
  "currency_id": 1,
  "base_amount": "100.0",
  "base_rate": "1.0",
  "allow_anyone_to_approve_a_po": false,
  "start_date": null,
  "end_date": null,
  "summary": "Test"
}
```

Update the specified `Budget` by setting the value of parameters passed. Any
parameters not provided will be left unchanged.

### HTTP Request

`PUT https://app.rubberstamp.io/api/v1/budgets/:id`

### Query Parameters

| Params                               | Type    | Description                    |
| -----                                | -----   | ------------                   |
| authentication_token                 | header  | Authentication token           |
| app_company_id                       | header  | registered company id          |
| budget[amount]                       | double  | Budget Amount                  |
| budget[name]                         | string  | Budget Name                    |
| budget[cost_code]                    | string  | Budget cost code               |
| budget[cost_type]                    | string  | Budget cost type               |
| budget[currency_id]                  | integer | Budget currency                |
| budget[creator_id]                   | integer | Budget creator                 |
| budget[allow_anyone_to_approve_a_po] | boolean | Allow anyone to  approve a PO? |
| budget[start_date]                   | date    | Budget start date              |
| budget[end_date]                     | date    | Budget end date                |

