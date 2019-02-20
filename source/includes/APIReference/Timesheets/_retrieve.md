## Retrieve Timesheets

Retrieves a list of all timesheets associated with your company, with filters to narrow down the results.

### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/timesheets</api>

### Parameters

|                |             |             |
| -------------: | :---------: | ----------- |
| **ids**<br/>required (unless `modified_before`, `modified_since`, or `start_date` are set) | _Int_ | Comma separated list of one or more timesheet ids you'd like to filter on. Only timesheets with an id set to one of these values will be returned. If omitted, all timesheets matching other specified filters are returned. |
| **start_date**<br/>required (unless `modified_before`, `modified_since`, or `ids` is set) | _String_ | `YYYY-MM-DD` formatted date. Any timesheets with a date falling on or after this date will be returned. |
| **end_date**<br/>optional | _String_ | `YYYY-MM-DD` formatted date. Any timesheets with a date falling on or before this date will be returned. |
| **jobcode_ids**<br/>optional | _Int_ | A comma-separated string of jobcode ids. Only time recorded against these jobcodes or one of their children will be returned. |
| **payroll_ids**<br/>optional | _Int_ | A comma-separated string of payroll ids. Only time recorded against users with these payroll ids will be returned. |
| **user_ids**<br/>optional | _Int_ | A comma-separated list of user ids. Only timesheets linked to these users will be returned. |
| **group_ids**<br/>optional | _Int_ | A comma-separated list of group ids. Only timesheets linked to users from these groups will be returned. |
| **on_the_clock**<br/>optional | _String_ | 'yes', 'no', or 'both'. Default is 'no'. If a timesheet is on_the_clock, it means the user is currently working (has not clocked out yet). |
| **jobcode_type**<br/>optional | _String_ | 'regular', 'pto', 'paid_break', 'unpaid_break', or 'all'. Default is 'all'. Only timesheets linked to a jobcode of the given type are returned. |
| **modified_before**<br/>required (unless `modified_since`, `ids`, or `start_date` are set) | _String_ | Only timesheets modified before this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **modified_since**<br/>required (unless `modified_before`, `ids`, or `start_date` are set) | _String_ | Only timesheets modified since this date/time will be returned, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss?hh:mm`). |
| **supplemental_data**<br/>optional | _String_ | 'yes' or 'no'. Default is 'yes'. Indicates whether supplemental data should be returned. |
| **per_page**<br/>optional | _Int_ | Represents how many results you'd like to retrieve per request (page). Default is 50. Max is 50. |
| **page**<br/>optional | _Int_ | Represents the page of results you'd like to retrieve. Default is 1. |

