# Tours

Provides information about the online bookable tours.

## Tour categories

`GET https://demo.gomus.de/api/v4/tours/categories`

```shell
curl "https://demo.gomus.de/api/v4/tours/categories"
```

> The above command returns JSON structured like this:

```json
{
    "categories": [
        {
        "id": 1,
        "name": "Projekt"
        },
        {
         "id": 2,
         "name": "Führung"
        }
    ]
}
```

### Response

The json response contains a list of all tour categories to build up filters. 
Note: this only contains valid elements, some events might have no name set. Some categories have
duplicate names.

## Tour languages

`GET https://demo.gomus.de/api/v4/tours/languages`

```shell
curl "https://demo.gomus.de/api/v4/tours/languages"
```

> The above command returns JSON structured like this:

```json
{
    "languages": [
        {
        "id": 1,
        "name": "Deutsch"
        },
        {
         "id": 2,
         "name": "Englisch"
        }
    ]
}
```

### Response

The json response contains a list of all languages used by online bookable tour products to build up filters. 

## Tour tags

Tours can be tagged with the following tag types:

### Age groups

`GET https://demo.gomus.de/api/v4/tours/age_groups`

```shell
curl "https://demo.gomus.de/api/v4/tours/age_groups"
```

> The above command returns JSON structured like this:

```json
{
    "age_groups": [
        {
            "id": 1,
            "name": "Kinder bis 10 Jahre"
        },
        {
            "id": 2,
            "name": "Kinder ab 10 Jahre"
        }
    ]
}
```

### Audiences

`GET https://demo.gomus.de/api/v4/tours/audiences`

```shell
curl "https://demo.gomus.de/api/v4/tours/audiences"
```

> The above command returns JSON structured like this:

```json
{
    "audiences": [
        {
            "id": 1,
            "name": "Jugendliche"
        },
        {
            "id": 2,
            "name": "Erwachsene"
        }
    ]
}
```

### Catch words

`GET https://demo.gomus.de/api/v4/tours/catch_words`

```shell
curl "https://demo.gomus.de/api/v4/tours/catch_words"
```

> The above command returns JSON structured like this:

```json
{
    "catch_words": [
        {
            "id": 1,
            "name": "Ägypten"
        },
        {
            "id": 2,
            "name": "Mythologie"
        }
    ]
}
```
### Proposal categories

`GET https://demo.gomus.de/api/v4/tours/proposal_categories`

```shell
curl "https://demo.gomus.de/api/v4/tours/proposal_categories"
```

> The above command returns JSON structured like this:

```json
{
    "proposal_categories": [
        {
            "id": 1,
            "name": "Schulklasse"
        },
        {
            "id": 2,
            "name": "Gruppe ohne Guide"
        }
    ]
}
```
### Grades

`GET https://demo.gomus.de/api/v4/tours/grades`

```shell
curl "https://demo.gomus.de/api/v4/tours/grades"
```

> The above command returns JSON structured like this:

```json
{
    "grades": [
        {
            "id": 1,
            "name": "Grundschule Klasse 1"
        },
        {
            "id": 2,
            "name": "Grundschule Klasse 2"
        },
        {
            "id": 3,
            "name": "Sekundarstufe II"
        }
    ]
}
```

### Tag responses

The json response contains a list of used tour tags by category to build up filters.


## List of tours

`GET https://demo.gomus.de/api/v4/tours`

```shell
curl "https://demo.gomus.de/api/v4/tours"
```

> The above command returns JSON structured like this:

