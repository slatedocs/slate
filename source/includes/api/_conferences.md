# Conferences
The Conference resource allows you create conferences, add members to it, play audio, speak text, mute/unmute members, hold/unhold members and other things related to conferencing. Once a conference is created there is no timeout associated with it, i.e., the conference will stay in created state until it is explicitly terminated. After the last member of a conference is removed from it, the conference will be set automatically as completed.

## Conference Properties

| Property           | Description                                                                                                                                                 |
|:-------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------|
| id                 | The unique id of a conference.                                                                                                                              |
| state              | Conference state. Possible state values are described below.                                                                                                |
| from               | The phone number that will host the conference.                                                                                                             |
| createdTime        | The time that the Conference was created (UTC).                                                                                                             |
| completedTime      | The time that the Conference was completed (UTC).                                                                                                           |
| activeMembers      | The number of active conference members.                                                                                                                    |
| hold               | If `true`, all member can’t hear or speak in the conference. If `false”, all members can hear and speak in the conference (unless set at the member level). |
| mute               | If `true`, all member can’t speak in the conference. If `false`, all members can speak in the conference (unless set at the member level).                  |
| callbackUrl        | The complete URL where the events related to the Conference will be sent to.                                                                                |
| callbackHttpMethod | Determine if the callback event should be sent via `HTTP GET` or `HTTP POST`. Values are `GET` or `POST`, default: `POST`.                                  |
| callbackTimeout    | Determine how long should the platform wait for callbackUrl’s response before timing out in milliseconds.                                                   |
| fallbackUrl        | The URL used to send the callback event if the request to callbackUrl fails.                                                                                |
| tag                | A string that will be included in the callback events of the conference.                                                                                    |

## Conference States

| State     | Description                                                                                                                                      |
|:----------|:-------------------------------------------------------------------------------------------------------------------------------------------------|
| created   | Conference was created and has no members.                                                                                                       |
| active    | Conference was created and has one or more ACTIVE members. As soon as the first member is added to a conference, the state is changed to active. |
| completed | The conference was completed. Once the conference is completed, It can not be used anymore.                                                      |

## Conference Member Properties

| Property    | Description                                                                                                                             |
|:------------|:----------------------------------------------------------------------------------------------------------------------------------------|
| id          | The unique id of a member.                                                                                                              |
| state       | The state of the member in the conference, values are `active` or `completed`.                                                          |
| mute        | If `true`, the member can’t speak in the conference, but can hear audio. If “false”, the member can speak in the conference.            |
| hold        | If `true`, member can’t hear the conference. If `false`, the member can hear the conference.                                            |
| joinTone    | If `true`, will play a tone when the member joins the conference. If `false`, no tone is played when the member joins the conference.   |
| leavingTone | If `true`, will play a tone when the member leaves the conference. If `false`, no tone is played when the member leaves the conference. |
| addedTime   | Date and time when the member was added to the conference (UTC).                                                                        |
| removedTime | Date and time when the member was removed to the conference (UTC).                                                                      |
| call        | The URL of the call resource for this member.                                                                                           |

## POST conferences
Creates a conference with no members.

### Supported Parameters

| Parameter          | Description                                                                                                                | Mandatory |
|:-------------------|:---------------------------------------------------------------------------------------------------------------------------|:----------|
| from               | The phone number that will host the conference.                                                                            | Yes       |
| callbackUrl        | The complete URL where the events related to the Conference will be sent to.                                               | No        |
| callbackHttpMethod | Determine if the callback event should be sent via `HTTP GET` or `HTTP POST`. Values are `get` or `post`, default: `post`. | No        |
| callbackTimeout    | Determine how long should the platform wait for callbackUrl’s response before timing out in milliseconds.                  | No        |
| fallbackUrl        | The URL used to send the callback event if the request to callbackUrl fails.                                               | No        |
| tag                | A string that will be included in the callback events of the conference.                                                   | No        |

### Example: Create conference

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/conferences \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d \
	'
	{
		"from": "{number}"
	}'
```

```js
// Promise
client.Conference.create({from: "+1234567890"}).then(function(conference){});
// Callback
client.Conference.create({from: "+1234567890"}, function(err, conference){});
```

> The above command returns HTTP Header structured like this:

```
HTTP/1.1 201 CREATED
Location: /v1/users/{userId}/conferences/{conferenceId}
```

### Example: Create conference with callback and fallback and 2 seconds callback's timeout

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/ \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d \
	'
	{
		"from": "{number}",
		"callbackUrl":"http://my.callback.url",
		"callbackTimeout":"2000",
		"fallbackUrl":"http://my.fallback.url"
	}'
