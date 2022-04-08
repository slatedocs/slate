# Workshops

## List Workshops

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/workshops/', {
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
  "data": {
    "id": "62527",
    "type": "workshops",
    "attributes": {
     "name": "Mary",
      "start_date": "2021-12-02",
      "end_date": "2021-12-20",
      "limit": "0",
      "location": "hotel",
      "description": "business workshop",
      "price": {
          "1": "300"
      },
      "archived": false,
      "show_on_register": false,
      "allow_blocking_workshops": false
    },
    "relationships": {
      "speakers": {
        "data": [
          {
            "id": "2"
            "type": "speaker"
          }
        ]
      }
    }
  }
}
```

This endpoint list workshops belongs to event and return it

### HTTP Request

`GET /v1/events/:event_uri/workshops/`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
event_uri | string  | The event_uri for the desired event.
page | json | A page object as described <a href="#pagination">here</a>

### Query Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
  name    | string  | Workshop name
 speaker  | integer | speaker id
  day     |  date   | A datetime in the following format "14/08/2021"
start_date|  date   | A datetime in the following format "14/08/2021"
updated_at|  date   | A datetime in the following format "14/08/2021"

## Get Workshop

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/Workshops/<id>', {
  method: 'GET',
  headers: {
    'Authorization': '<your token>',
  }
})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate. 

> Make sure you replace &lt;event uri&gt; with the event uri for the event.

> Make sure you replace &lt;id&gt; with the id for the workshop to obtain. 

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "62527",
    "type": "workshops",
    "attributes": {
     "name": "Mary",
      "start_date": "2021-12-02",
      "end_date": "2021-12-20",
      "limit": "0",
      "location": "hotel",
      "description": "business workshop",
      "price": {
          "1": "300"
      },
      "archived": false,
      "show_on_register": false,
      "allow_blocking_workshops": false
    },
    "relationships": {
      "speakers": {
        "data": [
          {
            "id": "2"
            "type": "speaker"
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
    "message": "Couldn't find Workshop"
  }
}
```

This endpoint get an workshop and return it

### HTTP Request

`GET /v1/events/:event_uri/workshops/:id`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
event_uri | string  | The event_uri for the desired event
   id     | integer | The id for the desired workshop

## Create Workshop

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/workshops/', {
  method: 'POST',
  headers: {
    'Authorization': '<your token>',
  },
  body: {
    data: {
      type: "workshops",
      attributes: {
        name: "Mary",
        start_date: "2021-12-02",
        end_date: "2021-12-20",
        limit: 0,
        location: "hotel",
        description: "business workshop",
        show_on_register: false,
        allow_blocking_workshops: false,
        price: {
            "1": "300"
        }
      },
      relationships: {
        speakers: {
          data: [
            {
              type: "speaker", id: 2
            }
          ]
        }
      }
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
    "type": "workshops",
    "attributes": {
     "name": "Mary",
     "start_date": "2021-12-02",
     "end_date": "2021-12-20",
     "limit": "0",
     "location": "hotel",
     "description": "business workshop",
     "price": {
      "1": "300"},
     "archived": false,
     "show_on_register": false,
     "allow_blocking_workshops": false
    },
    "relationships": {
      "speakers": {
        "data": [
          {
            "id": "2"
            "type": "speaker"
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
    "speaker": [
      "invalid speaker"
    ]
  }
}
```

This endpoint create an workshop and return it

### HTTP Request

`GET /v1/events/:event_uri/workshops/`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
event_uri | string  | The event_uri for the desired event

### Body Parameters

Parameter  |  Type  | Description
---------  | -------| -----------
name       | string | name for workshop
start_date |  date  | start date for workshop
end_date   |  date  | end date for workshop
limit      | integer| attendees limit for workshop
location   | string | location for workshop
description| string | description for workshop
price      |  hash  | key-value object setting a price for each attendee type id
show_on_register | boolean | show this workshop on registration page
allow_blocking_workshops | boolean | allow block hours for this workshop

## Update Workshop

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/workshops/<id>', {
  method: 'PUT',
  headers: {
    'Authorization': '<your token>',
  },
  body: {
    data: {
      type: "workshops",
      attributes: {
        name: "Mary",
        start_date: "2021-12-02",
        end_date: "2021-12-20",
        limit: 0,
        location: "hotel",
        description: "business workshop",
        show_on_register: false,
        allow_blocking_workshops: false,
        price: {
            "1": "300"
        }
      },
      relationships: {
        speakers: {
          data: [
            {
              type: "speaker", id: 2
            }
          ]
        }
      }
    }  
  }
}
})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate. 

> Make sure you replace &lt;event uri&gt; with the event uri for the event to update. 

> Make sure you replace &lt;id&gt; with the id for the workshop to update. 

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "62527",
    "type": "workshops",
    "attributes": {
     "name": "Mary",
      "start_date": "2021-12-02",
      "end_date": "2021-12-20",
      "limit": "0",
      "location": "hotel",
      "description": "business workshop",
      "price": {
          "1": "300"
      },
      "archived": false,
      "show_on_register": false,
      "allow_blocking_workshops": false
    },
    "relationships": {
      "speakers": {
        "data": [
          {
            "id": "2"
            "type": "speaker"
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
    "speaker": [
      "invalid speaker"
    ]
  }
}
```

This endpoint update an workshop and return it

### HTTP Request

`PUT /v1/events/:event_uri/workshops/:id`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
event_uri | string  | The event_uri for the desired event
   id     | integer | The id for the desired workshop

### Body Parameters

Parameter  |  Type  | Description
---------  | -------| -----------
name       | string | name for workshop
start_date |  date  | start date for workshop
end_date   |  date  | end date for workshop
limit      | integer| attendees limit for workshop
location   | string | location for workshop
description| string | description for workshop
price      |  hash  | key-value object setting a price for each attendee type id
show_on_register | boolean | show this workshop on registration page
allow_blocking_workshops | boolean | allow block hours for this workshop

## Destroy Workshop
```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/workshops/<id>', {
  method: 'DELETE',
  headers: {
    'Authorization': '<your token>',
  },
})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate. 

> Make sure you replace &lt;event uri&gt; with the event uri for the event to destroy. 

> Make sure you replace &lt;id&gt; with the id for the workshop to update. 

>Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "62527",
    "type": "workshops",
    "attributes": {
     "name": "Mary",
      "start_date": "2021-12-02",
      "end_date": "2021-12-20",
      "limit": "0",
      "location": "hotel",
      "description": "business workshop",
      "price": {
          "1": "300"
      },
      "archived": false,
      "show_on_register": false,
      "allow_blocking_workshops": false
    },
    "relationships": {
      "speakers": {
        "data": [
          {
            "id": "2"
            "type": "speaker"
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
    "message": "Couldn't find Workshop"
  }
}
```

This endpoint destroy an workshop and return it

### HTTP Request

`DELETE /v1/events/:event_uri/workshops/:id`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
event_uri | string  | The event_uri for the desired event
   id     | integer | The id for the desired workshop

