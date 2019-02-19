# Notifications

## The Notification Object

Following is a list of the properties that belong to a notification, and a description of each.

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>read-only | _Int_ | Id of notification. |
| **user_id**<br/>read-write | _Int_ | User id for the user that this notification will be sent to. |
| **msg_tracking_id**<br/>read-only | _String_ | A GUID string used for additional tracking. |
| **message**<br/>read-write | _String_ | The message text of the notification. The maximum message length is 2000 characters. |
| **method**<br/>read-write | _String_ | The transport method of the notification. We support 'push', 'email', and 'dashboard'. The 'push' method utilizes the TSheets mobile app to deliver the notification to a mobile device. The 'email' method sends an Email to the user (if they have an Email address). The 'dashboard' method utilizes the TSheets web dashboard notification queue to deliver a notification to the user. They will only see this when they're logged in to the TSheets web app. |
| **precheck**<br/>read-write | _String_ | The precheck macro name. Supported macros are 'on_the_clock', 'off_the_clock', and 'none'. The 'on_the_clock' macro will first check if the recipient is on the clock before sending and if not, will discard the notification. The 'off_the_clock' macro will first check if the recipient is off the clock (and not on PTO) before sending and if not, will discard the notification. The 'none' macro (the default) will not perform any checks before sending. |
| **delivery_time**<br/>read-write | _String_ | Date/time when this notification will be delivered, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`). Defaults to the current time. |
| **created**<br/>read-only | _String_ | Date/time when this notification was created, in ISO 8601 format (`YYYY-MM-DDThh:mm:ss±hh:mm`) |

