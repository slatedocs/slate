# Endpoints
An endpoint represents is an entity that can register with the Application Platform SIP Registrar and place and receive calls. This can be a device like a phone or a pad, or it can be a softphone on a computer.

An endpoint is addressable using a unique SIP URI which is constructed using the endpoint's user name and the domain in which the endpoint exists.

There are no restrictions on the number of SIP clients that can be associated with an endpoint.  That is, an application can create one endpoint in the App Platform and give the SIP URI and credentials to as many of their own clients as it likes.  However, when a call is made to the SIP URI for that endpoint, all clients registered as that endpoint (using that SIP URI and credentials to register) will receive the call.  The call will be completed to the first client that answers.  If you're looking for a default simultaneous ringing application this would be a great solution.  If you have an endpoint that goes directly to voicemail though, you might wonder why your other devices ring but by the time you answer, there's no call.

If you don't want all your SIP clients to ring simultaneously, create an endpoint for each client.  You can still associate a single phone number with a group of clients, but the application has more control over which client will ring when that number is called.

## Where to Register
When an endpoint is created on Bandwidth, a unique SIP URI is created to identify that endpoint.  That SIP URI is used in both the `To` and `From` headers in the REGISTER message.  The Request URI of the REGISTER message must use the domain from the SIP URI of the client registering.  The domain is resolved via DNS to determine where to send the REGISTER message.

## Calls to a Client
When a new incoming call is to a number the application has associated with one, or some of its clients, the application can initiate an outbound call using the SIP URI.  Any client registered using the credentials associated with that SIP URI will receive the call.  The first one to answer will be connected, on the other clients the call will be canceled.  Once that outbound call is connected, the application can bridge the original inbound call with the newly created outbound call.

## Calls from a Client
When a client wants to initiate a call, it sends an INVITE with the called number in the user part of the SIP URI in the 'To' header.  The 'From' header will be the SIP URI associated with the endpoint.

An application must be associated with the endpoint representing the client in Bandwidth.  This is so Bandwidth can generate an event to the application to determine how a call should be handled.  If no application is associated with the endpoint, the client's call will be rejected.

Where the INVITE is sent is determined in the same way as the REGISTER.  The domain from the client's SIP URI is used in the Request URI for the INVITE message.

## Properties
| Property      | Description                                                                                                                                                                                                                                                                                                                                                              |
|:--------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| name          | The endpoint’s name, which SIP clients use as the `address of record` in the `To` header when registering. The name must be a valid SIP `user` or `telephone-subscriber` string. RFC 3261 Section 19.1.1 defines the characters that are valid in those parts of a SIP URI. Names must be unique within the domain, and cannot be changed after the endpoint is created. |
| description   | String to describe endpoint                                                                                                                                                                                                                                                                                                                                              |
| domainId      | The id of the domain in which the endpoint will be created. This is the id of the domain resource created in an earlier step.                                                                                                                                                                                                                                            |
| applicationId | The id of the application associated with this endpoint. Application\_id is used to determine the callback URL to be used when a client associated with the endpoint attempts to make a call.                                                                                                                                                                            |
| enabled       | When set to true, SIP clients can register as this device to receive and make calls. When set to false, registration, inbound, and outbound calling will not succeed. Default is true.                                                                                                                                                                                   |
| credentials   | Contains SIP authentication credentials. See below for details of credentials.                                                                                                                                                                                                                                                                                           |
| sipUri        | A SIP URI this device can be contacted at (via INVITE). This property is generated automatically and cannot be changed.                                                                                                                                                                                                                                                  |

## Credentials
| Property | Description                                                                                                                                                                                                                     |
|:---------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| realm    | The realm the SIP client must use when authenticating to use this device.<br>The realm is case-sensitive.<br>This property is generated automatically and cannot be changed.                                                    |
| username | The username the SIP client must use when authenticating to use this device.<br>The username is case-sensitive.<br>This property is generated automatically and cannot be changed.                                              |
| password | The plain-text password the SIP client must use when authenticating to use this device.<br>The password is case-sensitive.<br>The password must be at least 6 characters long and contain only Latin 1 (ISO 8859-1) characters. |

## GET domains/{domain-id}/endpoints
This returns a list of all endpoints associated with a domain.

