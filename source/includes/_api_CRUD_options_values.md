## Values that can be selected for an option.

|||
|---|---|
| Manages |
| OAuth Scopes | `store_v2_products`
||`store_v2_products_read_only`


## Operations

*   [List Option Values](#list-option-values)
*   [Get an Option Value](#get-an-option-value)
*   [Create an Option Value](#create-an-option-value)
*   [Update an Option Value](#update-an-option-value)
*   [Delete an Option Value](#delete-an-option-value)
*   [Delete Multiple Option Values](#delete-multiple-option-values)

## List Option Values

Gets the values belonging to an option. (Default sorting is by option-value id, from lowest to highest.)


*   [OAuth](#list-option-values-oauth)
>`GET /stores/{store_hash}/v2/options/{option_id}/values`
*   [Basic Auth](#list-option-values-basic)
>`GET /api/v2/options/{option_id}/values`

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 option_values are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/options/{option_id}/values?page={number}` |
| `Limit` | int | `/api/v2/options/{option_id}/values?limit={count}` |

```json
[
  {
    "id": 1,
    "option_id": 3,
    "label": "Silver",
    "sort_order": 2,
    "value": "#cccccc",
    "is_default": true
  },
  {
    "id": 2,
    "option_id": 3,
    "label": "Black",
    "sort_order": 1,
    "value": "#000000",
    "is_default": false
  }
]
```

## Get an Option Value

Gets an option value.

*   [OAuth](#get-an-option-value-oauth)
>`GET /stores/{store_hash}/v2/options/{option_id}/values/{id}`
*   [Basic Auth](#get-an-option-value-basic)
>`GET /api/v2/options/{option_id}/values/{id}`

```json
{
  "id": 9,
  "option_id": 3,
  "label": "Purple",
  "sort_order": 3,
  "value": "#700170",
  "is_default": false
}
```

## Create an Option Value

Creates a new option value.

*   [OAuth](#create-an-option-value-oauth)
>`POST /stores/{store_hash}/v2/options/{option_id}/values`
*   [Basic Auth](#create-an-option-value-basic)
>`POST /api/v2/options/{option_id}/values`


### Read-only Properties

The following properties of the option value are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `option_id`

### Requirements

The following properties of the option value are required. The request won’t be fulfilled unless these properties are valid.

*   `label`
*   `value`

### Notes

To maximize system performance, Bigcommerce caps the total number of values per option at 250. IF the option has 250 values and you try to create another one, Bigcommerce will return a 403 error.

When you POST an **_is_default_** property of _true_, all other option values on the parent option will have their **_is_default_** property set to _false_.

```curl
{
  "label": "white",
  "sort_order": 0,
  "value": "#FFFFFF",
  "is_default": true
}
```

```json
{
  "id": 68,
  "option_id": 3,
  "label": "white",
  "sort_order": 0,
  "value": "#FFFFFF",
  "is_default": true
}
```

## Update an Option Value

Updates an existing option value.

*   [OAuth](#update-an-option-value-oauth)
>`PUT /stores/{store_hash}/v2/options/{option_id}/values/{id}`
*   [Basic Auth](#update-an-option-value-basic)
>`PUT /api/v2/options/{option_id}/values/{id}`

### Read-only Properties

The following properties of the option value are read-only. If one or more of these properties are included in the request, it will be rejected.

*   `id`
*   `option_id`

### Requirements

The following properties of the option value are required. The request won’t be fulfilled unless these properties are valid.

### Notes

When you PUT an **_is_default_** property of _true_, all other option values on the parent option will have their **_is_default_** property set to _false_.

```curl
{
  "label": "whitish",
  "sort_order": 1,
  "value": "#FFFFEF",
  "is_default": true
}
```

```json
{
  "id": 68,
  "option_id": 3,
  "label": "whitish",
  "sort_order": 1,
  "value": "#FFFFEF",
  "is_default": true
}
```

## Delete an Option Value

Deletes an option value.

*   [OAuth](#delete-an-option-value-oauth)
>`DELETE /stores/{store_hash}/v2/options/{option_id}/values/{id}`
*   [Basic Auth](#delete-an-option-value-basic)
>`DELETE /api/v2/options/{option_id}/values/{id}`

## Delete Multiple Option Values

Deletes multiple values belonging to an option.

*   [OAuth](#delete-multiple-option-values-oauth)
>`DELETE /stores/{store_hash}/v2/options/{option_id}/values`
*   [Basic Auth](#delete-multiple-option-values-basic)
>`DELETE /api/v2/options/{option_id}/values`

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 option_values are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/options/{option_id}/values?page={number}` |
| `Limit` | int | `/api/v2/options/{option_id}/values?limit={count}` |
