# Tax Rates

## Create a Tax Rate

```ruby
require 'rest-client'

RestClient.post(
  'https://app.rubberstamp.io/api/v1/tax_rates',
  {
    tax_rate: {
      name: 'default_13.0',
      value: '13'
    }
  },
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/tax_rates'
  -X POST
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "tax_rate[name]=default_13.0"
  -d "tax_rate[value]=13"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "default_13.0",
  "value": 13,
  "archived": false,
  "company_id": 1,
  "created_at": "2017-09-08T06:32:28.224-05:00",
  "updated_at": "2017-09-08T06:32:28.224-05:00"
}
```

Create a new Tax rate and return the `TaxRate` object that is created.

### HTTP Request

`POST https://app.rubberstamp.io/api/v1/tax_rates`


### Query Parameters

| Params               | Type       | Description          |
| ----------           | ---------- | ----------           |
| authentication_token | header     | Authentication token |
| app_company_id       | header     | Company Id           |
| tax_rate[name]       | string     | Tax rate name        |
| tax_rate[value]      | string     | Tax rate value       |
| tax_rate[archived]   | boolean    | Archived?            |
| tax_rate[comapny_id] | integer    | Company ID           |



## Get All Tax Rates

```ruby
require 'rest-client'

RestClient.get(
  'https://app.rubberstamp.io/api/v1/tax_rates',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/tax_rates'
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
    "name": "default_13.0",
    "value": 13,
    "archived": false,
    "company_id": 1,
    "created_at": "2017-08-08T06:32:28.224-05:00",
    "updated_at": "2017-08-08T06:32:28.224-05:00"
  },
  {
    "id": 1,
    "name": "default_13.12",
    "value": 13.12,
    "archived": false,
    "company_id": 1,
    "created_at": "2017-08-08T06:32:28.111-05:00",
    "updated_at": "2017-08-08T06:32:28.111-05:00"
  }
]
```

Returns a list of your tax rates.

### HTTP Request

`GET https://app.rubberstamp.io/api/v1/tax_rates`

#### Query Parameters

| Param                | Type       | Description          |
| ----------           | ---------- | ----------           |
| authentication_token | header     | Authentication token |
| app_company_id       | header     | Company ID           |



## Get a Specific Tax Rates

```ruby
require 'rest-client'

RestClient.get(
  'https://app.rubberstamp.io/api/v1/tax_rates/1',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/tax_rates/1'
  -X GET
  -H 'Content-Type: application/json'
  -H 'authentication_token: your token'
  -H 'app_company_id: 1'
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "default_13.0",
  "value": 13,
  "archived": false,
  "company_id": 1,
  "created_at": "2017-08-08T06:32:28.224-05:00",
  "updated_at": "2017-08-08T06:32:28.224-05:00"
}
```

Retrieves the details of an existing tax rates. You need to supply the
tax rate id, that was returned upon tax rate creation.

### HTTP Request

`GET https://app.rubberstamp.io/api/v1/tax_rates/:id`

### URL Parameters

| Params               | Type       | Description          |
| ----------           | ---------- | ----------           |
| authentication_token | header     | Authentication token |
| app_company_id       | header     | Company ID           |
| ID                   | integer    | TaxRate ID           |



## Update a Tax Rate

```ruby
require 'rest-client'

RestClient.put(
  'https://app.rubberstamp.io/api/v1/tax_rates/1',
  {
    tax_rate: {
      name: 'default_13.10',
      value: '13.10'
    }
  },
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/tax_rates/1'
  -X PUT
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "tax_rate[name]=default_13.10"
  -d "tax_rate[value]=13.10"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "default_13.10",
  "value": 13.10,
  "archived": false,
  "company_id": 1,
  "created_at": "2017-09-08T06:32:28.224-05:00",
  "updated_at": "2017-09-08T06:32:28.224-05:00"
}
```

Update the specified tax rate by setting the value of parameters passed. Any
parameters not provided will be left unchanged.

### HTTP Request

`PUT https://app.rubberstamp.io/api/v1/tax_rates/:id`

### Query Parameters

| Params               | Type       | Description          |
| ----------           | ---------- | ----------           |
| authentication_token | header     | Authentication token |
| app_company_id       | header     | Company ID           |
| tax_rate[name]       | string     | Tax rate name        |
| tax_rate[value]      | string     | Tax rate value       |
| tax_rate[archived]   | boolean    | Archived?            |
| tax_rate[comapny_id] | integer    | Company ID           |
