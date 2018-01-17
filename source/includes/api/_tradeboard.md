## tradeboard object

tradeboard objects have the following basic attributes:

####id

A unique identifier for this tradeboard.

####shift

shift identifier for this trade.

####traded_by

account identifier originally assigned this shift.

####traded_to

account identifier that accepted this trade, or null if the trade is not completed.

####trade_complete

Boolean.

####status

One of:

####pending

Pending - Trade is awaiting permission to be offered

####offered

Offered - Trade is offered

####unapproved

Unapproved - Trade is awaiting approval of completion

####complete

Complete - Trade is completed

tradeboard objects have the following extended attributes:

####notes

####trade_completed

time at which this trade was completed.

### tradeboard.accept

<script>tryit('tradeboard.accept')</script> 

Takes a shift offered on the tradeboard.

Required parameter: `id`.

Response: On success, empty results will be returned.

### tradeboard.create

<script>tryit('tradeboard.create')</script> 

Creates a new tradeboard posting.

Required Parameter:

####shift

shift identifier for this trade.

Optional Parameters:

####notes

Response: On success, an `id` attribute will provide the identifier for the new tradeboard posting.

### tradeboard.delete

<script>tryit('tradeboard.delete')</script> 

Deletes a tradeboard posting.

Required parameter: `id`.

Response: On success, empty results will be returned.

### tradeboard.get

<script>tryit('tradeboard.get')</script> 

Returns information about a tradeboard posting.

Parameters:

####id

Required. id of the tradeboard posting for which to return information.

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each tradeboard posting.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the tradeboard attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned tradeboard posting.

The response results `tradeboard` attribute will be the selected tradeboard object.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `tradeboard` results or in its associated shift, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

####client

id and name attributes are provided.

####department

id and name attributes are provided.

####location

id and name attributes are provided.

####role

id and name attributes are provided.

####shift

All basic shift attributes will be provided. If the `extended` parameter is true, extended shift attributes will also be provided. Additionally, display_date and display_time attributes contain formatted strings describing the shift's start and end time.

####timezone

name and olson_timezone attributes are provided.

workStatusType

id and name attributes are provided.

####workgroup

id and name attributes are provided.

### tradeboard.list

<script>tryit('tradeboard.list')</script> 

Returns information about tradeboard postings. Uses [pagination](#pagination). Uses select criteria.

Optional parameters:

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each tradeboard posting.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the tradeboard attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned tradeboard postings.

####select

An object specifying selection criteria for this request. Note that start_date and end_date will have default values if not specified. The available criteria include:

####start_date

The earliest date of coverage to select, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format (e.g. "2009-04-01"). Defaults to today.

####end_date

The latest date of coverage to select, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format. Defaults to 14 days after the start_date.

####trade_complete

If specified, true requests only completed trades, false requests only uncompleted trades.

The response results `tradeboard` attribute will be an array of the current page of selected tradeboard postings. Each element of the array will be a tradeboard object containing basic or basic and extended tradeboard fields.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `tradeboard` results or their associated shifts, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

####shift

id and workgroup attributes are provided. Additionally, display_date and display_time attributes contain formatted strings describing the shift's start and end time.

####workgroup

id and name attributes are provided.

### tradeboard.update

<script>tryit('tradeboard.update')</script> 

Updates a tradeboard posting's notes.

Required parameter: `id`.

Optional parameter: `notes`.

Response: On success, empty results will be returned.

