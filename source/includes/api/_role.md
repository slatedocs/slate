## role object

role objects have the following attributes:

####id

A unique identifier for this role.

####name

The name of this role. Maximum length 48 characters.

### role.create

<script>tryit('role.create')</script> 

> Request example:

```JSON

 {
     workgroup: "226086", 
     name: "Test Role 0.699796458722442"
 }
```

> Response example:

```JSON
 {
     seconds: "0.319621", 
     jsonrpc: "2.0", 
     id: "51", 
     result: {
         id: "2282"
     }
 }
```

Creates a new role record.

Parameters: Any attributes of a role object (except id) may be specified. A unique name parameter must be specified. Additionally, a workgroup parameter must be specified to create initial workgroup relationships for this role. It may be either a single workgroup identifier or an array of identifiers of workgroups that use this role.

Response: On success, an id attribute will provide the identifier for the new role.

### role.delete

<script>tryit('role.delete')</script>

Deletes a role.

Required parameter: id.

On success, empty results will be returned.

### role.get

<script>tryit('role.get')</script>

> Request example:

```JSON
{
     id: "2281"
}
```

> Response example:

```JSON
{
     seconds: "0.115639", 
     jsonrpc: "2.0", 
     id: "4", 
     result: {
        name: "role 813", 
        id: "2281"
    }
}
```

Returns information about roles. Uses [pagination](#pagination).

Optional parameters: select object with a role attribute identifying a single role or array of roles to be returned. E.g. {select:{role:12345}}

The response results roles attribute will be an array of the current page of roles. Each element of the array may have the following attributes:

####id

A unique identifier for this role.

####name

The name of this role.

### role.assign

<script>tryit('role.assign')</script> 

> Request example:

```JSON

 {
     account: 12345, 
     role: [
         1, 
         2, 
         3
     ], 
     workgroup: 56789
}
```


> Response example:

```JSON

 {
     seconds: "0.115639", 
     jsonrpc: "2.0", 
     id: "4", 
     result: {}
}
```


Assigns a role or multiple roles to a member of a given workgroup. This method can be used to assign or unassign roles.

+        <dt>external_account</dt><dd>external account ID to be updated, if this organization uses external IDs.

####account

account to be updated

####workgroup

workgroup the member belongs to

####role

One or more role ids to be assigned to the workgroup member.

### role.list

<script>tryit('role.list')</script>

> Request example:

```JSON

 {
    select: {
         role: "2281"
     }
}
```


> Response example:

```JSON

 {
     seconds: "0.115639", 
     jsonrpc: "2.0", 
     id: "4", 
     result: {
         count: "1", 
         page: {
             this: {
                 start: 1, 
                 batch: 25
             }
         }, 
         roles: [
             {
                 name: "role 813", 
                 id: "2281"
             }
         ]
     }
}
```


Returns information about roles. Uses [pagination](#pagination).

Optional parameters: `select` object with a `role` attribute identifying a single role or array of roles to be returned. E.g. `{select:{role:12345}}`

The response results `roles` attribute will be an array of the current page of roles. Each element of the array may have the following attributes:

####id

A unique identifier for this role.

####name

The name of this role.

### role.update

<script>tryit('role.update')</script> 

> Request example:

```JSON
{
    id: "2282", 
     workgroup: "226086", 
    name: "Test Role 2282"
}
```


> Response example:

```JSON

 {
     seconds: "0.141744", 
     jsonrpc: "2.0", 
    id: "52", 
     result: {}
}
```


Updates a role object.

Required parameter: `id`. Any other role object attributes may be specified.

Response: On success, empty results will be returned.

