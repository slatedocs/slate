# Payments

## Create a Payment

```ruby
require 'rest-client'

RestClient.post(
  'https://app.procurmentexpress.com/api/v1/purchase_orders/1/payments',
  {
    payment: {
      notes: "payment notes",
      purchase_order_item_payments_attributes: [
        {
          purchase_order_item_id: 1,
          amount: 10.00
        },
        {
          purchase_order_item_id: 2,
          amount: 20.00
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
curl 'https://app.procurmentexpress.com/api/v1/purchase_orders/1/payments'
  -X POST
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "payment[notes]=payment notes"
  -d "payment[purchase_order_item_payments_attributes][0][purchase_order_item_id]=1"
  -d "payment[purchase_order_item_payments_attributes][0][amount]=10.00"
  -d "payment[purchase_order_item_payments_attributes][1][purchase_order_item_id]=2"
  -d "payment[purchase_order_item_payments_attributes][1][amount]=20.00"
```

> The above command returns JSON structured like this:

```json
{
  success: true
}
```

Use this api endpoint to mark purchase order as paid. To check if authentication_token
have enough permission to mark purchase order as paid or not, you need to first check
`can_mark_po_as_paid` in the [Purchase Order Detail](/slate/#get-purchase-order-details) endpoint.

### HTTP Request

`POST https://app.procurmentexpress.com/api/v1/purchase_orders/:purchase_order_id/payments`

### Query Parameters

| Params                                                                   | Type    | Description                        |
| -----                                                                    | -----   | -----                              |
| authentication_token                                                     | header  | Authentication token               |
| app_company_id                                                           | header  | Company ID                         |
| payment[note]                                                            | string  | your notes/comment on this payment |
| payment[purchase_order_item_payments_attributes][][purchase_order_item_id] | integer | Purchase Order Item ID             |
| payment[purchase_order_item_payments_attributes][][amount]                 | double  | Purchase order Item amount         |

