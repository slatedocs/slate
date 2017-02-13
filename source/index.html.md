---
title: Nebeus API Reference

language_tabs:
  - json

toc_footers:
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - making_requests

search: true
---

# Login

> `POST https://domain.com/signin/1.0/json`

```
Successful login response
```

```json
[
  {
    "id": null,
    "jsonrpc": "2.0",
    "result": {
      "company_id": 1,
      "db": "nebeus",
      "session_id": "95gdjkhksdhfjwehwlew",
      "uid": 154,
      "name": "Igor",
      "surname": "Igor",
      "user_context": {
        "lang": "en_US",
        "tz": "Europe/Madrid",
        "uid": 154
      },
      "username": "Igor"
    }
  }
]
```

```
Unsuccessful login response
```

```
{
  "id": null,
  "jsonrpc": "2.0",
  "result": {
    "status": "error",
    "message": "Login or password is incorrect"
  }
}
```


### HTTP Request
`POST https://domain.com/signin/1.0/json`

### Arguments

Parameter | Type | Required | Description
--------- | ----------- | ----------- | -----------
login | string | Required | User's email
password | string | Required | User's password

# Logout

> `POST https://domain.com/logout/1.0/json`

```
Successful logout response
```

```json
[
  {
    "id": null,
    "jsonrpc": "2.0",
    "result": {
      "status": "success"
    }
  }
]
```

### HTTP Request

`POST http://domain.com/logout/1.0/json`

# Reset password
> `POST https://domain.com/reset_password/1.0/json`

```
Successful response
```

```json
[
  {
    "id": null,
    "jsonrpc": "2.0",
    "result": {
      "status": "success"
    }
  }
]
```

```
Unsuccessful response
```

```json
[
  {
    "id": null,
    "jsonrpc": "2.0",
    "result": {
      "status": "error",
      "message": "..."
    }
  }
]
```

### HTTP Request
`POST https://domain.com/reset_password/1.0/json`

### Arguments

Parameter | Type | Required | Description
--------- | ----------- | ----------- | -----------
login | string | Required | User's email

# Signup
> `POST https://domain.com/signup/1.0/json`

```
Successful response
```

```json
[
  {
    "id": null,
    "jsonrpc": "2.0",
    "result": {
      "status": "success"
    }
  }
]
```

```
Unsuccessful response
```

```json
[
  {
    "id": null,
    "jsonrpc": "2.0",
    "result": {
      "status": "error",
      "errors": {
        "email": {
          "field": "email",
          "message": "..."
        },
        "country": {
          "field": "country",
          "message": "..."
        },
        "password": {
          "field": "password",
          "message": "..."
        }
      }
    }
  }
]
```
### HTTP Request

`POST http://nebeus.com/signup/1.0/json`

### Arguments

Parameter | Type | Required | Description
--------- | ----------- | ----------- | -----------
login | string | Required | User's email
name | string | Required | User's name 
surname | string | Required | User's surname
password | string | Required | Password 
confirm_password | string | Required | Password confirmation
country | number | Required | Country id
device_type | number | Optional | Device type
identifier | string | Optional | Push notification identifier from Google or Apple
language | string | Optional | Language code
timezone | number | Optional | Number of seconds away from UTC
app_version | string | Optional | Application version
device_model | string | Optional | Device make and model
device_os | string | Optional | Device operating system version

Specification for device properties are related to [OneSignal API](https://documentation.onesignal.com/reference#add-a-device)

# Get active countries

> `POST http://domain.com/get_countries/1.0/json` 

```
Example response
```

```json
[
  {
    "id": 1,
    "name": "Russia",
    "code": "RU",
    "phone_code": "+7"
  },
  {
    "id": 2,
    "name": "Spain",
    "code": "ES",
    "phone_code": "+34"
  }
]
```

### HTTP Request

`POST http://nebeus.com/signup/1.0/json`

# Dashboard

> `POST http://domain.com/partner/dashboard`

```
Example response
```

```json
{
  "name": "User",
  "surname": "Anonymous",
  "city": "Barcelona",
  "country_name": "Spain",
  "country_code": "ES",
  "rating": 5,
  "credit_rank": 3,
  "verification": {
    "address": {
      "status": "verified",
      "points": 5
    },
    "identity": {
      "status": "verified",
      "points": 5
    },
    "phone": {
      "status": true,
      "points": 5
    }
  },
  "social_networks": [
    {
      "name": "Facebook Graph",
      "connected": false,
      "auth_link": "..."
    },
    {
      "name": "Google OAuth2",
      "connected": false,
      "auth_link": "..."
    },
    {
      "name": "LinkedIn",
      "connected": false,
      "auth_link": "..."
    },
    {
      "name": "PayPal",
      "connected": true,
      "auth_link": "..."
    }
  ],
  "default_currency": {
    "rate": 1,
    "name": "EUR"
  },
  "accounts": [
    {
      "acc_number": "1Bhrfsdljaflkiudsf",
      "currency": {
        "rate": 0.001163,
        "name": "BTC"
      },
      "sum": 0.001
    } 
    {
      "acc_number": "1Bhrfsdljaflkiudsf",
      "currency": {
        "rate": 1,
        "name": "EUR"
      },
      "sum": 14.56
    } 
  ],
  "transactions": [
    {
      "credit": 0,
      "currency": "BTC",
      "date": "2016-12-03 10:13:53",
      "debit": 0.001,
      "id": "dfb932fg",
      "partner": {
        "surname": "Transfer",
        "name": "Internal"
      },
      "type": "Disbursement of a loan"
    },
    {
      "credit": 0.001,
      "currency": "BTC",
      "date": "2016-12-03 14:30:56",
      "debit": 0.0,
      "id": "af32dffg",
      "partner": {
        "surname": "Anonymous",
        "name": "User",
        "id": 134,
        "country_code": "ES"
      },
      "type": "Disbursement of a loan"
    }
  ],
  "nearest_operations": [{
    "amount": 0,
    "date": "2016-12-08 10:13:45",
    "description": "Loan repayment",
    "id": "db8fa412d",
    "type": "credit"
  }]
}
```

### HTTP Request

`POST http://domain.com/partner/dashboard`

# Get partner profile image

> `GET http://domain.com/partner/${uid}/profile_image/big`

### HTTP Request

Big image (150x150px)

`GET http://domain.com/partner/${uid}/profile_image/big`

Small image (64x64px)

`GET http://domain.com/partner/${uid}/profile_image`

# Get country flag

> `GET http://domain.com/assets/svg/i_country-${country_code}.svg`

### HTTP Request

`GET http://domain.com/assets/svg/i_country-${country_code}.svg`
