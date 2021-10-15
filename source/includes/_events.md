# Events

## List Events

```javascript
fetch('https://core.eventtia.com/v1/events/', {
  method: 'GET',
  headers: {
    'Authorization': '<your token>',
  }})
```

> Make sure you replace <your token> with the JWT you get when you authenticate. 

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": [
    {
      id:, #ver que id pasar
      "type": "events",
      "attributes": {
        "name": "Event name",
        "description": "description of an event",
        "start_date": "2020-04-13 15:54:37 -0500",
        "end_date": "2020-04-15 15:54:57 -0500",
        "active_modules": null,
        "fields_data": null,
        "budget": 0.0,
        "event_type": "virtual",
        "is_template": false,
        "event_uri": "event_uri",
        "timezone": "America/Bogota",
        "location": null,
        "default_language": "es",
        "virtual_timezone": null,
        "total_attendees": 0,
        "banner": {
          "filename": "file_name",
          "thumb": "url_image",
          "small":  "url_image",
          "medium": "url_image",
          "large": "url_image",
        },
        logo: {
        "filename": "file_name",
          "thumb": "url_image",
          "small":  "url_image",
          "medium": "url_image",
          "large": "url_image",
        } 
      },
      "relationships": {
        "settings": {
          "data": {
            "id": "108",
            "type": "settings"
          }
        }
      }
    }
  ],
  "meta": {
    "has_events": true,
    "has_templates": true
  },
  "links": {
    "current_page": ,
    "first_page": ,
    "last_page": ,
    "prev_page": ,
    "next_page": 
  }
}
```

This endpoint return a list of events

### HTTP Request

`GET /v1/events/`

## Get Event

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>', {
  method: 'GET',
  headers: {
    'Authorization': '<your token>',
  }})
```

> Make sure you replace <your token> with the JWT you get when you authenticate. 

> Make sure you replace <event uri> with the event uri for the event to update. 

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    id: , #ver que id pasar
    "type": "events",
    "attributes": {
      "name": "Event name",
      "description": "description of an event",
      "start_date": "2020-04-13 15:54:37 -0500",
      "end_date": "2020-04-15 15:54:57 -0500",
      "active_modules": null,
      "fields_data": null,
      "budget": 0.0,
      "event_type": "virtual",
      "is_template": false,
      "event_uri": "event_uri",
      "timezone": "America/Bogota",
      "location": null,
      "default_language": "es",
      "virtual_timezone": null,
      "total_attendees": 0,
      "cloned_from_id": null,
      "banner": {
        "filename": "file_name",
        "thumb": "url_image",
        "small":  "url_image",
        "medium": "url_image",
        "large": "url_image",
      },
      logo: {
       "filename": "file_name",
        "thumb": "url_image",
        "small":  "url_image",
        "medium": "url_image",
        "large": "url_image",
      } 
    },
    "relationships": {
      "settings": {
        "data": {
          "id": "",
          "type": "settings"
        }
      }
    }    
  },
  "included": [
    {
      "id": "21",
      "type": "event_settings",
      "attributes": {
        "payment_method": null,
        "paypal_production_key": null,
        "paypal_sandbox_key": null,
        "paypal_test_mode": null,
        "stripe_secret_api_key": null,
        "stripe_publishable_api_key": null,
        "pay_u_api_key": null,
        "pay_u_merchant_id": null,
        "pay_u_account_id": null,
        "pay_u_api_login": null,
        "pay_u_test_mode": null,
        "currency": null,
        "vat_alias": null,
        "vat_value": null,
        "date_format": "dd/mm/yyyy",
        "time_format": "am_pm",
        "google_analytics_tracking_code": null,
        "google_tag_manager_code": null
      },
      "relationships": {
        "event": {
          "data": {
            "id": "",
            "type": "event"
          }
        }
      }
    }
  ]
}
```

>Example of Event Not Found (404) response: 

```http
HTTP/1.1 404 Not Found
{
  "message": "Couldn't find Event"
}
```

This endpoint return an event

### HTTP Request

`GET /v1/events/event_uri`

### Path Parameters

Parameter | Type | Description
--------- | ---- | -----------
event_uri | string | The event_uri for the desired event

## Create Event

```javascript
fetch('https://core.eventtia.com/v1/events/', {
  method: 'POST',
  headers: {
    'Authorization': '<your token>',
  },
  body: {
  data: {
    id: "21", 
    type: "events",
    attributes: {
      name: "Event name",
      description: "description of an event",
      start_date: "2020-04-13 15:54:37 -0500",
      end_date: "2020-04-15 15:54:57 -0500",
      active_modules: null,
      fields_data: null,
      budget: 545.00,
      event_type: "virtual",
      is_template: false,
      event_uri: "event_uri",
      timezone: "America/Bogota",
      location: null,
      default_language: "es",
      virtual_timezone: null,
      total_attendees: 0,
      banner: {
        filename: "file_name",
        thumb: "url_image",
        small:  "url_image",
        medium: "url_image",
        large: "url_image",
      }
      logo: {
        filename: "file_name",
        thumb: "url_image",
        small: "url_image",
        medium: "url_image",
        large: "url_image",
      }  
    }
  }
  }
})
```

> Make sure you replace <your token> with the JWT you get when you authenticate. 

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    id: "21", 
    "type": "events",
    "attributes": {
      "name": "Event name",
      "description": "description of an event",
      "start_date": "2020-04-13 15:54:37 -0500",
      "end_date": "2020-04-15 15:54:57 -0500",
      "active_modules": null,
      "fields_data": null,
      "budget": 0.0,
      "event_type": "virtual",
      "is_template": false,
      "event_uri": "event_uri",
      "timezone": "America/Bogota",
      "location": null,
      "default_language": "es",
      "virtual_timezone": null,
      "total_attendees": 0,
      "banner": {
        "filename": "file_name",
        "thumb": "url_image",
        "small":  "url_image",
        "medium": "url_image",
        "large": "url_image",
      },
      logo: {
       "filename": "file_name",
        "thumb": "url_image",
        "small":  "url_image",
        "medium": "url_image",
        "large": "url_image",
      } 
    },
    "relationships": {
      "settings": {
        "data": {
          "id": "108",
          "type": "settings"
        }
      }
    }
  }
}
```

