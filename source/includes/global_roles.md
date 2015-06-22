# Global Roles

## Get All Global Roles

This endpoint returns a list of Global Role resources.

```http
GET /api/v2/global-roles/ HTTP/1.1
Accept: application/json
Authorization: Token "YOUR SDE ACCESS TOKEN"
```

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "results": [
        {
            "id": "UR4",
            "name": "Administrator",
            "description": "An administrator can create new..."
        },
        {
            "id": "UR5",
            "name": "No Role",
            "description": "This role confers no permissions."
        },
        {
            "id": "UR2",
            "name": "Project Lead",
            "description": "A project lead has permission to..."
        },
        {
            "id": "UR1",
            "name": "User",
            "description": "A regular SD Elements user has..."
        }
    ]
}
```

## Get a specific Global Role

Get a specific Global Role resource.

```http
GET /api/v2/global-roles/UR4/ HTTP/1.1
Accept: application/json
Authorization: Token "YOUR SDE ACCESS TOKEN"
```

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "id": "UR4",
    "name": "Administrator",
    "description": "An administrator can create new..."
}
```
