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
        "Projekt",
        "Führung"
    ]
}
```

### Response

The json response contains a list of all tour categories to build up filters. Note: this only contains valid elements, some tours might have no filtername set.



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
                "name": "Führung (60 min)",
                "filtername": ""
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
            "audiences": []
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
- by_featured (Boolean, true|false), filter by featured flag
- by_museum_ids (Array of museum ids), filter by museums, see museums section
- by_exhibition_ids (Array of exhibition ids), filter by exhibitions, see exhibitions section
- by_categories (Array of category names), filter by categories, see categories section

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

The information is the same as that of the tours list response, but with the addition of the description key.



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









