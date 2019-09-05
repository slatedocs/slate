---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - javascript
π
includes:
  - errors
  - default_sucess_responses

search: true
---

#Introduction
## Basics
This document illustrates how interact with NestReady events api.

This process can be described into two steps:

1) Subscribe to events for specific contacts. 

2) Every time NestReady tracks an event from that contact, NestReady will trigger a webhooks to your server.

## Staging/Production
Staging URL: `https://events.stage-nestready.net`

Production URL: `https://events.nestready.net`

#Authentication

## Making requests
You will need to send a personal token on every request.

You should receive two token from our team, one for each environment.

We expect you to send this information in a field called 'X-Token' inside headers.

## Receiving webhooks
TODO

#Webhook Subscriptions
## Subscribing
```json
// BODY EXAMPLE
{
  "contact": {
    "email": "something@somewhere.co",
    "phone": "(123)12341234",
  },
  "events": ["listing_favorited"],
  "delivery_url": "https://api.your_url.com/nestready/events",
  "metadata": "user_id_in_your_system"
}
```
Subscribe to events for the given contact.

Everytime you subscribe to an event, we will send you a notification with
the just created webhook information to the defined `delivery_url`.

### HTTP Request
`POST /webhooks/subscriptions/contacts`

### Parameters

Name | Required? | Description
--------- | ------- | -----------
contact | yes | email(required) and phone of the target contact
events | yes| array with the list of target events. [supported_events](http://localhost:4567/#events). ex: `['all']`
metadata | yes | anything that you need to recognize this user in your system, or query in our API, we recommend that to be the user_id inside your system.

## Unsubscribing

Destroy a subscription, so that your system won't receive events for the given
user.
### HTTP Request

`DELETE /webhooks/subscriptions/contacts`

### Parameters

Name | Required? | Description
--------- | ------- | -----------
metadata | yes | -

<aside class="success">It will delete all matched subscriptions.</aside>

## Listing

```json
//RESPONSE EXAMPLE
{ 
   "subscriptions": [
     {
        "metadata": "metadata1", 
        "events": [...], 
        "delivery_url": ‘’
     },
   ]
}
```
### HTTP Request

`GET webhooks/subscriptions/contacts`

### Parameters

Name | Required? | Description
--------- | ------- | -----------
metadata | yes | The metadata value set by the client on subscription creation

This endpoint retrieves all contact subscriptions for the given client.


#Events
## Listing 
Method used only for Disaster Recovery, the retention period is 48
hours (meaning that events occured more than 48 hours ago won't be retrieved).

```json
//BODY EXAMPLE
[
  {
  "id": 321,
  "created_at": 1349699313,
  "type": "example",
  "metadata": "could_be_userID",
  "data": {
    "property_address": "809 William St Suite 205, Montreal, QC H3C 1N8, CA",
           ...
     }
   }
]
```

### HTTP Request

`GET /contacts`

Name | Required? | Description
--------- | ------- | -----------
metadata | no | --
start_at | yes | ex: 1567017624
end_at | yes | ex: 1567104024000
page | yes | ex: 1

<aside class="success">Batch size is 100 per page.</aside>


## Receiving
After subscribing successfully, you will begin to receive events for your contacts to the defined delivery_url.

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

### HTTP Request
`POST delivery_url` 

# Event types
## Contact events
### contact_requested
```json
//DATA EXAMPLE
{ "message": "message user sent" }
```

This event is triggered once a user sends a contact request via online form.

### location_favorited
```json
//DATA EXAMPLE for location_favorited and location_unfavorited
{
  "location": {
    "id": "location_1",
    "name": "Boston",
    "level": "place" // state|county|metro|place|nbh
  }
}
```

This event is triggered once the user "pins" or favorites a location either from the dashboards listings, or from the location details itself.

### location_unfavorited
This event is triggered once the user unfavorites or unpins a previously favorited location.

## Listing events
```json
//DATA EXAMPLE
{
  "listing": {
    "id": "listing_1",
    "property_address": "full_address",
    "mls_number": "1234mls",
    "listing_image_cover_url": "https://listing-images.nestready.net/dArboFrG37bMhDjHxWUMBZ3vs",
    "price_cents": 100000,
    "property_type": "", // TODO: add available types
    "bathrooms_count": 1,
    "bedrooms_count": 1,
    "year_built": 1990,
    "description": ""
  } 
}
```

This event is triggered once the user click to view a property's details.

### listing_changed

```json
//DATA EXAMPLE for listing_changed
{
  "listing": {
    "id": "listing_1",
   "listing_diff": {
   "price": [100000, 100001]
   }
 }
}
```

This event is triggered when a property has an update. In this data example, the previous price for this property was 100000, then it was updated to 100001.

### property_visit_requested 

This event is triggered once the user clicks on the option to schedule a visit to a property, either from the listings dashboards or from the property details itself.


### listing_favorited

This event is triggered once the user clicks on favorites to view the properties and/or locations previously pinned, or favorited.

### listing_unfavorited

This evente is triggerend once the user unfavorites or unpins a favorited listing/property.

## Search events

```json
//DATA EXAMPLE
{"searches":
    [{"id":"5d71461ad71b0100091a10af",
      "bathrooms_count":"3",
      "bedrooms_count":"3",
      "max_price_cents":"400000",
      "min_price_cents":"1",
      "listing_image_cover_url":"",
      "property_type":"townhouse",
      "commute":{"mode":"car", "range":"20", "name":"work"},
      "location":{"id":"597796fbb5e1b5f5d7000655", "name":"boston metro area", "level":"metro"}},
     {"id":"5d714622d71b0100091a10b0",
      "bathrooms_count":"3",
      "bedrooms_count":"3",
      "max_price_cents":"400000",
      "min_price_cents":"1",
      "listing_image_cover_url":"",
      "property_type":"townhouse",
      "commute":{"mode":"car", "range":"20", "name":"work"},
      "location":{"id":"597796fbb5e1b5f5d7000655", "name":"boston metro area", "level":"metro"}},
     {"id":"5d714799d71b0100091a10b3",
      "bathrooms_count":"3",
      "bedrooms_count":"3",
      "max_price_cents":"400000",
      "min_price_cents":"1",
      "listing_image_cover_url":"",
      "property_type":"townhouse",
      "commute":{"mode":"car", "range":"20", "name":"work"},
      "location":{"id":"597796fbb5e1b5f5d7000655", "name":"boston metro area", "level":"metro"
      }
    }
    ]
  },
 "event_type":"saved_search_updated"}
```
This event is triggered once the user, using the filter provided, performs a property search

### saved_search_updated
This event is triggered once the user has already perfomed a property search and then saves it.

### search_deleted
This event is triggered when the user deletes a previously saved search.

### saved_search_shared
This event is triggered once the user has already perfomed a property search, saved it, then shares it.

## Email events
This event is triggered once the user has already perfomed a property search, saved it, then mails it.

### email_signed_up
This event is triggered once the user provides its email for the first time using one of the contact forms or sharing a search.

```json
//DATA EXAMPLE
null
```

## Notification events
### notification_sent








