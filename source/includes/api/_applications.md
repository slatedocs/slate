# Applications
The Applications resource lets you define call and message handling applications. You write an application on your own servers and have Bandwidth API send events to it by configuring a callback URL.


| Property                          | Description                                                                                                                                                                                                 |
|:----------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| id                                | The unique identifier for the application.                                                                                                                                                                  |
| name                              | A name you choose for this application.                                                                                                                                                                     |
| incomingCallUrl                   | A URL where call events will be sent for an inbound call. This is the endpoint where the Application Platform will send all call events. Either incomingCallUrl or incomingMessageUrl is required.          |
| incomingCallUrlCallbackTimeout    | Determine how long should the platform wait for incomingCallUrl's response before timing out in milliseconds.                                                                                               |
| incomingCallFallbackUrl           | The URL used to send the callback event if the request to incomingCallUrl fails.                                                                                                                            |
| callbackHttpMethod                | Determine if the callback event should be sent via HTTP GET or HTTP POST. Values are "get" or "post", default: "post".                                                                                      |
| autoAnswer                        | Determines whether or not an incoming call should be automatically answered. Default value is 'true'.                                                                                                       |
| incomingMessageUrl                | A URL where message events will be sent for an inbound message. This is the endpoint where the Application Platform will send all message events. Either incomingMessageUrl or incomingCallUrl is required. |
| incomingMessageUrlCallbackTimeout | Determine how long should the platform wait for incomingMessageUrl's response before timing out in milliseconds.                                                                                            |
| incomingMessageFallbackUrl        | The URL used to send the callback event if the request to incomingMessageUrl fails.                                                                                                                         |

## GET applications
Get a list of your applications

### Supported Parameters
| Parameter | Description                                                                                                                                                                  | Mandatory |
|:----------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------|
| page      | Used for pagination to indicate the page requested for querying a list of applications. If no value is specified the default is 0.                                           | No        |
| size      | Used for pagination to indicate the size of each page requested for querying a list of applications. If no value is specified the default value is 25\. (Maximum value 1000) | No        |

### Example: List your applications.

```shell
curl -v -X GET  https://api.catapult.inetwork.com/v1/users/{user-id}/account/applications \
  -u {token}:{secret} \
  -H "Content-type: application/json" \
```

```js
//Promise
client.Application.list()
.then(function (response) {
	console.log(response.applications);
	if(response.hasNextPage) {
		return response.getNextPage();
	}
	else {
		return {applications: []};
	}
})
.then(function(response) {
	console.log(response.applications);
});
```

```csharp
var applications = client.Application.List();
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": "{applicationId}",
    "name": "MyFirstApp",
    "incomingCallUrl": "http://example.com/calls.php",
    "incomingMessageUrl": "http://example.com/messages.php",
    "autoAnswer": true
  },
  {
    "id": "{applicationId}",
    "name": "MySecondApp",
    "incomingCallUrl": "http://example.com/app2/calls.php",
    "incomingMessageUrl": "http://example.com/app2/messages.php",
    "autoAnswer": false
  }
]
```

## POST applications
Creates an application that can handle calls and messages for one of your phone number. Many phone numbers can share an application.

### Supported Parameters
| Parameter                         | Description                                                                                                      | Mandatory |
|:----------------------------------|:-----------------------------------------------------------------------------------------------------------------|:----------|
| name                              | A name you choose for this application.                                                                          | Yes       |
| incomingCallUrl                   | A URL where call events will be sent for an inbound call.                                                        | No        |
| incomingCallUrlCallbackTimeout    | Determine how long should the platform wait for incomingCallUrl's response before timing out in milliseconds.    | No        |
| incomingCallFallbackUrl           | The URL used to send the callback event if the request to incomingCallUrl fails.                                 | No        |
| incomingMessageUrl                | A URL where message events will be sent for an inbound SMS message                                               | No        |
| incomingMessageUrlCallbackTimeout | Determine how long should the platform wait for incomingMessageUrl's response before timing out in milliseconds. | No        |
| incomingMessageFallbackUrl        | The URL used to send the callback event if the request to incomingMessageUrl fails.                              | No        |
| callbackHttpMethod                | Determine if the callback event should be sent via HTTP GET or HTTP POST. (If not set the default is HTTP POST)  | No        |
| autoAnswer                        | Determines whether or not an incoming call should be automatically answered. Default value is 'true'.            | No        |

### Example: Create an application named: 'MyFirstApp'


```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/applications \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d '{"name": "MyFirstApp", "incomingCallUrl": "http://example.com/calls.php", "incomingMessageUrl": "http://example.com/messages.php", "callbackHttpMethod": "GET", "autoAnswer": true}'
```

