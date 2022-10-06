# Companies

## Create a company

```ruby
require 'rest-client'

RestClient.post(
  'https://app.procurementexpress.com/api/v1/companies',
  {
    company: {
      name: 'ABC Corp.',
      gross_or_net_config: 1,
      company_setting_attributes: {
        currency_id: 1
      }
    }
  },
  headers = {
    authentication_token: 'your token'
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/companies'
  -X POST
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -d "company[name]=ABC Corp."
  -d "company[gross_or_net_config]=1"
  -d "company[company_setting_attributes][currency_id]=1"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "ABC Corp."
}
```

Create a new Company and returns the `Company` object that is created.

### HTTP Request

`POST https://app.procurementexpress.com/api/v1/companies`

### Query Parameters

| Params                                                                              | Type    | required | Description                                     |
| ----------------------------------------------------------------------------------- | ------- | -------- | ----------------------------------------------- |
| authentication_token                                                                | header  | required | Authentication token                            |
| company[name]                                                                       | string  | required | `Required` - Company name                       |
| company[gross_or_net_config]                                                        | integer | optional | Gross or Net config                             |
| company[default_tax_rate]                                                           | double  | optional | Default TAX Rate                                |
| company[supported_currency_ids]                                                     | Array[] | optional | Supported currency ids                          |
| company[company_currency_exchange_rates]                                            | Array[] | optional | Currency exchange rates                         |
| company[budget_attributes][0][amount]                                               | double  | optional | Budget amount                                   |
| company[budget_attributes][0][name]                                                 | string  | optional | Budget Name                                     |
| company[budget_attributes][0][creator_id]                                           | integer | optional | Budget creator id                               |
| company[budget_attributes][0][currency_id]                                          | integer | optional | Budget currency id                              |
| company[company_setting_attributes][id]                                             | integer | optional | ID                                              |
| company[company_setting_attributes][currency_id]                                    | integer | required | `Required` - Company Setting's currency id      |
| company[company_setting_attributes][pdf_font_size]                                  | integer | optional | PDF font size                                   |
| company[company_setting_attributes][date_format]                                    | string  | optional | Date format e.g: "%Y-%m-%d"                     |
| company[company_setting_attributes][custom_field_to_include_in_po_number_id]        | integer | optional | Custom field to include in PO number ID         |
| company[company_setting_attributes][javascript]                                     | string  | optional | Javascript setting                              |
| company[company_setting_attributes][departments_alias]                              | string  | optional | Department alias                                |
| company[company_setting_attributes][tax_label]                                      | string  | optional | Tax label                                       |
| company[company_setting_attributes][approvals_require_login]                        | boolean | optional | Approvals require Login?                        |
| company[company_setting_attributes][show_po_item_number]                            | boolean | optional | Show PO item number?                            |
| company[company_setting_attributes][fixed_supplier_list]                            | boolean | optional | Fixed supplier List?                            |
| company[company_setting_attributes][display_remaining_budget_amount]                | boolean | optional | Display remaining budget amount?                |
| company[company_setting_attributes][display_budget_on_pdf]                          | boolean | optional | Display budget on PDF?                          |
| company[company_setting_attributes][fixed_product_list]                             | boolean | optional | Fixed product list?                             |
| company[company_setting_attributes][show_tax_column]                                | boolean | optional | Show TAX column?                                |
| company[company_setting_attributes][show_company_name]                              | boolean | optional | Show company name?                              |
| company[company_setting_attributes][show_approver_name]                             | boolean | optional | Show approver name?                             |
| company[company_setting_attributes][user_can_add_supplier]                          | boolean | optional | User can add supplier?                          |
| company[company_setting_attributes][manually_approve_by_lowest_available_approvers] | boolean | optional | Manually approve by lowest available approvers? |
| company[company_setting_attributes][share_po_access_by_department]                  | boolean | optional | Share PO access by department?                  |
| company[company_setting_attributes][allow_budget_overruns]                          | boolean | optional | Allow budget overruns?                          |
| company[company_setting_attributes][allocations_enabled]                            | boolean | optional | Allocations enabled?                            |
| company[company_setting_attributes][pdf_background]                                 | string  | optional | PDF background                                  |
| company[company_setting_attributes][pdf_footer]                                     | string  | optional | PDF footer                                      |
| company[company_setting_attributes][logo]                                           | string  | optional | Logo                                            |
| company[company_setting_attributes][logo_alignment]                                 | string  | optional | Logo alignment                                  |
| company[company_setting_attributes][logo_content_type]                              | string  | optional | Logo content type                               |
| company[company_setting_attributes][budgets_alias]                                  | string  | optional | Budget alias                                    |
| company[company_setting_attributes][po_fields]                                      | Array[] | optional | PO fields                                       |

