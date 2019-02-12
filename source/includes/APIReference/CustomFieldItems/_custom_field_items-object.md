## The Custom Field Item Object

> **Example**: Custom Field Object

```json
{
  "id": 3875655,
  "customfield_id": 143369,
  "active": true,
  "short_code": "JS",
  "name": "Jungle Safari",
  "last_modified": "2019-02-11T17:42:45+00:00",
  "required_customfields": []
}
```

Name | Access | Type | Format | Description
---- | ------ | ---- | ------ | -----------
`id` | R/O | _Int_ | | Unique identifier of customfielditem
`customfield_id` | R/O | _Int_ | | Id for the customfield that this item belongs to
`name` | R/W | _String_ | | Name of the customfielditem.
`short_code` | R/W | _String_ | | This is a short alias that is associated with the customfielditem. It may only consist of letters and numbers.
`active` | R/W | _Boolean_ | | If false, the custom field item is considered archived
`last_modified` |R/O | _DateTime_ | ISO8601 | Date/time when last modified
`created` | R/O | _DateTime_ | ISO8601 | Date/time when created 
`required_customfields` | R/W | _Int Array_ | | Ids of customfields that should be displayed when this customfielditem is selected on a timecard.

<aside class="notice">
Custom Field Item <code>short_code</code> values must be unique.
</aside>

