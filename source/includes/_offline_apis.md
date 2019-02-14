# Offline APIs

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
      "roles": ["companyadmin", "approver", "finance", "teammember"],
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
          "top_supplier_ids": [1, 2],
          "approver_ids": [1, 2]
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
      "meta": {
        "current_page": 1,
        "next_page": 2,
        "prev_page": null,
        "total_pages": 2,
        "total_count": 60,
        "paginated_objects": [
          "budgets",
          "suppliers",
          "products"
        ]
      },
      "has_unassigned_budgets": true,
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

### Pagination

We need to use pagination, so that we don't put heavy load to the server by fetching hundreds
of thousands of records at once. To do that, you can pass `page` query params, which is a page
number of the records you want to fetch in batch of 50 records per page by default.

In the response, you will see `meta` json attributes for each companies, which determines, which
page number are you on right now, and how many pages are there, total number of records, etc. Use
this information to build your pagination.

`GET https://app.procurementexpress.com/api/v1/bulk_datas?synced_at=...&page=1`

### About approval routing

Read [Approval Routing Docs](https://github.com/rubberstamp/po-app/wiki/Rubberstamp-Approvals-Flow) for more information. In bulk_datas api endpoint response, each companies object will hold `has_unassigned_budgets` attribute, if it is true, then we should implement manual approval routing and if the value is false then it should be auto approval routing.

### Query Parameters

| Param                | Type     | Description                                                       |
| -------------------- | -------- | ----------------------------------------------------------------- |
| authentication_token | header   | Authentication token                                              |
| app_company_id       | header   | registered company id                                             |
| synced_at            | DateTime | synced_at datetime for the record that you get from json response |

<aside class="info">
NOTE - You will get <strong>synced_at</strong> value from the json response for top level object, so make sure you store it somewhere to reuse it in future.
</aside>

## Create Bulk Purchase Orders

```ruby
require 'rest-client'

RestClient.post(
  'https://app.procurementexpress.com/api/v1/purchase_orders/bulk_save',
  {
    purchase_order: {
     data: [{
        creator_id: 1,
        commit: "send",
        supplier_name: "John Doe",
        notes: "Notes",
        company_id: 1,
        currency_id: 1,
        department_id:  1,
        purchase_order_items_attributes: [
          {
            description: "hello",
            budget_id: 1,
            vat: "1.1",
            status: "pending",
            quantity: "1.0",
            unit_price: "50"
          }
        ],
        _id: "1234567890"
      }]
    }
  },
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/purchase_orders/bulk_save'
  -X POST
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "purchase_order[data][][creator_id]=1"
  -d "purchase_order[data][][commit]=send"
  -d "purchase_order[data][][supplier_name]=John Doe"
  -d "purchase_order[data][][notes]=Notes"
  -d "purchase_order[data][][company_id]=1"
  -d "purchase_order[data][][currency_id]=1"
  -d "purchase_order[data][][department_id]=1"
  -d "purchase_order[data][][purchase_order_items_attributes][][description]=hello"
  -d "purchase_order[data][][purchase_order_items_attributes][][budget_id]=1"
  -d "purchase_order[data][][purchase_order_items_attributes][][vat]=1.1"
  -d "purchase_order[data][][purchase_order_items_attributes][][status]=pending"
  -d "purchase_order[data][][purchase_order_items_attributes][][quantity]=1.0"
  -d "purchase_order[data][][purchase_order_items_attributes][][unit_price]=50"
  -d "purchase_order[data][][_id]=1234567890
```

> The above command returns JSON structured like this:

```json
{
  "done": [{ "_id": 1234567890, "id": 1 }],
  "failed": [{ "_id": "", "errors": [] }]
}
```

In this api endpoint, you can pass multiple new purchase orders request at once, and it will try to create them all in our database. You should pass `_id` unique id for each purchase order, so that final response will return success or failed purchase orders with `_id` that you sent and the `id` that was created in server. If there are failed purchase orders, then it will also return `errors` for each failed purchase orders with validation message.

### About commit params

`commit` params will accept 2 values `send` and `draft`, default is `draft`. If you pass `send` as a value, it will create purchase order as pending, and send it for approval, otherwise it will be in draft state.

### HTTP Request

`POST https://app.procurementexpress.com/api/v1/purchase_orders/bulk_save`

### Query Parameters

| Params                                                                                                     | Type    | Options                                                            | Description                                                |
| ---------------------------------------------------------------------------------------------------------- | ------- | ------------------------------------------------------------------ | ---------------------------------------------------------- |
| authentication_token                                                                                       | header  | required                                                           | Authentication Token                                       |
| app_company_id                                                                                             | header  | required                                                           | Company ID                                                 |
| commit                                                                                                     | string  | `Send` <br /> `Draft`                                              | Possible values are `Send` and `Draft`                     |
| purchase_order[data][][supplier_name]                                                                      | string  | required                                                           | Supplier Name                                              |
| purchase_order[data][][new_supplier_name]                                                                  | string  | optional                                                           | New Supplier Name                                          |
| purchase_order[data][][department_id]                                                                      | integer | required                                                           | Department ID                                              |
| purchase_order[data][][creator_id]                                                                         | integer | required                                                           | Creator ID                                                 |
| purchase_order[data][][supplier_id]                                                                        | integer | required                                                           | Supplier ID                                                |
| purchase_order[data][][currency_id]                                                                        | integer | required                                                           | Currency ID                                                |
| purchase_order[data][][notes]                                                                              | string  | optional                                                           | Notes for this PO                                          |
| purchase_order[data][][status]                                                                             | boolean | `Pending` <br /> `Draft`                                           | Status                                                     |
| purchase_order[data][][company_id]                                                                         | integer | required                                                           | Company ID                                                 |
| purchase_order[data][][approver_list]                                                                      | Array[] | required (follow approval routing guide)                           | Approver list IDs                                          |
| purchase_order[data][][purchase_order_items_attributes][][id]                                              | integer | optional                                                           | Purchase order item id                                     |
| purchase_order[data][][purchase_order_items_attributes][][sequence_no]                                     | integer | required                                                           | Sequence number                                            |
| purchase_order[data][][purchase_order_items_attributes][][description]                                     | string  | required                                                           | Description                                                |
| purchase_order[data][][purchase_order_items_attributes][][quantity]                                        | decimal | required                                                           | Item quantity                                              |
| purchase_order[data][][purchase_order_items_attributes][][net_amount]                                      | decimal | required                                                           | Net amount                                                 |
| purchase_order[data][][purchase_order_items_attributes][][unit_price]                                      | decimal | required                                                           | Unit price                                                 |
| purchase_order[data][][purchase_order_items_attributes][][budget_id]                                       | integer | required                                                           | Budget ID                                                  |
| purchase_order[data][][purchase_order_items_attributes][][vat]                                             | decimal | required                                                           | VAT                                                        |
| purchase_order[data][][purchase_order_items_attributes][][item_number]                                     | string  | required                                                           | Item Number                                                |
| purchase_order[data][][purchase_order_items_attributes][][purchase_order_id]                               | integer | required                                                           | Purchase Order ID                                          |
| purchase_order[data][][purchase_order_items_attributes][][_destroy]                                        | boolean | `true` <br/> `false`                                               | set `true` if you want to delete specific row of item      |
| purchase_order[data][][purchase_order_items_attributes][custom_field_values_attributes][][id]              | integer | optional                                                           | `CustomFieldValue` ID                                      |
| purchase_order[data][][purchase_order_items_attributes][custom_field_values_attributes][][value]           | string  | optional                                                           | Value for CustomFieldValue                                 |
| purchase_order[data][][purchase_order_items_attributes][custom_field_values_attributes][][custom_field_id] | integer | optional                                                           | CustomField ID                                             |
| purchase_order[data][][custom_field_values_attributes][][id]                                               | integer | optional                                                           | CustomFieldValue ID                                        |
| purchase_order[data][][custom_field_values_attributes][][value]                                            | string  | optional                                                           | Value for CustomFieldValue                                 |
| purchase_order[data][][custom_field_values_attributes][][custom_field_id]                                  | integer | optional                                                           | CustomField ID                                             |
| purchase_order[data][][purchase_order_comments_attributes][][id]                                           | integer | optional                                                           | PurchaseOrderComment ID                                    |
| purchase_order[data][][purchase_order_comments_attributes][][creator_id]                                   | integer | optional                                                           | Creator ID                                                 |
| purchase_order[data][][purchase_order_comments_attributes][][comment]                                      | integer | optional                                                           | Comment                                                    |
| purchase_order[data][][purchase_order_comments_attributes][][purchase_order_id]                            | integer | optional                                                           | Purchase Order ID                                          |
| purchase_order[data][][purchase_order_comments_attributes][uploads_attributes][][id]                       | integer | optional                                                           | Upload ID                                                  |
| purchase_order[data][][purchase_order_comments_attributes][uploads_attributes][][file]                     | integer | optional                                                           | file field used to upload file e.g: Images, Documents, etc |
| purchase_order[data][][purchase_order_comments_attributes][uploads_attributes][][creator_id]               | integer | optional                                                           | Creator ID                                                 |
| purchase_order[data][][purchase_order_comments_attributes][uploads_attributes][][_destroy]                 | boolean | optional `true` <br/> `false`                                      | Set `true` if you want to delete specific row of upload    |
| purchase_order[data][][uploads_attributes][][id]                                                           | integer | optional                                                           | Upload ID                                                  |
| purchase_order[data][][uploads_attributes][][file]                                                         | integer | optional                                                           | file field used to upload file e.g: Images, Documents, etc |
| purchase_order[data][][uploads_attributes][][creator_id]                                                   | integer | optional                                                           | Creator ID                                                 |
| purchase_order[data][][uploads_attributes][][_destroy]                                                     | boolean | optional `true` <br/> `false`                                      | Set `true` if you want to delete specific row of upload    |
| purchase_order[data][][requests_attributes][][id]                                                          | integer | optional                                                           | Request ID                                                 |
| purchase_order[data][][requests_attributes][][approver_id]                                                 | integer | optional                                                           | Approver ID                                                |
| purchase_order[data][][requests_attributes][][_destroy]                                                    | boolean | optional `true` <br/> `false`                                      | Set `true` if you want to delete specific row of request   |
| purchase_order[data][][allocations_attributes][][id]                                                       | integer | optional                                                           | Allocation ID                                              |
| purchase_order[data][][allocations_attributes][][allocation_target_id]                                     | integer | optional                                                           | Allocation Target ID                                       |
| purchase_order[data][][allocations_attributes][][group_id]                                                 | integer | optional                                                           | Group ID                                                   |
| purchase_order[data][][allocations_attributes][][maybe_value]                                              | integer | optional                                                           | Value                                                      |
| purchase_order[data][][allocations_attributes][][_destroy]                                                 | destroy | `true` <br/> `false`                                               | set `true` if you want to delete specifi row of allocation |
