# Service

The Service resource has the following attributes.

## Service JSON

```json
{
    "id": 1,
    "name": "dvmh-docker-01",
    "serviceid": "dvmh-docker-01",
    "monitoring": true,
    "state": "active",
    "created_at": 2305325,
    "updated_at": 2305325
}
```

Attribute | Type | Description
--- | --- | ---
**id** | Integer | unique
**name** | String | serviceid
**serviceid** | String | serviceid
**monitoring** | Boolean | CMM monitoring
**state** | String | "pending", "active", "suspended", or "decommissioned"
**created_at** | Timestamp |
**updated_at** | Timestamp |
**links** | [Service Relations](#service-contact-roles)

### Service Contact Roles

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

### Service Client

```json
{
    "links": {
        "client": {
            "href": "https://manage.bulletproof.net/api/v4/clients/5",
            "ids": "5",
            "type": "clients"
        }
    }
}
```

Links to the associated [Client](#client)

### Service Account

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

## Retrieving an existing Service

```curl
 curl https://manage.bulletproof.net/api/v4/services/:id \
    -u email:password
```

```json
{
    "services": [
        {
            "id": 1,
            "name": "dvmh-docker-01",
            "type": "dmvh",
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

``` GET /api/v4/services/:id ```

#### Arguments

Parameter | Required | Description
--- | --- | ---
*id* | Integer | primary ID

#### Response

Response 200

## List all Services

```curl
curl https://manage.bulletproof.net/api/v4/services \
    -u email:password
```

```json
{
    "services": [
        {
            "id": 1,
            "name": "dvmh-docker-01",
            "type": "dmvh"
        },
        {
            "id": 2,
            "name": "dvmh-elasticsearch-01",
            "type": "dmvh"
        }
    ]

}
```
#### HTTP Request

``` GET /api/v4/services```

#### Arguments

Parameter | Type | Description
--- | --- | ---
*count* | Integer | *optional*, *default* is **10** a limit on the number of objects to be returned. Count can range between 1 and 100 items.
