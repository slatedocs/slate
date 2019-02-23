# Timesheets Deleted
 
## The Timesheets Deleted Object

 > **Example**

```json
{
  "id": 135288460,
  "user_id": 1242509,
  "jobcode_id": 18080900,
  "start": "2018-07-18T08:09:00-06:00",
  "end": "2018-07-18T14:58:00-06:00",
  "duration": 24540,
  "date": "2018-07-18",
  "tz": -6,
  "tz_str": "tsMT",
  "type": "regular",
  "location": "(Eagle, ID?)",
  "active": "0",
  "locked": 0,
  "notes": "",
  "last_modified": "2018-08-05T21:21:55+00:00"
}
```

Following is a list of the properties that are common to timesheet deleted objects, and a description of each.

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>read-only | _Int_ | Id of the timesheet. |
| **user_id**<br/>read-only | _Int_ | User id for the user that this timesheet belongs to. |
| **jobcode_id**<br/>read-only | _Int_ | Jobcode id for the jobcode that this timesheet is recorded against. |
| **start**<br/>read-only | _String_ | Date/time that represents the start time of this timesheet, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |
| **end**<br/>read-only | _String_ | Date/time that represents the end time of this timesheet, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |
| **date**<br/>read-only | _String_ | The timesheet's date, in `YYYY-MM-DD` format. |
| **duration**<br/>read-only | _Int_ | The total number of seconds recorded for this timesheet. |
| **locked**<br/>read-only | _Int_ | If greater than 0, the timesheet is locked for editing. A timesheet could be locked for various reasons, such as being exported, invoiced, etc. _See note below._ |
| **notes**<br/>read-only | _String_ | Notes associated with this timesheet. |
| **customfields**<br/>read-only | _JSON object_ | A key/value map of customfield ids to the customfield items that are associated with the timesheet. _See note below._ |
| **created**<br/>read-only | _String_ | Date/time when this timesheet was created, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |
| **last_modified**<br/>read-only | _String_ | Date/time when this timesheet was last modified, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |
| **type**<br/>read-only | _String_ | Either 'regular' or 'manual'. Regular timesheets have a `start` & `end` time (duration is calculated by TSheets). Manual timesheets have a `date` and a `duration` (in seconds). Unique properties for each timesheet type are below. |

<aside class="notice">
Deleted timesheets will be kept on the server and accessible for 180 days since their deletion.
</aside>

<aside class="notice">
The customfields property is present only if the <i>Advanced Tracking Add-On</i> is installed.
</aside>

