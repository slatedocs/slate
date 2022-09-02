# Roles
## List Roles

```javascript
fetch('https://core.eventtia.com/v1/roles/', {
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
      "id": "1",
      "type": "roles",
      "attributes": {
        "id": 1,
        "name": "admin"
      }
    }
  ],
  "links": {
    "first": "http://localhost:3000/api/v1/es/v1/roles?page[number]=1",
    "last": "http://localhost:3000/api/v1/es/v1/roles?page[number]=1",
    "prev": null,
    "next": null
  }
}
```

This endpoint return a list of roles

### HTTP Request

`GET /v1/roles/`

### Path Parameters


Parameter |  Type   | Description
--------- | ------- | -----------
page | json | A page object as described <a href="#pagination">here</a>

## Get Role

```javascript
fetch('https://core.eventtia.com/v1/roles/<id>', {
  method: 'GET',
  headers: {
    'Authorization': '<your token>',
  }})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate. 

> Make sure you replace &lt;id&gt; for the role to get. 

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "1",
    "type": "roles",
    "attributes": {
      "id": 1,
      "name": "admin"
    }
  }
}
```
>Example of Role Not Found (404) response:

```http
HTTP/1.1 404 Not Found
{
  "message": {
    "error": "code: 128"
  }
}
```

This endpoint return an role

### HTTP Request

`GET /v1/roles/:id`

### Path Parameters

Parameter | Type | Description
--------- | ---- | -----------
id | integer | id for the desired role

## Create Role

```javascript
fetch('https://core.eventtia.com/v1/roles/', {
  method: 'POST',
  headers: {
    'Authorization': '<your token>',
  },
  body: {
    {
    data: {
    type: "roles",
    attributes: {
          name: "super admin"
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
    "id": "4",
    "type": "roles",
    "attributes": {
        "id": 4,
        "name": "registro"
    }
  }
}
```
>Example of Unprocessable Entity (422) response:

```http
HTTP/1.1 422 Unprocessable Entity
```

This endpoint create an role and return it

### HTTP Request

`POST /v1/roles/`

### Body Parameters

Parameter | Type | Description
--------- | ---- | -----------
name | string | The Role's name.

## Update Role

```javascript
fetch('https://core.eventtia.com/v1/roles/<id>', {
  method: 'PUT',
  headers: {
    'Authorization': '<your token>',
  },
  body: {
    data: {
    type: "roles",
    attributes: {
      name: "admin"
    },
    relationships: {
      permissions: {  
      data: [
        {type: "permissions", id: 1},
        {type: "permissions", id:2},                        
        {type: "permissions", id: 44}
        ]
      }
    }
  }
}}

```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate. 

> Make sure you replace &lt;id&gt; for the role to update. 

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
    "data": {
        "id": "1",
        "type": "roles",
        "attributes": {
            "id": 1,
            "name": "admin"
        }
    }
}
```
>Example of Unprocessable Entity (422) response: 

```http
HTTP/1.1 422 Unprocessable Entity
```

This endpoint update an role and return it

### HTTP Request

`PUT /v1/roles/:id`

### Path Parameters

Parameter | Type | Description
--------- | ---- | -----------
id | integer | The id for the desired role

### Body Parameters

Parameter | Type | Description
--------- | ---- | -----------
name | string | The Role's name.
permission | string | Permission

## Destroy Role
```javascript
fetch('https://core.eventtia.com/v1/roles/<id>', {
  method: 'DELETE',
  headers: {
    'Authorization': '<your token>',
  },
})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate. 

> Make sure you replace &lt;id&gt; for the role to destroy. 

>Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": {
    "id": "4",
    "type": "roles",
    "attributes": {
        "id": 4,
        "name": "registro"
    }
  }
}
```

This endpoint destroy a role and return it

### HTTP Request

`DELETE /v1/roles/:id`

### Path Parameters

Parameter | Type | Description
--------- | ---- | -----------
id | integer | The id for the desired role
