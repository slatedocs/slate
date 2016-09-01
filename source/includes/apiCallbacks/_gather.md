## Gather Event
The Bandwidth API generates a gather event when the gather command completes in a call.

### Properties
| Property  | Description                                                                                                                                                                                                                                                                                                                                                           |
|:----------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| eventType | The event type, value is gather.                                                                                                                                                                                                                                                                                                                                      |
| state     | The state of the gather. Value is completed.                                                                                                                                                                                                                                                                                                                          |
| digits    | The digits collected from user.                                                                                                                                                                                                                                                                                                                                       |
| reason    | <br> max-digits - The maximum number of digits specified for the gather com.<br> terminating-digit - The digit specified in the gather com was entered.<br> inter-digit-timeout - A timeout occurred indicating the maximum amount of time to wait between digits, or before the first digit was pressed.<br> hung-up - Call was hung up thus terminating the gather. |
| callId    | The call id associated with the event.                                                                                                                                                                                                                                                                                                                                |
| gatherId  | The gather event unique id.                                                                                                                                                                                                                                                                                                                                           |
| time      | Date/time of event. Timestamp follows the ISO8601 format (UTC).                                                                                                                                                                                                                                                                                                       |

```json
{
  "eventType": "string",
  "callId": "string",
  "gatherId": "string",
  "reason": "string",
  "state": "string",
  "digits": "string",
  "time": "date"
}
```

#### Example: Gather event completed because the max-digits were reached

```
POST http://[External server URL]
```

```json
{
	"eventType":"gather",
	"reason":"max-digits",
	"state":"completed",
	"digits":"25",
	"time":"2014-07-31T01:01:27Z",
	"callId":"{callId}",
	"gatherId":"{gatherId}"
}
```
