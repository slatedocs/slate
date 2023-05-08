# Invoices

<-- =============== LIST =============== -->
## List Invoices

```ruby
RestClient.get(
  'https://app.procurementexpress.com/api/v1/invoices',
  headers = {
    app_company_id: 1,
    authentication_token: 'your token'
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/invoices'
  -X GET
  -H "Content-Type: application/json"
  -H "app_company_id: 1"
  -H "authentication_token: your token"
```
> The above command returns JSON structured like this:

```json
{
  "invoices": [{
    "id": 1,
    "invoice_number": 'Invoice 1',
    "status": 'ready_to_pay',
    "issue_date": 1683522000,
    "validation_date": 1683522000,
    "uploaded_date": 1683522000,
    "due_date": 1683522000,
    "tax_amount": 150.0,
    "net_amount": 1000.0,
    "gross_amount": 1150.0,
    "balance_amount": 1150.0,
    "supplier_id": 1,
    "supplier_name": 'Supplier Name',
    "purchase_order_references": [{
      '1-1970-01-01'
    }],
    "can_approve": false,
    "can_reject": false,
    "can_cancel": true,
    "can_archive": true,
    "can_dearchive": false,
    "currency": {
      "id": 162,
      "iso_code": 'ZAR',
      "iso_numeric": 710,
      "name": 'South African Rand',
      "symbol": 'R',
      "created_at": '2015-01-01T04:21:56.144-06:00',
      "updated_at": '2023-05-08T03:02:08.904-05:00'
    }
  }],
  "meta": {
    "current_page": 1,
    "next_page": null,
    "prev_page": null,
    "total_pages": 1,
    "total_count": 49
  }
}

```

List all invoices for the Company indicated by `app_company_id`.

### Pagination
The Invoice list returned is paginated with 100 records per page. You can find details on the current page and total number of pages under the `meta` attributes in the JSON repsonse. You can enter additioal pages by passing the `page` argument as follows: `https://app.procurementexpress.com/api/v1/purchase_orders?page=2`

### Filtering
A variety of filters can be applied to the list by adding additional parameters, e.g. `archived`, like follows: `https://app.procurementexpress.com/api/v1/purchase_orders?archived=false`

Please see the `Query Parameters` for a complete list of potential filter arguments.

### HTTP Request
`GET /api/v1/invoices`

### Query Parameters

| Params | Type | Options | Description |
| ------ | ---- | ------- | ----------- |
| app_company_id | header | | Company ID number |
| authentication_token | header | | Authentication Token |
| archived | boolean | `true` or `false` | Whether the Invoice(s) are archived or not |
| requester_id | number |  | The ID Number of the user thgat requested the Invoice(s) |
| approver_id | number |  | The ID Number of the user that approved the Invoice(s) |
| supplier_id | number |  | The ID Number of the supplier the Invoice(s) are associated with |
| invoice_date_filter | string | 'last 7days' | The date-range filter for the updated date with which to filter the Invoice(s) by |
| page | number |  | The page number for which results are returned (see `Pagination`)

## Inspect an Invoice

```ruby
RestClient.post(
  'https://app.procurementexpress.com/api/v1/invoices',
  headers = {
    app_company_id: 1,
    authentication_token: 'your token'
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/purchase_orders'
  -X POST
  -H "Content-Type: application/json"
  -H "app_company_id: 1"
  -H "authentication_token: your token"
```
> The above command returns JSON structured like this:

```json

```

This endpoint gives acces to detailed information about a specific Invoice.

### HTTP Request
`GET /api/v1/invoices`

### Query Parameters

| Params | Type | Options | Description |
| --- | --- | --- | --- | --- |
| app_company_id | header | | Company ID number |
| authentication_token | header | | Authentication Token |
| 

<-- =============== CREATE =============== -->
## Create an Invoice

