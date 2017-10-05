# Companies

## Create a company

```ruby
require 'rest-client'

RestClient.post(
  'https://app.rubberstamp.io/api/v1/companies',
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
curl 'https://app.rubberstamp.io/api/v1/companies'
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

`POST https://app.rubberstamp.io/api/v1/companies`

### Query Parameters

| Params                                                                              | Type    | Description                                     |
| ----                                                                                | -----   | ----------                                      |
| authentication_token                                                                | header  | Authentication token                            |
| company[name]                                                                       | string  | `Required` - Company name                       |
| company[gross_or_net_config]                                                        | integer | Gross or Net config                             |
| company[default_tax_rate]                                                           | double  | Default TAX Rate                                |
| company[supported_currency_ids]                                                     | Array[] | Supported currency ids                          |
| company[company_currency_exchange_rates]                                            | Array[] | Currency exchange rates                         |
| company[budget_attributes][0][amount]                                               | double  | Budget amount                                   |
| company[budget_attributes][0][name]                                                 | string  | Budget Name                                     |
| company[budget_attributes][0][creator_id]                                           | integer | Budget creator id                               |
| company[budget_attributes][0][currency_id]                                          | integer | Budget currency id                              |
| company[company_setting_attributes][id]                                             | integer | ID                                              |
| company[company_setting_attributes][currency_id]                                    | integer | `Required` - Company Setting's currency id      |
| company[company_setting_attributes][pdf_font_size]                                  | integer | PDF font size                                   |
| company[company_setting_attributes][date_format]                                    | string  | Date format e.g: "%Y-%m-%d"                     |
| company[company_setting_attributes][custom_field_to_include_in_po_number_id]        | integer | Custom field to include in PO number ID         |
| company[company_setting_attributes][javascript]                                     | string  | Javascript setting                              |
| company[company_setting_attributes][departments_alias]                              | string  | Department alias                                |
| company[company_setting_attributes][tax_label]                                      | string  | Tax label                                       |
| company[company_setting_attributes][approvals_require_login]                        | boolean | Approvals require Login?                        |
| company[company_setting_attributes][show_po_item_number]                            | boolean | Show PO item number?                            |
| company[company_setting_attributes][fixed_supplier_list]                            | boolean | Fixed supplier List?                            |
| company[company_setting_attributes][display_remaining_budget_amount]                | boolean | Display remaining budget amount?                |
| company[company_setting_attributes][display_budget_on_pdf]                          | boolean | Display budget on PDF?                          |
| company[company_setting_attributes][fixed_product_list]                             | boolean | Fixed product list?                             |
| company[company_setting_attributes][show_tax_column]                                | boolean | Show TAX column?                                |
| company[company_setting_attributes][show_company_name]                              | boolean | Show company name?                              |
| company[company_setting_attributes][show_approver_name]                             | boolean | Show approver name?                             |
| company[company_setting_attributes][user_can_add_supplier]                          | boolean | User can add supplier?                          |
| company[company_setting_attributes][manually_approve_by_lowest_available_approvers] | boolean | Manually approve by lowest available approvers? |
| company[company_setting_attributes][share_po_access_by_department]                  | boolean | Share PO access by department?                  |
| company[company_setting_attributes][allow_budget_overruns]                          | boolean | Allow budget overruns?                          |
| company[company_setting_attributes][allocations_enabled]                            | boolean | Allocations enabled?                            |
| company[company_setting_attributes][pdf_background]                                 | string  | PDF background                                  |
| company[company_setting_attributes][pdf_footer]                                     | string  | PDF footer                                      |
| company[company_setting_attributes][logo]                                           | string  | Logo                                            |
| company[company_setting_attributes][logo_alignment]                                 | string  | Logo alignment                                  |
| company[company_setting_attributes][logo_content_type]                              | string  | Logo content type                               |
| company[company_setting_attributes][budgets_alias]                                  | string  | Budget alias                                    |
| company[company_setting_attributes][po_fields]                                      | Array[] | PO fields                                       |




## Get all companies


```ruby
require 'rest-client'

response = RestClient.get(
  'https://app.rubberstamp.io/api/v1/companies',
  headers = {
    authentication_token: 'your token'
  }
)

response.body
```