## Get all companies

```ruby
require 'rest-client'

response = RestClient.get(
  'https://app.procurementexpress.com/api/v1/companies',
  headers = {
    authentication_token: 'your token'
  }
)

response.body
```

```shell
curl 'https://app.procurementexpress.com/api/v1/companies'
  -X GET
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "ABC Corp."
  },
  {
    "id": 2,
    "name": "Xyz Pvt. Ltd."
  }
]
```

Returns a list of companies for current logged in user.

### HTTP Request

`GET https://app.procurementexpress.com/api/v1/companies`

### Query Parameters

| Params               | Type   | Description          |
| -------------------- | ------ | -------------------- |
| authentication_token | header | Authentication token |

## Get a specific company

```ruby
require 'rest-client'

RestClient.get(
  'https://app.procurementexpress.com/api/v1/companies/1',
  headers = {
    authentication_token: 'your token',
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/companies/1'
  -X GET
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "ABC Corp.",
  "employees_count": 10,
  "default_tax_rate": "13.0",
  "company_setting": {
    "id": 1,
    "show_po_item_number": false,
    "gross_or_net": "net",
    "company_id": 1,
    "fixed_supplier_list": true,
    "currency_id": 1,
    "javascript": "",
    "departments_alias": "",
    "display_remaining_budget_amount": true,
    "date_format": "%Y-%m-%d",
    "tax_label": "VAT",
    "approvals_require_login": false,
    "fixed_product_list": false,
    "show_tax_column": true,
    "show_company_name": true,
    "allow_budget_overruns": true,
    "budgets_alias": "",
    "allocations_enabled": false,
    "report_name": null,
    "user_can_add_supplier": true,
    "po_fields": ["Date", "Budgets", "From", "PO number", "Net Amount"],
    "reserve_po_number": false,
    "show_remaining_budget_to_teammember": false,
    "allow_open_draft_access": true,
    "link_budgets_to_qbo_account": false,
    "is_quickbooks_connected": true,
    "is_sage_connected": true,
  },
  "custom_fields": [
    {
      "id": 1,
      "company_id": 1,
      "name": "Reason for expenditure",
      "field_type": "select",
      "active": false,
      "required": false,
      "options": ["Acquisition of new donors.", "Existing donors."],
      "access_level": "everyone",
      "position": 0,
      "on_line_item": false,
      "display_on_pdf": false,
      "on_budget": false,
      "editable_after_approval": null
    },
    {
      "id": 2,
      "company_id": 1,
      "name": "Expenditure Breakdown",
      "field_type": "select",
      "active": true,
      "required": true,
      "options": [
        "Agency Fees",
        "Media Expenses",
        "Consultants",
        "Telephone",
        "Travel",
        "Other"
      ],
      "access_level": "everyone",
      "position": 1,
      "on_line_item": false,
      "display_on_pdf": false,
      "on_budget": false,
      "editable_after_approval": null
    }
  ],
  "supported_currencies": [
    {
      "id": 1,
      "iso_code": "EUR",
      "iso_numeric": "978",
      "name": "Euro",
      "symbol": "€"
    },
    {
      "id": 2,
      "iso_code": "GBP",
      "iso_numeric": "826",
      "name": "British Pound",
      "symbol": "£"
    },
    {
      "id": 3,
      "iso_code": "USD",
      "iso_numeric": "840",
      "name": "United States Dollar",
      "symbol": "$"
    },
    {
      "id": 5,
      "iso_code": "AUD",
      "iso_numeric": "036",
      "name": "Australian Dollar",
      "symbol": "$"
    }
  ]
}
```

