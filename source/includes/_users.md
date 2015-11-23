# Users

## Create a User

> Example Request:

```json
{
  "user": {
    "email": "email@example.com",
    "password": "password"
  }
}
```

> Example response (201):

```json
{
  "user": {
    "id": "181d7359-996a-49c9-999d-2a617058a0fa",
    "email": "email@example.com",
    "access_token": "95ac690ebd9d9dbe20d04a656e8355e1"
  }
}
```

This endpoint creates a user.

### HTTP Request

`POST /users`

### Query Parameters

Parameter | Required
--------- | --------
email | true
password | true

## Update a User

> Example Request:

```json
{
  "user": {
    "email": "new-email@example.com",
    "password": "password"
  }
}
```

> Example Response (200):

```json
{
  "user": {
    "id": "181d7359-996a-49c9-999d-2a617058a0fa",
    "email": "new-email@example.com",
    "access_token": "95ac690ebd9d9dbe20d04a656e8355e1"
  }
}
```

This endpoint updates a user.

### HTTP Request

`PUT/PATCH /users/<ID>`

### Request Headers

`X-Auth-Token: 95ac690ebd9d9dbe20d04a656e8355e1`

### URL Parameters

Parameter | Required | Description
--------- | -------- | -----------
email | optional | The new email that should be saved.
password | optional | The new password that should be saved.
