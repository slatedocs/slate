## Conference Event
Bandwidth API sends this event to the application when a conference is created or completed.

### Properties
| Property      | Description                                                                 |
|:--------------|:----------------------------------------------------------------------------|
| eventType     | The event type, value is `conference`.                                      |
| conferenceId  | The conference id associated with the event.                                |
| conferenceUri | The full URL of the conference resource for this event.                     |
| status        | Values are `created` or `completed`.                                        |
| createdTime   | Date/time conference created. Timestamp follows the ISO8601 format (UTC).   |
| completedTime | Date/time conference completed. Timestamp follows the ISO8601 format (UTC). |

```json
{
    "conferenceId": "string",
    "conferenceUri": "string",
    "eventType": "string",
    "status": "string",
    "createdTime": "date",
    "completedTime": "date"
}
```

#### Example: Conference created event

```
POST http://[External server URL]
```

```json
{
    "conferenceId": "{conferenceId}",
    "conferenceUri": "https://api.catapult.inetwork.com/v1/users/{userId}/conferences/{conferenceId}",
    "eventType":"conference",
    "status":"created",
    "createdTime":"2013-07-12T16:26:55.685-02:00"
}
```

#### Example: Conferenece completed event

```
POST http://[External server URL]
```

```json
{
    "conferenceId": "{conferenceId}",
    "conferenceUri": "https://api.catapult.inetwork.com/v1/users/{userId}/conferences/{conferenceId}",
    "eventType":"conference",
    "status":"completed",
    "createdTime":"2013-07-12T16:29:32.521-02:00",
    "completedTime":"2013-07-12T16:45:10.103-02:00"
}
```
