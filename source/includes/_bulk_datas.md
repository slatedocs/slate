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
  "phone_number": "...",
  "setup_incomplete": false,
  "employer_id": 6008,
  "authentication_token": "...",
  "approval_limit": 10000,
  "synced_at": "2018-10-02T03:07:36.465-05:00",
  "companies": [
    {
      "id": 6008,
      "name": "android test",
      "employees_count": 5,
      "default_tax_rate": 45.3266,
      "prepaid_subscription": false,
      "multicompany_pack": false,
      "company_setting": {},
      "supported_currencies": [],
      "custom_fields": [],
      "supported_currencies": [],
      "departments": [],
      "budgets": [],
      "tax_rates": [],
      "suppliers": [],
      "products": [],
      "approvers": []
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
