# Global Roles

## Get All Global Roles

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

This endpoint returns a list of Global Role resources.

## Get a specific Global Rolex

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

This endpoint returns a list of Global Role resources.
