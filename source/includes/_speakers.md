# Speakers

## List Speaker

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/speakers/', {
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
  "id": "14",
  "type": "speakers",
    "attributes": {
      "name": "Mary",
      "last_name": "Perez Ossa",
      "email": "mary@email.com",
      "biography": "biography Mary",
      "twitter": "Twitter Mary",
      "website": "Website Mary",
      "photo": "url_img_file"
      }
    }
}
```

This endpoint list speakers belongs to event and return it

### HTTP Request

`GET /v1/events/event_uri/speakers/`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
event_uri | string  | The event_uri for the desired event

## Get Speaker

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/speakers/<id>', {
  method: 'GET',
  headers: {
    'Authorization': '<your token>',
  }
})
```

> Make sure you replace <your token> with the JWT you get when you authenticate. 

> Make sure you replace <event uri> with the event uri for the event.

> Make sure you replace <id> with the id for the speaker to obtain. 

> Example of a successful (200) response:


```http
HTTP/1.1 200 OK
{
  "data": {
  "id": "14",
  "type": "speakers",
    "attributes": {
      "name": "Mary",
      "last_name": "Perez Ossa",
      "email": "mary@email.com",
      "biography": "biography Mary",
      "twitter": "Twitter Mary",
      "website": "Website Mary",
      "photo": "url_image_file"
      }
    }
}
```

>Example of Not Found (404) response: 

```http
HTTP/1.1 404 Not Found
{
  {
    "message": "Couldn't find Speaker"
  }
}
```

This endpoint get a speaker and return it

### HTTP Request

`GET /v1/events/event_uri/speaker/id`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
event_uri | string  | The event_uri for the desired event
   id     | integer | The id for the desired speaker


## Create Speaker

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/speakers/', {
  method: 'POST',
  headers: {
    'Authorization': '<your token>',
  },
  body: {
    data: {
        type: "speakers",
        attributes: {
          name: "Mary",
          last_name: "Perez Ossa",
          email: "mary@email.com",
          biography: "biography Mary",
          twitter: "Twitter Mary",
          website: "Website Mary",
          photo: "url_image_file"
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
    "id": "14",
    "type": "speakers",
    "attributes": {
      "name": "Mary",
      "last_name": "Perez Ossa",
      "email": "mary@email.com",
      "biography": "biography Mary",
      "twitter": "Twitter Mary",
      "website": "Website Mary",
      "photo": "url_image_file"
      }
    }
}
```

>Example of Unprocessable Entity (422) response: 

```http
HTTP/1.1 422 Unprocessable Entity
{
  "message": {
    "name": [
      "can't be blank"
    ],
    "email": [
      "can't be blank"
    ]
    }
}
```

This endpoint create a speaker and return it

### HTTP Request

`POST /v1/events/event_uri/speakers`

### Available settings

Parameter | Type | Description
--------- | ---- | -----------
name | string | name of speaker. 
last_name | string | last name of speaker.
email | string | email of speaker.
biography | text | biography of speaker.
twitter | string | speaker twitter account.
website | string| speaker website.
photo | file | image for this speaker. 

## Update Speaker

```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/speakers/<id>', {
  method: 'PUT',
  headers: {
    'Authorization': '<your token>',
  },
  body: {
  body: {
    data: {
        type: "speakers",
        attributes: {
          name: "Mary",
          last_name: "Perez Ossa",
          email: "mary@email.com",
          biography: "biography Mary",
          twitter: "Twitter Mary",
          website: "Website Mary",
          photo: "url_image_file"
        }
    }
  }
})
```

> Make sure you replace <your token> with the JWT you get when you authenticate. 

> Make sure you replace <event uri> with the event uri for the event to update. 

> Make sure you replace <id> with the id for the speaker to update. 

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  {
  "data": {
    "id": "14",
    "type": "speakers",
    "attributes": {
      "name": "Mary",
      "last_name": "Perez Ossa",
      "email": "mary@email.com",
      "biography": "biography Mary",
      "twitter": "Twitter Mary",
      "website": "Website Mary",
      "photo": "url_image_file"
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
    "email": [
      "invalid email format"
    ]
  }
}
```

This endpoint update a speaker and return it

### HTTP Request

`PUT /v1/events/event_uri/speakers/id`

### Path Parameters

Parameter | Type | Description
--------- | ---- | -----------
name | string | name of speaker. 
last_name | string | last name of speaker.
email | string | email of speaker.
biography | text | biography of speaker.
twitter | string | speaker twitter account.
website | string| speaker website.
photo | file | image for this speaker. 

## Destroy Speaker
```javascript
fetch('https://core.eventtia.com/v1/events/<event_uri>/speakers/<id>', {
  method: 'DELETE',
  headers: {
    'Authorization': '<your token>',
  },
})
```

> Make sure you replace <your token> with the JWT you get when you authenticate. 

> Make sure you replace <event uri> with the event uri for the event to destroy. 

> Make sure you replace <id> with the id for the speaker to update. 

>Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "14",
    "type": "speakers",
    "attributes": {
      "name": "Mary",
      "last_name": "Perez Ossa",
      "email": "mary@email.com",
      "biography": "biography Mary",
      "twitter": "Twitter Mary",
      "website": "Website Mary",
      "photo": "url_image_file"
      }
    }
}
```

This endpoint destroy a speaker and return it

### HTTP Request

`DELETE /v1/events/event_uri/speakers/id`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
event_uri | string  | The event_uri for the desired event
   id     | integer | The id for the desired speaker