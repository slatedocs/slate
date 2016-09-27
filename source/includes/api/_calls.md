# Calls
The Calls resource lets you make phone calls and view information about previous inbound and outbound calls.

## Properties
| Property             | Description                                                                                                                                                                                                                                                                                                                                                                                            |
|:---------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| id                   | The unique ID of the call.                                                                                                                                                                                                                                                                                                                                                                             |
| direction            | Call direction: values are `in` for an incoming call, `out` for an outgoing call                                                                                                                                                                                                                                                                                                                       |
| from                 | The phone number or SIP address that made the call. Phone numbers are in E.164 format (e.g. +15555555555) -or- SIP addresses (e.g. identify@domain.com).                                                                                                                                                                                                                                               |
| to                   | The phone number or SIP address that received the call. Phone numbers are in E.164 format (e.g. +15555555555) -or- SIP addresses (e.g. identify@domain.com).                                                                                                                                                                                                                                           |
| state                | The call state. Described below, values are started `rejected`, `active`, `completed`, `transferring`                                                                                                                                                                                                                                                                                                  |
| startTime            | Date when the call was created. Timestamp follows the ISO8601 format.                                                                                                                                                                                                                                                                                                                                  |
| activeTime           | Date when the call was answered. Timestamp follows the ISO8601 format.                                                                                                                                                                                                                                                                                                                                 |
| endTime              | Date when the call ended. Timestamp follows the ISO8601 format.                                                                                                                                                                                                                                                                                                                                        |
| callTimeout          | Determine how long should the platform wait for call answer before timing out in seconds (milliseconds).                                                                                                                                                                                                                                                                                               |
| callbackUrl          | The server URL where the call events related to the call will be sent.                                                                                                                                                                                                                                                                                                                                 |
| callbackHttpMethod   | Determine if the callback event should be sent via HTTP GET or HTTP POST. Values are `GET` or `POST` Default is `POST`                                                                                                                                                                                                                                                                                 |
| callbackTimeout      | Determine how long should the platform wait for callbackUrl's response before timing out (milliseconds).                                                                                                                                                                                                                                                                                               |
| fallbackUrl          | The server URL used to send the call events if the request to callbackUrl fails.                                                                                                                                                                                                                                                                                                                       |
| chargeableDuration   | The number of seconds the call will be billed for.                                                                                                                                                                                                                                                                                                                                                     |
| transferTo           | Phone number or SIP address that the call is going to be transferred to.                                                                                                                                                                                                                                                                                                                               |
| transferCallerId     | This is the caller id that will be used when the call is transferred. This parameter is only considered in transfer state. <br>- transferring an incoming call: allowed values are 1) "private" 2) the incoming call "from" number or 3) any Bandwidth number owned by user. <br>- transferring an outgoing call call: allowed values are 1) "private" or 2) any Bandwidth phone number owned by user. |
| whisperAudio         | Audio to be played to the caller that the call will be transferred to.                                                                                                                                                                                                                                                                                                                                 |
| bridgeId             | The id of the bridge where the call will be added.                                                                                                                                                                                                                                                                                                                                                     |
| bridge               | The URL of the bridge, if any, that contains the call.                                                                                                                                                                                                                                                                                                                                                 |
| conferenceId         | The id of the conference where the call will be added. This property is required if you want to add this call to a conference.                                                                                                                                                                                                                                                                         |
| conference           | The complete URL of the conference resource the call is associated with.                                                                                                                                                                                                                                                                                                                               |
| events               | The URL to retrieve the events related to the call.                                                                                                                                                                                                                                                                                                                                                    |
| recordingEnabled     | Indicates if the call should be recorded after being created. Set to `true` to enable. Default is `false`                                                                                                                                                                                                                                                                                              |
| recordingFileFormat  | The file format of the recorded call. Supported values are `wav` (default) and `mp3`.                                                                                                                                                                                                                                                                                                                  |
| recordingMaxDuration | Indicates the maximum duration of call recording in seconds. Default value is 1 hour.                                                                                                                                                                                                                                                                                                                  |
| transcriptionEnabled | Whether all the recordings for this call should be be automatically transcribed.                                                                                                                                                                                                                                                                                                                       |
| tag                  | Any string, it will be included in the callback events of the call.                                                                                                                                                                                                                                                                                                                                    |
| page                 | Used for pagination to indicate the page requested for querying a list of calls. If no value is specified the default is 0.                                                                                                                                                                                                                                                                            |
| size                 | Used for pagination to indicate the size of each page requested for querying a list of calls. If no value is specified the default value is 25 (maximum value 1000).                                                                                                                                                                                                                                   |
| sipHeaders           | Map of Sip headers prefixed by "X-". Up to 5 headers can be sent per call. Max length for header and value is 256 characters.                                                                                                                                                                                                                                                                          |

