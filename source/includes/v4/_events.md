# Events

Provides information about the online bookable events and dates.

## Event categories

`GET https://demo.gomus.de/api/v4/events/categories`

```shell
curl "https://demo.gomus.de/api/v4/events/categories"
```

> The above command returns JSON structured like this:

```json
{
  "categories": [
    {
      "id": 3,
      "name": "öffentliche Führung"
    },
    {
      "id": 4,
      "name": "Kurs / Workshop"
    },
    {
      "id": 5,
      "name": "Kinder / Familien"
    }
  ] 
}
```

### Response

The json response contains a list of all event categories to build up filters. 
Note: this only contains valid elements, some events might have no name set. Some categories have
duplicate names.



## List of events

`GET https://demo.gomus.de/api/v4/events`

```shell
curl "https://demo.gomus.de/api/v4/events"
```

> The above command returns JSON structured like this:

```json
{
    "events": [
        {
            "id": 101174,
            "exhibition_id": 2057,
            "museum_id": 20,
            "title": "El Siglo de Oro | Öffentliche Führung",
            "sub_title": "60 Minuten | 4 EUR zzg. Eintritt<br>Di – Fr / 16:00 Uhr, Sa und So / 14:30 und 16:00 Uhr<br>",
            "featured": false,
            "category": {
                "id": 3,
                "name": "öffentliche Führung"
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
- by_category_ids (Array of category ids), filter by category, see categories section
- by_bookable (Boolean, true|false, default: all), filter by general bookability for current account (or public)

### Available parameters:

- per_page, defaults to system default (`25`)
- page, defaults to `1`

### Response

The json response contains a list of events as an array and a meta block.

- id (integer), the unique database id of the event
- title (string), the name of the event
- sub_title (string), the sub title of the event
- featured, boolean flag of whether the exhibition is featured or not

plus blocks of attributes for category, picture, location and audiences.

## Details of single event

`GET https://demo.gomus.de/api/v4/events/:id`

```shell
curl "https://demo.gomus.de/api/v4/events/1"
```

The information is the same as that of the events list response, but with the addition of the description key.

## Calendar for a single event

`GET https://demo.gomus.de/api/v4/events/:id/calendar`

```shell
curl "https://demo.gomus.de/api/v4/events/1/calendar"
```

> The above command returns JSON structured like this (with `depth=any`, the default):

```json
{
    "data": {
        "2016-07-24": true,
        "2016-07-25": false,
        "2016-07-26": true,
        "2016-07-27": true,
        "2016-07-28": true,
        "2016-07-29": true,
        "2016-07-30": true,
        "2016-07-31": true
    }
}
```


> Example output with `depth=all`:

```json
{
    "data": {
        "2016-07-10": [
        {
            "date": {
                "id": 22973,
                "event_id": 101174,
                "title": "El Siglo de Oro",
                "sub_title": null,
                "start_time": "2016-07-10T16:00:00+02:00",
                "seats": {
                    "max": 20,
                    "booked": 0,
                    "available": 20
                }
            }
        }
        ],
        "2016-07-11": [],

        ...
    }
}

```

The calender for a single event provides a fast way to check when the event has dates or not. With the default mode, returns a simple boolean as the value for each day in the range specified. With depth `all` we get the details of the dates available for each day as well. However, this calculation will take longer.

### Available parameters:

- start_at (`YYYY-MM-DD`), defaults to today
- end_at (`YYYY-MM-DD`), defaults to end of month
- opening_hours_start, in minutes from beginning of day, defaults to `8 * 60`
- opening_hours_end, in minutes from beginning of day, defaults to `22 * 60`
- depth: string, one of `any|all`, defaults to `any`



## Dates for a single event

`GET https://demo.gomus.de/api/v4/events/:id/dates`

```shell
curl "https://demo.gomus.de/api/v4/events/1/dates"
```

> The above command returns JSON structured like this:


```json
{
    "dates": [
        {
            "id": 22974,
            "event_id": 101174,
            "exhibition_id": 2057,
            "museum_id": 20,
            "category": {
               "id": 23,
               "name": "öffentliche Führung"
            },
            "title": "El Siglo de Oro",
            "sub_title": null,
            "start_time": "2016-07-10T14:30:00+02:00",
            "duration": 60,
            "language": {
                "id": 1,
                "name": "Deutsch"
            }
        }
    ],
    "meta": {
        "total_count": 1,
        "page": 1,
        "per_page": 25
    }
}
```

Queries the available dates for a specific event. The default shows only dates for today, or specified by the `date` parameter. A range of up to 31 days can be queried by using the `start_at` and `end_at` parameter.


### Available parameters:

- date (`YYYY-MM-DD`), defaults to today
- start_at (`YYYY-MM-DD`), instead of `date`
- end_at (`YYYY-MM-DD`), instead of `date`

