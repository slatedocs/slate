## workgroup object

### workgroup: basic attributes

####id

A unique identifier for this workgroup.

####name

The name of this workgroup.

####zip

The postal code for this workgroup.

####code

The nickname or code for this workgroup.

####contact_account

The account identifier of the primary contact for this workgroup.

####external_contact_account

The external account identifier of the primary contact for this workgroup. This field is optional, and should be used instead of `contact_account` if your site is configured to support external identifiers and you wish to key off of the external id instead.

Extended workgroup objects may also have these attributes:

####org_default

Boolean; true if new organization accounts by default get membership in this workgroup.

####description

Workgroup description shown to current members.

####auto_add

Boolean; true if members may add themselves to this workgroup; false if add requests require manager approval.

####view_public

Boolean; true if recruiting new members within the organization.

####view_public_non_org

Boolean; true if recruiting new members from outside the organization.

####public_email

Email address to include in recruiting information.

####public_phone

Phone number to include in recruiting information.

####public_code

Summary description of workgroup to include in recruiting information.

####public_info

Long description of workgroup to include in recruiting information.

####self_remove

Boolean; true if members can remove themselves from membership in this workgroup.

####allow_shared

Boolean; true shifts for this workgroup are shown in the shared schedule view.

####show_confirmed

Boolean; true if the count of covered shifts by date for this workgroup is visible to all workgroup members.

####member_add_shift

Boolean; true if workgroup members are allowed to add their own covered shifts to the schedule.

####show_open

Boolean; true if the count of open shifts by date for this workgroup is shown to all workgroup members.

####cancel_period

Number of days prior to a shift within which a workgroup member may cancel.

####allowed_conflict_mins

Number of minutes of overlap between shifts with the same location and workgroup to consider not a conflict.

####timezone

####location

Default location identifier for this workgroup's shifts.

####url

Workgroup website.

####address

Mailing address address line.

####city

Mailing address city.

####state

Full name of mailing address state/province/subdivision.

####country

Full name of mailing address country.

####office_phone

####mobile_phone

####other_phone

####fax

####pager

(Not all attributes will be provided to all users.)

### workgroup.create_clients

<span class="tryit" id="workgroup-create_clients-tryit"></span>
Creates new workgroup/client relationships.

Required parameters:

####client

A single client identifier or an array of identifiers of clients for which to create workgroup relationships for each specified workgroup.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to create client relationships for each specified client.

No more than 10000 workgroup client relationships may be specified in one request.

If one or more of the specified workgroup client relationships already exist, the remaining relationships (if any) will be created and no error will be returned.

Response: On success, empty results will be returned.

### workgroup.addDepartments

> Request example:

```JSON
{
   "workgroup" : "226073",
   "department" : "948"
}
```

> Response example:

```JSON
{
   "seconds" : "0.041209",
   "jsonrpc" : "2.0",
   "id" : "6",
   "result" : {}
}
```

<span class="tryit" id="workgroup-adddepartments-tryit"></span>
Creates new workgroup/department relationships.

Required parameters:

####department

A single department identifier or an array of identifiers of departments for which to create workgroup relationships for each specified workgroup.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to create department relationships for each specified department.

No more than 10000 workgroup department relationships may be specified in one request.

If one or more of the specified workgroup department relationships already exist, the remaining relationships (if any) will be created and no error will be returned.

Response: On success, empty results will be returned.

### workgroup.addLocations

> Request example:

```JSON
{
   "workgroup" : "226074",
   "location" : "29117"
}
```

> Response example:

```JSON
{
   "seconds" : "0.792919",
   "jsonrpc" : "2.0",
   "id" : "12",
   "result" : {}
}
```

<span class="tryit" id="workgroup-addlocations-tryit"></span>
Creates new workgroup/location relationships.

Required parameters:

####location

A single location identifier or an array of identifiers of locations for which to create workgroup relationships for each specified workgroup.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to create location relationships for each specified location.

No more than 10000 workgroup location relationships may be specified in one request.

If one or more of the specified workgroup location relationships already exist, the remaining relationships (if any) will be created and no error will be returned.

Response: On success, empty results will be returned.

### workgroup.addRoles

> Request example:

