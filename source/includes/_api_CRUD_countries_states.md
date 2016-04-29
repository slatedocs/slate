## States and subdivisions belonging to countries.
|||
|---|---|
| **Manages** |
| **OAuth Scopes** | `default`


## Operations

*   [List States](#list-states)
*   [Get a State](#get-a-state)
*   [Get a Count of States](#get-a-count-of-states)

## List States

Gets the list of states belonging to a country.

*   [OAuth](#list-states-oauth)
>`GET /stores/{store_hash}/v2/countries/{country_id}/states`
*   [Basic Auth](#list-states-basic)
>`GET /api/v2/countries/{country_id}/states`

### Filters

Filter parameters can be added to the URL query string to select specific states in the collection.

| Parameter | Type | Example |
| --- | --- | --- |
| `state` | string | `/api/v2/countries/{country_id}/states?state={value}` |
| `state_abbreviation` | string | `/api/v2/countries/{country_id}/states?state_abbreviation={value}` |

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 states are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/countries/{country_id}/states?page={number}` |
| `Limit` | int | `/api/v2/countries/{country_id}/states?limit={count}` |

```json
[
  {
    "id": 1,
    "state": "Alabama",
    "state_abbreviation": "AL",
    "country_id": 226
  },
  {
    "id": 2,
    "state": "Alaska",
    "state_abbreviation": "AK",
    "country_id": 226
  }
]
```

## Get a State

Gets a state belonging to a country.

*   [OAuth](#get-a-state-oauth)
>`GET /stores/{store_hash}/v2/countries/{country_id}/states/{id}`
*   [Basic Auth](#get-a-state-basic)
>`GET /api/v2/countries/{country_id}/states/{id}`

```json
{
  "id": 1,
  "state": "Alabama",
  "state_abbreviation": "AL",
  "country_id": 226
}
```

## Get a Count of States

Gets a count of the number of states within a specified country.

*   [OAuth](#get-a-count-of-states-oauth)
>`GET /stores/{store_hash}/v2/countries/{country_id}/states/count`
*   [Basic Auth](#get-a-count-of-states-basic)
>`GET /api/v2/countries/{country_id}/states/count`

```json
{
  "count": 65
}
```
