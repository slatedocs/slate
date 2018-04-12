# Tickets

Provides information about the online bookable tickets

## List of tickets

`GET https://demo.gomus.de/api/v4/tickets`

```shell
curl "https://demo.gomus.de/api/v4/tickets"
```

> The above command returns JSON structured like this:

```json
{
    "tickets": [
        {
        "id": 247,
        "title": "El Siglo de Oro mit Gemäldegalerie regulär",
        "ticket_type": "time_slot",
        "bookable": true,
        "museum_ids": [
            20
        ],
        "exhibition_ids": [
            2057,
            33
        ],
        "price_cents": 1400,
        "discount": 0,
        "vat_pct": 0,
        "tax_included": true,
        "entry_duration": 30,
        "min_persons": 0,
        "max_persons": 100,
        "quota_ids": [
            19
        ],
        "first_entry": 660,
        "last_entry": 990,
        "personalizeable": false,
        "attendees": "required",
        "identification": false
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
- by_ticket_ids (Array of ticket ids), filter by specific tickets
- by_museum_ids (Array of museum ids), filter by museums, see museums section
- by_exhibition_ids (Array of exhibition ids), filter by exhibitions, see exhibitions section
- by_bookable (Boolean, true|false, default: all), filter by general bookability for current account (or public)
- by_ticket_type, (String) (annual, time_slot, normal, default: all but annual)
- by_ticket_types, (Array of annual, time_slot, normal, default: all but annual)
  
### Available parameters:

- valid_at (`YYYY-MM-DD`), defaults to today
- per_page, defaults to system default (`25`)
- page, defaults to `1`

### Response

The json response contains a list of tickets as an array and a meta block.

- id (integer), the unique database id of the ticket
- title (string), the name of the ticket
- description (text), a more descriptive name
- ticket_type, either `"day_ticket"` or `"time_slot"`
- bookable (boolean), if the ticket is bookable within your authentication type
- museum_ids, array of museum ids to which the ticket belongs, can be empty
- exhibition_ids, array of exhibition ids to whick the ticket belongs, can be empty
- quota_ids, array of quota ids to which the ticket belongs, can be empty
- price_cents (integer), price of the ticket in EUR cents
- discount (integer), discount in percent (0-100) to apply on total price for this item if ordered
- vat_pct (float), the tickets tax rate
- tax_included (boolean), whether the tax (if any) is included in price_cents or not
- first_entry (integer), first possible entry in minutes from beginning of day, can be combined with `valid_at` parameter
- last_entry (integer), last possible entry in minutes from beginning of day, can be combined with `valid_at` parameter
- entry_duration (integer), if ticket type is a time slot, the slot duration in minutes, else null
- min_persons (integer), minimum quantity to buy per order
- max_persons (integer), maximum quantity to buy per order
- personalizeable (boolean), weather the ticket can be personalised (e.g. annual tickets)
- attendees (string), when required, the attendees needs to be set on purchase
- identification (string), info attribute for entry system to require manual identification document (e.g. for reduced tickets)

## Details of single ticket

`GET https://demo.gomus.de/api/v4/tickets/:id`

```shell
curl "https://demo.gomus.de/api/v4/tickets/1"
```

> The above command returns JSON structured like this:

```json
{
    "ticket": {
        "id": 247,
        "title": "El Siglo de Oro mit Gemäldegalerie regulär",
        "sub_title": null,
        "description": "...",
        "ticket_type": "time_slot",
        "bookable": true,
        "museum_ids": [
            20
        ],
        "exhibition_ids": [
            2057,
            33
        ],
        "quota_ids": [
            19
        ],
        "price_cents": 1400,
        "vat_pct": 0,
        "discount": 0,
        "tax_included": true,
        "first_entry": 660,
        "last_entry": 990,
        "entry_duration": 30,
        "min_persons": 0,
        "max_persons": 100,
        "after_sale_information": null,
        "content": {
            "shop_title": "Best ticket in the world",
            "shop_sub_title": "",
            "shop_description": ""
        },
        "personalizeable": false,
        "attendees": "required",
        "identification": false,
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
### Available parameters:

- valid_at (`YYYY-MM-DD`), defaults to today

### Response

The json response contains a ticket block with information for that the information is the same as that of the tickets list response, but with the addition of a couple of keys.

- after_sale_information (string), information to be shown after the sale of a ticket. Can contain html elements.
- location, contains information about the location of the museum that the ticket belongs to.
- content contains dynamic multi locale information


## Capacities of a ticket

A ticket has one or more capacities. Each capacity is the maximum bookable quantity of the ticket for a specific range of time.

`GET https://demo.gomus.de/api/v4/tickets/:id/capacity`

```shell
curl "https://demo.gomus.de/api/v4/tickets/1/capacity"
```

> The above command returns JSON structured like this:

```json
{
    "data": {
        "2016-07-06T11:00:00+02:00": 15,
        "2016-07-06T11:30:00+02:00": 21,
        "2016-07-06T12:00:00+02:00": 16,
        "2016-07-06T12:30:00+02:00": 21,
        "2016-07-06T13:00:00+02:00": 21,
        "2016-07-06T13:30:00+02:00": 21,
        "2016-07-06T14:00:00+02:00": 20,
        "2016-07-06T14:30:00+02:00": 21,
        "2016-07-06T15:00:00+02:00": 21,
        "2016-07-06T15:30:00+02:00": 21,
        "2016-07-06T16:00:00+02:00": 21
    }
}

```

Using the json response on the right as an example, between 11.00 and 11.30 on the 6th July 2016,
the maximum bookable quantity is 15. If only one available time slot is returned, as is the case for day
tickets, the time range is up untill the end of the day.

### Available parameters:

