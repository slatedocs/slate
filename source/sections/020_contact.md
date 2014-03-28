# Contact

The Contact resource has the following attributes:

## Contact JSON

```json
{
    "id": 1,
    "salutation": "Mr",
    "first_name": "Bill",
    "last_name": "Gates",
    "copmany": "Microsoft",
    "position": "CEO",
    "email": "bill.gates@hotmail.com",
    "fax": "+49 321 234",
    "phone": {...},
    "notifications": {...},
    "links": {...},
    "created_at": 2305325,
    "updated_at": 2305325
}
```

Attribute | Type | Description
--- | --- | ---
**id** | Integer | unique
**salutation** | String | "Mr", "Ms", "Miss", "Mrs", "Dr"
**first_name** | String |
**last_name** | String |
**company** | String |
**position** | String |
**email** | String |
**fax** | String |
**phone** | [Phone JSON Object](#contact-phone)
**notifications** | [Notifications JSON Object](#contact-notifications)
**links** | [Links](#contact-roles)
**created_at** | Timestamp |
**updated_at** | Timestamp |


### Contact Phone

```json
{
    "phone": {
        "mobile": "+61 123 111 123",
        "direct": "+61 123 222 123",
        "office": "+49 123 333 123"
    }
}
```

Attribute | Type | Description
--- | --- | ---
**mobile** | String
**direct** | String
**office** | String

### Contact Notifications

```json
{
    "notifications": {
        "email": {...}
    }
}
```

Attribute | Type | Description
--- | --- | ---
**email** | [Notification JSON Object](#contact-notification) | optional
**sms** | [Notification JSON Object](#contact-notification) | optional

### Contact Notification

```json
{
    "sms": {
        "address": "+61 123 111 123",
        "interval": 60,
        "rollup_threshold": 3
    }
}
```

Attribute | Type | Description
--- | --- | ---
**address** | String | email or phone-number
**interval** | Integer |
**rollup_threshold** | Integer

### Contact Roles

```json
{
    "links": {
        "roles": {
            "href": "http://example.com/roles/5,12,17,20",
            "ids": ["5", "12", "17", "20"],
            "type": "roles"
        }
    }
}
```

Includes all associated contact roles. It is possible, that one contact is associated via several roles to a service, client or account.

### Contact Services

```json
{
    "links": {
        "services": {
            "href": "http://example.com/services/5,12,17,20",
            "ids": ["5", "12", "17", "20"],
            "type": "services"
        }
    }
}
```

Includes all related services for a contact (joined via [Contact Roles](#contact-roles))

### Contact Clients

```json
{
    "links": {
        "clients": {
            "href": "http://example.com/clients/5,12,17,20",
            "ids": ["5", "12", "17", "20"],
            "type": "clients"
        }
    }
}
```

Includes all related clients for a contact (joined via [Contact Roles](#contact-roles))

### Contact Accounts

```json
{
    "links": {
        "accounts": {
            "href": "http://example.com/accounts/5,12,17,20",
            "ids": ["5", "12", "17", "20"],
            "type": "accounts"
        }
    }
}
```

Includes all related accounts for a contact (joined via [Contact Roles](#contact-roles))


## Retrieving an existing Contact

```curl
curl http://manage.bulletproof.net/api/v3/contacts/:id \
   -u mangage_test_token_askd025tiwlkaf:
```

```json
{
    "contacts": [
        {
            "id": 1,
            "salutation": "Mr",
            "first_name": "Bill",
            "last_name": "Gates",
            "email": "bill.gates@hotmail.com",
            "fax": "+49 321 234",
            "phone": {
                "mobile": "+61 123 111 123",
                "direct": "+61 123 222 123",
                "office": "+49 123 333 123"
            },
            "notifications": {
                "email": {
                    "address": "bill.gates@hotmail.com",
                    "interval": 60,
                    "rollup_threshold": 3
                },
                "sms": {
                    "address": "+61 123 111 123",
                    "interval": 60,
                    "rollup_threshold": 3
                }
            },
            "created_at": "timestamp",
            "updated_at": "timestamp",
            "links": {
               "roles": {
                    "href": "http://manage.bulletproof.net/api/v3/5,12,17,20",
                    "ids": ["5", "12", "17", "20"],
                    "type": "roles"
                }
            }
        }
    ]
}
```

#### HTTP Request

``` GET /api/v3/contacts/:id ```

#### Arguments

Parameter | Required | Description
--- | --- | ---
*id* | Integer | primary ID

#### Response

Response 200


## Update a Contact

```curl
curl http://manage.bulletproof.net/api/v3/contacts/:id \
   -u mangage_test_token_askd025tiwlkaf: \
   -d "contact[first_name]=Tim"
```

```json
{
    "first_name": "Tim"
}

```

To update a Contact send a JSON with updated value for one or more of the Contact resource attributes. All attributes values (states) from the previous version of this Contact are carried over by default if not included in the hash.

#### HTTP Request

``` PATCH /api/v3/contacts/:id ```

#### Arguments

Parameter | Required | Description
--- | --- | ---
*id* | Integer | primary ID

#### Response

Response 200

## Delete a Contact

```curl
curl http://manage.bulletproof.net/api/v3/contacts/:id \
   -u mangage_test_token_askd025tiwlkaf: \
   -X DELETE
```

#### HTTP Request

``` PATCH /api/v3/contacts/:id ```

#### Arguments

Parameter | Type | Description
--- | --- | ---
*id* | Integer | primary ID

#### Response

Response 204

## List all Contacts

```curl
 curl http://manage.bulletproof.net/api/v3/contacts \
    -u mangage_test_token_askd025tiwlkaf: \
 ```

```json
{
    "contacts": [
        {
            "id": 1,
            "first_name": "Bill",
            "last_name": "Gates",
            "email": "bill.gates@hotmail.com"
        },
        {
            "id": 2,
            "first_name": "Steve",
            "last_name": "Jobs",
            "email": "steve.jobs@me.com"
        }
    ]

}
```
#### HTTP Request

``` GET /api/v3/contacts```

#### Arguments

Parameter | Type | Description
--- | --- | ---
*count* | Integer | *optional*, *default* is **10** a limit on the number of objects to be returned. Count can range between 1 and 100 items.
