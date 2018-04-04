---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - curl

toc_footers:

includes:
  - errors

search: false
---
#   
# Introduction

## API Reference

> API Endpoint:

```curl
https://api.eatsa.com
```


Eatsa provides a simple and powerful REST API to integrate into our ordering and Cubby pick up system.

Requests can be made to place and update orders, get an order ETA status, as well as information about stores.

# Authentication

> Example Request

```curl
curl "http://api.eatsa.com/v1/stores" \
	-X GET -i -H "Content-Type:application/json; charset=utf-8" \
	-H "X-Authtoken:42b41067303bw46o6d4636eeb621we62o0cq1q71q4b"	
```

Authenticate your account by including your secret key in every API Request. Please be sure to keep your API key secure, do not share your secret API key in publicly accessible areas such GitHub, client-side code, and so forth.

To authenticate an API request include the following header `-H "X-Authtoken:42b41067303bw46o6d4636eeb621we62o0cq1q71q4b"` in every request.

All API requests must be made over HTTPS. Calls made over plain HTTP will fail. API requests without authentication will also fail.


# Orders

What is an order and it's status

### Order State

Status | Description
--------- | -----------
in_queue |  Initial state when an order is placed
scheduled | State when a customer selects a window of future pickup.
on_the_line | The order has been picked up is being processed, the customer's name will appear on the status board to inform them that their order is in progress.  
ready_for_pickup| The order has been completed, at his point a Cubby number is assigned to the customer and presented on the status board.
delivered_to_customer| The customer picks up their order.
customer_canceled| The customer decides to cancel an order
attendant_canceled| An employee decides to cancel an order.  
hold_for_recubby| State when an order is kept in the kitchen for any reason.
ready_to_recubby| State when an order has been held and the host can either manually deliver the without cubbies or they can iniciate a new cubby re assignment.


## Create an order

> Example Request

```curl
curl "https://api.eatsa.com/v1/orders" \
	-X POST -i -H "Content-Type:application/json; charset=utf-8" \
	-d '{
	      "client_sent_id": "92312332",
	      "store_id":"418fdc10-5881-11e4-8ed6-0800200c9a66", 
	      "user": {
	          "first_name": "Jessie", 
	          "last_name": "Brown"
	      }
      }'
	          
```

> Example Response

```json
{
  "id": "2eecef15-c638-44a2-a133-64789f9929b1",
  "client_sent_id": "96679B8C-B333-4046-BAD6-B358A97B6EE4",
  "user_id": "98cf8eba-45cd-4f2c-9541-dbf611c4456c",
  "store_id": "418fdc10-5881-11e4-8ed6-0800200c9a66",
  "created_at": "2018-04-02T21:29:25.233Z",
  "updated_at": "2018-04-02T21:29:25.681Z",
  "scheduled_time": "2018-04-02T21:30:50.000Z",
  "status": "in_queue",
  "human_readable_id": 208,
  "status_board_display_name": "Jessie B"
}
```

Place an order.

### Endpoint

`POST https://api.eatsa.com/v1/orders`

### Arguments

Parameter | Required | Description
--------- | ------- | -----------
client_sent_id | yes  | Unique ID that identifies the order request from the clients side
store_id | yes | Store where the order will be created
user | yes | Basic customer details, first and last name
timeslot_start_time| no |optional, defines a pickup time, so orders can be placed ahead of time. Expected format: '2018-04-02T21:30:50.000Z'. The available time slots for a store can be retrieved from the 'Find store available time slots' API.



## Update order state

> Example Request

```curl
curl "https://api.eatsa.com/v1/orders/2eecef15-c638-44a2-a133-64789f9929b1" \
    -X PUT -i -H "Content-Type:application/json; charset=utf-8" \
    -d '{
          "status": "on_the_line"
        }'

```

> Example Response

```json
{
  "id": "2eecef15-c638-44a2-a133-64789f9929b1",
  "client_sent_id": "96679B8C-B333-4046-BAD6-B358A97B6EE4",
  "user_id": "98cf8eba-45cd-4f2c-9541-dbf611c4456c",
  "store_id": "418fdc10-5881-11e4-8ed6-0800200c9a66",
  "created_at": "2018-04-02T21:29:25.233Z",
  "updated_at": "2018-04-02T21:29:25.681Z",
  "scheduled_time": "2018-04-02T21:30:50.000Z",
  "status": "on_the_line",
  "human_readable_id": 208,
  "status_board_display_name": "Jessie B"
}
```

Change the state of order. Please refer to 'Order state' for more information about the different states an order can be. 

### HTTP Request

`PUT https://api.eatsa.com/v1/orders/:order_id`

### Arguments

Parameter | Description
--------- | -----------
status | State to transition order into


## Retrieve order ETA

> Example Request

```curl
curl "https://api.eatsa.com/v1/orders/2eecef15-c638-44a2-a133-64789f9929b1/estimated_time_remaining" \
	-i -H "Content-Type:application/json; charset=utf-8" \
```


> Example Response

```json
 {
    "estimated_time_remaining": 732
 }
```

Retrieve Order ETA in seconds.

