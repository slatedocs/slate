# Client

The Client resource has the following attributes.

## Client JSON

```json
{
    "id": 1,
    "name": "Movember Production",
    "clientid": "movember-prod",
    "state": "active",
    "enterprise": false,
    "monitoring": true,
    "created_at": 2305325,
    "updated_at": 2305325
}
```

Attribute | Type | Description
--- | --- | ---
**id** | Integer | unique
**name** | String | Name
**clientid** | String | unique, human readable id
**enterprise** | Boolean | enterprise service level
**monitoring** | Boolean | CMM monitoring
**links** | [Client Relations](#client-contact-roles)
**created_at** | Timestamp |
**updated_at** | Timestamp |

### Client Contact Roles

```json
{
    "links": {
        "roles": {
            "href": "https://manage.bulletproof.net/api/v4/roles/5,12,17,20",
            "ids": ["5", "12", "17", "20"],
            "type": "roles"
        }
    }
}
```

Includes all associated contact roles. It is possible, that one contact is associated via several roles.

### Client Services

```json
{
    "links": {
        "services": {
            "href": "https://manage.bulletproof.net/api/v4/clients/5,20,2305,2",
            "ids": ["5", "20", "2305", "2"],
            "type": "services"
        }
    }
}
```

Links to the associated [Services](#service)

### Client Account

```json
{
    "links": {
        "account": {
            "href": "https://manage.bulletproof.net/api/v4/accounts/5",
            "ids": "5",
            "type": "accounts"
        }
    }
}
```

Links to the associated [Account](#account)

## Retrieving an existing Client

```curl
 curl https://manage.bulletproof.net/api/v4/clients/:id \
    -u mangage_test_token_askd025tiwlkaf:
```

```json
{
    "clients": [
        {
          "id": 1,
          "name": "Movember Production",
          "clientid": "movember-prod",
          "state": "active",
          "enterprise": false,
          "monitoring": true,
          "created_at": 2305325,
          "updated_at": 2305325
        }
    ]
}
```

#### HTTP Request

``` GET /api/v4/clients/:id ```

#### Arguments

Parameter | Required | Description
--- | --- | ---
*id* | Integer | primary ID

#### Response

Response 200

## List all Clients

```curl
curl https://manage.bulletproof.net/api/v4/clients \
    -u mangage_test_token_askd025tiwlkaf:
```

```json
{
    "clients": [
        {
            "id": 1,
            "name": "Movember Production",
            "clientid": "movember-prod"
        },
        {
            "id": 2,
            "name": "Movember Staging",
            "clientid": "movember-stag"
        }
    ]

}
```
#### HTTP Request

``` GET /api/v4/clients```

#### Arguments

Parameter | Type | Description
--- | --- | ---
*count* | Integer | *optional*, *default* is **10** a limit on the number of objects to be returned. Count can range between 1 and 100 items.
