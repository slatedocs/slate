## timeclock object

### Basic Attributes

####id

A unique identifier for this timeclock object

####workgroup

A workgroup identifier or null if not clocked in

####account

Account identifier

####external_account

External account identifier

####clocked_in

Time that the user clocked in

####clocked_out

Time that the user clocked out or null if not clocked out

####shift

shift identifier or null if there is no shift associated with this timeclock object

### Extended Attributes

####clocked_in_local

Time that the user clocked in, in the organization's timezone

####clocked_out_local

Time that the user clocked out, in the organization's timezone, or null if not clocked out

####timezone

The organization's timezone

####clockin_notes

(if specified)

####clockout_notes

(if specified)

####clockin_ipaddr

(if specified)

####clockout_ipaddr

(if specified)

####clockin_phone

(if specified)

####clockout_phone

(if specified)

####clockin_location

####clockout_location

Location of clockin/clockout, if known. An object with the following attributes:

####latitude

####longitude

####time

####accuracy

meters of 68% confidence of latitude/longitude

####clockin_device_id

(if specified)

####clockout_device_id

(if specified)

### timeclock.clockIn

<script>tryit('timeclock.clockIn')</script>

> Request example:

```JSON
 {}
```

> Response example:

```JSON
{
     seconds: "2.903725", 
     jsonrpc: "2.0", 
     id: "37", 
     result: {
         id: 62064
     }
}
```

Clocks in a given account.

Parameters:

####account

optional, defaults to current user

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

####external_account

optional, defaults to current user

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

####workgroup

optional, defaults to clocking in to the organization

####shift

the shift to associate with this clock in; optional or required depending on organization settings

####clocked_in

optional, the time to record the user as having clocked in

####phone

optional, phone number used to clock in (for IVR systems)

####latitude

optional, latitude of clock in

####longitude

optional, longitude of clock in

####location_accuracy

optional, meters of 68% confidence of latitude/longitude

####location_time

optional, time of latitude/longitude/accuracy fix. 

**note:** location_time must be defined when including *latitude*, *longitude*, and/or *location_accuracy*, otherwise these parameters will be ignored.

####device_id

optional, arbitrary string identifying timeclock device

####ip_address

IP address that originated this clock in (defaults to address issuing this api request)

####notes

optional, arbitrary text

Response: On success, returns `id` of the newly created timeclock object.

### timeclock.clockOut

<script>tryit('timeclock.clockOut')</script> 

> Request example:

```JSON
 {}
```

> Response example:

```JSON
 {
     seconds: "2.944529", 
     jsonrpc: "2.0", 
     id: "43", 
     result: {
         timecard: 111673
     }
}
```

Clocks out a given account and creates a timecard for the clock in.

Parameters:

####account

optional, defaults to current user

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

####external_account

optional, defaults to current user

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

####workgroup

optional, defaults to the organization; must match the workgroup to which the account is clocked in

####approve

boolean, default false; indicates whether the timecard object created for this clock in should be approved

####clocked_out

optional, the time to record the user as having clocked out

####latitude

optional, latitude of clock in

####longitude

optional, longitude of clock in

####location_accuracy

optional, meters of 68% confidence of latitude/longitude

####location_time

optional, time of latitude/longitude/accuracy fix.

**note:** location_time must be defined when including *latitude*, *longitude*, and/or *location_accuracy*, otherwise these parameters will be ignored.

####device_id

optional, arbitrary string identifying timeclock device

####ip_address

IP address that originated this clock out (defaults to address issuing this api request)

####notes

optional, arbitrary text

Response: On success, returns `timecard`, the id of the newly created timecard object.

### timeclock.get

<script>tryit('timeclock.get')</script>

Returns information about a timeclock object.

Parameters:

####id

Required. id of the timeclock object for which to return information.

####extended

Boolean; if specified and false, the results returned will be a basic set of attributes; otherwise an extended set of attributes will be returned for each timeclock.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the timeclock attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned timeclock.

The response results `timeclock` attribute will be the selected timeclock object.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `timeclocks` results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

**NOTE:** external_id will also be returned in the results if external ids are enabled for the site

####timezone

name and olson_timezone attributes are provided.

####workgroup

id and name attributes are provided.

### timeclock.list

<script>tryit('timeclock.list')</script> 

