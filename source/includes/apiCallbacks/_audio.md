## Audio File Playback Events

Bandwidth API sends this message to the application when audio file playback is started or done playing.

### Properties
| Property  | Description                                                               |
|:----------|:--------------------------------------------------------------------------|
| eventType | The event type, value is `playback`.                                      |
| status    | Values are `started` or `done`.                                           |
| callId    | The call id associated with the event.                                    |
| callUri   | The full URL of the call resource for this event.                         |
| tag       | String provided when playback started.                                    |
| time      | Date when the event occurred. Timestamp follows the ISO8601 format (UTC). |

```json
{
  "eventType": "string",
  "callId": "string",
  "callUri": "string",
  "status": "string",
  "time": "date",
  "tag": "string"
}
```

#### Example: Audio Playback Event - Started

```
POST http://[External server URL]
```

```json
{
   "eventType":"playback",
   "callId":"{callId}",
   "callUri": "https://api.catapult.inetwork.com/v1/users/{userId}/calls/{callId}",
   "status":"started",
   "time":"2012-11-14T15:56:05.896Z"
}
```

#### Example: Audio Playback Event - Done Playing

```
POST http://[External server URL]
```

```json
{
   "eventType":"playback",
   "callId":"{callId}",
   "callUri": "https://api.catapult.inetwork.com/v1/users/{userId}/calls/{callId}",
   "status":"started",
   "time":"2012-11-14T15:56:05.896Z"
}
```
