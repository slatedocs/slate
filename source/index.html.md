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

1) Subscribe to events for specific home_buyers.

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
        "id": "1234",
        "email": "home_buyer@email.com",
        "phone": "(123)12341234"
    },
    "events": ["listing_favorited"],
    "delivery_url": "https://api.your_url.com/nestready/events",
    "metadata": "user_id_in_your_system"
}

//RESPONSE EXAMPLE

{
    "id": 1,
    "metadata": "user_1",
    "delivery_url": "https://api.your_url.com/nestready/events",
    "events": ["listing_favorited"],
    "home_buyer_email": "home_buyer@email.com"
}
```
Subscribe to events for the given home_buyers.

Everytime you subscribe to an event, we will send you a notification with
the just created webhook information to the defined `delivery_url`. The subscription will be serialized and the response will return the ID of that subscription as the first field.

#### HTTP Request
`POST /home_buyers/webhooks/subscriptions`

#### Parameters

Name | Required? | Description
--------- | ------- | -----------
home_buyer | yes | email(required) and phone of the target home_buyers
events | yes| array with the list of target events. [supported_events](http://localhost:4567/#events). ex: `['all']`
metadata | yes | anything that you need to recognize this user in your system, or query in our API, we recommend that to be the user_id inside your system.

### Unsubscribing
```json
//RESPONSE EXAMPLE
{
    "deleted_count": 1,
    "conditions": {
        "metadata": "user_id_in_your_system", // provide either metadata
        "id": "1" // or subscription id
    }
}

