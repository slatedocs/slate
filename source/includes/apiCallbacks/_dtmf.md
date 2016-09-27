## DTMF Event

Bandwidth API sends this message to the application when it receives number pad tone signals during a call.

### Properties
| Property  | Description                                                     |
|:----------|:----------------------------------------------------------------|
| eventType | The event type, value is `dtmf`.                                |
| callId    | The call id associated with the event.                          |
| callUri   | The complete URL of the call resource for this event.           |
| dtmfDigit | The digit pressed. Only a single digit is returned.             |
| time      | Date/time of event. Timestamp follows the ISO8601 format (UTC). |

```json
{
  "eventType": "string",
  "callId": "string",
  "callUri": "string",
  "dtmfDigit": "string",
  "time": "date"
}
```

#### Example: User pressed '5' key on keypad

```
POST http://[External server URL]
```

```json
{
   "eventType":"dtmf",
   "callId":"{callId}",
   "callUri": "https://api.catapult.inetwork.com/v1/users/{userId}/calls/{callId}",
   "dtmfDigit":"5",
   "time":"2012-11-14T15:56:09.276Z"
}
```
