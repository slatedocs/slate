## Input/Output Options

In addition to providing fields and their values in a request, you may also specify options to control how your request
is interpreted and how the response is generated. For GET requests, options are specified as URL parameters prefixed
with `opt_`. For POST or PUT requests, options are specified in the body. If the body uses the `application/x-www-form-urlencoded`
content type, then options are prefixed with `opt_` just like for GET requests. If the body uses the `application/json`
content type, then options are specified inside the top-level `options` object
(a sibling of the `data` object).

These options can be used in combination in a single request, though some of them may conflict in their impact on
the response.

| Option | Description | Notes |
|---|---|---|
| **pretty** | <code class="table-example">?opt_pretty options: { pretty: true }</code> Provides the response in "pretty" output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. |  |
| **fields** | <code class="table-example">?opt_fields=followers,assignee options: { fields: ["followers", "assignee"] }</code> Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as <a href="/developers/documentation/getting-started/input-output-options#paths">paths</a>, described below. | The id of included objects will always be returned, regardless of the field options. |
| **expand** | <code class="table-example">?opt_expand=followers options: { expand: ["followers"] }</code> Query results and sub-objects are returned in *compact* form by default. This option can be used to expand query results or sub-objects to return more detailed information. Be sure you really need the information in the expanded form, as executing a query with many results in expanded form can be costly and return you a lot of data to consume. | If the `fields` option is also used, it will take precedence over the expand option and prevent expansion. |

**Default output**

    # Request
    curl -H "Authorization: Bearer <personal_access_token>" https://app.asana.com/api/1.0/users/me

    # Response
    HTTP/1.1 200
    {"data":{"email":"sanchez@...","id":999,"name":"Greg Sanchez"}}

**Pretty output (how all API requests in this doc are presented)**

    # Request
    curl -H "Authorization: Bearer <personal_access_token>" "https://app.asana.com/api/1.0/users/me?opt_pretty"

    # Response
    HTTP/1.1 200
    {
      "data": {
        "email": "sanchez@...",
        "id": 999,
        "name": "Greg Sanchez"
      }
    }

**Get only name and description of task**

    # Request
    curl -H "Authorization: Bearer <personal_access_token>" "https://app.asana.com/api/1.0/tasks/1224?opt_fields=name,notes"

    # Response
    HTTP/1.1 200
    {
      "data": {
        "name": "Make a list",
        "notes": "Check it twice!",
        "id": 1224
      }
    }

**Reassign task, expanding projects in output**

    # Request
    curl --request PUT -H "Authorization: Bearer <personal_access_token>" https://app.asana.com/api/1.0/tasks/1001 \
    -d "assignee=1234" \
    -d "opt_expand=%2Aprojects%2A"

    # Alternative request using JSON
    curl --request PUT -H "Authorization: Bearer <personal_access_token>" -H "Content-Type: application/json" \
    https://app.asana.com/api/1.0/tasks/1001 -d \
    '{
        "data": { "assignee": 1234 },
        "options": { "expand": "projects" }
    }'


    # Response
    HTTP/1.1 200
    {
      "data": {
        "id": 1001,
        "projects": [
        {
          "archived": false,
          "created_at": "",
          "followers": [],
          "modified_at": "",
          "notes": "",
          "id": 1331,
          "name": "Things to buy"
        }
        ],
        ...
      }
    }

<a name="paths"></a>
**SELECTING FIELDS**

Some output options allow you to reference fields of objects to include or expand in the response.
The way to specify a field is by *path*. A path is made up of a sequence of *terms* separated by the dot (`.`)
operator. It takes the form `this.a.b`… where *this* refers to an object returned at the top level of the response,
*a* the name of a field on a root object, *b* a field on a child object referred to by *a*, and so on.

For example, when retrieving a task or tasks, the path `this.followers.email` refers to the email field of all users
mentioned in the `followers` field of the task or tasks returned. See the annotated output below:

<div class="row">
  <div class="col-small-6">
    <strong>Data</strong>

<pre><code>"data": {
  "id": 1001,
  "name": "Feed the cat",
  "workspace": {
    "id": 14916,
    "name": "Shared Projects",
  },
  "followers": [{
    "id": 1234,
    "email": "tbizarro@…",
  }, {
    "id": 5678,
    "email": "gsanchez@…",
  }]
}
</pre></code>
  </div>

  <div class="col-small-6">
    <strong>Path</strong>

<pre><code>this

this.name
this.workspace

this.workspace.name

this.followers

this.followers.email


this.followers.email


</pre></code>
  </div>
</div>

There are also some advanced operators you can use for shorter syntax in selecting fields:

**`(` .. `|` .. `)`**

The **group** operator can be used in place of any whole term in a path, and will match any of a group of terms.

`this.(followers|assignee).email` will match the `email` field of the `assignee` object or any of the `followers`.
