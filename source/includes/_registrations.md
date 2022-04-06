# Registrations


## Create new user and account

> To create a new user, use this code:

```shell
# Get your token for further authorization
curl "https://core.eventtia.com/v1/registrations" \
  -H 'Content-Type: application/json' \
  -X POST -d '{"user": {"name": "Your name", "email": "companyemail@mycompany.com", "phone": "your phone number", "password": "your password", "password_confirmation": "your password confirmation"}, "account": {"name": "Your company name", "website": "www.yourcompany.com"}}'
```

```javascript
// Get your token for further authorization
fetch("https://core.eventtia.com/v1/registrations", {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': '<your token>'
  },
  body: {
    user: {
      name: "Your name", 
      email: "companyemail@mycompany.com", 
      phone: "your phone number", 
      password: "your password", 
      password_confirmation: "your password confirmation"
    }, 
    account: {
      name: "Your company name", 
      website: "www.yourcompany.com"
    }
  }
  
})
```

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
    "data": {
        "id": "1",
        "type": "users",
        "attributes": {
            "name": "Your name",
            "email": "companyemail@mycompany.com",
            "account_name": "Your company name"
        },
        "relationships": {
            "account": {
                "data": {
                    "id": "1",
                    "type": "account"
                }
            }
        }
    },
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
        "name": [
            "can't be empty"
        ]
    }
}
```

This endpoint allows you create a new user and account

### HTTP Request

`POST /v1/registrations`

### Query Parameters

Parameter | Type | Description
--------- | ---- | -----------
user[name] | string | The User's name.
user[email] | string | The User's corporate email.
user[phone] | string | The User's phone.
user[password] | string | The User's password.
account[name] | string | The Uers's company name.
account[website] | string | The User's company website.

