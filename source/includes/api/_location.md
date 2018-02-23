## location object

location objects have the following attributes:

####id

A unique identifier for this location.

####name

The name of this location. Maximum length 96 characters.

####address

Address line (e.g. "*123 Main St*"). Maximum length 100 characters.

####address_second

Second address line. Maximum length 100 characters.

####city

City. Maximum length 100 characters.

####state

Abbreviation or full name of state/province/subdivision. Maximum length 64 characters.

####zip

Postal code. Maximum length 12 characters.

####country

Country. Maximum length 24 characters.

####contact_first_name

First name of contact person. Maximum length 100 characters.

####contact_last_name

Last name of contact person. Maximum length 100 characters.

####contact_phone

Phone number of contact person. Maximum length 100 characters.

####contact_email

Email address of contact person. Maximum length 255 characters.

####notes

####special_instructions

####latlon

Optional latitude/longitude for more precise map location, e.g. "*34.015137,-118.791438*".

### location.create

> Request example:

```JSON
{
   "workgroup" : "226092",
   "zip" : 90210,
   "name" : "Test Location 0.287588880766943"
}
```

> Response example:

```JSON
{
   "seconds" : "1.616022",
   "jsonrpc" : "2.0",
   "id" : "15",
   "result" : {
      "id" : "29120"
   }
}
```

<span class="tryit" id="location-create-tryit"></span>
Creates a new location record.

Parameters: Any attributes of a location object (except `id`) may be specified. A unique `name` parameter and either a `zip` parameter or all of `address`, `city`, and `state` must be specified. Additionally, a `workgroup` parameter must be specified to create initial workgroup relationships for this location. It may be either a single workgroup identifier or an array of identifiers of workgroups that use this location.

Response: On success, an `id` attribute will provide the identifier for the new location.

### location.delete

> Request example:

```JSON
{
   "id" : "12345"
}
```

> Response example:

```JSON
{
   "seconds" : "0.058344",
   "jsonrpc" : "2.0",
   "id" : "42",
   "result" : {}
}
```

<span class="tryit" id="location-delete-tryit"></span>
Deletes a location record.

Required parameter: `id`.

Response: On success, empty results will be returned.

### location.list

> Request example:

```JSON
{
   "select" : {
      "location" : "29117"
   }
}
```

> Response example:

```JSON
{
   "seconds" : "0.052861",
   "jsonrpc" : "2.0",
   "id" : "10",
   "result" : {
      "count" : "1",
      "locations" : [
         {
            "special_instructions" : "Livin' in Beverly Hills",
            "contact_phone" : "555-555-1212",
            "contact_last_name" : "Perry",
            "country" : "USA",
            "name" : "location 556",
            "latlon" : "",
            "contact_first_name" : "Luke",
            "state" : "California",
            "city" : "Beverly Hills",
            "zip" : "90210",
            "notes" : "That's we're we want to be",
            "contact_email" : "test@example.com",
            "address_second" : "Apt 1I",
            "address" : "1 Main St",
            "id" : "29117"
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

<span class="tryit" id="location-list-tryit"></span>
Returns information about locations. Uses [pagination](#pagination).

Optional parameters:

####select

An object specifying selection criteria for this request. Allowed criteria are:

#####location

A single location identifier or array of location identifiers.

#####search

A generic search string; select locations containing this string in their name.

#####department

Single department or array of departments to be returned.

#####workgroup

Single workgroup to filter results to be returned.

**NOTE:**  If the call is made on behalf of a manager, the caller must also specify the boolean value `exclude_site` to limit the results to only the workgroup specified.

#####show_only_workgroup_listables

Only return results for the workgroup.

#####exclude_site

Boolean; if a manager of the team, don't include departments associated with the site itself with those for the team.

#####sitewide

Boolean; query for all departments across all workgroups that the user has access to. Enabled by default for manager accounts.

The response results `locations` attribute will be an array of the current page of locations. Each element of the array may have the following attributes:

####id

A unique identifier for this location.

####name

The name of this location.

####address

Address line (e.g. "*123 Main St*").

####address_second

Second address line.

####city

####state

Full name of state/province/subdivision.

####zip

Postal code.

####country

####contact_first_name

####contact_last_name

####contact_phone

####notes

####special_instructions

####latlon

### location.update

> Request example:

```JSON
{
   "workgroup" : "226092",
   "name" : "Test Location 29120",
   "id" : "29120"
}
```

> Response example:

```JSON
{
   "seconds" : "0.942479",
   "jsonrpc" : "2.0",
   "id" : "16",
   "result" : {}
}
```

<span class="tryit" id="location-update-tryit"></span>
Updates a location object.

Required parameter: `id`. Any other location object attributes may be specified.

Response: On success, empty results will be returned.

