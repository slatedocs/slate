## timecard object

### timecard: basic attributes

####id

A unique identifier for this timecard

####workgroup

Workgroup identifier

####account

Account identifier

####external_account

External account identifier. Can be used in lieu of account if external identifiers are enabled for the site.

**NOTE:** If both account and external_account are included, the external_account value will be ignored.

####shift

Shift identifier or null if there is no shift associated with this timecard object

####approved

true if the timecard is approved

####processed

true if the timecard is processed

####start_date

Start date in RFC 3339 full-date format (e.g. "2009-04-01")

####start_time

Start time in RFC 3339 partial-time format (e.g. "23:55:00") or null if no start time was provided

####duration

Duration in HHH:MM:SS format (e.g. "1:05:00" or "120:00:00")

### timecard: extended attributes

####work_status_type

The workStatusType id for the timecard

####location

The location id for the timecard, if specified

####role

The role id for the timecard, if specified

####client

The client id for the timecard, if specified

####department

The department id for the timecard, if specified

####mileage

Mileage for the timecard, if specified

####expense_notes

Expense notes, if specified

####notes

Notes, if specified

####manager_notes

Manager notes, if specified

Not all fields will be exposed to all users.

Not all fields will be configured to be used for all organizations or set for all timecards.

### timecard.approve

<span class="tryit" id="timecard-approve-tryit"></span>

> Request example:

```JSON
{ "id": [123456, 654321], "approved": true }
```

> Response example:

```JSON
{"seconds":"0.052778","jsonrpc":"2.0","id":"48","result":{}}{"seconds":"0.052778","jsonrpc":"2.0","id":"48","result":{}}
```
Approve one or more timecard records.

Parameters:
`id` One or more timecards to approve
`approved` Boolean; approve or un-approve one or more timecards

Response: On success, empty results will be returned.

### timecard.create

<span class="tryit" id="timecard-create-tryit"></span>
Creates a new timecard record.

Parameters: Any attributes of a timecard object (except `id`) may be specified.

Response: On success, an `id` attribute will provide the identifier for the new timecard.

### timecard.delete

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

<span class="tryit" id="timecard-delete-tryit"></span>
Deletes a timecard record.

Required parameter: `id`.

Response: On success, empty results will be returned.

### timecard.exportTRAXPayroll

<span class="tryit" id="timecard-exporttraxpayroll-tryit"></span>
Initiates a TRAXPayroll timecard export.

Parameters:

####inline_content

If true, report data will be directly returned; if false, a one-time url for fetching the report data will be returned.

####select

Selection criteria (optional):

####start_date

Earliest timecard start date to select; defaults to 30 days ago. If overtime is enabled, the day of week must match the configured workweek start day.

####end_date

Latest timecard start date to select; defaults to today. If overtime is enabled, the day of week must match the weekday before the configured workweek start day (i.e. the end of the workweek).

####workgroup

Single workgroup identifier or array of workgroup identifiers to report

####account

Single account identifier or array of account identifiers to report

**NOTE:** If you are calling this method with the account parameter, external_account is not required.

####external_account

Single external account identifier or array of external account identifiers to report

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

####approved

true to select only approved timecards, false to select only timecards not yet approved

####processed

true to select only processed timecards, false to select only timecards not yet processed

####client

####department

####role

####work_status_type

####location

####use_workweek_start_time

Boolean; if specified and true, modifies the selection to be from the configured workweek start time on the specified start_date to the configured workweek start time on the day following the specified end_date; if weekly overtime is enabled and the configured workweek start time is not midnight, this must be specified as true.

Response: If `inline_content` is true, a `content` attribute will provide an array of the requested data; otherwise, a `url` attribute giving a link that may be used one time only, within 5 minutes of the API request, to generate the requested report.

### timecard.get

<span class="tryit" id="timecard-get-tryit"></span>
Returns information about a timecard object.

Parameters:

####id

Required. id of the timecard object for which to return information.

####extended

Boolean; if specified and false, the results returned will be a basic set of attributes; otherwise an extended set of attributes will be returned for each timecard.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the timecard attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned timecard.

####editable_fields

Boolean; if specified and true, the results returned will include a list of timecard fields that are editable by the caller (based on auth level).

The response results `timecard` attribute will be the selected timecard object.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `timecard` results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

**NOTE:** external_id will also be returned in the results if external ids are enabled for the site

####client

id and name attributes are provided.

####department

id and name attributes are provided.

####location

id and name attributes are provided.

####role

id and name attributes are provided.

workStatusType

id and name attributes are provided.

####workgroup

id and name attributes are provided.

### timecard.list

