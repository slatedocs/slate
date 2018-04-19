# Purchase Orders

## Create a Purchase Order

```ruby
require 'rest-client'

RestClient.post(
  'https://app.rubberstamp.io/api/v1/purchase_orders',
  {
    commit: "Send",
    purchase_order: {
      creator_id: 1,
      status: "draft",
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
      ]
    }
  },
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/purchase_orders'
  -X POST
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "commit=Send"
  -d "purchase_order[creator_id]=1"
  -d "purchase_order[status]=draft"
  -d "purchase_order[supplier_name]=John Doe"
  -d "purchase_order[notes]=Notes"
  -d "purchase_order[company_id]=1"
  -d "purchase_order[currency_id]=1"
  -d "purchase_order[department_id]=1"
  -d "purchase_order[purchase_order_items_attributes][][description]=hello"
  -d "purchase_order[purchase_order_items_attributes][][budget_id]=1"
  -d "purchase_order[purchase_order_items_attributes][][vat]=1.1"
  -d "purchase_order[purchase_order_items_attributes][][status]=pending"
  -d "purchase_order[purchase_order_items_attributes][][quantity]=1.0"
  -d "purchase_order[purchase_order_items_attributes][][unit_price]=50"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "company_id": 1,
  "approval_key": null,
  "department_id": 1,
  "department_name": "400852",
  "supplier_id": 1,
  "supplier_name": "John Doe",
  "status": "pending",
  "creator_id": 1,
  "currency_id": 1,
  "creator_name": "Robert W.",
  "amount": "50.55",
  "created_at": 1505972258,
  "updated_at": 1505972258,
  "notes": "Notes",
  "total_net_amount": "50.0",
  "total_gross_amount": "50.55",
  "base_gross_amount": "44.564375",
  "delivery_status": "not_delivered",
  "delivered_on": null,
  "custom_fields": null,
  "share_key": "HEFYPNLBYFMKROPXUTCMPGMQCOGROKOS20170921003738",
  "archived": false,
  "conversion_rate": "0.88159",
  "keywords":
    "John Doe James Kennedy  pending 44.56  1100044 - Embajadores de marca Google en Retail Chromecast hello 50.55 50.0",
  "self_approved": false,
  "xero_id": null,
  "synced_with_xero": false,
  "purchase_order_items": [
    {
      "id": 1,
      "description": "hello",
      "purchase_order_id": 1,
      "budget_id": 1,
      "budget_summary":
        "1100044 - Embajadores de marca Google en Retail Chromecast : F 9575 : TELEFONIA Y CELULARES",
      "gross_amount": "50.55",
      "vat": "1.1",
      "net_amount": "50.0",
      "status": "pending",
      "quantity": "1.0",
      "unit_price": "50.0",
      "item_number": null,
      "base_net_amount": "44.0795",
      "base_gross_amount": "44.564375",
      "gross_usd_amount": "50.55",
      "product_id": null,
      "received_quantity": null,
      "custom_field_values": []
    }
  ],
  "budgets": [
    {
      "id": 1,
      "company_id": 1,
      "name": "1100044 - Embajadores de marca Google en Retail Chromecast",
      "amount": "19500.0",
      "cost_code": "F 9575",
      "cost_type": "TELEFONIA Y CELULARES",
      "archived": false,
      "currency_id": 100,
      "base_amount": "19500.0",
      "base_rate": "1.0",
      "allow_anyone_to_approve_a_po": false,
      "start_date": null,
      "end_date": null,
      "summary":
        "1100044 - Embajadores de marca Google en Retail Chromecast : F 9575 : TELEFONIA Y CELULARES"
    }
  ],
  "purchase_order_comments": [],
  "custom_field_values": [],
  "payments": [],
  "purchase_order_item_payments": [],
  "uploads": [],
  "approver_requests": [
    {
      "id": 1,
      "status": "pending",
      "approver_name": "Gillian Neary",
      "approver_id": 2
    }
  ]
}
```

