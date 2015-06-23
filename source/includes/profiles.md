# Profiles

## Get All Profiles


```http
GET /api/v2/profiles/ HTTP/1.1
Accept: application/json
Authorization: Token "YOUR SDE ACCESS TOKEN"
```

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
    "results": [
    {
        "id": "P1",
        "name": "No Profile",
        "description": "An empty Profile",
        "answers": ["A740"],
        "logo_url": "/static/images/logo-other.png"
    },
    {
    "id": "P3",
    "name": ".NET Web App",
    "description": "Microsoft .NET Web Application",
    "answers":["A1061", "A740", "A48", "A4", "A2"],
    "logo_url": "/static/images/logo-net.png"
    }
    ]
}
```
This endpoint retrieves a list of Application resources.

### Query Parameters

The following parameters may be used to filter the application resources in the response.


Parameter | Description | Example
----------|-------------|-------------
ordering |  Returns a list of application resources ordered by the specified field. This endpoint supports ordering by id, name and description. | "/?ordering=name"