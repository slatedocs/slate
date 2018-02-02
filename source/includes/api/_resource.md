## resource object

### Basic Attributes

####id

A unique identifier for this resource

####name

Resource name

####description

Description of the resource

####notes

Notes about the resource

### resource.list

<span class="tryit" id="resource-list-tryit"></span>

> Request example:

```JSON
{
    "select": {
        "resource": 52
    }
}
```

> Response example:

```JSON
{
  "count": 1,
  "page": {
    "this": {
      "batch": 10,
      "start": 1
    }
  },
  "resources": [
    {
      "description": "This is a Test Resource",
      "id": "52",
      "name": "TestResource",
      "notes": "Test resource notes",
    }
  ]
}
```

Returns information about resources. Uses [pagination](#pagination).

Optional parameters:

`select` object with a `resource` attribute identifying a single resource or array of resources to be returned. E.g. `{select:{resource:12345}}.`

`select` object with a `workgroup` attribute identifying a single workgroup to be returned. E.g. `{select:{resource:12345, workgroup: 54321}}.`

####show_only_workgroup_listables

Only return results for the workgroup specified (in `select`).

####exclude_site

Boolean; if a manager of the team, don't include resources associated with the site itself with those for the team.



