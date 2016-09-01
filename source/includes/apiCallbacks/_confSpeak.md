## Conference Speak Event

Bandwidth API sends this message to the application when text-to-speech speaking has started or is done (stopped) in a conference. Note:— For speak event in conference member, use the call speak event.

### Properties
| Property      | Description                                                     |
|:--------------|:----------------------------------------------------------------|
| eventType     | The event type, value is `conference-speak`.                    |
| conferenceId  | The conference id associated with the event.                    |
| conferenceUri | The full URL of the conference resource for this event.         |
| status        | Values are `started` or `done`.                                 |
| time          | Date/time of event. Timestamp follows the ISO8601 format (UTC). |

```json
{
    "eventType":"string",
    "conferenceId":"string",
    "conferenceUri":"string",
    "status":"string",
    "time":"date"
}
```

#### Example: Text-to-speech in a conference has started

```
POST http://[External server URL]
```

```json
{
    "eventType":"conference-speak",
    "conferenceId":"{conferenceId}",
    "conferenceUri": "https://api.catapult.inetwork.com/v1/users/{userId}/conferences/{conferenceId}",
    "status":"started",
    "time":"2013-07-12T21:18:19.966Z"
}
```

#### Example: Text-to-speech in a conference is done

```
POST http://[External server URL]
```

```json
{
    "eventType":"conference-speak",
    "conferenceId":"{conferenceId}",
    "conferenceUri": "https://api.catapult.inetwork.com/v1/users/{userId}/conferences/{conferenceId}",
    "status":"done",
    "time":"2013-07-12T21:18:19.966Z"
}
```
