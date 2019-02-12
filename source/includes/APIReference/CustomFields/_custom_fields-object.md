## The Custom Field Object

> **Example**: Custom Field Object

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

Name | Type | Format | Description
---- | ---- | ------ | -----------
`id` | _Int_ | | Unique identifier of the customfield
`active` | _Boolean_ | | If false, the field is archived
`name` | _String_ | | Name of the customfield
`short_code` | _String_ | | This is a shortened code or alias that is associated with the customfield. It may only consist of letters and numbers.
`required` | _Boolean_ | | Indicates whether a value for this customfield is required on a timesheet
`applies_to` | _String Enum_ | 'timesheet', 'user' or 'jobcode' |  Indicates what type of object this customfield applies to.
`type` | _Enum_ | 'managed-list' or 'free-form' | If free-form, then it should be displayed in a UI as a text box, where users can enter values for this customfield and they'll get added automatically to the customfield if they don't already exist. If managed-list, then it should be displayed as a select-box and users can only choose an existing value.
`ui_preference` | _String Enum_ | 'drop_down' or 'text_box_with_suggest' | Indicates the suggested user interface depending on the specified type.
`regex_filter` | _String_ | regex | Regular expression that will be applied to any new items as they're added to the customfield. Values which do not match the filter cannot be added.
`last_modified` | _DateTime_ | ISO8601 | Date/time when this customfield was last modified
`created` | _DateTime_ | ISO8601 | Date/time when this customfield was created 
`required_customfields` | _Int Array_ | | Ids of customfields that should be displayed when this customfield is visible on a timecard

