# Snippet Endpoints


Snippets are code snippets that will be injected into every HTML page of the website, either right before the closing head tag or just before the closing body tag. Each snippet can specify code for all pages and code that just gets injected into "Thank you" pages shown after a successful form submission.

## Get All Snippets

### HTTP Request
Retrieves the current set of snippets for the given site

`GET /api/v1/sites/{:site_id}/snippets`

> Response:

```json
[
  {
    "id":0,
    "title":"Test",
    "general":"\u003Cscript\u003Ealert(\"Hello\")\u003C/script\u003E",
    "general_position":"head",
    "goal":"",
    "goal_position":"footer"
  }
]
```
<!-- TODO @matt this is a bit confusing, do I have it right? -->

<aside class=notice>
The text in the <code>general</code> or <code>goal</code> are taken and directly injected to the specified position.
</aside>

- `general`: code to inject
- `general_position`: either `head` or `footer`, determining whether to injected code should put before the `</head>` or `</body>` tag, respectively.
- `goal`: code to inject into the "Thank you" page after a form submission
- `goal_position`: where to inject the code

## Get a Snippet

### HTTP Request
`GET /api/v1/sites/{:site_id}/snippets/{:snippet_id}`

> Response:

```json
{
  "id":0,
  "title":"Test",
  "general":"\u003Cscript\u003Ealert(\"Hello\")\u003C/script\u003E",
  "general_position":"head",
  "goal":"",
  "goal_position":"footer"
}
```

<!-- TODO what are the responses for these? -->

## Add a Snippet

### HTTP Request
`POST /api/v1/sites/{:site_id}/snippets`

<!-- TODO example -->

## Update a Snippet

Replaces the old snippet

### HTTP Request
`PUT /api/v1/sites/{:site_id}/snippets/{:snippet_id}`

## Delete Snippet

### HTTP Request
`DELETE /api/v1/sites/{site_id}/snippets/{snippet_id}`
