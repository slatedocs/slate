---
title: go~mus Cash Point API Documentation

toc_footers:
  - <a href='https://gomus.de'>go~mus</a>
  - <a href='https://github.com/tripit/slate'>Documentation powered by Slate</a>

includes:
  - errors

search: true
---

# Preparation

Before you can use the go~mus Cash Point API you will have to register a cash point account with an API key. 
Please talk to your contact person in order to get access.

See [detailed documentation on Public API](/public_api.html) for information on how to request the basic data 
for events, tours and tickets.


# Orders

An order is the final result of a checkout process. An order can consist of tickets, events or tour bookings.

The server-side will do a final validation and return whether our order was successful.
In a success case a JSON with the valid order will be returned.

All orders placed by a cash point are assumed to be payed in place.

## Additional filters

The order endpoint for cash point users might configured with global access to all orders placed. To filter
for the orders placed by the cash point, the filter `only_my_orders` is provided:

- only_my_orders (boolean, true|false, default: all)

See [detailed documentation on Reseller API](/reseller_api.html) for information on how to create an order 
for events, tours and tickets against the orders end point.

# Bookings

The cash point is able to access the global booking lists to e.g. display a by day list or the booking
list for events.

## Event bookings

The bookings for event dates can be accessed via the date bookings endpoint:


`GET https://demo.gomus.de/api/v4/events/:event_id/dates/:date_id/bookings`

```shell
curl "https://demo.gomus.de/api/v4/events/123/dates/456/bookings"
```

> The above command returns JSON structured like this:


```json
{
    "bookings": [
        {
            "id": 1221,
            "comment": null,
            "customer": {
              ...
            },
            "institution": {
              ...
            },
            "status": 20,
            "seats": 2,
            "created_at": "2016-08-18T20:51:19+02:00",
            "canceled_at": null,
            "prices": [
                {
                    "title": "Preis",
                    "amount": 2,
                    "price_cents": 4,
                    "total_price_cents": 8
                }
            ]
        },
        {
            "id": 1222,
            "comment": "Hinweis für die Kasse",
            "customer": {},
            "institution": {},
            "status": 20,
            "seats": 4,
            "created_at": "2016-08-30T13:07:31+02:00",
            "canceled_at": null,
            "prices": [
                {
                    "title": "regulär",
                    "amount": 2,
                    "price_cents": 4,
                    "total_price_cents": 8
                },
                {
                    "title": "ermäßigt",
                    "amount": 2,
                    "price_cents": 3,
                    "total_price_cents": 6
                }
            ]
        },
        {
            "id": 1223,
            "comment": "Stornierung mit voller Gebühr",
            "customer": {
              ...
            },
            "institution": {
              ...
            },
            "status": 60,
            "seats": 2,
            "created_at": "2016-08-21T19:53:00+02:00",
            "canceled_at": "2016-08-30T13:21:58+02:00",
            "prices": [
                {
                    "title": "Storno-Preis",
                    "amount": 1,
                    "price_cents": 28,
                    "total_price_cents": 28
                }
            ]
        }
    ],
    "meta": {
        "total_count": 3,
        "page": 1,
        "per_page": 25
    }
}
```

The result contains an array of bookings and a meta object.

## Tour bookings

The cash point can access all individual tour bookings via the tours bookings endpoint.

### List of tour bookings

Provides a list of tour booking.


`GET https://demo.gomus.de/api/v4/tours/bookings`

```shell
curl "https://demo.gomus.de/api/v4/tours/bookings"
```

> The above command returns JSON structured like this:


```json
{
    "bookings": [
        {
            "id": 12344,
            "start_time": "2016-08-29T10:00:00+02:00",
            "duration": 60,
            "tour": {
                "tour_id": 100177,
                "title": "Gruppenanmeldung"
            },
            "comment_cash_point": "",
            "status": 20,
            "count_participants": 15,
            "customer": {
              ...
            },
            "institution": {
              ...
            },
            "created_at": "2016-04-28T13:03:30+02:00",
            "updated_at": "2016-04-28T13:07:02+02:00",
            "canceled_at": null
        },
        {
            "id": 12345,
            "start_time": "2016-08-29T10:00:00+02:00",
            "duration": 120,
            "tour": {
                "tour_id": 100178,
                "title": "Gruppenführung"
            },
            "comment_cash_point": "",
            "status": 50,
            "count_participants": 15,
            "customer": {
              ...
            },
            "institution": {
              ...
            },
            "created_at": "2016-04-28T13:05:40+02:00",
            "updated_at": "2016-08-19T12:07:04+02:00",
            "canceled_at": "2016-08-19T12:06:54+02:00"
        }
    ]
}
```
### Available filters:

- by_museum_ids (Array of museum ids), filter by museums, see museums section
- by_exhibition_ids (Array of exhibition ids), filter by exhibitions, see exhibitions section
- by_tour_ids (Array of tour ids), filter by tour, see tours section
- by_categories (Array of category names), filter by categories, see categories section
- by_status_ids (Array, any of BOOKED=20, CANCELED=50, FINISHED=25)

  
### Available parameters:

- start_at, order date (`YYYY-MM-DD`), defaults to beginning of today
- end_at, order date (`YYYY-MM-DD`), defaults to end of today
- per_page, defaults to system default (`25`)
- page, defaults to `1`

### Response

The json response contains a list of existing bookings as an array and a meta block.

- id (integer), the unique database id of the booking
- start_time (iso8601), the booking's timestamp
- duration (integer), duration in minutes
- tour (object), contains information about the bookings tour

- customer (object)
- institution (object)

- comment_cash_point (string)

