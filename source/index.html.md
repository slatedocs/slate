---
title: API Reference

language_tabs:
  - shell: cURL
  - python

toc_footers:
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

The RESTful API for iLO 4 and Moonshot iLO Chassis Management Module is a programming interface enabling state-of-the-art server management. This document contains helpful information about how to interact with the RESTful API. The RESTful API uses the basic HTTP operations (GET, PUT, POST, DELETE, and PATCH) to submit or return a JSON formatted resource to or from a URI on iLO 4 or Moonshot iLO Chassis Management Module.
With modern scripting languages, you can easily write simple REST clients for RESTful APIs. Most languages, like Python, can transform JSON into internal-data structures, like dictionaries, allowing for easy access to data. This enables you to write custom code directly to the RESTful API, instead of using intermediate tools such as HPE’s HPQLOCFG or CONREP.

This document has been updated with examples from iLO 4 version 2.30 firmware.
 
## Redfish 1.0 Conformance

The RESTful API was first released with iLO 4 2.00 on HPE Gen9 servers. The RESTful API also functioned as the starting point for the new Redfish 1.0 DMTF standard at [http:// www.dmtf.org/standards/redfish](http:// www.dmtf.org/standards/redfish)

Since the introduction of the RESTful API, a number of changes were introduced into the Redfish standard by the DMTF SPMF members. At a high level, the changes include:

* Use of OData annotations throughout the data to communicate meta-data
* Revision of Error structures
* Removal or Rename of certain JSON properties
* Use of different collection schema
* Use of a different set of entry-point URIs (/redfish/v1/ vs. /rest/v1)

iLO 4 2.30 is Redfish 1.0 conformant while remaining backward compatible with the existing RESTful API. Moving forward, the RESTful API will become the iLO 4 enhanced implementation of Redfish. While conforming to the Redfish 1.0 standard, the RESTful API is extended with Hewlett Packard Enterprise-specific features such as BIOS configuration. You should plan to update your client code to confirm to the Redfish standard. iLO will eventually remove any properties that do not match the Redfish schema definitions (while preserving the OEM extensions.)

iLO 4 2.30 achieves Redfish 1.0 conformance and backward compatibility by:

1. Mirroring the resource model at both /redfish/v1/ and /rest/v1.
1. Returning both compatibility and Redfish properties by default.
1. Returning only Redfish conformant properties (with Hewlett Packard Enterprise extensions) if the Redfish-required OData header is included in the request (OData-Version: 4.0).

## REST APIs Architected using HATEOS

Representational State Transfer (REST) is a web service that uses basic CRUD (Create, Read, Update, Delete, and Patch) operations performed on resources using HTTP commands such as POST, GET, PUT, PATCH, and DELETE. The RESTful API is designed using a REST architecture called HATEOS (Hypermedia as the Engine of Application State). This architecture allows the client to interact with iLO through a simple fixed URL (rest/v1) and several other top-level URIs documented in the iLO Data Model. The rest of the data model is discoverable by following clearly identified “links” in the data. This has the advantage that the client does not need to know a set of fixed URLs. When you create a script to automate tasks using the RESTful API, you only need to hardcode this simple URL and design the script to discover the REST API URLs that are needed to complete a task. To learn more about REST and HATEOAS concepts, see:

* [http://en.wikipedia.org/wiki/Representational_state_transfer](http://en.wikipedia.org/wiki/Representational_state_transfer)
* [http://en.wikipedia.org/wiki/HATEOAS](http://en.wikipedia.org/wiki/HATEOAS)

## Key benefits of the RESTful API

The RESTful API is becoming the main management interface for iLO 4 and Moonshot iLO Chassis Management Module-based Hewlett Packard Enterprise servers. Its feature set will become larger than the existing iLO XML API (RIBCL) and IPMI interfaces. Using the RESTful API, you can take full inventory of the server, control power and reset, configure BIOS and iLO settings, fetch event logs, as well as many other functions.

The RESTful API follows the trend of the Internet in moving to a common pattern for new software interfaces. Many web services in a variety of industries use REST APIs because they are easy to implement, easy to consume, and offer scalability advantages over previous technologies.

HPE OneView, OpenStack, and many other server management APIs are now REST APIs. Most Hewlett Packard Enterprise Management software offerings, as well as the entire Software Defined Infrastructure, are built upon REST APIs.

The RESTful API has the additional advantage of consistency across all present and projected server architectures. The same data model works for traditional rack-mount servers, blades, as well as newer types of systems like Moonshot. This advantage comes because the data model is designed to self-describe the service’s capabilities to the client and has room for flexibility designed in from the start

# Getting Started

## Tips for Using the RESTful API

The RESTful API for iLO is available on ProLiant Gen9 servers running iLO 4 2.00 or later with the iLO Standard license, although some features in the data might not be available without an Advanced license. The RESTful API for Moonshot iLO Chassis Management Module is available on Moonshot servers running iLO Chassis Manager 1.30 or later and does not require a license.

To access the RESTful API, you need an HTTPS-capable client, such as a web browser with  the Postman REST Client plugin extension or CURL (a popular command line HTTP utility).

## RESTful Interface Tool and Python Examples

Although not a requirement, you can use the RESTful Interface Tool with the RESTful API. This command line tool provides a level of abstraction and convenience above direct access to the RESTful API. For details see: [http://www.hpe.com/info/restfulapi](http://www.hpe.com/info/restfulapi).

Also, Hewlett Packard Enterprise published example Python code that implements a number of common operations in a RESTful API client. This code can be downloaded at [https://github.com/HewlettPackard/python-proliant-sdk](https://github.com/HewlettPackard/python-proliant-sdk). In some cases the examples in this document may refer to examples in the Python code with this notation:

> ***Python**: See ex1_functionname() in the Python example code. This means look for the specified function name in the python example code.*

If you prefer not to implement a client in Python, this serves as a good pseudocode implementing the logic required to perform an operation.

## Example REST API operation

Let’s perform our first GET operation using the RESTful API. We will do an HTTP GET on the iLO HTTPS port, typically port 443 (although it could be different if you have previously configured iLO to use another port). Your client should be prepared to handle the HTTPS certificate challenge. The interface is not available over open HTTP (port 80), so you must use HTTPS.

Our GET operation will be against a resource at /rest/v1 (without a trailing slash):

* **Correct**: GET https://myilo/rest/v1
* **Incorrect**: GET https://myilo/rest/v1/

It is best to perform this initial GET with a tool like the CURL or the Postman REST Client mentioned above. Later you will want to do this with your own scripting code, but for now it’s useful to see the HTTP header information exchanged using a browser.

## CURL Example

CURL is a command line utility available for many Operating Systems that enables easy access to the RESTful API. CURL is available at [http://curl.haxx.se/](http://curl.haxx.se/). Note that all the CURL examples will use a flag –insecure. This causes CURL to bypass validation of the HTTPS certificate. In real use iLO should be configured to use a user-supplied certificate and this option is not necessary. Notice also that we use the –L option to force CURL to follow HTTP redirect responses. If iLO changes URI locations for various items, it can indicate to the client where the new location is and automatically follow the new link.

```shell
> curl https://myilo/rest/v1 -i --insecure -L
```
>* -i returns HTTP response headers 
>* --insecure bypasses TLS/SSL certification verification
>* -L follows HTTP redirect.
>
>The above command returns JSON like this:

```json
{
	"@odata.type": "#ServiceRoot.v1_0_0.ServiceRoot",
	"Name": "Service Root",
	"RedfishVersion": "0.96.0",
	"@odata.id": "/redfish/v1/",
	"@odata.context": "/redfish/v1/$metadata#ServiceRoot",
	"Time": "2014-09-03T11:00:00+00:00",
	"UUID": "92384634-2938-2342-8820-489239905423",
	"Oem": {
		"Hp": {
			"@odata.type": "#HpiLOServiceExt.1.0.0.HpiLOServiceExt",
			"Manager": [{
				"ManagerFirmwareVersion": "2.50",
				"HostName": "ILOHD53NP0108",
				"ManagerType": "iLO 4",
				"IPManager": {
					"ManagerUrl": {
						"xref": "https://16.85.178.23"
					},
					"Name": "Management Console Information",
					"ManagerType": "OneView",
					"OvManagesiLOIP": false,
					"ManagerProductName": "HP OneView",
					"FirmwareManaged": false,
					"SppVersion": null,
					"StorageManaged": false,
					"iLOManaged": true,
					"Type": "HPQ_iLOManagerDescriptor/1.1.0",
					"BiosManaged": false
				},
				"Blade": {
					"BayNumber": "Bay 3"
				},
				"FQDN": "ILOHD53NP0108.americas.hpqcorp.net",
				"DefaultLanguage": "en",
				"Languages": [{
					"Version": "2.50.15",
					"Language": "en",
					"TranslationName": "English"
				}],
				"ManagerFirmwareVersionPass": "15"
			}],
			"Sessions": {
				"LocalLoginEnabled": true,
				"LoginFailureDelay": 0,
				"LDAPAuthLicenced": true,
				"KerberosEnabled": false,
				"ServerName": "WIN-MKNP1GNHVSN",
				"SecurityOverride": true,
				"CertCommonName": "ILOHD53NP0108.americas.hpqcorp.net",
				"LoginHint": {
					"HintPOSTData": {
						"UserName": "username",
						"Password": "password"
					},
					"Hint": "POST to /Sessions to login using the following JSON object:"
				},
				"LDAPEnabled": false
			}
		}
	},
	"Id": "v1",
	"Chassis": {
		"@odata.id": "/redfish/v1/chassis/"
	},
	"Managers": {
		"@odata.id": "/redfish/v1/managers/"
	},
	"Systems": {
		"@odata.id": "/redfish/v1/systems/"
	},
	"Providers": {
		"@odata.id": "/redfish/v1/providers/"
	},
	"Sessions": {
		"@odata.id": "/redfish/v1/sessions/"
	}
}
```

In JSON, there is no strong ordering of property names, so iLO may return JSON properties in any order. Likewise, iLO cannot assume the order of properties in any submitted JSON. This is why the best scripting data structure for a RESTful client is a dictionary: a simple set of unordered key/value pairs. This lack of ordering is also the reason you see embedded structure within objects (objects within objects). This allows us to keep related data together that is more logically organized, aesthetically pleasing to view, and helps avoid property name conflicts or ridiculously long property names. It also allows us to use identical blocks of JSON in many places in the data model, like status.


## HTTP Resource Operations

Operation | HTTP Command | Description
-------------- | -------------- | --------------
Create | POST resource URI (payload = resource data) | Creates a new resource or invokes a custom action. A synchronous POST returns the newly created resource.
Read | GET resource URI | Returns the requested resource representation.
Update | PATCH or PUT resource URI (payload = update data) | Updates an existing resource. You can only PATCH properties that are marked readonly = false in the schema.
Delete | DELETE resource URI | Deletes the specified resource.

## HTTP Status Return Codes

Return Status | Description
-------------- | -------------- | --------------
2xx | Successful operation.
308 | The resource has moved
4xx | Client-side error with message returned
5xx | iLO error with error message returned

<aside class="notice">
NOTE:	If an error occurs, indicated by a return code 4xx or 5xx, an ExtendedError or ExtendedInfo JSON response is returned. The expected resource is not returned.
</aside>


# Navigating the Data Model

Unlike some simple REST service, this API is designed to be implemented on many different models of servers and other IT infrastructure devices for years to come.  These devices may be quite different from one another.  For this reason, the API does not specify the URIs to various resources. Do not assume the BIOS version information is always at a particular URI.

This is more complex for the client, but is necessary to make sure the data model can change to accommodate various future server architectures without requiring specification changes. As an example, if the BIOS version is at /rest/v1/Systems/1, and a client assumed it is always there, the client would then break when the interface is implemented on a different type of architecture with many compute nodes, each with its own BIOS version. 

<aside class="warning">
A select few URIs are documented to be stable starting points. Your client code should not assume anything about the URIs that you find in the data model. You must treat them as opaque strings or your client will not interoperate with other implementations of the RESTful API.  
</aside>

The supported stable URIs are those referenced directly in this API reference and include:

* /redfish/v1/
* /redfish/v1/systems/
* /redfish/v1/chassis/
* /redfish/v1/managers/
* /redfish/v1/sessions/


## Iterating Collections

Many operations will require you to locate the resource you wish to use.  Most of these resources are members of "collections" (arrays of similar items).  The method to find collections members is consistent for compute nodes, chassis, management processors, and many other resources in the data model.

> GET https://{iLO}/redfish/v1/systems/ showing a collection response (JSON)

```json
{
    "@odata.id": "/redfish/v1/systems/",
    "@odata.context": "/redfish/v1/$metadata/",
    "@odata.type": "#ComputerSystemCollection.ComputerSystemCollection",
    "Members@odata.count": 1,
    "Members": [
        {
            "@odata.id": "/redfish/v1/systems/1/"
        }
    ]
}
```

> Example of a collection iterator

```python

	# this is a general purpose utilty generator that returns collection members
	def collection(host, collection_uri, request_headers, iLO_loginname, iLO_password):

	    # get the collection
	    status, headers, thecollection = rest_get(host, collection_uri, request_headers, iLO_loginname, iLO_password)
	
	    while status < 300:
	
	        # verify expected type
	
	        # NOTE:  Because of the Redfish standards effort, we have versioned many things at 0 in anticipation of
	        # them being ratified for version 1 at some point.  So this code makes the (unguarranteed) assumption
	        # throughout that version 0 and 1 are both legitimate at this point.  Don't write code requiring version 0 as
	        # we will bump to version 1 at some point.
	
	        # hint:  don't limit to version 0 here as we will rev to 1.0 at some point hopefully with minimal changes
	        assert(get_type(thecollection) == 'Collection.0' or get_type(thecollection) == 'Collection.1')
	
	        # if this collection has inline items, return those
	
	        # NOTE:  Collections are very flexible in how the represent members.  They can be inline in the collection
	        # as members of the 'Items' array, or they may be href links in the links/Members array.  The could actually
	        # be both.  Typically, iLO implements the inline (Items) for only when the collection is read only.  We have
	        # to render it with the href links when an array contains PATCHable items because its complex to PATCH
	        # inline collection members.
	        # A client may wish to pass in a boolean flag favoring the href links vs. the Items in case a collection
	        # contains both.
	
	        if 'Items' in thecollection:
	
	            # iterate items
	            for item in thecollection['Items']:
	                # if the item has a self uri pointer, supply that for convenience
	                memberuri = None
	                if 'links' in item and 'self' in item['links']:
	                    memberuri = item['links']['self']['href']
	
	                # Read up on Python generator functions to understand what this does.
	                yield 200, None, item, memberuri
	
	        # else walk the member links
	        elif 'links' in thecollection and 'Member' in thecollection['links']:
	
	            # iterate members
	            for memberuri in thecollection['links']['Member']:
	                # for each member return the resource indicated by the member link
	                status, headers, member = rest_get(host, memberuri['href'], request_headers, iLO_loginname, iLO_password)
	
	                # Read up on Python generator functions to understand what this does.
	                yield status, headers, member, memberuri['href']
	
	        # page forward if there are more pages in the collection
	        if 'links' in thecollection and 'NextPage' in thecollection['links']:
	            next_link_uri = collection_uri + '?page=' + str(thecollection['links']['NextPage']['page'])
	            status, headers, thecollection = rest_get(host, next_link_uri, request_headers, iLO_loginname, iLO_password)
	
	        # else we are finished iterating the collection
	        else:
	            break

	def example_iterate_compute_nodes(host, iLO_loginname, iLO_password):

	    # for each system in the systems collection at /redfish/v1/systems/
	    for status, headers, system, memberuri in collection(host, '/redfish/v1/systems/', None, iLO_loginname, iLO_password):
	
	        # do something with the returned compute node
```


## Find a Compute Node

A Compute node represents a logical computer system with attributes such as processors, memory, BIOS, power state, firmware version, etc.  To find a compute node `GET /redfish/v1/systems` and iterate the "Members" array in the returned JSON.  Each member has a link to a compute node.

Find a compute node by iterating the systems collection at `/redfish/v1/systems/`.

You can then GET the compute node, PATCH values, or perform Actions.

>    GET https://{host}/redfish/v1/systems/{item}

## Find a Chassis

A Chassis represents a physical or virtual container of compute resources with attrbutes such as FRU information, power supplies, temperature, etc.  To find a chassis `GET /redfish/v1/chassis` and iterate the "Members" array in the returned JSON.  Each member has a link to a chassis.

Find a chassis by iterating the chassis collection at `/redfish/v1/chassis/`.

You can then GET the chassis, PATCH values, or perform Actions.

>    GET https://{host}/redfish/v1/chassis/{item}

## Find the iLO 4 Management Processor

A Manager represents a management processor (or "BMC") that manages chassis and compute resources.  For HPE Servers, the manager is iLO 4.  Managers contain attributes such as networking state and configuration, management services, security configuration, etc.  To find a manager `GET /redfish/v1/managers` and iterate the "Members" array in the returned JSON.  Each member has a link to a chassis.

Find a manager by iterating the manager collection at `/redfish/v1/managers/`.

You can then GET the manager, PATCH values, or perform Actions.

>    GET https://{host}/redfish/v1/manager/{item}


# Authentication and Sessions

If you perform an HTTP operation on any other resource other than the root `/redfish/v1/` resource, you will receive an `HTTP 401 (Forbidden)` error indicating that you don’t have the authentication needed to access the resource.


> The following shows the error displayed on GET /rest/v1/Systems when no authentication is attempted:

```
401 Forbidden
```

```json
    {
        "@odata.type": "#ExtendedInfo.ExtendedInfo",
	    "Messages": [
		    {
		    	"MessageID": "Base.0.10.NoValidSession"
		    }
	    ],
	    "Type": "ExtendedError.1.0.0",
	    "error": {
	    "@Message.ExtendedInfo": [
		    {
		    	"MessageId": "Base.0.10.NoValidSession"
		    }
	    ],
	    "code": "iLO.0.10.GeneralError",
	    "message": "A general error has occurred. See ExtendedInfo for more information."
	    }
    }
```

## Basic Authentication

The RESTful API allows you to use HTTP Basic Authentication using a valid iLO user name and password.

```shell
> curl https://myilo/rest/v1/Systems -i --insecure -u username:password -L
```
```
HTTP/1.1 200 OK Allow: GET, HEAD
Cache-Control: no-cache Content-length: 437
Content-type: application/json Date: Tue, 05 Aug 2014 14:39:56 GMT ETag: W/"9349EA93"
Link: </rest/v1/SchemaStore/en/ComputerSystemCollection.json>; rel=describedby Server: HP->
```
```json    
    {
    	"@odata.context": "/redfish/v1/$metadata#Systems",
    	"@odata.id": "/redfish/v1/Systems/",
    	"@odata.type": "#ComputerSystemCollection.ComputerSystemCollection",
    	"Description": "Computer Systems view",
    	"MemberType": "ComputerSystem.1",
    	"Members": [{
    		"@odata.id": "/redfish/v1/Systems/1/"
    	}],
    	"Members@odata.count": 1,
    	"Name": "Computer Systems",
    	"Total": 1,
    	"Type": "Collection.1.0.0",
    	"links": {
    		"Member": [{
    			"href": "/rest/v1/Syst ems/1"
    		}],
    		"self": "/rest/v1/Systems"
    	}
    }

```

## Creating and Using Sessions

For more complex multi-resource operations, you should log in and establish a session. To log in, iLO has a session manager object at the documented URI `/rest/v1/sessions`. To create a session POST a JSON object to the Session manager:

> To create a session perform an HTTP POST /redfish/v1/sessions/ with the required HTTP headers and a JSON body containing:

```json
    {
    	"UserName": "<your username>", 
    	"Password": "<your password>"
    }
```
<aside class="notice">
You must include the HTTP header `Content-Type: application/json`
for all RESTful API operations that include a request body in JSON format.
</aside>

If the session is created successfully, you receive an HTTP 201 (Created) response from iLO. There will also be two important HTTP response headers.

* **X-Auth-Token**	Your session token (string).	This is a unique string for your login session. It must be included as a header in all subsequent HTTP operations in the session.

* **Location**	The URI of the newly created session resource.	iLO allocates a new session resource describing your session. This is the URI that you must DELETE against in order to log out. If you lose this location URI, you can find it by crawling the HREF links in the Sessions collection. Store this URI to facilitate logging out.

> Successful login response from iLO:

```
Content-type → application/json; charset=utf-8
Link → </redfish/v1/SessionService/Sessions/{item}/>; rel=self
Location → https://{iLO}/redfish/v1/SessionService/Sessions/{item}/
X-Auth-Token → c9b3b084490d5b690a7091da2bf4a906
``` 

```json
{
  "Messages": [
    {
      "MessageID": "Base.0.10.Created"
    }
  ],
  "Type": "ExtendedError.1.0.0",
  "error": {
    "@Message.ExtendedInfo": [
      {
        "MessageID": "Base.0.10.Created"
      }
    ],
    "code": "iLO.0.10.ExtendedInfo",
    "message": "See @Message.ExtendedInfo for more information."
  }
}
```

<aside class="warning">
It is good practice to save the Location URI of the newly created session.  This is your unique session information and is need to log out later.
</aside>

## Using a Session

To use a session, simply include the `X-Auth-Token` header supplied by the login response in all REST requests.

## Log Out of a Session

iLO supports a limited number of simultaneous sessions.  If you do not log out of a session it will expire automatically after a time of inactivity.  However, it is good practice to log out when finished with a session.

To log out perform an `HTTP DELETE` to the URI that was returned in the "Location" header when you created the session.

> DELETE https://{host}/redfish/v1/sessions/{item}

<aside class="notice">
If you cannot preserve the session URI on login, you may iterate the Sessions collection at `/redfish/v1/sessions/`.  Be sure to include the `X-Auth-Token header`.  For each session look for a JSON property called `"MySession"` that is true. You may then DELETE that URI.
</aside>



# Kittens

## Get All Kittens

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
```

```shell
curl "http://example.com/api/kittens"
  -H "Authorization: meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

# Best Practices for Writing a Client

When developing a client for the RESTful API, be sure to not code based upon assumptions that are not guaranteed. The reason avoiding these assumptions is so important is that implementations may vary across systems and firmware versions, and we want your code to work consistently.

## API Architecture ##
The RESTful API is a hypermedia API by design. This is to avoid building in restrictive assumptions to the data model that will make it difficult to adapt to future hardware implementations. A hypermedia API avoids these assumptions by making the data model discoverable via links between resources.

The client should not interact with a URI as if it will remain static. Only specific top-level URIs (any URI in this sample code) can be assumed as static.

All URIs, with the exception of known top-level URIs, must be discovered dynamically by following the href links in the data model. Clients should not make assumptions about the URIs for the resource members of a collection. For instance, the URI of a collection member will NOT always be /rest/v1/.../collection/1, or 2. On Moonshot a System collection member might be /rest/v1/Systems/C1N1.

## Traversing the data model to find URIs

Although the resources in the data model are linked together, because of cross link references between resources, a client may not assume the resource model is a tree. It is a graph instead, so any crawl of the data model should keep track of visited resources to avoid an infinite traversal loop.

A reference to another resource is any property called href (@odata.id in Redfish) no matter whereit occurs in a resource.

An external reference to a resource outside the data model is referred to by a property called "extref". Any resource referred to by extref should not be assumed to follow the conventions of the API.

## On HTTP POST to Create new Resources

When POSTing to create a resource (e.g. create an account or session), a successful response includes a Location HTTP header indicating the resource URI of the newly created resource. The POST may also include a representation of the newly created object in a JSON response body but may not. Do not assume the response body, but test it. It may also be an ExtendedError object.

## HTTP Redirect

All clients must correctly handle HTTP redirect (e.g. 308, 301, and so on.) iLO 4 will use redirection as a way to alias portions of the data model and to migrate the data model to the Redfish specified URIs (for example, /redfish/…).

# Other Resources

* Redfish 1.0 DMTF standard at [http:// www.dmtf.org/standards/redfish](http:// www.dmtf.org/standards/redfish)

* HPE RESTful API Home page: [http://www.hpe.com/info/restfulapi](http://www.hpe.com/info/restfulapi).

* Example Python code:  [https://github.com/HewlettPackard/python-proliant-sdk](https://github.com/HewlettPackard/python-proliant-sdk). 








