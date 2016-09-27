# Transcriptions BETA
The Transcription resource lets you transcribe a voicemail recording. This resource can be either created automatically when the call property transcriptionEnabled is set to true, when call is created, or during the call by posting an event. The transcription is based on a call audio recording. By enabling/disabling call property recordingEnabled, a call can have more than one recording, so it's possible to have one or more transcriptions for each one of those recordings. When transcriptionEnabled is set to true all the recordings generated within that call are going to be transcribed, i.e, if you start to record a call, at any given time when the call is active, and then terminate the recording, the transcription resource will be automatically started for this recording; this process can happen many times.

<aside class="notice">
It is important to note that our transcription service has been specifically tuned to transcribe voicemail recordings. It will not perform accurately when used in other scenarios such as IVR or support conversation recording.
</aside>

<aside class="success">
If you are interested in using transcription for these use cases, please contact us at signup@bandwidth.com.
</aside>
## Properties
| Property           | Description                                                                                                                                                                       |
|:-------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| id                 | The unique id of the transcriptions resource.                                                                                                                                     |
| state              | The state of the transcription, `transcribing` `completed` `error`                                                                                                                |
| text               | The transcribed text.                                                                                                                                                             |
| time               | The date/time the transcription resource was created (UTC).                                                                                                                       |
| chargeableDuration | The seconds between activeTime and endTime for the recording; this is the time that is going to be used to charge the resource. Note: transcriptions is billed in 1 minute units. |
| textSize           | The size of the transcribed text. If the text is longer than 1000 characters it will be cropped; the full text can be retrieved from the url available at textUrl property.       |
| textUrl            | An url to the full text; this property is available regardless the textSize.                                                                                                      |

## POST recordings/{recording-id}/transcriptions
Request the transcription process to be started for the given recording id.

### Example: Start Transcription process

```shell
# Note: Body is empty
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/recordings/{recording-id}/transcriptions \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
		-d \
	'
	{

	}'
```

```js
// Promise
client.Recording.createTranscription(recordingId).then(function(transcription){});

// Callback
client.Recording.createTranscription(recordingId, function(err, transcription){});
```

```csharp
var transcription = await client.Transcription.CreateAsync("{recordingId}");
```

> The above command returns HTTP Header structured like this:

```
HTTP/1.1 201 Created
Location: /v1/users/{user-id}/recordings/{recording-id}/transcriptions/{transcription-id}
```


## GET recordings/{recording-id}/transcriptions/{transcription-id}
Get information about the transcription, regardless its state.

### Example: Get transcription properties

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/recordings/{recording-id}/transcriptions/{transcription-id} \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
// Promise
client.Recording.getTranscription(recordingId, transcriptionId).then(function(transcription){});

// Callback
client.Recording.getTranscription(recordingId, transcriptionId, function(err, transcription){});
```

```csharp
var transcriptions = client.Transcription.List();
```


> The above command returns JSON structured like this:

```
{
    "chargeableDuration": 11,
    "id": "{transcriptionId}",
    "state": "completed",
    "text": "Hey there, I was calling to talk about plans for this saturday. ",
    "textSize": 63,
    "textUrl": "https://api.catapult.inetwork.com/.../media/{transcriptionId}",
    "time": "2014-12-23T23:08:59Z"
}
```

## GET recordings/{recording-id}/transcriptions
Get all the transcriptions that were made for the given recodingId

### Example: Get all the transcriptions for a recording resource id

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/recordings/{recording-id}/transcriptions \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
// Promise
client.Recording.getTranscriptions(recordingId).then(function(transcriptions){});

// Callback
client.Recording.getTranscriptions(recordingId, function(err, transcriptions){});
```

```csharp
var transcription = await client.Transcription.GetAsync("{recordingId}", "{transcriptionId}");
```

> The above command returns JSON structured like this:

```json
[
    {
        "chargeableDuration": 60,
        "id": "{transcription-id}",
        "state": "completed",
        "time": "2014-10-09T12:09:16Z",
        "text": "{transcription-text}",
        "textSize": 3627,
        "textUrl": "{url-to-full-text}"
    },
    {
        "chargeableDuration": 60,
        "id": "{transcription-id}",
        "state": "completed",
        "text": "{transcription-text}",
        "time": "2014-10-09T14:04:44Z",
        "textSize": 72,
        "textUrl": "{url-to-full-text}"
    }
]
```
