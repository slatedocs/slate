# Bridges
The Bridges resource allows you to bridge two calls together allowing for two way audio between them. A common example is bridging an incoming phone call together with a outgoing phone call.

## Properties

| Property      | Description                                              |
|:--------------|:---------------------------------------------------------|
| id            | The unique ID of the bridge.                             |
| state         | Bridge state. Possible state values are described here.  |
| callIds       | List of call Ids that will be in the bridge.             |
| calls         | The URL used to retrieve the calls in a specific bridge. |
| bridgeAudio   | Enable/Disable two way audio path.                       |
| completedTime | The time when the bridge was completed.                  |
| createdTime   | The time that bridge was created.                        |
| activatedTime | The time that the bridge got into active state.          |

## Bridge state

| State     | Description                                                                                                        |
|:----------|:-------------------------------------------------------------------------------------------------------------------|
| created   | The bridge was created but the audio was never bridged.                                                            |
| active    | The bridge has two active calls and the audio was already bridged before.                                          |
| hold      | The bridge calls are on hold (bridgeAudio was set to false).                                                       |
| completed | The bridge was completed. The bridge is completed when all calls hangup or when all calls are removed from bridge. |
| error     | Some error was detected in bridge.                                                                                 |

## GET bridges

Get list of bridges for a given user.

### Supported Parameters

| Parameter | Description                                                                                                                                                            | Mandatory |
|:----------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------|
| page      | Used for pagination to indicate the page requested for querying a list of bridges. If no value is specified the default is 0.                                          | No        |
| size      | Used for pagination to indicate the size of each page requested for querying a list of bridges. If no value is specified the default value is 25 (maximum value 1000). | No        |

### Example: List of a user's bridges

```shell
curl -v -X GET  https://api.catapult.inetwork.com/v1/users/{user-id}/bridges/transations \
  -u {token}:{secret} \
  -H "Content-type: application/json" \
```

```js
client.Bridge.list()
.then(function (response) {
	console.log(response.bridges);
	if(response.hasNextPage) {
		return response.getNextPage();
	}
	else {
		return {bridges: []};
	}
})
.then(function(response) {
	console.log(response.bridges);
});
```

> The above command returns JSON structured like this:

```
[
  {
    "id": "{bridgeId}",
    "state": "completed",
    "bridgeAudio": "true",
    "calls":"https://.../v1/users/{userId}/bridges/{bridgeId}/calls",
    "createdTime": "2013-04-22T13:55:30.279Z",
    "activatedTime": "2013-04-22T13:55:30.280Z",
    "completedTime": "2013-04-22T13:56:30.122Z"
  },
  {
    "id": "{bridgeId}",
    "state": "completed",
    "bridgeAudio": "true",
    "calls":"https://.../v1/users/{userId}/bridges/{bridgeId}/calls",
    "createdTime": "2013-04-22T13:58:30.121Z",
    "activatedTime": "2013-04-22T13:58:30.122Z",
    "completedTime": "2013-04-22T13:59:30.122Z"
  }
]
```

## POST bridges

Create a new bridge.

### Supported Parameters

| Parameter   | Description                                                                                                                                          | Mandatory |
|:------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------|:----------|
| bridgeAudio | Enable/Disable two way audio path (default = true).                                                                                                  | No        |
| callIds     | The list of call ids in the bridge. If the list of call ids is not provided the bridge is logically created and it can be used to place calls later. | No        |

### Example: Create a bridge with two calls and two way voice path

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/bridges/ \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d '{"bridgeAudio": "true", "callIds": ["{callId1}","{callId2}"] }'
```

```js
//Promise
client.Bridge.create({
	bridgeAudio: true,
	callIds: ['c-qbs5kwrsyx6wsdi', 'c-zan4g74pprsq']
})
.then(function (response) {
	console.log(response);
});

//Callback
client.Bridge.create({
	bridgeAudio: true,
	callIds: ['c-qbsx6wsdi', 'c-zan4g7prsq']
}, function (err, response) {
		if(err) {
			console.log(err);
		}
		else {
			console.log(response);
		}
	});
  ```

> The above command returns HTTP Status structured like this:
```
HTTP/1.1 201 Created
Location: /v1/users/{userId}/calls/{bridgeId}
```

### Example: Create a bridge without calls

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/bridges/ \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d '{"bridgeAudio": "true" }'
```
```js
//Promise
client.Bridge.create({
	bridgeAudio: true,
	callIds: ['c-qbs5kwrsyx6wsdi', 'c-zan4g74pprsq']
})
.then(function (response) {
	console.log(response);
});

//Callback
client.Bridge.create({
	bridgeAudio: true
}, function (err, response) {
		if(err) {
			console.log(err);
		}
		else {
			console.log(response);
		}
	});
  ```
> The above command returns HTTP Status structured like this:
```
HTTP/1.1 201 Created
Location: /v1/users/{userId}/calls/{bridgeId}
```

## GET bridges/{bridgeId}

Gets information about a specific bridge. No query parameters are supported.

### Example: Get information about a bridge

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/bridges/{bridgeId} \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
//Promise
client.Bridge.get('brg-65dhjwrmbasiei')
.then(function (response) {
	console.log(response);
});

//Callback
client.Bridge.get('brg-65dhmbasiei',
	function (err, response) {
		if(err) {
			console.log(err);
		}
		else {
			console.log(response);
		}
	});
```

> The above command returns JSON structured like this:
```
{
  "id": "{bridgeId}",
  "state": "completed",
  "bridgeAudio": "true",
  "calls":"https://.../v1/users/{userId}/bridges/{bridgeId}/calls",
  "createdTime": "2013-04-22T13:55:30.279Z",
  "activatedTime": "2013-04-22T13:55:30.280Z",
  "completedTime": "2013-04-22T13:59:30.122Z"
}
```

## POST bridges/{bridgeId}
Change calls in a bridge and bridge/unbridge the audio.

### Example: Add call {callId1} and call {callId2} in a bridge {bridgeId} with two way voice path

### Example: Removing call {callId2} from the bridge created in the example above

### Example: Adding two different calls {callId3} and {callId4} in the bridge above and put them on hold

### Example: Bridging the audio again

### Example: Removing all calls from bridge.
