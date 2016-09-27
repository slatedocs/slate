# Messages
The Messages resource lets you send SMS/MMS messages and view messages that were previously sent or received.

## Properties
| Property            | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|:--------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| id                  | The unique ID of the message.                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| from                | The message sender’s telephone number (or short code).                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| to                  | Message recipient telephone number (or short code).                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| direction           | Direction of message, in - a message that came from the telephone network to one of your numbers (an “inbound” message) or out - a message that was sent from one of your numbers to the telephone network (an “outbound” message)                                                                                                                                                                                                                                                                          |
| text                | The message contents. NOTE: We only store the message contents for 30 days. Any messages older than 30 days will not contain text.                                                                                                                                                                                                                                                                                                                                                                          |
| media               | Json array containing list of media urls to be sent as content for an mms. Valid URLs are: <br> https://api.catapult.inetwork.com/v1/users/&lt;user-id&gt;/media/<media-name></media-name> <br>We also support media URLs that are external to Bandwidth API, http:// or https:// format: <br> Example: http://customer-web-site.com/file.jpg <br> And coming soon, we are going to use file name from Content-Disposition header in case it’s passed by the media URLs that are external to Bandwidth API. |
| state               | Message state, values are:  <br> * `received`<br> * `queued`<br> * `sending`<br> * `sent` <br> * `error`                                                                                                                                                                                                                                                                                                                                                                                                    |
| time                | The time the message resource was created (UTC, follows the ISO 8601 format).                                                                                                                                                                                                                                                                                                                                                                                                                               |
| callbackUrl         | The complete URL where the events related to the outgoing message will be sent.                                                                                                                                                                                                                                                                                                                                                                                                                             |
| callbackTimeout     | Determine how long should the platform wait for callbackUrl’s response before timing out (milliseconds).                                                                                                                                                                                                                                                                                                                                                                                                    |
| fallbackUrl         | The server URL used to send message events if the request to callbackUrl fails.                                                                                                                                                                                                                                                                                                                                                                                                                             |
| page                | Used for pagination to indicate the page requested for querying a list of messages. If no value is specified the default is 0.                                                                                                                                                                                                                                                                                                                                                                              |
| size                | Used for pagination to indicate the size of each page requested for querying a list of messages. If no value is specified the default value is 25. (Maximum value 1000)                                                                                                                                                                                                                                                                                                                                     |
| tag                 | A string that will be included in the callback events of the message.                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| receiptRequested    | Requested receipt option for outbound messages: `none` `all` `error` Default is `none`.                                                                                                                                                                                                                                                                                                                                                                                                                     |
| deliveryState       | One of the message delivery states `waiting` `delivered` `not-delivered `                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| deliveryCode        | Numeric value of deliver code, see table for values.                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| deliveryDescription | Message delivery description for the respective delivery code                                                                                                                                                                                                                                                                                                                                                                                                                                               |

## Message Request Receipt
| Receipt | Description                                                     |
|:--------|:----------------------------------------------------------------|
| none    | Delivery receipt will not be sent as callback event.            |
| error   | Only error delivery receipt event maybe sent as callback event. |
| all     | Success or error delivery receipt maybe sent as callback event. |

## Message States
| State    | Description                                                                            |
|:---------|:---------------------------------------------------------------------------------------|
| received | The message was received.                                                              |
| queued   | The message is waiting in queue and will be sent soon.                                 |
| sending  | The message was removed from queue and is being sent.                                  |
| sent     | The message was sent successfully.                                                     |
| error    | There was an error sending or receiving a message (check errors resource for details). |

## Message Delivery State
| State         | Description                                        |
|:--------------|:---------------------------------------------------|
| waiting       | Waiting for receipt.                               |
| delivered     | Receipt indicating that message was delivered.     |
| not-delivered | Receipt indicating that message was not delivered. |

