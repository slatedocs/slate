# Custom field values

## Create or Update custom field value

```ruby
require 'rest-client'

RestClient.post(
  'https://app.procurementexpress.com/api/v1/custom_field_values',
  {
    custom_field_value: {
      id: 1,
      purchase_order_id: 10,
      custom_field_id: 2,
      value: 'value'
    }
  },
  headers = {
    authentication_token: 'your token',
    app_company_id: 1
  }
)
```

```shell
curl 'https://app.procurementexpress.com/api/v1/custom_field_values'
  -X POST
  -H "Content-Type: application/json"
  -H "authentication_token: your token"
  -H "app_company_id: 1"
  -d "custom_field_value[id]=1"
  -d "custom_field_value[purchase_order_id]=10"
  -d "custom_field_value[custom_field_id]=2"
  -d "custom_field_value[value]=value"
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "purchase_order_id": 10,
  "value": "value",
  "custom_field_id": 2,
  "purchase_order_item_id": null,
  "date_format": null,
  "budget_id": null
}
```

### How to create new custom field value

In above request if you don't pass `id` attribute, then it will create new custom field value

### How to update existing custom field value

If you want to update existing custom field value, then you need to pass `id` for that custom field value.

### How to create/update custom field value for purchase order

To create/update custom field value for purchase order, you need to pass valid `purchase_order_id` in the POST request.
Also note that, you must pass the `custom_field_id` that is used for purchase order.

### How to create/update custom field value for purchase order item

To create/update custom field value for purchase order item, you need to pass valid `purchase_order_item_id` in the POST request.
Also note that, you must pass the `custom_field_id` that is used for purchase order items.

### HTTP Request

`POST https://app.procurementexpress.com/api/v1/custom_field_values`

### Query Parameters

| Params               | Type    | required | Description                      |
| -------------------- | ------- | -------- | -------------------------------- |
| authentication_token | header  | required | Authentication token             |
| app_company_id       | header  | required | Company ID                       |
| custom_field_value[id] | integer  | Optional | pass id if you want to update record |
| custom_field_value[custom_field_id]         | integer  | required | custom field id |
| custom_field_value[purchase_order_id]  | integer | optional | purchase order id, if blank, `purchase_order_item_id` must not be blank |
| custom_field_value[purchase_order_item_id] | integer | optional | line item id, if blank, `purchase_order_id` must not be blank |
| custom_field_value[value] | string | optional | Custom field value |
