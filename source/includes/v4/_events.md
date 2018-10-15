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


## Event languages

`GET https://demo.gomus.de/api/v4/events/languages`

```shell
curl "https://demo.gomus.de/api/v4/events/languages"
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

The json response contains a list of all languages used by online bookable event products to build up filters.

## Event tags

Events can be tagged with the following tag types:

### Age groups

`GET https://demo.gomus.de/api/v4/events/age_groups`

```shell
curl "https://demo.gomus.de/api/v4/events/age_groups"
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

`GET https://demo.gomus.de/api/v4/events/audiences`

```shell
curl "https://demo.gomus.de/api/v4/events/audiences"
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

`GET https://demo.gomus.de/api/v4/events/catch_words`

```shell
curl "https://demo.gomus.de/api/v4/events/catch_words"
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

`GET https://demo.gomus.de/api/v4/events/proposal_categories`

```shell
curl "https://demo.gomus.de/api/v4/events/proposal_categories"
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

`GET https://demo.gomus.de/api/v4/events/grades`

```shell
curl "https://demo.gomus.de/api/v4/events/grades"
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

The json response contains a list of used event tags by category to build up filters.


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
            "bookable": true,
            "registerable": true,
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
- by_featured (Boolean, true|false), filter by featured flag
- by_museum_ids (Array of museum ids), filter by museums, see museums section
- by_exhibition_ids (Array of exhibition ids), filter by exhibitions, see exhibitions section
- by_category_ids (Array of category ids), filter by category, see categories section
- by_age_group_ids (Array of category ids), filter by category, see age group section
- by_audience_ids (Array of category ids), filter by category, see audience section
- by_catch_word_ids (Array of category ids), filter by category, see catch words section
- by_disablement_ids (Array of category ids), filter by category, see disablements section
- by_grade_ids (Array of category ids), filter by category, see grades section
- by_proposal_category_ids (Array of category ids), filter by proposal category, see categories section
- by_categories (Array of category names), filter by category names, see categories section
- by_language_ids (Array of language ids), filter by language, see languages section
- by_bookable (Boolean, true|false, default: all), filter by general bookability for current account (or public)
- with_bookings_in_future (Boolean, true|false, default: all), filter events that have bookable dates in the future

### Available parameters:

- per_page, defaults to system default (`25`)
- page, defaults to `1`

### Response

The json response contains a list of events as an array and a meta block.

- id (integer), the unique database id of the event
- title (string), the name of the event
- sub_title (string), the sub title of the event
- featured, boolean flag of whether the event is featured or not
- bookable, boolean flag of whether the event is bookable in the current scope or not
- registerable, boolean flag of whether the event is public registerable or not

plus blocks of attributes for category, picture, location and audiences.

## Details of single event

`GET https://demo.gomus.de/api/v4/events/:id`

```shell
curl "https://demo.gomus.de/api/v4/events/1"
```

The information is the same as that of the events list response, but with the addition of the description key and dynamic contents.
If event is registerable and an authenticatable user has the permission, this attribute contains a link to the public
registration form.

## Calendar for a single event

`GET https://demo.gomus.de/api/v4/events/:id/calendar`

```shell
curl "https://demo.gomus.de/api/v4/events/1/calendar"
```

**Note**: This route is obsolete. Please use `api/v4/calendar?by_event_ids[]=:id`

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
            "id": 1065,
            "event_id": 10,
            "exhibition_id": null,
            "museum_id": 1,
            "category": {
              "id": 7,
              "name": "Öffentliche Führung",
              "filtername": ""
            },
            "bookable": true,
            "registerable": false,
            "title": "Termin #241",
            "sub_title": null,
            "start_time": "2017-12-03T13:00:00+01:00",
            "duration": 90,
            "seats": {
                "min": 1,
                "max": 30,
                "booked": 0,
                "available": 30,
                "max_per_registration": null
            },
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


### Available filters:

