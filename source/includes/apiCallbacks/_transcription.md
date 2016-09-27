## Transcription Event – BETA

Bandwidth API sends this event to the application when a transcription is terminated or an error occurs while processing it.

### Properties
| Property         | Description                                                           |
|:-----------------|:----------------------------------------------------------------------|
| eventType        | The event type, value is `transcription`.                             |
| transcriptionId  | The unique id of the transcription.                                   |
| state            | The state of the transcription, values are `completed` or `error`     |
| status           | The state of the transcription, values are `completed` or `error`     |
| textSize         | Total character count of text.                                        |
| text             | The first 1026 characters of the text of the completed transcription. |
| textUrl          | The full URL of the entire text content of the transcription.         |
| transcriptionUri | The full URL of the transcription resource.                           |

```json
{
   "transcriptionUri":"string",
   "textSize":"integer",
   "text":"string",
   "status":"string",
   "textUrl":"string",
   "recordingId":"string",
   "state":"string",
   "eventType":"string",
   "transcriptionId":"string"
}
```

#### Example: Transcription completed and available

```
POST http://[External server URL]
```

```json
{
    "eventType":"transcription",
    "transcriptionUri":"https://api.catapult.inetwork.com/v1/users/{userId}/recordings/{recordingId}/transcriptions/{transcriptionId}",
    "textSize":3627,
    "text":"I\u0027m this program is brought to you by Stanford University, please visit us at Stanford dot Edu. I\u0027m honored to be with you today for your commencement from one of the finest universities in the world through the fetal. I never graduated from college and this is the closest I\u0027ve never gotten to a college graduation today. I want to tell you three stories from my life, that\u0027s it no big deal. Just three stories. The first story is about connecting the dots. I dropped out of college after the first six months, but then stayed around is a drop in for another 18 months or so before I really quit. So why I dropped out it started before I was born my biological mother was a young man a graduate student and she decided to put up for adoption. She feels very strongly that I should be adopted by college graduates. So everything was all set for me to be adopted birth by a lawyer and his wife, except when I popped out they decided at the last minute that they really want a girl. So my parents who a ...",
    "status":"completed",
    "textUrl":"https://api.catapult.inetwork.com/v1/users/{userId}/media/{transcriptionId}",
    "recordingId":"{recordingId}",
    "state":"completed",
    "transcriptionId":"{transcriptionId}"
}
```

#### Example: Error generating transcription

```
POST http://[External server URL]
```

```json
{
    "eventType":"transcription",
    "status":"error",
    "recordingId":"{recordingId}",
    "state":"error",
    "transcriptionId":"{transcriptionId}"
}
```
