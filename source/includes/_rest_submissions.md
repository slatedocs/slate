# Submission Endpoints

The submission endpoints are another commonly nested endpoint. They can be directly accessed via `/submissions/`, or by filtered paths like `/sites/{:site_id}/submissions`.

## Get All Submissions

``` http
GET /api/v1/submissions HTTP/1.1
```

> Response:

```json
[
  {
    "id":"5231110b5803540aeb000019",
    "number":13,
    "title":null,
    "email":"test@example.com",
    "name":"Mathias Biilmann",
    "first_name":"Mathias",
    "last_name":"Biilmann",
    "company":"Netlify",
    "summary":"Hello, World",
    "body":"Hello, World",
    "data": {
      "email":"test@example.com",
      "name": "Mathias Biilmann",
      "ip":"127.0.0.1"
    },
    "created_at":"2013-09-12T00:55:39Z",
    "site_url":"http://synergy.bitballoon.com"
  }
]
```
