# Users

## List Users

```javascript
fetch('https://core.eventtia.com/v1/users/', {
  method: 'GET',
  headers: {
    'Authorization': '<your token>',
  }})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate. 

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": [
    {
      "id": 1,
      "type": "users",
      "attributes":{
        "name": "User Name",
        "phone": "788965455",
        "password": "securepassword",
        "password_confirmation": "securepassword",
        "email": "user@eventtia.com"
        }
    }
  ]
}
```

This endpoint return a list of users

### HTTP Request

`GET /v1/users/`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
page | json | A page object as described <a href="#pagination">here</a>

## Get User

```javascript
fetch('https://core.eventtia.com/v1/users/<id>', {
  method: 'GET',
  headers: {
    'Authorization': '<your token>',
  }})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate. 

> Make sure you replace &lt;id&gt; for the user to get. 

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
    "data": {
        "id": "1",
        "type": "users",
        "attributes": {
            "name": "user name",
            "email": "email@eventtia.com",
            "account_name": "eventtia"
        },
        "relationships": {
            "account": {
                "data": {
                    "id": "1",
                    "type": "users"
                }
            }
        }
    }
}
```

>Example of User Not Found (404) response:

```http
HTTP/1.1 404 Not Found
{
  "message": "Couldn't find User"
}
```

This endpoint return an user

### HTTP Request

`GET /v1/users/:id`

### Path Parameters

Parameter | Type | Description
--------- | ---- | -----------
id | integer | id for the desired user
## Create User

```javascript
fetch('https://core.eventtia.com/v1/users/', {
  method: 'POST',
  headers: {
    'Authorization': '<your token>',
  },
  body: {
    {
    data: {
    type: "users",
    attributes:{
        name: "User Name",
        phone: 788965455,
        password: "SecurePassword",
        password_confirmation: "SecurePassword",
        email: "user@eventtia.com"
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
        "id": "1",
        "type": "users",
        "attributes": {
            "name": "user name",
            "email": "email@eventtia.com",
            "account_name": "eventtia"
        },
        "relationships": {
            "account": {
                "data": {
                    "id": "1",
                    "type": "users"
                }
            }
        }
    }
}
```

>Example of Unprocessable Entity (422) response:

```http
HTTP/1.1 422 Unprocessable Entity
```

This endpoint create an user and return it

### HTTP Request

`POST /v1/users/`

### Available settings

Parameter | Type | Description
--------- | ---- | -----------
name | string | The User's name.
email | string | The User's corporate email.
phone | string | The User's phone.
password | string | The User's password.

## Update User

```javascript
fetch('https://core.eventtia.com/v1/users/<id>', {
  method: 'PUT',
  headers: {
    'Authorization': '<your token>',
  },
  body: {
    data: {
    type: "users",
    attributes:{
        name: "User Name",
        phone: 788965455,
        password: "SecurePassword",
        password_confirmation: "SecurePassword",
        email: "user@eventtia.com"
          		             }
	}
}
})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate. 

> Make sure you replace &lt;id&gt; for the user to update. 

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
    "data": {
        "id": "1",
        "type": "users",
        "attributes": {
            "name": "user name",
            "email": "email@eventtia.com",
            "account_name": "eventtia"
        },
        "relationships": {
            "account": {
                "data": {
                    "id": "1",
                    "type": "users"
                }
            }
        }
    }
}
```

>Example of Unprocessable Entity (422) response: 

```http
HTTP/1.1 422 Unprocessable Entity
```

This endpoint update an user and return it

### HTTP Request

`PUT /v1/users/:id`

### Path Parameters

Parameter | Type | Description
--------- | ---- | -----------
id | integer | The id for the desired user

### Available settings

Parameter | Type | Description
--------- | ---- | -----------
name | string | The User's name.
email | string | The User's corporate email.
phone | string | The User's phone.
password | string | The User's password.

## Destroy User
```javascript
fetch('https://core.eventtia.com/v1/users/<id>', {
  method: 'DELETE',
  headers: {
    'Authorization': '<your token>',
  },
})
```

> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate. 

> Make sure you replace &lt;id&gt; for the user to destroy. 

>Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
    "data": {
        "id": "1",
        "type": "users",
        "attributes": {
            "name": "user name",
            "email": "email@eventtia.com",
            "account_name": "eventtia"
        },
        "relationships": {
            "account": {
                "data": {
                    "id": "1",
                    "type": "users"
                }
            }
        }
    }
}
```

This endpoint destroy a user and return it

### HTTP Request

`DELETE /v1/users/:id`

### Path Parameters

Parameter | Type | Description
--------- | ---- | -----------
id | integer | The id for the desired user


