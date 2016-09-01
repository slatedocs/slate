## Recording Event
Bandwidth API sends this event to the application when an the recording media file is saved or an error occurs while saving it.

### Properties

| Property     | Description                                                                    |
|:-------------|:-------------------------------------------------------------------------------|
| eventType    | The event type, value is recording.                                            |
| state        | The state of the recording, callback event values are complete or error.       |
| status       | The state of the recording, callback event values are complete or error.       |
| callId       | The call id associated with the event.                                         |
| recordingId  | The unique id of the recording resource.                                       |
| recordingUri | The full URL of the recording resource.                                        |
| startTime    | Date/time the recording started. Timestamp follows the ISO8601 format (UTC).   |
| endTime      | Date/time the recording completed. Timestamp follows the ISO8601 format (UTC). |

```json
{
  "callId": "string",
  "eventType": "string",
  "recordingId": "string",
  "recordingUri": "string",
  "state": "string",
  "status": "string",
  "startTime": "date",
  "endTime": "date"
}
```

#### Example: Recording media file saved and available

```
POST http://[External server URL]
```

```json
{
   "callId": "{callId}",
   "eventType": "recording",
   "recordingId": "{recordingId}",
   "recordingUri": "https://api.catapult.inetwork.com/v1/users/{userId}/recordings/{recordingId}",
   "status": "complete",
   "startTime": "2013-08-19T16:56:57.643Z",
   "endTime": "2013-08-19T16:57:08.712Z"
}
```

#### Example: Recording media file saving failed

```
POST http://[External server URL]
```

```json
{
   "callId": "{callId}",
   "eventType": "recording",
   "recordingId": "{recordingId}",
   "recordingUri": "https://api.catapult.inetwork.com/v1/users/{userId}/recordings/{recordingId}",
   "status": "error",
   "startTime": "2013-08-19T16:56:57.643Z",
   "endTime": "2013-08-19T16:57:08.712Z"
}
```
