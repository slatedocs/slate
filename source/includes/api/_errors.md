# Errors
The Errors resource lets you see information about errors that happened in your API calls and during applications callbacks. This error information can be very helpful when you're debugging an application. Because error information can be large, and errors in the distant past are less useful than new ones, Bandwidth API limits the number of user errors it keeps.

## Error Properties

| Property | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
|:---------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| id       | The unique id for the error.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| time     | The time the error occurred (UTC).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| category | The error category, one of:<br>`authentication` - The requestor could not be authenticated. Incorrect or disabled credentials are common causes of these errors. <br>`authorization` - The requestor does not have sufficient permissions to perform the operation or access the resource, or some other authorization error occurred.<br> `not-found` - The resource could not be found. <br>`bad-request` - The request information sent could not be understood or contained values that are not allowed.<br>`conflict` - The resource could not be modified because it was already modified by a different request.<br>`unavailable` - The resource or service is currently unavailable. It may become available shortly, or the request may have to be modified to succeed.<br>`credit` - The requestor has insufficient credit to perform the operation or access the resource.<br>`limit` - A usage limit or rate limit for a resource or service has been exceeded.<br>`payment` - There was an error processing a payment. |
| code     | A specific error code string that identifies the type of error.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| message  | A message that describes the error condition in detail.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| details  | A list of name/value pairs of additional details that may help you debug the error.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |

## Error Details Properties
| Property | Description                                                                                                                                                          |
|:---------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| name     | The detail name; there is no complete list of detail names, but conventional resource ID names like userId are used to refer to resources associated with the error. |
| value    | The detail value; the format and content depends on the name.                                                                                                        |

## GET errors
Gets the most recent user errors for the user. Since this operation uses HTTP GET, all the properties are specified as HTTP request parameters.

### Supported Parameters
| Parameter | Description                                                                                                                                                                | Mandatory |
|:----------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------|
| page      | Used for pagination to indicate the page requested for querying a list of user errors. If no value is specified the default is 0.                                          | No        |
| size      | Used for pagination to indicate the size of each page requested for querying a list of user errors. If no value is specified the default value is 25. (Maximum value 1000) | No        |

### Example: Get errors

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/errors \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
// Promise
client.Error.list({size: 1000}).then(function(errorResponse){});

// Callback
client.Error.list({size: 1000}, function(err, errorResponse){});
```

```csharp
var errors = client.Error.List(new ErrorQuery{Size = 1000});
```

> The above command returns JSON structured like this:

```json
[
   {
      "time" : "2012-11-15T01:30:16.208Z",
      "category" : "unavailable",
      "id" : "{userErrorId1}",
      "details" : [
         {
            "id" : "{userErrorDetailId1}"
            "name" : "applicationId",
            "value" : "{applicationId}",
         },
         {
            "id" : "{userErrorDetailId2}",
            "name" : "number",
            "value" : "{number}",
         },
         {
            "id" : "{userErrorDetailId3}",
            "name" : "callId",
            "value" : "{callId}",
         }
      ],
      "message" : "Application {applicationId} (\"Dial a Tune\") for number
                   {number} does not specify a URL for call events",
      "code" : "no-callback-for-call"
   },
   {
      "time" : "2012-11-15T01:29:24.512Z",
      "category" : "unavailable",
      "id" : "{userErrorId2}",
      "message" : "No application is configured for number +19195556666",
      "code" : "no-application-for-number"
   },
]
```

## GET errors/{userErrorId}
Gets information about one error. No query parameters are supported.

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/errors/{userErrorId} \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
// Promise
client.Error.get(userErrorId).then(function(errorInfo){});

// Callback
client.Error.get(userErrorId, function(err, errorInfo){});
```

```csharp
var error = async client.Error.GetAsync("{errorId1}");
```

> The above command returns JSON structured like this:

```
{
  "id": "{userErrorId}",
  "version": 0,
  "user": {
    "@id": 1,
    "accountNonExpired": true,
    "accountNonLocked": true,
    "companyName": "{companyName}",
    "credentialsNonExpired": true,
    "email": "{email}",
    "enabled": true,
    "firstName": "{firstName}",
    "id": "{userId}",
    "lastName": "{lastName}",
    "password": "{password}",
    "username": "{username}"
  },
  "time": 1391514755496,
  "category": "BAD_REQUEST",
  "code": "missing-property",
  "message": "The 'call' resource property 'transferTo' is required but was not specified",
  "details": [
    {
      "id": "{userErrorDetailId1}",
      "version": 0,
      "name": "requestPath",
      "value": "users/{userId}/calls/{callId}"
    },
    {
      "id": "{userErrorDetailId2}",
      "version": 0,
      "name": "remoteAddress",
      "value": "{remoteAddress}"
    },
    {
      "id": "{userErrorDetailId3}",
      "version": 0,
      "name": "requestMethod",
      "value": "POST"
    }
  ]
}
```