Create a new Purchase Order and return the `Purchase Order` object that is created.
You need to pass `commit` param which accepts 2 values for now `Draft` and `Send`,
these values will determine the status of the Purchase Order.

### HTTP Request

`POST https://app.rubberstamp.io/api/v1/purchase_orders`

### Query Parameters

| Params                                                                                             | Type    | Options                  | Description                                                |
| -------------------------------------------------------------------------------------------------- | ------- | ------------------------ | ---------------------------------------------------------- |
| authentication_token                                                                               | header  |                          | Authentication Token                                       |
| app_company_id                                                                                     | header  |                          | Company ID                                                 |
| commit                                                                                             | string  | `Send` <br /> `Draft`    | Possible values are `Send` and `Draft`                     |
| purchase_order[supplier_name]                                                                      | string  |                          | Supplier Name                                              |
| purchase_order[new_supplier_name]                                                                  | string  |                          | New Supplier Name                                          |
| purchase_order[department_id]                                                                      | integer |                          | Department ID                                              |
| purchase_order[creator_id]                                                                         | integer |                          | Creator ID                                                 |
| purchase_order[supplier_id]                                                                        | integer |                          | Supplier ID                                                |
| purchase_order[currency_id]                                                                        | integer |                          | Currency ID                                                |
| purchase_order[notes]                                                                              | string  |                          | Notes for this PO                                          |
| purchase_order[status]                                                                             | boolean | `Pending` <br /> `Draft` | Status                                                     |
| purchase_order[company_id]                                                                         | integer |                          | Company ID                                                 |
| purchase_order[approver_list]                                                                      | Array[] |                          | Approver list IDs                                          |
| purchase_order[purchase_order_items_attributes][][id]                                              | integer |                          | Purchase order item id                                     |
| purchase_order[purchase_order_items_attributes][][sequence_no]                                     | integer |                          | Sequence number                                            |
| purchase_order[purchase_order_items_attributes][][description]                                     | string  |                          | Description                                                |
| purchase_order[purchase_order_items_attributes][][quantity]                                        | decimal |                          | Item quantity                                              |
| purchase_order[purchase_order_items_attributes][][net_amount]                                      | decimal |                          | Net amount                                                 |
| purchase_order[purchase_order_items_attributes][][unit_price]                                      | decimal |                          | Unit price                                                 |
| purchase_order[purchase_order_items_attributes][][budget_id]                                       | integer |                          | Budget ID                                                  |
| purchase_order[purchase_order_items_attributes][][vat]                                             | decimal |                          | VAT                                                        |
| purchase_order[purchase_order_items_attributes][][item_number]                                     | string  |                          | Item Number                                                |
| purchase_order[purchase_order_items_attributes][][purchase_order_id]                               | integer |                          | Purchase Order ID                                          |
| purchase_order[purchase_order_items_attributes][][_destroy]                                        | boolean | `true` <br/> `false`     | set `true` if you want to delete specific row of item      |
| purchase_order[purchase_order_items_attributes][custom_field_values_attributes][][id]              | integer |                          | `CustomFieldValue` ID                                      |
| purchase_order[purchase_order_items_attributes][custom_field_values_attributes][][value]           | string  |                          | Value for CustomFieldValue                                 |
| purchase_order[purchase_order_items_attributes][custom_field_values_attributes][][custom_field_id] | integer |                          | CustomField ID                                             |
| purchase_order[custom_field_values_attributes][][id]                                               | integer |                          | CustomFieldValue ID                                        |
| purchase_order[custom_field_values_attributes][][value]                                            | string  |                          | Value for CustomFieldValue                                 |
| purchase_order[custom_field_values_attributes][][custom_field_id]                                  | integer |                          | CustomField ID                                             |
| purchase_order[purchase_order_comments_attributes][][id]                                           | integer |                          | PurchaseOrderComment ID                                    |
| purchase_order[purchase_order_comments_attributes][][creator_id]                                   | integer |                          | Creator ID                                                 |
| purchase_order[purchase_order_comments_attributes][][comment]                                      | integer |                          | Comment                                                    |
| purchase_order[purchase_order_comments_attributes][][purchase_order_id]                            | integer |                          | Purchase Order ID                                          |
| purchase_order[purchase_order_comments_attributes][uploads_attributes][][id]                       | integer |                          | Upload ID                                                  |
| purchase_order[purchase_order_comments_attributes][uploads_attributes][][file]                     | integer |                          | file field used to upload file e.g: Images, Documents, etc |
| purchase_order[purchase_order_comments_attributes][uploads_attributes][][creator_id]               | integer |                          | Creator ID                                                 |
| purchase_order[purchase_order_comments_attributes][uploads_attributes][][_destroy]                 | boolean | `true` <br/> `false`     | Set `true` if you want to delete specific row of upload    |
| purchase_order[uploads_attributes][][id]                                                           | integer |                          | Upload ID                                                  |
| purchase_order[uploads_attributes][][file]                                                         | integer |                          | file field used to upload file e.g: Images, Documents, etc |
| purchase_order[uploads_attributes][][creator_id]                                                   | integer |                          | Creator ID                                                 |
| purchase_order[uploads_attributes][][_destroy]                                                     | boolean | `true` <br/> `false`     | Set `true` if you want to delete specific row of upload    |
| purchase_order[requests_attributes][][id]                                                          | integer |                          | Request ID                                                 |
| purchase_order[requests_attributes][][approver_id]                                                 | integer |                          | Approver ID                                                |
| purchase_order[requests_attributes][][_destroy]                                                    | boolean | `true` <br/> `false`     | Set `true` if you want to delete specific row of request   |
| purchase_order[allocations_attributes][][id]                                                       | integer |                          | Allocation ID                                              |
| purchase_order[allocations_attributes][][allocation_target_id]                                     | integer |                          | Allocation Target ID                                       |
| purchase_order[allocations_attributes][][group_id]                                                 | integer |                          | Group ID                                                   |
| purchase_order[allocations_attributes][][maybe_value]                                              | integer |                          | Value                                                      |
| purchase_order[allocations_attributes][][_destroy]                                                 | destroy | `true` <br/> `false`     | set `true` if you want to delete specifi row of allocation |

