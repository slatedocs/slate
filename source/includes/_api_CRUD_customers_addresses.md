## Postal addresses belonging to a customer.
|||
|---|---|
| **Manages** |
| **OAuth Scopes** | `store_v2_customers`
||`store_v2_customers_read_only`


## Operations

*   [List Customer Addresses](#list-customer-addresses)
*   [Get a Customer Address](#get-a-customer-address)
*   [Get a Count of Customer Addresses](#get-a-count-of-customer-addresses)
*   [Create a Customer Address](#create-a-customer-address)
*   [Update a Customer Address](#update-a-customer-address)
*   [Delete a Customer Address](#delete-a-customer-address)
*   [Delete Multiple Customer Addresses](#delete-multiple-customer-addresses)

## List Customer Addresses

Gets the addresses belonging to a customer. (Default sorting is by address id, from lowest to highest.)

*   [OAuth](#list-customer-addresses-oauth)
>`GET /stores/{store_hash}/v2/customers/{customer_id}/addresses`<
*   [Basic Auth](#list-customer-addresses-basic)
>`GET /api/v2/customers/{customer_id}/addresses`

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 customer_addresses are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/customers/{customer_id}/addresses?page={number}` |
| `Limit` | int | `/api/v2/customers/{customer_id}/addresses?limit={count}` |

```json
[
  {
    "id": 1,
    "customer_id": 10,
    "first_name": "Trisha",
    "last_name": "McLaughlin",
    "company": "",
    "street_1": "12345 W Anderson Ln",
    "street_2": "",
    "city": "Austin",
    "state": "Texas",
    "zip": "78757",
    "country": "United States",
    "country_iso2": "US",
    "phone": ""
  }
]
```

## Get a Customer Address

Gets a customer address.

*   [OAuth](#get-a-customer-address-oauth)
>`GET /stores/{store_hash}/v2/customers/{customer_id}/addresses/{id}`
*   [Basic Auth](#get-a-customer-address-basic)
>`GET /api/v2/customers/{customer_id}/addresses/{id}`
</div>

```json
{
  "id": 1,
  "customer_id": 10,
  "first_name": "Trisha",
  "last_name": "McLaughlin",
  "company": "",
  "street_1": "12345 W Anderson Ln",
  "street_2": "",
  "city": "Austin",
  "state": "Texas",
  "zip": "78757",
  "country": "United States",
  "country_iso2": "US",
  "phone": ""
}
```

## Get a Count of Customer Addresses

Gets a count of customer addresses.

*   [OAuth](#get-a-count-of-customer-addresses-oauth)
>`GET /stores/{store_hash}/v2/customers/{customer_id}/addresses/count`
*   [Basic Auth](#get-a-count-of-customer-addresses-basic)
>`GET /api/v2/customers/{customer_id}/addresses/count`
</div>

```json
{
  "count": 4
}
```

## Create a Customer Address

Creates a new customer address. (Note: The "state" property cannot be null. As a workaround for addresses that include no state/province string, pass a space as the "state" value.)

*   [OAuth](#create-a-customer-address-oauth)
>`POST /stores/{store_hash}/v2/customers/{customer_id}/addresses`
*   [Basic Auth](#create-a-customer-address-basic)
>`POST /api/v2/customers/{customer_id}/addresses`


### Read-only Properties

The following properties of the customer address are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `country_iso2`

### Requirements

The following properties of the customer address are required. The request won’t be fulfilled unless these properties are valid.

*   `first_name`
*   `last_name`
*   `phone`
*   `street_1`
*   `city`
*   `state`
*   `zip`
*   `country`

```curl
{
  "first_name": "Trisha",
  "last_name": "McLaughlin",
  "company": "",
  "street_1": "12345 W Anderson Ln",
  "street_2": "",
  "city": "Austin",
  "state": "Texas",
  "zip": "78757",
  "country": "United States",
  "phone": "512-123-4567"
}
```

```json
{
  "id": 1,
  "customer_id": 1,
  "first_name": "Trisha",
  "last_name": "McLaughlin",
  "company": "",
  "street_1": "12345 W Anderson Ln",
  "street_2": "",
  "city": "Austin",
  "state": "Texas",
  "zip": "78757",
  "country": "United States",
  "country_iso2": "US",
  "phone": ""
}
```

## Update a Customer Address

Updates an existing customer address.

*   [OAuth](#update-a-customer-address-oauth)
>`PUT /stores/{store_hash}/v2/customers/{customer_id}/addresses/{id}`
*   [Basic Auth](#update-a-customer-address-basic)
`PUT /api/v2/customers/{customer_id}/addresses/{id}`

### Read-only Properties

The following properties of the customer address are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `country_iso2`

### Requirements

The following properties of the customer address are required. The request won’t be fulfilled unless these properties are valid.

```curl
{
  "first_name": "Trisha",
  "last_name": "McLaughlin",
  "company": "",
  "street_1": "12345 W Anderson Ln",
  "street_2": "",
  "city": "Austin",
  "state": "Texas",
  "zip": "78757",
  "country": "United States",
  "phone": ""
}
```

```json
{
  "id": 1,
  "customer_id": 1,
  "first_name": "Trisha",
  "last_name": "McLaughlin",
  "company": "",
  "street_1": "12345 W Anderson Ln",
  "street_2": "",
  "city": "Austin",
  "state": "Texas",
  "zip": "78757",
  "country": "United States",
  "country_iso2": "US",
  "phone": ""
}
```
## Delete a Customer Address

Deletes a customer address.


*   [OAuth](#delete-a-customer-address-oauth)
>`DELETE /stores/{store_hash}/v2/customers/{customer_id}/addresses/{id}`
*   [Basic Auth](#delete-a-customer-address-basic)
>`DELETE /api/v2/customers/{customer_id}/addresses/{id}`

## Delete Multiple Customer Addresses

Deletes multiple customer addresses.

*   [OAuth](#delete-multiple-customer-addresses-oauth)
>`DELETE /stores/{store_hash}/v2/customers/{customer_id}/addresses`
*   [Basic Auth](#delete-multiple-customer-addresses-basic)
>`DELETE /api/v2/customers/{customer_id}/addresses`

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 customer_addresses are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/customers/{customer_id}/addresses?page={number}` |
| `Limit` | int | `/api/v2/customers/{customer_id}/addresses?limit={count}` |
