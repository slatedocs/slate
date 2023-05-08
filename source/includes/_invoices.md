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

<-- =============== CREATE =============== -->
## Create an Invoice
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

<-- =============== UPDATE =============== -->
## Update and Invoice

<-- =============== ARTICLE =============== -->
## Article

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

Description

### Pagination
The Invoice list returned is paginated with 10 records per page.

### HTTP Request
`GET /api/v1/invoices`

### Query Parameters

| Params | Type | Options | Description |
| --- | --- | --- | --- | --- |
| app_company_id | header | | Company ID number |
| authentication_token | header | | Authentication Token |
| 