## Get all Purchase Orders

```ruby
require 'rest-client'

RestClient.get(
  'https://app.rubberstamp.io/api/v1/purchase_orders',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/purchase_orders'
  -X GET
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
```

> The above command returns JSON structured like this:

```json
{
  "purchase_orders": [
    {
      "id": 1,
      "creator_name": "James Kennedy",
      "amount": "50.55",
      "status": "pending",
      "supplier_name": "John Doe",
      "keywords":
        "John doe James Kennedy  pending 44.56  1100044 - Embajadores de marca Google en Retail Chromecast hello 50.55 50.0",
      "created_at": 1505972258000,
      "currency_id": 1,
      "currency_symbol": "$",
      "total_gross_amount": "50.55",
      "total_net_amount": "50.0",
      "base_gross_amount": "44.564375"
    },
    {
      "id": 2,
      "creator_name": "James Kennedy",
      "amount": "50.55",
      "status": "pending",
      "supplier_name": "John Doe",
      "keywords":
        "John Doe James Kennedy  pending 44.56  1100044 - Embajadores de marca Google en Retail Chromecast hello 50.55 50.0",
      "created_at": 1505972227000,
      "currency_id": 1,
      "currency_symbol": "$",
      "total_gross_amount": "50.55",
      "total_net_amount": "50.0",
      "base_gross_amount": "44.564375"
    }
  ],
  "meta": {
    "current_page": 1,
    "next_page": 2,
    "prev_page": null,
    "total_pages": 3,
    "total_count": 25
  }
}
```

Returns a list of purchase orders. The response of purchase orders are paginated,
so it will only return first 20 records as a response.

