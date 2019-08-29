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

Production URL: `http://events.nestready.net`

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
  "events": ["favorite_property"],
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

```json
//RESPONSE EXAMPLE
{ 
   "subscriptions": [
     {
        "metadata": "metadata1", 
        "events": [...], 
        "delivery_url": ""
     },
   ]
}
```

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
### contact_request
```json
//DATA EXAMPLE
{ "message": "message user sent" }
```

## Location events
### location_favorited
```json
//DATA EXAMPLE
{
  "location": {
    "id": "location_1",
    "name": "Boston",
    "level": "place" // state|county|metro|place|nbh
  }
}
```

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
### property_visit_requested 

### finance_requested

### listing_favorited



## Search events

```json
//DATA EXAMPLE
{
  "search": {
    "id": "search_1",
    "bathroom_count": 1,
    "bedroom_count": 2,
    "location_name": "boston",
    "location_level": "place", // state|county|metro|place|nbh
    "max_price_cents": 100000000,
    "min_price_cents": "",
    "listing_image_cover_url": "https://listing-images.nestready.net/dArboFrG37bMhDjHxWUMBZ3vs",
    "property_type": "apartment/condo", // townhouse|single-family-home|all
  }
}
```
### search_saved
### search_shared

## Email events
### email_signed_up

```json
//DATA EXAMPLE
null
```

## Notification events
### notification_sent