```shell
curl 'https://app.rubberstamp.io/api/v1/companies'
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

`GET https://app.rubberstamp.io/api/v1/companies`

### Query Parameters

| Params               | Type   | Description          |
| -----                | ------ | ------------         |
| authentication_token | header | Authentication token |




## Get a specific company

```ruby
require 'rest-client'

RestClient.get(
  'https://app.rubberstamp.io/api/v1/companies/1',
  headers = {
    authentication_token: 'your token',
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/companies/1'
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
    "po_fields": [
      "Date",
      "Budgets",
      "From",
      "PO number",
      "Net Amount"
    ],
    "reserve_po_number": false
  },
  "custom_fields": [
    {
      "id": 1,
      "company_id": 1,
      "name": "Reason for expenditure",
      "field_type": "select",
      "active": false,
      "required": false,
      "options": [
        "Acquisition of new donors.",
        "Existing donors."
      ],
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

`GET https://app.rubberstamp.io/api/v1/companies/:id`

### URL Parameters

| Params               | Type    | Description          |
| -----                | -----   | ------------         |
| authentication_token | header  | Authentication token |
| ID                   | integer | Company Id           |



## Get Details

```ruby
require 'rest-client'

RestClient.get(
  'https://app.rubberstamp.io/api/v1/companies/details',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/companies/details'
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
    "po_fields": [
      "Date",
      "Budgets",
      "From",
      "PO number",
      "Net Amount"
    ],
    "reserve_po_number": false
  },
  "custom_fields": [
    {
      "id": 1,
      "company_id": 1,
      "name": "Reason for expenditure",
      "field_type": "select",
      "active": false,
      "required": false,
      "options": [
        "Acquisition of new donors.",
        "Existing donors."
      ],
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

`GET https://app.rubberstamp.io/api/v1/companies/details`

### URL Parameters

| Params               | Type   | Description          |
| -----                | -----  | ------------         |
| authentication_token | header | Authentication token |
| app_company_id       | header | Company Id           |




## Approvers

```ruby
require 'rest-client'

RestClient.get(
  'https://app.rubberstamp.io/api/v1/companies/approvers',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/companies/approvers'
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
                "name": "ABC Corp."
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
                "name": "ABC Corp."
            }
        ]
    }
]
```

Retrieves the list of approvers for current company.

### Populate approvers list depending on approval routing

if you pass `budget_id` as an extra params then it will check if it is match auto
approval routing and if yes, it won't return approvers list. example:
`https://app.rubberstamp.io/api/v1/companies/approvers?budget_id=1`

### Filter approvers by budget

if you pass both `budget_id` and `show_approvers` then it will display list of
approvers for that budget if any.

`https://app.rubberstamp.io/api/v1/companies/approvers?budget_id=1&show_approvers=true`

### HTTP Request

`GET https://app.rubberstamp.io/api/v1/companies/approvers`

### URL Parameters

| Params               | Type    | Description                                                |
| ------               | ------  | -------------                                              |
| authentication_token | headers | Authentication token                                       |
| app_company_id       | headers | Company Id                                                 |
| budget_id            | integer | Approvers list won't display if already assigned to budget |
| show_approvers       | boolean | Will display approvers for budget                          |


## Existing Approvers

## Invite User

```ruby
require 'rest-client'

RestClient.post(
  'https://app.rubberstamp.io/api/v1/companies/send_user_invite',
  {
    invite_user: {
      email: 'friend@example.com',
      name: 'Pherrel Williams',
      roles: ["admin", "accountant"]
    }
  },
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/companies/send_user_invite'
  -X POST
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "invite_user[email]=friend@example.com"
  -d "invite_user[name]=Pherrel Williams"
  -d "invite_user[roles]=admin"
  -d "invite_user[roles]=accountant"
```

> The above command returns JSON structured like this:

```json
{}
```

Send invitation to the user.

### HTTP Request

`POST https://app.rubberstamp.io/api/v1/companies/send_user_invite`

### URL Parameters

| Params               | Type    | Description                     |
| -----                | ------  | ---------                       |
| authentication_token | headers | Authentication token            |
| app_company_id       | headers | Company id                      |
| invite_user[email]   | string  | Email to send invitation to     |
| invite_user[name]    | string  | User's first name and last name |
| invite_user[roles]   | Array[] | List of Roles for that user     |
