## availability object

availability objects have the following attributes:

####id

Unique identifier for this availability.

####account

Account identifier for this availability.

####external_account

The external account identifier for this object.

**NOTE:** This field is only used or returned when external ids are enabled for the site.

####busy

false if the availability record indicates availability; true if it indicates unavailability.

####start_date

Date at which this availability starts; null if availability extends indefinitely into the past.

####end_date

Date at which this availability ends; null if availability extends indefinitely into the future.

####start_time

Start time for each date of this availability, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) partial time format (e.g. "13:00:00"), or null if the availability extends from the beginning of the day.

**note:** It is not possible to specify the seconds for *start_time*. This value should always be set to: "00"

####end_time

End time for each date of this availability, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) partial time format (e.g. "13:00:00"), or null if the availability extends to the end of the day.

**note:** It is not possible to specify the seconds for *end_time*. This value should always be set to: "00"

####workgroup

Workgroup identifier for this availability or null if no workgroup

####sunday

####monday

####tuesday

####wednesday

####thursday

####friday

####saturday

true for all days of the week (within the date range, if specified) to which this availability applies.

### availability.create

<span class="tryit" id="availability-create-tryit"></span>
Creates a new availability record.

Required Parameters:

####account

account identifier or array of account identifiers

**NOTE:** If you are calling this method with the `account` parameter, `external_account` will be ignored (if included).

####external_account

external account identifier or array of external account identifiers

**NOTE:** If you are calling this method with the `account parameter`, `external_account` will be ignored (if included).

####external_account

external account identifier or array of external account identifiers

**NOTE:** If you are calling this method with the external_account parameter, account will be ignored (if included).

####busy

false if the availability record indicates availability; true if it indicates unavailability.

Any availability object attributes may be specified. If no day of week attributes are specified, all applicable (i.e. within the date range, if specified) days of the week will default to true; otherwise, at least one applicable day of week attribute must be true.

Additionally, if start_date and end_date are not specified, a date attribute may be specified with a single date or array of dates for which to create availability records.

Response: On success, if either the account or date parameters is an array, an empty object is returned; otherwise, an `id` attribute will provide the identifier for the new availability record.

### availability.delete

> Request example:

```JSON
{
   "id" : "2753"
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

<span class="tryit" id="availability-delete-tryit"></span>
Deletes an availability record.

Required parameter: `id`.

Response: On success, empty results will be returned.

### availability.get

<span class="tryit" id="availability-get-tryit"></span>
Returns information about an availability record.

Parameters:

####id

Required. id of the availability record for which to return information.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the availability attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned availability record.

The response results `availability` attribute will be the selected availability object.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `availability` results or in its associated shift, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

### availability.list

> Request example:

```JSON
{
   "select" : {
      "account" : 1
   }
}
```

> Response example:

```JSON
{
   "seconds" : "0.089939",
   "jsonrpc" : "2.0",
   "id" : "10",
   "result" : {
      "availability" : [
         {
            "sunday" : false,
            "friday" : true,
            "account" : "1",
            "start_time" : "11:00:00",
            "tuesday" : true,
            "monday" : true,
            "end_time" : "12:00:00",
            "end_date" : null,
            "wednesday" : true,
            "saturday" : false,
            "thursday" : true,
            "id" : "236471",
            "start_date" : "2013-04-01",
            "busy" : true
         },
         {
            "sunday" : false,
            "friday" : false,
            "account" : "1",
            "start_time" : "05:00:00",
            "tuesday" : false,
            "monday" : false,
            "end_time" : "11:00:00",
            "end_date" : null,
            "wednesday" : false,
            "saturday" : true,
            "thursday" : false,
            "id" : "237006",
            "start_date" : null,
            "busy" : false
         }
      ],
      "count" : "5",
      "page" : {
         "this" : {
            "batch" : 10,
            "start" : 1
         }
      }
   }
}
```

<span class="tryit" id="availability-list-tryit"></span>

Returns information about account availability data. Uses select criteria. Uses [pagination](#pagination).

Parameters:

####select

An object specifying selection criteria for this request. The available criteria include:

####account

The account identifier or array of account identifiers for which to return availability.

####external_account

The external account identifier or array of external account identifiers for which to return availability.

####start_date

####end_date

The date range for which to return availability (including any availability that extends before and/or after the given date range); either or both dates may be null to indicate a date range extending indefinitely into the past or future, respectively. start_date defaults to today, end_date to null.

####start_time

####end_time

Start and end time in RFC 3339 partial time format (e.g. 13:45:00). Return only availability records that encompass this time range; if either is specified, both must be.

####workgroup

Workgroup identifier if only availability specific to a given workgroup should be returned, or null if only availability not specific to any workgroup should be returned.

####busy

True if only Busy availability should be returned; false if only Available availability should be returned.

####sunday

####monday

####tuesday

####wednesday

####thursday

####friday

####saturday

Booleans; return only availability for the given days of the week.

####any_selected_day

Boolean, default false. If true, return availability for any of the selected days; if false, return availability records that are for all of the selected days.

####org_hold

Boolean account hold status.

####org_pending

Account onboarding status.

####scope

A value of 'by_account' requests availability for a specific account (defaulting to the user's account if no account criterion is provided). A value of 'siteadmin' requests all availability for the entire site and is only allowed for site administrators. A value of 'managed_workgroups' requests availability for members of the workgroups managed by the user and is only allowed for workgroup managers. 'siteadmin' is the default for site administrators, 'managed_workgroups' is the default for managers, and 'by_account' is the default for others.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the availability attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned availability records.

The response results `availability` attribute will be an array of the current page of availability. Each element of the array will be an availability object.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `availability` results, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

### availability.update *(not currently available)*

Please let us know if you would like access to this method.

