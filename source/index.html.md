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

Eatsa provides a simple and powerful REST API to integrate into our ordering and Cubby pick up system.

Requests can be made to place and update orders, get an order ETA status, as well as retrieve information about stores.

All request bodies should have content type `application/json` and be valid JSON.

## API Enviornments

 Environment | Endpoint
-----------------  | --------------------------------
Production | https://api.eatsa.com
Staging    | https://api.stage.eatsa.com


## Interacting with the API

Status codes

 Id | Code | Description
--------- | ------- | -----------
200 | OK | Successful request
201 | Created | New object saved
204 | No content | Object deleted
400 | Bad Request | Returns JSON with the error message
401 | Unauthorized | Couldn’t authenticate your request
403 | Invalid scope | User hasn’t authorized necessary scope
404 | Not Found | No such object
500 | Internal Server Error | Something went wrong
503 | Service Unavailable | Your connection is being throttled or the service is down for maintenance

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

To request an authentication API please contact us at support@eatsa.com.

# Orders

<!---
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
--->

## Order object

> Example Order object

```json
{
  "id": "2eecef15-c638-44a2-a133-64789f9929b1",
  "client_sent_id": "96679B8C-B333-4046-BAD6-B358A97B6EE4",
  "user_id": "98cf8eba-45cd-4f2c-9541-dbf611c4456c",
  "store_id": "418fdc10-5881-11e4-8ed6-0800200c9a66",
  "cubby_id": "418fdc10-5881-11e4-8ed6-0800200c9a66",
  "cubby_name": "14",
  "created_at": "2018-04-02T21:29:25.233Z",
  "updated_at": "2018-04-02T21:29:25.681Z",
  "scheduled_time": "2018-04-02T21:30:50.000Z",
  "status": "ready_for_pickup",
  "human_readable_id": 208,
  "status_board_display_name": "Jessie B"
}
```

Parameter | Description
--------- | -----------
id | Unique ID that identifies the created order
client_sent_id | Unique ID that identifies the order request from the clients side 
user_id | Unique ID that identifies the user who created the orders 
store_id | Unique ID that identifies the store where the order was created 
created_at | Time the order was created 
updated_at | Time the order was last updated 
scheduled_time | Optional, indicates the time an order is scheduled at if it was specified on creation
status | Status of the order, initial state is `in_queue`.
human_readable_id | Human readable ID that can be displayed to the customer
status_board_display_name | Name that will be displayed on the status board to inform the customer of their order.

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

Place an order in the queue. Orders have an initial state of `in_queue` and have a unique id that will be used to track the order and modify its state accordingly. 

<!---
Once an order is `in_queue` it will be scheduled for processing.
--->

### Endpoint

`POST https://api.eatsa.com/v1/orders`

### Request Arguments

Parameter | Required | Description
--------- | ------- | -----------
client_sent_id | yes  | Unique ID that identifies the order request from the clients side
store_id | yes | Store where the order will be created
user | yes | Basic customer details, first and last name
timeslot_start_time| no | Defines a pickup time that enables orders to be scheduled. Expected format: '2018-04-02T21:30:50.000Z'. The available time slots for a store can be retrieved from the 'Find store available time slots' API.

### Response Arguments

Refer to order object


## Find an order

> Example Request

```curl
curl "https://api.eatsa.com/v1/orders/2eecef15-c638-44a2-a133-64789f9929b1" \
	-i -H "Content-Type:application/json; charset=utf-8"
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

Retrieve order information. 


### Endpoint

`GET https://api.eatsa.com/v1/orders/:order_id`

### Request Arguments

Parameter | Required | Description
--------- | ------- | -----------
id | yes  | Order id

### Response Arguments

Refer to order object


## Mark an order as ready for pickup

> Example Request

```curl
curl "https://api.eatsa.com/v1/orders/2eecef15-c638-44a2-a133-64789f9929b1" \
    -X PUT -i -H "Content-Type:application/json; charset=utf-8" \
    -d '{
          "status": "ready_for_pickup"
        }'

```

> Example Response

```json
{
  "id": "2eecef15-c638-44a2-a133-64789f9929b1",
  "client_sent_id": "96679B8C-B333-4046-BAD6-B358A97B6EE4",
  "user_id": "98cf8eba-45cd-4f2c-9541-dbf611c4456c",
  "store_id": "418fdc10-5881-11e4-8ed6-0800200c9a66",
  "cubby_id": "418fdc10-5881-11e4-8ed6-0800200c9a66",
  "cubby_name": "14",
  "created_at": "2018-04-02T21:29:25.233Z",
  "updated_at": "2018-04-02T21:29:25.681Z",
  "scheduled_time": "2018-04-02T21:30:50.000Z",
  "status": "ready_for_pickup",
  "human_readable_id": 208,
  "status_board_display_name": "Jessie B"
}
```

