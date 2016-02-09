---
title: API Reference

language_tabs:
  - shell
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
 
### Redfish 1.0 Conformance

The RESTful API was first released with iLO 4 2.00 on HPE Gen9 servers. The RESTful API also functioned as the starting point for the new Redfish 1.0 DMTF standard (see http:// www.dmtf.org/standards/redfish).
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

### REST APIs Architected using HATEOS

Representational State Transfer (REST) is a web service that uses basic CRUD (Create, Read, Update, Delete, and Patch) operations performed on resources using HTTP commands such as POST, GET, PUT, PATCH, and DELETE. The RESTful API is designed using a REST architecture called HATEOS (Hypermedia as the Engine of Application State). This architecture allows the client to interact with iLO through a simple fixed URL (rest/v1) and several other top-level URIs documented in the iLO Data Model. The rest of the data model is discoverable by following clearly identified “links” in the data. This has the advantage that the client does not need to know a set of fixed URLs. When you create a script to automate tasks using the RESTful API, you only need to hardcode this simple URL and design the script to discover the REST API URLs that are needed to complete a task. To learn more about REST and HATEOAS concepts, see:

* http://en.wikipedia.org/wiki/Representational_state_transfer
* http://en.wikipedia.org/wiki/HATEOAS

### Key benefits of the RESTful API

The RESTful API is becoming the main management interface for iLO 4 and Moonshot iLO Chassis Management Module-based Hewlett Packard Enterprise servers. Its feature set will become larger than the existing iLO XML API (RIBCL) and IPMI interfaces. Using the RESTful API, you can take full inventory of the server, control power and reset, configure BIOS and iLO settings, fetch event logs, as well as many other functions.

The RESTful API follows the trend of the Internet in moving to a common pattern for new software interfaces. Many web services in a variety of industries use REST APIs because they are easy to implement, easy to consume, and offer scalability advantages over previous technologies.

HPE OneView, OpenStack, and many other server management APIs are now REST APIs. Most Hewlett Packard Enterprise Management software offerings, as well as the entire Software Defined Infrastructure, are built upon REST APIs.

The RESTful API has the additional advantage of consistency across all present and projected server architectures. The same data model works for traditional rack-mount servers, blades, as well as newer types of systems like Moonshot. This advantage comes because the data model is designed to self-describe the service’s capabilities to the client and has room for flexibility designed in from the start

# HTTP Resource Operations

TODO

# HTTP Status Return Codes

TODO

NOTE:	If an error occurs, indicated by a return code 4xx or 5xx, an ExtendedError or ExtendedInfo JSON response is returned. The expected resource is not returned.

# Tips for Using the RESTful API

The RESTful API for iLO is available on ProLiant Gen9 servers running iLO 4 2.00 or later with the iLO Standard license, although some features in the data might not be available without an Advanced license. The RESTful API for Moonshot iLO Chassis Management Module is available on Moonshot servers running iLO Chassis Manager 1.30 or later and does not require a license.

To access the RESTful API, you need an HTTPS-capable client, such as a web browser with  the Postman REST Client plugin extension or CURL (a popular command line HTTP utility).

# RESTful Interface Tool and Python Examples

Although not a requirement, you can use the RESTful Interface Tool with the RESTful API. This command line tool provides a level of abstraction and convenience above direct access to the RESTful API. For details see: http://www.hpe.com/info/restfulapi.

Also, Hewlett Packard Enterprise published example Python code that implements a number of common operations in a RESTful API client. This code can be downloaded at https://github.com/ HewlettPackard/python-proliant-sdk. In some cases the examples in this document may refer to examples in the Python code with this notation:

> ***Python**: See ex1_functionname() in the Python example code. This means look for the specified function name in the python example code.*

If you prefer not to implement a client in Python, this serves as a good pseudocode implementing the logic required to perform an operation.

# Example REST API operation

Let’s perform our first GET operation using the RESTful API. We will do an HTTP GET on the iLO HTTPS port, typically port 443 (although it could be different if you have previously configured iLO to use another port). Your client should be prepared to handle the HTTPS certificate challenge. The interface is not available over open HTTP (port 80), so you must use HTTPS.

Our GET operation will be against a resource at /rest/v1 (without a trailing slash):

* **Correct**: GET https://myilo/rest/v1
* **Incorrect**: GET https://myilo/rest/v1/

It is best to perform this initial GET with a tool like the CURL or the Postman REST Client mentioned above. Later you will want to do this with your own scripting code, but for now it’s useful to see the HTTP header information exchanged using a browser.

## CURL Example

CURL is a command line utility available for many Operating Systems that enables easy access to the RESTful API. CURL is available at http://curl.haxx.se/. Note that all the CURL examples will use a flag –insecure. This causes CURL to bypass validation of the HTTPS certificate. In real use iLO should be configured to use a user-supplied certificate and this option is not necessary. Notice also that we use the –L option to force CURL to follow HTTP redirect responses. If iLO changes URI locations for various items, it can indicate to the client where the new location is and automatically follow the new link.

```shell
> curl https://myilo/rest/v1 -i --insecure -L
* -i returns HTTP response headers 
* --insecure bypasses TLS/SSL certification verification
* -L follows HTTP redirect.

The above command returns JSON like this:
```
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

## Resource type and version
Notice that the JSON response has a property named Type with a value of “ServiceRoot.1.0.0”. Type is very important in the RESTful API. It is the key to understanding what all of the other properties in the object mean. Resources that have the same type follow the same schema definition (meaning that like-named properties mean the same thing.)

Type includes a name (“ServiceRoot”) as well as version information (“1.0.0”). Version information is formatted as major.minor.errata. Future iLO firmware releases will certainly expand the data included in its various resources, so as a client, you should be prepared to see different versions of a Type. Anything but a major version is backward compatible, so a new property added to an object might result in minor Type increments (for example, Chassis.1.0.0 becomes Chassis.1.1.0). Moving to a major version change (for example, Chassis.2.0.0) is a breaking change without any guarantee of backward compatibility.

The initial releases of the RESTful API contained many resources of type version 0.9.5 where major version is 0. However, as of iLO 4 2.30 many types are transitioning to version 1.0.0. We have maintained backward compatibility with previous versions of iLO 4, so this type changes from 0 to 1 do not indicate breaking changes in this case but a maturing of the RESTful API data model.

## Links between resources

Finally, let’s take a look at the links property. In the RESTful API, the navigation of the data is included in the data itself, not in the spec, and can therefore adapt as needed to different servers over time without the specification changes. This is called a hypermedia API where the navigation  is built into the data (like web pages). The links property contains the pointers to other related resources. Inside the links objects are various defined relationship types, like Systems, Managers, Chassis, or Sessions. Each of these contain a property called href that is the URI of the related resource. A relationship type (for example, Systems) distinguishes the various links by what they navigate to. For instance, Systems navigates to a collection of ComputerSystem resources.

## Navigating the Data Model

The RESTful API does not define all of the URIs to various items, like temperatures or power supplies on a server. You cannot assume the BIOS version information is always at a particular URI. This is more complex for the client, but is necessary to make sure the data model can change to accommodate various future server architectures without requiring specification changes. As an example, if the BIOS version is at /rest/v1/Systems/1, and a client assumed it is always there, the client would then break when the interface is implemented on a Moonshot with 180 compute nodes, each with its own BIOS version. Defining pointers to specific features in the specification makes the RESTful API too rigid. For this reason, only a select few URIs are published and guaranteed to be stable starting points. Client code must not assume anything about the URIs that you see in the data model. You must treat them as opaque strings or your client will not interoperate with other implementations of the RESTful API.

Do not hardcode URI parsing templates in your client. Instead, you should start at /rest/v1 or one of the fixed entry point URIs below and crawl the data model using the defined relationship types and find instances of types that interest you.

### Fixed Entry Points URIs

The following URIs are fixed in the data model and client software may start with any of these as it accesses the RESTful API.

* /rest/v1 - The root resource.

* /rest/v1/Systems - The collection of compute nodes.

* /rest/v1/Chassis - The collection of chassis.

* /rest/v1/Managers - The collection of management processors (iLO).

* /rest/v1/Sessions - The Session management API.

* /rest/v1/Registries - The collection of Registries.

* /rest/v1/Schemas - The collection of Schema. 

Let’s look at some of the links:

#### Systems

This is a link to the system node collection. Systems are compute nodes (the terminology came from DMTF) with, for example, CPUs, memory, expansion slots, power management, and BIOS version. A DL or BL server has a single compute node in the Systems collection while Moonshot might have up to 180 items in the collection.

You should think of the System link as your portal into the logical view of the server or servers. The collection of Systems is documented to be /rest/v1/Systems.

#### Chassis

This is the physical view. A Chassis should be thought of as a physical container. The Chassis relationship type is a link to the collection of Chassis. On a ProLiant DL/ML/BL server, this will be a collection of one chassis. A Moonshot Chassis collection might include the cartridges, as well as the enclosure (as cartridges are a type of chassis.)
 
Chassis are containers that often have power supplies, temperature sensors, and have a physical location. Chassis contain logical computer nodes (systems) but can also contain another chassis (consider: a Moonshot chassis contains cartridges that are another kind of chassis, each containing nodes). Also, there is no 1:1 relationship between chassis and systems to accommodate multi-node systems and systems that spread across more than one chassis.

The collection of Chassis is documented to be /rest/v1/Chassis.

#### Managers

This is a link into the iLO 4 or Moonshot iLO Chassis Management Module itself for iLO management tasks traditionally done with RIBCL. For example, network settings, license administration, and iLO firmware management.

The collection of Chassis is documented to be /rest/v1/Managers.


# Authentication

If you perform a GET on any other resource other than the root /rest/v1 resource, you receive an HTTP 401 (Forbidden) error indicating that you don’t have the authentication needed to access the resource.

```shell
The following shows the error displayed on GET /rest/v1/Systems when no authentication is attempted:
```
```json
    {
        "@odata.type": "#ExtendedInfo.ExtendedInfo",
	    "Messages": [
		    {
		    	"MessageID": "Base.0.10.NoValidSession",
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

The RESTful API allows you to use HTTP Basic Authentication using a valid user name and password.

```shell

> curl https://myilo/rest/v1/Systems -i --insecure -u username:password -L

    HTTP/1.1 200 OK Allow: GET, HEAD
    Cache-Control: no-cache Content-length: 437
    Content-type: application/json Date: Tue, 05 Aug 2014 14:39:56 GMT ETag: W/"9349EA93"
    Link: </rest/v1/SchemaStore/en/ComputerSystemCollection.json>; rel=describedby Server: HP-iLO-Server/1.30
    X-Frame-Options: sameorigin
    X_HP-CHRP-Service-Version: 1.0.3
```
```json    
    {"@odata.context":"/redfish/v1/$metadata#Systems","@odata.id":"/redfish/v1/Systems/"
    ,"@odata.type":"#ComputerSystemCollection.ComputerSystemCollection","Description":"Computer Systems view", "MemberType":"ComputerSystem.1","Members":[{"@odata.id":"/redfish/v1/Systems/1/"}],"Members@odata.count":1, "Name":"Computer Systems","Total":1,"Type":"Collection.1.0.0","links":{"Member":[{"href":"/rest/v1/Syst ems/1"}],"self":"/rest/v1/Systems"}}

```

## Creating and Using Sessions

For more complex multi-resource operations, you should log in and establish a session. To log in, iLO has a session manager object at the documented URI /rest/v1/Sessions. To create a session we need to POST a JSON object to the Session manager:

```shell
POST /rest/v1/Sessions with the required HTTP headers and a body containing:
```
```json
    {
    	"UserName": "<your username>", 
    	"Password": "<your password>"
    }
```
```shell  
IMPORTANT:	You must include the HTTP header Content-Type: application/json
for all RESTful API operations that include a request body in JSON format.
```

If the session is created successfully, you receive an HTTP 201 (Created) response from iLO. There will also be two additional HTTP headers.

* **X-Auth-Token**	Your session token (string).	This is a unique string for your login session. It must be included as a header in all subsequent HTTP operations in the session.

* **Location**	The URI of the newly created session resource.	iLO allocates a new session resource describing your session. This is the URI that you must DELETE against in order to log out. If you lose this location URI, you can find it by crawling the HREF links in the Sessions collection. Store this URI to facilitate logging out.



> To authorize, use this code:

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: meowmeowmeow"
```

> Make sure to replace `meowmeowmeow` with your API key.

Kittn uses API keys to allow access to the API. You can register a new Kittn API key at our [developer portal](http://example.com/developers).

Kittn expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow`

<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
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

