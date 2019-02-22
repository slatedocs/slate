# Timesheets

## The Timesheet Object

 > **Example**

```json
{
  "id": 135288482,
  "user_id": 1242515,
  "jobcode_id": 17288283,
  "start": "2018-07-16T09:04:00-06:00",
  "end": "2018-07-16T15:57:00-06:00",
  "duration": 24780,
  "date": "2018-07-16",
  "tz": -6,
  "tz_str": "tsMT",
  "type": "regular",
  "location": "(Eagle, ID?)",
  "on_the_clock": false,
  "locked": 0,
  "notes": "",
  "customfields": {
    "19142": "Item 1",
    "19144": "Item 2"
  },
  "attached_files": [
    50692,
    44878
  ],
  "last_modified": "1970-01-01T00:00:00+00:00"
}
```

Following is a list of the properties that are common to both types of timesheet objects, and a description of each.

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>read-only | _Int_ | Id of the timesheet. |
| **user_id**<br/>read-write | _Int_ | User id for the user that this timesheet belongs to. |
| **jobcode_id**<br/>read-write | _Int_ | Jobcode id for the jobcode that this timesheet is recorded against. |
| **locked**<br/>read-only | _Int_ | If greater than 0, the timesheet is locked for editing. A timesheet could be locked for various reasons, such as being exported, invoiced, etc. _(See note below.)_ |
| **notes**<br/>read-write | _String_ | Notes associated with this timesheet. |
| **customfields**<br/>read-write | _JSON Object_ | A key/value map of customfield ids to the customfield items that are associated with the timesheet. _(See note below)._ |
| **created**<br/>read-only | _String_ | Date/time when this timesheet was created, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |
| **last_modified**<br/>read-only | _String_ | Date/time when this timesheet was last modified, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |
| **type**<br/>read-write | _String_ | Either 'regular' or 'manual'. Regular timesheets have a `start` & `end` time (duration is calculated by TSheets). Manual timesheets have a `date` and a `duration` (in seconds). Unique properties for each timesheet type are below. |
| **on_the_clock**<br/>read-only | _Boolean_ | If _true_, the user is currently on the clock (i.e. not clocked out, so end time is empty). If _false_ the user is not currently working on this timesheet. Manual timesheets will always have this property set as _false_. |
| **attached_files**<br/>read-write | _Int[]_ | Ids of files attached to this timesheet. |
| **created_by_user_id**<br/>read-only | _Int_ | User id for the user that initially created this timesheet. |

### Regular Timesheets

|                |             |             |
| -------------: | :---------: | ----------- |
| **start**<br/>read-write | _String_ | Date/time that represents the start time of this timesheet, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |
| **end**<br/>read-write | _String_ | Date/time that represents the end time of this timesheet, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |
| **date**<br/>read-only | _String_ | The timesheet's date, in `YYYY-MM-DD` format. |
| **duration**<br/>read-only | _Int_ | The total number of seconds recorded for this timesheet. |
| **origin_hint**<br/>read-only | _String_ | A string that will be logged as part of the timesheet history when someone is clocked in, clocked out, or a timesheet is created (with both in/out). |

### Manual Timesheets

|                |             |             |
| -------------: | :---------: | ----------- |
| **start**<br/>read-only | _String_ | Not applicable. Will always be an empty string. |
| **end**<br/>read-only | _String_ | Not applicable. Will always be an empty string. |
| **date**<br/>read-write | _String_ | The timesheet's date, in `YYYY-MM-DD` format. |
| **duration**<br/>read-write | _Int_ | The total number of seconds recorded for this timesheet. |

<aside class="notice">
The <code>locked</code> setting does not reflect the approved or submitted status of time. To determine whether a timesheet falls within an approved or submitted time frame, check the <code>submitted_to</code> or <code>approved_to</code> properties of the User object that owns the timesheet (you can easily obtain this via the <code>supplemental_data</code> portion of any response dealing with timesheets).
</aside>

<aside class="notice">
The customfields property is present only if the <i>Advanced Tracking Add-On</i> is installed.
</aside>

<aside class="notice">
Each employee/user may only ever have a single active timesheet (no <code>end_time</code> defined) at any given point in time. This is enforced by the API and any attempts to create additional timesheets without <code>end_time</code> defined will fail.
</aside>

