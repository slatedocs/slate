# Other Data

Provides information about other various entities

## Countries

`GET https://demo.gomus.de/api/v4/countries`

```shell
curl "https://demo.gomus.de/api/v4/countries"
```

> The above command returns JSON structured like this:

```json
{
  "countries": [
    {
      "name": "Deutschland",
      "id": 60,
      "code": "DE"
    },
    {
      "name": "Vereinigtes Königreich",
      "id": 80,
      "code": "GB"
    },
    {
      "name": "Frankreich",
      "id": 76,
      "code": "FR"
    },

    ...
  ],
  "meta": {
    "total_count": 249,
    "page": 1,
    "per_page": 25
  }
}
```

### Available parameters:

- per_page, defaults to system default (`25`)
- page, defaults to `1`

### Response

The json response contains a list of countries as an array and a meta block.

- name (string), the name of the country
- id (integer), the unique database id of the country
- code (string), a code of two letters to represent the country

## States

`GET https://demo.gomus.de/api/v4/states`

```shell
curl "https://demo.gomus.de/api/v4/states"
```

> The above command returns JSON structured like this:

```json
{
  "states": [
    {
      "name": "Baden-Württemberg",
      "id": 1,
      "country_id": 60
    },
    {
      "name": "Bayern",
      "id": 2,
      "country_id": 60
    },
    {
      "name": "Berlin",
      "id": 3,
      "country_id": 60
    },
    {
      "name": "Brandenburg",
      "id": 4,
      "country_id": 60
    },
    {
      "name": "Bremen",
      "id": 5,
      "country_id": 60
    },

    ...
  ],
  "meta": {
    "total_count": 16,
    "page": 1,
    "per_page": 25
  }
}
```

### Available parameters:

- per_page, defaults to system default (`25`)
- page, defaults to `1`

### Response

The json response contains a list of states as an array and a meta block.

- name (string), the name of the state
- id (integer), the unique database id of the state
- country_id (integer), the unique database id of the country to which the state belongs

## Dispatch Modes

`GET https://demo.gomus.de/api/v4/dispatch_modes`

```shell
curl "https://demo.gomus.de/api/v4/dispatch_modes"
```

> The above command returns JSON structured like this:

```json
{
  "dispatch_modes": [
    {
      "name": "E-Mail",
      "id": 1
    },
    {
      "name": "Post",
      "id": 2
    },
    {
      "name": "Abholung im Museum",
      "id": 3
    }
  ],
  "meta": {
    "total_count": 3,
    "page": 1,
    "per_page": 25
  }
}
```

### Available parameters:

- per_page, defaults to system default (`25`)
- page, defaults to `1`

### Response

The json response contains a list of dispatch modes as an array and a meta block.

- name (string), the name of the dispatch mode
- id (integer), the unique database id of the dispatch mode
