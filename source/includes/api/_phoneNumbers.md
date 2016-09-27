# Phone numbers
The Phone Numbers resource lets you get phone numbers for use with your programs and manage numbers you already have.

## Properties
| Property       | Description                                                                                      |
|:---------------|:-------------------------------------------------------------------------------------------------|
| id             | The unique id of the phone number.                                                               |
| name           | A name you choose for this number.                                                               |
| number         | The telephone number in E.164 format.                                                            |
| nationalNumber | The telephone number in a friendly national format, e.g. (555) 5555-5555                         |
| city           | The city of the phone number.                                                                    |
| state          | The state of the phone number.                                                                   |
| applicationId  | The unique id of an Application you want to associate with this number.                          |
| application    | The URI of the application associated with the number for inbound phone calls and text messages. |
| fallbackNumber | Number to transfer an incoming call when the callback/fallback events can’t be delivered.        |
| price          | The monthly price for this number.                                                               |
| createdTime    | Date when the number was created. Timestamp follows the ISO8601 format (UTC).                    |
| numberState    | The phone number state, values are `enabled` or `released`                                       |

## GET phoneNumbers
Gets a list of your numbers. Since this operation uses HTTP GET, all the properties are specified as HTTP request parameters.

### Supported Parameters
| Parameter     | Description                                                                                                                                                                  | Mandatory |
|:--------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------|
| page          | Used for pagination to indicate the page requested for querying a list of phone numbers. If no value is specified the default is 0.                                          | No        |
| size          | Used for pagination to indicate the size of each page requested for querying a list of phone numbers. If no value is specified the default value is 25. (Maximum value 1000) | No        |
| applicationId | Used to filter the retrieved list of numbers by an associated application ID.                                                                                                | No        |
| state         | Used to filter the retrieved list of numbers allocated for the authenticated user by a US state.                                                                             | No        |
| name          | Used to filter the retrieved list of numbers allocated for the authenticated user by it’s name.                                                                              | No        |
| city          | Used to filter the retrieved list of numbers allocated for the authenticated user by it’s city.                                                                              | No        |
| numberState   | Used to filter the retrieved list of numbers allocated for the authenticated user by the number state.                                                                       | No        |

### Example: List phone numbers

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/phoneNumbers \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
// Promise
client.PhoneNumber.list({size: 1000}).then(function(numbersResponse){});

// Callback
client.PhoneNumber.list({size: 1000}, function(err, numbersResponse){});
```

```csharp
var numbers = client.PhoneNumber.List(new PhoneNumberQuery {Size = 1000});
```


> The above command returns JSON structured like this:

```json
[
{
   "id": "{numberId1}",
   "application": "https://catapult.inetwork.com/v1/users/users/u-ly123/applications/a-j321",
   "number":"{number1}",
   "nationalNumber":"{national_number1}",
   "name": "home phone",
   "createdTime": "2013-02-13T17:46:08.374Z",
   "state": "NC",
   "price": "0.60",
   "numberState": "enabled"
},
{
   "id": "{numberId2}",
   "application": "https://catapult.inetwork.com/v1/users/users/u-ly123/applications/a-j123",
   "number":"{number2}",
   "nationalNumber":"{national_number2}",
   "name": "work phone",
   "createdTime": "2013-02-13T18:32:05.223Z",
   "state": "NC",
   "price": "0.60",
   "numberState": "enabled"
}
]
```

## POST phoneNumbers
Allocates a number so you can use it to make and receive calls and send and receive messages.

### Supported Parameters
| Parameter      | Description                                                                                 | Mandatory |
|:---------------|:--------------------------------------------------------------------------------------------|:----------|
| number         | An available telephone number you want to use (must be in E.164 format, like +19195551212). | Yes       |
| name           | A name you choose for this number.                                                          | No        |
| applicationId  | The unique id of an Application you want to associate with this number.                     | No        |
| fallbackNumber | Number to transfer an incoming call when the callback/fallback events can’t be delivered.   | No        |

### Example: Allocate a phone number to your account
To allocate the phone number {number} with the name "home phone" and the fallbackNumber {fallback_number} you can make calls with it, send the following request:

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/ \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
		-d \
	'
	{
		"number": "+15555555555",
		"name": "home phone"
		"fallbackNumber": "{fallback_number}"
	}'
```