## Message Delivery Code
| Code | Description                                   |
|:-----|:----------------------------------------------|
| 0    | Message delivered to carrier                  |
| 100  | Message not delivered to carrier              |
| 187  | Statistical spam detected                     |
| 188  | Keyword spam detected                         |
| 189  | Spam detected                                 |
| 482  | Loop detected                                 |
| 600  | Destination carrier could not accept messages |
| 610  | Message submittion failed                     |
| 620  | Destination application error                 |
| 630  | Message not acknowledge                       |
| 720  | Invalid destination number                    |
| 740  | Invalid source number                         |
| 999  | Unknown error                                 |

## Multiple Message Result Types
| Type     | Description                                                                                                                                                                                    |
|:---------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| result   | Values are<br>`accepted` - the message was accepted and the location points to the message resource <br> `error` - the message was not accepted and the “error” property contains information. |
| location | When the result is `accepted`, contains the URL of the message location.                                                                                                                       |

## GET messages
Gets a list messages you have sent or received. Since this operation uses HTTP GET, all the properties are specified as HTTP request parameters.

Message results are paginated based on the `size` parameter. If the number of messages found by the specified query parameters exceeds one page, the `link` header on the HTTP response will contain the URL to request the next page of results. The `link` header will continue to be set for each request, as long as there is another page of messages available.

### Supported Parameters
| Parameter     | Description                                                                                                                                                                                                                                                                                                                                                                                                           | Mandatory |
|:--------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------|
| from          | The phone number to filter the messages that came from (must be in E.164 format, like +19195551212).                                                                                                                                                                                                                                                                                                                  | No        |
| to            | The phone number to filter the messages that was sent to (must be in E.164 format, like +19195551212).                                                                                                                                                                                                                                                                                                                | No        |
| fromDateTime  | The starting date time to filter the messages (must be in yyyy-MM-dd hh:mm:ss format, like 2014-05-25 12:00:00. You can suppress parts of the date or time, like 2014-05-25, but the missing parameters will be filled with zeros).                                                                                                                                                                                   | No        |
| toDateTime    | The ending date time to filter the messages (must be in yyyy-MM-dd hh:mm:ss format, like 2014-05-25 12:00:00. You can suppress parts of the date or time, like 2014-05-25, but the missing parameters will be filled with zeros). Although it only supports seconds, we use milliseconds precision so if you want to include an event that happened on a given second you must set the next second on this parameter. | No        |
| page          | Used for pagination to indicate the page requested for querying a list of messages. If no value is specified the default is 0.                                                                                                                                                                                                                                                                                        | No        |
| size          | Used for pagination to indicate the size of each page requested for querying a list of messages. If no value is specified the default value is 25. (Maximum value 1000)                                                                                                                                                                                                                                               | No        |
| direction     | Filter by direction of message, in - a message that came from the telephone network to one of your numbers (an “inbound” message) or out - a message that was sent from one of your numbers to the telephone network (an “outbound” message)                                                                                                                                                                          | No        |
| state         | The message state to filter. values are:  <br> * `received`<br> * `queued`<br> * `sending`<br> * `sent` <br> * `error`                                                                                                                                                                                                                                                                                                | No        |
| deliveryState | The message delivery state to filter. Values are `waiting` `delivered` `not-delivered `                                                                                                                                                                                                                                                                                                                               | No        |
| sortOrder     | How to sort the messages. Values are `asc` or `desc` If no value is specified the default value is `asc`                                                                                                                                                                                                                                                                                                              | No        |

### Example: List your messages

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/messages \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
//need to add this
```

```csharp
var messages = client.Message.List();
```

> The above command returns JSON structured like this:

```
HEADER: <https://api.catapult.inetwork.com/v1/users/u-dkjf9094802375s/messages?sortKeyLT=1458576004287000989&size=1>; rel="next"
```

```json