### Pagination

You can send `page` params to load other records e.g: `/api/v1/purchase_orders?page=2`.
You can also see `meta` key in the response you get, that will return informations
like `current_page`, `next_page`, `previous_page`, `total_pages`, and `total_count`
to help your write your own logic of pagination.

### Search

You can also search for your `Purchase Order` using `search` params example
`/api/v1/purchase_orders?search=your search keyword`. It will perform full-text
search and return result accordingly.

### HTTP Request

`GET https://app.rubberstamp.io/api/v1/purchase_orders?page=1&search=something`

### Query Parameters

| Params               | Type    | Description                                         |
| -------------------- | ------- | --------------------------------------------------- |
| authentication_token | header  | Authentication token                                |
| app_company_id       | header  | Company ID                                          |
| page                 | integer | Used for Loading records from specified page number |
| search               | string  | Used for searching Purchase Order by search keyword |

## Get Purchase Order details

```ruby
require 'rest-client'

RestClient.get(
  'https://app.rubberstamp.io/api/v1/purchase_orders/1',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/purchase_orders/1'
  -X GET
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
```

> The above command returns JSON structured like this:

```json
{
  "id": 284588,
  "company_id": 3,
  "approval_key": null,
  "department_id": 2996,
  "department_name": "400852",
  "supplier_id": 310511,
  "supplier_name": "deepak",
  "status": "pending",
  "creator_id": 1,
  "currency_id": 3,
  "creator_name": "James Kennedy",
  "amount": "50.55",
  "created_at": 1505972258,
  "updated_at": 1505972258,
  "notes": "Notes",
  "total_net_amount": "50.0",
  "total_gross_amount": "50.55",
  "base_gross_amount": "44.564375",
  "delivery_status": "not_delivered",
  "delivered_on": null,
  "custom_fields": null,
  "share_key": "HEFYPNLBYFMKROPXUTCMPGMQCOGROKOS20170921003738",
  "archived": false,
  "conversion_rate": "0.88159",
  "keywords":
    "deepak James Kennedy  pending 44.56  1100044 - Embajadores de marca Google en Retail Chromecast hello 50.55 50.0",
  "self_approved": false,
  "xero_id": null,
  "synced_with_xero": false,
  "can_cancel": true,
  "can_archive": false,
  "can_receive_item": true,
  "can_mark_as_paid": true,
  "purchase_order_items": [
    {
      "id": 507638,
      "description": "hello",
      "purchase_order_id": 284588,
      "budget_id": 40228,
      "budget_summary":
        "1100044 - Embajadores de marca Google en Retail Chromecast : F 9575 : TELEFONIA Y CELULARES",
      "gross_amount": "50.55",
      "vat": "1.1",
      "net_amount": "50.0",
      "status": "pending",
      "quantity": "1.0",
      "unit_price": "50.0",
      "item_number": null,
      "base_net_amount": "44.0795",
      "base_gross_amount": "44.564375",
      "gross_usd_amount": "50.55",
      "product_id": null,
      "received_quantity": 0.0,
      "custom_field_values": []
    }
  ],
  "budgets": [
    {
      "id": 40228,
      "company_id": 1591,
      "name": "1100044 - Embajadores de marca Google en Retail Chromecast",
      "amount": "19500.0",
      "cost_code": "F 9575",
      "cost_type": "TELEFONIA Y CELULARES",
      "archived": false,
      "currency_id": 100,
      "base_amount": "19500.0",
      "base_rate": "1.0",
      "allow_anyone_to_approve_a_po": false,
      "start_date": null,
      "end_date": null,
      "summary":
        "1100044 - Embajadores de marca Google en Retail Chromecast : F 9575 : TELEFONIA Y CELULARES"
    }
  ],
  "purchase_order_comments": [],
  "custom_field_values": [],
  "payments": [],
  "purchase_order_item_payments": [],
  "uploads": [],
  "approver_requests": [
    {
      "id": 1,
      "status": "pending",
      "approver_name": "Gillian Neary",
      "approver_id": 2,
      "accept_token": "17943-344853-20171017053411......",
      "reject_token": "17943-344853-20171017053411......"
    }
  ]
}
```

