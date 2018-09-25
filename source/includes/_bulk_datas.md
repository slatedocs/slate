# Bulk Datas

## List All Bulk Datas

```ruby
require 'rest-client'

RestClient.get(
  'https://app.procurementexpress.com/api/v1/bulk_datas',
  {
    created_at: "2018-8-10T09:17:58.097-05:00"
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
  -d "created_at=2018-8-10T09:17:58.097-05:00"
```

> The above command returns JSON structured like this:

```json
{
  "departments": [],
  "budgets": [],
  "tax_rates": [],
  "suppliers": [],
  "products": []
}
```

List all `departments`, `budgets`, `tax_rates`, `suppliers`, `products`, etc from same api endpoint. If you pass `created_at` query params, then it will filter all data after that given created at for given company. If `created_at` is missing then it will return all data for given company.

### HTTP Request

`GET https://app.procurementexpress.com/api/v1/bulk_datas`

### Query Parameters

| Param                | Type     | Description                        |
| -------------------- | -------- | ---------------------------------- |
| authentication_token | header   | Authentication token               |
| app_company_id       | header   | registered company id              |
| created_at           | DateTime | created_at datetime for the record |

<aside class="info">
NOTE - You will get <strong>created_at</strong> value from the json response for each object, so make sure you store it somewhere to re use it in future.
</aside>