Returns information about timeclock objects. Uses [pagination](#pagination). Uses select criteria.

Optional parameters:

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each timeclock object.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the timeclocks attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned timeclock objects.

####select

An object specifying selection criteria for this request. Note that start_date and end_date will have default values if not specified. The available criteria include:

####start_date

Earliest clock in date to select

####end_date

Latest clock in date to select

####clocked_out

Boolean; true to include only already clocked out timeclock records, false to include only not yet clocked out timeclock records. Omit to include all records.

####workgroup

Single workgroup identifier or array of workgroup identifiers to report

####account

Single account identifier or array of account identifiers to report

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

####external_account

Single external account identifier or array of external account identifiers to report

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

The response results `timeclocks` attribute will be an array of the current page of selected timeclock objects. Each element of the array will be an timeclock object containing basic or basic and extended timeclock fields.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `timeclocks` results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

####timezone

name and olson_timezone attributes are provided.

####workgroup

id and name attributes are provided.

### timeclock.report

<script>tryit('timeclock.report')</script> 

> Request example:

```JSON

 {
     select: {
         start_date: "2012-10-01"
     }, 
     report_type: total_hour, 
     format: xls
}
```

> Response example:

```JSON

 {
     seconds: "2.811506", 
     jsonrpc: "2.0", 
     id: "21", 
     result: {
         url: "https://www.shiftboard.com/servola/fetch.cgi?ss=14;type=report;key=5085a260feff2760;signature=kRMtQqcLl0SULDYifhdg3OH4uIU;format=excel"
     }
}
```

Generates a pre-authorized link to download a timeclock report.

Parameters:

####report_type

Required. One of: `basic`, `extended`, `total_hour`

####format

One of: `csv` (default), `xls`

####select

Selection criteria (optional):

####start_date

Earliest clock in date to report (or, for total_hour report, earliest date during which someone was clocked in)

####end_date

Latest clock in date to report (or, for total_hour report, latest date during which someone was clocked in)

####clocked_out

Boolean; true to include only already clocked out timeclock records, false to include only not yet clocked out timeclock records. Omit to include all records.

####workgroup

Single workgroup identifier or array of workgroup identifiers to report

####account

Single account identifier or array of account identifiers to report

**NOTE:** If you are calling this method with the account parameter,
external_account is not required, and will be ignored.

####external_account

Single external account identifier or array of external account
identifiers to report

**NOTE:** If you are calling this method with the account parameter,
external_account is not required, and will be ignored.

Response: A `url` attribute giving a link that may be used one time
only, within 5 minutes of the API request, to generate the requested
report.

### timeclock.status

<script>tryit('timeclock.status')</script> 

> Request example:

```JSON
 {}
```

> Response example:

```JSON
 {
     seconds: "2.811506", 
     jsonrpc: "2.0", 
     id: "21", 
     result: {
         shift: null, 
         account: "4826", 
         clocked_out: null, 
         workgroup: null, 
         clocked_in: null
     }
 }
```

Reports clocked in/out status of an account.

Parameters: "account" (optional, defaults to current user) or "external_account" (optional, defaults to current user; can only be used if external ids are enabled for the site)

Response: On success, returns basic timeclock attributes. If the account is clocked in, they will reflect that timeclock object; otherwise, timeclock attributes other than `account` will be null.

If not clocked in and shifts can be associated to timeclock entries, an additional boolean `shift_required` attribute will be present and indicate whether an associated shift is required and a `shifts_available` attribute will provide an array of possible shifts to associate (with those shifts most likely to be intended first), each element of the array providing the following attributes:

####category

A string with the value `current`, `next`, or `previous`, indicating whether the shift is scheduled for now, in the future, or in the past.

####shift

The shift identifier to specify when clocking in.

####workgroup

The workgroup identifier to specify when clocking in.

####description

A string describing when and for what team the shift is scheduled.

The `shifts_available` array entries will be sorted as follows:

* First sort by category: `current`, followed by `next`, then `previous`

* If `current`, sort by "most recently started," then "longest shift"

* If `next`, sort by "next to start," then "longest shift"

* If `previous`, sort by "most recently ended," then "longest shift"

The response will provide an additional `org_level` attribute, indicating the account's [level](#level) in the organization (2, 3, or 4), as well as `screen_name`, `first_name`, and `last_name` account attributes.

