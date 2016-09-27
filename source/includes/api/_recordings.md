# Recordings
Retrieve information about call recordings. The recording information retrieved by GET method contains only textual data related to call recording as described on Properties section. To properly work with recorded media content such as download and removal of media file, please access /media documentation. To learn about how to transcribe recordings, read the /recordings/{id}/transcriptions documentation.

## Properties

| Property  | Description                                                                                                                                                               |
|:----------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| id        | The unique id of the recordings resource.                                                                                                                                 |
| startTime | Date/time when the recording started. Timestamp follows the ISO8601 format (UTC).                                                                                         |
| endTime   | Date/time when the recording ended. Timestamp follows the ISO8601 format (UTC).                                                                                           |
| call      | The complete URL to the call resource this recording is associated with.                                                                                                  |
| media     | The complete URL to the media resource this recording is associated with.                                                                                                 |
| state     | The state of the recording, values are <br> `recording` <br> *`complete`<br> *`saving` <br> *`error`                                                                      |
| page      | Used for pagination to indicate the page requested for querying a list of recordings. If no value is specified the default is 0.                                          |
| size      | Used for pagination to indicate the size of each page requested for querying a list of recordings. If no value is specified the default value is 25. (Maximum value 1000) |

## Recording States
| State     | Description                                                    |
|:----------|:---------------------------------------------------------------|
| recording | Recording is currently active.                                 |
| saving    | Recording is complete but it is not available to download yet. |
| error     | Recording could not be uploaded.                               |
| complete  | Recording complete and available for downloading or playing.   |

## GET recordings
List all users' call recordings. Since this operation uses HTTP GET, all the properties are specified as HTTP request parameters.

### Supported Parameters
| Parameter | Description                                                                                                                                                 | Mandatory |
|:----------|:------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------|
| page      | Used for pagination to indicate the page requested for querying a list. If no value is specified the default is 0.                                          | No        |
| size      | Used for pagination to indicate the size of each page requested for querying a list. If no value is specified the default value is 25. (Maximum value 1000) | No        |

### Example: List all recordings

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/recordings \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
//Promise
client.Recording.list({}).then(function (recordings) {});

//Callback
client.Recording.list({}, function (err, recordings) {
	if (err) { console.log(err); }
	else {
		console.log(recordings);
	}
});
```

```csharp
var recordings = client.Recording.List();
```

> The above command returns JSON structured like this:

```json
[
{
    "endTime": "2013-02-08T13:17:12.181Z",
    "id": "{recordingId1}",
    "media": "https://.../v1/users/.../media/{callId1}-1.wav",
    "call": "https://.../v1/users/.../calls/{callId1}",
    "startTime": "2013-02-08T13:15:47.587Z",
    "state": "complete"
  },
  {
    "endTime": "2013-02-08T14:05:15.587Z",
    "id": "{recordingId2}",
    "media": "https://.../v1/users/.../media/{callId1}-2.wav",
    "call": "https://.../v1/users/.../calls/{callId1}",
    "startTime": "2013-02-08T14:03:47.587Z",
    "state": "complete"
  },
  {
    "endTime": "2013-02-08T13:34:07.507Z",
    "id": "{recordingId3}",
    "media": "https://.../v1/users/.../media/{callId2}-1.wav",
    "call": "https://.../v1/users/.../calls/{call2}",
    "startTime": "2013-02-08T13:28:47.587Z",
    "state": "complete"
  }
]
```

## GET recordings/{recordingId}
Retrieve a specific call recording information in JSON format, identified by recordingId. For more details on how to retrieve the recorded media file, please access Media documentation.

### Example: Get recording properties

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/recordings/{recordingId} \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
//Promise
client.Recording.get("{recordingId}")
.then(function (recording) {
	console.log(recording);
});

//Callback
client.Recording.get("{recordingId}", function (err, recording) {
	if(err) { console.log(err); }
	else {
		console.log(recording);
	}
});
```

```csharp
var recording = await client.Recording.GetAsync("{recordingId}");
```


> The above command returns JSON structured like this:

```
{
  "endTime": "2013-02-08T13:17:12.181Z",
  "id": "{recordingId}",
  "media": "https://.../v1/users/.../media/c-bonay3r4mtwbplurq4nkt7q-1.wav",
  "call": "https://.../v1/users/.../calls/{callId}",
  "startTime": "2013-02-08T13:15:47.587Z",
  "state": "complete"
}
```
