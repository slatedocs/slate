<hr>
<section>

# Input/Output Options

> GET url params

```
?opt_pretty
?opt_fields=followers,assignee
``` 

> PUT or POST body options

```
options: { 
  pretty: true,
  fields: ["followers", "assignee"]
}
```

<span class="description">
In addition to providing fields and their values in a request, you may also specify options to control how your request
is interpreted and how the response is generated. For GET requests, options are specified as URL parameters prefixed
with `opt_`. For POST or PUT requests, options are specified in the body. If the body uses the `application/x-www-form-urlencoded`
content type, then options are prefixed with `opt_` just like for GET requests. If the body uses the `application/json`
content type, then options are specified inside the top-level `options` object
(a sibling of the `data` object).
</span>

> ?opt_fields=name,notes&opt_pretty response

```
HTTP/1.1 200
{
  "data": {
    "name": "Make a list",
    "notes": "Check it twice!",
    "gid": 1224
  }
}
```

These options can be used in combination in a single request, though some of them may conflict in their impact on
the response.

| Option | Description |
|---|---|---|
| **pretty** | Provides the response in "pretty" output. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging. |
| **fields** | Some requests return *compact* representations of objects, to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as <a href="/docs/paths">paths</a>, described below. <br><br> The `gid` of included objects will always be returned, regardless of the field options. |

<a name="paths"></a>
**SELECTING FIELDS**

> opt_fields nesting

```
"data": {                       < this
  "gid": 1001,
  "name": "Feed the cat",       < this.name
  "workspace": {                < this.workspace
    "gid": 14916,
    "name": "Shared Projects",  < this.workspace.name
  },
  "followers": [{               < this.followers
    "gid": 1234,
    "email": "tbizarro@…",      < this.followers.email
  }, {
    "gid": 5678,
    "email": "gsanchez@…",      < this.followers.email
  }]
}
```

Some output options allow you to reference fields of objects to include in the response.
The way to specify a field is by *path*. A path is made up of a sequence of *terms* separated by the dot (`.`)
operator. It takes the form `this.a.b`… where *this* refers to an object returned at the top level of the response,
*a* the name of a field on a root object, *b* a field on a child object referred to by *a*, and so on.

For example, when retrieving a task or tasks, the path `this.followers.email` refers to the email field of all users
mentioned in the `followers` field of the task or tasks returned. See the annotated output below:

There are also some advanced operators you can use for shorter syntax in selecting fields:

**`(` .. `|` .. `)`**

The **group** operator can be used in place of any whole term in a path, and will match any of a group of terms.

`this.(followers|assignee).email` will match the `email` field of the `assignee` object or any of the `followers`.

<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>

</section>