Retrieves the details of an existing purchase orders. you need to supply the
unique purchase order id, that was returned upon product creation.

PurchaseOrder's `status` will be `approved` if all of the approvers have already
approved this purchase order. You can find list of approvers in `approver_requests`
attribute.

### HTTP Request

`GET https://app.rubberstamp.io/api/v1/purchase_orders/:id`

### URL Parameters

| Params               | Type    | Description          |
| -------------------- | ------- | -------------------- |
| authentication_token | header  | Authentication token |
| app_company_id       | header  | Company ID           |
| ID                   | integer | Purchase Order ID    |

## New Purchase Order

```ruby
require 'rest-client'

RestClient.get(
  'https://app.rubberstamp.io/api/v1/purchase_orders/new',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/purchase_orders/new'
  -X GET
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
```

> The above command returns JSON structured like this:

```json
{
  "creator_id": 1,
  "amount": 0,
  "status": "draft",
  "supplier_name": null,
  "notes": null,
  "company_id": 1,
  "delivered_on": null,
  "currency_id": 1,
  "department_id": null,
  "supplier_id": null,
  "self_approved": false,
  "delivery_status": "not_delivered",
  "custom_field_values_attributes": [
    {
      "value": null,
      "custom_field_id": 1,
      "budget_id": null
    }
  ],
  "purchase_order_items_attributes": [
    {
      "description": null,
      "budget_id": null,
      "gross_amount": "0.0",
      "vat": "0.0",
      "net_amount": null,
      "status": "pending",
      "quantity": "1.0",
      "unit_price": null,
      "item_number": null,
      "base_net_amount": null,
      "base_gross_amount": null,
      "gross_usd_amount": null,
      "product_id": null,
      "received_quantity": null,
      "custom_field_values_attributes": [
        {
          "value": null,
          "custom_field_id": 2,
          "budget_id": null
        }
      ]
    }
  ]
}
```

Generate new object for Purchase Order and associated models and return
them in JSON format.

### HTTP Request

`GET https://app.rubberstamp.io/api/v1/purchase_orders/new`

### URL Parameters

| Params               | Type   | Description          |
| -------------------- | ------ | -------------------- |
| authentication_token | header | Authentication token |
| app_company_id       | header | Company ID           |

## Pending Requests

```ruby
require 'rest-client'

RestClient.get(
  'https://app.rubberstamp.io/api/v1/purchase_orders/pending_requests',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/purchase_orders/pending_requests'
  -X GET
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
```

> The above command returns JSON structured like this:

```json
{
  "purchase_orders": [
    {
      "id": 1,
      "creator_name": "James Kennedy",
      "amount": "50.55",
      "status": "pending",
      "supplier_name": "John Doe",
      "keywords":
        "John doe James Kennedy  pending 44.56  1100044 - Embajadores de marca Google en Retail Chromecast hello 50.55 50.0",
      "created_at": 1505972258000,
      "currency_id": 1,
      "currency_symbol": "$",
      "total_gross_amount": "50.55",
      "total_net_amount": "50.0",
      "base_gross_amount": "44.564375"
    },
    {
      "id": 2,
      "creator_name": "James Kennedy",
      "amount": "50.55",
      "status": "pending",
      "supplier_name": "John Doe",
      "keywords":
        "John Doe James Kennedy  pending 44.56  1100044 - Embajadores de marca Google en Retail Chromecast hello 50.55 50.0",
      "created_at": 1505972227000,
      "currency_id": 1,
      "currency_symbol": "$",
      "total_gross_amount": "50.55",
      "total_net_amount": "50.0",
      "base_gross_amount": "44.564375"
    }
  ],
  "meta": {
    "current_page": 1,
    "next_page": 2,
    "prev_page": null,
    "total_pages": 3,
    "total_count": 25
  }
}
```

