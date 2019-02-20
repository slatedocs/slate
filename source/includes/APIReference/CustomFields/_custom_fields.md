# Custom Fields

Custom Fields (aka "Advanced Tracking") provides a means to extend the data that is tracked on employee time cards to capture custom activities beyond time tracking, e.g. mileage, equipment, expenses, etc.  The API provides a Read method.  Use the web UI to Create or Update custom fields.

## The Custom Field Object

> **Example**

```json
{
  "id": 134913,
  "active": true,
  "required": true,
  "applies_to": "timesheet",
  "type": "managed-list",
  "short_code": "Exp",
  "regex_filter": "",
  "name": "Experience",
  "last_modified": "2019-02-10T20:40:41+00:00",
  "created": "2019-02-03T18:36:16+00:00",
  "ui_preference": "drop_down",
  "required_customfields": []
}
```

Following is a list of the properties that belong to a customfield object, and a description of each.

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>read-only | _Int_ | Id of customfield. |
| **active**<br/>read-write | _Boolean_ | _true_ or _false_. If _true_, this custom field is active. If _false_, this custom field is archived. |
| **name**<br/>read-write | _String_ | Name of the customfield. |
| **short_code**<br/>read-write | _String_ | This is a shortened code or alias that is associated with the customfield. It may only consist of letters and numbers. |
| **required**<br/>read-write | _Boolean_ | _true_ or _false_. Indicates whether a value for this customfield is required on a timesheet |
| **applies_to**<br/>read-write | _String_ |  'timesheet' or 'user' or 'jobcode'. Indicates what type of object this customfield applies to. |
| **type**<br/>read-write | _String_ | 'managed-list' or 'free-form'. If 'free-form', then it should be displayed in a UI as a text box, where users can enter values for this customfield and they'll get added automatically to the customfield if they don't already exist. If 'managed-list', then it should be displayed as a select-box and users can only choose an existing value. |
| **ui_preference**<br/>read-write | _String_ | 'drop_down' or 'text_box_with_suggest'. Indicates the suggested user interface depending on the specified type. |
| **regex_filter**<br/>read-write | _String_ | Regular expression that will be applied to any new items as they're added to the customfield. If they do not match the regex_filter, they may not be added. |
| **last_modified**<br/>read-only | _String_ | Date/time when this customfield was last modified, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`). |
| **created**<br/>read-only | _String_ | Date/time when this customfield was created, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`). |
| **required_customfields**<br/>read-write | _Array_ | Ids of customfields that should be displayed when this customfield is visible on a timecard |