### HTTP Request

`GET https://api.eatsa.com/v1//orders/:order_id/estimated_time_remaining`

### Response

Parameter | Description
--------- | -----------
estimated_time_remaining | Estimated time in seconds before the order is processed.


# Stores


## Retrieve a store

> Example Request

```curl
curl "https://api.eatsa.com/v1/stores/418fdc10-5881-11e4-8ed6-0800200c9a66" \
	-i -H "Content-Type:application/json; charset=utf-8" \
```

> Example Response

```json
{
  "id": "418fdc10-5881-11e4-8ed6-0800200c9a66",
  "created_at": "2016-09-06T14:24:23.996Z",
  "updated_at": "2018-01-08T18:36:38.135Z",
  "status": "open",
  "phone_number": "4158138841",
  "address": "121 Spear St.",
  "locality": "San Francisco",
  "region": "CA",
  "postcode": "94105",
  "country": "US",
  "latitude": "37.791848",
  "longitude": "-122.392973",
  "timezone": "America/Los_Angeles",
  "mobile_orders_disabled": false,
  "business_page_url": "https://goo.gl/maps/Awz8xPMx1EH2",
  "client_assets": {},
  "store_hours": [
    {
      "day_of_week": "Monday",
      "open_time": "07:30:00",
      "close_time": "23:00:00"
    },
    {
      "day_of_week": "Tuesday",
      "open_time": "07:30:00",
      "close_time": "23:00:00"
    },
    {
      "day_of_week": "Wednesday",
      "open_time": "07:30:00",
      "close_time": "23:00:00"
    },
    {
      "day_of_week": "Thursday",
      "open_time": "07:30:00",
      "close_time": "23:00:00"
    },
    {
      "day_of_week": "Friday",
      "open_time": "07:30:00",
      "close_time": "23:00:00"
    }
  ],
  "overridden_store_hours": []
}
```
Retrieve a specific store.

### HTTP Request

`GET https://api.eatsa.com/v1/orders/stores/:store_id`


## List all stores

> Example Request

```curl
curl "https://api.eatsa.com/v1/stores" \
	-i -H "Content-Type:application/json; charset=utf-8" \
```

> Example Response

```json
{
  "count": 3,
  "stores": [
    {
      "id": "418fdc10-5881-11e4-8ed6-0800200c9a66",
      "created_at": "2016-09-06T14:24:23.996Z",
      "updated_at": "2018-01-08T18:36:38.135Z",
      "status": "open",
      "phone_number": "4158138841",
      "address": "121 Spear St.",
      "locality": "San Francisco",
      "region": "CA",
      "postcode": "94105",
      "country": "US",
      "latitude": "37.791848",
      "longitude": "-122.392973",
      "timezone": "America/Los_Angeles",
      "mobile_orders_disabled": false,
      "business_page_url": "https://goo.gl/maps/Awz8xPMx1EH2",
      "client_assets": {},
      "store_hours": [
        {
          "day_of_week": "Monday",
          "open_time": "07:30:00",
          "close_time": "23:00:00"
        },
        {
          "day_of_week": "Tuesday",
          "open_time": "07:30:00",
          "close_time": "23:00:00"
        },
        {
          "day_of_week": "Wednesday",
          "open_time": "07:30:00",
          "close_time": "23:00:00"
        },
        {
          "day_of_week": "Thursday",
          "open_time": "07:30:00",
          "close_time": "23:00:00"
        },
        {
          "day_of_week": "Friday",
          "open_time": "07:30:00",
          "close_time": "23:00:00"
        }
      ],
      "overridden_store_hours": []
    },
    {...},
    {...}
  ]
}
```

Retrieve all stores where orders can be placed.

### HTTP Request

`GET https://api.eatsa.com/v1/stores`


## Find store available time slots

> Example Request

```curl
curl "https://api.eatsa.com/v1/stores/418fdc10-5881-11e4-8ed6-0800200c9a66/reservable_timeslots" \
	-i -H "Content-Type:application/json; charset=utf-8" \
```

> Example Response

```json
{
  "estimated_time_now": 117,
  "timeslot_duration": 300,
  "mobile_disable_order_now": false,
  "mobile_hide_order_now": false,
  "reservable_timeslots": [
    {
      "start_time": "2018-04-03T21:00Z",
      "count_available": 6
    },
    {
      "start_time": "2018-04-03T21:05Z",
      "count_available": 6
    },
    {
      "start_time": "2018-04-03T21:10Z",
      "count_available": 6
    },
    {
      "start_time": "2018-04-03T21:15Z",
      "count_available": 6
    },
    {
      "start_time": "2018-04-03T21:20Z",
      "count_available": 6
    },
    {
      "start_time": "2018-04-03T21:25Z",
      "count_available": 6
    },
    {
      "start_time": "2018-04-03T21:30Z",
      "count_available": 6
    },
    {
      "start_time": "2018-04-03T21:35Z",
      "count_available": 6
    }
  ]
}

```

Find all the available times a store has to schedule an order

### HTTP Request

`GET https://api.eatsa.com/v1/stores/:store_id/reservable_timeslots`

