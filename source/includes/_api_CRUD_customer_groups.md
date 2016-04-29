## Groups of customers who share the same level of access and discounts at a store.

|||
|--|--|
| **Manages** |
| **OAuth Scopes** | `store_v2_customers`
||`store_v2_customers_read_only`


## Operations

*   [List Customer Groups](#list-customer-groups)
*   [Get a Customer Group](#get-a-customer-group)
*   [Get a Count of Customer Groups](#get-a-count-of-customer-groups)
*   [Create a Customer Group](#create-a-customer-group)
*   [Update a Customer Group](#update-a-customer-group)
*   [Delete a Customer Group](#delete-a-customer-group)
*   [Delete All Customer Groups](#delete-all-customer-groups)

## List Customer Groups

Gets the collection of customer groups. (Default sorting is by customer-group id, from lowest to highest.)

*   [OAuth](#list-customer-groups-oauth)
>`GET /stores/{store_hash}/v2/customer_groups`
*   [Basic Auth](#list-customer-groups-basic)
>`GET /api/v2/customer_groups`

### Filters

Filter parameters can be added to the URL query string to select specific customer_groups in the collection.

| Parameter | Type | Example |
| --- | --- | --- |
| `name` | string | `/api/v2/customer_groups?name={value}` |
| `is_default` | boolean | `/api/v2/customer_groups?is_default={value}` |

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 customer_groups are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/customer_groups?page={number}` |
| `Limit` | int | `/api/v2/customer_groups?limit={count}` |

```json
[
  {
    "id": 1,
    "name": "Retail Customers",
    "is_default": true,
    "category_access": {
      "type": "all"
    },
    "discount_rules": [

    ]
  },
  {
    "id": 2,
    "name": "Wholesale Customers",
    "is_default": false,
    "category_access": {
      "type": "all"
    },
    "discount_rules": [

    ]
  }
]
```
## Get a Customer Group

Gets a customer group.

*   [OAuth](#get-a-customer-group-oauth)
>`GET /stores/{store_hash}/v2/customer_groups/{id}`
*   [Basic Auth](#get-a-customer-group-basic)
>`GET /api/v2/customer_groups/{id}`

```json
{
  "id": 3,
  "name": "Student Discounts",
  "is_default": true,
  "category_access": {
    "type": "all"
  },
  "discount_rules": [
    {
      "type": "percent",
      "method": true,
      "amount": "5.0000"
    }
  ]
}
```

## Get a Count of Customer Groups

Gets a count of customer groups.

*   [OAuth](#get-a-count-of-customer-groups-oauth)
>`GET /stores/{store_hash}/v2/customer_groups/count`
*   [Basic Auth](#get-a-count-of-customer-groups-basic)
>`GET /api/v2/customer_groups/count`

```json
{
  "count": 3
}
```

## Create a Customer Group

Creates a new customer group.

*   [OAuth](#create-a-customer-group-oauth)
>`POST /stores/{store_hash}/v2/customer_groups`
*   [Basic Auth](#create-a-customer-group-basic)
>`POST /api/v2/customer_groups`

### Read-only Properties

The following properties of the customer group are read-only. If one or more of these properties are included in the request, it will be rejected.

### Requirements

The following properties of the customer group are required. The request won’t be fulfilled unless these properties are valid.

*   `name`

### Notes

A minimal request requires only the customer group name:
```curl
{
    "name": "Wholesale Customers"
}
```

To assign all new customers to the group by default, set **is default** to true:

```curl
{
    "name": "Retail Customers",
    "is_default": true
}
```

To restrict customers in the group to only view and order products from a specific set of categories, provide a **category access** type:

```curl
{
    "name": "Bulk Purchasers",
    "category_access": {
        "type": "specific",
        "categories": [7, 12, 20]
    }
}
```

To provide a 5% store-wide discount for customers in the group, provide a **discount rule** of type **all**:

```curl
{
    "name": "Student Discounts",
    "discount_rules": 
    [{
        "type": "all",
        "method": "percent",
        "amount": 5.00
    }]
}
```

## Update a Customer Group

Updates an existing customer group.

*   [OAuth](#update-a-customer-group-oauth)
>`PUT /stores/{store_hash}/v2/customer_groups/{id}`
*   [Basic Auth](#update-a-customer-group-basic)
>`PUT /api/v2/customer_groups/{id}`

### Read-only Properties

The following properties of the customer group are read-only. If one or more of these properties are included in the request, it will be rejected.

### Requirements

The following properties of the customer group are required. The request won’t be fulfilled unless these properties are valid.

### Notes

Any combination of fields can be updated at once. Discount rules are treated in bulk. The entire set of rules is overwritten when a request is sent.

The following request will remove any existing rules, and apply the new ones:
```curl
{
        "discount_rules": [
            {
                "type": "all",
                "method": "percent",
                "amount": 2.50
            },
            {
                "type": "product",
                "product_id": 33,
                "method": "percent",
                "amount": 5.00
            },
            {
                "type": "category",
                "category_id": 7,
                "method": "price",
                "amount": 12.00
            }
        ]
    }
```

## Delete a Customer Group

Deletes a customer group.

*   [OAuth](#delete-a-customer-group-oauth)
>`DELETE /stores/{store_hash}/v2/customer_groups/{id}`
*   [Basic Auth](#delete-a-customer-group-basic)
>`DELETE /api/v2/customer_groups/{id}`

### Notes

All existing customers are unassigned from the group when it is deleted.

## Delete All Customer Groups

Deletes all customer groups in the store.


*   [OAuth](#delete-all-customer-groups-oauth)
>`DELETE /stores/{store_hash}/v2/customer_groups`
*   [Basic Auth](#delete-all-customer-groups-basic)
>`DELETE /api/v2/customer_groups`