```js
//Promise
client.Application.create({
	name: 'MyFirstApp',
	incomingCallUrl: 'http://your-server.com/CallCallback',
	incomingMessageUrl: 'http://your-server.com/MsgCallback'
})
.then(function (response) {
	console.log(response);
});

//Callback
client.Application.create({
	name: 'SampleApp2',
	incomingCallUrl: 'http://your-server.com/CallCallback',
	incomingMessageUrl: 'http://your-server.com/MsgCallback'
}, function (err, response) {
	if (err) {
		console.log(err);
	}
	else {
		console.log(response)
	}
});
```
```csharp
var application = await client.Application.CreateAsync(new CreateApplicationData{
	Name = "SampleApp2",
	IncomingCallUrl = "http://your-server.com/CallCallback",
	IncomingMessageUrl = "http://your-server.com/MsgCallback"
});
```

## GET applications/{applicationId}

Gets information about one of your applications. No query parameters are supported.

### Example: Get an application's information

```shell
curl -v -X GET  https://api.catapult.inetwork.com/v1/users/{user-id}/applications/{applicationId}
  -u {token}:{secret} \
  -H "Content-type: application/json" \
```

```js
// Promise
client.Application.get('a-j4f2jz53mq')
.then(function (response) {
	console.log(response);
});

// Callback
client.Application.get('a-zuwwfzzrbea',
	function (err, response) {
		if (err) {
			console.log(err);
		}
		else {
			console.log(response);
		}
});
```

```csharp
var application = await client.Application.GetAsync("a-zuwwfzzrbea");
```

> The above command returns JSON structured like this:

```
{
  "id": "{applicationId}",
  "name": "MyFirstApp",
  "incomingCallUrl": "http://example.com/calls.php",
  "incomingMessageUrl": "http://example.com/messages.php",
  "autoAnswer": true
}
```

## POST applications/{applicationId}
Makes changes to an application. POST a new JSON representation with the property values you desire to the URL that you got back in the "Location" header when you first created it.

<aside class="notice">
NOTE: Properties you don't send will remain unchanged.
</aside>

### Supported Parameters

| Parameter                         | Description                                                                                                      | Mandatory |
|:----------------------------------|:-----------------------------------------------------------------------------------------------------------------|:----------|
| name                              | A name you choose for this application.                                                                          | Yes       |
| incomingCallUrl                   | A URL where call events will be sent for an inbound call.                                                        | No        |
| incomingCallUrlCallbackTimeout    | Determine how long should the platform wait for incomingCallUrl's response before timing out in milliseconds.    | No        |
| incomingCallFallbackUrl           | The URL used to send the callback event if the request to incomingCallUrl fails.                                 | No        |
| incomingMessageUrl                | A URL where message events will be sent for an inbound SMS message.                                              | No        |
| incomingMessageUrlCallbackTimeout | Determine how long should the platform wait for incomingMessageUrl's response before timing out in milliseconds. | No        |
| incomingMessageFallbackUrl        | The URL used to send the callback event if the request to incomingMessageUrl fails.                              | No        |
| callbackHttpMethod                | Determine if the callback event should be sent via HTTP GET or HTTP POST. (If not set the default is HTTP POST). | No        |
| autoAnswer                        | Determines whether or not an incoming call should be automatically answered. Default value is 'true'.            | No        |

### Example: Update Application

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/applications/{applicationId} \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d '{"incomingCallUrl": "http://different.example.com/calls.php"}'
```

```js
// Promise
client.Application.update('a-j4f2j6vjmqz53mq', {
	name: 'Rename App1',
	autoAnswer: false
})
.then(function (response) {
	console.log(response);
});

// Callback
client.Application.update('a-zudcfzzrbea',
	{
		name: 'Rename App2',
		autoAnswer: false
	},
	function (err, response) {
		if (err) {
			console.log(err);
		}
		else {
			console.log(response);
		}
});
```

```csharp
await client.Application.UpdateAsync("a-zuwwfzzrbea", new UpdateApplicationData{
	Name =  "Rename App2",
	AutoAnswer = false
});
```

## DELETE applications/{applicationId}

Permanently deletes an application.

### Example: Delete an application.

```shell
curl -v -X DELETE https://api.catapult.inetwork.com/v1/users/{userId}/applications/{applicationId} \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
// Promise
client.Application.delete('a-j4f2j6mqz53mq')
.then(function (response) {
	console.log(response);
});

// Callback
client.Application.delete('a-zuwwzrbea',
	function (err, response) {
		if (err) {
			console.log(err);
		}
		else {
			console.log(response);
		}
});
```

```csharp
await client.Application.DeleteAsync("a-zuwwfzzrbea");
```
