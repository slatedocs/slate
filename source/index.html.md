---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - javascript

includes:

search: true
---

#Introduction
## Basics
This document illustrates how interact with NestReady events api.

This process can be described into two steps:

1) Subscribe to events for specific home_buyerss.

2) Every time NestReady tracks an event from that home_buyers, NestReady will trigger a webhooks to your server.

## Staging/Production
Staging URL: `https://events.stage-nestready.net`

Production URL: `https://events.nestready.net`

# Authentication

## Making requests
You will need to send a personal token on every request.

You should receive two token from our team, one for each environment.

We expect you to send this information in a field called 'X-Token' inside headers.

# HomeBuyer
## Webhook Subscriptions
### Subscribing
```json
// BODY EXAMPLE
{
    "home_buyer": {
        "email": "something@somewhere.co",
        "phone": "(123)12341234"
    },
    "events": ["listing_favorited"],
    "delivery_url": "https://api.your_url.com/nestready/events",
    "metadata": "user_id_in_your_system"
}
```
Subscribe to events for the given home_buyers.

Everytime you subscribe to an event, we will send you a notification with
the just created webhook information to the defined `delivery_url`.

#### HTTP Request
`POST /home_buyers/webhooks/subscriptions`

#### Parameters

Name | Required? | Description
--------- | ------- | -----------
home_buyer | yes | email(required) and phone of the target home_buyers
events | yes| array with the list of target events. [supported_events](http://localhost:4567/#events). ex: `['all']`
metadata | yes | anything that you need to recognize this user in your system, or query in our API, we recommend that to be the user_id inside your system.

### Unsubscribing

Destroy a subscription, so that your system won't receive events for the given
user.
#### HTTP Request

`DELETE /home_buyers/webhooks/subscriptions`

#### Parameters

Name | Required? | Description
--------- | ------- | -----------
metadata | yes | -

<aside class="success">It will delete all matched subscriptions.</aside>

### Listing

This endpoint retrieves all home buyer subscriptions for that giver client.

#### HTTP Request

`GET /home_buyers/webhooks/subscriptions`

#### Parameters

Name | Required? | Description
--------- | ------- | -----------
metadata | yes | The metadata value set by the client on subscription creation



## Events
### Listing
Method used only for Disaster Recovery, the retention period is 48
hours (meaning that events occured more than 48 hours ago won't be retrieved).


```json
//BODY EXAMPLE
{
  "current_page": 1,
  "total_pages_count": 0,
  "listings_per_page": 100,
  "events": []
}
``````


#### HTTP Request

`GET /homebuyers/events`

Name | Required? | Description
--------- | ------- | -----------
metadata | no | --
start_at | yes | ex: 1567017624
end_at | yes | ex: 1567104024000
page | yes | ex: 1

<aside class="success">Batch size is 100 per page.</aside>


### Receiving
After subscribing successfully, you will begin to receive events for your home_buyerss to the defined delivery_url.

The follow schema is used for every event payload, the example of data is available [here](/#event-types)

```json
//BODY EXAMPLE
{
  "id": <string>,
  "type": <string>,
  "metadata": <string>,
  "partner_name": <string>,
  "data": <hashmap>,
  "created_at": <timestamp>,
}

```

#### HTTP Request
`POST delivery_url`

## Event types

### contact_request_requested
```json
//DATA EXAMPLE
{
    "home_buyer": {
        "email": "something@somewhere.co",
        "phone": "(123)12341234"
    },
    "events": ["listing_favorited"],
    "delivery_url": "https://api.your_url.com/nestready/events",
    "metadata": "user_id_in_your_system"
}
```
This event is triggered once a user sends a request by any listed event.

### location_favorited
```json
//DATA EXAMPLE for location_favorited and location_unfavorited
{
    "home_buyer": {
        "id": "1234",
        "email": "something@somewhere.co",
        "phone": "(123)12341234"
    },
    "data": {
            "location": {
                "id": "1",
                "name": "Boston",
                "level": "place"
            }

    },
    "event_type": "location_favorited",
    "partner_name": "mybank",
    "journey_id": "j1"
}
```

This event is triggered once the user "pins" or favorites a location either from the dashboards listings, or from the location details itself.

### location_unfavorited
This event is triggered once the user unfavorites or unpins a previously favorited location.

### property_visit_requested

This event is triggered once the user clicks on the option to schedule a visit to a property, either from the listings dashboards or from the property details itself.


### listing_favorited

This event is triggered once the user clicks on favorites to view the properties and/or locations previously pinned, or favorited.

### listing_unfavorited

This evente is triggerend once the user unfavorites or unpins a favorited listing/property.

This event is triggered once the user, using the filter provided, performs a property search

### saved_search_updated

This event is triggered once the user has already perfomed a property search and then saves it.

### search_deleted
This event is triggered when the user deletes a previously saved search.

### saved_search_shared
This event is triggered once the user has already perfomed a property search, saved it, then shares it.

### email_signed_up
This event is triggered once the user provides its email for the first time using one of the home_buyers forms or sharing a search.


# Listing
## Webhook Subscriptions

## Events
### Listing
Method used only for Disaster Recovery, the retention period is 48
hours (meaning that events occured more than 48 hours ago won't be retrieved).


```json
//BODY EXAMPLE
{
  "current_page": 1,
  "total_pages_count": 0,
  "listings_per_page": 100,
  "events": []
}
``````


#### HTTP Request

`GET /listings/events`

Name | Required? | Description
--------- | ------- | -----------
metadata | no | --
start_at | yes | ex: 1567017624
end_at | yes | ex: 1567104024000
page | yes | ex: 1

<aside class="success">Batch size is 100 per page.</aside>


### Receiving
After subscribing successfully, you will begin to receive events for your home_buyerss to the defined delivery_url.

The follow schema is used for every event payload, the example of data is available [here](/#event-types)

```json
//BODY EXAMPLE
{
  "id": <string>,
  "type": <string>,
  "metadata": <string>,
  "listing_id": <string>,
  "data": <hashmap>,
  "created_at": <timestamp>,
}

```

#### HTTP Request
`POST delivery_url`


## Event types
### listing_changed
This event is triggered when a property has an update. In this data example, the previous price for this property was 100000, then it was updated to 100001.

