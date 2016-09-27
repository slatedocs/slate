## Hangup Event
Bandwidth API sends this message to the application when the call ends.

### Properties
| Property  | Description                                                                                                                                                  |
|:----------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| eventType | The event type, value is hangup.                                                                                                                             |
| callId    | The call id associated with the event.                                                                                                                       |
| callUri   | The complete URL of the call resource for this event.                                                                                                        |
| from      | The phone number or SIP address that made the call. Phone numbers are in E.164 format (e.g. +15555555555) -or- SIP addresses (e.g. identify@domain.com).     |
| to        | The phone number or SIP address that received the call. Phone numbers are in E.164 format (e.g. +15555555555) -or- SIP addresses (e.g. identify@domain.com). |
| cause     | The cause of the hangup event, the value is NORMAL\_CLEARING.                                                                                                |
| time      | Date/time of event. Timestamp follows the ISO8601 format (UTC).                                                                                              |

```json
{
  "eventType": "string",
  "callId": "string",
  "callUri": "string",
  "from": "string",
  "to": "string",
  "cause": "string",
  "time": "date"
}
```

#### Example: Hangup Event

```
POST http://[External server URL]
```

```json
{
   "eventType":"hangup",
   "callId":"{callId}",
   "callUri": "https://api.catapult.inetwork.com/v1/users/{userId}/calls/{callId}",
   "from":"+13233326955",
   "to":"+13233326955",
   "cause":"NORMAL_CLEARING",
   "time":"2012-11-14T15:56:12.636Z"
}
```
