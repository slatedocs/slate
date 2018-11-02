---
title: go~mus Reseller API Documentation

toc_footers:
  - <a href='https://gomus.de'>go~mus</a>
  - <a href='https://github.com/tripit/slate'>Documentation powered by Slate</a>

includes:
  - v4/reservations
  - errors

search: true
---

# Preparation

Before you can use the go~mus reseller API to create valid orders, you will have to register a user account with an API key. Please talk to your contact person in order to get access.

<aside class="success">
Remember — a happy api user is an authenticated api user!
</aside>


See [detailed documentation on Public API](/public_api.html) for information on how to request the basic data for events, tours and tickets.


# Orders

An order is the final result of a checkout process, e.g. like in normal online shops. Every ticket sale or event booking is wrapped into items in a cart and sent to the server for validation.

The server-side will do a final validation and return whether our order was successful.
In a success case a JSON with the valid order will be returned.

Note: the payment handling, including access to third party tools, might differ depending on your API plan.


## List of exisiting orders

Existing orders in your account can be accessed at the orders index endpoint:

`GET https://demo.gomus.de/api/v4/orders`

```shell
curl "https://demo.gomus.de/api/v4/orders"
    -H "Authorization: Bearer meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
{
    "orders": [
        {
            "id": 3944805,
            "token": "Aniq532VCewghH2mUtEnng",
            "is_valid": true,
            "total_price_cents": 4500,
            "comment": null,
            "reference": null,
            "rating": null,
            "invoice": false,
            "created_at": "2016-03-28T22:17:46+02:00",
            "items": [ ... ]
        }
  ],
  "meta": {
    "total_count": 1,
    "page": 1,
    "per_page": 25
    }
}
```

### Available parameters:

- start_at, order date (`YYYY-MM-DD`), defaults to today
- end_at, order date (`YYYY-MM-DD`), defaults to today
- per_page, defaults to system default (`25`)
- page, defaults to `1`

### Response

The json response contains a list of existing orders as an array and a meta block.

- id (integer), the unique database id of the order
- token (string), a unique token of the order, see more at the documents section
- is_valid (boolean), whether the order is valid or not
- total_price_cents (integer), the total amount of the order in EUR cents (mind the discounts for each item)
- comment (text), a comment, defined on creation
- reference (text), reference field, can be used for advertising
- rating (integer), a simple amazon style rating value
- invoice (boolean), whether an invoice is available or not
- created_at (date), timestamp on creation
- items (array), list of order items, see order items section

## Details of a single order

`GET https://demo.gomus.de/api/v4/orders/:id`

```shell
curl "https://demo.gomus.de/api/v4/orders/1"
    -H "Authorization: Bearer meowmeowmeow"
```

> The above command returns JSON structured like a single element of the orders array from the order list but with two additional keys:

```json
{
    "order": {
        ...

        "payment_status": 30,
        "billing_address_id": 378542,

        ...
    }

}
```


### Response

- payment_status (integer), if using a payment provider, the status is set by the provider. Usualy not in use for resellers.
- billing_address_id (integer), reference to an address dataset. Not in use right now, but in future versions of th API resellers might be able to use several adresses for one account.


## Find single order by barcode

`GET https://demo.gomus.de/api/v4/orders/barcode/:barcode`

```shell
curl "https://demo.gomus.de/api/v4/orders/barcode/704323341"
    -H "Authorization: Bearer meowmeowmeow"
```

> The above command returns JSON structured just like the details of a single order.

### Barcodes

The barcode may belong to any item that is contained in the order.




## Documents

Each order item has a pdf document containing the relevant information according to the item type. Ticket item pdfs contain the tickets: one per page. Event and tour items have a pdf containing the booking confirmation.

These are available to download if the order `is_valid` and if there is a `token` present.

Some orders may have an invoice available (indicated by the `invoice` attribute in the order).

Some orders may have passbooks for tickets available (indicated by the `passbooks` attribute in the ticket sale in order).

