---
title: go~mus API Documentation

language_tabs:
  - shell

toc_footers:
  - <a href='https://gomus.de'>go~mus</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---


# Introduction

Welcome to the go~mus API! You can use our API to access go~mus API endpoints, which can get information on various museums, exhibitions, products and tickets in our database.

We have examples using curl! You can view code examples in the dark area to the right.


# Preparation

Before you can use the go~mus API, you will have to register a user account with an API key. Please talk to your contact person in order to get access.


# Authentication

> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: Bearer meowmeowmeow"
```

> Make sure to replace `meowmeowmeow` with your API key.

go~mus expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: Bearer meowmeowmeow`

<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside>



# Tickets

First you will probably want to get all online sellable tickets.

## Get All Tickets

```shell
curl "https://smb-staging.gomus.de/api/v3/tickets"
  -H "Authorization: Bearer meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
{
    "tickets": [
        {
            "after_sale_information": "",
            "entry_duration": 20,
            "id": 15,
            "price_cents": 900,
            "title": "Gruppe",
            "vat_pct": 0.0,
            "quota_ids": [1]
        },
        {
            "after_sale_information": "",
            "entry_duration": 20,
            "id": 16,
            "price_cents": 500,
            "title": "Sch\u00fcler",
            "vat_pct": 19.0,
            "quota_ids": [2]
        }
    ]
}
```

This endpoint retrieves all tickets.

Please pay special attention to the mentioned quota_ids. You will need these to query the quota limits.

### HTTP Request

`GET https://smb-staging.gomus.de/api/v3/tickets`


### Query Parameters

- by_museum_id (Integer), only return ticktes for this museum

- by_exhibition_id (Integer), only return tickets for this exhibition

- valid_at (Date), only return tickets that are valid on this date



# Quotas

The amount of tickets that can be sold are limited by quotas. In most cases a ticket will belong to a single quota and
a single quota will reference many tickets.

![](http://yuml.me/a43d856c)

By querying that quota we know how many tickets can still be sold.

<aside class="notice">
When a ticket belongs to multiple quotas then all referenced quotas need to be queried. The ticket can only be sold when there is enough room in all quotas.
</aside>

## Get Quota Capacities


```shell
curl "https://smb-staging.gomus.de/api/v3/shop/capacities?quota_id=1&date=2017-03-02"
  -H "Authorization: Bearer meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
{
  "2017-03-02 11:00:00 +0100": 70,
  "2017-03-02 11:30:00 +0100": 70,
  "2017-03-02 12:00:00 +0100": 70,
  "2017-03-02 12:30:00 +0100": 70,
  "2017-03-02 13:00:00 +0100": 70,
  "2017-03-02 13:30:00 +0100": 70,
  "2017-03-02 14:00:00 +0100": 70,
  "2017-03-02 14:30:00 +0100": 70,
  "2017-03-02 15:00:00 +0100": 70,
  "2017-03-02 15:30:00 +0100": 70,
  "2017-03-02 16:00:00 +0100": 70,
  "2017-03-02 16:30:00 +0100": 70
}
```

This endpoint retrieves all capacities for a single quota. For each time slot the remaining capacity is listed.

For a dayticket there may be only one slot (the whole day).


### HTTP Request

`GET https://smb-staging.gomus.de/api/v3/shop/capacities?quota_id=1&date=2017-03-02`


### Query Parameters

- quota_id (Integer)

- date (Date)




# Orders

Finally we want to order several tickets. For each ticket we need to specify the quantity and the timeslot.

The server-side will do a final validation and return whether our order was successful.
In success case a JSON with the barcodes will be returned.


## Definition of Order

An order is defined by it's attributes.

```json
{
  "payment_mode_id": 6,
  "order_items_attributes": [
    {
      "quantity": 1,
      "orderable_type": "TicketSale",
      "orderable_attributes": {
        "ticket_id": 4,
        "start_at": "2017-03-02 12:30"
      }
    }
  ]
}
```

There are the `payment_mode_id` and the `order_items_attributes`, which in turn describe the individual order items.

<aside class="notice">
`payment_mode_id` needs to be `6` for correct collective billing.
</aside>


Regarding `order_items_attributes`, first there is the `quantity` and the `orderable_type` ("TicketSale" for tickets).
The `orderable_attributes` contain specific attributes for the orderable, in this case a ticket sale. Here we specified Ticket #4 at timeslot 2017-03-02 12:30.

- start_at describes the time slot (for daytickets the time part will be 00:00).


## Post Order

You can make a legally binding sale by doing a HTTP POST request to the go~mus API.

A final validation check will be made. Either all order items are bought or none.
In case of errors you will get error messages back. In case of success you will get the barcodes.



> Write definition of order into /tmp/orders.json before executing shell command.

```shell
curl "https://smb-staging.gomus.de/api/v3/cash_point/orders"
  -XPOST --data "@/tmp/orders.json"
  -H "Content-Type: application/json"
  -H "Authorization: Bearer meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
{
    "order": {
        "created_at": "2016-03-31T09:40:11+02:00",
        "id": 2,
        "order_items": [
            {
                "id": 2,
                "orderable": {
                    "barcodes": [
                        {
                            "barcode": "403000200002-5",
                            "id": 2
                        }
                    ],
                    "entry_duration": null,
                    "id": 2,
                    "start_at": "2017-03-02T00:00:00+01:00",
                    "ticket": {
                        "after_sale_information": "",
                        "description": "<p>G\u00fcltig f\u00fcr einmaligen Eintritt innerhalb von 2 Monaten ab Kaufdatum</p>",
                        "entry_duration": null,
                        "id": 18,
                        "price_cents": 1200,
                        "title": "Erwachsener | adult",
                        "vat_pct": 7.0
                    }
                },
                "orderable_type": "TicketSale",
                "price_cents": 1200,
                "quantity": 1
            }
        ],
        "payment_status": 10,
        "rating": null,
        "total_price_cents": 1200
    }
}
```

<aside class="success">
Remember — a happy api user is an authenticated api user!
</aside>


## Barcodes

Each ticket sale will a have one barcode per quantity. Each barcode can be validated and devalued separately.

The barcodes are supposed to be printed on paper. One barcode per sheet.

The barcodes need to be encoded as [CODE 39](https://en.wikipedia.org/wiki/Code_39), so that they can be scanned.
Please pay special attention to the required quiet zone and minimal size requirements. You may find an example printout [here](/images/ticket-pdf-example.pdf).