```ruby
RestClient.post(
  'https://app.procurementexpress.com/api/v1/invoices',
  {
    "invoice_number": null,
    "issue_date": null,
    "validation_date": null,
    "supplier_id": null,
    "uploaded_date": null,
    "received_date": null,
    "due_date": null,
    "gross_amount": null,
    "currency_id": null,
    "invoice_line_items_attributes": [{
      "id": null,
      "sequence_no": null,
      "description": null,
      "unit_price": null,
      "quantity": null,
      "vat": null,
      "net_amount": null,
      "base_net_amount": null,
      "tax_rate_id": null,
      "chart_of_account_id": null,
      "purchase_order_id": null,
      "purchase_order_item_id": null,
      "billable_status": null,
      "_destroy": null,
      "custom_field_values_attributes": [{
        "id": null,
        "value": null,
        "custom_field_id": null
      }]
    }],
    "supplier_invoice_uploads_attributes": [{
      "id": null,
      "file": null,
      "_destroy": null
    }]
  },
  headers = {
    app_company_id: 1,
    authentication_token: 'your token'
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/invoices'
  -X POST
  -H "Content-Type: application/json"
  -H "app_company_id: 1"
  -H "authentication_token: your token"
  -d "
```
> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "invoice_number": "inv-001",
  "status": "outstanding",
  "issue_date": 1681880400,
  "validation_date": null,
  "uploaded_date": 1681880400,
  "due_date": 1681966800,
  "tax_amount": "0.0",
  "net_amount": "0.0",
  "gross_amount": "20.0",
  "balance_amount": "0.0",
  "created_at": 1681894799,
  "updated_at": 1681894799,
  "currency": {
    "id": 1000,
    "iso_code": "EUR",
    "iso_numeric": "978",
    "name": "Euro",
    "symbol": "€",
    "created_at": "2023-04-19T03:59:57.085-05:00",
    "updated_at": "2023-04-19T03:59:57.367-05:00"
  },
  "supplier": {
    "id": 45,
    "name": "Apple",
    "company_id": 20000,
    "notes": null,
    "phone_number": null,
    "address": null,
    "email": null,
    "payment_details": null,
    "archived": false,
    "contact_person": null,
    "tax_number": null,
    "created_at": "2023-04-19T03:59:57.581-05:00",
    "updated_at": "2023-04-19T03:59:58.820-05:00",
    "currency_id": null,
    "department_ids": [],
    "third_party_id_mappings": [],
    "external_vendor_id": null
  },
  "invoice_line_items": [{
    "id": 9,
    "sequence_no": 1,
    "description": "Advertising",
    "unit_price": "100.0",
    "quantity": "10.0",
    "vat": "5.0",
    "net_amount": "1000.0",
    "base_net_amount": "1000.0",
    "deleted_at": null,
    "billable_status": null,
    "tax_rate_id": null,
    "chart_of_account_id": null,
    "invoice_id": 7,
    "purchase_order_id": 30000,
    "purchase_order_item_id": 90,
    "markup_info": null,
    "created_at": 1681894800,
    "updated_at": 1681894800
  }],
  "purchase_orders": [{
    "id": 30000,
    "approval_key": null,
    "creator_name": "Team Member",
    "amount": "1600.0",
    "status": "pending",
    "supplier_name": "Apple",
    "keywords": "30000 Apple Team Member  pending 1680.00   iPhone 840.0 800.0   iPhone 840.0 800.0",
    "created_at": 1681894796000,
    "currency_id": 1000,
    "currency_symbol": "€",
    "currency_iso_code": "EUR",
    "total_gross_amount": "1680.0",
    "total_net_amount": "1600.0",
    "base_gross_amount": 1680.0,
    "submitted_on": 1681894798000,
    "share_key": "GCFJSAFMLFVGXFBSFIPQXFUEHHMKXQQN20230419035958",
    "department_id": null,
    "department_name": null
  }],
  "supplier_invoice_uploads": [{
    "id": 7,
    "file_file_name": "test.pdf",
    "file_content_type": "application/pdf",
    "file_file_size": 13264,
    "url": "https://po-app-staging.s3.amazonaws.com/supplier_invoice_uploads/files/000/000/007/original/test.pdf?1681894799"
  }],
  "histories": [],
  "comments": []
}

