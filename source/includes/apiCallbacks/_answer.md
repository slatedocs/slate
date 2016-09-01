## Answer Event
Bandwidth API sends this message to the application when the call is answered.

### Properties
| Property  | Description                                                                                                                                                  |
|:----------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| eventType | The event type, value is `answer`.                                                                                                                           |
| to        | The phone number or SIP address that received the call. Phone numbers are in E.164 format (e.g. +15555555555) -or- SIP addresses (e.g. identify@domain.com). |
| from      | The phone number or SIP address that made the call. Phone numbers are in E.164 format (e.g. +15555555555) -or- SIP addresses (e.g. identify@domain.com).     |
| callState | The call state. Value will be `active`.                                                                                                                      |
| callId    | The call id associated with the event.                                                                                                                       |
| callUri   | The full URL of the call resource for this event.                                                                                                            |
| tag       | String provided when call created.                                                                                                                           |
| time      | Date when the event occurred. Timestamp follows the ISO8601 format (UTC).                                                                                    |

```json
{
	"eventType":"string",
	"from":"string",
	"to":"string",
	"callId":"string",
	"callUri": "string",
	"callState":"string",
	"time":"date"
}
```

#### Example: Basic answer event

```
POST http://[External server URL]
```

```json
{
	"eventType":"answer",
	"from":"+15753222083",
	"to":"+13865245000",
	"callId":"{call-id}",
	"callUri": "https://api.catapult.inetwork.com/v1/users/{user-id}/calls/{call-id}",
	"callState":"active",
	"time":"2012-11-14T16:28:31.536Z"
}
```

#### Example: Answer event with tag property

```
POST http://[External server URL]
```
```json
{
	"eventType":"answer",
	"from":"+15753222083",
	"to":"+13865245000",
	"callId":"{call-id}",
	"callUri": "https://api.catapult.inetwork.com/v1/users/{user-id}/calls/{call-id}",
	"callState":"active",
	"time":"2012-11-14T16:29:35.427Z",
	"tag":"example-tag"
}
```
