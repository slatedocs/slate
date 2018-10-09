## shift object

### shift: basic attributes

####id

A unique identifier for this shift.

####count

The number of positions represented by this shift record.

####qty

The total number of positions represented by this and associated records.

####start_date

The date or date and time on which this shift begins. For an all-day shift, this is date in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format (e.g. "2009-04-01"). Otherwise, this is a datetime (e.g. "2009-04-01T13:00:00").

####end_date

The date and time on which this shift ends, (e.g. "2009-04-01T17:00:00"). Not specified for all-day or open-ended shifts.

`dur_hrs` Integer; shift duration in hours. Required when creating a shift with a `use_time` value of 2. Likewise this value will only be returned when querying for shifts whose `use_time` value is equal to 2.

`dur_mins` Integer; shift duration in minutes. Required when creating a shift with a `use_time` value of 2. Likewise this value will only be returned when querying for shifts whose `use_time` value is equal to 2.
####timezone

The timezone for which the shift is scheduled.

####workgroup

The shift's workgroup.

####subject

The shift's subject. Maximum length 100 characters.

####location

The location id for the shift, if specified.

####role

The role id for the shift, if specified.

####client

The client id for the shift, if specified.

####department

The department id for the shift, if specified.

####covered

true if the shift is covered.

####published

true if the shift is published.

####tentative

true if the shift is tentatively covered.

####urgent

true if the shift is critical to have covered.

####covering_member

If the shift is covered by a member, the id of the member's account.

####external_covering_member

If the shift is covered by a member, the external id of the member's account.

####covering_workgroup

