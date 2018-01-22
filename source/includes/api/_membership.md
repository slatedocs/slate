## membership object

membership objects have the following attributes:

####member

The account identifier for this membership.

####external_account

The external account identifier for this object.

**NOTE:** This field is only used or returned when external ids are enabled for the site.

####workgroup

The workgroup identifier for this membership.

####level

Level|Membership Type
--|--
2|member
3|coordinator
4|manager

### membership.create

<script>tryit('membership.create')</script> 

Creates new workgroup/account memberships.

Required parameters:

####member

A single account identifier or an array of identifiers of accounts for which to create memberships for each specified workgroup.

**NOTE:** If you are calling this method with the `external_member` parameter, `member` is not required.

####external_member

A single external account identifier or an array of external identifiers of accounts for which to create memberships for each specified workgroup.

**NOTE:** If you are calling this method with the `member` parameter, `external_member` is not required, and will be ignored.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to create memberships for each specified account. Currently, only a single workgroup may be specified.

####level

User level for which to create memberships.

No more than 10000 memberships may be specified in one request.

If one or more of the specified memberships already exist, the remaining memberships (if any) will be created and no error will be returned. Existing user levels will remain unchanged.

Response: On success, empty results will be returned.

### membership.delete

<script>tryit('membership.delete')</script> 

Deletes workgroup/account memberships.

Required parameters:

####member

A single account identifier or an array of identifiers of accounts for which to delete memberships for each specified workgroup.

**NOTE:** If you are calling this method with the `external_member` parameter, `member` is not required.

####external_member

A single external account identifier or an array of external identifiers of accounts for which to delete memberships for each specified workgroup.

**NOTE:** If you are calling this method with the `member` parameter, `external_member` is not required.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to delete memberships for each specified account. Currently, only a single workgroup may be specified.

If one or more of the specified memberships doesn't exist, the remaining memberships (if any) will be deleted and no error will be returned.

Response: On success, empty results will be returned.

### membership.list

<script>tryit('membership.list')</script> 

Returns information about workgroup/account memberships. Uses [pagination](#pagination). Uses select criteria.

Required parameters:

####select

An object specifying selection criteria for this request. Either `member` or `workgroup` must be specified. The available criteria include:

####member

A single account identifier or an array of account identifiers indicating accounts for whom to return memberships.

**NOTE:** If you are calling this method with the `external_member` parameter, `member` is not required.

####external_member

A single external account identifier or an array of external account identifiers indicating accounts for whom to return memberships.

**NOTE:** If you are calling this method with the `external_member` parameter, `member` is not required.

####workgroup

A single workgroup identifier or an array of workgroup identifiers indicating workgroup for which to return memberships.

####level

User level of memberships to return.

####org_hold

Boolean; if specified and true, indicates that accounts on hold should be included in the returned results.

####org_pending

Boolean; if specified and true, indicates that accounts with pending status should be included in the returned results.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the memberships attribute, the results should include a referenced_objects attribute giving information about the accounts and workgroups referred to by the returned memberships.

The response results `memberships` attribute will be an array of the current page of memberships. Each element of the array will be a membership object.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `memberships` results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

####workgroup

id and name attributes are provided.

### membership.update

<script>tryit('membership.update')</script> 

Updates user levels for workgroup/account memberships.

Required parameters:

####member

A single account identifier or an array of identifiers of accounts for which to update memberships for each specified workgroup.

**NOTE:** If you are calling this method with the `external_member` parameter, `member` is not required.

####external_member

A single external account identifier or an array of external identifiers of accounts for which to update memberships for each specified workgroup.

**NOTE:** If you are calling this method with the `member` parameter, `external_member` is not required.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to update memberships for each specified account. Currently, only a single workgroup may be specified.

####level

User level to which to update memberships.

If one or more of the specified memberships doesn't exist, the remaining memberships (if any) will be updated and no error will be returned.

Response: On success, empty results will be returned.

