|||
|---|---|
|**Managed by** |[Order Messages Resource](/api/stores/v2/orders/messages)

## Properties

| Name | Type | Description |
| --- | --- | --- |
| `id` | `int` |
| `order_id` | `int` |
| `staff_id` | `int` |
| `customer_id` | `int` |
| `type` | `enum` |
| `subject` | `string` |
| `message` | `text` |
| `status` | `enum` |
| `is_flagged` | `boolean` |
| `date_created` | `date` |
| `customer` | `resource` |