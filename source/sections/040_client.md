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
            "href": "http://manage.bulletproof.net/api/v3/roles/5,12,17,20",
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
            "href": "http://manage.bulletproof.net/api/v3/clients/5,20,2305,2",
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
            "href": "http://manage.bulletproof.net/api/v3/accounts/5",
            "ids": "5",
            "type": "accounts"
        }
    }
}
```

Links to the associated [Account](#account)

## Retrieving an existing Client

```curl
 curl http://manage.bulletproof.net/api/v3/clients/:id \
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

``` GET /api/v3/clients/:id ```

#### Arguments

Parameter | Required | Description
--- | --- | ---
*id* | Integer | primary ID

#### Response

Response 200

## List all Clients

```curl
curl http://manage.bulletproof.net/api/v3/clients \
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

``` GET /api/v3/clients```

#### Arguments

Parameter | Type | Description
--- | --- | ---
*count* | Integer | *optional*, *default* is **10** a limit on the number of objects to be returned. Count can range between 1 and 100 items.