### Supported Parameters
| Parameter | Description                                                                                                                                                              | Mandatory |
|:----------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------|
| page      | Used for pagination to indicate the page requested for querying a list of endpoints. If no value is specified the default is 0.                                          | No        |
| size      | Used for pagination to indicate the size of each page requested for querying a list of endpoints. If no value is specified the default value is 25. (Maximum value 1000) | No        |

### Example: Get a list of all endpoints for a domain

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/domains/{domainId}/endpoints \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
// Default size (25) using promises
 client.Endpoint.list("domainId")
	 .then(function (res) {});

	// Default size (25) using callbacks
client.Endpoint.list("domainId", function (err, res) {});

// Specify number of endpoints using promises
client.Endpoint.list("domainId", {size: 1000})
		.then(function (res) {});

// Specify number of endpoints using callbacks
client.Endpoint.list("domainId" {size: 1000}, function (err, res) {});
```

> The above command returns JSON structured like this:

```
[
{
	"name" : "jsmith-mobile",
	"description" : "John Smiths mobile client",
	"domainId" : "{domain-id}",
	"applicationId" : "{application-id}",
	"enabled" : "true",
	"sipUri" : "jsmith-mobile@doname.bwapp.bwsipp.io",
	"credentials" : {
		"realm" : "doname.bwapp.bwsipp.io",
		"username" : "jsmith-mobile"
	}
}
]
```

## POST domains/{domain-id}/endpoints
This creates an endpoint.

### Example: Create an endpoint

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/domains/{domain-id}/endpoints \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d \
	'
	{
		"name" : "jsmith_mobile",
		"description" : "John Smiths mobile client",
		"domainId" : "{domain-id}",
		"applicationId" : "{application-id}",
		"enabled" : "false",
		"credentials" : { "password" : "abc123" }
	}'
```

```js
// Promise
client.Endpoint.create("domainId", { name : "my-endpoint", applicationId : "appId",
credentials : { password : "123456" }}).then(function (endpoint) {});
// Callback
client.Endpoint.create("domainId", { name : "my-endpoint", applicationId : "appId",
credentials : { password : "123456" }}, function (err, endpoint) {});
```

> The above command returns HTTP Header structured like this:

```
HTTP/1.1 201 Created
Location: /v1/users/{user-id}/domains/{domain-id}/endpoints/{endpoint-id}
```

## GET domains/{domain-id}/endpoints/{endpoint-id}
This returns a single endpoint.

###Example: Get a single endpoint

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/domains/{domain-id}/endpoints/{endpoint-id} \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
// Promise
client.Endpoint.get(domainId, endpointId).then(function(endpoint){});

// Callback
client.Endpoint.get(domainId, endpointId, function(err, endpoint){});
```

> The above command returns JSON structured like this:

```
{
	"name" : "jsmith-mobile",
	"description" : "John Smiths mobile client",
	"domainId" : "{domain-id}",
	"applicationId" : "{application-id}",
	"enabled" : "true",
	"sipUri" : "jsmith-mobile@doname.bwapp.bwsipp.io",
	"credentials" : {
		"realm" : "doname.bwapp.bwsipp.io",
		"username" : "jsmith-mobile"
	}
}
```

## DELETE domains/{domain-id}/endpoints/{endpoint-id}

### Example: Remove an endpoint

```shell
curl -v -X DELETE https://api.catapult.inetwork.com/v1/users/{userId}/domains/{domain-id}/endpoints/{endpoint-id} \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
// Promise
client.Endpoint.delete("domainId", "endpointId").then(function (endpoint) {});
// Callback
client.Endpoint.delete("domainId", "endpointId", function (err, endpoint) {});
```

## POST domains/{domain-id}/endpoints/{endpoint-id}
This will update an endpoint.

### Example: Update an endpoint

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/domains/{domain-id}/endpoints/{endpoint-id} \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
	-d \
	'
	{
		"description" : "John Smiths mobile client",
		"applicationId" : "{application-id}",
		"enabled" : "true",
			"credentials" : {
			"password" : "12345"
		}
	}'
```

```js
// Promise
client.Endpoint.update("domainId", "endpointId", { enabled : true }).then(function (endpoint) {});
// Callback
client.Endpoint.update("domainId", "endpointId", { enabled : true }, function (err, endpoint) {});
```
