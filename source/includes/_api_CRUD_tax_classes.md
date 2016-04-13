## Tax classes are used to apply different tax rates for specific types of products and orders.

|||
|---|---|
| Manages |
| OAuth Scopes | `store_v2_information`
||`store_v2_information_read_only`

## Operations

*   [List Tax Classes](#list-tax-classes)
*   [Get a Tax Class](#get-a-tax-class)

## List Tax Classes

Gets the tax classes set up for a store. (Default sorting is by tax-class id, from lowest to highest.)

*   [OAuth](#list-tax-classes-oauth)
>`GET /stores/{store_hash}/v2/tax_classes`
*   [Basic Auth](#list-tax-classes-basic)
>`GET /api/v2/tax_classes`

### Filters

Filter parameters can be added to the URL query string to select specific tax_classes in the collection.

| Parameter | Type | Example |
| --- | --- | --- |

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 tax_classes are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/tax_classes?page={number}` |
| `Limit` | int | `/api/v2/tax_classes?limit={count}` |

## Get a Tax Class

Gets a tax class.

*   [OAuth](#get-a-tax-class-oauth)
>`GET /stores/{store_hash}/v2/tax_classes/{id}`
*   [Basic Auth](#get-a-tax-class-basic)
>`GET /api/v2/tax_classes/{id}`