Retrieves the details of an existing company. You need to send unique company id
that was returned upon company creation.

### HTTP Request

`GET https://app.procurementexpress.com/api/v1/companies/:id`

### URL Parameters

| Params               | Type    | Description          |
| -------------------- | ------- | -------------------- |
| authentication_token | header  | Authentication token |
| ID                   | integer | Company Id           |

## Get Details

```ruby
require 'rest-client'

RestClient.get(
  'https://app.procurementexpress.com/api/v1/companies/details',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/companies/details'
  -X GET
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "ABC Corp.",
  "employees_count": 10,
  "default_tax_rate": "13.0",
  "company_setting": {
    "id": 1,
    "show_po_item_number": false,
    "gross_or_net": "net",
    "company_id": 1,
    "fixed_supplier_list": true,
    "currency_id": 1,
    "javascript": "",
    "departments_alias": "",
    "display_remaining_budget_amount": true,
    "date_format": "%Y-%m-%d",
    "tax_label": "VAT",
    "approvals_require_login": false,
    "fixed_product_list": false,
    "show_tax_column": true,
    "show_company_name": true,
    "allow_budget_overruns": true,
    "budgets_alias": "",
    "allocations_enabled": false,
    "report_name": null,
    "user_can_add_supplier": true,
    "po_fields": ["Date", "Budgets", "From", "PO number", "Net Amount"],
    "reserve_po_number": false,
    "is_quickbooks_connected": true
    "is_sage_connected": true
  },
  "custom_fields": [
    {
      "id": 1,
      "company_id": 1,
      "name": "Reason for expenditure",
      "field_type": "select",
      "active": false,
      "required": false,
      "options": ["Acquisition of new donors.", "Existing donors."],
      "access_level": "everyone",
      "position": 0,
      "on_line_item": false,
      "display_on_pdf": false,
      "on_budget": false,
      "editable_after_approval": null
    },
    {
      "id": 2,
      "company_id": 1,
      "name": "Expenditure Breakdown",
      "field_type": "select",
      "active": true,
      "required": true,
      "options": [
        "Agency Fees",
        "Media Expenses",
        "Consultants",
        "Telephone",
        "Travel",
        "Other"
      ],
      "access_level": "everyone",
      "position": 1,
      "on_line_item": false,
      "display_on_pdf": false,
      "on_budget": false,
      "editable_after_approval": null
    }
  ],
  "supported_currencies": [
    {
      "id": 1,
      "iso_code": "EUR",
      "iso_numeric": "978",
      "name": "Euro",
      "symbol": "€"
    },
    {
      "id": 2,
      "iso_code": "GBP",
      "iso_numeric": "826",
      "name": "British Pound",
      "symbol": "£"
    },
    {
      "id": 3,
      "iso_code": "USD",
      "iso_numeric": "840",
      "name": "United States Dollar",
      "symbol": "$"
    },
    {
      "id": 5,
      "iso_code": "AUD",
      "iso_numeric": "036",
      "name": "Australian Dollar",
      "symbol": "$"
    }
  ]
}
```

Retrieves the details of an existing company. You need to send unique company id
that was returned upon company creation.

### HTTP Request

`GET https://app.procurementexpress.com/api/v1/companies/details`

### URL Parameters

| Params               | Type   | Description          |
| -------------------- | ------ | -------------------- |
| authentication_token | header | Authentication token |
| app_company_id       | header | Company Id           |

## Approvers