## Call State

| State        | Description                                         |
|:-------------|:----------------------------------------------------|
| started      | Call is created but not answered.                   |
| rejected     | Incoming call was rejected.                         |
| active       | Call is answered and isn’t completed.               |
| completed    | Call is finished.                                   |
| transferring | Transferring connects audio to a new outbound call. |

## GET calls

Gets a list of active and historic calls you made or received. Since this operation uses HTTP GET, all the properties are specified as HTTP request parameters.
### Supported Parameters

| Parameter    | Description                                                                                                                                                          | Mandatory |
|:-------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------|
| bridgeId     | The id of the bridge for querying a list of calls history (pagination do not apply).                                                                                 | No        |
| conferenceId | The id of the conference for querying a list of calls history (pagination do not apply).                                                                             | No        |
| from         | The number to filter calls that came from (must be either an E.164 formatted number, like +19195551212, or a valid SIP URI, like sip:someone@somewhere.com).         | No        |
| to           | The number to filter calls that was called to (must be either an E.164 formatted number, like +19195551212, or a valid SIP URI, like sip:someone@somewhere.com).     | No        |
| page         | Used for pagination to indicate the page requested for querying a list of calls. If no value is specified the default is 0.                                          | No        |
| size         | Used for pagination to indicate the size of each page requested for querying a list of calls. If no value is specified the default value is 25 (maximum value 1000). | No        |
| sortOrder    | How to sort the calls. Values are `asc` or `desc` If no value is specified the default value is `desc`                                                               | No        |

### Example: List your calls

```shell
curl -v -X GET  https://api.catapult.inetwork.com/v1/users/{user-id}/calls/ \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
```

```js
client.Call.list()
.then(function (response) {
	console.log(response);
});
```

```csharp
var calls = client.Call.List();
```

> The above command returns JSON structured like this:

```json
[
	{
		"id": "{callId1}",
		"direction": "out",
		"from": "{fromNumber}",
		"to": "{number}",
		"recordingEnabled": false,
		"callbackUrl": "",
		"state": "completed",
		"startTime": "2013-02-08T13:15:47.587Z",
		"activeTime": "2013-02-08T13:15:52.347Z",
		"endTime": "2013-02-08T13:15:55.887Z",
		"chargeableDuration": 60,
		"events": "https://.../calls/{callId1}/events",
		"sipHeaders" : {
				"X-Header-1" : "value-1",
				"X-Header-2" : "value2"
		}
	},
	{
		"id": "{callId2}",
		"direction": "out",
		"from": "{number}",
		"to": "{toNumber}",
		"recordingEnabled": false,
		"callbackUrl": "",
		"state": "active",
		"startTime": "2013-02-08T13:15:47.587Z",
		"activeTime": "2013-02-08T13:15:52.347Z",
		"events": "https://.../calls/{callId2}/events"
	}
]
```

### Example: List your calls by from number {fromNumber}

```shell
curl -v -X GET  https://api.catapult.inetwork.com/v1/users/{user-id}/calls?from=%2b19195551212 \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
```

```js
client.Call.list({
	from: "+19195551212"
})
.then(function (response) {
	console.log(response);
});

```
```csharp
var calls = client.Call.List(new CallQuery{From = "+19195551212"});
```

> The above command returns JSON structured like this:

```json
[
	{
		"id": "{callId1}",
		"direction": "out",
		"from": "{fromNumber}",
		"to": "{toNumber1}",
		"recordingEnabled": false,
		"callbackUrl": "",
		"state": "completed",
		"startTime": "2013-02-08T13:15:47.587Z",
		"activeTime": "2013-02-08T13:15:52.347Z",
		"endTime": "2013-02-08T13:15:55.887Z",
		"chargeableDuration": 60,
		"events": "https://.../calls/{callId1}/events"
	},
	{
		"id": "{callId2}",
		"direction": "out",
		"from": "{fromNumber}",
		"to": "{toNumber2}",
		"recordingEnabled": false,
		"callbackUrl": "",
		"state": "active",
		"startTime": "2013-02-08T13:15:47.587Z",
		"activeTime": "2013-02-08T13:15:52.347Z",
		"events": "https://.../calls/{callId2}/events"
	}
]
```