>Example of Unprocessable Entity (422) response: 

```http
HTTP/1.1 422 Unprocessable Entity
{
  "message": {
    "start_date": [
      "is beyond the end date."
    ],
    "name": [
      "is already in use"
    ]
  }
}
```

This endpoint create an event and return it

### HTTP Request

`POST /v1/events/`

### Available settings

Parameter | Type | Description
--------- | ---- | -----------
name | string | name of event. 
description | string | description of event.
start_date | date | starting date for event, must be before end date of event.
budget | float | budget for event.
is_template | boolean | this event is a template.
cloned_from_id | integer | event id from this event was cloned
event_type | string | event type ['virtual', 'physical', 'hybrid']. 
event_uri| string | event uri must be an unique name.
logo | file | logo for this event.
banner_image | file | banner image for this event.
currency | string | your event currency for payments and invoices ['COP', 'USD', 'EUR', 'ARS', 'BRL', 'CLP', 'MXN', 'PEN', 'GBP', 'JOD', 'UYU', 'PYG', 'AED', 'CAD', 'VND', 'PHP', 'AUD', 'BOB', 'TND', 'SGD', 'CHF', 'CFA', 'ZAR', 'INR']
date_format | string | event date format ['dd/mm/yyyy', 'mm/dd/yyyy']. 
time_format | string | event time format ['hours_24', 'am_pm']. 

