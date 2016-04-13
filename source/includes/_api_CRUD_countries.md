## Countries and territories, identified by their ISO 3166 country codes.

|||
|---|---|
| **Manages** |
| **OAuth Scopes** | `default`

## Operations

*   [List Countries](#list-countries)
*   [Get a Country](#get-a-country)
*   [Get a Count of Countries](#get-a-count-of-countries)

## List Countries

Gets the list of countries.

*   [OAuth](#list-countries-oauth)
>`GET /stores/{store_hash}/v2/countries`
*   [Basic Auth](#list-countries-basic)
>`GET /api/v2/countries`

### Filters

Filter parameters can be added to the URL query string to select specific countries in the collection.

| Parameter | Type | Example |
| --- | --- | --- |
| `country` | string | `/api/v2/countries?country={value}` |
| `country_iso2` | string | `/api/v2/countries?country_iso2={value}` |
| `country_iso3` | string | `/api/v2/countries?country_iso3={value}` |

### Pagination

Parameters can be added to the URL query string to paginate the collection. The maximum limit is 250. If a limit isn’t provided, up to 50 countries are returned by default.

| Parameter | Type | Example |
| --- | --- | --- |
| `Page` | int | `/api/v2/countries?page={number}` |
| `Limit` | int | `/api/v2/countries?limit={count}` |

```json
[
  {
    "id": 1,
    "country": "Afghanistan",
    "country_iso2": "AF",
    "country_iso3": "AFG",
    "states": {
      "url": "https://store-bwvr466.mybigcommerce.com/api/v2/countries/1/states.json",
      "resource": "/countries/1/states"
    }
  },
  {
    "id": 2,
    "country": "Albania",
    "country_iso2": "AL",
    "country_iso3": "ALB",
    "states": {
      "url": "https://store-bwvr466.mybigcommerce.com/api/v2/countries/2/states.json",
      "resource": "/countries/2/states"
    }
  }
]
```

## Get a Country

Gets a country.

*   [OAuth](#get-a-country-oauth)
>`GET /stores/{store_hash}/v2/countries/{id}`
*   [Basic Auth](#get-a-country-basic)
>`GET /api/v2/countries/{id}`

```json
{
  "id": 226,
  "country": "United States",
  "country_iso2": "US",
  "country_iso3": "USA",
  "states": {
    "url": "https://store-bwvr466.mybigcommerce.com/api/v2/countries/226/states.json",
    "resource": "/countries/226/states"
  }
}
```
## Get a Count of Countries

Gets a count of countries.

*   [OAuth](#get-a-count-of-countries-oauth)
>`GET /stores/{store_hash}/v2/countries/count`
*   [Basic Auth](#get-a-count-of-countries-basic)
>`GET /api/v2/countries/count`

```json
{
  "count": 243
}
```
