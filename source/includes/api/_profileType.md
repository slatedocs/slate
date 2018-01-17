## profileType object

profileType objects have the following attributes:

####id

A unique identifier for this profile type.

####name

The name of this profile type.

### profileType.list

<script>tryit('profileType.list')</script> 

Returns information about profile types. Uses [pagination](#pagination).

Optional parameters: `select` object with a `profile_type` attribute identifying a single profile type to be returned. E.g. `{select:{profile_type:12345}}`

The response results `profile_types` attribute will be an array of the current page of profile_types. Each element of the array will be a profile_type object.

