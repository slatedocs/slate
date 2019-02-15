# Timesheets Deleted
 
## The Timesheets Deleted Object

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>read-only | _Int_ | Id of the timesheet. |
| **user_id**<br/>read-only | _Int_ | User id for the user that this timesheet belongs to. |
| **jobcode_id**<br/>read-only | _Int_ | Jobcode id for the jobcode that this timesheet is recorded against. |
| **start**<br/>read-only | _String_ | Date/time that represents the start time of this timesheet, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |
| **end**<br/>read-only | _String_ | Date/time that represents the end time of this timesheet, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |
| **date**<br/>read-only | _String_ | The timesheet's date, in `YYYY-MM-DD` format. |
| **duration**<br/>read-only | _Int_ | The total number of seconds recorded for this timesheet. |
| **locked**<br/>read-only | _Int_ | If > 0, the timesheet is locked for editing. A timesheet could be locked for various reasons, such as being exported, invoiced, etc. _See note below._ |
| **notes**<br/>read-only | _String_ | Notes associated with this timesheet. |
| **customfields**<br/>read-only | _JSON object_ | A key/value map of customfield ids to the customfield items that are associated with the timesheet. _See note below._ |
| **created**<br/>read-only | _String_ | Date/time when this timesheet was created, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |
| **last_modified**<br/>read-only | _String_ | Date/time when this timesheet was last modified, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |
| **type**<br/>read-only | _String_ | Either `regular` or `manual`. Regular timesheets have a start & end time (duration is calculated by TSheets). Manual timesheets have a date and a duration (in seconds). Unique properties for each timesheet type are below. |

<aside class="notice">
The <code>locked</code> setting does not reflect the approved or submitted status of time. To determine whether a timesheet falls within an approved or submitted time frame, check the <code>submitted_to</code> or <code>approved_to</code> properties of the User object that owns the timesheet (you can easily obtain this via the <code>supplemental_data</code> portion of any response dealing with timesheets).
</aside>

<aside class="notice">
The customfields property is present only if the <i>Advanced Tracking Add-On</i> is installed.
</aside>

