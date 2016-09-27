# Number Info
This resource provides a CNAM number info. CNAM is an acronym which stands for Caller ID Name. CNAM can be used to display the calling party's name alongside the phone number, to help users easily identify a caller. CNAM API allows the user to get the CNAM information of a particular number.

## Properties
| Property | Description                                                  |
|:---------|:-------------------------------------------------------------|
| name     | The Caller ID name information.                              |
| number   | The full phone number, specified in E.164 format.            |
| created  | The time this Caller ID information was first queried (UTC). |
| updated  | The time this Caller ID information was last updated (UTC).  |

## GET numberInfo/{number}

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/numberInfo/{number} \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
// Promise
client.NumberInfo.get("+1234567890").then(function(info){});

// Callback
client.NumberInfo.get("+1234567890", function(err, info){});
```

```csharp
var info = await client.NumberInfo.GetAsync("+1234567890");
```

> The above command returns JSON structured like this:

```
{
  "created": "2013-09-23T16:31:15Z",
  "name": "Name",
  "number": "{number}",
  "updated": "2013-09-23T16:42:18Z"
}
```