- per_page, defaults to system default (`25`)
- page, defaults to `1`


### Response

The json response contains a list of dates as an array and a meta block.

- id (integer), the unique database id of the events' date
- event_id (integer), the unique database id of the parent event
- exhibition_id (integer), the unique database id of the parent events' exhibition
- museum_id (integer), the unique database id of the parent events' museum
- title (string), the name of the date
- sub_title (string), the sub title of the date
- start_time (iso8601), the date's timestamp

plus a block of attributes for available seats (see below).

### Seats

The seats block contains four attributes:

- min (integer), minimum number of seats to book
- max (integer), maximum number of seats to book
- booked (integer), number of seats already booked
- available (integer), number of seats still available to book


## Details for a single date

`GET https://demo.gomus.de/api/v4/events/:event_id/dates/:id`

```shell
curl "https://demo.gomus.de/api/v4/events/1/dates/1"
```

> The above command returns JSON structured like this:


```json
{
    "date": {
        "id": 22974,
        "event_id": 101174,
        "exhibition_id": 2057,
        "museum_id": 20,
        "category": {
            "id": 23,
            "name": "öffentliche Führung"
        },
        "title": "El Siglo de Oro",
        "sub_title": null,
        "description": null,
        "start_time": "2016-07-10T14:30:00+02:00",
        "vat_pct": 0,
        "tax_included": true,
        "seats": {
            "min": 1,
            "max": 20,
            "booked": 0,
            "available": 20
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
        "language": {
            "id": 1,
            "name": "Deutsch"
        },
        "prices": [
            {
                "group": false,
                "optional": false,
                "price_cents": 400
            }
        ]
    }
}
```

The detailed view for a single date provides all information needed to create for example an event date booking via the reseller API.


### Response

The json response contains more attributes than in the overview:

- vat_pct (float), the pricing tax rate
- tax_included (boolean), whether the tax (if any) is included or not

plus a block of attributes for available seats (see below) languages, location and prices.

### Languages

Usualy this block contains an array with one element, since most of events are in one language.

### Prices

The prices block contains one ore more price objects in an array. There are two types of price objects for event date bookings:

default prices with three attributes:

- group (boolean), whether the price is for the whole group or per participant (per seat)
- optional (boolean), whether the price is a choice or not
- price_cents (integer) price in EUR cents

or scale prices with six attributes:

- scale_price_id (integer) internal database id for the scale price definition
- title(string) title of scale price, e.g. "regular fee" or "reduced fee"
- description(text)
- group (boolean), whether the price is for the whole group or per participant (per seat)
- optional (boolean), whether the price is a choice or not
- price_cents (integer) price in EUR cents


Usualy, there will be one default price or at least one scale pice.


## Global dates list

`GET https://demo.gomus.de/api/v4/dates`

```shell
curl "https://demo.gomus.de/api/v4/dates"
```

> The above command returns JSON structured like the events date list.


### Available filters:

- a simple search is available with the `q` parameter, e.g. `?q=Modern`, see more in the search section
- locales are available with the `locale` parameter, see more in the locale section

- by_museum_ids (Array of museum ids), filter by museums, see museums section
- by_exhibition_ids (Array of exhibition ids), filter by exhibitions, see exhibitions section
- by_event_ids (Array of event ids), filter by events
- by_category_ids (Array of category ids), filter by category, see categories section
- by_categories (Array of category names), filter by categories, see categories section

### Available parameters:

- start_at (`YYYY-MM-DD`), default to today
- end_at (`YYYY-MM-DD`), defaults to end of month

- per_page, defaults to system default (`25`)
- page, defaults to `1`

### Response

The json response contains a list of dates for all events as an array and a meta block.


## Global events calendar

`GET https://demo.gomus.de/api/v4/calendar`

```shell
curl "https://demo.gomus.de/api/v4/calendar"
```

> The above command returns JSON structured like the single events calendar, but for all events.

The global calender provides a nice way to check wether dates are available for a day in range or not. With the default mode, the return value for each day in the specified range is a simple boolean.


### Available filters:

- by_museum_ids (Array of museum ids), filter by museums, see museums section
- by_exhibition_ids (Array of exhibition ids), filter by exhibitions, see exhibitions section
- by_event_ids (Array of event ids), filter by events
- by_category_ids (Array of category ids), filter by category, see categories section
- by_categories (Array of category names), filter by categories, see categories section

### Available parameters:

- start_at (`YYYY-MM-DD`), defaults to today
- end_at (`YYYY-MM-DD`), defaults to end of month
- opening_hours_start, in minutes from beginning of day, defaults to `8 * 60`
- opening_hours_end, in minutes from beginning of day, defaults to `22 * 60`
- depth: string, one of `any|all`, defaults to `any`