If the shift is covered by a workgroup, the workgroup id (currently, never different from the shift's workgroup)

`use_time` Integer; shift type identifier. Valid `use_time` values are in the range of 1-5.
1: shift/coverage block
2: start time/duration
3: start/end time
4: open ended/tbd
5: anytime

`time_block` Integer; time block identifier. Required when creating a shift with a `use_time` value of 1. Likewise this value will only be returned when querying for shifts whose `use_time` value is equal to 1.

### shift: extended attributes

####details

Additional details about the shift.

####no_pick_up

Boolean

####signup_list

Boolean

####no_trade

Boolean

####reference_id

####work_status_type

The workStatusType id for the shift, if specified.

####linktitle

####linkurl

####room_floor

####zipcode

####pay_rate

####base_rate

####no_credit

####extra_credit

####custom_text_1

####custom_text_2

####custom_text_3

####custom_multipick

Array of custom_multipick identifiers for the shift

####acknowledged

Boolean; shift has been acknowledged or declined.

####acknowledged_at

Date/time of acknowledgement or most recent modification to the acknowledgement.

####acknowledge_decline_reason

Decline reason identifier; present only if declined.

####acknowledged_notes

####resource

Array of resource identifiers for this shift

####custom_dropdown_1

####custom_dropdown_2

####custom_dropdown_3

####custom_textarea

####created

UTC time shift was created

####status_updated

UTC time shift was published, unpublished, assigned, confirmed, or unconfirmed

####updated

UTC time shift was otherwise updated

####breaks

Array of breaks for the shift; each break has the following attributes:

####name

####start_time

The time in which a shift break starts, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format (e.g. "2009-04-01").

####display_time

####duration_minutes

####paid

Boolean.

Not all fields will be configured to be used for all organizations or set for all shifts.

### shift.acknowledge

> Request example:

```JSON
{
   "id" : 2753501
}
```

> Response example:

```JSON
{
   "seconds" : "0.280633",
   "jsonrpc" : "2.0",
   "id" : "3",
   "result" : {
      "message" : "You have acknowledged this position:\n\nWednesday, May 20, 2015, 9:55am to 11:55am\nFront Desk"
   }
}
```

<span class="tryit" id="shift-acknowledge-tryit"></span>
Acknowledges a shift.

Required parameter: `id`.

Optional parameters:

####acknowledge_decline_reason

acknowledge decline reason identifier, if the acknowledgement is to decline.

####acknowledged_notes

Response: On success, a `message` attribute will provide a brief notification message.

### shift.confirm

> Request example:

```JSON
{
   "id" : 2753501
}
```

> Response example:

```JSON
{
   "seconds" : "0.443989",
   "jsonrpc" : "2.0",
   "id" : "2",
   "result" : {
      "message" : "You have accepted this position:\n\nWednesday, May 20, 2015, 9:55am to 11:55am\nFront Desk"
   }
}
```

<span class="tryit" id="shift-confirm-tryit"></span>
Confirms a shift.

#### Required parameter

`id`: ID of the shift to be assigned.

#### Optional parameters

`covering_member` or `external_covering_member`: Assign the specified user to the shift (rather than assigning the current user). Only available to workgroup managers.

#### Assignability parameters

To use assignability checks, the `assignability_checks` parameter must be `true`; then, the following options may be available, based on enabled features:

`conflicts_ok` - boolean

`daily_overtime_ok` - boolean

`weekly_overtime_ok` - boolean

`timeoff_ok` - boolean

`consecutive_days` - boolean

`short_turnaround` - boolean

`ignore_attestation_types` - boolean

`attestation_type` - array of attestationTypeId

#### Response

On success, a `message` attribute will provide a brief notification message. If the shift had a count > 1, a new shift object will have been created and the id of the new shift will also be returned.

### shift.create

> Request example:

```JSON
{
   "workgroup" : "226085",
   "department" : "949",
   "location" : "29118",
   "start_date" : "2010-09-17T12:00:00",
   "role" : "2282"
}
```

> Response example:

```JSON
{
   "seconds" : "1.007354",
   "jsonrpc" : "2.0",
   "id" : "57",
   "result" : {
      "id" : 2753502
   }
}
```

<span class="tryit" id="shift-create-tryit"></span>
Creates a new shift record.

#### Parameters

Most attributes of a shift object except `id` may be specified. Minimally, `workgroup` and `start_date` parameters must be specified. `timezone` will default to the organization's timezone. `location` will default to the workgroup's default location, if set. `external_covering_member`/`covering_member` and `covering_workgroup` are mutually exclusive, and may only be specified if the shift is covered. `tentative` may only true if the shift is covered, and `covered` may only be true if the shift is published. Start and end dates may only fall on even five minute times. Either `count` or `qty` may be specified and both will be set for the new shift, defaulting to 1; if both are specified, they must be equal. `count` must be 1 for a covered shift.

#### Optional parameters

`notify_on_create`
Boolean; send a notification message to the covering member for this shift.

`notify_message`
Additional text to include in notification message.

#### Repeating shift parameters

It is possible to use this method to create a series of repeating (repeating) shifts. In order to do so, some additional parameters are required:

##### repeating_shift

Boolean; specifies the caller is creating a series of repeating shifts.

##### repeating_shift_type

Type of repeating shift.

Type|Meaning
--|--
frequency|Frequency
days_of_week|Days of Week

##### repeating_shift_end_date

The date of the final shift in the repeating series in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format (e.g. "2018-01-01").

##### repeating_shift_interval

Specifies the interval in which the series will be created. Valid interval options are below:

Interval|Meaning
--|--
every|Every
every_other|Every Other
every_third|Every Third
every_fourth|Every Fourth
every_fifth|Every Fifth
every_sixth|Every Sixth

**NOTE:** `every_fifth` and `every_sixth` are only available when creating daily shifts.

##### repeating_shift_frequency

Specifies the frequency for a frequency based repeating series. Valid frequency options are below:

Frequency|
--|--
day|
week|
month|
year|

**NOTE:** Parameter is required when `repeating_shift_type` is `frequency`

##### repeating_shift_days_of_week

Array. Specifies which days of the week to create shifts for in a repeating series. Valid options are below:

Day|Meaning
--|--
0|Sunday
1|Monday
2|Tuesday
3|Wednesday
4|Thursday
5|Friday
6|Saturday

**NOTE:** Parameter is required when `repeating_shift_type` is `days_of_week`

##### additional_dates

Array. Additional shift dates to be created alongside the specified repeating series. Dates must be in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format (e.g. "2018-01-01")

#### Assignability parameters

To use assignability checks, the `assignability_checks` parameter must be `true`; then, the following options may be available, based on enabled features:

`conflicts_ok` - boolean

`daily_overtime_ok` - boolean

`weekly_overtime_ok` - boolean

`timeoff_ok` - boolean

`consecutive_days` - boolean

`short_turnaround` - boolean

`ignore_attestation_types` - boolean

`attestation_type` - array of attestationTypeId


#### Response

On success, an `id` attribute will provide the identifier for the new shift. When creating a series of repeating shifts, the `id` returned will be the first shift in the series.

### shift.delete

> Request example:

```JSON
{
   "id" : "2753500"
}
```

> Response example:

```JSON
{
   "seconds" : "0.058344",
   "jsonrpc" : "2.0",
   "id" : "67",
   "result" : {}
}
```

<span class="tryit" id="shift-delete-tryit"></span>
Deletes a shift record.

Required parameter: `id`.

Optional Parameters:

notify_on_delete
Boolean; notify covering member upon deletion of the shift.

notify_message
Custom text to be included when notifying shift owner upon deletion of shift.

Response: On success, empty results will be returned.

### shift.deleteSignup

<span class="tryit" id="shift-deletesignup-tryit"></span>
Deletes a member from a shift's signup list.

Parameters:

####id

Required. id of the shift for which to remove a sign up.

####member

Required. id of the account to remove from the sign up list (defaults to the current user). May be a single id or an array of ids.

**NOTE:** If you are calling this method with the member parameter, external_member will be ignored (if included).

####external_member

Required. external id of the account to remove from the sign up list (defaults to the current user). May be a single id or an array of ids.

**NOTE:** If you are calling this method with the external_member parameter, member will be ignored (if included).

Response: On success, empty results will be returned.

### shift.get

> Request example:

```JSON
{
   "id" : 2753499
}
```

> Response example:

```JSON
{
   "seconds" : "0.062897",
   "jsonrpc" : "2.0",
   "id" : "25",
   "result" : {
      "shift" : {
         "reference_id" : "",
         "linkurl" : "",
         "work_status_type" : "0",
         "signup_list" : false,
         "id" : "2753499",
         "start_date" : "2010-09-17T12:00:00",
         "count" : "1",
         "timezone" : "Pacific Time (US/Can) (GMT-08:00)",
         "subject" : "",
         "urgent" : false,
         "zipcode" : "60616",
         "details" : "",
         "qty" : "1",
         "workgroup" : "226081",
         "published" : false,
         "covered" : false,
         "no_pick_up" : false,
         "room_floor" : "",
         "linktitle" : ""
      }
   }
}
```

<span class="tryit" id="shift-get-tryit"></span>
Returns information about a coverage shift.

Parameters:

####id

Required. id of the shift for which to return information.

####extended

Boolean; if not specified or true or user_actions is true, the results returned will be an extended set of attributes; otherwise a basic set of attributes will be returned for each shift.

####user_actions

Boolean; if specified and true, a `user_actions` object will be returned with attributes indicating what actions (e.g. cover, uncover, assign, delete, acknowledge) may be presented to the user.

####display_time

Boolean; if specified and true, the returned shift will include a `display_time` attribute giving a string presentation of when the shift is scheduled.

####denormalize

denormalize is deprecated; where possible, the results `referenced_objects` attribute should be used instead.

Boolean; if specified and true, all identifiers (except the shift `id` itself) in the returned shift object will be replaced with corresponding names, etc. suitable for display, and the following attributes may be added:

####location_details

An object providing one or more of the following attributes, when available: `zipcode`, `address`, `city`, `state`, `country`, `latitude`, `longitude`.

####display_date

The start date of the shift, formatted for display (including weekday name).

####display_time

The time range of the shift, formatted for display.

####referenced_objects

Boolean, defaults to true unless denormalize is true. Indicates that, in addition to the shift attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned shift.

The response results `shift` attribute will be the selected shift object.

If user_actions were requested, a `user_actions` attribute will also be returned.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `shift` results, with only selected minimal attributes provided:

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

####timezone

name and olson_timezone attributes are provided.

workStatusType

id and name attributes are provided.

####workgroup

id and name attributes are provided.

acknowledgeDeclineReason

id and label attributes are provided.

####image
Boolean; if specified and true, the results returned will include an image_url attribute giving a url to the shift's covering_member's user image or null if no image is available.

####custom_multipick

id and name attributes are provided.

####custom_dropdown_1

id and name attributes are provided.

####custom_dropdown_2

id and name attributes are provided.

####custom_dropdown_3

id and name attributes are provided.

####resource

id, name, and label attributes are provided.

### shift.getAssignmentList

> Request example:

```JSON
{
   "workgroup" : 12345,
   "shift" : {
      "id" : 123456789
   }
}
```

> Response example:

```JSON
{
   "seconds" : "0.058344",
   "jsonrpc" : "2.0",
   "id" : "67",
   "result" : {
      "unassignable" : {
         "5" : "John Smith - Has Conflicts (My Team)"
      },
      "assignable" : {
         "1" : "Bob Doe",
         "2" : "Jane Doe"
      },
      "assignable_order" : [ "2", "1" ],
      "unassignable_order" : [ "5" ]
   }
}
```

<span class="tryit" id="shift-getassignmentlist-tryit"></span>
Returns availability information as to who is and is not assignable to a shift. The shift in this case could be one that currently exists, or a shift to be created later.

Required parameters:

####workgroup

The id for the workgroup.

Optional parameters:

####shift

Object. The shift object allows for the following optional parameters:

Field | Description
----- | -----------
id |
start_date |
start_time |
end_date |
end_time |
timezone | Timezone defaults to the site's timezone if one is not provided in the request.
role | Role is required for role restriction.
unpaid_mins | Required for overtime checking.
location | Location id of shift (venue).
reference_id | If specified, requests only shifts with the given reference IDs (case insensitive) (either a single reference ID or an array of reference IDs).
covering_member | If specified, requests only shifts covered by the workgroup member.
external_covering_member | If the shift is covered by a member, the external id of the member's account.

####limit

Maximum number of results to return; default site dropdown list limit.

####use_time

Needed if open ended or all day should do overtime/conflict/availability/timeoff checking.

####include_holds

Boolean; default false (members on hold not included).

####conflicts_ok

Boolean; default false (conflicts checked, if date/times specified).

####daily_overtime_ok

Boolean; default false (conflicts checked, if date/times specified).

####weekly_overtime_ok

Boolean; default false (conflicts checked, if date/times specified).

####is_available

Boolean; default false (availability not checked).

####timeoff_ok

Boolean; default true (timeoff not checked).

####seniority_required

Boolean; default false, ignored unless sorting by_seniority.

####single_shift_per_day

Boolean; default false.

####is_autoassignable

Boolean; default false.

####standby

Boolean; default false, standby signups only

####role_restriction

Boolean; default false; apply role restrictions, if there is a role and the team uses restrictions.

####min_level

Default 1, maximum level to exclude (e.g. 3 to exclude non-manager, 2 to exclude members).

####max_level

Maximum level to include (e.g. 2 to exclude coordinators/managers).

####phrase

Match in first name, last name, fullname

####coverage_signup_list_eid

Exclude members already signed up for this eid (start_date must also be specified).

####accounts

Array ref of accounts to limit results to.

####exclude_accounts

Array ref of accounts to exclude from results to.

####profile_type

Only members with this profile type.

####extended_filter
> Request example with extended_filter specified:

```JSON
{
   "workgroup" : 12345,
   "shift" : {
      "id" : 123456789
   },
   "profile_type": 1,
   "extended_filter": { "emergency_contact": "Joe Blow" }
}
```

Specification to filter on profile options (profile_type must be specified). A complete list of valid options can be found
by calling the [profileConfiguration.list](#profileconfiguration-list) method. The relevant fields are `profile_type` and `form_name`.

####range

Range of accounts in miles from venue zipcode.

####min_score

Minimum score.

####no_score

Include members with no score (min_score must be specified).

####by_seniority

Order by those with seniority by seniority date or rank, then with seniority and no date/rank, then no seniority (random within those).
The order can be found in the `assignable_order` and `unassignable_order` arrays in the response.

####randomize

Return results in random order.

####mandatory_days_off

Mandatory days off settings (hash).

####tier

The user's tier.

####tier_ge

The user's minimum tier.

####lang

The user's language (or if user has not set one, the site's default).

####consecutive_days

Allow shifts on N consecutive days if beta feature is enabled (boolean).

####short_turnaround

Allow shifts that have a short (N hours) turnaround if beta feature is enabled (boolean).

####ignore_attestation_types

Array of [`attestationType`](#attestationtype-object) IDs to ignore.

### shift.getOfferedTrade

> Request example:

```JSON
{
   "id" : "56789012",
   "extended" : true
}
```

> Response example:

```JSON
{
   "seconds" : "0.128193",
   "jsonrpc" : "2.0",
   "id" : "15",
   "result" : {
      "referenced_objects" : {
         "workgroup" : [
            {
               "name" : "Help Desk",
               "id" : "412345"
            }
         ],
         "department" : [
            {
               "name" : "Distribution",
               "label" : "Distribution",
               "id" : "9942"
            }
         ],
         "timezone" : [
            {
               "name" : "Pacific Time (US/Can) (GMT-08:00)",
               "olson_timezone" : "America/Los_Angeles"
            }
         ],
         "location" : [
            {
               "name" : "Training / Meetings",
               "id" : "92580"
            }
         ],
         "shift" : [
            {
               "display_time" : "1pm to 2pm",
               "department" : "9942",
               "reference_id" : "",
               "linkurl" : "",
               "work_status_type" : "5",
               "start_date" : "2014-01-29T13:00:00",
               "signup_list" : false,
               "id" : "56789012",
               "count" : "1",
               "timezone" : "Pacific Time (US/Can) (GMT-08:00)",
               "display_date" : "January 29, 2014",
               "location" : "92580",
               "subject" : "",
               "covering_member" : "47",
               "urgent" : false,
               "zipcode" : "94132",
               "qty" : "1",
               "details" : "details!",
               "workgroup" : "412345",
               "published" : true,
               "no_credit" : false,
               "end_date" : "2014-01-29T14:00:00",
               "covered" : true,
               "no_pick_up" : false,
               "no_trade" : false,
               "room_floor" : "room/floor",
               "linktitle" : ""
            }
         ],
         "account" : [
            {
               "id" : "39",
               "screen_name" : null,
               "last_name" : "Foster",
               "first_name" : "Joanie"
            },
            {
               "seniority_order" : "19999-12-31 23:59:59",
               "id" : "47",
               "profile_type" : "3",
               "screen_name" : "Stan Wilson",
               "last_name" : "Wilson",
               "first_name" : "Stan"
            }
         ],
         "workStatusType" : [
            {
               "name" : "Salary/Exempt",
               "id" : "5"
            }
         ]
      },
      "tradeboard" : {
         "trade_completed" : "2014-01-21T20:40:38Z",
         "shift" : "56789012",
         "notes" : "Need to see the dentist; please take this trade",
         "id" : "12345",
         "traded_to" : "47",
         "traded_by" : "39",
         "trade_complete" : true
      }
   }
}
```

<span class="tryit" id="shift-getofferedtrade-tryit"></span>
Returns information about a tradeboard posting for a coverage shift.

Parameters:

####id

Required. id of the shift for which to return information.

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each tradeboard posting.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the tradeboard attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned tradeboard posting.

The response results `tradeboard` attribute will be the selected tradeboard object.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `tradeboard` results or in its associated shift, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

**NOTE:** external_id will also be returned in the results if external ids are enabled for the site.

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

### shift.list

> Request example:

```JSON
{
   "select" : {
      "workgroup" : "226084"
   }
}
```

> Response example:

```JSON
{
   "seconds" : "0.081433",
   "jsonrpc" : "2.0",
   "id" : "44",
   "result" : {
      "shifts" : [
         {
            "count" : "1",
            "timezone" : "Greenwich Mean Time : Dublin, Lisbon, London (GMT)",
            "subject" : "updated",
            "qty" : "1",
            "workgroup" : "226084",
            "covering_workgroup" : "226084",
            "published" : true,
            "covered" : true,
            "end_date" : "2010-09-17T14:30:00",
            "id" : "2753501",
            "start_date" : "2010-09-17T14:00:00"
         }
      ],
      "count" : "1",
      "page" : {
         "this" : {
            "batch" : 25,
            "start" : 1
         }
      }
   }
}
```

<span class="tryit" id="shift-list-tryit"></span>
Returns information about coverage shifts. Uses [pagination](#pagination). Uses select criteria.

Optional parameters:

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each shift.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the shifts attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned shifts.

####display_time

Boolean; if specified and true, the results returned will include a `display_time` attribute giving a string presentation of when the shift is scheduled.

####aggregation_mode

If specified, aggregated results are returned. Options are:

####similar

Shifts with the same start_date, end_date, timezone, workgroup, covering_workgroup/covering_member, tentative, covered, published, location, role, and urgent attributes are aggregated.

####similar_subject

Shifts with the same start_date, end_date, timezone, subject, covering_workgroup/covering_member, tentative, covered, published, location, role, and urgent attributes are aggregated.

####date

Shifts with the same start_date, workgroup, covered, published, tentative, and urgent attributes are aggregated.

####date_subject

Shifts with the same start_date, subject, covered, published, tentative, and urgent attributes are aggregated.

Each result element will have an aggregate_count attribute indicating how many elements were aggregated. count and qty will be summed for the aggregated elements; other fields that are not aggregated over will be omitted from results that aggregate more than one element.

####image

Boolean; if specified and true, the results returned will include an image_url attribute giving a url to the shift's covering_member's user image or null if no image is available.

####image_expiration

Specifies the valid lifetime of the returned URL in seconds; default 300, maximum 604800 (1 week).

####timeclock_status

Boolean; if specified and true, the results returned will include a clocked_in attribute indicating that the shift's covering_member is currently clocked in (though not necessarily for this shift) and a can_clock_in_out attribute indicating whether there is authorization to clock that covering member in or out.

####no_location

Boolean; if specified and true, the results returned will include shifts that do not have an assigned location (in addition to the locations specified in select), false excludes shifts without locations.

####select

> Select shifts which start between January 1st, 2018 and January 7th, 2018 (inclusive), are
published, and have not been filled.

```JSON

 {
     select: {
         start_date: "2018-01-01",
         end_date: "2018-01-07",
         published: true,
         covered: false
     }
}
```

An object specifying selection criteria for this request. Note that start_date and end_date will have default values if not specified. The available criteria include:

####start_date

The earliest date of coverage to select, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format (e.g. "2009-04-01"). Defaults to today.

####end_date

The latest date of coverage to select, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format. Defaults to 7 days after the start_date.

####display_start_date

The earliest date of coverage to select, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format (e.g. "2009-04-01"). This should be used instead of start_date when selecting shifts that include workers across multiple timezones.

####display_end_date

The latest date of coverage to select, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format. This should be used instead of end_date when selecting shifts that include workers across multiple timezones.

####published

If specified, true requests only published shifts, false requests only unpublished shifts.

####covered

If specified, true requests only covered shifts, false requests only uncovered shifts.

####urgent

If specified, true requests only urgent shifts, false requests only non-urgent shifts.

####no_pick_up

If specified, true requests only "No Pick-Up" shifts, false requests only non-"No Pick-Up" shifts.

####signup_list

If specified, true requests only Signup List shifts, false requests only non-Signup List shifts.

####location

If specified, requests only shifts with the given locations (either a single location id or an array of ids). Use 0 for shifts with no location.

####role

If specified, requests only shifts with the given roles (either a single role id or an array of ids). Use 0 for shifts with no role.

####client

If specified, and the site is configured to use client for schedule items, requests only shifts with the given roles (either a single client id or an array of ids). Use 0 for shifts with no client.

####department

If specified, and the site is configured to use department for schedule items, requests only shifts with the given departments (either a single department id or an array of ids). Use 0 for shifts with no department.

####start_time

If specified, requests only shifts with the given starting times (either a single time or an array of times), in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) partial time format (e.g. "13:00:00").

####workgroup

If specified, requests only shifts for the given workgroups. May be a single workgroup or an array of workgroups.

####scope

If specified, a value of 'my_calendar' requests shifts normally shown to a user on the calendar, that is, shifts for workgroups for which the user is a coordinator or manager, shifts covered by the user, or approved, open shifts for workgroups for which the user is a member. A value of 'siteadmin' requests all shifts for the entire site and is only allowed for site administrators. A value of 'managed_workgroups' requests shifts for the workgroups managed by the user and is only allowed for workgroup managers. A value of 'report' is like 'siteadmin' for site administrators and like 'managed_workgroups' for others. 'siteadmin' is the default for site administrators while 'my_calendar' is the default for all others.

####reference_id

If specified, requests only shifts with the given reference IDs (case insensitive) (either a single reference ID or an array of reference IDs).

####subject

If specified, only shifts with the matching subject will be selected.

####covering_member

If specified, requests only shifts covered by the workgroup members. May be a single account id or an array.

**NOTE:** If you are calling this method with the external_covering_member parameter, covering_member will be ignored, and is not required.

####external_covering_member

If specified, requests only shifts covered by the workgroup members. May be a single account id or an array.

**NOTE:** If you are calling this method with the covering_member parameter, external_covering_member will be ignored, and is not required.

####covering_workgroup

If specified, requests only shifts covered by the given workgroup.

####exclude_covering_member

If specified, excludes shifts covered by the workgroup members. May be a single account id or an array.

####only_deleted_workgroups

If specified and true, only shifts for deleted workgroups will be selected; if specified and false, shifts for both deleted and non-deleted workgroups will be selected. Otherwise (the default), only shifts for non-deleted workgroups will be selected.

####profile_type

If specified, only shifts with covering members with this profile type identifier will be selected.

####acknowledged

If specified and true, only shifts that have been acknowledged (including being declined) will be selected.

####custom_multipick

If specified, only shifts with the given custom_multipick identifier (and possibly other custom_multipick identifiers) will be selected.

####resource

If specified, only shifts with the given resource identifier (and possibly other resource identifiers) will be selected.

####attendee_filled

If specified and false, only shifts for which additional attendees may be added will be selected; if specified and true, only shifts which have attendees but for which no additional attendees may be added will be selected.

####no_show

If specified and true, only shifts that have been marked "No Show" will be selected; if specified and false, only shifts that have not been marked "No Show" will be selected.

####workgroup_or_covering

If true, select shifts where the workgroup OR covering_member/covering_workgroup filter applies. Otherwise, select shifts for which both filters (if specified) apply.

####custom_dropdown_1

If specified, only shifts with the given custom_dropdown_1 identifiers will be selected. May be a single identifier or an array of identifiers.

####custom_dropdown_2

If specified, only shifts with the given custom_dropdown_2 identifiers will be selected. May be a single identifier or an array of identifiers.

####custom_dropdown_3

If specified, only shifts with the given custom_dropdown_3 identifiers will be selected. May be a single identifier or an array of identifiers.

####coverage_type

One of or an array of the following (if an array, any shifts that meet at least one of the criteria are selected):

####mine

Select only shifts published and assigned to the current user.

####confirmed

Select only shifts published and assigned to someone other than the current user.

####available

Select only shifts published and not assigned.

####is_a_trade

If tradeboard is enabled, this will return a boolean value if a shift is available to trade.

####room_floor

If specified, only shifts with the given room_floor (case insensitive) will be selected. May be a single value or an array of values.

####custom_text_1

####custom_text_2

####custom_text_3

If specified, only shifts with the given custom text value (case insensitive) will be selected. May be a single value or an array of values. Ignored unless the user is a site administrator or, if the custom text field is readable by managers, you have specified a scope of `report` or `managed_workgroups` (see `scope` above) and the user is a manager.

The response results `shifts` attribute will be an array of the current page of selected shifts. Each element of the array will be an shift object containing basic or basic and extended shift fields.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `shifts` results, with only selected minimal attributes provided:

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

####timezone

name and olson_timezone attributes are provided.

workStatusType

id and name attributes are provided.

####workgroup

id and name attributes are provided.

####acknowledge_decline_reason

id and label attributes are provided.

####custom_multipick

id and name attributes are provided.

####custom_dropdown_1

id and name attributes are provided.

####custom_dropdown_2

id and name attributes are provided.

####custom_dropdown_3

id and name attributes are provided.

####resource

id, name, and label attributes are provided.

### shift.listUpdated

> Request example:

```JSON
{
   "select" : {
      "updated_since" : 1284656001
   }
}
```

> Response example:

```JSON
{
   "seconds" : "0.056182",
   "jsonrpc" : "2.0",
   "id" : "36",
   "result" : {
      "shifts" : [
         {
            "count" : "1",
            "timezone" : "Pacific Time (US/Can) (GMT-08:00)",
            "subject" : "updated",
            "qty" : "1",
            "published" : false,
            "workgroup" : "226082",
            "covered" : false,
            "start_date" : "2010-09-17T12:00:00",
            "id" : "2753500"
         }
      ],
      "count" : "1",
      "page" : {
         "this" : {
            "batch" : 25,
            "start" : 1
         }
      }
   }
}
```

<span class="tryit" id="shift-listupdated-tryit"></span>
Returns information about coverage shifts created or updated since a given date. Uses [pagination](#pagination). Uses select criteria.

Optional parameters:

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each shift.

####select

An object specifying selection criteria for this request. Note that updated_since will have a default value if not specified. The available criteria include all [shift.list](#shift-list) selection criteria with the addition of:

####updated_since

A system.timestamp previously returned by the [system.timestamp](#system-timestamp) method. Only shifts updated since this date will be selected. Defaults to 24 hours ago. If more than 30 days ago, only shifts updated in the last 30 days will be selected.

####status_update

If specified and true, report only shifts whose status has been updated. Confirm, unconfirm, assign, reassign, publish, and unpublish actions are considered status changes. Otherwise, report only shifts whose other data has been updated.

The response results `shifts` attribute will be an array of the current page of selected shifts. Each element of the array will be a shift object.

### shift.notification

<span class="tryit" id="shift-notification-tryit"></span>
Returns notification information about a coverage shift. This method is experimental and subject to change without notice.

Parameters:

####id

Required. id of the shift for which to return information.

The response results `shift` attribute will be an object with selected attributes of the shift object.

The response results `accounts` attribute will be an array of objects with selected attributes of accounts that should be notified.

### shift.signup

<span class="tryit" id="shift-signup-tryit"></span>
Signs up a member to a shift's signup list.

Parameters:

####id

Required. id of the shift for which to sign up.

####member

id of the account to sign up (defaults to the current user)

**NOTE:** If you are calling this method with the member parameter, external_member will be ignored (if included).

####external_member

external id of the account to sign up (defaults to the current user)

**NOTE:** If you are calling this method with the external_member parameter, member will be ignored (if included).

####message

optional message

Response: On success, empty results will be returned.

### shift.signupList

<span class="tryit" id="shift-signuplist-tryit"></span>
Returns information about signups for a coverage shift.

Parameters:

####id

Required. id of the shift for which to return information.

####referenced_objects

Boolean, defaults to true. Indicates that the results should include a referenced_objects attribute giving information about objects referred to in the returned signups.

Upon success, the returned object will have the following attributes:

####already_signed_up

Boolean. The user is already signed up for this signup list.

####can_manage_list

Boolean. The user can add/remove/process/message signup list members.

####can_remove_signup

Boolean. The user can remove their signup for this signup list.

####can_signup

Boolean. The user can sign up for this signup list.

####signups

An array of signups the user is authorized to see for the selected shift. Each signup object will have the following attributes:

####member

account identifier

####message

optional message provided at time of signup

####processed

Boolean.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `shift` results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

### shift.summary

> Request example:

```JSON
{
   "aggregate" : "start_date",
   "exists" : {
      "critical" : {
         "published" : true,
         "covered" : false,
         "urgent" : true
      },
      "unpublished" : {
         "published" : false
      },
      "confirmed" : {
         "published" : true,
         "covered" : true,
         "exclude_covering_member" : 123
      },
      "mine" : {
         "published" : true,
         "covered" : true,
         "covering_member" : 123
      },
      "available" : {
         "published" : true,
         "covered" : false,
         "urgent" : false
      }
   },
   "select" : {
      "workgroup" : [
         123456,
         234567
      ],
      "end_date" : "2015-06-30",
      "start_date" : "2015-06-01"
   }
}
```

> Response example:

```JSON
{
   "seconds" : "0.362897",
   "jsonrpc" : "2.0",
   "id" : "25",
   "result" : {
      "referenced_objects" : {},
      "summary" : [
         {
            "critical" : false,
            "unpublished" : false,
            "confirmed" : false,
            "start_date" : "2015-06-03",
            "mine" : true,
            "available" : false
         },
         {
            "critical" : true,
            "unpublished" : false,
            "confirmed" : false,
            "start_date" : "2015-06-08",
            "mine" : true,
            "available" : true
         },
         {
            "critical" : false,
            "unpublished" : true,
            "confirmed" : false,
            "start_date" : "2015-06-12",
            "mine" : false,
            "available" : true
         }
      ]
   }
}
```

<span class="tryit" id="shift-summary-tryit"></span>
**This method is experimental and subject to change.**

Returns summary information about selected shifts.

Parameters:

####select

Selection criteria. For defaults and allowed criteria, refer to [shift.list](#shift-list).

####aggregate

Shift attribute name or array of names by which to summarize; defaults to `start_date`. Currently supported values: `start_date`.

####exists

Object with arbitrarily named attributes with selection criteria objects as values.

####referenced_objects

Boolean, defaults to true. For future use. Indicates that, in addition to the summary attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned summary data.

The response results `summary` attribute will provide an array containing an element for each distinct set of values found of the specified `aggregate` attributes. Each element will be an object with an attribute for each of the specified `aggregate` attributes giving the value found, and additional attributes for each named set of additional criteria specified in `exists` giving a Boolean value to indicate whether shifts with those additional criteria were found with the given aggregate attribute values.

### shift.unconfirm

> Request example:

```JSON
{
   "id" : 2753501
}
```

> Response example:

```JSON
{
   "seconds" : "0.123864",
   "jsonrpc" : "2.0",
   "id" : "46",
   "result" : {}
}
```

<span class="tryit" id="shift-unconfirm-tryit"></span>
Confirms a shift.

Required parameter: `id`.

Response: On success, empty results will be returned. Note that if the shift had a quantity, the particular shift that was unconfirmed may have been merged with other unconfirmed shifts and deleted.

### shift.update

> Request example:

```JSON
{
   "count" : 1,
   "timezone" : "Greenwich Mean Time : Dublin, Lisbon, London (GMT)",
   "subject" : "updated",
   "qty" : 1,
   "covering_workgroup" : "226084",
   "published" : true,
   "workgroup" : "226084",
   "end_date" : "2010-09-17T14:30:00",
   "covered" : true,
   "start_date" : "2010-09-17T14:00:00",
   "id" : 2753501
}
```

> Response example:

```JSON
{
   "seconds" : "0.178901",
   "jsonrpc" : "2.0",
   "id" : "43",
   "result" : {}
}
```

<span class="tryit" id="shift-update-tryit"></span>
Updates a shift object.

#### Required parameter

`id`. Most other shift object attributes may be specified.

#### Optional Parameters

`notify` Boolean; notify covering member upon update.

The `count` of a shift is the number of positions available for that specific shift, whereas the `qty` is the total positions for all related shifts. Counts may not be directly modified: to increase or decrease available counts, modify the `qty` field, which will update the `qty` for all related shifts, increasing or decreasing the `count` only for the related uncovered shift. Therefore, `qty` cannot be decreased below the total `count` for all related covered shifts. If `qty` is set to the total `count` for all related covered shifts, the uncovered shift, now with `count` 0, is deleted.

#### Assignability parameters

To use assignability checks, the `assignability_checks` parameter must be `true`; then, the following options may be available, based on enabled features:

`conflicts_ok` - boolean

`daily_overtime_ok` - boolean

`weekly_overtime_ok` - boolean

`timeoff_ok` - boolean

`consecutive_days` - boolean

`short_turnaround` - boolean

`ignore_attestation_types` - boolean

`attestation_type` - array of attestationTypeId

#### Response

On success, if the shift was updated, empty results will be returned. If the shift had a `count` > 1 and the update was only applied to a portion of the count, a new shift object will have been created and the `id` of the new shift will be returned. If `qty` is modified on a covered shift, the `id` of the modified uncovered shift will be returned.

### shift.customDropdownList

> Request example:

```JSON
{}
```
> Response example:

```JSON
{
    "custom_listable_1": {
        "25013": "Listable 1 Value A",
        "25014": "Listable 1 Value B"
    },
    "custom_listable_2": {
        "25015": "Listable 2 Value A",
        "25016": "Listable 2 Value B",
        "25017": "Listable 2 Value C"
    },
    "custom_listable_3": {
        "25018": "Listable 3 Value A",
        "25019": "Listable 3 Value B",
        "25020": "Listable 3 Value C",
        "25021": "Listable 3 Value D"
    }
}
```

<span class="tryit" id="shift-customdropdownlist-tryit"></span>
Returns information about shift related custom dropdown list objects.

Required Parameter: none

Optional Parameters: none

Response: On success, an object will be returned containing all shift custom dropdown listables that have been created, and are enabled for the site.


### shift.customMultipickList

> Request example:

```JSON
{}
```
> Response example:

```JSON
{
    "custom_multipick": [
        {
            "description": "Multipick Value One",
            "id": "5551209",
            "name": "One"
        },
        {
            "description": "Multipick Value Two",
            "id": "5551210",
            "name": "Two"
        }
    ],
    "custom_multipick_2": [
        {
            "description": "Choice A",
            "id": "5551211",
            "name": "A"
        },
        {
            "description": "Choice B",
            "id": "5551212",
            "name": "B"
        },
        {
            "description": "Choice C",
            "id": "5551213",
            "name": "C"
        }
    ],
    "custom_multipick_3": []
}
```

<span class="tryit" id="shift-custommultipicklist-tryit"></span>
Returns information about shift related custom multi-pick list objects.

Required Parameter: none

Optional Parameters: none

Response: On success, an object will be returned containing all shift custom multi-pick listables that have been created, and are enabled for the site.

### shift.customTextList

> Request example:

```JSON
{}
```
> Response example:

```JSON
{
	"custom_text_1": {
		"label": "Custom Text 1",
		"permissions": {
			"auth_read": 2,
			"auth_write": 4
		}
	},
	"custom_text_2": {
		"label": "Custom Text 2",
		"permissions": {
			"auth_read": 2,
			"auth_write": 4
		}
	},
	"custom_text_3": {
		"label": "Custom Text 3",
		"permissions": {
			"auth_read": 5,
			"auth_write": 2
		}
	},
	"custom_textarea": {
		"label": "Custom Text Area",
		"permissions": {
			"auth_read": 2,
			"auth_write": "4"
		}
	}
}
```

<span class="tryit" id="shift-custommultipicklist-tryit"></span>
Returns permissions for shift related custom multi text/text area objects.

Required Parameter: none

Optional Parameters: none

Response: On success, an object will be returned containing all shift custom text objects that have been created, and are enabled for the site.
