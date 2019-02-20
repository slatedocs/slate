## Update Schedule Events

Edit one or more schedule events.

### HTTP Request

<img src="../../images/put.png" alt="put"/><api>https://rest.tsheets.com/api/v1/schedule_events</api>

### Properties
_Pass an array of schedule event objects as the value to a 'data' property (see example)._

|                |             |             |
| -------------: | :---------: | ----------- |
| **id**<br/>required | _Int_ | Id of the Schedule Calendar Event. |
| **team_events**<br/>optional | _String_ | 'base' or 'instance'. Default is 'instance'. If 'instance' is specified, supplemental events that are created for multiple users will be returned as individual single events for each assigned user. If 'base' is specified, supplemental events that are created for multiple users will be returned as one combined event for all assignees. |

All other properties defined on a [schedule event object](#the-schedule-event-object) may be passed in to the request with a new value in order to change it. If the value passed in is the same as it was previously, or if a particular property is not passed in at all, it will be ignored.

### Status Codes
Each event that is edited will come back with a `_status_code` and `_status_message` that will indicate whether the event was edited successfully. If there was a problem editing the event, there may also be an additional field, `_status_extra`, which will contain more details about the failure.

|         |          |
| :-----: | :------- |
| <code class="level200">200</code> | OK. Event was edited successfully. |
| <code class="level200">201</code> | Fulfilled. Event was edited successfully and additional events that were edited as a result are included in the supplemental data section of the response. |
| <code class="level400">403</code> | Permission Denied. The requesting user did not have high enough manage schedule permissions to edit the event. |
| <code class="level400">417</code> | Expectation Failed. Something was wrong or missing with the properties supplied for this event. See the `_status_extra` value for more detail. |

 <aside class="notice">
The maximum batch size is <i>50</i> schedule events. If exceeded, a <code class="standout">413: Request entity too large</code> HTTP response will be returned.
</aside>