```JSON
{
   "workgroup" : "226077",
   "role" : "2281"
}
```

> Response example:

```JSON
{
   "seconds" : "0.067753",
   "jsonrpc" : "2.0",
   "id" : "6",
   "result" : {}
}
```

<span class="tryit" id="workgroup-addroles-tryit"></span>
Creates new workgroup/role relationships.

Required parameters:

####role

A single role identifier or an array of identifiers of roles for which to create workgroup relationships for each specified workgroup.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to create role relationships for each specified role.

No more than 10000 workgroup role relationships may be specified in one request.

If one or more of the specified workgroup role relationships already exist, the remaining relationships (if any) will be created and no error will be returned.

Response: On success, empty results will be returned.

### workgroup.create

> Request example:

```JSON
{
   "zip" : 60616,
   "name" : "Test Workgroup 48659",
   "code" : "A001"
}
```

> Response example:

```JSON
{
   "seconds" : "0.358585",
   "jsonrpc" : "2.0",
   "id" : "22",
   "result" : {
      "id" : "226094"
   }
}
```

<span class="tryit" id="workgroup-create-tryit"></span>
Creates a new workgroup record.

Parameters: Any attributes of a workgroup object (except `id`) may be specified. A unique `name` parameter must be specified. Some workgroup attributes will default from organization values or configuration settings if not specified or invalid.

Response: On success, an `id` attribute will provide the identifier for the new workgroup.

### workgroup.delete

> Request example:

```JSON
{
   "id" : "226089"
}
```

> Response example:

```JSON
{
   "seconds" : "0.052778",
   "jsonrpc" : "2.0",
   "id" : "48",
   "result" : {}
}
```

<span class="tryit" id="workgroup-delete-tryit"></span>
Deletes a workgroup record.

### workgroup.deleteClients

> Request example:

```JSON
{
   "client" : "988",
   "workgroup" : "226072"
}
```

> Response example:

```JSON
{
   "seconds" : "0.056321",
   "jsonrpc" : "2.0",
   "id" : "10",
   "result" : {}
}
```

<span class="tryit" id="workgroup-deleteclients-tryit"></span>
Required parameter: `id`.

Response: On success, empty results will be returned.

Deletes workgroup/client relationships.

Required parameters:

####client

A single client identifier or an array of identifiers of clients for which to delete workgroup relationships for each specified workgroup.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to delete client relationships for each specified client.

No more than 10000 workgroup client relationships may be specified in one request.

If one or more of the specified workgroup client relationships doesn't exist, the remaining relationships (if any) will be deleted and no error will be returned.

Response: On success, empty results will be returned.

### workgroup.deleteDepartments

> Request example:

```JSON
{
   "workgroup" : "226073",
   "department" : "948"
}
```

> Response example:

```JSON
{
   "seconds" : "0.061248",
   "jsonrpc" : "2.0",
   "id" : "8",
   "result" : {}
}
```

<span class="tryit" id="workgroup-deletedepartments-tryit"></span>
Deletes workgroup/department relationships.

Required parameters:

####department

A single department identifier or an array of identifiers of departments for which to delete workgroup relationships for each specified workgroup.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to delete department relationships for each specified department.

No more than 10000 workgroup department relationships may be specified in one request.

If one or more of the specified workgroup department relationships doesn't exist, the remaining relationships (if any) will be deleted and no error will be returned.

Response: On success, empty results will be returned.

### workgroup.deleteLocations

> Request example:

```JSON
{
   "workgroup" : "226074",
   "location" : "29117"
}
```

> Response example:

```JSON
{
   "seconds" : "0.809674",
   "jsonrpc" : "2.0",
   "id" : "8",
   "result" : {}
}
```

<span class="tryit" id="workgroup-deletelocations-tryit"></span>
Deletes workgroup/location relationships.

Required parameters:

####location

A single location identifier or an array of identifiers of locations for which to delete workgroup relationships for each specified workgroup.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to delete location relationships for each specified location.

No more than 10000 workgroup location relationships may be specified in one request.

If one or more of the specified workgroup location relationships doesn't exist, the remaining relationships (if any) will be deleted and no error will be returned.

Response: On success, empty results will be returned.

### workgroup.deleteRoles

