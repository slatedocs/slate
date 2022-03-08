# Commercial Plans

## List Commercial Plans

```javascript
fetch('https://core.eventtia.com/v1/commercial_plans/', {
  method: 'GET',
  headers: {
    'Authorization': '<your token>',
  }
})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate.

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "36457",
    "type": "commercial_plans",
    "attributes": {
      "name": "Plan name",
      "description": "plan descripcion",
      "active": true,
      "settings": {
          "Event": 100,
          "Guest": 500,
          "Attendee": 5000
      },
      "interval": "monthly",
      "archived": false,
      "prices": null
    }
  }
}
```

> Example of Unprocessable Entity (422) response:

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

This endpoint return a list of commercial plans

### HTTP Request

`GET /v1/commercial_plans/`

## Get Commercial Plan

```javascript
fetch('https://core.eventtia.com/v1/commercial_plans/<id>', {
  method: 'GET',
  headers: {
    'Authorization': '<your token>',
  }
})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate.

> Make sure you replace &lt;id&gt; with the id for the commercial plan to get.

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "36457",
    "type": "commercial_plans",
    "attributes": {
      "name": "Plan name",
      "description": "plan descripcion",
      "active": true,
      "settings": {
          "Event": 100,
          "Guest": 500,
          "Attendee": 5000
      },
      "interval": "monthly",
      "archived": false,
      "prices": null
    }
  }
}
```

> Example of Unprocessable Entity (422) response:

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

This endpoint return a commercial plan

### HTTP Request

`GET /v1/commercial_plans/:id`

### Path Parameters

Parameter | Type | Description
--------- | ---- | -----------
id | integer | The id for the desired commercial plan.