```ruby
require 'rest-client'

RestClient.get(
  'https://app.procurementexpress.com/api/v1/companies/approvers?department_id=1',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/companies/approvers?department_id=1'
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
    "email": "admin@example.com",
    "name": "Admin User",
    "phone_number": "",
    "setup_incomplete": false,
    "employer_id": 1,
    "authentication_token": "token",
    "approval_limit": 1000000,
    "companies": [
      {
        "id": 1,
        "approval_limit": 1000000
      }
    ]
  },
  {
    "id": 2,
    "email": "accountant@example.com",
    "name": "Accountant User",
    "phone_number": "",
    "setup_incomplete": false,
    "employer_id": 2,
    "authentication_token": "token",
    "approval_limit": 1000000,
    "companies": [
      {
        "id": 1,
        "approval_limit": 1000000
      }
    ]
  }
]
```

Retrieves the list of approvers for current company. It will return `[]` if it is an auto approval PO.

### Filter By Department

You can filter approvers list with department by passing `department_id` query
params.

### HTTP Request

`GET https://app.procurementexpress.com/api/v1/companies/approvers?department_id=:id`

### URL Parameters

| Params               | Type    | Description                                             |
| -------------------- | ------- | ------------------------------------------------------- |
| authentication_token | headers | Authentication token                                    |
| app_company_id       | headers | Company Id                                              |
| department_id        | integer | Optional, if you want to filter approvers by department |

## Get All Approvers

```ruby
require 'rest-client'

RestClient.get(
  'https://app.procurementexpress.com/api/v1/companies/all_approvers',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/companies/all_approvers'
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
    "email": "admin@example.com",
    "name": "Admin User",
    "approver_name": "Admin User",
    "phone_number": "",
    "setup_incomplete": false,
    "employer_id": 1,
    "authentication_token": "token",
    "approval_limit": 1000000,
    "companies": [
      {
        "id": 1,
        "approval_limit": 1000000
      }
    ]
  },
  {
    "id": 2,
    "email": "accountant@example.com",
    "name": "Accountant User",
    "name": "Accountant User",
    "approver_name": "Approver User (on behalf of Accountant User)",
    "phone_number": "",
    "setup_incomplete": false,
    "employer_id": 2,
    "authentication_token": "token",
    "approval_limit": 1000000,
    "companies": [
      {
        "id": 1,
        "approval_limit": 1000000
      }
    ]
  }
]
```

Retrieves the list of all approvers for current company regardless of auto approval routing

### Holiday Delegates

Also Note that, because approvers can enable holiday mode and add other approvers as their delegate approvers, in above json response
you will also see `approver_name` column, which contains the name of either delegated approver name, or original approver name.
This column is useful, if you want to display any requests that are delegated on behalf of holiday approver.

### HTTP Request

`GET https://app.procurementexpress.com/api/v1/companies/all_approvers`

### URL Parameters

| Params               | Type    | Description          |
| -------------------- | ------- | -------------------- |
| authentication_token | headers | Authentication token |
| app_company_id       | headers | Company Id           |

## Get All Employees

```ruby
require 'rest-client'

RestClient.get(
  'https://app.procurementexpress.com/api/v1/companies/employees',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/companies/employees'
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
    "email": "admin@example.com",
    "name": "Admin User",
    "phone_number": "",
    "setup_incomplete": false,
    "employer_id": 1,
    "approval_limit": 1000000,
    "companies": [
      {
        "id": 1,
        "approval_limit": 1000000
      }
    ],
    "roles": ["companyadmin", "finance", "approver", "teammember"]
  },
  {
    "id": 2,
    "email": "accountant@example.com",
    "name": "Accountant User",
    "phone_number": "",
    "setup_incomplete": false,
    "employer_id": 1,
    "approval_limit": 1000000,
    "companies": [
      {
        "id": 1,
        "approval_limit": 1000000
      }
    ],
    "roles": ["finance", "approver", "teammember"]
  }
]
```

Retrieves the list of all employees for current company.

