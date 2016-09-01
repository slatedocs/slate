## Reject Event
Bandwidth API sends this message to the application when the call is rejected.

### Properties

| Property  | Description                                                                                                                                                  |
|:----------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| eventType | The event type, value is `hangup`.                                                                                                                           |
| callId    | The call id associated with the event.                                                                                                                       |
| callUri   | The complete URL of the call resource for this event.                                                                                                        |
| from      | The phone number or SIP address that made the call. Phone numbers are in E.164 format (e.g. +15555555555) -or- SIP addresses (e.g. identify@domain.com).     |
| to        | The phone number or SIP address that received the call. Phone numbers are in E.164 format (e.g. +15555555555) -or- SIP addresses (e.g. identify@domain.com). |
| cause     | The cause of the hangup event, the value is `CALL_REJECTED`.                                                                                                 |
| time      | Date/time of event. Timestamp follows the ISO8601 format (UTC).                                                                                              |

```json
{
   "eventType":"string",
   "from":"string",
   "to":"string",
   "callId":"string",
   "callUri": "string",
   "callState":"string",
   "cause":"string",
   "time":"date"
}
```

#### Reject Event

```
POST http://[External server URL]
```

```json
{
   "eventType":"hangup",
   "from":"+15302987472",
   "to":"+12702380149",
   "callId":"{callId}",
   "callUri":"https://api.dev.catapult.inetwork.com/v1/users/{userId}/calls/{callId}",
   "callState":"completed",
   "cause":"CALL_REJECTED",
   "time":"2014-04-23T11:53:43-03"
}
```
