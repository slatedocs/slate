# Global Currencies APIs
Requires authentication.

## List
Returns a list of all global currencies.

```APIs
GET https://dev.zoomsymbols.com/api/global-currencies/list
```
> Parameters (OPTIONAL)

```
currency_name: currency to group by
```

> Response

```json
{
result: [
{
currency_id: 179,
currency_name: "Afghani",
currency_code: "AFA",
currency_unit: null,
currency_rate: null,
last_update: null,
country_id: 1,
country_name: "Afghanistan",
country_iso2: "AF",
country_iso3: "AFG"
}, ...
    ]
}
```

## Groups
Returns a list of all global currencies groups.

```APIs
GET https://dev.zoomsymbols.com/api/global-currencies/groups
```

> Parameters (OPTIONAL)

```
type: group_type
```

> Response

```json
{
result: [
{
group: "Regions",
type: "africa",
label: "Africa"
}, ...
  ]
}
```
