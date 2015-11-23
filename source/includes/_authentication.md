# Authentication

## Sign In

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

This endpoint should be used to retrieve an access token for an existing user.

### HTTP Request

`POST /authentication`

### Query Parameters

Parameter | Required
--------- | --------
email | true
password | true

## Sign Out

This endpoint should be used to expire a user's access token. This endpoint
returns a 204 status with no response body content.

### HTTP Request

`DELETE /authentication`

### Request Headers

`X-Auth-Token: 95ac690ebd9d9dbe20d04a656e8355e1`
