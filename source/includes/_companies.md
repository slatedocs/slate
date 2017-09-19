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
    authentication_token: 'your token',
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