```js
//Allocate number +1234567980

// Promise
client.PhoneNumber.create({ number : "+1234567890" }).then(function(number){});

// Callback
client.PhoneNumber.create({ number : "+1234567890" }, function(err, number){});
```

```csharp
var number = await client.PhoneNumber.CreateAsync(new CreatePhoneNumberData {Number = "+1234567890"});
```

> The above command returns HTTP Header structured like this:

```
HTTP/1.1 201 Created
Location: /v1/users/{userId}/phoneNumbers/{numberId}
```

## GET phoneNumbers/{numberId}
Gets information about one of your numbers using the number's ID. No query parameters are supported.

or

Gets information about one of your numbers using the E.164 number string, like "+19195551212". Remember to URL encode the plus sign prefix. No query parameters are supported.

### Example: Get number properties by E.164 or Id

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/phoneNumbers/%20{number} \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
// Promise
client.PhoneNumber.get(numberId).then(function(number){});
// or
client.PhoneNumber.get("+1234567890").then(function(number){});

// Callback
client.PhoneNumber.get(numberId, function(err, number){});
// or
client.PhoneNumber.get("+1234567890", function(err, number){});
```

```csharp
var number = await client.PhoneNumber.GetAsync("+1234567890");
```

> The above command returns JSON structured like this:

```
{
   "id": "{numberId}",
   "application": "https://catapult.inetwork.com/.../applications/{applicationId}",
   "number":"{number}",
   "nationalNumber":"{national_number}",
   "name": "home phone",
   "createdTime": "2013-02-13T17:46:08.374Z",
   "city": "Raleigh",
   "state": "NC",
   "price": "0.60",
   "numberState": "enabled"
}
```

## POST phoneNumbers/{numberId}
Makes changes to a number you have. POST a new JSON representation with the property values you desire to the URL that you got back in the "Location" header when you first allocated it. Properties you don't send will remain unchanged. The "numberId" refers to the numberId or the number itself. When using the number itself remember to URL encode the plus sign prefix.

### Supported Parameters
| Parameter      | Description                                                                                                      | Mandatory |
|:---------------|:-----------------------------------------------------------------------------------------------------------------|:----------|
| applicationId  | The unique id of an Application resource you want to associate with this number for incoming calls and messages. | No        |
| name           | A name you choose for this number.                                                                               | No        |
| fallbackNumber | Number to transfer an incoming call when the callback/fallback events can’t be delivered.                        | No        |

### Example: Change the Application resource a phone number uses for inbound calls and messages

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/phoneNumbers/{numberId} \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
		-d \
	'
	{
		"applicationId": "{application_id}"
	}'
```

```js
// Promise
client.PhoneNumber.update(numberId, {applicationId: "{application_id}"}).then(function(){});

// Callback
client.PhoneNumber.update(numberId, {applicationId: "{application_id}"}, function(err){});
```

```csharp
await client.PhoneNumber.UpdateAsync(numberId, new UpdatePhoneNUmberData {
    ApplicationId = "{application_id}"
});
```


## DELETE phoneNumbers/{numberId}
Removes a number from your account so you can no longer make or receive calls, or send or receive messages with it. When you remove a number from your account, it will not be available to add back to your account, so be careful.

```shell
curl -v -X DELETE https://api.catapult.inetwork.com/v1/users/{userId}/phoneNumbers/{numberId} \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
// Promise
client.PhoneNumber.delete(numberId).then(function(){});

// Callback
client.PhoneNumber.delete(numberId, function(err){});
```

```csharp
await client.PhoneNumber.DeleteAsync(numberId);
```