Due to the token confirmation, authentication via header request is not needed for the document requests.

### Tickets

`GET https://demo.gomus.de/api/v4/orders/:order_id/tickets/:ticket_id.pdf?token=:token`

- ticket_id means the uniq ticket sale id (order -> order item -> ticket sale)

### Passbooks

`GET https://demo.gomus.de/api/v4/orders/:order_id/tickets/:ticket_id/passbooks/:barcode.pkpass?token=:token`

- ticket_id means the uniq ticket sale id (order -> order item -> ticket sale)
- barcode means the uniq barcode for each item within a ticket sale (order -> order item -> ticket sale -> barcodes)

### Events

`GET https://demo.gomus.de/api/v4/orders/:order_id/events/:event_id.pdf?token=:token`

- event_id means the uniq event booking id (order -> order item -> event booking)

### Tours

`GET https://demo.gomus.de/api/v4/orders/:order_id/tours/:tour_id.pdf?token=:token`

- tour_id means the uniq tour booking id (order -> order item -> tour booking)

### Invoice

`GET https://demo.gomus.de/api/v4/orders/:order_id/invoice.pdf?token=:token`


# Order Items

In both list and detailed view the response contains an array of `items`. Each item can be one of Ticket, Event or Tour with a slightly different structure.

Each item contains generic attributes like

- id (integer), the uniq database id of the order item
- type (string), the type of item, can be one of "Ticket", "Event", or "Tour"
- price_cents (integer), price of the item in EUR cents
- vat_pct (float), the item tax rate
- tax_included (boolean), whether the tax (if any) is included in price_cents or not

and the specific attributes block, which is different for every type.

## Ticket Item

> a single ticket type item in the order items array looks like this:

```json
{
    "id": 52397,
    "type": "Ticket",
    "price_cents": 1400,
    "vat_pct": "0.0",
    "tax_included": true,
    "attributes": {
        "id": 42102,
        "title": "El Siglo de Oro mit Gemäldegalerie regulär",
        "ticket_id": 247,
        "quantity": 1,
        "ticket_type": "time_slot",
        "start_time": "2016-09-14T15:00:00+02:00",
        "location": {
            "name": "Gemäldegalerie",
            "city": "Berlin",
            "country": "Deutschland",
            "street": "Matthäikirchplatz",
            "zip": "10785",
            "latitude": 52.5082,
            "longitude": 13.3673
        },
        "barcodes": [
            {
                "id": 97633,
                "barcode": "4034210297633-5",
                "method": "ean"
            }
        ],
        "after_sale_information": null
    }
}
```


### Attributes

Each ticket type item contains attributes like

- id (integer), the uniq database id of this ticket sale
- title (string), the title of the parent ticket
- ticket_id (integer), the database parents ticket id
- quantity (integer)
- ticket_type (string), the type of ticket
- start_time (iso8601), the start time of the ticket
- after_sale_information (text), text containing information for the customer after sale

plus two attribute blocks for the location and the barcodes.

### Location

The location is provided as street adress and geo-coordinates. Mind that most museums have no house number.

### Barcodes

Each ticket sale will a have one barcode per quantity. Each barcode can be validated and devalued separately.

The barcodes are supposed to be printed on paper. One barcode per sheet.


#### Note for tickets to attractions of the "Staatlichen Museen zu Berlin":

