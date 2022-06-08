# Attendee Types

## List Attendee Types

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/attendee_types/', {
  method: 'GET',
  headers: {
    'Authorization': '<your token>',
  }
})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate. 

> Make sure you replace &lt;event uri&gt; with the event uri for the event. 

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": [
    {
      "id": "62527",
      "type": "attendee_types",
      "attributes": {
        "name": "Attendee type name",
        "description": "attendee_type_description",
        "price": "34",
        "limit": 25,
        "confirmation_required": false,
        "allow_public_registration": false,
        "valid_if_no_payments": true,
        "updated_by_id": 192,
        "archived": false
      },
      "relationships": {
        "fields": {
          "data": [
            {
              "id": "331",
              "type": "field"
            }
          ]
        }
      }
    }
  ]
}
```

This endpoint list attendee types belongs to event and return it

### HTTP Request

`GET /v1/events/event_uri/attendee_types/`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
event_uri | string  | The event_uri for the desired event
page | json | A page object as described <a href="#pagination">here</a>


## Get Attendee Type

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/attendee_types/<id>', {
  method: 'GET',
  headers: {
    'Authorization': '<your token>',
  }
})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate. 

> Make sure you replace &lt;event uri&gt; with the event uri for the event.

> Make sure you replace &lt;id&gt; with the id for the attendee type to obtain. 

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "62527",
    "type": "attendee_types",
    "attributes": {
      "name": "Attendee type name",
      "description": "Attendee type description",
      "price": "34",
      "limit": 25,
      "confirmation_required": false,
      "allow_public_registration": false,
      "valid_if_no_payments": true,
      "updated_by_id": 192,
      "archived": false
    },
    "relationships": {
      "fields": {
        "data": [
          {
            "id": "331",
            "type": "field"
          }
        ]
      }
    }
  }
}
```

>Example of Not Found (404) response: 

```http
HTTP/1.1 404 Not Found
{
  {
    "message": "Couldn't find AttendeeType"
  }
}
```

This endpoint get an attendee type and return it

### HTTP Request

`GET /v1/events/event_uri/attendee_types/id`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
event_uri | string  | The event_uri for the desired event
   id     | integer | The id for the desired attendee type

### HTTP Request for optional include fields

`GET /v1/events/:event_uri/attendee_types/:id?include=value`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
include   | string  | this value gives informations for each relationships

### Include Options

Value |  Type   | Description
----- | ------- | -----------
fields | string | include fields relationships
current_price | string | include current price

## Create Attendee Type

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/attendee_types/', {
  method: 'POST',
  headers: {
    'Authorization': '<your token>',
  },
  body: {
  data: {
    id: 62527
    type: "attendee_type",
    attributes: {
      name: "Attendee type name",
      description: "Attendee type description",
      price: 34,
      limit: 25,
      confirmation_required: false,
      allow_public_registration: false,
      valid_if_no_payments: true,
      archived: false
    }
  }
}
})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate. 

> Make sure you replace &lt;event uri&gt; with the event uri for the event .  

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "62527",
    "type": "attendee_types",
    "attributes": {
      "name": "Attendee type name",
      "description": "Attendee type description",
      "price": "34",
      "limit": 25,
      "confirmation_required": false,
      "allow_public_registration": false,
      "valid_if_no_payments": true,
      "updated_by_id": 192,
      "archived": false
    },
    "relationships": {
      "fields": {
        "data": [
          {
            "id": "331",
            "type": "field"
          }
        ]
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
    "price": [
      "must be an integer"
    ]
  }
}
```

This endpoint create an attendee type and return it

### HTTP Request

`POST /v1/events/:event_uri/attendee_types/`

### Body Parameters

Parameter  |  Type   | Description
---------  | ------- | -----------
name       | string  | name for attendee type
description| string  | description for attendee type
price      | integer | price for attendee type
limit      | integer | attendees limit for this attendee type
confirmation_required | boolean | confirmation required for attendee type
allow_public_registration | boolean | allow public registration for this attendee type
valid_if_no_payments | boolean | valid attendee type if no payments

## Update Attendee Type

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/attendee_types/<id>', {
  method: 'PUT',
  headers: {
    'Authorization': '<your token>',
  },
  body: {
  data: {
    type: "attendee_type",
    attributes: {
      name: "Attendee type name",
      description: "Attendee type description",
      price: 34,
      limit: 25,
      confirmation_required: false,
      allow_public_registration: false,
      valid_if_no_payments: true,
			allow_printing_without_payment: false
    }
  }
}
})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate. 

> Make sure you replace &lt;event uri&gt; with the event uri for the event to update. 

> Make sure you replace &lt;id&gt; with the id for the attendee type to update. 

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "62527",
    "type": "attendee_types",
    "attributes": {
      "name": "Attendee type name",
      "description": "Attendee type description",
      "price": "34",
      "limit": 25,
      "confirmation_required": false,
      "allow_public_registration": false,
      "valid_if_no_payments": true,
      "updated_by_id": 192,
      "archived": false
    },
    "relationships": {
      "fields": {
        "data": [
          {
            "id": "331",
            "type": "field"
          }
        ]
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
    "price": [
      "must be an integer"
    ]
  }
}
```

This endpoint update an attendee type and return it

### HTTP Request

`PUT /v1/events/:event_uri/attendee_types/:id`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
event_uri | string  | The event_uri for the desired event
   id     | integer | The id for the desired attendee type

### Body Parameters

Parameter  |  Type   | Description
---------  | ------- | -----------
name       | string  | name for attendee type
description| string  | description for attendee type
price      | integer | price for attendee type
limit      | integer | attendees limit for this attendee type
confirmation_required | boolean | confirmation required for attendee type
allow_public_registration | boolean | allow public registration for this attendee type
valid_if_no_payments | boolean | valid attendee type if no payments

## Destroy Attendee Type
```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/attendee_types/<id>', {
  method: 'DELETE',
  headers: {
    'Authorization': '<your token>',
  },
})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate. 

> Make sure you replace &lt;event uri&gt; with the event uri for the event to destroy. 

> Make sure you replace &lt;id&gt; with the id for the attendee type to update. 

>Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "62528",
    "type": "attendee_types",
    "attributes": {
      "name": "Attendee type name",
      "description": "Attendee type description",
      "price": "545.0",
      "limit": 500,
      "confirmation_required": true,
      "allow_public_registration": true,
      "valid_if_no_payments": true,
      "archived": true
    },
    "relationships": {
      "fields": {
        "data": [
          {
            "id": "331",
            "type": "field"
          }
        ]
      }
    }
  }
}
```

This endpoint destroy an attendee type and return it

### HTTP Request

`DELETE /v1/events/:event_uri/attendee_types/:id`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
event_uri | string  | The event_uri for the desired event
   id     | integer | The id for the desired attendee type


## Available Seats

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/attendee_types/<id>/available-seats', {
  method: 'GET',
  headers: {
    'Authorization': '<your token>',
  }
})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate. 

> Make sure you replace &lt;event uri&gt; with the event uri for the event.

> Make sure you replace &lt;id&gt; with the id for the attendee type to obtain. 

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "meta: {
    "available: 999,
    "occupied": 5
  }
}
```

>Example of Not Found (404) response: 

```http
HTTP/1.1 404 Not Found
{
  {
    "message": "Couldn't find AttendeeType"
  }
}
```

This endpoint get an attendee type and return his available seats

### HTTP Request

`GET /v1/events/event_uri/attendee_types/id/available_seats`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
event_uri | string  | The event_uri for the desired event
   id     | integer | The id for the desired attendee type