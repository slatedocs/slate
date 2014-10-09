# Account

The Account resource has the following attributes.

## Account JSON

```json
{
    "id": 1,
    "name": "Movember Foundation",
    "accountid": "movember",
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
**accountid** | String | unique, human readable id
**enterprise** | Boolean | enterprise service level
**monitoring** | Boolean | CMM monitoring
**links** | [Account Relations](#account-contact-roles)
**created_at** | Timestamp |
**updated_at** | Timestamp |

### Account Contact Roles

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

### Account Clients

```json
{
    "links": {
        "clients": {
            "href": "https://manage.bulletproof.net/api/v4/clients/5,20",
            "ids": ["5", "20"],
            "type": "clients"
        }
    }
}
```

Links to the associated [Clients](#client)

## Retrieving an existing Account

```curl
 curl https://manage.bulletproof.net/api/v4/accounts/:id \
    -u email:password
```

```json
{
    "accounts": [
        {
          "id": 1,
          "name": "Movember Foundation",
          "accountid": "movember",
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

``` GET /api/v4/accounts/:id ```

#### Arguments

Parameter | Required | Description
--- | --- | ---
*id* | Integer | primary ID

#### Response

Response 200

## List all Accounts

```curl
curl https://manage.bulletproof.net/api/v4/accounts \
    -u email:password
```

```json
{
    "accounts": [
        {
            "id": 1,
            "name": "Movember Foundation",
            "accountid": "movember-prod"
        },
        {
            "id": 2,
            "name": "Bulletproof",
            "accountid": "bulletproof"
        }
    ]

}
```
#### HTTP Request

``` GET /api/v4/accounts```

#### Arguments

Parameter | Type | Description
--- | --- | ---
*count* | Integer | *optional*, *default* is **10** a limit on the number of objects to be returned. Count can range between 1 and 100 items.
