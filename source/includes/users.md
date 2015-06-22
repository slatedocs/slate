# Users

## Get All Users

This endpoint returns a list of User resources.

```http
GET /api/v2/users/ HTTP/1.1
Accept: application/json
Authorization: Token "YOUR SDE ACCESS TOKEN"
```

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "results": [{
        "id": 682,
        "email": "frank@sdelements.com",
        "first_name": "Frank",
        "last_name": "Developer",
        "role": "Project Lead",
        "last_login": "2014-12-15T20:10:51.900775Z",
        "date_joined": "2014-04-16T19:43:47.883319Z",
        "is_active": true,
        "is_superuser": false
    }]
}
```

## Get a specific User

Get a specific User resource.

```http
GET /api/v2/users/599/ HTTP/1.1
Accept: application/json
Authorization: Token "YOUR SDE ACCESS TOKEN"
```

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "id": 599,
    "email": "user@example.com",
    "first_name": "Bob",
    "last_name": "Smith",
    "last_login": "2015-06-05T02:55:54.231254Z",
    "date_joined": "2015-06-05T02:55:54.231254Z",
    "is_active": true,
    "is_superuser": false,
    "role": "No Role",
    "groups": []
}
```

## Create a User

Create a User resource.

```http
POST /api/v2/users/ HTTP/1.1
Accept: application/json
Authorization: Token "YOUR SDE ACCESS TOKEN"

{
    "email": "user@example.com",
    "first_name": "Bob",
    "last_name": "Smith"
}
```

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "id": 599,
    "email": "user@example.com",
    "first_name": "Bob",
    "last_name": "Smith",
    "last_login": "2015-06-05T02:55:54.231254Z",
    "date_joined": "2015-06-05T02:55:54.231254Z",
    "is_active": true,
    "is_superuser": false,
    "role": "No Role",
    "groups": []
}
```

## Update a specific User

Update a specific User resource.

```http
PUT /api/v2/users/ HTTP/1.1
Accept: application/json
Authorization: Token "YOUR SDE ACCESS TOKEN"

{
    "email": "user@example.com",
    "first_name": "Bob",
    "last_name": "Smith",
    "groups":["G64"],
    “role”:”UR5”
}
```

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "id": 599,
    "email": "user@example.com",
    "first_name": "Bob",
    "last_name": "Smith",
    "last_login": "2015-06-05T02:55:54.231254Z",
    "date_joined": "2015-06-05T02:55:54.231254Z",
    "is_active": true,
    "is_superuser": false,
    "role": "Project Lead",
    "groups": ["Group2"]
}
```