### HTTP Request

`GET https://app.procurementexpress.com/api/v1/companies/employees`

### URL Parameters

| Params               | Type    | Description          |
| -------------------- | ------- | -------------------- |
| authentication_token | headers | Authentication token |
| app_company_id       | headers | Company Id           |

## Invite User

```ruby
require 'rest-client'

RestClient.post(
  'https://app.procurementexpress.com/api/v1/companies/send_user_invite',
  {
    invite_user: {
      email: 'friend@example.com',
      name: 'Pherrel Williams',
      roles: ["approver", "teammember"]
    }
  },
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/companies/send_user_invite'
  -X POST
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "invite_user[email]=friend@example.com"
  -d "invite_user[name]=Pherrel Williams"
  -d "invite_user[roles]=approver"
  -d "invite_user[roles]=teammember"
```

> The above command returns JSON structured like this:

```json
{ "status": true }
```

Send invitation to the user.

### HTTP Request

`POST https://app.procurementexpress.com/api/v1/companies/send_user_invite`

### URL Parameters

| Params               | Type    | Description                                                                                                                |
| -------------------- | ------- | -------------------------------------------------------------------------------------------------------------------------- |
| authentication_token | headers | Authentication token                                                                                                       |
| app_company_id       | headers | Company id                                                                                                                 |
| invite_user[email]   | string  | Email to send invitation to                                                                                                |
| invite_user[name]    | string  | User's first name and last name                                                                                            |
| invite_user[roles]   | Array[] | List of Roles for that user. Available roles are: <br/> - companyadmin <br/> - approver <br/> - finance <br/> - teammember |

## Invite Limit Left

```ruby
require 'rest-client'

RestClient.get(
  'https://app.procurementexpress.com/api/v1/companies/invite_limit_left',
  headers = {
    app_company_id: 1,
    authentication_token: 'token'
  }
)
```

```sh
curl 'https://app.procurementexpress.com/api/v1/companies/invite_limit_left'
  -X GET
  -H 'authentication_token: token'
  -H 'app_company_id: 1'
```

> Above command will response

```json
{
  "limit_left": 4,
  "active_users": 1,
  "allowed_users": 5
}
```

This endpoint will return information about your current subscription. Information like, `limit_left`, how many `active_users` are currently there in company and how many total `allowed_users` you can add to this company as per your subscription.

### HTTP Request

`GET https://app.procurementexpress.com/api/v1/companies/invite_limit_left`

### URL Parameters

| Params               | Type    | Description          |
| -------------------- | ------- | -------------------- |
| authentication_token | headers | Authentication token |
| app_company_id       | headers | Company id           |

## Chart of accounts

```ruby
require 'rest-client'

RestClient.get(
  'https://app.procurementexpress.com/api/v1/companies/chart_of_accounts',
  headers = {
    app_company_id: 1,
    authentication_token: 'token'
  }
)
```

```sh
curl 'https://app.procurementexpress.com/api/v1/companies/chart_of_accounts'
  -X GET
  -H 'authentication_token: token'
  -H 'app_company_id: 1'
```

> Above command will response

```json
[
  {
    "id": 1,
    "name": "Advertising",
    "classification": "Expense",
    "account_type": "Expense",
    "archived": false,
  },
  {
    "id": 2,
    "name": "Automobile",
    "classification": "Expense",
    "account_type": "Expense",
    "archived": false,
  },
  {
    "id": 3,
    "name": "Fuel",
    "classification": "Expense",
    "account_type": "Expense",
    "archived": false,
  }
]
```

This endpoint will return all ChartOfAccounts for given companies, if company is connected with QuickBooks online, otherwise it will return empty [].

### HTTP Request

`GET https://app.procurementexpress.com/api/v1/companies/chart_of_accounts`

### URL Parameters

| Params               | Type    | Description          |
| -------------------- | ------- | -------------------- |
| authentication_token | headers | Authentication token |
| app_company_id       | headers | Company id           |
