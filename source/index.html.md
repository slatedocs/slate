---
title: Nebeus API Reference

language_tabs:
  - json

toc_footers:
  - © Nebeus 2017

includes:
  - accounts
  - card_to_card
  - making_requests
  - buy_sell_bitcoin

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
      "partner_id": 169,
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
  }],
  "reserved_money": {
    "credit": 10,
    "debit": 0.5,
    "currency_name": 'BTC'
  }
}
```

### HTTP Request

`POST http://domain.com/partner/dashboard`

Possible verification statuses for identity and residency address: not_verified, pending, verified, rejected.

# Get dashboard graphic details

> `POST http://domain.com/dashboard/graphic`

```
{
  "all_time": {
    "credit": 0.232996,
    "debit": 0.225304
  },
  "days": {
    "2017-02-24": {
      "credit": 0,
      "debit": 0
    },
    "2017-02-25": {
      "credit": 0,
      "debit": 0
    },
    "2017-02-26": {
      "credit": 0,
      "debit": 0
    },
    "2017-02-27": {
      "credit": 0,
      "debit": 0
    },
    "2017-02-28": {
      "credit": 0.000101,
      "debit": 0
    },
    "2017-03-01": {
      "credit": 0,
      "debit": 0
    },
    "2017-03-02": {
      "credit": 0,
      "debit": 0
    },
    "2017-03-03": {
      "credit": 0,
      "debit": 0
    }
  },
  "month": {
    "credit": 0,
    "debit": 0
  },
  "week": {
    "credit": 0.000101,
    "debit": 0
  },
  "year": {
    "credit": 0.02455,
    "debit": 0.002163
  },
  "currency_name": 'BTC'
}
```

### HTTP Request

`POST http://domain.com/dashboard/graphic`

Returns data to create graphics.
Includes debit/credit values for overall time, week, month, year and for the last days

# Get partner profile image

> `GET http://domain.com/partner/${partner_id}/profile_image/big`

### HTTP Request

Big image (150x150px)

`GET http://domain.com/partner/${partner_id}/profile_image/big`

Small image (64x64px)

`GET http://domain.com/partner/${partner_id}/profile_image`

# Get country flag

> `GET http://domain.com/assets/svg/i_country-${country_code}.svg`

### HTTP Request

`GET http://domain.com/assets/svg/i_country-${country_code}.svg`

# Submit support ticket

> `POST http://domain.com/helpdesk/message`

```
Successful ticket submission response
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
Unsuccessful ticket submission response
```

```
{
  "id": null,
  "jsonrpc": "2.0",
  "result": {
    "status": "error",
    "field": "email",
    "message": "Email should be specified"
  }
}
```


### HTTP Request

`POST http://domain.com/helpdesk/message`

### Arguments

Parameter | Type | Required | Description
--------- | ----------- | ----------- | -----------
login | string | Required | string with user's email
name | string | Required | string with user's name
message | string | Required | string with message

### Returns

Dictionary with status of creating ticket in helpdesk and zendesk.

Contains fields:

Parameter | Description | Possible values 
--------- | ----------- | -----------
status | status of creating process | 'success' or 'error'
field | field, which contains error | *
message | error message | *


# Get or create session

> `POST http://domain.com/im_chat/api/get_or_create_session`

```
Example response
```

```json
{
    "jsonrpc": "2.0",
    "id": null,
    "result": {
        "create_date": "2017-02-02 07:56:00",
        "uuid": "91e03d34-1929-4a02-9486-4c3e708686b3",
        "with_documents:": true,
        "state": "open",
        "is_group": false,
        "groups": [],
        "docs:":
        [
            {
                "doc_model": "res.partner",
                "doc_id": 25,
                "id": 9
            }
        ],
        "users":
        [
            {
                "im_status": "away",
                "id": 5,
                "name": "Lucid Lynx"
            },
            {
                "im_status": "away",
                "id": 6,
                "name": "Oneiric Ocelot"
            }
        ]
    }
}
```

### HTTP Request

`POST http://domain.com/im_chat/api/get_or_create_session`

### Arguments

Parameter | Type | Required | Description
--------- | ----------- | ----------- | -----------
user_to | number | Required | ID of user
doc_id | string | Optional | ID of document
doc_model | string | Optional | document's model

### Returns
Dictionary with data about session.

Contains fields:

