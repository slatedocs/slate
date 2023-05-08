# Invoices

## List Invoices

```ruby
RestClient.post(
  'https://app.procurementexpress.com/api/v1/purchase_orders',
  {
  },
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

## Filter Invoices


## Search for an Invoice


## Create an Invoice


## Update and Invoice


## 