## POST calls
Creates a new outbound phone call.

### Supported Parameters

| Parameter            | Description                                                                                                                                  | Mandatory |
|:---------------------|:---------------------------------------------------------------------------------------------------------------------------------------------|:----------|
| from                 | A Bandwidth phone number on your account the call should come from (must be in E.164 format, like `+19195551212`).                           | Yes       |
| to                   | The number to call (must be either an E.164 formatted number, like `+19195551212`, or a valid SIP URI, like `sip:someone@somewhere.com`).    | Yes       |
| callTimeout          | Determine how long should the platform wait for call answer before timing out in seconds.                                                    | No        |
| callbackUrl          | The full server URL where the call events related to the Call will be sent to.                                                               | No        |
| callbackTimeout      | Determine how long should the platform wait for callbackUrl’s response before timing out in milliseconds.                                    | No        |
| callbackHttpMethod   | Determine if the callback event should be sent via `HTTP GET` or `HTTP POST`. Values are `GET` or `POST` (if not set the default is `POST`). | No        |
| fallbackUrl          | The full server URL used to send the callback event if the request to callbackUrl fails.                                                     | No        |
| bridgeId             | The id of the bridge where the call will be added.                                                                                           | No        |
| conferenceId         | Id of the conference where the call will be added. This property is required if you want to add this call to a conference.                   | No        |
| recordingEnabled     | Indicates if the call should be recorded after being created. Set to `true` to enable. Default is `false`.                                   | No        |
| recordingMaxDuration | Indicates the maximum duration of call recording in seconds. Default value is 1 hour.                                                        | No        |
| recordingFileFormat  | The file format of the recorded call. Supported values are `wav` (default) and `mp3`.                                                        | No        |
| transcriptionEnabled | Whether all the recordings for this call is going to be automatically transcribed.                                                           | No        |
| tag                  | A string that will be included in the callback events of the call.                                                                           | No        |
| sipHeaders           | Map of Sip headers prefixed by `X-`. Up to 5 headers can be sent per call.                                                                   | No        |

### Example: Create an outbound phone call

<aside class="notice">
The call resource returned in the "Location" header can be modified to change the call (for example, play audio files, transfer to a different number, or hang up).
</aside>

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/calls \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d \
	'
	{
		"from": "{fromNumber}",
		"to": "{toNumber}"
	}'
```

```js
client.Call.create({
	from: "{fromNumber}",
	to: "{toNumber}"
})
.then(function (id) {
	console.log(id);
})
```
```csharp
var call = await client.Call.CreateAsync(new CreateCallData{
	From = "{fromNumber}",
	To = "{toNumber}"
});
```


### Example: Create call and start recording it

### Example: Create a call in a bridge

### Example: Create an outbound call with callback and fallback URL

### Example: Create an outbound call with tag property

### Example: Create an outbound call to a SIP URI

Make a call to a SIP URI:

<aside class="notice">
* The support is based on SIP RFC 3261.
* If the INVITE fails (receive a non-2xx final response), an event will be generated to the application indicating the call has hung up.
* SIPS is not currently supported.
</aside>

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/calls \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d \
	'
	{
		"from": "{fromNumber}",
		"to": "{sip:someone@somewhere.com:}",
		"sipHeaders": {
			"X-Header-1": "value1",
			"X-Header-2": "value2"
		}
	}'
```

```js
client.Call.create({
	from: "{fromNumber}",
	to: "{sip:someone@somewhere.com}",
	sipHeaders: {
		"X-Header-1": "value1",
		"X-Header-2": "value2"
	}
})
.then(function (id) {
	console.log(id);
})
```

```csharp
var call = await client.Call.CreateAsync(new CreateCallData{
	From = "{fromNumber}",
	To = "sip:someone@somewhere.com",
	SipHeaders = new Dictionary<string, string> {
		{"X-Header-1", "value1"},
		{"X-Header-2", "value2"}
	}
});
```

## GET calls/{callId}
Gets information about an active or completed call. No query parameters are supported.

