## department object

department objects have the following attributes:

####id

A unique identifier for this department.

####name

The name of this department. Maximum length 128 characters.

### department.create

> Request example:

```JSON
{
   "workgroup" : "226086",
   "name" : "Test Department 0.0207031441686816"
}
```

> Response example:

```JSON
{
   "seconds" : "0.19451",
   "jsonrpc" : "2.0",
   "id" : "55",
   "result" : {
      "id" : "949"
   }
}
```

<span class="tryit" id="department-create-tryit"></span>
Creates a new department record.

Parameters: Any attributes of a department object (except `id`) may be specified. A unique `name` parameter must be specified. Additionally, a `workgroup` parameter must be specified to create initial workgroup relationships for this department. It may be either a single workgroup identifier or an array of identifiers of workgroups that use this department.

Response: On success, an `id` attribute will provide the identifier for the new department.

### department.delete

<span class="tryit" id="department-delete-tryit"></span>
Deletes a department.

Required parameter: `id`.

On success, empty results will be returned.

### department.get

> Request example:

```JSON
{
   "id" : "948"
}
```

> Response example:

```JSON
{
   "seconds" : "0.093228",
   "jsonrpc" : "2.0",
   "id" : "4",
   "result" : {
      "name" : "department 977",
      "id" : "948"
   }
}
```

<span class="tryit" id="department-get-tryit"></span>
Returns information about departments. Uses [pagination](#pagination).

Optional parameters: `select` object with a `department` attribute identifying a single department or array of departments to be returned. E.g.`{select:{department:12345}}`

The response results `departments` attribute will be an array of the current page of departments. Each element of the array may have the following attributes:

####id

A unique identifier for this department.

####name

The name of this department.

### department.list

> Request example:

```JSON
{
   "select" : {
      "department" : "948"
   }
}
```

> Response example:

```JSON
{
   "seconds" : "0.093228",
   "jsonrpc" : "2.0",
   "id" : "4",
   "result" : {
      "count" : "1",
      "page" : {
         "this" : {
            "batch" : 25,
            "start" : 1
         }
      },
      "departments" : [
         {
            "name" : "department 977",
            "id" : "948"
         }
      ]
   }
}
```

<span class="tryit" id="department-list-tryit"></span>
Returns information about departments. Uses [pagination](#pagination).

Optional parameters:

####select

An object specifying selection criteria for this request. Allowed criteria are:

####department

A single department identifier or array of department identifiers.

####search

A generic search string; select departments containing this string in their name.

#####workgroup

Single workgroup to filter results to be returned.

**NOTE:** If the call is made on behalf of a manager, the caller must also specify the boolean value `exclude_site` to limit the results to only the workgroup specified.

#####show_only_workgroup_listables

Only return results for the workgroup.

#####exclude_site

Boolean; if a manager of the team, don't include departments associated with the site itself with those for the team.

#####sitewide

Boolean; query for all departments across all workgroups that the user has access to. Enabled by default for manager accounts.

The response results `departments` attribute will be an array of the current page of departments. Each element of the array may have the following attributes:

####id

A unique identifier for this department.

####name

The name of this department.

####description

Description of the department

### department.update

> Request example:

```JSON
{
   "workgroup" : "226086",
   "name" : "Test Department 949",
   "id" : "949"
}
```

> Response example:

```JSON
{
   "seconds" : "0.116093",
   "jsonrpc" : "2.0",
   "id" : "56",
   "result" : {}
}
```

<span class="tryit" id="department-update-tryit"></span>
Updates a department object.

Required parameter: `id`. Any other department object attributes may be specified.

Response: On success, empty results will be returned.

