# Form Endpoints

<aside class=notice>
The <code>/api/v1/forms</code> endpoint allow you to access forms from your Netlify sites. You can scope forms to a specific site with <code>/sites/{site_id}/forms</code>.
</aside>

Forms can be accessed directly through the `/forms` endpoints, or can be accesses through nested endpoints like `/sites/{:site_id}/forms`. These endpoints will filter the forms by the site preceding it.

Examples:

- `/api/v1/users/{:user_id}/forms`
- `/api/v1/users/{:user_id}/sites/{:site_id}/forms`
- `/api/v1/sites/{:site_id}/forms`

## Get Forms
``` http
GET /forms HTTP/1.1
```
``` shell
curl http://app.netlify.com/api/v1/forms
  -H "Authorization: Bearer {:access_token}"
```
### HTTP Request

`GET /forms`

> Responds with JSON:

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