### Example: Get Call Information

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/calls/{callId} \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
client.Call.get("{callId}")
.then(function (response) {
	console.log(respone);
});
```

```csharp
var call = await client.Call.GetAsync("{callId1}");
```


> The above command returns JSON structured like this:

```
{
		"activeTime": "2014-12-19T19:13:20Z",
		"callbackUrl": "https://example.com",
		"chargeableDuration": 60,
		"direction": "out",
		"endTime": "2014-12-19T19:13:22Z",
		"events": "https://.../calls/{callId}/events",
		"fallbackUrl": "https://example-fallback.com",
		"from": "{fromNumber}",
		"id": "{callId}",
		"recordingEnabled": false,
		"recordings": "https://.../calls/{callId}/recordings",
		"startTime": "2014-12-19T19:13:09Z",
		"state": "completed",
		"to": "{toNumber}",
		"transcriptionEnabled": true,
		"transcriptions": "https://.../calls/{callId}/transcriptions",
		"sipHeaders" : {
				"X-header" : "value"
		}
}
```

## POST calls/{callId}
Update properties of an active phone call.

### Supported Parameters

| Parameter           | Description                                                                                                                                                                                                                                                                                                                                                                                          | Mandatory |
|:--------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------|
| state               | The call state. Possible values: <br> `rejected` to reject not answer<br> `active` to answer the call<br>`completed` to hangup the call<br>`transferring` to start and connect call to a new outbound call.                                                                                                                                                                                          | No        |
| recordingEnabled    | Indicates if the call should be recorded. Values `true` or `false`. You can turn recording on/off and have multiple recordings on a single call.                                                                                                                                                                                                                                                     | No        |
| recordingFileFormat | The file format of the recorded call. Supported values are `wav` (default) and `mp3`.                                                                                                                                                                                                                                                                                                                | No        |
| transferTo          | Phone number or SIP address that the call is going to be transferred to.                                                                                                                                                                                                                                                                                                                             | No        |
| transferCallerId    | This is the caller id that will be used when the call is transferred. This parameter is only considered in transfer state.<br>- transferring an incoming call: allowed values are 1) `private` 2) the incoming call `from` number or 3) any Bandwidth number owned by user.<br>- transferring an outgoing call call: allowed values are 1) `private` or 2) any Bandwidth phone number owned by user. | No        |
| whisperAudio        | Audio to be played to the caller that the call will be transferred to. See /audio.                                                                                                                                                                                                                                                                                                                   | No        |
| callbackUrl         | The server URL where the call events for the new call will be sent upon transferring.                                                                                                                                                                                                                                                                                                                | No        |

### Example: Answer an Incoming Phone Call
### Example: Reject an Incoming Phone Call
### Example: Hang Up a Phone Call
### Example: Turn call recording ON
### Example: Turn call recording OFF
### Example: Transfer a call
### Example: Transfer a call using the caller Id of the party being transferred
### Example: Transfer a call and say something before bridging the calls
### Example: Transfer a call and say something before bridging the calls

## POST calls/{callId}/audio

Plays an audio file or speak a sentence in a phone call.

### Supported Parameters

| Parameter   | Description                                                                                                                                                                                                                                                                                                                                                                                     | Mandatory |
|:------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------|
| fileUrl     | The location of an audio file to play (WAV and MP3 supported).                                                                                                                                                                                                                                                                                                                                  | No        |
| sentence    | The sentence to speak.                                                                                                                                                                                                                                                                                                                                                                          | No        |
| gender      | The gender of the voice used to synthesize the sentence. It will be considered only if sentence is not null. The female gender will be used by default.                                                                                                                                                                                                                                         | No        |
| locale      | The locale used to get the accent of the voice used to synthesize the sentence. Currently audio supports: <br> - en\_US or en\_UK (English) <br> - es or es\_MX (Spanish) <br> - fr or fr\_FR (French) <br> - de or de\_DE (German) <br> - t or it\_IT (Italian) It will be considered only if sentence is not null/empty. The en\_US will be used by default.                                  | No        |
| voice       | The voice to speak the sentence. Audio currently supports the following voices: <br> - English US: Kate, Susan, Julie, Dave, Paul <br> - English UK: Bridget <br> - Spanish: Esperanza, Violeta, Jorge <br> - French: Jolie, Bernard <br> - German: Katrin, Stefan <br> - Italian: Paola, Luca It will be considered only if sentence is not null/empty. Susan’s voice will be used by default. | No        |
| loopEnabled | When value is `true` , the audio will keep playing in a loop. Default: `false`.                                                                                                                                                                                                                                                                                                                 | No        |
| tag         | A string that will be included in the events delivered when the audio playback starts or finishes.                                                                                                                                                                                                                                                                                              | No        |

### Example: Speak a Sentence

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/calls/{callId}/audio \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d \
	'
	{
		"gender": "female",
		"sentence": "Hello, thank you for calling.",
		"locale": "en_US",
		"voice": "julie"
	}'
```