```

```js
var params = {
	"from": "{number}",
	"callbackUrl":"http://my.callback.url",
	"callbackTimeout":"2000",
	"fallbackUrl":"http://my.fallback.url"
};

// Promise
client.Conference.create(params).then(function(conference){});
// Callback
client.Conference.create(params, function(err, conference){});
```

> The above command returns HTTP Header structured like this:

```
HTTP/1.1 201 CREATED
Location: /v1/users/{userId}/conferences/{conferenceId}
```

## GET conferences/{conferenceId}
Retrieve current properties for a conference.

### Example: Get conference

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/conferences/{conferenceId} \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
// Promise
client.Conference.get("conferenceId").then(function(conference){});
// Callback
client.Conference.get("conferenceId", function(err, conference){});
```

> The above command returns JSON structured like this:

```
{
		"activeMembers": 0,
		"createdTime": "2013-07-12T15:22:47-02",
		"from": "+19703255647",
		"id": "{conferenceId}",
		"state": "created"
}
```

## POST conferences/{conferenceId}
Change the conference properties and/or status.

### Supported Parameters

| Parameter          | Description                                                                                                                                                 | Mandatory |
|:-------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------|
| state              | Conference state. Possible state values are: `completed` to terminate the conference.                                                                       | No        |
| hold               | If `true`, all member can’t hear or speak in the conference. If `false`, all members can hear and speak in the conference (unless set at the member level). | No        |
| mute               | If `true`, all member can’t speak in the conference. If `false`, all members can speak in the conference (unless set at the member level).                  | No        |
| callbackUrl        | The complete URL where the events related to the Conference will be sent to.                                                                                | No        |
| callbackHttpMethod | Determine if the callback event should be sent via HTTP GET or HTTP POST. Values are `get` or `post`, default: `post`.                                      | No        |
| callbackTimeout    | Determine how long should the platform wait for callbackUrl’s response before timing out in milliseconds.                                                   | No        |
| fallbackUrl        | The URL used to send the callback event if the request to callbackUrl fails.                                                                                | No        |
| tag                | A string that will be included in the callback events of the conference.                                                                                    | No        |


### Example: Terminate Conference

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/conferences/{conferenceId} \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d \
	'
	{
		"state": "completed"
	}'
```

```js
// Promise
client.Conference.update("conferenceID", {state: "completed"}).then(function(){});
// Callback
client.Conference.update("conferenceID", {state: "completed"}, function(err){});
```

### Example: Prevent all members from speaking
```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/conferences/{conferenceId} \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d \
	'
	{
		"mute": "true"
	}'
```

```js
// Promise
client.Conference.update("conferenceID", {mute: "true"}).then(function(){});
// Callback
client.Conference.update("conferenceID", {mute: "true"}, function(err){});
```

## POST conferences/{conferenceId}/audio
Speak a text or play audio in the conference

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

<aside class="notice">
* For playing text-to-speech, sentence is required, for playing an audio file, fileUrl is required.
</aside>

### Example: Speak text in conference

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/conferences/{conferenceId}/audio \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d \
	'
	{
		"sentence": "Hello everyone on the conference today",
		"gender": "female",
		"locale": "en_US",
		"voice": "kate"
	}'
```

```js
//Speak sentence in a conference
//Promise
client.Conference.speakSentence("conferenceID", "Hello From Bandwidth").then(function (res) {});
//Callback
client.Conference.speakSentence("conferenceID", "Hello From Bandwidth", function (err, res) {});

//Speak sentence with options
var options = {
	sentence : "hola de Bandwidth",
	gender   : "male",
	locale   : "es",
	voice    : "Jorge"
}
//Promise
client.Conference.playAudioAdvanced("conferenceId", options).then(function (res) {});

//Callback
client.Conference.playAudioAdvanced("conferenceId", options, function (err,res) {});
```

### Example: Play audio in conference

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/conferences/{conferenceId}/audio \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d \
	'
	{
		"fileUrl": "https://catapult.inetwork.com/.../media/{mediaName1}"
	}'
```

```js
//Play Audio file on conference
//Promise
client.Conference.playAudioFile("conferenceID", "http://myurl.com/file.mp3").then(function (res) {});
//Callback
client.Conference.playAudioFile("conferenceID", "http://myurl.com/file.wav", function (err, res) {});

