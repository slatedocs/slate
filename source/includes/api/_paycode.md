## paycode object

paycode objects have the following attributes:

####id

A unique identifier for this paycode.

####name

The name of this paycode. Maximum length 64 characters.

####description

A description for this paycode.

####pay_rate

Pay rate (e.g. "10.00")

### paycode.create

<script>tryit('paycode.create')</script> 

Creates a new paycode record.

Parameters: Any attributes of a paycode object (except `id`) may be specified. A unique `name` parameter must be specified.

Response: On success, an `id` attribute will provide the identifier for the new paycode.

### paycode.delete

<script>tryit('paycode.delete')</script> 

Deletes a paycode.

Required parameter: `id`.

On success, empty results will be returned.

### paycode.get

<script>tryit('paycode.get')</script> 

Returns information about a single paycode.

Required parameter: `id`.

The response results will be a paycode object.

### paycode.list

<script>tryit('paycode.list')</script> 

Returns information about paycodes. Uses [pagination](#pagination).

Optional parameters: `select` object with a `paycode` attribute identifying a single paycode or array of paycodes to be returned. E.g.`{select:{paycode:12345}}`

The response results `paycodes` attribute will be an array of paycode objects for the current page of paycodes.

### paycode.update

<script>tryit('paycode.update')</script> 

Updates a paycode object.

Required parameter: `id`. Any other paycode object attributes may be specified.

Response: On success, empty results will be returned.