```js
//Speak sentence with options
var options = {
	sentence : "hola de Bandwidth",
	gender   : "male",
	locale   : "es",
	voice    : "Jorge"
}
//Promise
client.Call.playAudioAdvanced("callId", options).then(function (res) {});

//Callback
client.Call.playAudioAdvanced("callId", options, function (err,res) {});

//Speak sentence in a call

//Promise
client.Call.speakSentence("callId", "Hello From Bandwidth").then(function (res) {});

//Callback
client.Call.speakSentence("callId", "Hello From Bandwidth", function (err, res) {});
```

```csharp
//Speak sentence with options
await client.Call.PlayAudioAsync("{callId1}", new PlayAudioData
{
	Sentence = "hola de Bandwidth",
	Gender = Genger.Male,
	Voice = "Jorge",
	Locale = "es"
});

//Speak sentence in a call
await client.Call.SpeakSentenceAsync("{callId1}", "Hello From Bandwidth");
```


### Example: Interrupt/stop a sentence from speaking.
```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/calls/{callId}/audio \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d '{"sentence": ""}'
```

```js
// coming soon
//Speak sentence in a call

//Promise
client.Call.speakSentence("callId", "").then(function (res) {});

//Callback
client.Call.speakSentence("callId", "", function (err, res) {});
```

```csharp
await client.Call.SpeakSentenceAsync("{callId1}", "");
```

### Example: Speak a Sentence with male gender voice
### Example: Speaking a sentence with a given locale, gender and voice.
### Example: Speaking a sentence with a break
### Example: Play an Audio File
```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/calls/{callId}/audio \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d '{"fileUrl": "http://example.com/audio.mp3"}'
```

```js
//Play Audio file on call

//Promise
client.Call.playAudioFile("callId", "http://myurl.com/file.mp3").then(function (res) {});

//Callback
client.Call.playAudioFile("callId", "http://myurl.com/file.wav", function (err, res) {});
```

```csharp
await client.Call.PlayAudioFileAsync("{callId1}", "http://myurl.com/file.wav");
```


### Example: Stop an Audio File Playing
```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/calls/{callId}/audio \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d '{"fileUrl": ""}'
```

```js
// coming soon in the mean time:
//Stop Audio file on bridge

//Promise
client.Call.playAudioFile("callId", "").then(function (res) {});

//Callback
client.Call.playAudioFile("callId", "", function (err, res) {});
```

```csharp
await client.Call.PlayAudioFileAsync("{callId1}", "");
```


## POST calls/{callId}/dtmf
Send DTMF (phone keypad digit presses).

### Supported Parameters

| Parameter | Description                                                 | Mandatory |
|:----------|:------------------------------------------------------------|:----------|
| dtmfOut   | String containing the DTMF characters to be sent in a call. | No        |

### Example: Send the digits "9193334444"

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/calls/{callId}/dtmf \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d '{"dtmfOut": "9193334444"}'
```

```js
// Promise
client.Call.sendDtmf(callId, "9193334444").then(function () {});
// Callback
client.Call.sendDtmf(callId, "9193334444", function (err) {});
```

```csharp
await client.Call.SendDtmfAsync("{callId1}", new SendDtmfData{DtmfOut = "9193334444"});
```

## GET calls/{callId}/events
Gets the events that occurred during the call. No query parameters are supported.

### Event Properties

| Property | Description                  | Mandatory |
|:---------|:-----------------------------|:----------|
| id       | The call event id.           | No        |
| time     | The time the event occurred. | No        |
| name     | The name of the event.       | No        |
| data     | Data about event.            | No        |

### Example: Get events for a call.

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/calls/{callId}/events \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
// Promise
client.Call.getEvents(callId).then(function (events) {});
// Callback
client.Call.getEvents(callId, function (err, events) {});
```

```csharp
var events = client.Call.GetEvents("{callId1}");
```


> The above command returns JSON structured like this:

