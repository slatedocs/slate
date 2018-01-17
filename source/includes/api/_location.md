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

<script>tryit('location.create')</script> 

Creates a new location record.

Parameters: Any attributes of a location object (except `id`) may be specified. A unique `name` parameter and either a `zip` parameter or all of `address`, `city`, and `state` must be specified. Additionally, a `workgroup` parameter must be specified to create initial workgroup relationships for this location. It may be either a single workgroup identifier or an array of identifiers of workgroups that use this location.

Response: On success, an `id` attribute will provide the identifier for the new location.

### location.delete

<script>tryit('location.delete')</script> 

Deletes a location record.

Required parameter: `id`.

Response: On success, empty results will be returned.

### location.list

<script>tryit('location.list')</script> 

Returns information about locations. Uses [pagination](#pagination).

Optional parameters: `select` object with a `location` attribute identifying a single location or an array of locations to be returned. E.g.`{select:{location:12345}}`

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

<script>tryit('location.update')</script> 

Updates a location object.

Required parameter: `id`. Any other location object attributes may be specified.

Response: On success, empty results will be returned.

