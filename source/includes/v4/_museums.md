# Museums

Provides information about the online bookable museums

## List of museums

`GET https://demo.gomus.de/api/v4/museums`

```shell
curl "https://demo.gomus.de/api/v4/museums"
```

> The above command returns JSON structured like this:

```json
{
    "museums": [
        {
        "id": 1,
        "title": "Intro Museum",
        "sub_title": "Moderne Kunst des 21. Jahrhunderts",
        "picture": {
            "title": null,
            "description": null,
            "copyright_info": null,
            "teaser": "../teaser/hintergrund_grau.jpg",
            "preview": "../preview/hintergrund_grau.jpg",
            "article": "../article/hintergrund_grau.jpg",
            "detail": "../detail/hintergrund_grau.jpg"
            }
        },
        {
            ...
        }
    ],
    "meta": {
        "total_count": 1,
        "page": 1,
        "per_page": 25
    }

}
```

### Available filters:

- a simple search is available with the `q` parameter, e.g. `?q=Modern`, see more in the search section
- locales are available with the `locale` parameter, see more in the locale section

### Available parameters:

- per_page, defaults to system default (`25`)
- page, defaults to `1`

### Response

The json response contains a list of museums as an array and a meta block.

- id (integer), the unique database id of the museum
- title (string), the name of the museum
- sub_title (string), a more descriptive name
- picture, contains picture information and urls for various image formats

## Details of a single museum

`GET https://demo.gomus.de/api/v4/museums/:id`

```shell
curl "https://demo.gomus.de/api/v4/museums/1"
```

> The above command returns JSON structured like this:

```json
{
    "museum": {
        "id": 1,
        "title": "Alte Nationalgalerie",
        "sub_title": "Kunst des 19. Jahrhunderts ",
        "description": null,
        "picture": {
            "title": null,
            "description": null,
            "copyright_info": null,
            "teaser": "../teaser/hintergrund_grau.jpg",
            "preview": "../preview/hintergrund_grau.jpg",
            "article": "../article/hintergrund_grau.jpg",
            "detail": "../detail/hintergrund_grau.jpg"
        },
        "location": {
            "name": "Alte Nationalgalerie",
            "city": "Berlin",
            "country": "Deutschland",
            "street": "Bodestrasse",
            "zip": "10178",
            "latitude": 52.5197,
            "longitude": 13.3985
        }
    }
}
```

### Response

The json response contains a museum block with information for that museum. The information is the same as that of the museums list response, but with the addition of a location block.

- location, contains information about the location of the museum.
