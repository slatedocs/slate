# Attendees

## List Attendees

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/attendees/', {
  method: 'GET',
  headers: {
    'Authorization': '<your token>',
  }
})
```

> Make sure you replace <your token> with the JWT you get when you authenticate. 

> Make sure you replace <event uri> with the event uri for the event. 

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "62527",
    "type": "attendees",
    "attributes": {
     "first_name": "Mary",
      "last_name": "perez ossa",
      "email": "maryperez@email.com",
      "telephone": "555 3434",
      "updated_by_id": 192,
      "archived": false,
      "fields_data": {
          "281": "george",
          "282": "downtown"
      },
      "photo_url": "url_Image_file"     
    }
  }
}
```

This endpoint list attendees belongs to event and return it

### HTTP Request

`GET /v1/events/event_uri/attendees/`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
event_uri | string  | The event_uri for the desired event


## Get Attendee

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/attendees/<id>', {
  method: 'GET',
  headers: {
    'Authorization': '<your token>',
  }
})
```

> Make sure you replace <your token> with the JWT you get when you authenticate. 

> Make sure you replace <event uri> with the event uri for the event.

> Make sure you replace <id> with the id for the attendee to obtain. 

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "62527",
    "type": "attendees",
    "attributes": {
     "first_name": "Mary",
      "last_name": "perez ossa",
      "email": "maryperez@email.com",
      "telephone": "555 3434",
      "updated_by_id": 192,
      "archived": false,
      "fields_data": {
          "281": "george",
          "282": "downtown"
      },
      "photo_url": "url_Image_file"     
    }
  }
}
```

>Example of Not Found (404) response: 

```http
HTTP/1.1 404 Not Found
{
  {
    "message": "Couldn't find Attendee"
  }
}
```

This endpoint get an attendee and return it

### HTTP Request

`GET /v1/events/event_uri/attendees/id`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
event_uri | string  | The event_uri for the desired event
   id     | integer | The id for the desired attendee

## Create Attendee

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/attendees/', {
  method: 'POST',
  headers: {
    'Authorization': '<your token>',
  },
  body: {
    data: {
      type: "attendees",
      attributes: {
        attendee_type_id: 34,
        first_name: "Mary",
        last_name: "perez ossa",
        email: "maryperez@email.com",
        telephone: 555 3434,
        updated_by_id: 192,
        archived: false,
        fields_data: {
            "f281": "george",
            "f282": "downtown"
        },
        photo_url: "url_Image_file" 
      }
  }
}
})
```

> Make sure you replace <your token> with the JWT you get when you authenticate. 

> Make sure you replace <event uri> with the event uri for the event .  

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "62527",
    "type": "attendees",
    "attributes": {
     "first_name": "Mary",
      "last_name": "perez ossa",
      "email": "maryperez@email.com",
      "telephone": "555 3434",
      "updated_by_id": 192,
      "archived": false,
      "fields_data": {
          "281": "george",
          "282": "downtown"
      },
      "photo_url": "url_Image_file"     
    }
  }
}
```

>Example of Unprocessable Entity (422) response: 

```http
HTTP/1.1 422 Unprocessable Entity
{
  "message": {
    "email": [
      "already taken"
    ]
  }
}
```

This endpoint create an attendee and return it

## Update Attendee

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/attendees/<id>', {
  method: 'PUT',
  headers: {
    'Authorization': '<your token>',
  },
  body: {
  data: {
    type: "attendees",
      attributes: {
        attendee_type_id: 34,
        first_name: "Mary",
        last_name: "perez ossa",
        email: "maryperez@email.com",
        telephone: 555 3434,
        updated_by_id: 192,
        archived: false,
        fields_data: {
            "f281": "george",
            "f282": "downtown"
        },
        photo_url: "url_Image_file" 
      }
}
})
```

> Make sure you replace <your token> with the JWT you get when you authenticate. 

> Make sure you replace <event uri> with the event uri for the event to update. 

> Make sure you replace <id> with the id for the attendee to update. 

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "62527",
    "type": "attendees",
    "attributes": {
     "first_name": "Mary",
      "last_name": "perez ossa",
      "email": "maryperez@email.com",
      "telephone": "555 3434",
      "updated_by_id": 192,
      "archived": false,
      "fields_data": {
          "281": "george",
          "282": "downtown"
      },
      "photo_url": "url_Image_file"     
    }
  }
}
```

>Example of Unprocessable Entity (422) response: 

```http
HTTP/1.1 422 Unprocessable Entity
{
  "message": {
    "email": [
      "already taken"
    ]
  }
}
```

This endpoint update an attendee and return it

### HTTP Request

`PUT /v1/events/event_uri/attendees/id`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
event_uri | string  | The event_uri for the desired event
   id     | integer | The id for the desired attendee

## Destroy Attendee
```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/attendees/<id>', {
  method: 'DELETE',
  headers: {
    'Authorization': '<your token>',
  },
})
```

> Make sure you replace <your token> with the JWT you get when you authenticate. 

> Make sure you replace <event uri> with the event uri for the event to destroy. 

> Make sure you replace <id> with the id for the attendeeto update. 

>Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "62527",
    "type": "attendees",
    "attributes": {
     "first_name": "Mary",
      "last_name": "perez ossa",
      "email": "maryperez@email.com",
      "telephone": "555 3434",
      "updated_by_id": 192,
      "archived": true,
      "fields_data": {
          "281": "george",
          "282": "downtown"
      },
      "photo_url": "url_Image_file"     
    }
  }
}
```

This endpoint destroy an attendee and return it

### HTTP Request

`DELETE /v1/events/event_uri/attendees/id`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
event_uri | string  | The event_uri for the desired event
   id     | integer | The id for the desired attendee

