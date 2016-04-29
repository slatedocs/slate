# Customer Addresses

Postal address belonging to a Customer

|||
|---|---|
| **Managed by** | [Customer Addresses Resource](/api/stores/v2/customers/addresses)

## Customer Addresss Object - Properties

| Name | Type | Description |
| --- | --- | --- |
| id | int |
| customer_id | int |
| first_name | string | The customer address first name. |
| last_name | string | The customer address last name. |
| company | string | The customer address company name. |
| street_1 | string | The customer street address line 1. |
| street_2 | string | The customer street address line 2. |
| city | string | The customer address city/suburb. |
| state | string | The customer address state/province. Do not abbreviate the state; spell out the entire word, e.g.: California. (Cannot be null. As a workaround for addresses that include no state/province string, pass a space as the "state" value.) |
| zip | string | The customer address zip/postcode. |
| country | string | The customer address country. Must be the full country name. |
| country_iso2 | string |
| phone | string | The customer address phone number. |
| address_type | enum |
