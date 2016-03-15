# Snippet Endpoints


Snippets are code snippets that will be injected into every HTML page of the website, either right before the closing head tag or just before the closing body tag. Each snippet can specify code for all pages and code that just gets injected into "Thank you" pages shown after a successful form submission.

## Get All Snippets

Retrieves the current set of snippets for the given site

<aside class=notice>
The <code>snippet_id</code> is not globally unique, it is unique per site.
</aside>

``` http
GET /sites/{:site_id}/snippets HTTP/1.1
```

> Response:

```json
[
  {
    "id":0,
    "title":"Test",
    "general":"<script>alert(\"Hello\")</script>",
    "general_position":"head",
    "goal":"",
    "goal_position":"footer"
  }
]
```

<aside class=notice>
The text in the <code>general</code> or <code>goal</code> are taken and directly injected to the specified position.
</aside>

- `general`: code to inject
- `general_position`: either `head` or `footer`, determining whether to injected code should put before the `</head>` or `</body>` tag, respectively.
- `goal`: code to inject into the "Thank you" page after a form submission
- `goal_position`: where to inject the code

## Get a Snippet

``` http
GET /sites/{:site_id}/snippets/{:snippet_id} HTTP/1.1
```

> Example Response:

```json
{
  "id":0,
  "title":"Test",
  "general":"<script>alert(\"Hello\")</script>",
  "general_position":"head",
  "goal":"",
  "goal_position":"footer"
}
```

<!-- TODO what are the responses for these? -->

## Add a Snippet

``` http
POST /sites/{:site_id}/snippets HTTP/1.1
```

<!-- TODO example -->

## Update a Snippet

Replaces the old snippet


``` http
PUT /sites/{:site_id}/snippets/{:snippet_id} HTTP/1.1
```

## Delete Snippet

``` http
DELETE /sites/{:site_id}/snippets/{:snippet_id} HTTP/1.1
```