Change the state of an order to 'ready_for_pickup', this indicates that the order has been  fulfilled by the back of house and is ready to be delivered to the customer. At this point a cubby name is assigned to place the order, at the same time the customer will be notified of the his cubby assignment. 

### HTTP Request

`PUT https://api.eatsa.com/v1/orders/:order_id`

### Request Arguments

Parameter | Description
--------- | -----------
status | State to transition order into

### Response Arguments

Refer to order object


## Cancel order by customer

> Example Request

```curl
    curl "https://api.eatsa.com/v1/orders/2eecef15-c638-44a2-a133-64789f9929b1" \
    -X PUT -i -H "Content-Type:application/json; charset=utf-8" \
    -d '{
          "status": "customer_canceled"
        }'

```

> Example Response

```json
{
  "id": "2eecef15-c638-44a2-a133-64789f9929b1",
  "client_sent_id": "96679B8C-B333-4046-BAD6-B358A97B6EE4",
  "user_id": "98cf8eba-45cd-4f2c-9541-dbf611c4456c",
  "store_id": "418fdc10-5881-11e4-8ed6-0800200c9a66",
  "cubby_id": "418fdc10-5881-11e4-8ed6-0800200c9a66",
  "cubby_name": "14",
  "created_at": "2018-04-02T21:29:25.233Z",
  "updated_at": "2018-04-02T21:29:25.681Z",
  "scheduled_time": "2018-04-02T21:30:50.000Z",
  "status": "customer_canceled",
  "human_readable_id": 208,
  "status_board_display_name": "Jessie B"
}
```

The customer decides to cancel their order, this changes the order state to `customer_canceled`.

### HTTP Request

`PUT https://api.eatsa.com/v1/orders/:order_id`

### Request Arguments

Parameter | Description
--------- | -----------
status | State to transition order into

### Response Arguments

Refer to order object


## Cancel order by attendant

> Example Request

```curl
    curl "https://api.eatsa.com/v1/orders/2eecef15-c638-44a2-a133-64789f9929b1" \
    -X PUT -i -H "Content-Type:application/json; charset=utf-8" \
    -d '{
          "status": "attendant_canceled"
        }'

```

> Example Response

```json
{
  "id": "2eecef15-c638-44a2-a133-64789f9929b1",
  "client_sent_id": "96679B8C-B333-4046-BAD6-B358A97B6EE4",
  "user_id": "98cf8eba-45cd-4f2c-9541-dbf611c4456c",
  "store_id": "418fdc10-5881-11e4-8ed6-0800200c9a66",
  "cubby_id": "418fdc10-5881-11e4-8ed6-0800200c9a66",
  "cubby_name": "14",
  "created_at": "2018-04-02T21:29:25.233Z",
  "updated_at": "2018-04-02T21:29:25.681Z",
  "scheduled_time": "2018-04-02T21:30:50.000Z",
  "status": "attendant_canceled",
  "human_readable_id": 208,
  "status_board_display_name": "Jessie B"
}
```

An attendant decides to cancel an order, this changes the order state to `attendant_canceled`.

### HTTP Request

`PUT https://api.eatsa.com/v1/orders/:order_id`

### Request Arguments

Parameter | Description
--------- | -----------
status | State to transition order into

### Response Arguments

Refer to order object

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

## Store object

> Example Store object

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

Parameter | Description
--------- | -----------
id | Unique ID store id


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

### Request Arguments

Parameter | Description
--------- | ---------------------------
store_id | Store id


### Response Arguments

Refer to Store object

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

### Response Arguments

Parameter | Description
--------- | ---------------------------
count | Number of existing stores
stores | List of stores, refer to Store object


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
  "reservable_timeslots": [
    {
      "start_time": "2018-04-03T21:00Z"
    },
    {
      "start_time": "2018-04-03T21:05Z"
    },
    {
      "start_time": "2018-04-03T21:10Z"
    },
    {
      "start_time": "2018-04-03T21:15Z"
    },
    {
      "start_time": "2018-04-03T21:20Z"
    },
    {
      "start_time": "2018-04-03T21:25Z"
    },
    {
      "start_time": "2018-04-03T21:30Z"
    },
    {
      "start_time": "2018-04-03T21:35Z"
    }
  ]
}
```

<!---
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
--->

Find all the available times a store has to schedule an order

### HTTP Request

`GET https://api.eatsa.com/v1/stores/:store_id/reservable_timeslots`


### Response Arguments

Parameter | Description
--------- | ---------------------------
estimated_time_now | Estimated time for an order to be processed
timeslot_duration | Seconds between each time slot
reservable_timeslots | List of available start times to schedule an order