- by_language_ids (Array of language ids), filter by date language, see languages section
- by_bookable (Boolean, true|false, default: all), filter by general bookability for current account (or public)

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
- language, with id and name
- bookable, boolean flag of whether the event is bookable in the current scope or not
- registerable, boolean flag of whether the event is public registerable or not
- seats, further information for available seats. `max_per_registration` indicates the limit for seats per order

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
        "bookable": true,
        "registerable": false,
        "title": "El Siglo de Oro",
        "sub_title": null,
        "description": null,
        "start_time": "2016-07-10T14:30:00+02:00",
        "vat_pct": 0,
        "discount": 0,
        "tax_included": true,
        "seats": {
            "min": 1,
            "max": 20,
            "booked": 0,
            "available": 20,
            "max_per_registration": null
        },
        "seatings": [
            {
                "blocked_seats": [1,2],
                "categories": [
                    {
                        "id": 1,
                        "title": "A",
                        "description": "",
                        "color_code": "#bdbdbd"
                    }
                ],
                "rows": [
                    {
                        "id": 1,
                        "title": "1"
                    }
                ],
                "seats": [
                    {
                        "id": 1,
                        "row_id": 1,
                        "category_id": 1,
                        "type_id": null,
                        "title": "A",
                        "description": null
                    },
                    {
                        "id": 2,
                        "row_id": 1,
                        "category_id": 1,
                        "type_id": 1,
                        "title": "A",
                        "description": null
                    }
                ],
                "types": [
                    {
                        "id": 1,
                        "title": "Rollstuhlplatz"
                    }
                ],
                "visual_url": "/api/v4/seatings/1.svg"
            }
        ],
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
If date is registerable and an authenticatable user has the permission, this attribute contains a link to the public
registration form.

### Response

The json response contains more attributes than in the overview:

- vat_pct (float), the pricing tax rate
- discount (integer), discount in percent (0-100) to apply on total price for this item if ordered
- tax_included (boolean), whether the tax (if any) is included or not

plus a block of attributes for available seats (see below) languages, location and prices.

### Seats

The seats block contains four attributes:

- min (integer), minimum number of seats to book
- max (integer), maximum number of seats to book
- booked (integer), number of seats already booked
- available (integer), number of seats still available to book
- max_per_registration (integer or null), if not null, number of seats max allowed to book per order

### Location

The location block provides information about the event starting/meeting point and address.

### Seatings

Events can contain additional data for seating plans.
If the `seatings` array contains data, specific seats must be referenced in the order item when ordering (see prices).

A visual seating plan is provided in the seatings data as well as all the information needed (categories, rows, types, seats, blocked seats and reservations) for providing your own visual representation, or seat selection widget.
The visual seating plan is a standardized SVG graphic for display and manipulation via Javascript.

### Prices

The prices block contains one ore more price objects in an array. There are two types of price objects for event date bookings:

default prices with three attributes:

- group (boolean), whether the price is for the whole group or per participant (per seat)
- optional (boolean), whether the price is a choice or not
- price_cents (integer) price in EUR cents

or scale prices with following attributes:

- scale_price_id (integer) internal database id for the scale price definition
- seat_category_id (integer) internal database id for the seat category definition (only for events with seating plan)
- seat_category_title (string) title or the seat category (only for events with seating plan)
- title (string) title of scale price, e.g. "regular fee" or "reduced fee"
- description (text) longer, more detailed description for the scale price
- group (boolean), whether the price is for the whole group or per participant (per seat)
- optional (boolean), whether the price is a choice or not
- price_cents (integer) price in EUR cents
- vat_pct (float), the pricing tax rate


Usually, there will be one default price or at least one scale price.


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

- start_at (`YYYY-MM-DD`), default to today
- end_at (`YYYY-MM-DD`), defaults to end of month

- per_page, defaults to system default (`25`)
- page, defaults to `1`

### Response

The json response contains a list of dates for all events as an array and a meta block.

## Date languages

The available languages for dates within the selection (same filters as in global dates list apply here)

`GET https://demo.gomus.de/api/v4/dates/languages`

```shell
curl "https://demo.gomus.de/api/v4/dates/languages"
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

The json response contains a list of all languages used by online bookable date to build up filters.


## Global events calendar

`GET https://demo.gomus.de/api/v4/calendar`

```shell
curl "https://demo.gomus.de/api/v4/calendar"
```

> The above command returns JSON structured like the single events calendar, but for all events.

The global calender provides a nice way to check whether dates are available for a day in range or not. With the default mode, the return value for each day in the specified range is a simple boolean.


### Available filters:

- by_museum_ids (Array of museum ids), filter by museums, see museums section
- by_exhibition_ids (Array of exhibition ids), filter by exhibitions, see exhibitions section
- by_event_ids (Array of event ids), filter by events
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

- start_at (`YYYY-MM-DD`), defaults to today
- end_at (`YYYY-MM-DD`), defaults to end of month
- depth: string, one of `any|all`, defaults to `any`

