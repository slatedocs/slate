# Bulk Datas

## List All Bulk Datas

```ruby
require 'rest-client'

RestClient.get(
  'https://app.procurementexpress.com/api/v1/bulk_datas',
  {
    synced_at: "2018-8-10T09:17:58.097-05:00"
  },
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl https://app.procurementexpress.com/api/v1/bulk_datas
  -X GET
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "synced_at=2018-8-10T09:17:58.097-05:00"
```

> The above command returns JSON structured like this:

```json
{
  "id": 11752,
  "email": "at@icloud.com",
  "name": "test android",
  "phone_number": "+1234567890",
  "setup_incomplete": false,
  "employer_id": 6008,
  "authentication_token": "xaser2324dc-derer",
  "approval_limit": 10000,
  "synced_at": "2018-10-02T03:07:36.465-05:00",
  "companies": [
    {
      "id": 1,
      "name": "android test",
      "employees_count": 5,
      "default_tax_rate": 45.3266,
      "prepaid_subscription": false,
      "multicompany_pack": false,
      "top_supplier_ids": [1, 2, 3],
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
        "reserve_po_number": false
      },
      "supported_currencies": [
        {
          "id": 1,
          "iso_code": "EUR",
          "iso_numeric": "978",
          "name": "Euro",
          "symbol": "€",
          "created_at": "2014-12-05T09:32:59.165-06:00",
          "updated_at": "2014-12-05T09:32:59.165-06:00"
        }
      ],
      "custom_fields": [
        {
          "id": 1,
          "company_id": 1,
          "name": "SHIP TO",
          "field_type": "select",
          "active": true,
          "required": true,
          "options": ["1166", "TOA", "PSC", "See Shipping Instructions"],
          "access_level": "everyone",
          "position": 1,
          "on_line_item": false,
          "display_on_pdf": true,
          "on_budget": false,
          "created_at": "2017-10-16T15:10:43.068-05:00",
          "updated_at": "2017-10-16T15:10:43.068-05:00",
          "editable_after_approval": true
        }
      ],
      "departments": [
        {
          "id": 1,
          "name": "Admin",
          "company_id": 1,
          "archived": false,
          "contact_person": "",
          "tax_number": "",
          "phone_number": "",
          "address": "",
          "email": "",
          "created_at": "2017-10-18T16:38:22.428-05:00",
          "updated_at": "2017-10-18T16:38:22.428-05:00",
          "supplier_ids": [],
          "budget_ids": [],
          "top_supplier_ids": [1, 2]
        }
      ],
      "budgets": [
        {
          "id": 1,
          "company_id": 1,
          "name": "Sample Budget",
          "amount": 10000000,
          "cost_code": "",
          "cost_type": "",
          "archived": false,
          "currency_id": 3,
          "base_amount": 50000000,
          "base_rate": "1.0",
          "allow_anyone_to_approve_a_po": false,
          "start_date": null,
          "end_date": null,
          "summary": "ADP Budget ",
          "remaining_amount": 50000000,
          "creator_id": 18088,
          "department_ids": [1, 2, 3],
          "approver_ids": [1, 2, 3],
          "created_at": "2018-10-12T07:11:34.484-05:00",
          "updated_at": "2018-10-12T07:11:34.484-05:00"
        }
      ],
      "tax_rates": [
        {
          "id": 1,
          "name": "New York",
          "value": 8,
          "archived": false,
          "company_id": 9736,
          "created_at": "2018-05-14T15:17:41.678-05:00",
          "updated_at": "2018-05-14T15:17:41.678-05:00"
        }
      ],
      "suppliers": [
        {
          "id": 1,
          "name": "Datalink",
          "company_id": 1,
          "notes": "",
          "phone_number": "+1234567890",
          "address": "#2 Park Place, New York NY 10036",
          "email": "john@doe.com",
          "payment_details": "",
          "archived": true,
          "contact_person": "John Doe",
          "tax_number": "",
          "created_at": "2017-10-16T15:03:13.676-05:00",
          "updated_at": "2017-10-16T15:07:20.050-05:00",
          "department_ids": [],
          "third_party_id_mappings": []
        }
      ],
      "products": [
        {
          "id": 1,
          "supplier_id": 1,
          "sku": "SUP-ETH-1S",
          "description": "1YR SILVER TECH SUP & WARR FOR ETHERNET ADAPTER CARDS. Delivery times vary.\r\n     Coverage Terms: 12months",
          "unit_price": "19.39",
          "currency_id": null,
          "archived": false,
          "created_at": "2018-04-10T15:12:03.846-05:00",
          "updated_at": "2018-04-10T15:12:03.846-05:00"
        }
      ],
      "approvers": [
        {
          "id": 1,
          "email": "purchasing-internal@deshaw.com",
          "name": "Akecia Dorset",
          "phone_number": "+12124780528",
          "setup_incomplete": false,
          "employer_id": 1,
          "authentication_token": "WWwQ8nhzv_dnQ5Uft1hJ",
          "approval_limit": 1000000,
          "companies": [
            {
              "id": 1,
              "name": "DE Shaw",
              "membership_archived": false,
              "is_locked": false,
              "is_removed": false,
              "approval_limit": 1000000,
              "in_trial": false,
              "trial_expired": false,
              "remaining_trial_days": 344,
              "roles": ["companyadmin", "approver", "finance", "teammember"]
            }
          ]
        }
      ]
    }
  ]
}
```

List of current users object along with it's associated companies with `company_setting`, `custom_fields`, `supported_currencies`, `departments`, `budgets`, `tax_rates`, `suppliers`, `products`, etc for each companies from same api endpoint. You will also get `synced_at` which will always return last synced at date time. You can pass `synced_at` query params, which will return newly created or updated records after given synced-at date. If `synced_at` is missing then it will return all data for given company.

### HTTP Request

`GET https://app.procurementexpress.com/api/v1/bulk_datas?synced_at=...`

### Query Parameters

| Param                | Type     | Description                                                       |
| -------------------- | -------- | ----------------------------------------------------------------- |
| authentication_token | header   | Authentication token                                              |
| app_company_id       | header   | registered company id                                             |
| synced_at            | DateTime | synced_at datetime for the record that you get from json response |

<aside class="info">
NOTE - You will get <strong>synced_at</strong> value from the json response for top level object, so make sure you store it somewhere to reuse it in future.
</aside>
