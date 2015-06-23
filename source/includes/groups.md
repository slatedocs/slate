# Groups

## Get All Groups

```http
GET /api/v2/groups/ HTTP/1.1
Accept: application/json
Authorization: Token "YOUR SDE ACCESS TOKEN"
```

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "results": [{
        "id": "G64",
        "name": "Group2",
        "description": "Group description",
        "role": "Administrator"
    }]
}
```

This endpoint returns a list of Group resources.

## Get a specific Group

```http
GET /api/v2/groups/G64/ HTTP/1.1
Accept: application/json
Authorization: Token "YOUR SDE ACCESS TOKEN"
```

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "id": "G64",
    "name": "Group2",
    "description": "Group description",
    "role": "Administrator"
}
```

Get a specific Group resource.
