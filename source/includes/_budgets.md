# Budgets

## Create a Budget

```ruby
require 'rest-client'

RestClient.post(
  'https://app.procurementexpress.com/api/v1/budgets',
  {
    budget: {
      amount: 100.0,
      name: 'Test',
      currency_id: 1,
      creator_id: 1,
      allow_anyone_to_approve_a_po: false,
      department_ids: [1,4],
      approver_ids: [1,2]
    }
  },
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl https://app.procurementexpress.com/api/v1/budgets
  -X POST
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "budget[amount]=100.0"
  -d "budget[name]=Test"
  -d "budget[currency_id]=1"
  -d "budget[creator_id]=1"
  -d "budget[allow_anyone_to_approve_a_po]=false"
  -d "budget[department_ids]=[1,4]"
  -d "budget[approvers_ids]=[1,2]"
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
  "summary": "Test",
  "creator_id": 1,
  "department_ids": [],
  "approver_ids": [],
  "quickbooks_account": "Bank Charge - Expenses"
}
```

Create a new Budget and returns the Budget object that is created.

### Include associated departments and approvers

To add approvers to this you can pass `approver_ids` which expect array of
approver ids in the POST request.

And to add departments you can pass `department_ids` which expect array of
department ids in the POST request.

### Date format should match `company_setting.date_format`

Because we support multiple date formats, we need to send dates depending on
`company_setting.date_format`. In this API endpoint, you need to provide proper
date format for `start_date` and `end_date`. Please find date format in [Company Setting](/slate/#get-a-specific-company)

### HTTP Request

`POST https://app.procurementexpress.com/api/v1/budgets`

### Query Parameters

| Param                                | Type    | required | Description                   |
| ------------------------------------ | ------- | -------- | ----------------------------- |
| authentication_token                 | header  | required | Authentication token          |
| app_company_id                       | header  | required | registered company id         |
| budget[amount]                       | double  | required | Budget Amount                 |
| budget[name]                         | string  | required | Budget Name                   |
| budget[cost_code]                    | string  | optional | Budget cost code              |
| budget[cost_type]                    | string  | optional | Budget cost type              |
| budget[currency_id]                  | integer | required | Budget currency               |
| budget[creator_id]                   | integer | required | Budget creator                |
| budget[allow_anyone_to_approve_a_po] | boolean | optional | Allow anyone to approve a PO? |
| budget[start_date]                   | date    | optional | Budget start date             |
| budget[end_date]                     | date    | optional | Budget end date               |
| budget[approver_ids]                 | Array   | optional | Array of approver ids         |
| budget[department_ids]               | Array   | optional | Array of department ids       |

## GET All Budgets

```ruby
require 'rest-client'

RestClient.get(
  'https://app.procurementexpress.com/api/v1/budgets',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/budgets'
  -X GET
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
```

> The above command returns JSON structured like this:

```json
{
  "budgets": [
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
      "summary": "Advocacy : 2017",
      "creator_id": 1,
      "department_ids": [],
      "approver_ids": []
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
      "summary": "Audit And Accountancy Fees : 2017",
      "creator_id": 1,
      "department_ids": [],
      "approver_ids": []
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
      "summary": "Board Expenses : 2017",
      "creator_id": 1,
      "department_ids": [],
      "approver_ids": []
    }
  ],
  "meta": {
    "current_page": 1,
    "next_page": 2,
    "prev_page": null,
    "total_pages": 3,
    "total_count": 50
  }
```

Returns a list of Budgets.

### Filter budgets by department_id

you can pass `department_id` query params to filter budgets by departments like:
`/api/v1/budgets?department_id=1`

### Pagination

Budget listing api results are paginated so that we don't load all budgets at once. You can send `page` params to load other records e.g: `/api/v1/budgets?page=2`. You can also see meta key in the response you get, that will return informations like `current_page`, `next_page`, `previous_page`, `total_pages`, and `total_count` to help your write your own logic for pagination.

### Filter by archived

Return list of archived budgets by passing `archived` queryParams with value `true`.
Example: `/api/v1/budgets?archived=true`. Default list are active budget lists.

### HTTP Request

`GET https://app.procurementexpress.com/api/v1/budgets?page=1&archived=false`

### Query Parameters

| Param                | Type    | Description                  |
| -------------------- | ------- | ---------------------------- |
| authentication_token | header  | Authentication token         |
| app_company_id       | header  | registered company id        |
| department_id        | integer | Filter budgets by department |

## Get a specific Budget

```ruby
require 'rest-client'

RestClient.get(
  'https://app.procurementexpress.com/api/v1/budgets/1',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/budgets/1'
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
  "amount": 50000.0,
  "cost_code": "2017",
  "cost_type": null,
  "archived": false,
  "currency_id": 1,
  "base_amount": 50000.0,
  "base_rate": "1.0",
  "allow_anyone_to_approve_a_po": false,
  "start_date": 1483401600,
  "end_date": 1519862400,
  "summary": "Advocacy : 2017",
  "remaining_amount": 50000.0,
  "creator_id": 1,
  "department_ids": [],
  "approver_ids": [],
  "quickbooks_account": false
}
```

Retrieves the details of an existing budget. You need to supply the unique
budget id that was returned upon budget creation.

### HTTP Request

`GET https://app.procurementexpress.com/api/v1/budgets/:id`

### URL Parameters

| Params               | Type    | Description                      |
| -------------------- | ------- | -------------------------------- |
| authentication_token | header  | Authentication token             |
| app_company_id       | header  | registered company id            |
| ID                   | integer | The ID of the budget to retrieve |

## Update a Budget

```ruby
require 'rest-client'

RestClient.put(
  'https://app.procurementexpress.com/api/v1/budgets/1',
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
curl 'https://app.procurementexpress.com/api/v1/budgets/1'
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
  "summary": "Test",
  "creator_id": 1,
  "department_ids": [],
  "approver_ids": []
}
```

Update the specified `Budget` by setting the value of parameters passed. Any
parameters not provided will be left unchanged.

### HTTP Request

`PUT https://app.procurementexpress.com/api/v1/budgets/:id`

### Query Parameters

| Params                               | Type    | Description                   |
| ------------------------------------ | ------- | ----------------------------- |
| authentication_token                 | header  | Authentication token          |
| app_company_id                       | header  | registered company id         |
| budget[amount]                       | double  | Budget Amount                 |
| budget[name]                         | string  | Budget Name                   |
| budget[cost_code]                    | string  | Budget cost code              |
| budget[cost_type]                    | string  | Budget cost type              |
| budget[currency_id]                  | integer | Budget currency               |
| budget[creator_id]                   | integer | Budget creator                |
| budget[allow_anyone_to_approve_a_po] | boolean | Allow anyone to approve a PO? |
| budget[start_date]                   | date    | Budget start date             |
| budget[end_date]                     | date    | Budget end date               |
| budget[approver_ids]                 | Array   | Array of approver ids         |
| budget[department_ids]               | Array   | Array of department ids       |
