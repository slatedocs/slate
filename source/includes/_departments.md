# Departments

## Create a Department

```ruby
require 'rest-client'

RestClient.post(
  'https://app.rubberstamp.io/api/v1/departments',
  {
    department: {
      name: 'Accounting',
      archived: false,
      contact_person: 'John doe',
      phone_number: '98xxxxxxxx',
      email: 'john@example.com',
      address: '2156 Bruce Street',
      tax_number: '123456',
      budget_ids: [1,2],
      user_ids: [1]
    }
  },
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/departments'
  -X POST
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "department[name]=Accounting"
  -d "department[archived]=false"
  -d "department[contact_person]=John doe"
  -d "department[phone_number]=98xxxxxxxx"
  -d "department[email]=john@example.com"
  -d "department[address]=2156 Bruce Street"
  -d "department[tax_number]=123456"
  -d "department[budget_ids][]=1"
  -d "department[budget_ids][]=2"
  -d "department[user_ids][]=1"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "Accounting",
  "company_id": 1,
  "archived": false,
  "contact_person": "John Doe",
  "tax_number": "123456",
  "phone_number": "98xxxxxxxx",
  "address": "2156 Bruce Street",
  "email": "john@example.com"
}
```

Create a new `Department` and returns the `Department` object that is created.

### HTTP Request

`POST https://app.rubberstamp.io/api/v1/departments`

### Query Parameters

| Params                     | Type    | Description                |
| -----                      | -----   | -----                      |
| authentication_token       | header  | Authentication token       |
| app_company_id             | header  | Company ID                 |
| department[name]           | string  | `Required` Department name |
| department[archived]       | boolean | Archived?                  |
| department[contact_person] | string  | Contact person             |
| department[phone_number]   | string  | Phone number               |
| department[email]          | string  | Valid email address        |
| department[address]        | string  | Contact person's address   |
| department[tax_number]     | string  | TAX number                 |
| department[budget_ids]     | Array[] | Budget IDs                 |
| department[user_ids]       | Array[] | User IDs                   |




## Get All Departments

```ruby
require 'rest-client'

RestClient.get(
  'https://app.rubberstamp.io/api/v1/departments',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/departments'
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
    "name": "Accounting",
    "company_id": 1,
    "archived": false,
    "contact_person": "John Doe",
    "tax_number": "123456",
    "phone_number": "98xxxxxxxx",
    "address": "2156 Bruce Street",
    "email": "john@example.com"
  },
  {
    "id": 2,
    "name": "HR",
    "company_id": 1,
    "archived": true,
    "contact_person": "Bruce Jordan",
    "tax_number": "1122",
    "phone_number": "",
    "address": "1122 Jordan Street",
    "email": "smith@example.com"
  }
]
```

Returns a list of your departments.

### HTTP Request

`GET https://app.rubberstamp.io/api/v1/departments`

### Query Parameters

| Params               | Type   | Description           |
| -----                | -----  | -----------           |
| authentication_token | header | Authentication token  |
| app_company_id       | header | Registered company id |

## Get a specific Department

```ruby
require 'rest-client'

RestClient.get(
  'https://app.rubberstamp.io/api/v1/departments/1',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/departments/1'
  -X GET
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
```

> The above command returns JSON structured like this:

```json
  {
    "id": 1,
    "name": "Accounting",
    "company_id": 1,
    "archived": false,
    "contact_person": "John Doe",
    "tax_number": "123456",
    "phone_number": "98xxxxxxxx",
    "address": "2156 Bruce Street",
    "email": "john@example.com"
  }
```

Retrieves the details of an existing department. You need to supply the unique
department id, that was returned upon department creation.

### HTTP Request

`GET https://app.rubberstamp.io/api/v1/departments/:id`

### URL Parameters

| Params               | Type    | Description          |
| -----                | -----   | ------------         |
| authentication_token | header  | Authentication token |
| app_company_id       | header  | Company ID           |
| ID                   | integer | Department ID        |

## Update a department

```ruby
require 'rest-client'

RestClient.put(
  'https://app.rubberstamp.io/api/v1/departments/1',
  {
    department: {
      name: 'Accounting department',
    }
  },
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/departments/1'
  -X PUT
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "department[name]=Accounting department"
```

> The above command returns JSON structured like this:
```json
{
  "id": 1,
  "name": "Accounting department",
  "company_id": 1,
  "archived": false,
  "contact_person": "John Doe",
  "tax_number": "123456",
  "phone_number": "98xxxxxxxx",
  "address": "2156 Bruce Street",
  "email": "john@example.com"
}
```

Update the specified department by setting the value of parameters passed. 
Any parameters not provoded will be left unchanged.

### HTTP Request

`PUT https://app.rubberstamp.io/api/v1/departments/:id`

### Query Parameters

| Params                     | Type    | Description                |
| -----                      | -----   | ----------                 |
| authentication_token       | header  | Authentication token       |
| app_company_id             | header  | Company ID                 |
| ID                         | integer | Department ID              |
| department[name]           | string  | `Required` Department name |
| department[archived]       | boolean | Archived?                  |
| department[contact_person] | string  | Contact person             |
| department[phone_number]   | string  | Phone number               |
| department[email]          | string  | Valid email address        |
| department[address]        | string  | Contact person's address   |
| department[tax_number]     | string  | TAX number                 |
| department[budget_ids]     | Array[] | Budget IDs                 |
| department[user_ids]       | Array[] | User IDs                   |
