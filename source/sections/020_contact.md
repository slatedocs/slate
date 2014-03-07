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

Attribute | Type | Constraints
--- | --- | ---
**id** | Integer | unique
**salutation** | String | "Mr", "Ms", "Miss", "Mrs", "Dr"
**first_name** | String |
**last_name** | String |
**company** | String |
**position** | String |
**email** | String |
**fax** | String |
**phone** | [Phone JSON Object](#phone-json-object)
**notifications** | [Notifications JSON Object](#notifications-json-object)
**links** | [Contact Relations](#contact-relations)
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

Attribute | Type | Constraints
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
**email** | [Notification JSON Object](#notification-json-object) | optional
**sms** | [Notification JSON Object](#notification-json-object) | optional

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

## Retrieving an existing Contact

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
            "updated_at": "timestamp"
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

#### HTTP Request

``` PATCH /api/v3/contacts/:id ```

#### Arguments

Parameter | Type | Description
--- | --- | ---
*id* | Integer | primary ID

#### Response

Response 204

## List all Contacts

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
            "emai": "steve.jobs@me.com"
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
