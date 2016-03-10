# Form Endpoints

<aside class=notice>
The <code>/forms</code> endpoint allow you to access forms from your Netlify sites. You can scope forms to a specific site with <code>/sites/{:site_id}/forms</code>.
</aside>

Examples:

- `/api/v1/users/{:user_id}/forms`
- `/api/v1/users/{:user_id}/sites/{:site_id}/forms`
- `/api/v1/sites/{:site_id}/forms`

## Get Forms
``` http
GET /forms HTTP/1.1
```

> Example Response:

```json
[
  {
    "id":"ac0865cc46440b1e64666f520e8d88d670c8a2f6",
    "site_id":"0d3a9d2f-ef94-4380-93df-27ee400e2048",
    "name":"Landing Page",
    "paths":["/index"],
    "submission_count":3,
    "fields": [
      {"name":"name","type":"text"},
      {"name":"email","type":"email"},
      {"name":"phone","type":"text"},
      {"name":"company","type":"text"},
      {"name":"website","type":"url"},
      {"name":"number_of_employees","type":"select"}
    ],
    "created_at":"2013-09-18T20:26:19Z"
  }
]
```
