# Jobcodes

## The Jobcode Object

 > **Example**

```json
{
  "id": 17288279,
  "parent_id": 0,
  "assigned_to_all": false,
  "billable": false,
  "active": true,
  "type": "regular",
  "has_children": false,
  "billable_rate": 0,
  "short_code": "asm",
  "name": "Assembly Line",
  "last_modified": "2018-07-12T21:13:14+00:00",
  "created": "2018-05-28T20:18:17+00:00",
  "filtered_customfielditems": "",
  "required_customfields": [],    
  "locations": []
}
```

Following is a list of the properties that belong to a jobcode object, and a description of each.

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>read-only | _Int_ | Id of jobcode. |
| **parent_id**<br/>read-write | _Int_ | Id of this jobcode's parent. 0 if it's top-level. |
| **name**<br/>read-write | _String_ | Name of the jobcode. Cannot be more than 64 characters and must be unique for all jobcodes that share the same `parent_id`. |
| **short_code**<br/>read-write | _String_ | This is a shortened code or alias that is associated with the jobcode. It may only consist of letters and numbers. Must be unique for all jobcodes that share the same `parent_id`. _(See note below)_ |
| **type**<br/>read/write-once | _String_ | Indicates jobcode type. One of 'regular', 'pto', 'paid_break', or 'unpaid_break'. Additional types may be added in the future. _(See note below)_ |
| **billable**<br/>read-write | _Boolean_ | true or false. Indicates whether this jobcode is billable or not. |
| **billable_rate**<br/>read-write | _Float_ | Dollar amount associated with this jobcode for billing purposes. Only effective if billable is _true_. |
| **has_children**<br/>read-only | _Boolean_ | true or false. If true, there are jobcodes that exist underneath this one, so this jobcode should be treated as a container or folder with children jobcodes underneath it. |
| **assigned_to_all**<br/>read-write | _Boolean_ | true or false. Indicates whether this jobcode is assigned to all employees or not. |
| **required_customfields**<br/>read-only | _Array_ | Ids of [customfields](#the-custom-field-object) that should be displayed when this jobcode is selected on a timecard. |
| **filtered_customfielditems**<br/>read-only | _Object_ | Displays which [customfielditems](#the-custom-field-item-object) should be displayed when this jobcode is chosen for a timesheet. Each property of the object is a customfield id with its value being an array of customfielditem id.  If none, an empty string is returned. |
| **active**<br/>read-write | _Boolean_ | If _true_, this jobcode is active. If _false_, this jobcode is archived. To archive a jobcode, set this field to _false_. When a jobcode is archived, any children underneath the jobcode are archived as well. Note that when you archive a jobcode, any jobcode assignments or customfield dependencies are removed.  To restore a jobcode, set this field to _true_. When a jobcode is restored, any parents of that jobcode are also restored. |
| **last_modified**<br/>read-only | _String_ | Date/time when this jobcode was last modified, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |
| **created**<br/>read-only | _String_ | Date/time when this jobcode was created, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |

<aside class="notice">
For the <code>short_code</code> property, if the Dial-in Add-on is installed, this field may only consist of numbers since it is used for jobcode selection from touch-tone phones.
</aside>

<aside class="notice">
For the <code>type</code> property:
<ul>
	<li>'pto' type jobcodes are used for PTO (Paid Time Off, i.e. Vacation, Holiday) time entries. They are only allowed with a `parent_id` of 0 (i.e. top-level).</li>
	<li>'paid_break' and 'unpaid_break' type jobcodes are used in conjunction with the Breaks Add-On. These types of jobcodes may not be created/edited via the API. They are managed via the Breaks Add-On.</li>
</ul>
</aside>
