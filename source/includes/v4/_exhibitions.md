# Exhibitions

Provides information about the online bookable exhibitions

## List of exhibitions

`GET https://demo.gomus.de/api/v4/exhibitions`

```shell
curl "https://demo.gomus.de/api/v4/exhibitions"
```

> The above command returns JSON structured like this:

```json
{
    "exhibitions": [
        {
            "id": 33,
            "museum_id": 20,
            "title": "Dauerausstellung | Gemäldegalerie",
            "sub_title": "Malerei vom 13. bis zum 18. Jahrhundert ",
            "slider_description": "Malerei vom 13. bis zum 18. Jahrhundert",
            "featured": true,
            "picture": {
                "title": null,
                "description": null,
                "copyright_info": null,
                "teaser": "...",
                "preview": "../preview/hintergrund_grau.jpg",
                "article": "../article/hintergrund_grau.jpg",
                "detail": "../detail/hintergrund_grau.jpg"
            },
            "time_frames": [
                {
                "start_at": "2016-11-28T09:00:00+01:00",
                "end_at": "2016-12-04T20:45:00+01:00"
                }
            ]
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
- by_museum_ids (Array of museum ids), filter by museums, see museums section
- by_featured (Boolean, true|false), filter by featured flag

### Available parameters:

- per_page, defaults to system default (`25`)
- page, defaults to `1`

### Response

The json response contains a list of exhibitions as an array and a meta block.

- id (integer), the unique database id of the exhibition
- museum_id (integer), the unique database id of the museum to which the exhibition belongs
- title (string), the name of the exhibition
- sub_title (string), a more descriptive name
- picture, contains picture information and urls for various image formats
- slider_description, additional description field used by the online shop slider
- featured, boolean flag of whether the exhibition is featured or not
- time_frames, array of hashes with start_at and end_at key/value pairs for retention times of exhibitions. An exhibition without any timeframes is permanent exhibition.

## Details of a single exhibition

`GET https://demo.gomus.de/api/v4/exhibitions/:id`

```shell
curl "https://demo.gomus.de/api/v4/exhibitions/1"
```

> The above command returns JSON structured like this:

```json
{
    "exhibition": {
        "id": 33,
        "museum_id": 20,
        "title": "Dauerausstellung | Gemäldegalerie",
        "sub_title": "Malerei vom 13. bis zum 18. Jahrhundert ",
        "slider_description": "Malerei vom 13. bis zum 18. Jahrhundert",
        "description": "...",
        "featured": true,
        "picture": {
            "title": null,
            "description": null,
            "copyright_info": null,
            "teaser": "../teaser/hintergrund_grau.jpg",
            "preview": "../preview/hintergrund_grau.jpg",
            "article": "../article/hintergrund_grau.jpg",
            "detail": "../detail/hintergrund_grau.jpg"
        },
        "time_frames": [
            {
            "start_at": "2016-11-28T09:00:00+01:00",
            "end_at": "2016-12-04T20:45:00+01:00"
            }
        ],
        "content": {
            ...
        },
        "location": {
            "name": "Gemäldegalerie",
            "city": "Berlin",
            "country": "Deutschland",
            "street": "Matthäikirchplatz",
            "zip": "10785",
            "latitude": 52.5082,
            "longitude": 13.3673
        }
    }
}
```

### Response

The json response contains an exhibition block with information for that exhibition. The information is the same as that of the exhibitions list response, but with the addition of a location block.

- location, contains information about the location of the exhibition.
- content, contains key/value pairs of custom defined attributes, e.g. the following:


```json
"content": {
    "cms_title": "Museum Besuchertage",
    "cms_sub_title": "",
    "cms_description": "Das Museum lädt ein.",
    "shop_title": "Museum Besuchertage",
    "shop_sub_title": "",
    "shop_description": "Das Museum lädt ein.",
    "picture_title": "",
    "picture_description": "",
    "picture_copyright_info": ""
}
```