```json
[
	{
		"id": "{callEventId1}",
		"time": "2012-09-19T13:55:41.343Z",
		"name": "create"
	},
	{
		"id": "{callEventId2}",
		"time": "2012-09-19T13:55:45.583Z",
		"name": "answer"
	},
	{
		"id": "{callEventId3}",
		"time": "2012-09-19T13:55:45.583Z",
		"name": "CHANNEL_EXECUTE",
		"data": "{\"applicationName\":\"park\"}"
	},
	{
		"id": "{callEventId4}",
		"time": "2012-09-19T13:55:51.283Z",
		"name": "CHANNEL_EXECUTE",
		"data": "{\"applicationName\":\"playback\",\"applicationData\":\"test.mp3\"}"
	},
	{
		"id": "{callEventId5}",
		"time": "2012-09-19T13:55:45.583Z",
		"name": "playback",
		"data": "start"
	},
	{
		"id": "{callEventId6}",
		"time": "2012-09-19T13:55:45.583Z",
		"name": "playback",
		"data": "done"
	},
	{
		"id": "{callEventId7}",
		"time": "2012-09-19T13:55:55.503Z",
		"name": "CHANNEL_EXECUTE_COMPLETE",
		"data": "{\"applicationName\":\"playback\",\"applicationData\":\"test.mp3\"}"
	},
	{
		"id": "{callEventId8}",
		"time": "2012-09-19T13:55:58.323Z",
		"name": "hangup",
		"data": "NORMAL_CLEARING"
	},
	{
		"id": "{callEventId9}",
		"time": "2012-09-19T13:55:58.343Z",
		"name": "CHANNEL_EXECUTE_COMPLETE",
		"data": "{\"applicationName\":\"playback\",\"applicationData\":\"test.mp3\"}"
	}
]
```

## GET calls/{callId}/events/{callEventId}

Gets information about one call event. No query parameters are supported.

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/calls/{callId}/events/{eventId} \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
// Promise
client.Call.getEvent(callId, eventId).then(function (callEvent) {});
// Callback
client.Call.getEvent(callId, eventId, function (err, callEvent) {});
```

```csharp
var callEvent = async client.Call.GetEventAsync("{callId1}", "{eventId1}");
```


> The above command returns JSON structured like this:

```
{
		"id": "ce-qg4vz6anrfogri7hhduqlgq",
		"time": 1419032854964,
		"name": "hangup",
		"data": ""
}
```

## GET calls/{callId}/recordings
Retrieve all recordings related to the call.

### Example: Get recordings for a call Id.

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/calls/{callId}/recordigns \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
// Promise
client.Call.getRecordings(callId).then(function (list) {});
// Callback
client.Call.getRecordings(callId, function (err, list) {});
```

```csharp
var recordings = client.Call.GetRecordings("{callId1}");
```


> The above command returns JSON structured like this:

```json
[
	{
		"endTime": "2013-02-08T12:06:55.007Z",
		"id": "{recordingId1}",
		"media": "https://.../v1/users/.../media/{callId}-1.wav",
		"call": "https://.../v1/users/.../calls/{callId}",
		"startTime": "2013-02-08T12:05:17.807Z",
		"state": "complete"
	},
	{
		"endTime": "2013-02-08T13:15:65.887Z",
		"id": "{recordingId2}",
		"media": "https://.../v1/users/.../media/{callId}-2.wav",
		"call": "https://.../v1/users/.../calls/{callId}",
		"startTime": "2013-02-08T13:15:55.887Z",
		"state": "complete"
	}
]
```

## GET calls/{callId}/transcriptions
Retrieve all transcriptions related to the call.