<span class="tryit" id="timecard-list-tryit"></span>
Returns information about timecard objects. Uses [pagination](#pagination). Uses select criteria.

Optional parameters:

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each timecard object.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the timecards attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned timecard objects.

####select

An object specifying selection criteria for this request. Note that start_date and end_date will have default values if not specified. The available criteria include:

####start_date

Earliest timecard start date to select; defaults to 30 days ago

####end_date

Latest timecard start date to select; defaults to today

####workgroup

Single workgroup identifier or array of workgroup identifiers to report

####account

Single account identifier or array of account identifiers to report

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

####external_account

Single external account identifier or array of external account identifiers to report

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

####approved

true to select only approved timecards, false to select only timecards not yet approved

####processed

true to select only processed timecards, false to select only timecards not yet processed

####client

####department

####role

####work_status_type

####location

The response results `timecards` attribute will be an array of the current page of selected timecard objects. Each element of the array will be an timecard object containing basic or basic and extended timecard fields.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `timecards` results, with only selected minimal attributes provided:

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

workStatusType

id and name attributes are provided.

####workgroup

id and name attributes are provided.

### timecard.process

> Request example:

```JSON
{ "id": [123456, 654321], "processed": true }
```

> Response example:

```JSON
{"seconds":"0.052778","jsonrpc":"2.0","id":"48","result":{}}
```

Process one or more timecard records.

Parameters:
`id` One or more timecards to process
`process` Boolean; process or un-process one or more timecards

Response: On success, empty results will be returned.
### timecard.report

<span class="tryit" id="timecard-report-tryit"></span>
Generates a pre-authorized link to download a timecard report.

Parameters:

####report_type

One of: `basic` (default), `extended`, `adherence`

####format

One of: `csv` (default), `xls`

####select

Selection criteria (optional):

####start_date

Earliest timecard start date to select; defaults to 30 days ago.

####end_date

Latest timecard start date to select; defaults to today.

####workgroup

Single workgroup identifier or array of workgroup identifiers to report

####account

Single account identifier or array of account identifiers to report

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

####external_account

Single external account identifier or array of external account identifiers to report

**NOTE:** If you are calling this method with the account parameter, external_account is not required, and will be ignored.

####approved

true to select only approved timecards, false to select only timecards not yet approved

####processed

true to select only processed timecards, false to select only timecards not yet processed

####client

####department

####role

####work_status_type

####location

Response: A `url` attribute giving a link that may be used one time only, within 5 minutes of the API request, to generate the requested report.

### timecard.update

<span class="tryit" id="timecard-update-tryit"></span>
Updates a timecard object.

Required parameter: `id`. Any other timecard object attributes may be specified.

Response: On success, empty results will be returned.

### timecard.customDropdownList

> Request example:

```JSON
{}
```

> Response example:

```JSON
{
    "custom_listable_1": {
        "1550": "Red",
        "1551": "Blue",
        "1552": "Green"
    },
    "custom_listable_2": {
        "1553": "Breakfast",
        "1554": "Lunch",
        "1555": "Dinner"
    },
    "custom_listable_4": {
        "1558": "Baseball",
        "1559": "Skiing",
        "1560": "Soccer",
        "1561": "Football"
    }
}
```

<span class="tryit" id="timecard-customdropdownlist-tryit"></span>
Returns information about timecard related custom dropdown list objects.

Required Parameter: none

Optional Parameters: none

Response: On success, an object will be returned containing all timecard custom drop down listables that have been created, and are enabled for the site.

### timecard.shiftList

> Request example:

```JSON
{
   "member" : "1"
}
```

> Response example:

```JSON
{
   "seconds" : "2.811506",
   "jsonrpc" : "2.0",
   "id" : "21",
   "result" : {
                 "referenced_objects": {
                       "workgroup": {
                         "123456": "My Team"
                       }
                 },
                 "shifts": [
                    {
                        "agent": "12345",
                        "approved": "1",
                        "category": "0",
                        "client": null,
                        "count": "1",
                        "covered": true,
                        "department": null,
                        "display_time": "7am - 11:10am",
                        "dur_hrs": "4",
                        "dur_mins": "10",
                        "end_date": "2018-02-06T11:10:00",
                        "id": "1234567890",
                        "name": "",
                        "qty": "1",
                        "start_date": "2018-02-06T07:00:00",
                        "subject": "",
                        "timezone": "Pacific Time (US/Can) (GMT-08:00)",
                        "urgent": false,
                        "use_time": "2",
                        "venue": "0",
                        "workgroup": "123456"
                    }
                 ]
   }
}
```

<span class="tryit" id="timecard-shiftlist-tryit"></span>
Returns list of shifts (un)associated with timecards depending on timekeepr settings configured in Shiftboard

Required parameters:
#### member
Integer; The id of the member to query on.

The response results "shifts" attribute will be an array of the selected timecard objects that are (un)associated with shifts.
