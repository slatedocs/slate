## department object

department objects have the following attributes:

####id

A unique identifier for this department.

####name

The name of this department. Maximum length 128 characters.

### department.create

<script>tryit('department.create')</script> 

Creates a new department record.

Parameters: Any attributes of a department object (except `id`) may be specified. A unique `name` parameter must be specified. Additionally, a `workgroup` parameter must be specified to create initial workgroup relationships for this department. It may be either a single workgroup identifier or an array of identifiers of workgroups that use this department.

Response: On success, an `id` attribute will provide the identifier for the new department.

### department.delete

<script>tryit('department.delete')</script> 

Deletes a department.

Required parameter: `id`.

On success, empty results will be returned.

### department.get

<script>tryit('department.get')</script> 

Returns information about departments. Uses [pagination](#pagination).

Optional parameters: `select` object with a `department` attribute identifying a single department or array of departments to be returned. E.g.`{select:{department:12345}}`

The response results `departments` attribute will be an array of the current page of departments. Each element of the array may have the following attributes:

####id

A unique identifier for this department.

####name

The name of this department.

### department.list

<script>tryit('department.list')</script> 

Returns information about departments. Uses [pagination](#pagination).

Optional parameters: `select` object with a `department` attribute identifying a single department or array of departments to be returned. E.g. `{select:{department:12345}}`

The response results `departments` attribute will be an array of the current page of departments. Each element of the array may have the following attributes:

####id

A unique identifier for this department.

####name

The name of this department.

### department.update

<script>tryit('department.update')</script> 

Updates a department object.

Required parameter: `id`. Any other department object attributes may be specified.

Response: On success, empty results will be returned.