- status (string)
- count_participants (string)

### Details of a tour booking

Provides details for a single tour booking.


`GET https://demo.gomus.de/api/v4/tours/bookings/:id`

```shell
curl "https://demo.gomus.de/api/v4/tours/bookings/1"
```

```json
{
    "booking": {
        "id": 12345,
        "start_time": "2016-08-29T10:00:00+02:00",
        "duration": 60,
        "tour": {
            "tour_id": 100177,
            "title": "Gruppenanmeldung"
        },
        "comment_cash_point": "",
        "status": 20,
        "count_participants": 15,
        "customer": {
          ...
        },
        "institution": {
          ...
        },
        "created_at": "2016-04-28T13:03:30+02:00",
        "updated_at": "2016-04-28T13:07:02+02:00",
        "canceled_at": null,
        "prices": [
            {
                "id": 9997,
                "booking_id": 12345,
                "title": "Entgelt",
                "description": "Gruppenpreis",
                "amount": 1,
                "price_cents": 0,
                "total_price_cents": 0,
                "type": "fee",
                "created_at": "2016-04-28T13:04:17+02:00"
            },
            {
                "id": 9998,
                "booking_id": 12345,
                "title": "Zusätzlicher Pauschalpreis",
                "description": "ein zusätzlicher Pauschalpreis",
                "amount": 1,
                "price_cents": 9000,
                "total_price_cents": 9000,
                "type": "custom",
                "created_at": "2016-04-28T13:04:17+02:00"
            }
        ]
    }
}

```

### Response

The json response contains details for a booking like in the list view, but with a few additional information.

- prices: an array of price objects, containing both default and custom booking prices.

...

## Changing prices

It is possible to add and update custom booking prices unless the booking has been payed already. It is not possible 
to change the default prices but e.g. give a discount and add additional custom items.

Note that the cash point has only access to customer booking prices and can change only custom type prices.

### Adding prices

Custom customer prices can be added like this:

`POST https://demo.gomus.de/api/v4/tours/bookings/:booking_id/prices`

> Write definition of order into /tmp/prices.json before executing shell command.

```shell
curl "https://demo.gomus.de/api/v4/tours/bookings/1/prices"
    -XPOST --data "@/tmp/prices.json"
    -H "Content-Type: application/json"
    -H "Authorization: Bearer meowmeowmeow"
```

> The above command assumes the prices.json JSON is structured like this:

```json
  {
     "prices": [
         {
             "title": "Zusätzlicher Pauschalpreis",
             "description": "ein zusätzlicher Pauschalpreis",
             "amount": 1,
             "price_cents": 9000
         },
         {
             "title": "Zusätzliche Audioguides",
             "description": "zusätzliche Audioguides",
             "amount": 3,
             "price_cents": 500
         }
     ]
 }
```

The response will contain a http ok or an error.

### Updating prices

Custom prices can be updated like this:

`PUT https://demo.gomus.de/api/v4/tours/bookings/:booking_id/prices/:id`

> Write definition of order into /tmp/price_update.json before executing shell command.

```shell
curl "https://demo.gomus.de/api/v4/tours/bookings/1/prices/9998"
    -XPUT --data "@/tmp/price_update.json"
    -H "Content-Type: application/json"
    -H "Authorization: Bearer meowmeowmeow"
```

> The above command assumes the price_update.json JSON is structured like this:

```json
{
    "price":
        {
            "title": "Pauschalpreis Update",
            "description": "hab mich vertippt",
            "amount": 1,
            "price_cents": 8000
       }
}
```
The response will contain the updated price object or an error.

### Deleting prices

A custom price can be updated like this:

`DELETE https://demo.gomus.de/api/v4/tours/bookings/:booking_id/prices/:id`


```shell
curl "https://demo.gomus.de/api/v4/tours/bookings/1/prices/9998"
    -XDELETE
    -H "Content-Type: application/json"
    -H "Authorization: Bearer meowmeowmeow"
```


The response will contain a http ok or an error.

## Giving feedback

The cash point is able to set a feedback for a tour booking, e.g. if it took place, how many participants took part
and a generic comment.

### Setting feedback

`PUT https://demo.gomus.de/api/v4/tours/bookings/:id/feedback`

> Write definition of order into /tmp/feedback.json before executing shell command.

```shell
curl "https://demo.gomus.de/api/v4/tours/bookings/1/feedback"
    -XPUT --data "@/tmp/feedback.json"
    -H "Content-Type: application/json"
    -H "Authorization: Bearer meowmeowmeow"
```

> The above command assumes the prices.json JSON is structured like this:

```json
{
	"feedback":
		{
			"comment": "eine tolle Führung, der Kunde war sehr zufrieden!",
			"participants": "25",
			"took_place": "true"
		}
}
```

The response will contain the feedback or an error.

### Getting feedback

Custom prices can be updated like this:

`GET https://demo.gomus.de/api/v4/tours/bookings/:id/feedback`

```json
{
    "feedback": {
        "took_place": true,
        "comment": "eine tolle Führung, der Kunde war sehr zufrieden!",
        "participants": 25,
        "updated_at": "2016-08-30T09:35:17+02:00"
    }
}
```
The response will contain the current feedback.

### Clearing feedback

The feedback can be cleared like this:

`DELETE https://demo.gomus.de/api/v4/tours/bookings/:id/feedback`


```shell
curl "https://demo.gomus.de/api/v4/tours/bookings/:id/feedback"
    -XDELETE
    -H "Content-Type: application/json"
    -H "Authorization: Bearer meowmeowmeow"
```


The response will contain a http ok or an error.