> Request example:

```JSON
{
   "workgroup" : "226077",
   "role" : "2281"
}
```

> Response example:

```JSON
{
   "seconds" : "0.067934",
   "jsonrpc" : "2.0",
   "id" : "8",
   "result" : {}
}
```

<span class="tryit" id="workgroup-deleteroles-tryit"></span>
Deletes workgroup/role relationships.

Required parameters:

####role

A single role identifier or an array of identifiers of roles for which to delete workgroup relationships for each specified workgroup.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to delete role relationships for each specified role.

No more than 10000 workgroup role relationships may be specified in one request.

If one or more of the specified workgroup role relationships doesn't exist, the remaining relationships (if any) will be deleted and no error will be returned.

Response: On success, empty results will be returned.

### workgroup.get

<span class="tryit" id="workgroup-get-tryit"></span>
Returns information about a workgroup.

Parameters:

####id

Required. id of the workgroup for which to return information.

####extended

Boolean; if specified and false, the results returned will be a basic set of attributes; otherwise an extended set of attributes will be returned for each shift.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the workgroup attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned workgroup.

The response results `workgroup` attribute will be the selected workgroup object.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `workgroup` results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

### workgroup.list

> Request example:

```JSON
{
   "select" : {
      "workgroup" : "226093"
   },
   "extended" : true
}
```

> Response example:

```JSON
{
   "seconds" : "0.051276",
   "jsonrpc" : "2.0",
   "id" : "21",
   "result" : {
      "count" : "1",
      "page" : {
         "this" : {
            "batch" : 25,
            "start" : 1
         }
      },
      "workgroups" : [
         {
            "contact_account" : "948",
            "public_info" : "some public info",
            "state" : "California",
            "org_default" : true,
            "url" : "http://www.servola.org/",
            "address" : "1 Main St",
            "id" : "226093",
            "allowed_conflict_mins" : "90",
            "code" : "thecode",
            "location" : "29120",
            "timezone" : "Greenwich Mean Time : Dublin, Lisbon, London (GMT)",
            "public_phone" : "5555551212",
            "view_public" : true,
            "show_confirmed" : true,
            "name" : "Test Workgroup 226093",
            "description" : "some info",
            "zip" : "90210",
            "mobile_phone" : "5555551212",
            "view_public_non_org" : true,
            "auto_add" : true,
            "public_email" : "test@servola.org",
            "public_code" : "public code",
            "city" : "Beverly Hills",
            "fax" : "5555551212",
            "allow_shared" : true,
            "self_remove" : true,
            "country" : "USA",
            "office_phone" : "5555551212",
            "cancel_period" : "5",
            "member_add_shift" : false,
            "show_open" : true,
            "other_phone" : "5555551212",
            "pager" : "5555551212"
         }
      ]
   }
}
```