Retrieves the list of Pending requests in Chronological Order
for current authentication_token.

### Sorting

You can sort requests by column with `asc` and `desc` directions.
Example if you want to sort requests in `asc` order by `created_at` column then:
`GET https://app.rubberstamp.io/api/v1/purchase_orders/pending_requests?sort=created_at&direction=asc`

### Pagination

You can send `page` params to load paginated records e.g: `/api/v1/purchase_orders?page=2`.
You can also see `meta` key in the response you get, that will return
informations like `current_page`, `next_page`, `previous_page`, `total_pages`,
and `total_count` to help your write your own logic of pagination.

### HTTP Request

`GET https://app.rubberstamp.io/api/v1/purchase_orders/pending_requests`

### URL Parameters

| params               | Type    | Description                                                 |
| -------------------- | ------- | ----------------------------------------------------------- |
| authentication_token | header  | Authentication token                                        |
| app_company_id       | header  | Company ID                                                  |
| sort                 | string  | sorting column name                                         |
| direction            | string  | sorting direction. values are: <br/> - `asc` <br/> - `desc` |
| page                 | integer | page number                                                 |

## Pending Requests Count

```ruby
require 'rest-client'

RestClient.get(
  'https://app.rubberstamp.io/api/v1/purchase_orders/pending_request_count',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/purchase_orders/pending_request_count'
  -X GET
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
```

> The above command returns JSON structured like this:

```json
{
  "total_pending_request": 2
}
```

Count total number of pending requests for current authentication_token.

### HTTP Request

`GET https://app.rubberstamp.io/api/v1/purchase_orders/pending_request_count`

### URL Parameters

| Params               | Type   | Description          |
| -------------------- | ------ | -------------------- |
| authentication_token | header | Authentication token |
| app_company_id       | header | Company ID           |

## Approve

```ruby
require 'rest-client'

RestClient.get(
  'https://app.rubberstamp.io/api/v1/purchase_orders/1/approve',
  {
    token: 'accept-token'
  },
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/purchase_orders/1/approve'
  -X GET
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "token=accept-token"
```

> The above command returns JSON structured like this:

```json
{
  "status": true
}
```

Approve purchase order. You must pass valid accept token to approve the Purchase
order.

### HTTP Request

`GET https://app.rubberstamp.io/api/v1/purchase_orders/:id/approve`

### URL Parameters

| Params               | Type   | Description             |
| -------------------- | ------ | ----------------------- |
| authentication_token | header | Authentication token    |
| app_company_id       | header | Company ID              |
| token                | string | Approver's accept token |

## Reject

```ruby
require 'rest-client'

RestClient.get(
  'https://app.rubberstamp.io/api/v1/purchase_orders/1/reject',
  {
    token: 'reject-token'
  },
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/purchase_orders/1/reject'
  -X GET
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "token=reject-token"
```

> The above command returns JSON structured like this:

```json
{
  "status": true
}
```

Reject purchase order. You must pass valid reject token to reject the Purchase
order.

### HTTP Request

`GET https://app.rubberstamp.io/api/v1/purchase_orders/:id/reject`

### URL Parameters

| Params               | Type   | Description             |
| -------------------- | ------ | ----------------------- |
| authentication_token | header | Authentication token    |
| app_company_id       | header | Company ID              |
| token                | string | Approver's reject token |

## Cancel

```ruby
require 'rest-client'

RestClient.post(
  'https://app.rubberstamp.io/api/v1/purchase_orders/1/cancel',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/purchase_orders/1/cancel'
  -X POST
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
```

> The above command returns JSON structured like this:

```json
{
  "status": true
}
```

