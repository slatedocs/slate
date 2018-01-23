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

> Request example:

```JSON
{
   "workgroup" : "226094",
   "level" : 4,
   "member" : [
      949,
      950
   ]
}
```

> Response example:

```JSON
{
   "seconds" : "0.064361",
   "jsonrpc" : "2.0",
   "id" : "34",
   "result" : {}
}
```

<span class="tryit" id="membership-create-tryit"></span>
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

> Request example:

```JSON
{
   "workgroup" : "226094",
   "member" : 950
}
```

> Response example:

```JSON
{
   "seconds" : "0.055246",
   "jsonrpc" : "2.0",
   "id" : "37",
   "result" : {}
}
```

<span class="tryit" id="membership-delete-tryit"></span>
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

> Request example:

```JSON
{
   "select" : {
      "workgroup" : [
         2,
         1171
      ]
   }
}
```

> Response example:

```JSON
{
   "seconds" : "0.035573",
   "jsonrpc" : "2.0",
   "id" : "",
   "result" : {
      "memberships" : [
         {
            "workgroup" : "2",
            "level" : "2",
            "member" : "4912"
         },
         {
            "workgroup" : "1171",
            "level" : "2",
            "member" : "4912"
         },
         {
            "workgroup" : "2",
            "level" : "2",
            "member" : "2"
         },
         {
            "workgroup" : "1171",
            "level" : "2",
            "member" : "2"
         },
         {
            "workgroup" : "2",
            "level" : "2",
            "member" : "3"
         },
         {
            "workgroup" : "1171",
            "level" : "2",
            "member" : "3"
         },
         {
            "workgroup" : "2",
            "level" : "2",
            "member" : "4"
         },
         {
            "workgroup" : "1171",
            "level" : "2",
            "member" : "4"
         },
         {
            "workgroup" : "2",
            "level" : "2",
            "member" : "5"
         },
         {
            "workgroup" : "1171",
            "level" : "2",
            "member" : "5"
         }
      ],
      "referenced_objects" : {
         "workgroup" : [
            {
               "name" : "Front Desk",
               "id" : "1171"
            },
            {
               "name" : "Ushers",
               "id" : "2"
            }
         ],
         "account" : [
            {
               "email" : "pjones@example.com",
               "external_id" : "42648",
               "id" : "4",
               "first_name" : "Paul",
               "last_name" : "Jones",
               "screen_name" : "Paul Jones"
            },
            {
               "email" : "susana@example.com",
               "external_id" : "46037",
               "id" : "3",
               "first_name" : "Susan",
               "last_name" : "Adams",
               "screen_name" : "Susan Adams"
            },
            {
               "email" : "sfs@example.com",
               "external_id" : "0",
               "id" : "4912",
               "first_name" : "Scott",
               "last_name" : "Smith",
               "screen_name" : "Scott Smith"
            },
            {
               "email" : "linda.wilson@example.com",
               "external_id" : "16917",
               "id" : "2",
               "first_name" : "Linda",
               "last_name" : "Wilson",
               "screen_name" : "Linda R Wilson"
            },
            {
               "email" : "ricky@example.com",
               "external_id" : "40089",
               "id" : "5",
               "first_name" : "Richard",
               "last_name" : "Garcia",
               "screen_name" : "Ricky Garcia"
            }
         ]
      },
      "count" : "9569",
      "page" : {
         "next" : {
            "batch" : 10,
            "start" : 11
         },
         "this" : {
            "batch" : 10,
            "start" : 1
         }
      }
   }
}
```

<span class="tryit" id="membership-list-tryit"></span>
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

> Request example:

```JSON
{
   "workgroup" : 132994,
   "level" : 4,
   "member" : 946
}
```

> Response example:

```JSON
{
   "seconds" : "0.068018",
   "jsonrpc" : "2.0",
   "id" : "3",
   "result" : {}
}
```

<span class="tryit" id="membership-update-tryit"></span>
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