```


Destroy a subscription providing either metadata or id retuned when subscribing, so that your system won't receive events for the given user.

#### HTTP Request

`DELETE /home_buyers/webhooks/subscriptions`

#### Parameters

Name | Required? | Description
--------- | ------- | -----------
metadata | either or | -
id | either or | -

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
    "total_pages_count": 1,
    "listings_per_page": 100,
    "events": [
        {
            "id": "5d7bf7967b571f00122e295c",
            "created_at": 1568405398,
            "type": "listing_changed",
            "data": {
                "listing_diff": {
                    "price_cents": [
                        "2000000",
                        "3000000"
                    ],
                    "status": [
                        "peding",
                        "active"
                    ]
                }
            }
        }
    ]
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
After subscribing successfully, you will begin to receive events for your home_buyers to the defined delivery_url.

The follow schema is used for every event payload, the example of data is available [here](/#event-types)

```json
//BODY EXAMPLE
{
    "current_page": 1,
    "total_pages_count": 1,
    "events_per_page": 100,
    "events": [
        {
            "id": "5d7bf6117b571f000f2e2989",
            "created_at": 1568405009,
            "type": "finance_requested",
            "partner_name": "mybank",
            "data": {
                "listing": {
                    "id": "listing_1",
                    "bathrooms_count": "1",
                    "bedrooms_count": "1",
                    "description": "description",
                    "listing_image_cover_url": "https://listing-images.nestready.net/dArboFrG37bMhDjHxWUMBZ3vs",
                    "mls_number": "1234mls",
                    "price_cents": "100_000",
                    "year_built": "1990",
                    "property": {
                      "id":"5ddc17ffa6bbb19bcadd97b9",
                      "country":"US",
                      "latitude":"45",
                      "longitude":"-45",
                      "label":"123 Some street",
                      "number":"123",
                      "street":"Some street",
                      "postal_code":"123456",
                      "state_or_province":"US",
                      "coordinates":"45;-45"
                    }
                }
            },
            "home_buyer": {
                "id": "1234",
                "email": "home_buyer@email.com",
                "phone": "(123)12341234"
            },
            "metadata": "user_id_in_your_system"
        }
    ]
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
        "id": "1234",
        "email": "home_buyer@email.com",
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
//DATA EXAMPLE 
{
    "home_buyer": {
        "id": "1234",
        "email": "home_buyer@email.com",
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
```json
//DATA EXAMPLE 
{
    "home_buyer": {
        "id": "1234",
        "email": "home_buyer@email.com",
        "phone": "(123)12341234"
    },
    "data": {
            "location": {
                "id": "1",
                "name": "Boston",
                "level": "place"
            }

    },
    "event_type": "location_unfavorited",
    "partner_name": "mybank",
    "journey_id": "j1"
}
```
This event is triggered once the user unfavorites or unpins a previously favorited location.

### property_visit_requested
```json
//DATA EXAMPLE 
{
    "home_buyer": {
        "id": "1234",
        "email": "home_buyer@email.com",
        "phone": "(123)12341234"
    },
    "data": {
            "listing": {
                    "id": "listing_1",
                    "mls_number": "1234mls",
                    "listing_image_cover_url": "https://listing-images.nestready.net/dArboFrG37bMhDjHxWUMBZ3vs",
                    "price_cents": "100_000",
                    "bathrooms_count": "1",
                    "bedrooms_count": "1",
                    "year_built": "1990",
                    "description": "description",
                    "property": {
                      "id":"5ddc17ffa6bbb19bcadd97b9",
                      "country":"US",
                      "latitude":"45",
                      "longitude":"-45",
                      "label":"123 Some street",
                      "number":"123",
                      "street":"Some street",
                      "postal_code":"123456",
                      "state_or_province":"US",
                      "coordinates":"45;-45"
                    }
                  }
    },
    "event_type": "property_visit_requested",
    "partner_name": "mybank",
    "journey_id": "j1"
}
```

This event is triggered once the user clicks on the option to schedule a visit to a property, either from the listings dashboards or from the property details itself.


### listing_favorited
```json
//DATA EXAMPLE 
{
    "home_buyer": {
        "id": "1234",
        "email": "home_buyer@email.com",
        "phone": "(123)12341234"
    },
    "data": {
            "listing": {
                    "id": "listing_1",
                    "mls_number": "1234mls",
                    "listing_image_cover_url": "https://listing-images.nestready.net/dArboFrG37bMhDjHxWUMBZ3vs",
                    "price_cents": "100_000",
                    "bathrooms_count": "1",
                    "bedrooms_count": "1",
                    "year_built": "1990",
                    "description": "description",
                    "property": {
                      "id":"5ddc17ffa6bbb19bcadd97b9",
                      "country":"US",
                      "latitude":"45",
                      "longitude":"-45",
                      "label":"123 Some street",
                      "number":"123",
                      "street":"Some street",
                      "postal_code":"123456",
                      "state_or_province":"US",
                      "coordinates":"45;-45"
                    }
                  }
    },
    "event_type": "listing_favorited",
    "partner_name": "mybank",
    "journey_id": "j1"
}
```

This event is triggered once the user favorites or pins a listing

### listing_unfavorited
```json
//DATA EXAMPLE
{
    "home_buyer": {
        "id": "1234",
        "email": "home_buyer@email.com",
        "phone": "(123)12341234"
    },
    "data": {
            "listing": {
                    "id": "listing_1",
                    "mls_number": "1234mls",
                    "listing_image_cover_url": "https://listing-images.nestready.net/dArboFrG37bMhDjHxWUMBZ3vs",
                    "price_cents": "100_000",
                    "bathrooms_count": "1",
                    "bedrooms_count": "1",
                    "year_built": "1990",
                    "description": "description",
                    "property": {
                      "id":"5ddc17ffa6bbb19bcadd97b9",
                      "country":"US",
                      "latitude":"45",
                      "longitude":"-45",
                      "label":"123 Some street",
                      "number":"123",
                      "street":"Some street",
                      "postal_code":"123456",
                      "state_or_province":"US",
                      "coordinates":"45;-45"
                    }
                  }
    },
    "event_type": "listing_ufavorited",
    "partner_name": "mybank",
    "journey_id": "j1"
}

```
This evente is triggerend once the user unfavorites or unpins a favorited listing/property.

### saved_search_updated
```json
//DATA EXAMPLE
{
    "home_buyer": {
        "id": "1234",
        "email": "home_buyer@email.com",
        "phone": "(123)12341234"
    },
    "data": {
        "searches": [{
            "id": "search_1",
            "bathrooms_count": "1",
            "bedrooms_count": "2",
            "location": {
                "id": "1",
                "name": "boston",
                "level": "place"
            },
            "max_price_cents": "100_000_000",
            "min_price_cents": "",
            "listing_image_cover_url": "https://listing-images.nestready.net/dArboFrG37bMhDjHxWUMBZ3vs",
            "property_type": "all"
        }]
    },
"event_type": "saved_search_updated",
"partner_name": "mybank",
"journey_id": "j1"
}
```
This event is triggered once the user has already perfomed a property search and then saves it.

### new_listings_from_saved_search
```json
//DATA EXAMPLE 
{
    "home_buyer": {
        "id": "1234",
        "email": "home_buyer@email.com",
        "phone": "(123)12341234"
    },
    "saved_search_id": 1,
    "new_listings": ["listing": {
        "id": "listing_1",
        "bathrooms_count": "1",
        "bedrooms_count": "1",
        "description": "description",
        "listing_image_cover_url": "https://listing-images.nestready.net/dArboFrG37bMhDjHxWUMBZ3vs",
        "mls_number": "1234mls",
        "price_cents": "100_000",
        "year_built": "1990",
        "property": {
          "id":"5ddc17ffa6bbb19bcadd97b9",
          "country":"US",
          "latitude":"45",
          "longitude":"-45",
          "label":"123 Some street",
          "number":"123",
          "street":"Some street",
          "postal_code":"123456",
          "state_or_province":"US",
          "coordinates":"45;-45"
        }
    }]
}
```

This event is triggered by listings recently created that matches a saved search's criteria.

### saved_search_deleted
```json
//DATA EXAMPLE
{
    "home_buyer": {
        "id": "1234",
        "email": "home_buyer@email.com",
        "phone": "(123)12341234"
    },
    "data": {
        "searches": [{
            "id": "search_1",
            "bathrooms_count": "1",
            "bedrooms_count": "2",
            "location": {
                "id": "1",
                "name": "boston",
                "level": "place"
            },
            "max_price_cents": "100_000_000",
            "min_price_cents": "",
            "listing_image_cover_url": "https://listing-images.nestready.net/dArboFrG37bMhDjHxWUMBZ3vs",
            "property_type": "all"
        }]
    },
"event_type": "search_deleted",
"partner_name": "mybank",
"journey_id": "j1"
}
```
This event is triggered when the user deletes a previously saved search.

### saved_search_shared
```json
//DATA EXAMPLE
{
    "home_buyer": {
        "id": "1234",
        "email": "home_buyer@email.com",
        "phone": "(123)12341234"
    },
    "data": {
        "search": {
            "id": "search_1",
            "bathrooms_count": "1",
            "bedrooms_count": "2",
            "location": {
                "id": "locationID",
                "name": "boston",
                "level": "metro"
            },
            "max_price_cents": "100_000_000",
            "min_price_cents": "nil",
            "listing_image_cover_url": "https://listing-images.nestready.net/dArboFrG37bMhDjHxWUMBZ3vs",
            "property_type": "apartment/condo"
        }
    },
    "event_type": "saved_search_shared",
    "partner_name": "mybank",
    "journey_id": "j1"
}
```
This event is triggered once the user has already perfomed a property search, saved it, then shares it.

### email_signed_up
```json
//DATA EXAMPLE
{
    "home_buyer": {
      "id": "1234",
        "email": "home_buyer@email.com",
        "phone": "(123)12341234"
    },
    "data": { "timestamp": "2019-09-09 21:09:23 UTC" },
    "event_type": "email_signed_up",
    "partner_name": "mybank",
    "journey_id": "j1"
}
```
This event is triggered once the user provides its email for the first time using one of the home_buyers forms or sharing a search.


# Listing
## Webhook Subscriptions
### Subscribing
```json
// BODY EXAMPLE
{
    "listing_id": "listing1"
    "events": ["listing_changed"],
    "delivery_url": "https://api.your_url.com/nestready/events",
    "metadata": "listing_id_in_your_system"
}
```
Subscribe to events for the given listing.

Everytime you subscribe to an event, we will send you a notification with
the just created webhook information to the defined `delivery_url`.

#### HTTP Request
`POST /listing/webhooks/subscriptions`

#### Parameters

Name | Required? | Description
--------- | ------- | -----------
listing_id | yes | email(required) and phone of the target home_buyers
events | yes| array with the list of target events. [supported_events](http://localhost:4567/#events). ex: `['all']`
metadata | yes | anything that you need to recognize this user in your system, or query in our API, we recommend that to be the user_id inside your system.

### Unsubscribing

Destroy a subscription, so that your system won't receive events for the given
user.
#### HTTP Request

`DELETE /listing/webhooks/subscriptions`

#### Parameters

Name | Required? | Description
--------- | ------- | -----------
metadata | yes | -

<aside class="success">It will delete all matched subscriptions.</aside>


## Events
### Listing
Method used only for Disaster Recovery, the retention period is 48
hours (meaning that events occured more than 48 hours ago won't be retrieved).


```json
//BODY EXAMPLE
{
  "current_page": 1,
  "total_pages_count": 0,
  "events_per_page": 100,
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
After subscribing to the event, whenever an event related to the subscribed homebuyer is triggered on our side, we will be sending the payload of that event to the develivery_url of the given subscription. The following schema is used for every event payload, the example of data is available.

```json
//BODY EXAMPLE
{
    "current_page": 1,
    "total_pages_count": 1,
    "listings_per_page": 100,
    "events": [{
            "id": "5d7ab6207b571f00122e2947",
            "created_at": 1568323104,
            "type": "listing_changed",
            "data": {
                "listing_diff": {
                    "price_cents": [
                        "2000000",
                        "3000000"
                    ],
                    "status": [
                        "peding",
                        "active"
                    ]
                }
            }
        }
}

```

#### HTTP Request
`POST delivery_url`


## Event types
```json
//BODY EXAMPLE
{
   "event_type": "listing_changed",
   "data": {
      "listing_diff": { 
        "price_cents": [ "2000000", "3000000" ],
        "status": ["peding", "active"]
      }
   },
   "listing_id": "2"
}
```
### listing_changed
This event is triggered when a property has an update. In this data example, the previous price for this property was 100000, then it was updated to 100001.

<aside class="success">The possible statuses for listings are: [active, cancelled, closed, expired, pendind, withdrawn]</aside>