### Example: Retrieve all transcriptions related to the call.

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/calls/{callId}/transcriptions \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
// Promise
client.Call.getTranscriptions(callId).then(function (list) {});
// Callback
client.Call.getTranscriptions(callId, function (err, list) {});
```

```csharp
var transcriptions = client.Call.GetTranscriptions("{callId1}");
```

## POST calls/{callId}/gather
Collects a series of DTMF digits from a phone call with an optional prompt. This request returns immediately. When gather finishes, an event with the results will be posted to the callback URL.

### Supported Parameters

| Parameter          | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | Mandatory |
|:-------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------|
| maxDigits          | The maximum number of digits to collect, not including terminating digits (maximum 30).                                                                                                                                                                                                                                                                                                                                                                                             | No        |
| interDigitTimeout  | Stop gathering if a DTMF digit is not detected in this many seconds (default 5.0; maximum 30.0).                                                                                                                                                                                                                                                                                                                                                                                    | No        |
| terminatingDigits  | A string of DTMF digits that end the gather operation immediately if any one of them is detected (default “\#”; an empty string means collect all DTMF until maxDigits or the timeout).<br>Example:<br>`#` : The gather ends if \# is detected (this is the default behavior if the terminatingDigits property is not specified)<br>`0#*` : The gather ends if either 0, \#, or \* is detected<br>Don’t forget to encode keypad digits that have special meaning in a URL, like \#. | No        |
| tag                | A string you choose that will be included with the response and events for this gather operation.                                                                                                                                                                                                                                                                                                                                                                                   | No        |
| prompt.sentence    | The text to speak for the prompt (uses the call audio resource defaults). NOTE: encode special characters in the sentence.                                                                                                                                                                                                                                                                                                                                                          | No        |
| prompt.gender      | The gender to use for the voice reading the prompt sentence (uses the call audio resource defaults).                                                                                                                                                                                                                                                                                                                                                                                | No        |
| prompt.locale      | The language and region to use for the voice reading the prompt sentence (uses the call audio resource defaults).                                                                                                                                                                                                                                                                                                                                                                   | No        |
| prompt.loopEnabled | When value is true, the audio will keep playing in a loop. Default: false                                                                                                                                                                                                                                                                                                                                                                                                           | No        |
| prompt.bargeable   | Make the prompt (audio or sentence) bargeable (will be interrupted at first digit gathered). Default: true                                                                                                                                                                                                                                                                                                                                                                          | No        |
| prompt.fileUrl     | The location of an audio file to play (WAV and MP3 supported).                                                                                                                                                                                                                                                                                                                                                                                                                      | No        |

### Example: Play a prompt sentence
Play a prompt sentence, then wait until 5 digits are pressed. Stop gathering digits if * is pressed, or if 7 seconds pass with no digits pressed.

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/ \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
		-d \
	'
	{
		"maxDigits":"5",
		"terminatingDigits":"*",
		"interDigitTimeout":"7",
		"prompt": {
			"sentence": "Please enter your 5 digit code"
		}
	}'
```

```js
//Create Gather
//The gather ends if either 0, #, or * is detected
var options = 	{
	"maxDigits":"5",
	"terminatingDigits":"*",
	"interDigitTimeout":"7",
	"prompt": {
		"sentence": "Please enter your 5 digit code"
	}
};
//Promise
client.Call.createGather("callId", options).then(function(res) {});

//Callback
client.Call.createGather("callId", options, function(err, res) {});
```

```csharp
var gather = await client.Call.CreateGatherAsync("{callId1}", new CreateGatherData {
	MaxDigits = "5",
	TerminatingDigits = "*",
	InterDigitTimeout = "7",
	Prompt = new GatherPrompt {
		Sentence = "Please enter your 5 digit code"
	}
});
```


## GET calls/{callId}/gather/{gatherId}
Get the gather DTMF parameters and results.

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/calls/{callId}/gather/{gatherId} \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
client.Call.getGather("{callId}", "{gatherId}")
.then(function (res) {
  console.log(res);
});
```

```csharp
var gather = await client.Call.GetGatherAsync("{callId1}", "{gatherId1}");
```

> The above command returns JSON structured like this:

```
{
  "id": "{gatherId}",
  "state": "completed",
  "reason": "max-digits",
  "createdTime": "2014-02-12T19:33:56Z",
  "completedTime": "2014-02-12T19:33:59Z",
  "call": "https://api.catapult.inetwork.com/v1/users/{userId}/calls/{callId}",
  "digits": "123"
}
```

## POST calls/{callId}/gather/{gatherId}
Update the gather.
<aside class="notice">
The only update allowed is state:completed to stop the gather.
</aside>

### Example: Stop the gather DTMF

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/calls/{callId}/gather/{gatherId} \
  -u {token}:{secret} \
	-H "Content-type: application/json" \
    -d \
	'
	{
		"state": "completed"
	}'
```

```js
client.Call.completeGather("{callId}", "{gatherId}")
.then(function () {});
```

```csharp
await client.Call.UpdateGatherAsync("{callId1}", "{gatherId1}", new UpdateGatherData {State = CallGatherState.Completed});
```