Parameter | Description | Possible values 
--------- | ----------- | -----------
uuid | session uuid | *
create_date | date of session creating | *
users | list of users | *
state | state of session | 'open', 'folded' or 'closed'


# Get or create session with group

> `POST http://domain.com/im_chat/api/get_or_create_session_group`

```
Example response
```

```json
{
    "jsonrpc": "2.0",
    "id": null,
    "result":
    {
        "create_date": "2017-02-02 07:56:00",
        "uuid": "91e03d34-1929-4a02-9486-4c3e708686b3",
        "with_documents": true,
        "state": "open",
        "is_group": true,
        "groups":
        [
            {
                "id": 3,
                "name": "News"
            }
        ],
        "docs:":
        [
            {
                "doc_model": "res.partner",
                "doc_id": 25,
                "id": 9
            }
        ],
        "users":
        [
            {
                "im_status": "away",
                "id": 5,
                "name": "Lucid Lynx"
            },
            {
                "im_status": "away",
                "id": 6,
                "name": "Oneiric Ocelot"
            }
        ]
    }
}
```

### HTTP Request

`POST http://domain.com/im_chat/api/get_or_create_session_group`

### Arguments

Parameter | Type | Required | Description
--------- | ----------- | ----------- | -----------
group | number | Required | ID of group
doc_id | string | Optional | ID of document
doc_model | string | Optional | document's model

### Returns
Dictionary with data about session.

Contains fields:

Parameter | Description | Possible values 
--------- | ----------- | -----------
uuid | session uuid | *
create_date | date of session creating | *
users | list of users | *
state | state of session | 'open', 'folded' or 'closed'

# Get sessions

> `POST http://domain.com/im_chat/api/get_sessions`

```
Example response
```

```json
[
    {
        "create_date": "2017-02-02 07:56:00",
        "uuid": "91e03d34-1929-4a02-9486-4c3e708686b3",
        "with_documents": true,
        "state": "open",
        "is_group": false,
        "groups": [],
        "docs:":
        [
            {
                "doc_model": "res.partner",
                "doc_id": 25,
                "id": 9
            }
        ],
        "users":
        [
            {
                "im_status": "away",
                "id": 5,
                "name": "Lucid Lynx"
            },
            {
                "im_status": "away",
                "id": 6,
                "name": "Oneiric Ocelot"
            }
        ]
    }
]
```

### HTTP Request

`POST http://domain.com/im_chat/api/get_sessions`

### Arguments

Parameter | Type | Required | Description
--------- | ----------- | ----------- | -----------
user_to | number | Optional | ID of user
doc_id | string | Optional | ID of document
doc_model | string | Optional | document's model
state | string | Optional | state of session

### Returns
List with dictionaries with data about sessions.

Contains fields:

Parameter | Description | Possible values 
--------- | ----------- | -----------
uuid | session uuid | *
create_date | date of session creating | *
users | list of users | *
state | state of session | 'open', 'folded' or 'closed'

# Get sessions with group

> `POST http://domain.com/im_chat/api/get_sessions_group`

```
Example response
```

```json
[
    {
        "create_date": "2017-02-02 07:56:00",
        "uuid": "91e03d34-1929-4a02-9486-4c3e708686b3",
        "with_documents": true,
        "state": "open",
        "is_group": true,
        "groups": 
        [
            {
                "id": 3,
                "name": "News"
            }
        ],
        "docs:":
        [
            {
                "doc_model": "res.partner",
                "doc_id": 25,
                "id": 9
            }
        ],
        "users":
        [
            {
                "im_status": "away",
                "id": 5,
                "name": "Lucid Lynx"
            },
            {
                "im_status": "away",
                "id": 6,
                "name": "Oneiric Ocelot"
            }
        ]
    }
]
```

### HTTP Request

`POST http://domain.com/im_chat/api/get_sessions_group`

### Arguments

Parameter | Type | Required | Description
--------- | ----------- | ----------- | -----------
group | number | Optional | ID of group
doc_id | string | Optional | ID of document
doc_model | string | Optional | document's model
state | string | Optional | state of session

### Returns
List with dictionaries with data about sessions.

Contains fields:

Parameter | Description | Possible values 
--------- | ----------- | -----------
uuid | session uuid | *
create_date | date of session creating | *
users | list of users | *
state | state of session | 'open', 'folded' or 'closed'

# Get all users

> `POST http://domain.com/im_chat/api/user_chat_ab/get_all_users`

```
Example response
```

