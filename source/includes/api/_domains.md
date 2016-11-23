# Domains
A domain is a way to logically group endpoints. There is a 100 domain max. per account limit. Most use cases require using a single domain for all endpoints. The name of the domain will be part of a public DNS record. For that reason, we let the customer choose their domain names. Once a domain has been created, endpoints can be created and managed within the context of the domain. Because endpoints can only exist within the context of a domain, creating a domain is the first step in creating endpoints.

## Properties
| Property    | Description                                         |
|:------------|:----------------------------------------------------|
| name        | The name is a unique URI to be used in DNS lookups  |
| description | String to describe the domain                       |
| endpoints   | URL to use to GET list of endpoints on this domain. |
| id          | Unique string to identify the domain resource       |

## GET domains
This returns a list of the domains that have been created

```shell
curl -v -X GET https://api.catapult.inetwork.com/v1/users/{userId}/domains \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
client.Domain.list()
.then(function (domains) {
	console.log(domains);
});
```

> The above command returns JSON structured like this:

```
[
{
	"id" : "dom-xyz123",
		"name" : "mycoolapp",
	"description" : "disruptive app that's going to revolutonize telecom",
		"endpoints" : "/v1/users/{user-id}/domains/dom-xyz123/endpoints"
	},
{
	"id" : "dom-abc876",
		"name" : "mycoolapp_stage",
	"description" : "stage env for disruptive app",
		"endpoints" : "/v1/users/{user-id}/domains/dom-abc876/endpoints"
	}
]
```

## POST domains
This will create a domain.

<aside class="notice">
Your account is limited to 100 domains per account. Most use cases require using a single domain for all endpoints.
</aside>

### Example: Create a domain

```shell
curl -v -X POST https://api.catapult.inetwork.com/v1/users/{userId}/domains \
	-u {token}:{secret} \
	-H "Content-type: application/json" \
		-d \
	'
	{
		"name" : "mycoolapp",
		"description" : "disruptive app that is going to revolutionize telecom"
	}'
```

```js
var params = {
  name: "mycoolapp",
  description: "disruptive app that is going to revolutionize telecom"
}
client.Domain.create(params)
.then(function (domainId) {
  console.log(domainId);
});
```

> The above command returns HTTP Header structured like this:

```
HTTP/1.1 201 Created
Location: /v1/users/{user-id}/domains/{domain-id}
```

## DELETE domain
This will delete a domain

### Example: Delete a domain

```shell
curl -v -X DELETE https://api.catapult.inetwork.com/v1/users/{userId}/domain/{domain-id} \
	-u {token}:{secret} \
	-H "Content-type: application/json"
```

```js
client.Domain.delete("{domain-id}")
.then(function () {});
```
