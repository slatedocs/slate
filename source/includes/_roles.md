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
  ]
}
```

This endpoint returns a list of roles that your account have configured

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

This endpoint returns a role given an id

### HTTP Request

`GET /v1/roles/:id`

### Path Parameters

Parameter | Type | Description
--------- | ---- | -----------
id | integer | Id for the desired role

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

This endpoint creates a role and return it

### HTTP Request

`POST /v1/roles/`

### Body Parameters

Parameter | Type | Description
--------- | ---- | -----------
name | string | Role's name.

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

This endpoint allows you to update a role information and associate or revoke permissions to the users that have associated it.

### HTTP Request

`PUT /v1/roles/:id`

### Path Parameters

Parameter | Type | Description
--------- | ---- | -----------
id | integer | Id of the desired role

### Body Parameters

Parameter | Type | Description
--------- | ---- | -----------
name | string | Role's name.
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

This endpoint destroys a role and return it

### HTTP Request

`DELETE /v1/roles/:id`

### Path Parameters

Parameter | Type | Description
--------- | ---- | -----------
id | integer | The id for the desired role