<span class="tryit" id="workgroup-list-tryit"></span>
Returns information about workgroups. Uses [pagination](#pagination). Uses select criteria.

Optional parameters:

####select

An object specifying selection criteria for this request. May specify selected workgroup object attributes and values to select. The following additional criteria may be specified:

####deleted

true if deleted workgroups should be returned.

####search

A generic search string; select workgroups containing this string in name or code.

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each workgroup.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the workgroups attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned workgroups.

The response results `workgroups` attribute will be an array of the current page of selected workgroups. Each element of the array will be a workgroup object containing basic or basic and extended workgroup fields.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `workgroups` results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

### workgroup.listClients

> Request example:

```JSON
{
   "select" : {
      "workgroup" : "226072"
   }
}
```

> Response example:

```JSON
{
   "seconds" : "0.040039",
   "jsonrpc" : "2.0",
   "id" : "9",
   "result" : {
      "count" : "1",
      "page" : {
         "this" : {
            "batch" : 25,
            "start" : 1
         }
      },
      "workgroup_clients" : [
         {
            "client" : "988",
            "workgroup" : "226072"
         }
      ]
   }
}
```

<span class="tryit" id="workgroup-listclients-tryit"></span>
Returns information about workgroup/client relationships. Uses [pagination](#pagination).

Optional parameters: `select` object with the following optional attributes:

####client

A single client identifier or an array of identifiers of clients for which to look up workgroup relationships. By default, all clients will be queried.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to look up client relationships. By default, all workgroups for which the API user is a manager will be queried.

The response results `workgroup_clients` attribute will be an array of the current page of workgroup client relationships. Each element of the array may have the following attributes:

####client

A client identifier.

####workgroup

A workgroup identifier.

### workgroup.listDepartments

> Request example:

```JSON
{
   "select" : {
      "workgroup" : "226085"
   }
}
```

> Response example:

```JSON
{
   "seconds" : "0.050097",
   "jsonrpc" : "2.0",
   "id" : "60",
   "result" : {
      "count" : "1",
      "page" : {
         "this" : {
            "batch" : 25,
            "start" : 1
         }
      },
      "workgroup_departments" : [
         {
            "workgroup" : "226085",
            "department" : "949"
         }
      ]
   }
}
```

<span class="tryit" id="workgroup-listdepartments-tryit"></span>
Returns information about workgroup/department relationships. Uses [pagination](#pagination).

Optional parameters: `select` object with the following optional attributes:

####department

A single department identifier or an array of identifiers of departments for which to look up workgroup relationships. By default, all departments will be queried.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to look up department relationships. By default, all workgroups for which the API user is a manager will be queried.

The response results `workgroup_departments` attribute will be an array of the current page of workgroup department relationships. Each element of the array may have the following attributes:

####department

A department identifier.

####workgroup

A workgroup identifier.

### workgroup.listLocations

> Request example:

```JSON
{
   "select" : {
      "workgroup" : "226085"
   }
}
```

> Response example:

```JSON
{
   "seconds" : "0.056378",
   "jsonrpc" : "2.0",
   "id" : "59",
   "result" : {
      "count" : "1",
      "page" : {
         "this" : {
            "batch" : 25,
            "start" : 1
         }
      },
      "workgroup_locations" : [
         {
            "workgroup" : "226085",
            "location" : "29118"
         }
      ]
   }
}
```

<span class="tryit" id="workgroup-listlocations-tryit"></span>
Returns information about workgroup/location relationships. Uses [pagination](#pagination).

Optional parameters: `select` object with the following optional attributes:

####location

A single location identifier or an array of identifiers of locations for which to look up workgroup relationships. By default, all locations will be queried.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to look up location relationships. By default, all workgroups for which the API user is a manager will be queried.

The response results `workgroup_locations` attribute will be an array of the current page of workgroup location relationships. Each element of the array may have the following attributes:

####location

A location identifier.

####workgroup

A workgroup identifier.

### workgroup.listRoles

> Request example:

```JSON
{
   "select" : {
      "workgroup" : "226085"
   }
}
```

> Response example:

```JSON
{
   "seconds" : "0.148687",
   "jsonrpc" : "2.0",
   "id" : "58",
   "result" : {
      "count" : "1",
      "workgroup_roles" : [
         {
            "workgroup" : "226085",
            "role" : "2282"
         }
      ],
      "page" : {
         "this" : {
            "batch" : 25,
            "start" : 1
         }
      }
   }
}
```

<span class="tryit" id="workgroup-listroles-tryit"></span>
Returns information about workgroup/role relationships. Uses [pagination](#pagination).

Optional parameters: `select` object with the following optional attributes:

####role

A single role identifier or an array of identifiers of roles for which to look up workgroup relationships. By default, all roles will be queried.

####workgroup

A single workgroup identifier or an array of identifiers of workgroups for which to look up role relationships. By default, all workgroups for which the API user is a manager will be queried.

The response results `workgroup_roles` attribute will be an array of the current page of workgroup role relationships. Each element of the array may have the following attributes:

####role

A role identifier.

####workgroup

A workgroup identifier.

### workgroup.update

> Request example:

```JSON
{
   "name" : "Test Workgroup 226094",
   "id" : "226094"
}
```

> Response example:

```JSON
{
   "seconds" : "0.542458",
   "jsonrpc" : "2.0",
   "id" : "23",
   "result" : {}
}
```

<span class="tryit" id="workgroup-update-tryit"></span>
Updates a workgroup record.

Required parameter: `id`. Any other workgroup object attributes may be specified.

Response: On success, empty results will be returned.
