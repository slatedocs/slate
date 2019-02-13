# Custom Field Items

A Custom Field Item represents an allowable value for a Custom Field Object of _managed-list_ type.  Each item represents a single drop-down choice displayed to the user in the web UI.  The API provides methods to Create, Read, and Update custom field items.  Set the `active` property _false_ to archive (i.e. soft delete) a custom field item.

## The Custom Field Item Object

> **Example**

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

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>read-only | _Int_ | Unique identifier of customfielditem |
| **customfield_id**<br/>read-only | _Int_ | Id for the customfield that this item belongs to |
| **name**<br/>read-write | _String_ | Name of the customfielditem |
| **short_code**<br/>read-write | _String_ | This is a short alias that is associated with the customfielditem. It may only consist of letters and numbers. |
| **active**<br/>read-write | _Boolean_ | If false, the custom field item is considered archived |
| **last_modified**<br/>read-only | _String_ | Date/time when last modified, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`). |
| **created**<br/>read-only | _String_ | Date/time when created, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`). |
| **required_customfields**<br/>read-write | _Int[]_ | Ids of customfields that should be displayed when this customfielditem is selected on a timecard. |

<aside class="notice">
Custom Field Item <code>short_code</code> values must be unique.
</aside>

