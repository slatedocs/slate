## Incoming Call Event
Bandwidth API sends this message to the application when an incoming call arrives. For incoming call the callback set is the one related to the Application associated with the called number.

### Properties

| Property      | Description                                                                                                                                                  |
|:--------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| eventType     | The event type, value is incomingcall.                                                                                                                       |
| callId        | The call id associated with the event.                                                                                                                       |
| callUri       | The complete URL of the call resource for this event.                                                                                                        |
| from          | The phone number or SIP address that made the call. Phone numbers are in E.164 format (e.g. +15555555555) -or- SIP addresses (e.g. identify@domain.com).     |
| to            | The phone number or SIP address that received the call. Phone numbers are in E.164 format (e.g. +15555555555) -or- SIP addresses (e.g. identify@domain.com). |
| callState     | The state of the call, value is active.                                                                                                                      |
| applicationId | The id of the application associated with phone number for this this incoming call.                                                                          |
| time          | Date/time of event. Timestamp follows the ISO8601 format (UTC).                                                                                              |

```json
{
  "eventType": "string",
  "from": "string",
  "to": "string",
  "callId": "string",
  "callUri": "string",
  "callState": "string",
  "applicationId": "string",
  "time": "date"
}
```

#### Example: Incoming Call Event

```
POST http://[External server URL]
```

```json
{
   "eventType":"incomingcall",
   "from":"+13233326955",
   "to":"+13865245000",
   "callId":"{callId}",
   "callUri": "https://api.catapult.inetwork.com/v1/users/{userId}/calls/{callId}",
   "callState":"active",
   "applicationId":"{appId}",
   "time":"2012-11-14T16:21:59.616Z"
}
```