//Play Audio File on loop
var options = {
	fileUrl     : "http://myurl.com/file.mp3",
	loopEnabled : true
}
//Promise
client.Conference.playAudioAdvanced("conferenceId", options).then(function (res) {});
//Callback
client.Conference.playAudioAdvanced("conferenceId", options, function (err,res) {});
```

## POST conferences/{conferenceId}/members
Add members to a conference.

### Supported Parameters
| Parameter   | Description                                                                                                                                            | Mandatory |
|:------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------|:----------|
| callId      | **Important:** The callId must refer to an active call that was created using this conferenceId.                                                       | Yes       |
| joinTone    | If `true`, will play a tone when the member joins the conference. If `false`, no tone is played when the member joins the conference.                  | No        |
| leavingTone | If `true`, will play a tone when the member leaves the conference. If `false`, no tone is played when the member leaves the conference.                | No        |
| mute        | If `true`, member can’t speak in the conference. If `false`, this members can speak in the conference (unless set at the conference level).            | No        |
| hold        | If `true`, member can’t hear or speak in the conference. If `false`, member can hear and speak in the conference (unless set at the conference level). | No        |

### Example: Add member to a conference

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/conferences/{conferenceId}/members \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d \
	'
	{
		"callId": "{callId}",
		"joinTone": "false",
		"leavingTone": "false"
	}'
```

```js
// Promise
client.Conference.createMember("conferenceId", {callId: "callID"}).then(function(member){});
// Callback
client.Conference.createMember("conferenceId", {callId: "callID"}, function(err, member){});
```

> The above command returns HTTP Header structured like this:

```
HTTP/1.1 201 CREATED
Location: /v1/users/{userId}/conferences/{confId}/members/{memberId}
```

## GET conferences/{conferenceId}/members
List all members from a conference. If a member had already hung up or removed from conference it will be displayed as completed.

### Example: Listing members from a conference

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/conferences/{conferenceId}/members \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
// Promise
client.Conference.getMembers("conferenceId").then(function(members){});
// Callback
client.Conference.getMembers("conferenceId", function(err, members){});
```

> The above command returns JSON structured like this:

```
[
	{
			"addedTime": "2013-07-12T15:54:47-02",
			"hold": false,
			"id": "{memberId1}",
			"mute": false,
			"state": "active",
			"joinTone": false,
			"leavingTone": false,
			"call": "https://localhost:8444/v1/users/{userId}/calls/{callId1}"
	},
	{
			"addedTime": "2013-07-12T15:55:12-02",
			"hold": false,
			"id": "{memberId2}",
			"mute": false,
			"state": "active",
			"joinTone": false,
			"leavingTone": false,
			"call": "https://localhost:8444/v1/users/{userId}/calls/{callId2}"
	},
	{
			"addedTime": "2013-07-12T15:56:12-02",
			"hold": false,
			"id": "{memberId3}",
			"mute": false,
			"removedTime": "2013-07-12T15:56:59-02",
			"state": "completed",
			"joinTone": false,
			"leavingTone": false,
			"call": "https://localhost:8444/v1/users/{userId}/calls/{callId3}"
	}
]
```

## POST conferences/{conferenceId}/members/{memberId}

Update a member status/properties.

### Supported Parameters
| Parameter   | Description                                                                                                                                            | Mandatory |
|:------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------|:----------|
| joinTone    | If `true`, will play a tone when the member joins the conference. If `false`, no tone is played when the member joins the conference.                  | No        |
| leavingTone | If `true`, will play a tone when the member leaves the conference. If `false`, no tone is played when the member leaves the conference.                | No        |
| mute        | If `true`, member can’t speak in the conference. If `false`, this members can speak in the conference (unless set at the conference level).            | No        |
| hold        | If `true`, member can’t hear or speak in the conference. If `false`, member can hear and speak in the conference (unless set at the conference level). | No        |

### Example: Remove member from conference

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/conferences/{conferenceId}/members/{memberId} \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d \
	'
	{
		"state": "completed"
	}'
```

```js
// Promise
client.Conference.updateMember("conferenceID", "memberId", {state: "completed"}).then(function(){});
// Callback
client.Conference.updateMember("conferenceID", "memberId", {state: "completed"}, function(err){});
```

### Example: Keep member from speaking in the conference

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/conferences/{conferenceId}/members/{memberId} \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d \
	'
	{
		"mute": "true"
	}'
```

```js
// Promise
client.Conference.updateMember("conferenceID", "memberId", {mute: "true"}).then(function(){});
// Callback
client.Conference.updateMember("conferenceID", "memberId", {mute: "true"}, function(err){});
```

### Example: Keep member from hearing the conference audio

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/conferences/{conferenceId}/members/{memberId} \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d \
	'
	{
		"hold": "true"
	}'
```

```js
// Promise
client.Conference.updateMember("conferenceID", "memberId", {hold: "true"}).then(function(){});
// Callback
client.Conference.updateMember("conferenceID", "memberId", {hold: "true"}, function(err){});
```