The barcodes need to be encoded as [CODE 39](https://en.wikipedia.org/wiki/Code_39), so that they can be scanned.
Please pay special attention to the required quiet zone and minimal size requirements. You may find an example printout [here](/images/ticket-pdf-example.pdf).

## Event Item

> a single event type item in the order items array looks like this:

```json
{
    "id": 52399,
    "type": "Event",
    "price_cents": 2000,
    "vat_pct": "0.0",
    "tax_included": true,
    "attributes": {
        "id": 6127,
        "date_id": 22977,
        "event_id": 101174,
        "start_time": "2016-07-09T14:30:00+02:00",
        "title": "El Siglo de Oro",
        "quantity": 5,
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


### Attributes

Each event type item contains attributes like

- id (integer), the uniq database id of this event date booking
- title (string), the title of the event
- event_id (integer), the database id of the event
- date_id (integer), the database id of the specific date for this event
- start_time (iso8601), the date's timestamp
- quantity (integer), if the event has a simple price configuration, this represents the seat count

plus attribute blocks for the location and quantities, if price configuration is complex (scale prices)

### Location

The location is provided as street adress and geo-coordinates. Mind that most museums have no house number.

## Tour Item

> a single tour type item in the order items array looks like this:

```json
{
    "id": 56398,
    "type": "Tour",
    "price_cents": 9000,
    "vat_pct": "0.0",
    "tax_included": true,
    "attributes": {
        "id": 27079,
        "title": "El Siglo de Oro | Gruppenführung",
        "tour_id": 101173,
        "start_time": "2016-07-24T12:00:00+02:00",
        "participants": 12,
        "language": "Deutsch",
        "age_group": "Erwachsene",
        "prices": [
            {
                "title": "Entgelt",
                "description": "Gruppenpreis",
                "total_price_cents": 9000,
                "quantity": 1,
                "price_cents": 9000
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
         }
    }
}
```


### Attributes

Each event type item contains attributes like

- id (integer), the uniq database id this event booking
- title (string), the title of the event
- tour_id (integer), the database id of the tour
- start_time (iso8601), the timestamp for the tour
- participants (integer)
- language (string)
- age group_(string)

plus attribute blocks for the location and prices

### Location

The location is provided as street adress and geo-coordinates. Mind that most museums have no house number.

### Prices

The price of a tour booking depends on several pricing factors like surcharges and other fees. The `prices` array holds all single price items which are summed up to the order items `price_cents` total.

### Equipments

The tour item may contain an additional block for booking equipment at the **same** start time:

```json
    equipment: [
      {
        id: 1,
        quantity: 3
      }
    ]
```

# Creating an Order

An order is created by a POST request to the orders endpoint:

`POST https://demo.gomus.de/api/v4/orders`

There can be only one order per request. One order can contain several items (tickets, tour bookings and event bookings)

A final validation check will be made on the server. Either all order items are bought or none.
In case of errors you will get error messages back as a response.

> Write definition of order into /tmp/order.json before executing shell command.

```shell
curl "https://demo.gomus.de/api/v4/orders"
    -XPOST --data "@/tmp/order.json"
    -H "Content-Type: application/json"
    -H "Authorization: Bearer meowmeowmeow"
```

> The above command assumes the order.json JSON is structured like this:

```json
{
  "comment": "Please send fast!",
  "reference": "bought you by the awesome tourist gmbh!",
  "items": [
    ...
  ],
  "total": 1400
}
```

### Required attributes

- comment (text), your comment, not readable on confirmation documents
- reference (text), your reference, readable on confirmation documents
- items (array), list of item configurations
- total (integer), the sum of all item prices. This ensures that the server and the client calculate the same price.

## Items

A valid order needs at least one valid item. One item can either be a ticket sale, an event booking or a tour booking.

An item has two major attributes:

- type (text), one of "Ticket", "Event", or "Tour"
- attributes (hash), a set of attributes specific to the item type

### Ticket


> a single item holding a ticket sale is structured like this:


```json
{
    "type": "Ticket",
    "attributes": {
        "id": 247,
        "quantity": 1,
        "time": "2016-07-07T13:00:00+02:00",
        "reservations": ["8CE0mEgjyAvQB1IbPJ4iyg"],
        "attendees":[
          {
            "name":"Capt'n",
            "surname":"Hook"
          },
          {
            "name":"Peter",
            "surname":"Pan"
          }
        ]
        
    }
}
```


A ticket item has a fairly simple structure:

- id (integer), the tickets id, see ticket section in public api
- quantity (integer), a count > 0
- time (iso8601), the entry timestamp
- reservations (array of tokens), if any (see Tickets -> Reservations for more info)
- attendees (array of objects), needs to be set on purchase when ticket's attendees are required. Attendees require a name and surname. Number of attendees needs to match the ticket sales quantity. 


### Event

> a single item holding an event booking is structured like this:


```json
{
    "type": "Event",
    "attributes": {
        "id": 28227,
        "quantity": 5
    }
}
```

> or with several price options:

```json
{
    "type": "Event",
    "attributes": {
        "id": 28227,
        "quantities": {
            "1": 2,
            "4": 3
        }
    }
}
```

> or with specific seating options:

```json
{
    "type": "Event",
    "attributes": {
        "id": 28227,
        "seats": [
          {
            "seat_id": 22,
            "scale_price_id": 33
            
          },
          {
            "seat_id": 23,
            "scale_price_id": 33
          }
        
        ]
    }
}
```

An event item has a similar structure:

- id (integer), the events date id, see event section in public api

If the event only has one price, the quantity key is used.

- quantity (integer), a count > 0

However, if the event has scale pricing, then the quantities key is used instead:

- quantities (object), the scale price id as the key, and the quantity as the value.

If the event contains seatings, the strucuture has to contain info about the specific seats:

- seat_id (integer), id of the specific seat
- scale_price_id (integer), id of the scale price


### Tour

> a single item holding a tour booking is structured like this:


```json
{
    "type": "Tour",
    "attributes": {
        "id": 28227,
        "start_time": "2016-07-07T13:00:00+02:00",
        "language_id": 1,
        "age_group_id": 3,
        "quantity": 5,
        "surcharges": {
            "1": 2,
            "4": 3
        }
    }
}
```

> or with several price options:

```json
{
    "type": "Tour",
    "attributes": {
        "id": 28227,
        "start_time": "2016-07-07T13:00:00+02:00",
        "language_id": 1,
        "age_group_id": 3,
        "quantities": {
            "1": 2,
            "4": 3
        },
        "surcharges": {
            "1": 2,
            "4": 3
        }
    }
}
```

A tour item extends the structure of events:

- id (integer), the tour id, see tour section in public api
- surcharges (object), the surcharge id as the key, and the quantity as the value
- start_time (iso8601), the entry timestamp
- language_id (reference)
- age_group_id (reference)

If the tour only has one price, the quantity key is used.

- quantity (integer), a count > 0

However, if the tour has scale pricing, then the quantities key is used instead:

- quantities (object), the scale price id as the key, and the quantity as the value

Surcharge configuration must be provided if tour is configured with surcharges (see tour section in the public api). The surcharge configuration is validated on server side.

Note: the quantity or sum of quantities represents the number of participants (people in group)



# Combined Tickets

In special cases a museum may offer a combined ticket that includes multiple sub tickets. The sub tickets may have individual separate time slots.

A public example are the Pergamon + Panorama Tickets by the Staatliche Museen zu Berlin.


## Example Pergamon + Panorama SMB

The following example uses the public API of smb to show a step by step guide on how to order combined tickets. The following data was taken from the live instance on 1. Nov 2018. The data may look different at a later date.

### 1. Query ticket list as usual

GET https://smb.gomus.de/api/v4/tickets?valid_at=2018-11-20

One of the available tickets is:

```json
{id: 514, title: "Pergamonmuseum + Das Panorama | regulär", ticket_type: "time_slot", bookable: true, ...}
```

### 2. Reading details of main ticket

GET https://smb.gomus.de/api/v4/tickets/514

```json
{
    ...
    price_cents: 1900,
    quota_ids: [98],
    sub_ticket_ids: [515, 516],
    ...
}
```

In the ticket details we can see that this tickets has two sub tickets. 
The sub tickets will refer to the individual entry locations and will later have two individual time slots.

The main ticket itself contains the price, 19 € in our example.

Also take note that the main ticket also has a quota, in order to buy the ticket, all ticket quotas need be available, main and sub tickets.

### 3. Reading details of sub tickets 

GET https://smb.gomus.de/api/v4/tickets/515
GET https://smb.gomus.de/api/v4/tickets/516

```json
{id: 515, title: "Subticket Pergamonmuseum", is_sub_ticket: true, price_cents: 0, quota_ids: [37], ticket_type: "time_slot", ...}
```
```json
{id: 516, title: "Subticket Das Panorama", is_sub_ticket: true, price_cents: 0, quota_ids: [99], ticket_type: "time_slot", ...}
```

Both sub tickets have no price. The price is handled in the main ticket.

But both tickets reference a quota. Both quotas need be available.

### 4. Reading capacities

GET https://smb.gomus.de/api/v4/tickets/515/capacity?date=2018-11-20
GET https://smb.gomus.de/api/v4/tickets/516/capacity?date=2018-11-20

We assume that you already checked the availability of the main ticket and will only look at the sub tickets in the following explanation.

```json
{
    2018-11-20T10:00:00+01:00: 46,
    2018-11-20T10:30:00+01:00: 46,
    2018-11-20T11:00:00+01:00: 32,
    2018-11-20T11:30:00+01:00: 37,
    2018-11-20T12:00:00+01:00: 37,
    2018-11-20T12:30:00+01:00: 33,
    2018-11-20T13:00:00+01:00: 37,
    2018-11-20T13:30:00+01:00: 35,
    2018-11-20T14:00:00+01:00: 34,
    2018-11-20T14:30:00+01:00: 37,
    2018-11-20T15:00:00+01:00: 35,
    2018-11-20T15:30:00+01:00: 37,
    2018-11-20T16:00:00+01:00: 37,
    2018-11-20T16:30:00+01:00: 37,
    2018-11-20T17:00:00+01:00: 37
}
```

You will need to select one time slot for the first ticket and another time slot for the second ticket.

For example we could select:

- Ticket 515: 2018-11-20T12:30:00+01:00
- Ticket 516: 2018-11-20T14:00:00+01:00

***Attention: In SMB the time slot have to be 90 minutes apart.***

You are free to decide which ticket should get the first time slot. It might be good to let the customer decide where he wants go first.

In our example the customer will go first to "Pergamonmuseum" and then to "Das Panorama".


### 5. Creating the order

See the sections above for reference on how to create an order.

Here we will detail how the ticket attributes are structured inside an order request when buying an combined ticket.

```json
{
    "type": "Ticket",
    "attributes": {
        "id": 514,
        "quantity": 1,
        "time": "2018-11-20T12:30:00+01:00",
        "sub_ticket_times": {
          "515": "2018-11-20T12:30:00+01:00",
          "516": "2018-11-20T14:00:00+01:00"
        }
    }
}
```

Take note that we

1. send an attributes hash that references the main ticket.
1. we need to set a time for the main ticket. It is best practice to set this to the earliest time slot that we also use in sub tickets.
1. we set the times for the sub tickets in the field `sub_ticket_times`. These are the entry times that we selected in step 4.

You can also set `reservations` or `attendees` fields in the attributes hash as normal. We omitted them here for brevity.


### 6. Handling of barcodes in order result

After you have created the order you will get back a normal order response as was detailed in the sections above.

Of special notice are two things, first you will get a single barcode for the main ticket. This ticket barcode can be used in all entry locations.

```
        "barcodes": [
            {
                "id": 97633,
                "barcode": "4034210297633-5",
                "method": "ean"
            }
        ],
```       

And second, it is best practice to print the individual sub ticket times on the ticket PDF that customers will receive.

The sub ticket times will be checked on entry and customer confusion may result if these are not clearly communicated.


## Looking at an online example of combined tickets

You can look at the official online shop implementation of Staatliche Museen zu Berlin in order to better understand how to structure queries and how to implement an UI for time slot selection in combined tickets.

Make sure to select 2018-11-20 or a later date when looking for combined Pergamon + Panorama tickets.

https://shop.smb.museum/#/tickets/list?date=2018-11-20        