- date (`YYYY-MM-DD`), defaults to today
- reservations, defaults to none

### Response

The json response contains a data block of available time slots and capacities as a hash (key/value pairs). For day tickets, the first possible entry will be returned.

The capacity check takes all quotas that the ticket belongs to into account. Zero values are not returned.

### Reservations

Provide an array of reservation tokens to be considered in calculation


## Calendar - for tickets

The ticket calender contains information about the generic bookablility of tickets - a very fast and easy way to detect if there is anything bookable in a larger timeframe.

`GET https://demo.gomus.de/api/v4/tickets/calendar`

```shell
curl "https://demo.gomus.de/api/v4/tickets/calendar"
```

> The above command returns JSON structured like this (with `depth=any`, the default):

```json
{
    "data": {
        "2016-05-27": false,
        "2016-05-28": false,
        "2016-05-29": false,
        "2016-05-30": true,
        "2016-05-31": true
    }
}

```

> Example output with `depth=all`:

```json
{
    "data": {
        "2016-07-06": [
            {
                "quota": {
                    "id": 3,
                    "tickets": [
                        261,
                        262,
                        263,
                        264,
                        265,
                        266
                    ],
                    "capacities": [
                        {
                        "2016-07-06 11:00:00 +0200": 100
                        }
                    ]
                }
            }
        ]
    }
}

```

### Available filters:

- by_ticket_ids (Array of ticket ids), filter by specific tickets
- by_museum_ids (Array of museum ids), filter by museums, see museums section
- by_exhibition_ids (Array of exhibition ids), filter by exhibitions, see exhibitions section
- by_bookable (Boolean, true|false, default: all), filter by general bookability for current account (or public)
- by_ticket_type, (String) (annual, time_slot, normal, default: all but annual)
- by_ticket_types, (Array of annual, time_slot, normal, default: all but annual)
  
  
### Available parameters:

- start_at (`YYYY-MM-DD`), defaults to today
- end_at (`YYYY-MM-DD`), defaults to end of month
- depth: string, one of `any|all`, defaults to `any`
- reservations, array of reservations made before, defaults to none

### Response

The `depth` parameter defines the depth of search and the amount of detail in the result. On `any` the search will quit the loop for each day as soon as a bookable ticket is found and will provide a boolean (true or false) for the bookability as the result. This is a lot faster than the `all` mode, where the result is an array of `quota` objects and the relevant capacity information.

The maximum time frame is 31 days.

### Reservations

Provide an array of reservation tokens to be considered in calculation

## Capacities for a set of tickets

A ticket has one or more capacities. Each capacity is the maximum bookable quantity of the ticket for a specific
range of time.

`GET https://demo.gomus.de/api/v4/tickets/capacities`

```shell
curl "https://demo.gomus.de/api/v4/tickets/capacities"
```

> The above command returns JSON structured like this:


```json
{
    "data": {
        "19": {
            "tickets": [
                247,
                248
            ],
            "capacities": {
                "2016-07-06T16:15:00+02:00": 30,
                "2016-07-06T16:20:00+02:00": 30,
                "2016-07-06T16:25:00+02:00": 30,
                "2016-07-06T16:30:00+02:00": 0
            }
        },
        "20": {
            "tickets": [
                248
            ],
            "capacities": {
                "2016-07-06T16:15:00+02:00": 15,
                "2016-07-06T16:20:00+02:00": 15,
                "2016-07-06T16:25:00+02:00": 15,
                "2016-07-06T16:30:00+02:00": 0
            }
        }
    }
}
```
Tickets are assigned to (one or multiple) quotas and reduce each others capacity when ordered. As a result,
capacity calculation becomes a little more complicated.

For a single ticket the capacities are calculated for you, see the capacities of a ticket section above.
For multiple tickets however, to avoid requesting new capacities for each quantity update, we provide the
quota ids so that the new ticket capacities can be calculated in the browser.

For example, if two tickets reside in the same quota which has a capacity of 10 for a specific time,
if 2 of one ticket is selected only 8 are available for the other.

Note that for a set of tickets with each different entry durations the greatest common divisor of all entry
durations is used as step size for the capacity time slots. If this is the case, you need to ensure you set
the time for the ticket to a valid value (first_entry + n * entry_duration). For day tickets you need to set
first_entry as time of booking.

### Distinguishing unavailable and sold out tickets.

An array of total capacities is returned that reflect the total configured capacity for a timeslot ignoring any sales. This information can be used to determine whether a ticket was available but is sold out or whether a ticket did not have any capacity in the first place.

```json
{
    "data": {
        "19": {
            "tickets": [
                247,
                248
            ],
            "capacities": {
                "2016-07-06T16:15:00+02:00": 0,
                "2016-07-06T16:20:00+02:00": 0,
                "2016-07-06T16:25:00+02:00": 0,
                "2016-07-06T16:30:00+02:00": 0
            },
            "total_capacities": {
                "2016-07-06T16:15:00+02:00": 30,
                "2016-07-06T16:20:00+02:00": 30,
                "2016-07-06T16:25:00+02:00": 30,
                "2016-07-06T16:30:00+02:00": 30
            }
        },
    }
}
```

In general tickets that do not have a defined total capacity can be excluded from display.

### Necessary parameters:

- ticket_ids (Array of ticket ids)

### Available parameters:

- date (`YYYY-MM-DD`), defaults to today
- reservations, array of reservations made before, defaults to none

### Response

The response is a data block, which contains a hash with quota ids as keys, a list of ticket ids affected by the quota (as a subset of the query) and a list of (still available) capacities as well as the total capacities.

Note that the ticket response block may not contain all of your requested ticket ids. It only contains tickets bookable for your current user.

### Reservations

Provide an array of reservation tokens to be considered in calculation
