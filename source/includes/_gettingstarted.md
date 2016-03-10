# Getting Started

## Tips for Using the RESTful API

The RESTful API for HPE iLO is available on ProLiant Gen9 servers running iLO 4 2.00 or later with the iLO Standard license, although some features in the data might not be available without an Advanced license..

To access the RESTful API, you need an HTTPS-capable client, such as a web browser with  the Postman REST Client plugin extension or cURL (a popular command line HTTP utility).

## RESTful Interface Tool and Python Examples

> ***Python**: See ex1_functionname() in the Python example code. This means look for the specified function name in the python example code.*

Although not a requirement, you can use the **RESTful Interface Tool** with the RESTful API. This command line tool provides a level of abstraction and convenience above direct access to the RESTful API. For details see: [http://www.hpe.com/info/restfulapi](http://www.hpe.com/info/restfulapi).

Also, Hewlett Packard Enterprise published example Python code that implements a number of common operations in a RESTful API client. This code can be downloaded at [https://github.com/HewlettPackard/python-proliant-sdk](https://github.com/HewlettPackard/python-proliant-sdk). In some cases the examples in this document may refer to examples in the Python code with this notation:

If you prefer not to implement a client in Python, this serves as a good pseudocode implementing the logic required to perform an operation.

## Example REST API operation with cURL

Let’s perform our first GET operation using the RESTful API. We will do an HTTP GET on the iLO HTTPS port, typically port 443 (although it could be different if you have previously configured iLO to use another port). Your client should be prepared to handle the HTTPS certificate challenge. The interface is not available over open HTTP (port 80), so you must use HTTPS.

Our GET operation will be against a resource at `/redfish/v1/` (with a trailing slash):

It is best to perform this initial GET with a tool like the CURL or the Postman REST Client mentioned above. Later you will want to do this with your own scripting code, but for now it’s useful to see the HTTP header information exchanged using a browser.

CURL is a command line utility available for many Operating Systems that enables easy access to the RESTful API. CURL is available at [http://curl.haxx.se/](http://curl.haxx.se/). Note that all the CURL examples will use a flag –insecure. This causes CURL to bypass validation of the HTTPS certificate. In real use iLO should be configured to use a user-supplied certificate and this option is not necessary. Notice also that we use the –L option to force CURL to follow HTTP redirect responses. If iLO changes URI locations for various items, it can indicate to the client where the new location is and automatically follow the new link.

```shell
> curl https://{iLO}/redfish/v1/ -i --insecure -L
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