```json
{
    "tours": [
        {
            "id": 101173,
            "exhibition_id": 2057,
            "museum_id": 20,
            "title": "El Siglo de Oro | Gruppenführung",
            "sub_title": "60 Minuten | 90 EUR zzgl. Eintritt <br>Buchung 14 Tage im Voraus<br>(Gruppen bis 25 Personen)",
            "featured": false,
            "category": {
                "id": 2,
                "name": "Führung"
            },
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
                "name": "Gemäldegalerie",
                "city": "Berlin",
                "country": "Deutschland",
                "street": "Matthäikirchplatz",
                "zip": "10785",
                "latitude": 52.5082,
                "longitude": 13.3673
            },
            "age_groups": [],
            "audiences": [],
            "catch_words": [],
            "disablements": [],
            "grades": [],
            "proposal_categories": [],
            "languages": [
                {
                    "id": 1,
                    "name": "Deutsch"
                }
            ]
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
- by_featured (Boolean, true|false, default: all), filter by featured flag
- by_museum_ids (Array of museum ids), filter by museums, see museums section
- by_exhibition_ids (Array of exhibition ids), filter by exhibitions, see exhibitions section
- by_category_ids (Array of category ids), filter by category, see categories section
- by_age_group_ids (Array of age group ids), filter by age group, see age group section
- by_audience_ids (Array of audience ids), filter by audience, see audience section
- by_catch_word_ids (Array of catch word ids), filter by catch word, see catch words section
- by_disablement_ids (Array of disablement ids), filter by disablement, see disablements section
- by_grade_ids (Array of grade ids), filter by grade, see grades section
- by_proposal_category_ids (Array of proposal category ids), filter by proposal category, see proposal categories section
- by_language_ids (Array of language ids), filter by language, see languages section
- by_categories (Array of category names), filter by categories, see categories section
- by_bookable (Boolean, true|false, default: all), filter by general bookability for current account (or public)

### Available parameters:

- per_page, defaults to system default (`25`)
- page, defaults to `1`

### Response

The json response contains a list of tours as an array and a meta block.

- id (integer), the unique database id of the tour
- title (string), the name of the tour
- sub_title (string), the sub title of the tour
- featured, boolean flag of whether the exhibition is featured or not

plus blocks of attributes for category, picture, location and audiences.

## Details of single tour

`GET https://demo.gomus.de/api/v4/tours/:id`

```shell
curl "https://demo.gomus.de/api/v4/tours/1"
```

The information is the same as that of the tours list response, but with the addition of the description 
key and some other attributes like the dynamic content attributes


## Prices for a tour

`GET https://demo.gomus.de/api/v4/tours/:id/prices`

```shell
curl "https://demo.gomus.de/api/v4/tours/1/prices"
```

> The above command returns JSON structured like this:

```json
{
    "prices": [
        {
            "title": "Entgelt",
            "description": "Gruppenpreis",
            "group": true,
            "optional": false,
            "price_cents": 9000
        },
        {
            "price_surcharge_id": 1,
            "title": "Zuschlag",
            "description": "für Sonn- und Feiertage",
            "group": true,
            "optional": true,
            "price_cents": 300
        }
    ],
    "vat_pct": 0.0,
    "tax_included": true

}
```

There are three different ways of how the base price for a tour is calculated:

- default price, per group
- scale prices
- customer type related price ("Entgelttabelle")

plus additional surcharges, e.g. sunday extra, foreign language extra and so on. All prices depend on the date of the tour, the customer type and the language.

### Available parameters:

- date (`YYYY-MM-DD`), defaults to today
- language_id (integer), defaults to first assigned language of the tour

### Response


The json response contains the following attributes:

- vat_pct (float), the pricing tax rate
- tax_included (boolean), whether the tax (if any) is included or not

and an array of "prices", see below.

### Prices

The prices block contains one or more price object in an array. There are four types of prices for tour bookings:

default prices with three attributes:

- group (boolean), whether the price is for the whole group or per participant (per seat)
- optional (boolean), whether the price is a choice or not
- price_cents (integer) price in EUR cents

or scale prices with six attributes:

- scale_price_id (integer) internal database id for the scale price definition
- title (string) title of the scale price, e.g. "regular fee" or "reduced fee"
- description (text), the description for the scale price
- group (boolean), whether the price is for the whole group or per participant (per seat)
- optional (boolean), whether the price is a choice or not
- price_cents (integer) price in EUR cents

