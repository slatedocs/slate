# Gift Certificates

Gift certificates available to offer to a store's customers.

|||
|---|---|
| Managed by | [Gift Certificate Resource](/api/stores/v2/gift_certificate)|

## Properties

| Name | Type | Description |
|---|---|---|
| id | int | The ID of the gift certificate. Read-only. |
| code | string | A unique string that the customer can input to redeem the gift certificate. If this field is not set, a value will be generated. | 
| amount | decimal | Value of the gift certificate. Required field. |
| status | enum | The gift certificate’s status. Affects the customer’s ability to apply the code to orders: Values can be ‘pending’, ’active’, ’disabled’, or ’expired’. |
| balance | decimal | Remaining value of the gift certificate. If not set, will default to the `amount`. |
| message | string | Text that will be sent to the recipient, such as ‘Congratulations’. |
| to_name | string | Name of the recipient. Required field. |
| order_id | int | The ID of the order. Read-only. |
| template | string | The email theme to use in the message sent to the recipient. |
| to_email | string | Email of the recipient. Required field. |
| from_name | string | Name of the customer who purchased the gift certificate. Required field. |
| from_email | string | Email of the customer who purchased the gift certificate. Required field. |
| customer_id | int | The ID of the customer placing the order. |
| expiry_date | date | Date on which the gift certificate is set to expire. |
| purchase_date | date | Date the gift certificate was purchased. If not assigned, this will be set to today’s date. |
