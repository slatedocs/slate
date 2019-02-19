## Create Notifications

Add one or more notifications.

### HTTP Request

<img src="../../images/post.png" alt="post"/><api>https://rest.tsheets.com/api/v1/notifications</api>

### Properties
_Pass an array of notification objects as the value to a 'data' property (see example)._

|                |             |             |
| -------------: | :---------: | ----------- |
| **message**<br/>required | _String_ | The message text of the notification. The maximum message length is 2000 characters. |
| **user_id**<br/>optional | _Int_ | Defaults to the requesting user (based on the Access Token). |

For a full list of the properties that may be set on a notification, see [the Notification object](#the-notification-object).

### Status Codes
Each notification that is created will come back with a `_status_code` and` _status_message` that will indicate whether the notification was created successfully. If there was a problem creating a notification, there may also be an additional field, `_status_extra`, which will contain more details about the failure.

|         |          |
| :-----: | :------- |
| <code class="level200">200</code> | OK. Notification was created successfully. |
| <code class="level400">417</code> | Expectation Failed. Something was wrong or missing with the properties supplied for this notification. See the `_status_extra` value for more detail. |

### General Notes
<ul>
	<li>Frequent notifications to the same device may overwrite each other. Some notifications in quick succession may not be delivered.</li>
	<li>Notifications are not guaranteed to be delivered. They are dependent on the device's notification provider.</li>
	<li>The actual delivery time is also dependent on the device's notification provider.</li>
</ul>

<aside class="notice">
Only administrators may create notifications for users other than themselves. Furthermore, administrators may only create notifications for users that belong to their company.
</aside>

<aside class="notice">
The maximum batch size is <i>50</i> notifications. If exceeded, a <code class="standout">413: Request entity too large</code> HTTP response will be returned.
</aside>

