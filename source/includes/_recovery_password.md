# Password Recovery

## Request Recovery Password

```javascript
fetch('https://core.eventtia.com/en/v1/passwords', {
  method: 'POST',
  body: {
    recaptcha_token: "",
    data: {
      type: "users",
      attributes: {
        email: '<your email>'
        locale: '<locale>'
      }
    }
  }
})
```

> Make sure you replace &lt;your email&gt; with your email.

> Make sure you replace &lt;locale&gt; with the desired language

> Example of a successfull (200) response:

```http
HTTP/1.1 200 OK
{
  "recover_token": "P7V3G9C4pry6VMXgHomr"
  "message": "300, <your email>"
}
```

This endpoint request the reset password token and return it

### HTTP Request

`POST en/v1/passwords`


### Body Parameters

Parameter  |  Type   | Description
---------  | ------- | -----------
email  | string | your email
locale  | string | desired language e.g. "en", "es" or "fr"

## Update Password

```javascript
fetch('https://core.eventtia.com/en/v1/passwords', {
  method: 'PUT',
  body: {
    data: {
      type: 'users',
      attributes: {
        reset_password_token: '<your token>',
        password: '<your new password>',
        password_confirmation: '<your new password>'
      }
    }
  }
})
```

> Make sure you replace &lt;your token&gt; with the given reset password token.

> Make sure you replace &lt;your new password&gt; with your new password.

> Example of successful (200) response:

```http
HTTP/1.1 200 OK
{
    "message": 301
}
```

> Example of Unprocessable Entity (422) response:

```http
HTTP/1.1 422 Unprocessable Entity
{
  "message": {
    "reset_password_token": [
      106
    ]
  }
}
```

This endpoint updates the password of the user

### HTTP Request

`PUT en/v1/passwords`

### Body Parameters

Parameter  |  Type   | Description
---------  | ------- | -----------
reset_password_token | string | recover password token
password | string | your new password
confirmation_password | string | your new password