## Update Event

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>', {
  method: 'PUT',
  headers: {
    'Authorization': '<your token>',
  },
  body: {
  data: {
    type: "events",
    attributes: {
      name: "Event name",
      description: "description of an event",
      start_date: "2020-04-13 15:54:37 -0500",
      end_date: "2020-04-15 15:54:57 -0500",
      active_modules: null,
      fields_data: null,
      budget: 545.00,
      event_type: "virtual",
      is_template: false,
      event_uri: "event_uri",
      timezone: "America/Bogota",
      location: null,
      default_language: "es",
      virtual_timezone: null,
      total_attendees: 0,
      cloned_from_id: null,
      banner: {
        filename: "file_name",
        thumb: "url_image",
        small:  "url_image",
        medium: "url_image",
        large: "url_image",
      },
      logo: {
        filename: "file_name",
        thumb: "url_image",
        small: "url_image",
        medium: "url_image",
        large: "url_image",
      }  
    }, 
    relationships: {
      settings: {
        data: {
          id: "89",
          type: "settings"
        }
      }
    }  
  }
  }
})
```

> Make sure you replace <your token> with the JWT you get when you authenticate. 

> Make sure you replace <event uri> with the event uri for the event to update. 

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "type": "events",
    "attributes": {
      "name": "Event name",
      "description": "description of an event",
      "start_date": "2020-04-13 15:54:37 -0500",
      "end_date": "2020-04-15 15:54:57 -0500",
      "active_modules": null,
      "fields_data": null,
      "budget": 0.0,
      "event_type": "virtual",
      "is_template": false,
      "event_uri": "event_uri",
      "timezone": "America/Bogota",
      "location": null,
      "default_language": "es",
      "virtual_timezone": null,
      "total_attendees": 0,
      "cloned_from_id": null,
      "banner": {
        "filename": "file_name",
        "thumb": "url_image",
        "small":  "url_image",
        "medium": "url_image",
        "large": "url_image",
      },
      logo: {
       "filename": "file_name",
        "thumb": "url_image",
        "small":  "url_image",
        "medium": "url_image",
        "large": "url_image",
      } 
    },
    "relationships": {
      "settings": {
        "data": {
          "id": "",
          "type": "settings"
        }
      }
    } 
  }
}
```

>Example of Unprocessable Entity (422) response: 

```http
HTTP/1.1 422 Unprocessable Entity
{
  "message": {
    "start_date": [
      "is beyond the end date."
      ],
    "name": [
      "is already in use" 
    ]
  }
}
```

This endpoint update an event and return it

### HTTP Request

`PUT /v1/events/event_uri`

### Path Parameters

Parameter | Type | Description
--------- | ---- | -----------
event_uri | string | The event_uri for the desired event

### Available settings

Parameter | Type | Description
--------- | ---- | -----------
name | string | name of event. 
description | string | description of event.
start_date | date | starting date for event, must be before end date of event.
budget | float | budget for event.
is_template | boolean | this event is a template.
cloned_from_id | integer | event id from this event was cloned
event_type | string | event type ['virtual', 'physical', 'hybrid']. 
event_uri| string | event uri must be an unique name.
logo | file | logo for this event.
banner_image | file | banner image for this event.
currency | string | your event currency for payments and invoices ['COP', 'USD', 'EUR', 'ARS', 'BRL', 'CLP', 'MXN', 'PEN', 'GBP', 'JOD', 'UYU', 'PYG', 'AED', 'CAD', 'VND', 'PHP', 'AUD', 'BOB', 'TND', 'SGD', 'CHF', 'CFA', 'ZAR', 'INR']
date_format | string | event date format ['dd/mm/yyyy', 'mm/dd/yyyy']. 
time_format | string | event time format ['hours_24', 'am_pm']. 

## Destroy Event
```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>', {
  method: 'DELETE',
  headers: {
    'Authorization': '<your token>',
  },
})
```

> Make sure you replace <your token> with the JWT you get when you authenticate. 

> Make sure you replace <event uri> with the event uri for the event to destroy. 

>Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    id: "21",
    "type": "events",
    "attributes": {
      "name": "Event name",
      "description": "description of an event",
      "start_date": "2020-04-13 15:54:37 -0500",
      "end_date": "2020-04-15 15:54:57 -0500",
      "active_modules": null,
      "fields_data": null,
      "budget": 0.0,
      "event_type": "virtual",
      "is_template": false,
      "event_uri": "event_uri",
      "timezone": "America/Bogota",
      "location": null,
      "default_language": "es",
      "virtual_timezone": null,
      "total_attendees": 0,
      "banner": {
        "filename": "file_name",
        "thumb": "url_image",
        "small":  "url_image",
        "medium": "url_image",
        "large": "url_image",
      },
      logo: {
       "filename": "file_name",
        "thumb": "url_image",
        "small":  "url_image",
        "medium": "url_image",
        "large": "url_image",
      } 
    },
    "relationships": {
      "settings": {
        "data": {
          "id": "108",
          "type": "settings"
        }
      }
    }
  }
}
```

This endpoint destroy a event and return it

### HTTP Request

`DELETE /v1/events/event_uri`

### Path Parameters

Parameter | Type | Description
--------- | ---- | -----------
event_uri | string | The event_uri for the desired event


## Settings

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/settings', {
  method: 'PATCH',
  headers: {
    'Authorization': '<your token>',
  },
  body: {
    data: {
      type: "event_settings",
      attributes: {
        payment_method: null,
        paypal_production_key: null,
        paypal_sandbox_key: null,
        paypal_test_mode: null,
        stripe_secret_api_key: null,
        stripe_publishable_api_key: null,
        pay_u_api_key: null,
        pay_u_merchant_id: null,
        pay_u_account_id: null,
        pay_u_api_login: null,
        pay_u_test_mode: null,
        currency: null,
        vat_alias: "Recaudo",
        vat_value: 19,
        date_format: "dd/mm/yyyy",
        time_format: "am_pm",
        google_analytics_tracking_code: null,
        google_tag_manager_code: null
      }
    }
  }
})
```

> Make sure you replace <your token> with the JWT you get when you authenticate. 

>Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "3",
    "type": "event_settings",
    "attributes": {
      "payment_method": null,
      "paypal_production_key": null,
      "paypal_sandbox_key": null,
      "paypal_test_mode": null,
      "stripe_secret_api_key": null,
      "stripe_publishable_api_key": null,
      "pay_u_api_key": null,
      "pay_u_merchant_id": null,
      "pay_u_account_id": null,
      "pay_u_api_login": null,
      "pay_u_test_mode": null,
      "currency": null,
      "vat_alias": "Recaudo",
      "vat_value": 19,
      "date_format": "dd/mm/yyyy",
      "time_format": "am_pm",
      "google_analytics_tracking_code": null,
      "google_tag_manager_code": null
    },
    "relationships": {
      "event": {
        "data": {
          "id": "2195",
          "type": "event"
        }
      }
    }
  }
}
```

> Example of a 500 response:

```http
HTTP/1.1 500
{
  "message": {
    "payment_method": [
      "must be one of these: stripe, payu, and paypal"
    ]
  }
}
```
This endpoint allows you modify your event settings

### HTTP Request

`PATCH /v1/events/<event_uri>/settings`


### Path Parameters

Parameter | Type | Description
--------- | ---- | -----------
event_uri | string | The event_uri for the desired event

### Available settings

Parameter | Type | Description
--------- | ---- | -----------
payment_method | string | payment platform to collect money online ['stripe', 'payu', 'paypal']. 
paypal_production_key | string | paypal production key obtained from paypal dashboard.
paypal_sandbox_key | string | paypal sandbox key obtained from paypal dashboard
paypal_test_mode | boolean | when testing your payments won't be any charge to your cards
stripe_secret_api_key | string | stripe secret api key obtained from stripe dashboard
stripe_publishable_api_key | string | stripe secret publishable api key obtained from stripe dashboard
pay_u_api_key | string | pay u api key obtained from pay u dashboard
pay_u_merchant_id | string | pay u merchand id obtained from pay u dashboard
pay_u_account_id | string | pay u account id obtained from pay u dashboard
pay_u_api_login | string | pay u api login obtained from pay u dashboard
pay_u_test_mode | boolean | when testing your payments won't be any charge to your cards
currency | string | your event currency for payments and invoices ['COP', 'USD', 'EUR', 'ARS', 'BRL', 'CLP', 'MXN', 'PEN', 'GBP', 'JOD', 'UYU', 'PYG', 'AED', 'CAD', 'VND', 'PHP', 'AUD', 'BOB', 'TND', 'SGD', 'CHF', 'CFA', 'ZAR', 'INR']
vat_alias | string | how do you want to call your vat value
vat_value | integer/float | Your event vat value


