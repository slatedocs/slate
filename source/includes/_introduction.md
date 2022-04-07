# Introduction

This section contains basic concepts such as Authentication and Authorization.
Eventtia 2.0 API is mostly compliant with the [JSON API v1.0 specification](http://jsonapi.org/).


## Authentication via Username and Password

> To authenticate, use this code:

```shell
# Get your token for further authorization
curl "https://core.eventtia.com/v1/sessions" \
  -H 'Content-Type: application/json' \
  -X POST -d '{"email":"email@example.org", "password":"myPassword"}'
```

```javascript
// Get your token for further authorization
fetch("https://core.eventtia.com/v1/sessions", {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
  },
  body: {
    email: "email@example.org",
    password: "myPassword"
  }
})
```

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{"token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjbGFzcyI6IlVzZXIiLCJhdXRoZW50aWNhdGlvbl9rZXkiOiJ0ZXN0QGV2ZW50dGlhLmNvbSVyaSI6InRlc3QtZXZlbnQiLCJleHAiOjE1MjAzNTY1MDB9.s0m351gn4tuRe4sdF_qw3rTleleWh4TTTt35f1n4lLy"}
```

> Example of a 404 response:

```http
HTTP/1.1 404 Not Found
{"message":"Incorrect email or password."}
```

You can get an authorization token for a User with this endpoint. Tokens issued by Eventtia are valid for 90 days.

### HTTP Request

`POST /v1/sessions`

### Query Parameters

Parameter | Type | Description
--------- | ---- | -----------
email | string | The User's email.
password | string | The User's password.


## Authorization

> When you make a request to any protected endpoint, add the token in the Authorization header

```shell
# Send your token in the Authorization header
curl "<api endpoint>" \
  -H "Authorization: <your token>" \
  ...
```

```javascript
// Send your token in the Authorization header
fetch("<api endpoint>", {
  headers: {
    'Authorization': '<your token>',
  },
  ...
})
```

> Make sure you replace `<your token>` with the JWT you get when you authenticate.

Eventtia uses JSON Web Tokens for authorization. Tokens issued by Eventtia are valid for 90 days.


## Pagination

All list endpoints are paginated by default. The default page size is 24, and the default page number is 1. The response contains links to the first, previous (prev), current (self) and next.

```shell
# You can request a specific page size and number by sending the page param in the request query params:
curl '<api endpoint>?page[size]=12&page[number]=1'
```

```javascript
// You can request a specific page size and number by sending the page param in the request query params:
fetch('<api endpoint>?page[size]=12&page[number]=1')
})
```

> Example response:

```
{
  "data": [...],
  "links": {
    "first": "<api endpoint>?page[number]=1&page[size]=12",
    "last": "<api endpoint>?page[number]=1&page[size]=12",
    "prev": null,
    "next": null
  }
}
```