```

Create a new Invoice for the Company ID mentioned in the header.

### HTTP Request
`GET /api/v1/invoices/create`

### Query Parameters

| Params | Type | Options | Description |
| ------ | ---- | ------- | ----------- |
| app_company_id | header | | Company ID number |
| authentication_token | header | | Authentication Token |
| action | string | | The name of the action that processes the request |
| gross_amount | string | | Gross amount of the invoice |
| due_date | string | | Due date of the invoice |
| uploaded_date | string | | Date on which the invoice was uploaded |
| issue_date | string | | Date on which the invoice was issued |
| received_date | string | | Date on which the invoice was received |
| currency_id | string | | ID of the currency used for the invoice |
| company_id | string | | ID of the company that issued the invoice |
| invoice_number | string | | Unique identifier for the invoice |
| supplier_id | string | | ID of the supplier that the invoice is being issued to |
| invoice_line_items_attributes | array | | An array of invoice line items that belongs to the invoice |
| invoice_line_items_attributes.sequence_no | string | | Sequence number of the invoice line item |
| invoice_line_items_attributes.description | string | | Description of the invoice line item |
| invoice_line_items_attributes.unit_price | string | | Price per unit of the invoice line item |
| invoice_line_items_attributes.quantity | string | | Quantity of the invoice line item |
| invoice_line_items_attributes.vat | string | | VAT of the invoice line item |
| invoice_line_items_attributes.net_amount | string | | Net amount of the invoice line item |
| invoice_line_items_attributes.purchase_order_id | string || ID of the purchase order associated with the invoice line item |
| invoice_line_items_attributes.purchase_order_item_id | string | | ID of the purchase order item associated with the invoice line item |
| supplier_invoice_uploads_attributes | array| | An array of invoice uploads that belong to the supplier |
| supplier_invoice_uploads_attributes.file | string | | The uploaded invoice file |

<-- =============== UPDATE =============== -->
## Update an Invoice

## Create a Comment

```ruby
RestClient.post(
  'https://app.procurementexpress.com/api/v1/invoices',
  {
    comment: 'write a comment'
  }
  headers = {
    app_company_id: 1,
    authentication_token: 'your token'
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/purchase_orders'
  -X POST
  -H "Content-Type: application/json"
  -H "app_company_id: 1"
  -H "authentication_token: your token"
  -d "comment: write a comment"
```
> The above command returns JSON structured like this:

```json
{
  "id": 21,
  "comment": "new comment",
  "invoice_id": 296,
  "creator_id": 41000,
  "creator_name": "Team Member",
  "created_at": 1681988035,
  "updated_at": 1681988035,
  "comment_formatted_time": "05:53",
  "comment_formatted_date": "2023-04-20",
  "formatted_comment": "<p>new comment</p>"
}
```

Leave a comment on an Invoice.

### HTTP Request
`POST /api/v1/invoices/:id/create_comment`

### Query Parameters

| Params | Type | Options | Description |
| --- | --- | --- | --- | --- |
| app_company_id | header | | Company ID number |
| authentication_token | header | | Authentication Token |
| comment | string | | Text to be added as a comment |

## Approve an Invoice
```ruby
RestClient.put(
  'https://app.procurementexpress.com/api/v1/1/invoices/approve',
  headers = {
    app_company_id: 1,
    authentication_token: 'your token'
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/1/invoices/approve'
  -X PUT
  -H "Content-Type: application/json"
  -H "app_company_id: 1"
  -H "authentication_token: your token"
```
> The above command returns JSON structured like this:

```json
{
  "success": true
}
```

Approve an Invoice in the `Pending` status.

### HTTP Request
`PUT /api/v1/invoices/:id/approve`

### Query Parameters

| Params | Type | Options | Description |
| --- | --- | --- | --- | --- |
| app_company_id | header | | Company ID number |
| authentication_token | header | | Authentication Token |

## Reject an Invoice

```ruby
RestClient.put(
  'https://app.procurementexpress.com/api/v1/invoices/1/reject',
  headers = {
    app_company_id: 1,
    authentication_token: 'your token'
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/invoices/1/reject'
  -X PUT
  -H "Content-Type: application/json"
  -H "app_company_id: 1"
  -H "authentication_token: your token"
```
> The above command returns JSON structured like this:

```json
{
  "success": true
}
```

Reject an Invoice in the `Pending` status.

### HTTP Request
`PUT /api/v1/invoices/:id/reject`

### Query Parameters

| Params | Type | Options | Description |
| --- | --- | --- | --- | --- |
| app_company_id | header | | Company ID number |
| authentication_token | header | | Authentication Token |

## Cancel an Invoice

```ruby
RestClient.put(
  'https://app.procurementexpress.com/api/v1/invoices/1/cancel',
  headers = {
    app_company_id: 1,
    authentication_token: 'your token'
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/purchase_orders/1/cancel'
  -X PUT
  -H "Content-Type: application/json"
  -H "app_company_id: 1"
  -H "authentication_token: your token"
```
> The above command returns JSON structured like this:

```json
{
  success: true
}
```

Cancel an existing Invoice.

### HTTP Request
`PUT /api/v1/invoices/:id/cancel`

### Query Parameters

| Params | Type | Options | Description |
| --- | --- | --- | --- | --- |
| app_company_id | header | | Company ID number |
| authentication_token | header | | Authentication Token |

## Archive an Invoice

```ruby
RestClient.put(
  'https://app.procurementexpress.com/api/v1/invoices/1/archive',
  headers = {
    app_company_id: 1,
    authentication_token: 'your token'
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/purchase_orders/1/archive'
  -X PUT
  -H "Content-Type: application/json"
  -H "app_company_id: 1"
  -H "authentication_token: your token"
```
> The above command returns JSON structured like this:

```json
{
  success: true
}
```

Archive an existing Invoice.

### HTTP Request
`PUT /api/v1/invoices/:id/archive`

### Query Parameters

| Params | Type | Options | Description |
| --- | --- | --- | --- | --- |
| app_company_id | header | | Company ID number |
| authentication_token | header | | Authentication Token |

## Dearchive an Invoice

```ruby
RestClient.put(
  'https://app.procurementexpress.com/api/v1/invoices/1/dearchive',
  headers = {
    app_company_id: 1,
    authentication_token: 'your token'
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/purchase_orders/1/dearchive'
  -X PUT
  -H "Content-Type: application/json"
  -H "app_company_id: 1"
  -H "authentication_token: your token"
```
> The above command returns JSON structured like this:

```json
{
  success: true
}
```

Dearchive an archived Invoice.

### HTTP Request
`PUT /api/v1/invoices/:id/dearchive`

### Query Parameters

| Params | Type | Options | Description |
| --- | --- | --- | --- | --- |
| app_company_id | header | | Company ID number |
| authentication_token | header | | Authentication Token |