## GET conferences/{conferenceId}/members/{memberId}
Retrieve a conference member properties.

### Example: Get conference member information

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/conferences/{conferenceId}/members/{memberId} \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
// Promise
client.Conference.getMember("conferenceId", "memberId").then(function(member){});
// Callback
client.Conference.getMember("conferenceId", "memberId", function(err, member){});
```

> The above command returns JSON structured like this:

```
{
		"addedTime": "2013-07-12T15:47:04-03",
		"hold": false,
		"id": "{memberId}",
		"mute": false,
		"removedTime": "2013-07-12T15:49:11-02",
		"state": "completed",
		"joinTone": false,
		"leavingTone": false,
		"call": "https://.../v1/users/{userId}/calls/{callId}"
}
```

## POST conferences/{conferenceId}/members/{memberId}/audio
Speak text or play audio to **ONLY** a single conference member.

### Supported Parameters
| Parameter   | Description                                                                                                                                                                                                                                                                                                                                                                                     | Mandatory |
|:------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------|
| fileUrl     | The location of an audio file to play (WAV and MP3 supported).                                                                                                                                                                                                                                                                                                                                  | *         |
| sentence    | The sentence to speak.                                                                                                                                                                                                                                                                                                                                                                          | *         |
| gender      | The gender of the voice used to synthesize the sentence. It will be considered only if sentence is not null. The female gender will be used by default.                                                                                                                                                                                                                                         | No        |
| locale      | The locale used to get the accent of the voice used to synthesize the sentence. Currently audio supports: <br> - en\_US or en\_UK (English) <br> - es or es\_MX (Spanish) <br> - fr or fr\_FR (French) <br> - de or de\_DE (German) <br> - t or it\_IT (Italian) It will be considered only if sentence is not null/empty. The en\_US will be used by default.                                  | No        |
| voice       | The voice to speak the sentence. Audio currently supports the following voices: <br> - English US: Kate, Susan, Julie, Dave, Paul <br> - English UK: Bridget <br> - Spanish: Esperanza, Violeta, Jorge <br> - French: Jolie, Bernard <br> - German: Katrin, Stefan <br> - Italian: Paola, Luca It will be considered only if sentence is not null/empty. Susan’s voice will be used by default. | No        |
| loopEnabled | When value is `true` , the audio will keep playing in a loop. Default: `false`.                                                                                                                                                                                                                                                                                                                 | No        |
| tag         | A string that will be included in the events delivered when the audio playback starts or finishes.                                                                                                                                                                                                                                                                                              | No        |

<aside class="notice">
* For playing text-to-speech, sentence is required, for playing an audio file, fileUrl is required.
</aside>

### Example: Speak text to a conference member

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/conferences/{conferenceId}/members/{memberId}/audio \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d \
	'
	{
		"sentence": "Hi there member, I have a message only for you",
		"gender": "female",
		"locale": "en_US",
		"voice": "kate"
	}'
```

```js
//Speak sentence
//Promise
client.Conference.speakSentenceToMember("conferenceID", "memberID", "Hello From Bandwidth")
 .then(function (res) {});
//Callback
client.Conference.speakSentenceToMember("conferenceID", "memberID", "Hello From Bandwidth",
	function (err, res) {});

  //Speak sentence with options
  var options = {
  	sentence : "hola de Bandwidth",
  	gender   : "male",
  	locale   : "es",
  	voice    : "Jorge"
  }
  //Promise
  client.Conference.playAudioAdvancedToMember("conferenceId", "memberId", options)
    .then(function (res) {});

  //Callback
  client.Conference.playAudioAdvanced("conferenceId", options, function (err,res) {});
```

### Example: Play audio to a conference member

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/conferences/{conferenceId}/members/{memberId}/audio \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d \
	'
	{
		"fileUrl": "https://catapult.inetwork.com/.../media/{mediaName1}"
	}'
```

```js
//Play Audio file

//Promise
client.Conference.playAudioFileToMember("conferenceID", "memberId", "http://myurl.com/file.mp3")
  .then(function (res) {});

//Callback
client.Conference.playAudioFileToMember("conferenceID", "memberId", "http://myurl.com/file.wav",
   function (err, res) {});

//Play Audio File on loop
var options = {
	fileUrl     : "http://myurl.com/file.mp3",
	loopEnabled : true
}
//Promise
client.Conference.playAudioAdvancedToMember("conferenceId", "memberId", options)
 .then(function (res) {});

//Callback
client.Conference.playAudioAdvancedToMember("conferenceId", "memberId", options,
  function (err,res) {});
```
