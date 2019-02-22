# Reminders

## The Reminder Object

 > **Example**

```json
{
  "id": 72595,
  "reminder_type": "clock-in",
  "due_time": "23:00:00",
  "due_days_of_week": "Mon,Tue,Thu,Fri",
  "distribution_methods": "Push,SMS",
  "active": true,
  "enabled": true,
  "last_modified": "2018-07-15T19:33:57+00:00",
  "created": "2018-07-15T19:08:33+00:00",
  "user_id": 0
}
```

Following is a list of the properties that belong to a reminder object, and a description of each.

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>read-only | _Int_ | Id of reminder. |
| **user_id**<br/>read-only | _Int_ | Id of the user that this reminder pertains to. A `user_id` of _0_ indicates that this is a company-wide reminder. |
| **reminder_type**<br/>read-write | _String_ | The type of this reminder object. Supported reminder_types are 'clock-in' and 'clock-out'. |
| **due_time**<br/>read-write | _String_ | The 24-hour time that the reminder should be sent, expressed as 'hh:mm:ss'. The time should be in the recipient user's local time and must be in even 5 minute increments. For example: '13:45:00' or '08:00:00'. |
| **due_days_of_week**<br/>read-write | _String_ | A comma-separated list of the days of the week when the reminder should be sent. The value can be any combination of 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri' and 'Sat'. For example: 'Mon,Tue,Wed,Thu,Fri' or 'Tue,Sat'. |
| **distribution_methods**<br/>read-write | _String_ | A comma-separated list of the transport method(s) indicating how the reminder message should be sent. The value can be any combination of 'Push', 'SMS' and 'Email'. For example: 'Push,SMS'. The 'Push' method utilizes the TSheets mobile app to deliver the notification to a mobile device. |
| **active**<br/>read-write | _Boolean_ | If true, this reminder is active and will be evaluated at the 'due_time' and 'due_days_of_week'. If false, this reminder is inactive and will not be evaluated. If `active`=_false_ for user-specific reminders, then the company-wide reminder of the same reminder type will apply. |
| **enabled**<br/>read-write | _Boolean_ |  If _true_, the reminder is enabled and will be sent at the 'due_time' and 'due_days_of_week'. If _false_, the reminder is disabled and will not be sent. A user with an active (`active` = _true_), but disabled (`enabled` = _false_) reminder will not receive that reminder type regardless of how company-wide reminders are configured. |
| **last_modified**<br/>read-only | _String_ | Date/time when this reminder was last modified, in ISO 8601 format ('YYYY-MM-DDThh:mm:ss±hh:mm') |
| **created**<br/>read-only | _String_ | Date/time when this reminder was created, in ISO 8601 format ('YYYY-MM-DDThh:mm:ss±hh:mm') |