Ability to Cancel purchase order. You can check if user can mark purchase order as
cancel or not by checking `can_cancel` value in [Purchase Order Details](/slate/#get-purchase-order-details) page

### HTTP Request

`POST https://app.rubberstamp.io/api/v1/purchase_orders/:id/cancel`

### URL Parameters

| Params               | Type   | Description          |
| -------------------- | ------ | -------------------- |
| authentication_token | header | Authentication token |
| app_company_id       | header | Company ID           |

## Archive

```ruby
require 'rest-client'

RestClient.post(
  'https://app.rubberstamp.io/api/v1/purchase_orders/1/archive',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/purchase_orders/1/archive'
  -X POST
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
```

> The above command returns JSON structured like this:

```json
{
  "status": true
}
```

Ability to Archive purchase order. You can check if current logged in user can archive
purchase or or not by checking `can_archive` value in [Purchase Order Details page](/slate/#get-purchase-order-details)

### HTTP Request

`POST https://app.rubberstamp.io/api/v1/purchase_orders/:id/archive`

### URL Parameters

| Params               | Type   | Description          |
| -------------------- | ------ | -------------------- |
| authentication_token | header | Authentication token |
| app_company_id       | header | Company ID           |

## Mark as Paid

To mark Purchase Order as paid you need to check out [Payments](/#create-a-payment)
API endpoint. Before marking purchase order as paid You might need to check whether
given user have enough permission to perform this action. You can find `can_mark_as_paid`
in [Purchase Order Details](/slate/#get-purchase-order-details)

## Receiving Items

```ruby
require 'rest-client'

RestClient.post(
  'https://app.rubberstamp.io/api/v1/purchase_orders/1/receiving_items',
  {
    purchase_order: {
      items: [
        { id: 1, quantity: 10 },
        { id: 2, quantity: 10 },
        { id: 3, quantity: 20 },
      ],
      notes: 'Item delivered successfully!',
      delivered_on: '2017-1-1'
    }
  }
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/purchase_orders/1/receiving_items'
  -X POST
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "purchase_order[items][0][id]=1"
  -d "purchase_order[items][0][quantity]=10"
  -d "purchase_order[items][1][id]=2"
  -d "purchase_order[items][1][quantity]=10"
  -d "purchase_order[items][2][id]=3"
  -d "purchase_order[items][2][quantity]=20"
  -d "purchase_order[delivered_on]=2017-1-1"
  -d "purchase_order[notes]=Item delivered successfully!"
```

> The above command returns JSON structured like this:

```json
{
  "status": true
}
```

You can find `can_receive_item` in [Purchase Order Details](/slate/#get-purchase-order-details)
page, This value should be true in order to allow user to receive items.

### HTTP Request

`POST https://app.rubberstamp.io/api/v1/purchase_orders/:id/receiving_items`

### URL Parameters

| Params               | Type    | Description                        |
| -------------------- | ------- | ---------------------------------- |
| authentication_token | header  | Authentication token               |
| app_company_id       | header  | Company ID                         |
| notes                | string  | comment/notes                      |
| delivered_on         | string  | value must be in valid date format |
| items[][id]          | array[] | list of item ids                   |
| items[][quantity]    | array[] | list of item quantities            |

## Cancel Receiving Items

```ruby
require 'rest-client'

RestClient.post(
  'https://app.rubberstamp.io/api/v1/purchase_orders/1/cancel_receiving_items',
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.rubberstamp.io/api/v1/purchase_orders/1/cancel_receiving_items'
  -X POST
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
```

> The above command returns JSON structured like this:

```json
{
  "status": true
}
```

You can find `can_receive_item` in [Purchase Order Details](/slate/#get-purchase-order-details)
page, the users who are able to receive items can also cancel them. so please make sure this property is set to `true`.

### HTTP Request

`POST https://app.rubberstamp.io/api/v1/purchase_orders/:id/cancel_receiving_items`

### URL Parameters

| Params               | Type   | Description          |
| -------------------- | ------ | -------------------- |
| authentication_token | header | Authentication token |
| app_company_id       | header | Company ID           |
