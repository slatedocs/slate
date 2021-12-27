# Pricing Tier

## List Pricing Tiers

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/pricing_tiers/', {
  method: 'GET',
  headers: {
    'Authorization': '<your token>',
  },
  body: {
  data: {
    type: "pricing_tier",
    attributes: {
      entity_id: <entity id>,
      entity_type: <entity type>
    }
  }
}
})
```

> Make sure you replace <your token> with the JWT you get when you authenticate. 

> Make sure you replace <event uri> with the event uri for the event . 

> Make sure you replace <entity id> with the id for the entity associated to pricing tier to list. 

> Make sure you replace <entity type> as integer with the nunmber for the entity associated to pricing tier to list.

  -- 1 : Attendee type

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "36457",
    "type": "pricing_tiers",
    "attributes": {
      "price": "99.0",
      "start_date": "2013-03-02T19:00:00.000-05:00",
      "end_date": "2013-03-22T19:00:00.000-05:00",
      "entity_id": 62523,
      "entity_type": "AttendeeType",
      "archived": false
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

This endpoint list pricing tiers and return it

### HTTP Request

`GET /v1/events/event_uri/pricing_tiers/`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
event_uri | string  | The event_uri for the desired event
   id     | integer | The id for the desired pricing tier


## Get Pricing Tier

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/pricing_tiers/<id>', {
  method: 'PUT',
  headers: {
    'Authorization': '<your token>',
  },
  body: {
  data: {
    type: "pricing_tier",
    attributes: {
      entity_id: <entity id>,
      entity_type: <entity type>
    }
  }
}
})
```

> Make sure you replace <your token> with the JWT you get when you authenticate. 

> Make sure you replace <event uri> with the event uri for the event. 

> Make sure you replace <id> with the id for the pricing tier to get. 

> Make sure you replace <entity id> with the id for the entity associated to pricing tier. 

> Make sure you replace <entity type> as integer with the number for the entity associated to pricing tier.

  -- 1 : Attendee type

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "36457",
    "type": "pricing_tiers",
    "attributes": {
      "price": "99.0",
      "start_date": "2013-03-02T19:00:00.000-05:00",
      "end_date": "2013-03-22T19:00:00.000-05:00",
      "entity_id": 62523,
      "entity_type": "AttendeeType",
      "archived": false
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

This endpoint get a pricing tier and return it

### HTTP Request

`GET /v1/events/event_uri/pricing_tiers/id`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
event_uri | string  | The event_uri for the desired event
   id     | integer | The id for the desired pricing tier

## Create Pricing Tier

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/pricing_tiers/', {
  method: 'POST',
  headers: {
    'Authorization': '<your token>',
  },
  body: {
  data: {
    type: "pricing_tier",
    attributes: {
      entity_id: <entity id>,
      entity_type: <entity type>,
      start_date: "2013-03-03", 
      end_date: "2013-03-23", 
      price: 99
    }
  }
}
})
```

> Make sure you replace <your token> with the JWT you get when you authenticate. 

> Make sure you replace <event uri> with the event uri for the event . 

> Make sure you replace <id> with the id for the pricing tier to create. 

> Make sure you replace <entity id> with the id for the entity associated to pricing tier to create. 

> Make sure you replace <entity type> as integer with the number for the entity associated to pricing tier to create.

  -- 1 : Attendee type

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "36457",
    "type": "pricing_tiers",
    "attributes": {
      "price": "99.0",
      "start_date": "2013-03-02T19:00:00.000-05:00",
      "end_date": "2013-03-22T19:00:00.000-05:00",
      "entity_id": 62523,
      "entity_type": "AttendeeType",
      "archived": false
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

This endpoint create a pricing tier and return it, , Entities supported : AttendeeType.

### HTTP Request

`POST /v1/events/event_uri/pricing_tiers/`

### Path Parameters

Parameter  |  Type   | Description
---------  | ------- | -----------
entity_id  | integer | entity id to which pricing tier belongs
entity_type| string  | entity type to which pricing tier belongs
start_date | date    | start date for pricing tier
end_date   | date    | end date for pricing tier
price      | float   | price for pricing tier

## Update Pricing Tier

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/pricing_tiers/<id>', {
  method: 'PUT',
  headers: {
    'Authorization': '<your token>',
  },
  body: {
  data: {
    type: "pricing_tier",
    attributes: {
      entity_id: <entity id>,
      entity_type: <entity type>,
      start_date: "2013-03-03", 
      end_date: "2013-03-23", 
      price: 99
    }
  }
}
})
```

> Make sure you replace <your token> with the JWT you get when you authenticate. 

> Make sure you replace <event uri> with the event uri for the event to update. 

> Make sure you replace <id> with the id for the pricing tier to update. 

> Make sure you replace <entity id> with the id for the entity associated to pricing tier to update. 

> Make sure you replace <entity type> as integer with the nunmber for the entity associated to pricing tier to update.

  -- 1 : Attendee type

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "36457",
    "type": "pricing_tiers",
    "attributes": {
      "price": "99.0",
      "start_date": "2013-03-02T19:00:00.000-05:00",
      "end_date": "2013-03-22T19:00:00.000-05:00",
      "entity_id": 62523,
      "entity_type": "AttendeeType",
      "archived": false
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

This endpoint update a pricing tier and return it, Entities supported : AttendeeType.

### HTTP Request

`PUT /v1/events/event_uri/pricing_tiers/id`

### Path Parameters

Parameter  |  Type   | Description
---------  | ------- | -----------
entity_id  | integer | entity id to which pricing tier belongs
entity_type| string  | entity type to which pricing tier belongs
start_date | date    | start date for pricing tier
end_date   | date    | end date for pricing tier
price      | float   | price for pricing tier

## Destroy Pricing Tier
```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/pricing_tiers/<id>', {
  method: 'DELETE',
  headers: {
    'Authorization': '<your token>',
  },
})
```

> Make sure you replace <your token> with the JWT you get when you authenticate. 

> Make sure you replace <event uri> with the event uri for the event to destroy. 

> Make sure you replace <id> with the id for the pricing tier to update. 

>Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "36453",
    "type": "pricing_tiers",
    "attributes": {
      "price": "24.0",
      "start_date": "2013-02-08T19:00:00.000-05:00",
      "end_date": "2013-02-11T19:00:00.000-05:00",
      "entity_id": 62523,
      "entity_type": "AttendeeType",
      "archived": true
    }
  }
}
```

This endpoint destroy a pricing tier and return it

### HTTP Request

`DELETE /v1/events/event_uri/pricing_tiers/id`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
event_uri | string  | The event_uri for the desired event
   id     | integer | The id for the desired pricing tier