[
	{
		"id": "{messageId1}",
		"messageId": "{messageId1}",
		"from": "{fromNumber}",
		"to": "{number}",
		"text": "Good morning, this is a test message",
		"time": "2012-10-05T20:37:38.048Z",
		"direction": "out",
		"state": "sent",
		"media": []
	},
	{
		"id": "{messageId2}",
		"messageId": "{messageId2}",
		"from": "{number}",
		"to": "{toNumber}",
		"text": "I received your test message",
		"time": "2012-10-05T20:38:11.023Z",
		"direction": "in",
		"state": "received",
		"media": []
	},
	{
		"id": "{messageId3}",
		"messageId": "{messageId3}",
		"from": "{number}",
		"to": "{toNumber}",
		"text": "I received your MMS message",
		"time": "2012-10-05T20:38:11.023Z",
		"direction": "out",
		"state": "sent",
		"media": ["https://api.catapult.inetwork.com/v1/users/<user-id>/media/image.jpg"]
	},
	{
		"id": "{messageId4}",
		"messageId": "{messageId4}",
		"from": "{number}",
		"to": "{toNumber}",
		"text": "I received your MMS message",
		"time": "2012-10-05T20:38:11.023Z",
		"direction": "out",
		"state": "sent",
		"media": ["https://api.catapult.inetwork.com/v1/users/<user-id>/media/image-1.jpg",
							"https://api.catapult.inetwork.com/v1/users/<user-id>/media/image-2.jpg",
							"http://customer-web-site.com/file.jpg"]
	}
]
```

### Example: List your messages by from number {fromNumber}

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/messages?from=%2b{fromNumber} \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
//Need to add this
```

```csharp
var messages = client.Message.List(new MessageQuery {From = "{fromNumber}"});
```

> The above command returns JSON structured like this:

```json
[
	{
		"id": "{messageId1}",
		"messageId": "{messageId1}",
		"from": "{fromNumber}",
		"to": "{toNumber1}",
		"text": "Good morning, this is a test message",
		"time": "2012-10-05T20:37:38.048Z",
		"direction": "out",
		"state": "sent",
		"media": []
	},
	{
		"id": "{messageId2}",
		"messageId": "{messageId2}",
		"from": "{fromNumber}",
		"to": "{toNumber2}",
		"text": "I received your test message",
		"time": "2012-10-05T20:38:11.023Z",
		"direction": "in",
		"state": "received",
		"media": []
	}
]
```

### Example: Gets a list messages filtering the direction and toDateTime

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/messages?from=%2b{fromNumber}&direction=out&toDateTime=2012-10-05%2020:37:39 \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
//need to add this
```

```csharp
var messages = client.Message.List(new MessageQuery {
	From = "{fromNumber}",
	Direction = MessageDirection.Out,
	ToDateTime = new DateTime(2015, 10, 5, 20, 37, 39, 0, DateTimeKind.Utc)
});
```


> The above command returns JSON structured like this:

```json
[
	{
		"id": "{messageId1}",
		"messageId": "{messageId1}",
		"from": "{fromNumber}",
		"to": "{toNumber1}",
		"text": "Good morning, this is a test message",
		"time": "2012-10-05T20:37:38.048Z",
		"direction": "out",
		"state": "sent",
		"media": []
	}
]
```

## POST messages
Sends one or more messages.

Sending a single message: To send a single text message, submit a single message representation as your request body. The response indicates the created message's URL in the Location header if it was created successfully. If there was an error with the message, the response body contains error information.

Sending multiple messages: To send multiple messages in a single request, submit an array of message representations as your request body. The response entity will contain an array of response objects, with the same length and order as the submitted message list, so you can iterate in the results to check for errors. Each result contains the URL of the of the message if it was created successfully or error information.

Important Note on Multiple Messages: There is a maximum limit of 50 messages sent per multiple messages request.

Important Note on Rate Limits: You can send 1 message per second per Bandwidth phone number.

International characters: Currently we support only the GSM 7 bit character set (GSM 03.38) .

<aside class="warning">
When sending MMS, the size of all medias for specific message summed up should not exceed 1.5 MB
</aside>

### Supported Parameters
| Parameter          | Description                                                                                                                                                                            | Mandatory |
|:-------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------|
| from               | One of your telephone numbers the message should come from (must be in E.164 format, like +19195551212).                                                                               | Yes       |
| to                 | The phone number the message should be sent to (must be in E.164 format, like +19195551212).                                                                                           | Yes       |
| text               | The contents of the text message (must be 2048 characters or less).                                                                                                                    | Yes       |
| media              | For MMS messages, a media url to the location of the media or list of medias to be sent send with the message. For media details please check table Properties in the top of the page. | No        |
| receiptRequested   | Requested receipt option for outbound messages: `none` `all` `error` Default is `none`.                                                                                                | No        |
| callbackUrl        | The server URL where the events related to the outgoing message will be sent to.                                                                                                       | No        |
| callbackHttpMethod | Determine if the callback event should be sent via `HTTP GET` or `HTTP POST`. Values are get or post Default is `post`                                                                 | No        |
| callbackTimeout    | Determine how long should the platform wait for callbackUrl’s response before timing out (milliseconds).                                                                               | No        |
| fallbackUrl        | The server URL used to send the message events if the request to callbackUrl fails.                                                                                                    | No        |
| tag                | Any string, it will be included in the callback events of the message.                                                                                                                 | No        |

### Example: Send a single text message

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/ \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
		-d \
	'
	{
		"from": "{fromNumber}",
		"to": "{toNumber}",
		"text": "Good morning, this is a test message",
		"callbackUrl": "http://my.callback.url"
	}'
```

