## client object

client objects have the following attributes:

####id

A unique identifier for this client.

####name

The name of this client. Maximum length 128 characters.

####business_name

Business name. Maximum length 100 characters.

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

Notes

####special_instructions

### client.create

<script>tryit('client.create')</script> 

Creates a new client record.

Parameters: Any attributes of a client object (except `id`) may be specified. A unique `name` parameter must be specified. Additionally, a `workgroup` parameter must be specified to create initial workgroup relationships for this client. It may be either a single workgroup identifier or an array of identifiers of workgroups that use this client.

Response: On success, an `id` attribute will provide the identifier for the new client.

### client.delete

<script>tryit('client.delete')</script> 

Deletes a client.

Required parameter: `id`.

On success, empty results will be returned.

### client.get

<script>tryit('client.get')</script> 

Returns information about a single client.

Required parameter: `id`

The response results will be a client object.

### client.list

<script>tryit('client.list')</script> 

Returns information about clients. Uses [pagination](#pagination).

Optional parameters: `select` object with a `client` attribute identifying a single client or array of clients to be returned. E.g. `{select:{client:12345}}.`

The response results `clients` attribute will be an array of the current page of clients. Each element of the array may have the following attributes:

####id

A unique identifier for this client.

####name

The name of this client.

### client.update

<script>tryit('client.update')</script> 

Updates a client object.

Required parameter: `id`. Any other client object attributes may be specified.

Response: On success, empty results will be returned.