or customer type related prices with five attributes:

- title(string) title of price, e.g. "Entgelt" or "Pauschale"
- description(text)
- group (boolean), whether the price is for the whole group or per participant (per seat)
- optional (boolean), whether the price is a choice or not
- price_cents (integer) price in EUR cents


Usualy, only one of the three above occurs per tour. The tour might also be configured with one or more surcharges:


- price_surcharge_id (integer) internal database id for the surcharge definition
- title(string) title of surcharge price, e.g. "regular fee" or "reduced fee"
- description(text), the description of the surcharge price
- group (boolean), whether the price is for the whole group or per participant (per seat)
- optional (boolean), whether the price is a choice or not
- price_cents (integer) price in EUR cents


## Start times

While events always have a fixed start time, a tour is more flexible and up to the customer to decide e.g. when he wants to start. Usualy, start times between 8 in the morning and 8 in the evening are possible. Still, the start times (in 15-minutes steps) need to follow certain limitations (e.g. number of tours a day, number of participants in the museum at the same time). The server can calculate start times for tours on the fly.


`GET https://demo.gomus.de/api/v4/tours/:id/start_times`

```shell
curl "https://demo.gomus.de/api/v4/tours/1/start_times"
```

> The above command returns JSON structured like this (with `depth=any`, the default):

```json
{
    "data": {
        "2016-07-24": false,
        "2016-07-25": false,
        "2016-07-26": true
    }
}
```


> Example output with `depth=all`:

```json
{
    "data": {
        "2016-07-24": [],
        "2016-07-25": [],
        "2016-07-26": [
            "2016-07-26T10:30:00+02:00",
            "2016-07-26T11:00:00+02:00",
            "2016-07-26T11:30:00+02:00",
            "2016-07-26T12:00:00+02:00",
            "2016-07-26T12:30:00+02:00",
            "2016-07-26T13:00:00+02:00",
            "2016-07-26T13:30:00+02:00",
            "2016-07-26T14:00:00+02:00",
            "2016-07-26T14:30:00+02:00",
            "2016-07-26T15:00:00+02:00",
            "2016-07-26T15:30:00+02:00",
            "2016-07-26T16:30:00+02:00"
        ]
    }
}

```

The start times calender for a tour provides a fast way to check when the tour has possible start times or not within a specified time range. With the default mode (`depth=any`), the return value for each day in the range specified is a simple boolean.

### Available parameters:

- start_at (`YYYY-MM-DD`), defaults to today
- end_at (`YYYY-MM-DD`), defaults to end of month
- opening_hours_start, in minutes from beginning of day, defaults to `8 * 60`
- opening_hours_end, in minutes from beginning of day, defaults to `22 * 60`
- participants, any number > 0, defaults to either 1 or the minimum of participants for this tour
- depth: string, one of `any|all`, defaults to `any`





## Start times for a day


`GET https://demo.gomus.de/api/v4/tours/:id/start_times/:date`

```shell
curl "https://demo.gomus.de/api/v4/tours/1/start_times/2016-07-26"
```

> The above command returns JSON structured like this:

```json
{
    "data": [
        {
            "start_time": "2016-07-26T10:30:00+02:00",
            "participants": {
                "min": 0,
                "max": 25,
                "bookable": 25
            }
        },
        {
            "start_time": "2016-07-26T11:00:00+02:00",
            "participants": {
                "min": 0,
                "max": 25,
                "bookable": 25
            }
        }
    ]
}
```


### Available parameters:

- opening_hours_start, in minutes from beginning of day, defaults to `8 * 60`
- opening_hours_end, in minutes from beginning of day, defaults to `22 * 60`

### Response

The start times for a specific day contains the start time and a participants block:

- min (integer), minimum participants needed, often 0 or 1
- max (integer), maximum participants
- bookable (integer), participants to book left