```js
client.Message.send({
	from : "+19195551212",
	to   : "+19195551213",
	text : "Thank you for susbcribing to Unicorn Enterprises!"
})
.then(function(message){
	console.log(message);
});
//{
//  from : "+19195551212",
//  to   : "+19195551213",
//  text : "Thank you for susbcribing to Unicorn Enterprises!",
//  id   : "..."
//}
```

```csharp
var message = await client.Message.SendAsync(new MessageData {
	From = "+19195551212",
	To = "+19195551213",
	Text = "Thank you for susbcribing to Unicorn Enterprises!"
});
```

> The above command returns HTTP Header structured like this:

```
HTTP/1.1 201 Created
Location: /v1/users/{userId}/messages/{messageId}
```

### Example: Send a single mms with Bandwidth Media

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/ \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
		-d \
	'
	{
		"from": "{fromNumber}",
		"to": "{toNumber}",
		"text": "Good morning, this is a test message",
		"callbackUrl": "http://my.callback.url",
		"media": ["https://api.catapult.inetwork.com/v1/users/<user-id>/media/image-1.jpg"]
	}'
```

```js
client.Message.send({
	from : "+19195551212",
	to   : "+19195551213",
	text : "Thank you for susbcribing to Unicorn Enterprises!",
	media: ["https://api.catapult.inetwork.com/v1/users/<user-id>/media/image-1.jpg"],
	callbackUrl: "http://my.callback.url"
})
.then(function(message){
	console.log(message);
});
```

```csharp
var message = await client.Message.SendAsync(new MessageData {
	From = "+19195551212",
	To = "+19195551213",
	Text = "Thank you for susbcribing to Unicorn Enterprises!",
	Media = new[] {"https://api.catapult.inetwork.com/v1/users/<user-id>/media/image-1.jpg"},
	CallbackUrl = "http://my.callback.url"
});
```


> The above command returns HTTP Header structured like this:

```
HTTP/1.1 201 Created
Location: /v1/users/{userId}/messages/{messageId}
```


### Example: Send a single mms with external media

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/ \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
		-d \
	'
	{
		"from": "{fromNumber}",
		"to": "{toNumber}",
		"text": "Good morning, this is a test message",
		"callbackUrl": "http://my.callback.url",
		"media": ["http://your-site.com/image-1.jpg"]
	}'
```

```js
client.Message.send({
	from : "+19195551212",
	to   : "+19195551213",
	text : "Thank you for susbcribing to Unicorn Enterprises!",
	media: ["http://your-site.com/image-1.jpg"],
	callbackUrl: "http://my.callback.url"
})
.then(function(message){
	console.log(message);
});
```

```csharp
var message = await client.Message.SendAsync(new MessageData {
	From = "+19195551212",
	To = "+19195551213",
	Text = "Thank you for susbcribing to Unicorn Enterprises!",
	Media = new[] {"http://your-site.com/image-1.jpg"},
	CallbackUrl = "http://my.callback.url"
});
```

> The above command returns HTTP Header structured like this:

```
HTTP/1.1 201 Created
Location: /v1/users/{userId}/messages/{messageId}
```

