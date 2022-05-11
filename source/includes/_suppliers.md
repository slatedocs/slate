# Suppliers

## Create a Supplier

```ruby
require 'rest-client'

RestClient.post(
  'https://app.procurementexpress.com/api/v1/suppliers',
  {
    supplier: {
      name: 'iCare Center',
      email: 'icare@example.com',
      address: '234 Saint St.',
      notes: 'purchase iPhone 7'
    }
  }
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/suppliers'
  -X POST
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "supplier[name]=iCare Center"
  -d "supplier[email]=icare@example.com"
  -d "supplier[address]=234 Saint St."
  -d "supplier[notes]=purchase iPhone 7"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "iCare Center",
  "company_id": 1,
  "notes": "purchase iPhone 7",
  "phone_number": null,
  "address": "234 Saint St.",
  "email": "icare@example.com",
  "payment_details": null,
  "archived": false,
  "contact_person": null,
  "tax_number": null
}
```

Create a new suppliers and returns the `Supplier` object that is created.

### Supplier Approval

If Supplier `Require Approval` setting is ON and any one Approver is selected. Then supplier will go under approval process and this supplier will available on supplier list once approved by the approver.

Returns text: `Your request to add a new supplier has been sent for approval, please check your email for updates.`

### HTTP Request

`POST https://app.procurementexpress.com/api/v1/suppliers`

### Query Parameters

| Params                    | Type    | required | description                                                        |
| ------------------------- | ------- | -------- | ------------------------------------------------------------------ |
| authentication_token      | header  | required | Authentication token                                               |
| app_company_id            | header  | required | Company ID                                                         |
| supplier[name]            | string  | required | Supplier name must present and should be unique                    |
| supplier[email]           | string  | optional | Email address                                                      |
| supplier[address]         | string  | optional | Supplier address                                                   |
| supplier[notes]           | string  | optional | Notes                                                              |
| supplier[payment_details] | string  | optional | Payment Details                                                    |
| supplier[phone_number]    | string  | optional | Phone Number                                                       |
| supplier[archived]        | boolean | optional | Archived?                                                          |
| supplier[tax_number]      | string  | optional | TAX Number                                                         |
| supplier[contact_person]  | string  | optional | Contact Person                                                     |
| department_ids            | array[] | optional | List of Department IDs                                             |

## Get all Suppliers

```ruby
require 'rest-client'

RestClient.get(
  'https://app.procurementexpress.com/api/v1/suppliers',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/suppliers'
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
    "name": "iCare Center",
    "company_id": 1,
    "notes": "purchase iPhone 7",
    "phone_number": null,
    "address": "234 Saint St.",
    "email": "icare@example.com",
    "payment_details": null,
    "archived": false,
    "contact_person": null,
    "tax_number": null
    "currency_id": 1
  }
]
```

> Output when pagination is enabled

```json
{
  "suppliers": [
    {
      "id": 1,
      "name": "iCare Center",
      "company_id": 1,
      "notes": "purchase iPhone 7",
      "phone_number": null,
      "address": "234 Saint St.",
      "email": "icare@example.com",
      "payment_details": null,
      "archived": false,
      "contact_person": null,
      "tax_number": null,
      "currency_id": 1
    }
  ],
  "meta": {
    "current_page": 2,
    "next_page": 3,
    "prev_page": 1,
    "total_pages": 62,
    "total_count": 1239
  }
}
```

Returns a list of suppliers.

### Pagination

You can paginate records by passing `page` params, example:
`/api/v1/suppliers?page=2`. If you enable pagination, the output will include
`meta` object which contains information like `current_page`, `next_page`,
`previous_page`, `total_pages` and `total_count`. You can use these information
to write your own pagination logic.

### Top n records

You can also find top n suppliers by passing `top` params.
`/api/v1/suppliers/top?top=10`

### Filter Suppliers by department

To filter suppliers for specific department you can pass `department_id` in
queryparams. example: `/api/v1/suppliers?department_id=1`.

### Filter Archived Suppliers

You can pass `archived` params with `true` or `false` to filter Archived suppliers.

### HTTP Request

`GET https://app.procurementexpress.com/api/v1/suppliers`

### Query Parameters

| Params               | Type    | Description                                    |
| -------------------- | ------- | ---------------------------------------------- |
| authentication_token | header  | Authentication token                           |
| app_company_id       | header  | Company ID                                     |
| page                 | integer | Page number to paginate                        |
| department_id        | integer | filter suppliers by department                 |
| archived             | boolean | `true` or `false` to filter archived suppliers |
| top                  | integer | limit n record                                 |

## Get Supplier details

```ruby
require 'rest-client'

RestClient.get(
  'https://app.procurementexpress.com/api/v1/suppliers/1',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/suppliers/1'
  -X GET
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "iCare Center",
  "company_id": 1,
  "notes": "purchase iPhone 7",
  "phone_number": null,
  "address": "234 Saint St.",
  "email": "icare@example.com",
  "payment_details": null,
  "archived": false,
  "contact_person": null,
  "tax_number": null,
  "currency_id": 1
}
```

Retrieves the details of an existing suppliers. You need to supply the unique
supplier id, that was returned upon supplier creation.

### HTTP Request

`GET https://app.procurementexpress.com/api/v1/suppliers/:id`

### URL Parameters

| Params               | Type    | Description          |
| -------------------- | ------- | -------------------- |
| authentication_token | header  | Authentication token |
| app_company_id       | header  | Company ID           |
| ID                   | integer | Supplier ID          |

## Update Supplier

```ruby
require 'rest-client'

RestClient.put(
  'https://app.procurementexpress.com/api/v1/suppliers/1',
  {
    supplier: {
      name: 'updated'
    }
  }
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/suppliers/1'
  -X PUT
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "supplier[name]=updated"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "updated",
  "company_id": 1,
  "notes": "purchase iPhone 7",
  "phone_number": null,
  "address": "234 Saint St.",
  "email": "icare@example.com",
  "payment_details": null,
  "archived": false,
  "contact_person": null,
  "tax_number": null,
  "currency_id": 1
}
```

Update the specified supplier by setting the value of parameters passed.
Any parameters not provided will be left unchanged.

### HTTP Request

`PUT https://app.procurementexpress.com/api/v1/suppliers/:id`

### Query Parameters

| Params                    | Type    | Description                                     |
| ------------------------- | ------- | ----------------------------------------------- |
| authentication_token      | header  | Authentication token                            |
| app_company_id            | header  | Company ID                                      |
| supplier[name]            | string  | Supplier name must present and should be unique |
| supplier[email]           | string  | Email address                                   |
| supplier[address]         | string  | Supplier address                                |
| supplier[notes]           | string  | Notes                                           |
| supplier[payment_details] | string  | Payment Details                                 |
| supplier[phone_number]    | string  | Phone Number                                    |
| supplier[archived]        | boolean | Archived?                                       |
| supplier[tax_number]      | string  | TAX Number                                      |
| supplier[contact_person]  | string  | Contact Person                                  |
| department_ids            | array[] | List of Department IDs                          |
