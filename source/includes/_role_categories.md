# Role Categories
## List Role Categories

```javascript
fetch('https://core.eventtia.com/v1/role_categories/<id>', {
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
  "data": [
    {
      "id": "4",
      "type": "role_categories",
      "attributes": {
        "id": 4,
        "name": "grupo 1"
      }
    }
  ],
  "links": {
      "first": "http://localhost:3000/api/v1/es/v1/role_categories?page[number]=1",
      "last": "http://localhost:3000/api/v1/es/v1/role_categories?page[number]=1",
      "prev": null,
      "next": null
    }
}

```
This endpoint list role_categories return it

### HTTP Request

`GET /v1/role_categories/`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
page | json | A page object as described <a href="#pagination">here</a>

## Get Role Category

```javascript
fetch('https://core.eventtia.com/v1/role_categories/<id>', {
  method: 'GET',
  headers: {
    'Authorization': '<your token>',
  }})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate. 

> Make sure you replace &lt;id&gt; for the role category to get. 

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "4",
    "type": "role_categories",
    "attributes": {
      "id": 4,
      "name": "grupo 1"
    }
  }
}
```
>Example of role_categories Not Found (404) response:

```http
HTTP/1.1 404 Not Found
{
  "message": {
    "error": "code: 128"
  }
}
```

This endpoint return an role category

### HTTP Request

`GET /v1/role_categories/:id`

### Path Parameters

Parameter | Type | Description
--------- | ---- | -----------
id | integer | id for the desired role_categories

## Create Role Category

```javascript
fetch('https://core.eventtia.com/v1/role_categories/', {
  method: 'POST',
  headers: {
    'Authorization': '<your token>',
  },
  body: {
  {
    data: {
        type: "role_categories",
        attributes: {
            name: "grupo 5"
        }
    }
  }
  }
}
```
> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate. 

> Example of a successful (200) response:

```http

HTTP/1.1 200 OK
{
  "data": {
    "id": "6",
    "type": "role_categories",
    "attributes": {
        "id": 6,
        "name": "grupo 5"
    }
  }
}
```
>Example of Unprocessable Entity (422) response:

```http
HTTP/1.1 422 Unprocessable Entity
```

This endpoint create an role category and return it

### HTTP Request

`POST /v1/role_categories/`

### Body Parameters

Parameter | Type | Description
--------- | ---- | -----------
name | string | The Role category name.

## Update Role Category

```javascript
fetch('https://core.eventtia.com/v1/role_categories/<id>', {
  method: 'PUT',
  headers: {
    'Authorization': '<your token>',
  },
  body: {
    "data": {
        "type": "roles",
        "attributes": {
            "name": "grupo 10"
        }
    }
  }
}}

```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate. 

> Make sure you replace &lt;id&gt; for the role_category to update. 

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "5",
    "type": "role_categories",
    "attributes": {
        "id": 5,
        "name": "grupo 10"
    }
  }
}
```
>Example Not Found (404) response: 

```http
HTTP/1.1 404 Not Found
{
  "message": {
      "error": "code: 128"
  }
}
```

This endpoint update an role category and return it

### HTTP Request

`PUT /v1/role_categories/:id`

### Path Parameters

Parameter | Type | Description
--------- | ---- | -----------
id | integer | The id for the desired role_category

### Body Parameters

Parameter | Type | Description
--------- | ---- | -----------
name | string | The role category name.

## Destroy Role Category
```javascript
fetch('https://core.eventtia.com/v1/role_categories/<id>', {
  method: 'DELETE',
  headers: {
    'Authorization': '<your token>',
  },
})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate. 

> Make sure you replace &lt;id&gt; for the role category to destroy. 

>Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "5",
    "type": "role_categories",
    "attributes": {
        "id": 5,
        "name": "grupo 10"
      }
  }
}
```

This endpoint destroy a role category and return it

### HTTP Request

`DELETE /v1/role_categories/:id`

### Path Parameters

Parameter | Type | Description
--------- | ---- | -----------
id | integer | The id for the desired role category