---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - javascript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors
  - default_sucess_responses

search: true
---

# Introduction

## FinLocker Integration

This document illustrates how NestReady will provide user behavior data to FinLocker.

This process can be simplified into two steps:

1)FinLocker subscribe for events for specific contacts

2)Every time Nestready tracks an event from that contact, NestReady will send an event to FinLocker.

#Finlocker Integration

##Contact Subscription

###Subscribing
```json
Body: {
  contact: {
    email: "alex@nestready.ai",
    phone: "(123)12341234", // not obligatory but good to have
  },
  events: ["favorite_property"], // or all' (see event types)
  delivery_url: "https://api.finlocker.com/nestready/events",
  metadata: "anything that you will use to query later, could_be_userID"
}
```
This endpoint subscribes to the listings

#### HTTP Request
`POST https://events.stage-nestready.net/webhooks/contacts`

#### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
email | something@somewhere.co | email address of the user subscribing for the listings
phone | null | phone number of the user subscribing for the listings
events | "all"| event types related to properties listings
metadata | null | The metadata value set by the client on subscription creation


### Listing

```json
Response: { 
   subscriptions: [
     {
        metadata: ‘metadata1’, 
        events: [...], 
        delivery_url: ‘’
     },
   ]
}
```

This endpoint retrieves all contact subscriptions for the given client.

#### HTTP Request

`GET http://events.nestready.net/webhooks/contacts`

#### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
metadata | null | The metadata value set by the client on subscription creation

<aside class="success">
You can also send * as metadata to retrieve all contact subscriptions.
</aside>

### Unsubscribing

```json
Response: { 
   subscriptions: [
     {
        metadata: ‘metadata1’, 
        events: [...], 
        delivery_url: ‘’
     },
   ]
}
```
#### HTTP Request

`GET http://events.nestready.net/webhooks/contacts#####`
Where ##### is the userID number

#### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
metadata | userID | The userID will be set upon subscription

<aside class="success">
Response body may return empty or contain...
</aside>

## Events

### Listing
```json
[
  {
  "id": 321,
  "created_at": 1349699313,
  "type": "example",
  "metadata": "could_be_userID",
  "data": {
    property_address: "809 William St Suite 205, Montreal, QC H3C 1N8, CA",
           ...
     }
   }
]
```
#### HTTP Request
`GET https://events.nestready.net/contacts?metadata=could_be_userID&start_at=1349699313&end_at=1349699313&page=1`

Parameter | Default | Description
--------- | ------- | -----------
metadata | userID&start_at| The userID will be set upon subscription, start at will the define the range of the listing

### Receiving

Every event will be delivered to the defined delivery_url when subscribed

```json

{
  id: <string>,
  type: <string>,
  metadata: <string>,
  partner_name: <string>,
  data: <hashmap>,
  created_at: <timestamp>,
}

```

#### HTTP Request

Parameter | Default | Description
--------- | ------- | -----------
 | | 


## Event types with example of Data

### Contact Request
`{ message: 'message user sent' }`

### Location_Favorited
`{
  location: {
    id: location_1,
    name: 'Boston',
    level: 'place' // state|county|metro|place|nbh
  }
}`

### PROPERTY_VISIT_REQUESTED & FINANCE_REQUESTED & LISTING_FAVORITED
`
{
  listing: {
    id: listing_1,
    property_address: 'full_address',
    mls_number: '1234mls',
    listing_image_cover_url: 'https://listing-images.nestready.net/dArboFrG37bMhDjHxWUMBZ3vs',
    price_cents: 100_000,
    property_type: ‘’, // TODO: add available types
    bathrooms_count: 1,
    bedrooms_count: 1,
    year_built: 1990,
    description: ‘’
  } 
}`

### SEARCH_SAVED & SEARCH_SHARED
`data: {
  search: {
    id: 'search_1',
    bathroom_count: 1,
    bedroom_count: 2,
    location_name: 'boston',
    location_level: 'place', // state|county|metro|place|nbh
    max_price_cents: 100000000,
    min_price_cents: nil,
     listing_image_cover_url: 'https://listing-images.nestready.net/dArboFrG37bMhDjHxWUMBZ3vs'
    property_type: 'apartment/condo', // townhouse|single-family-home|all
  }
}`

### EMAIL_SIGNED_UP
`null`

### NOTIFICATION_SENT