```json
[
    {
        "im_status": "offline", 
        "id": 5, 
        "name": "odoo"
    },
    {
        "im_status": "offline", 
        "id": 239, 
        "name": "Ivan"
    },
    {
        "im_status": "offline", 
        "id": 330, 
        "name": "Test1"
    }
]
```

### HTTP Request

`POST http://domain.com/im_chat/api/user_chat_ab/get_all_users`

Get all users without users from address book of current user

### Returns
List with dictionaries with data about users.

Contains fields:

Parameter | Description | Possible values 
--------- | ----------- | -----------
im_status | chat status | 'online', 'offline' or 'away'
id | user id | *
name | user name | *

# Get users from book

> `POST http://domain.com/im_chat/api/user_chat_ab/get_users_from_book`

```
Example response
```

```json
[
    {
        "im_status": "offline", 
        "id": 5, 
        "name": "odoo"
    }
]
```

### HTTP Request

`POST http://domain.com/im_chat/api/user_chat_ab/get_users_from_book`

Get all users from address book of current user

### Returns
List with dictionaries with data about users.

Contains fields:

Parameter | Description | Possible values 
--------- | ----------- | -----------
im_status | chat status | 'online', 'offline' or 'away'
id | user id | *
name | user name | *

# Add users in book

> `POST http://domain.com/im_chat/api/user_chat_ab/add_users`

```
Successful response
```

```json
{
    "jsonrpc": "2.0", 
    "id": null, 
    "result": 
    {
        "status": "success"
    }
}
```

```
Unsuccessful response
```

```json
{
    "jsonrpc": "2.0", 
    "id": null, 
    "result": 
    {
        "status": "error",
        "message": "user_ids is not list"
    }
}
```

### HTTP Request

`POST http://domain.com/im_chat/api/user_chat_ab/add_users`

Add user in address book of current user

### Arguments

Parameter | Type | Required | Description
--------- | ----------- | ----------- | -----------
user_ids | list of user ids | Required | User IDs

### Returns
Dictionary with status of operation.

Contains fields:

Parameter | Description | Possible values 
--------- | ----------- | -----------
result | status and optional error message | *

# Remove users from book

> `POST http://domain.com/im_chat/api/user_chat_ab/remove_users`

```
Successful response
```

```json
{
    "jsonrpc": "2.0", 
    "id": null, 
    "result": 
    {
        "status": "success"
    }
}
```

```
Unsuccessful response
```

```json
{
    "jsonrpc": "2.0", 
    "id": null, 
    "result": 
    {
        "status": "error",
        "message": "user_ids is not list"
    }
}
```

### HTTP Request

`POST http://domain.com/im_chat/api/user_chat_ab/remove_users`

Remove user from address book of current user

### Arguments

Parameter | Type | Required | Description
--------- | ----------- | ----------- | -----------
user_ids | list of user ids | Required | User IDs

### Returns
Dictionary with status of operation.

Contains fields:

Parameter | Description | Possible values 
--------- | ----------- | -----------
result | status and optional error message | *

# Add partner in book

> `POST http://domain.com/im_chat/api/user_chat_ab/add_partner`

```
Successful response
```

```json
{
    "jsonrpc": "2.0", 
    "id": null, 
    "result": 
    {
        "status": "success"
    }
}
```

```
Unsuccessful response
```

```json
{
    "jsonrpc": "2.0", 
    "id": null, 
    "result": 
    {
        "status": "error",
        "message": "input parameters are not valid"
    }
}
```

### HTTP Request

`POST http://domain.com/im_chat/api/user_chat_ab/add_partner`

Add partner in address book of current partner

### Arguments

Parameter | Type | Required | Description
--------- | ----------- | ----------- | -----------
parent_partner_id | number | Required | ID of owner of address book 
child_partner_id | number | Required | Added partner ID in book

### Returns
Dictionary with status of operation.

Contains fields:

Parameter | Description | Possible values 
--------- | ----------- | -----------
result | status and optional error message | *

# Post message

> `POST http://domain.com/im_chat/post`

### HTTP Request

`POST http://domain.com/im_chat/post`

Post message in chat

### Arguments

Parameter | Type | Required | Description
--------- | ----------- | ----------- | -----------
uuid | string | Required | Session UUID 
message_type | string | Required | Type of message
message_content | string | Required | Content of message

### Returns
ID of message.

Parameter | Description | Possible values 
--------- | ----------- | -----------
message_id | ID of posted message | *

