## timeOffRequest object

### timeOffRequest: basic attributes

####id

A unique identifier for this timeOffRequest.

####start_date

The date or date and time on which this timeOffRequest begins. For an all-day timeOffRequest, this is date in RFC 3339 full date format (e.g. "2009-04-01"). Otherwise, this is a datetime (e.g. "2009-04-01T13:00:00").

####end_date

The date and time on which this timeOffRequest ends, (e.g. "2009-04-01T17:00:00"). Not specified for all-day or open-ended timeOffRequests.

####timezone

####workgroup

The timeOffRequest's workgroup or null if no workgroup

####member

The account for which this is a request

####external_member

The external account identifier for which this is a request

####summary

Summary information about this request

####status

Value|Meaning
--|--
0|New
2|Approved
3|Denied

####paid

Boolean; indicates whether this time off is paid or unpaid

####category

Category for this time off request, or null if the request has no category.

### timeOffRequest: extended attributes

####details

Additional details for this request

####admin_notes

(site administrators only)

####status_reason

Reason for approval or denial of request

####last_status_update

Datetime of last status update for this request

####status_update_by

account that last updated this request's status

### timeOffRequest.approve

<span class="tryit" id="timeoffrequest-approve-tryit"></span>
Approves a time off request.

Required parameter: `id`.

Optional parameter: `status_reason`. If not specified, status_reason will remain unchanged.

Response: On success, empty results will be returned.

### timeOffRequest.create

<span class="tryit" id="timeoffrequest-create-tryit"></span>
Creates a new timeOffRequest record.

Parameters: Any attributes of a timeOffRequest object except "id",
"last_status_update", or "status_update_by" may be specified.
Minimally, "start_date" and "member/external_member" must be
specified.  "timezone" defaults to the organization's timezone.
"status" defaults to "0" (New).  "paid" defaults to false.  Start
and end dates may only fall on even five minute times.

Response: On success, an `id` attribute will provide the identifier for the new timeOffRequest.

### timeOffRequest.delete

<span class="tryit" id="timeoffrequest-delete-tryit"></span>
Deletes a timeOffRequest record.

Required parameter: `id`.

Response: On success, empty results will be returned.

### timeOffRequest.deny

<span class="tryit" id="timeoffrequest-deny-tryit"></span>
Denies a time off request.

Required parameter: `id`.

Optional parameter: `status_reason`. If not specified, status_reason will remain unchanged.

Response: On success, empty results will be returned.

### timeOffRequest.get

<span class="tryit" id="timeoffrequest-get-tryit"></span>
Returns information about a timeOffRequest.

Parameters:

####id

Required. id of the timeOffRequest for which to return information.

####extended

Boolean; if specified and false, the results returned will be a basic set of attributes; otherwise an extended set of attributes will be returned for each timeOffRequest.

####user_actions

Boolean; if specified and true, a `user_actions` object will be returned with attributes indicating what actions (e.g. delete, update) may be presented to the user.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the timeOffRequest attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned time off request.

####display_time

Boolean; if specified and true, the results returned will include a `display_time` attribute giving a string presentation of what time range the time off is requested.

The response results "timeOffRequest" attribute will be the selected timeOffRequest object.

If user_actions were requested, a `user_actions` attribute will also be returned.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the "timeOffRequest" results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

**NOTE:** external_id will also be returned in the results if external ids are enabled for the site.

id, first_name, last_name, and screen_name attributes are provided.

####timezone

name and olson_timezone attributes are provided.

####workgroup

id and name attributes are provided.

### timeOffRequest.list

<span class="tryit" id="timeoffrequest-list-tryit"></span>
Returns information about timeOffRequests. Uses [pagination](#pagination). Uses select criteria.

Optional parameters:

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each timeOffRequest.

####user_actions

Boolean; if specified and true, a `user_actions` object will be returned for each timeOffRequest with attributes indicating what actions (e.g. delete, update, approve) may be presented to the user.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the timeOffRequests attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned time off request.

####display_time

Boolean; if specified and true, the results returned will include a `display_time` attribute giving a string presentation of what time range the time off is requested.

####select

An object specifying selection criteria for this request. Note that start_date and end_date will have default values if not specified. The available criteria include:

####start_date

The earliest date of coverage to select, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format (e.g. "2009-04-01"). Defaults to today.

####end_date

The latest date of coverage to select, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format. Defaults to 7 days after the start_date.

####status

If specified, requests only timeOffRequests with the status.

####member

If specified, requests only timeOffRequests for the given account.

The response results "timeOffRequests" attribute will be an array of the current page of selected timeOffRequests. Each element of the array will be an timeOffRequest object containing basic or basic and extended timeOffRequest fields.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the "timeOffRequest" results, with only selected minimal attributes provided:

**NOTE:** If you are calling this method with the `external_member` parameter, `member` is not required.

####external_member

If specified, requests only timeOffRequests for the given account.

**NOTE:** If you are calling this method with the `member` parameter, `external_member` is not required, and will be ignored.

####account

id, first_name, last_name, and screen_name attributes are provided.

####timezone

name and olson_timezone attributes are provided.

####workgroup

id and name attributes are provided.

### timeOffRequest.update

<span class="tryit" id="timeoffrequest-update-tryit"></span>
Updates a timeOffRequest object.

Required parameter: `id`. Any timeOffRequest object attributes other than `last_status_update` and `status_update_by` may be specified.

Response: On success, if the timeOffRequest was updated, empty results will be returned.