### Example: Send three messages in a single request

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/ \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
		-d \
	'
	[
		{
			"from": "{fromNumber1}",
			"to": "{toNumber1}",
			"text": "This is the test message one",
			"callbackUrl": "http://my.callback.url"
		},
		{
			"from": "{fromNumber2}",
			"to": "{toNumber2}",
			"text": "This is the test message two",
			"callbackUrl": "http://my.callback.url"
		},
		{
			"from": "{fromNumber1}",
			"to": "",
			"callbackUrl": "",
			"text": "This is the test message three",
			"callbackUrl": "http://my.callback.url"
		}
	]'
```

```shell
HTTP/1.1 202 ACCEPTED
[
	{
		"result": "accepted",
		"location": "https://.../v1/users/.../messages/{messageI1}"
	},
	{
		"result": "accepted",
		"location": "https://.../v1/users/.../messages/{messageId2}"
	},
	{
		"result": "error",
		"error": {
			"category": "bad-request",
			"code": "blank-property",
			"message": "The 'message' resource property 'to' must contain at least one non-whitespace character",
			"details": []
		 }
	}
]
```

```js
client.Message.sendMultiple({
	from : "+19195551211",
	to   : "+19195551213",
	text : "Thank you for susbcribing to Unicorn Enterprises!"
}, {
	from : "+19195151212",
	to   : "+19195551214",
	text : "Thank you for susbcribing to Unicorn Enterprises!"
})
.then(function(messages){
	console.log(messages);
});
```

```csharp
var messages = await client.Message.SendAsync(new[] {
	new MessageData {
		From = "+19195551211",
		To = "+19195551213",
		Text = "Thank you for susbcribing to Unicorn Enterprises!"
	},
	new MessageData {
		From = "+19195551212",
		To = "+19195551214",
		Text = "Thank you for susbcribing to Unicorn Enterprises!"
	}
});
```


```js
//returns
[{
	result : "failed",
	error: {
		category : "authorization",
		code     : "number-access-denied",
		message  : "User ... does not have permission to use number +19195551211",
		details  : [
			{
				name  : "userId",
				value : "..."
			},
			{
				name  : "number",
				value : "+19195551211"
			}
		],
	},
	message : {
		from : "+19195551211",
		to   : "+19195551213",
		text : "Thank you for subscribing to Unicorn Enterprises!"
	}
},{
	result  : "accepted",
	message : {
		from : "+19195551212",
		to   : "+19195551214",
		text : "Thank you for subscribing to Unicorn Enterprises!",
		id   : "..."
	}
}]
```

### Example: Request receipt for single text message
To send a text message with request receipt from {fromNumber} to {toNumber}, send the following request:

```csharp
var message = await client.Message.SendAsync(new MessageData {
	From = "+19195551212",
	To = "+19195551213",
	Text = "Thank you for susbcribing to Unicorn Enterprises!",
	ReceiptRequested = MessageReceiptRequested.All
});
```

### Example: Send a single text message with custom callback timeout of 2 seconds

```csharp
var message = await client.Message.SendAsync(new MessageData {
	From = "+19195551212",
	To = "+19195551213",
	Text = "Thank you for susbcribing to Unicorn Enterprises!",
	CallbackUrl = "http://my.callback.url",
	CallbackTimeout = 2000
});
```

### Example: Send a single text message with custom callback timeout of 2 seconds and a fallback URL

```csharp
var message = await client.Message.SendAsync(new MessageData {
	From = "+19195551212",
	To = "+19195551213",
	Text = "Thank you for susbcribing to Unicorn Enterprises!",
	CallbackUrl = "http://my.callback.url",
	CallbackTimeout = 2000,
	FallbackUrl = "http://my.fallback.url"
});
```


## GET messages/{messageId}
Gets information about a previously sent or received message. No query parameters are supported.

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/messages/{messageId} \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
//Promise
client.Message.get("{messageId}")
.then(function (message) {
  console.log(message);
});

//callback
client.Message.get("{messageId}", function (err, message) {
  if(err) {
    console.log(err);
  }
  else {
    console.log(message);
  }
});
```

```csharp
var message = await client.Message.GetAsync("{messageId}");
```
