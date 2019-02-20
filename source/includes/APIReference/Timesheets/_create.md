## Create Timesheets

Add one or more timesheets to your company.

### HTTP Request

<img src="../../images/post.png" alt="post"/><api>https://rest.tsheets.com/api/v1/timesheets</api>

### Properties
_Pass an array of timesheet objects as the value to a 'data' property (see example)._

<br/>
**All Timesheets**

|                |             |             |
| -------------: | :---------: | ----------- |
| **user_id**<br/>required | _Int_ | User id that this timesheet will be recorded against. |
| **jobcode_id**<br/>required | _Int_ | Jobcode id that you'd like this timesheet to be recorded against. |
| **type**<br/>required | _String_ | Either 'regular' or 'manual'. |

<br/>
**Regular Timesheets**

|                |             |             |
| -------------: | :---------: | ----------- |
| **start**<br/>required | _String_ | Start time of the timesheet, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`). Time should reflect the user's local time. |
| **end**<br/>required | _String_ | End time of the timesheet, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`). Time should reflect the user's local time. |

<br/>
**Manual Timesheets**

|                |             |             |
| -------------: | :---------: | ----------- |
| **duration**<br/>required | _Int_ | Number of seconds that you'd like to record against this manual timesheet. Will get converted to hours, rounded to the nearest 2 decimal places when the timesheet is saved. |
| **date**<br/>required | _String_ | `YYYY-MM-DD` formatted date string. Date you'd like the manual timesheet recorded against. |

For a full list of the properties that may be set on a timesheet, see the [Timesheet object](#the-timesheet-object).

### Status Codes
Each timesheet that is created will come back with a `_status_code` and `_status_message` that will indicate whether the timesheet was created successfully. If there was a problem creating a timesheet, there may also be an additional field, `_status_extra`, which will contain more details about the failure.

|         |          |
| :-----: | :------- |
| <code class="level200">200</code> | OK. Timesheet was created successfully. |
| <code class="level200">201</code> | Fulfilled. Timesheet was created successfully. Other timesheets may have been modified as a result (i.e. due to timesheet splits or an automatic Lunch Break). Be sure to process entries for `timesheets` or `timesheets_deleted` in the `supplemental_data` portion of the response. |
| <code class="level400">406</code> | Not Acceptable. Conflict exists with another timesheet. See the `_status_extra` value for more detail. |
| <code class="level400">417</code> | Expectation Failed. Something was wrong or missing with the properties supplied for this timesheet. See the `_status_extra` value for more detail. |

<aside class="notice">
The maximum batch size is <i>50</i> timesheets. If exceeded, a <code class="standout">413: Request entity too large</code> HTTP response will be returned.
</aside>