# Comments

## Add new comment for PO

```ruby
require 'rest-client'

RestClient.post(
  'https://app.procurementexpress.com/api/v1/purchase_orders/1/comments',
  { comment: 'my first PO' },
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/purchase_orders/1/comments'
  -X POST
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "comment=my first PO"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "comment": "my first PO",
  "creator_id": 1,
  "creator_name": "John Doe",
  "purchase_order_id": 1,
  "status": "active",
  "created_at": 1505796377,
  "uploads": []
}
```

Create a new `Comment` for provided `Purchase Order` and returns the object that
is created.

### HTTP Request

`POST
https://app.procurementexpress.com/api/v1/purchase_order/:purchase_order_id/comments`

### Query Parameters

| Params               | Type    | Description                             |
| -----                | -----   | ---------                               |
| authentication_token | header  | Authentication token                    |
| app_company_id       | header  | Registered company id                   |
| purchase_order_id    | integer | Purchase order id                       |
| comment              | string  | `Required` - Comment for purchase order |

