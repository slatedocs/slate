# Activation


## Activate Account

> To create a new user, use this code:

```shell
# Get your token for further authorization
curl "https://core.eventtia.com/v1/accounts/activate" \
  -H 'Content-Type: application/json' \
  -X PUT -d '{"activation_code": "abcdefghijk" }'
```

```javascript
// Get your token for further authorization
fetch("https://core.eventtia.com/v1/accounts/activate", {
  method: 'PUT',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': '<your token>'
  },
  body: {
    activation_code: "abcdefghijk"
  }
})
```

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
    "meta": {
        "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjbGFzcyI6IlVzZXIiLCJhdXRoZW50aWNhdGlvbl9rZXkiOiJwb2VmZWNvbSIsImV4cCI6MTU5MzcwMTYwMX0.sHJrSzZYxnYxyWDRIjgK-BqHnRXgFdQBq0c0WjI_kfI"
    }
}
```

> Example of a 422 response:

```http
HTTP/1.1 422 Unprocessable Entity
{
    "message": {
        "error": [
            106
        ]
    }
}
```

This endpoint allows you create a new user and account

### HTTP Request

`PUT/v1/accounts/activate`

### Body Parameters

Parameter | Type | Description
--------- | ---- | -----------
activation_code | string | Account's activation code.


