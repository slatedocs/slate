## role object

role objects have the following attributes:

####id

A unique identifier for this role.

####name

The name of this role. Maximum length 48 characters.

### role.create

> Request example:

```JSON
{
   "workgroup" : "226086",
   "name" : "Test Role 0.699796458722442"
}
```

> Response example:

```JSON
{
   "seconds" : "0.319621",
   "jsonrpc" : "2.0",
   "id" : "51",
   "result" : {
      "id" : "2282"
   }
}
```

<span class="tryit" id="role-create-tryit"></span>
Creates a new role record.

Parameters: Any attributes of a role object (except id) may be specified. A unique name parameter must be specified. Additionally, a workgroup parameter must be specified to create initial workgroup relationships for this role. It may be either a single workgroup identifier or an array of identifiers of workgroups that use this role.

Response: On success, an id attribute will provide the identifier for the new role.

### role.delete

<span class="tryit" id="role-delete-tryit"></span>
Deletes a role.

Required parameter: id.

On success, empty results will be returned.

### role.get

> Request example:

```JSON
{
   "id" : "2281"
}
```

> Response example:

```JSON
{
   "seconds" : "0.115639",
   "jsonrpc" : "2.0",
   "id" : "4",
   "result" : {
      "name" : "role 813",
      "id" : "2281"
   }
}
```

<span class="tryit" id="role-get-tryit"></span>
Returns information about roles. Uses [pagination](#pagination).

Optional parameters: select object with a role attribute identifying a single role or array of roles to be returned. E.g. {select:{role:12345}}

The response results roles attribute will be an array of the current page of roles. Each element of the array may have the following attributes:

####id

A unique identifier for this role.

####name

The name of this role.

### role.assign

> Request example:

```JSON
{
   "workgroup" : 56789,
   "account" : 12345,
   "role" : [
      1,
      2,
      3
   ]
}
```

> Response example:

```JSON
{
   "seconds" : "0.115639",
   "jsonrpc" : "2.0",
   "id" : "4",
   "result" : {}
}
```

<span class="tryit" id="role-assign-tryit"></span>
Assigns a role or multiple roles to a member of a given workgroup. This method can be used to assign or unassign roles.

        ####external_account

external account ID to be updated, if this organization uses external IDs.

####account

account to be updated

####workgroup

workgroup the member belongs to

####role

One or more role ids to be assigned to the workgroup member.

### role.list

> Request example:

```JSON
{
   "select" : {
      "role" : "2281"
   }
}
```

> Response example:

```JSON
{
   "seconds" : "0.115639",
   "jsonrpc" : "2.0",
   "id" : "4",
   "result" : {
      "roles" : [
         {
            "name" : "role 813",
            "id" : "2281"
         }
      ],
      "count" : "1",
      "page" : {
         "this" : {
            "batch" : 25,
            "start" : 1
         }
      }
   }
}
```

<span class="tryit" id="role-list-tryit"></span>
Returns information about roles. Uses [pagination](#pagination).

Optional parameters: `select` object with a `role` attribute identifying a single role or array of roles to be returned. E.g. `{select:{role:12345}}`

The response results `roles` attribute will be an array of the current page of roles. Each element of the array may have the following attributes:

####id

A unique identifier for this role.

####name

The name of this role.

### role.update

> Request example:

```JSON
{
   "workgroup" : "226086",
   "name" : "Test Role 2282",
   "id" : "2282"
}
```

> Response example:

```JSON
{
   "seconds" : "0.141744",
   "jsonrpc" : "2.0",
   "id" : "52",
   "result" : {}
}
```

<span class="tryit" id="role-update-tryit"></span>
Updates a role object.

Required parameter: `id`. Any other role object attributes may be specified.

Response: On success, empty results will be returned.

