---
title: APIC Enterprise Module API v0.9 Reference
languages:
title: API Reference
language_tabs:
  - shell: cURL
  - java: Java
  - php: PHP
  - python: Python
  - ruby: Ruby
  
toc_footers:
 - Copyright 2014 by Cisco Systems, Inc., All Rights Reserved.
---
# APIC Enterprise Module API

The Application Policy Infrastructure Control (APIC) Enterprise Module (EM) Application Programming Interface (API) allows the deployment and execution of application policy
across your networking infrastructure.  This document contains the details of the Northbound REST API that is designed for use by developers within Enterprises.  APIC EM features
a Southbound API that communicates with individual routers and switches in the network that uses the Cisco Command Line Interface (CLI) over protocols such as SSH, HTTP, Telnet,
and others.

## Documentation Conventions

The following conventions are used in this documentation.

<aside class="notice">
Text that is inside of {} (curly brackets) indicate variable text that should be applied based upon the context of your particular situation.
</aside>


<aside class="notice">
Sample code will often use a short-hand URI.  For example, the URI might simply be stated as /discovery/ but a fully qualified URI should be used such
as https://{myApicEmServer}.{myDomain}.com:8081/api/v0/discovery/ where {myApicEmServer} is the name of your server that has the APIC EM REST API installed
and {myDomain} is the name of the domain that your APIC EM server is located on.
</aside>


## URI scheme

>Example Request

```shell
$curl -X POST -d @myDiscoveryRequest.json \ https://myApicEmServer.myDomain.com:8081/api/v0/discovery/
```

Unless otherwise stated the URIs are in reference to: [http://server:8081/api/v0]; 
example: for MASTER branch, the url is [http://sdn-controller:8081/api/v0]

## Errors

> HTTP Status Code Summary

```all
200 OK - Everything worked as expected.
400 Bad Request - Often missing a required parameter.
401 Unauthorized - No valid API key provided.
402 Request Failed - Parameters were valid but request failed.
404 Not Found - The requested item does not exist.
5XX Server errors - something went wrong on APIC EM server.
```

APIC EM uses standard HTTP response codes to indicate success or failure of an API request. In general, codes in the 2xx range indicate success, codes in the 4xx range indicate
an error that resulted from the information provided (e.g. a required parameter was missing, a parameter of invalid type, etc.), and codes in the 5xx range indicate an error with
APIC EM's server.

Not all errors map cleanly onto HTTP response codes; when a request is valid but does not complete successfully (e.g. a bad result occurred), APIC EM returns a 402
error code.

## Authentication

Because the APIC EM southbound interfaces that speak to individual network devices use the Cisco Command Line Interface (CLI), authentication is done using the CLI _username_ and
_password_ for each of the devices.  The JSON objects that are posted via the REST API have key-value pairs that are the usernames and passwords to be applied.

<aside class="warning">
Because the JSON objects that you are posting may contain usernames and passwords, you should always use HTTPS protocol for posting your REST calls.
</aside>

# _Discovery_

The _Discovery_ methods are used to control processes that run on the APIC EM controller that maintain status of a collection of Network Devices.  The processes that run on
the APIC EM Controller that are managed with the Discovery Methods are called Discovery Jobs and each have a unique discoveryID.  To create a Discovery Job, you will need to
create a Discovery Request Object which is a JSON file that contains information about the collection of network devices that you want to collect information about and how
you wish this information to be collected.

## Overview of the _Discovery_ Methods

| HTTP Method | URI | Description |
|-------------|----|----------| 
| POST | /discovery/ | Starts a new discovery process and returns a discoveryID | 
| GET | /discovery/{discoveryID} | Returns the properties of the discovery job associated with the discoveryID | 
| GET | /discovery/{discoveryID}/network-device/{start}/{end} | Returns the network devices discovered in the given range, start & end are 32 bit numbers, start < end | 
| GET | /discovery/{discoveryID}/network-device/ | Returns all the network-devices discovered in discoveryID discovery-job | 
| GET | /discovery/count | Returns the number of discovery jobs | 
| GET | /discovery/{start}/{end} | Returns the properties of discovery jobs in the given range, start & end are 32 bit numbers, start < end | 
| GET | /discovery/ | Returns the properties of all discovery jobs | 
| PUT | /discovery/ | Updates an existing discovery specified by discoveryID - only for starting/stopping the discovery the discovery-id is specified in the request object. If the request object says ALL, then all the discovery jobs are updated | 
| DELETE | /discovery/{discoveryID} | Deletes the discovery specified by discoveryID | 
| DELETE | /discovery/{start}/{end} | Deletes the properties of discovery jobs in the given range, start & end are 32 bit numbers, start < end | 
| DELETE | /discovery/ | Deletes the properties of all discovery jobs | 


## The _Discovery_ Request Object

> Sample Discovery Request Objects

```javascript 
{ 
"discoveryType": "single", 
"ipAddressList": "25.5.5.1", 
"userNameList": [ "admin", "cisco" ], 
"passwordList": [ "admin", "cisco" ] 
}

{ 
"discoveryType": "range", 
"ipAddressList": "25.5.5.1-25.5.5.5", 
"userNameList": [ "admin", "cisco" ], 
"passwordList": [ "admin", "cisco" ] 
}

{ 
"discoveryType": "multi range", 
"ipAddressList": "25.5.5.1-25.5.5.5,13.3.3.1-13.3.3.2", 
"userNameList": [ "admin", "cisco" ], 
"passwordList": [ "admin", "cisco" ] 
}

```

A JSON object of the following _key:value_ pairs:

| ___key___ | ___value___ |
|----------|--------------------|
| __discoveryType__ | __string__. __mandatory__. type of discovery being requested. __acceptable values:__ "single" - a single IP address, "range" - a range of IP addresses, "subnet" - a subnet specified as IP mask,"cdp" - CDP expanding ring search,"mutli range" - multiple range of IP addresses |
| __ipAddressList__ | __string__. __mandatory__. the list of the IP addresses to be considered for the discovery request. __acceptable values:__ a single IP address, a range of IP addresses, a list of ranges of IP addresses, an IP subnet mask |
| __cdpLevel__ | __positive integer or zero__. __optional__. the max hop count for an expanding ring search using CDP. __default__ = 0.
| __timeout__ | __positive integer__. __optional__. the timeout value for the device connection in seconds.  __default__ = 5 seconds.
| __retry__ | __positive integer or zero__. __optional__. the number of retry attempts that should be done to connect to the device. __default__= 0 retries.
| __userNameList__ | __string__. __optional__. list of usernames to be used for login into network devices.
| __passwordList___ | __string__. __optional__. list of passwords for each username to login into network devices.
| __snmpROCommunity__ | __optional__
| __protocolOrder___ | __string__. __optional__. the order in which the protocols should be used to attempt connection to devices. __acceptable values:__  a comma list of "ssh", "telnet", "https", "http", or "snmp". __default__ = "ssh, telnet, https, http, snmp". 

## Start a New Discovery Job

> Sample Start Discovery Job

```shell
$curl -X POST -d @myDiscoveryRequest.json \ https://myApicEmServer.myDomain.com:8081/api/v0/discovery/
Response: HTTP 201 CREATED
```
```javascript 
{ 
"version":"0.0", 
"response":"{discovery-id}" 
}
```
```shell
$curl -X POST -d @anotherDiscoveryRequest.json \ https://myApicEmServer.myDomain.com:8081/api/v0/discovery/
Response: HTTP 206 PARTIAL CONTENT
```
```javascript 
{ 
"version": "0.0", 
"response": { 
        "discoveryId": "7f634bc4-c313-4ff1-926d-37bfa012dba3", 
        "newDevices": [ "23.3.3.3" ], 
        "duplicateDevices": [ "23.3.3.1", "23.3.3.2" ], 
        "duplicateDeviceIds": [
            "64cfc466-24f4-4dae-b89d-6f4a93c24716",
            "34475c4e-3134-4c2d-a5e9-655e9fa8abed"
        ] 
    } 
}
```

Used to create a new discovery job (i.e., process) to be executed by the APIC EM controller.  The method will POST the provided Discover Request Object and will return a discovery-id that can subsequently
be used to GET data about the discovery request.

__Definition:__ POST /discovery/

__Return:__ The method will return a JSON object with a discovery-id for the request.  HTTP 201 will be returned if the request was successfully created.  HTTP 206 will be returned
if the discovery request is a superset of an existing request. In the event of a 206 response, A Partial Content JSON object will be returned that contains the identies of the
new devices as well as the duplicate devices that are included in previous requests.

## Get the Number of Active Discovery Jobs

> Sample Get Discovery Count

```shell
$curl -X GET /discovery/count 
Response: HTTP 200 OK
```
```javascript
{ 
"version": "0.0", 
"response": "3" 
}
```

Used to get the total number of discovery jobs that are currently being processed.

__Definition__: GET /discover/count

__Returns__: The method returns a JSON object that contains the version of APIC EM that is running on the server and the integer number of active Discover Jobs that are being
processed.

## Get the Status of Discovery Jobs 

>Sample Get Status of Discovery Jobs

```shell
$ curl -X GET /discovery/e9dc9901-53a1-488e-97de-2c4125274cb2 
Response: HTTP 200 OK 
```
```javascript
{ 
"version": "0.0", 
"response": { 
    "discoveryId": "e9dc9901-53a1-488e-97de-2c4125274cb2", 
    "discoveryStatus": "active", 
    "numDevices": 1, 
    "discoveryCondition": "Complete", 
    "deviceIds": "517faa8a-cfe9-4307-9844-c7c1f048f5f8" 
    } 
} 
```

```shell
$curl -X GET /discovery/1/3 
Response: 
HTTP 200 OK
```
```javascript
{ 
"version": "0.0", 
"response": [ 
{ 
"numDevices": 1, 
"discoveryStatus": "active", 
"deviceIds": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"discoveryId": "e9dc9901-53a1-488e-97de-2c4125274cb2", 
"discoveryCondition": "Complete" 
}, 
{ 
"numDevices": 1, 
"discoveryStatus": "active", 
"deviceIds": "dc607890-1ebf-4f0e-a019-3ba392803076", 
"discoveryId": "218168b6-fcbf-4776-97d9-af005f367d0d", 
"discoveryCondition": "Complete" 
}, 
{ 
"numDevices": 1, 
"discoveryStatus": "active", 
"deviceIds": "5d29f72a-8b3e-4a01-a4b5-cdecefdefd8c", 
"discoveryId": "2d3b0988-2de7-4887-a27e-9f0d28ff20fe", 
"discoveryCondition": "Complete" 
} 
] 
}
```

```shell
$curl -X GET /discovery/ 
Response: 
HTTP 200 OK
```
```javascript
{ 
"version": "0.0", 
"response": [ 
{ 
"numDevices": 1, 
"discoveryStatus": "active", 
"deviceIds": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"discoveryId": "e9dc9901-53a1-488e-97de-2c4125274cb2", 
"discoveryCondition": "Complete" 
}, 
{ 
"numDevices": 1, 
"discoveryStatus": "active", 
"deviceIds": "dc607890-1ebf-4f0e-a019-3ba392803076", 
"discoveryId": "218168b6-fcbf-4776-97d9-af005f367d0d", 
"discoveryCondition": "Complete" 
}, 
{ 
"numDevices": 1, 
"discoveryStatus": "active", 
"deviceIds": "5d29f72a-8b3e-4a01-a4b5-cdecefdefd8c", 
"discoveryId": "2d3b0988-2de7-4887-a27e-9f0d28ff20fe", 
"discoveryCondition": "Complete" 
} 
] 
}
```

Used to get the status of one or more Discovery Jobs.

__Definition__:  This method has three forms:

* GET /discovery/ - Returns the status of all Discovery Jobs.
* GET /discovery/{start}/{stop} - Returns the status of the Discovery Jobs that range from the cardinal start number to the ending stop number in the URL.
* GET /discovery/{discoveryID} - Returns the status of the Discovery Job specified in the discoveryID in the URI. 

__Returns__: The method returns a JSON object that contains sub-objects with the status of each Discovery Job that is active in the range that was specified. The sub-object is identical to the JSON object that
is returned if you had requested the status of an individual Discovery Job in that it contains the discoveryStatus (either "active" or "inactive") for the discovery job associated with the _discoveryID_.  If the
job is "active", the number of devices and the deviceIds will be returned along with the _discoveryCondition_.  A _discoverCondition_ of "Complete" means that the job has finished.


## Get the Status of Network Devices

> Sample Get Status of Network Devices

```shell
$curl -X GET /discovery/8501867700738959521/network-device 
Response: HTTP 200 OK 
```
```javascript
{ 
"version": "0.0", 
"response": [ 
    {   "location": "LAB-89", 
        "type": "123456", 
        "snmpLocation": "123456", 
        "ingressQueueConfig": "123456", 
        "bootDateTime": "2013-09-23", 
        "authModelId": "123456", 
        "tag": ",testing,computer-test,", 
        "serialNumber": "123456", 
        "role": "Manager", 
        "hostname": "123456", 
        "managementIpAddress": "123456", 
        "softwareVersion": "123456", 
        "snmpContact": "123456", 
        "lineCardCount": "123456,1234567", 
        "vendor": "123456", 
        "lineCardId": "123456", 
        "macAddress": "123456", 
        "imageName": "123456", 
        "upTime": "123456", 
        "family": "123456", 
        "qosStatus": "123456", 
        "networkDeviceId": "1234567", 
        "lastUpdated": "2013-09-26 07:46:24.947717+05:30", 
        "platformId": "123456", 
        "avgUpdateFrequency": 3410, 
        "numUpdates": 33, 
        "chassisType": "123456", 
        "memorySize": "123456", 
        "interfaceCount": "123456" 
        }, 
    { 
        "location": "test", 
        "type": "123456", 
        "snmpLocation": "123456", 
        "ingressQueueConfig": "123456", 
        "bootDateTime": "2013-09-23", 
        "authModelId": "123456", 
        "tag": ",123456123456,123456,test,testing,computer-test,", 
        "serialNumber": "123456", 
        "role": "test", 
        "hostname": "123456", 
        "managementIpAddress": "123456", 
        "softwareVersion": "123456", 
        "snmpContact": "123456", 
        "lineCardCount": "123456,1234567", 
        "vendor": "123456", 
        "lineCardId": "123456", 
        "macAddress": "123456", 
        "imageName": "123456", 
        "upTime": "123456", 
        "family": "123456", 
        "qosStatus": "123456", 
        "networkDeviceId": "100", 
        "lastUpdated": "2013-09-25 07:14:58.156114+05:30", 
        "platformId": "123456", 
        "avgUpdateFrequency": 1396, 
        "numUpdates": 16, 
        "chassisType": "123456", 
        "memorySize": "123456", 
        "interfaceCount": "123456" 
        } 
    ] 
} 
```

Used to get the status of one or more Network devices that make up the Discovery Job.

__Definition__:  This method comes in two forms.

* GET /discovery/{discoveryID}/network-device used to get the status of all network devices included in the Discovery Job.
* GET /discovery/{discoveryID}/network-device/{start}/{end} used to get the status of a subset of devices in the Discovery Job.

__Returns__: The method returns a JSON object that contains a sub-object with the status of each and every Network Device in the Discovery Job specified in the URI. If the URI
also specficies a {start} and {stop}, then it only returns the status of the Network Devices within the cardinal range from {start} to {stop}. The sub-object returned for
each network device is a JSON object of Key:Value pairs with detailed information about the Network Device.

## Start or Stop a Discovery Job

> Sample Pause a Discovery Job

```shell
$curl -X PUT /discovery \
    -d "discoveryId":"49c751dd-b23f-4512-8b02-b55ab0a54050", \
    -d "discoveryStatus":"inactive"
Response: HTTP 200 OK 
```
```javascript
{ 
"version": "0.0" 
"response":"49c751dd-b23f-4512-8b02-b55ab0a54050" 
} 
```

Used to stop (pause) or start (restart) one or more Discovery Jobs.

__Definition__: PUT /discovery.  The PUT request must include the key:value pair that includes discoveryID set to the discoveryID of the job that you want to control.  It
also includes a discoveryStatus which is set to either "inactive" to pause the job, or "active" to restart the job.

__Returns__: The method is used to either stop or re-start a Discovery Job.  It returns a JSON object that that contains the version of the APIC EM software that the
server is running and the

## Delete a Discovery Job

```shell
$curl -X DELETE /discovery/
Response: HTTP 200 OK
```
Used to permanently delete one or more discovery jobs.

__Definition__:  This method comes in three different versions:

* DELETE /discovery/{discoveryID} - Delete the single specified Discovery Job identified by the discoveryID
* DELETE /discovery/{start}/{end} - Deletes all of the Discovery Jobs in the given range where start & end are 32 bit numbers with start < end
* DELETE /discovery/ - deletes all of the Discovery Jobs on the APIC EM Server

__Returns__:  The method returns a standard status code.

# Discovery-frequency

These methods are used to control the discovery frequency for Discovery Jobs for network devices, interfaces, and hosts.

## Overview of Discovery Frequency Methods

| HTTP Method | URI | Description |
|-------------|----|----------| 
| POST | /discovery-frequency/network-device/ | Inputs network-device discovery frequency | 
| POST | /discovery-frequency/interface/ | Inputs interface discovery frequency | 
| POST | /discovery-frequency/host/ | Inputs host discovery frequency | 
| GET | /discovery-frequency/network-device/ | Returns network-device discovery frequency | 
| GET | /discovery-frequency/interface/ | Returns interface discovery frequency | 
| GET | /discovery-frequency/host/ | Returns host discovery frequency | 
| GET | /discovery-frequency/ | Returns all frequencies | 
| DELETE | /discovery-frequency/network-device/ | deletes network-device discovery frequency | 
| DELETE | /discovery-frequency/interface/ | deletes interface discovery frequency | 
| DELETE | /discovery-frequency/host/ | deletes host discovery frequency | 
| DELETE | /discovery-frequency/ | deletes all frequencies | 

## Set the Discovery Frequencies

> Sample Set the discovery frequency for the network-devices

```shell
$curl -X POST /discovery-frequency/network-device/ 
```

```javascript
Request: 
{ 
"networkDevice": 120 
} 
Response: 
HTTP Status 201 CREATED 
{ 
"version": "0.0", 
"response": 120 
}
``` 

> Sample Set the discovery frequency for the interfaces

```shell
$curl -X POST /discovery-frequency/interface/ 
```

```javascript
Request: 
{ 
"interfaceDiscovery": 60 
} 
Response: HTTP Status 201 CREATED 
{ 
"version": "0.0", 
"response": 60 
}
``` 

> Sample Set the discovery frequency for the hosts

```shell
$curl -X POST /discovery-frequency/host/ 
```

```javascript
Request : 
{ 
"host": 60 
} 
Response: HTTP Status 201 CREATED 
{ 
"version": "0.0", 
"response": 60 
}
```

Used to set the frequency response for different types of Network devices, interfaces, and hosts on the APIC EM controlled network.  The JSON object that
is presented as a single key:value pair depending upon the version of the method.

__Definition__:  This method comes in three different versions:

* POST /discovery-frequency/network-device/ - sets the update frequency for network devices with the "networkDevice" key-value pair with the value in seconds.
* POST /discovery-frequency/interface/ - set the update frequency for network interfaces with the "interfaceDiscovery" key-value pair with the value in seconds.
* POST /discovery-frequency/hosts/ - sets the update frequency for hosts on the network with the "hosts" key-value pair with the value in seconds.

__Returns__:  The method returns a standard status code and a JSON object with the version of the APIC EM software and the key-value pair of "response" with
discovery frequency value that was set in seconds.


## Query to Get the Discovery Frequency

> Sample: Get the discovery frequency for network devices

```shell
GET /discovery-frequency/network-device 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": 120 
}
``` 
> Sample: Get the discovery frequency for network interfaces

```shell
GET /discovery-frequency/interface 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": 60 
}
``` 
> Sample: Get the discovery frequency for network hosts

```shell
GET /discovery-frequency/host 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": 60 
}
``` 
> Sample: Get the discovery frequencies for Everything

```shell
GET /discovery-frequency 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": { 
"host": 60, 
"link": 0, 
"networkDevice": 60, 
"interfaceDiscovery": 60, 
"interfaceStatistics": 0 
} 
}
```
## Delete the Discovery Frequencies

# device-credential 
| HTTP Method | URI | Description |
|-------------|----|----------| 
| POST | /device-credential | Inserts the device credential | 
| GET | /device-credential | Gets all available device credentials | 
| DELETE | /device-credential/username/{username\}/password/{password\} | Deletes the specified credential set | 

```shell
POST /device-credential 
[ 
{ 
"userName":"admin", 
"password":"admin" 
}, 
{ 
"userName":"cisco", 
"password":"cisco" 
}, 
{ 
"userName":"lab", 
"password":"lab" 
} 
]
```

# network-device 
| HTTP Method | URI | Description |
|-------------|----|----------| 
| GET | /network-device/{network-device-id} | Returns complete information of a network-device | 
| GET | /network-device/{network-device-id}/brief | Returns brief information on a network-device | 
| GET | /network-device/count | Returns the number of network devices in the controller | 
| GET | /network-device/{start}/{end} | Returns complete information of the network-devices in the given range, start & end are 32 bit numbers, start < end | 
| GET | /network-device/ | Returns complete information of all the network-devices stored in the controller | 

```shell
GET /network-device/517faa8a-cfe9-4307-9844-c7c1f048f5f8 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": { 
"location": "ddd36d94-6719-4644-939f-4ffffdac3202", 
"type": "switch", 
"serialNumber": "SMG1027NQNX", 
"tag": "TestTag", 
"role": "Updated", 
"hostname": "EFT-CAMPUS-CAT6509E", 
"managementIpAddress": "14.4.4.2", 
"interfaceCount": "114", 
"networkDeviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"lastUpdated": "2013-09-30 02:07:53.136698-07", 
"platformId": "WS-C6509-E", 
"avgUpdateFrequency": 67, 
"numUpdates": 1861, 
"macAddress": "00:18:74:9E:1C:00", 
"upTime": "2 weeks, 3 days, 23 hours, 32 minutes", 
"family": "s3223_rp", 
"vendor": "Cisco", 
"imageName": "s3223-advipservicesk9_wan-vz.122-33.SXH4.bin", 
"chassisType": "s3223_rp", 
"softwareVersion": "12.2(33)SXH4" 
} 
} 
```

```shell
GET /network-device/517faa8a-cfe9-4307-9844-c7c1f048f5f8/brief 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": { 
"serialNumber": "SMG1027NQNX", 
"hostname": "EFT-CAMPUS-CAT6509E", 
"managementIpAddress": "14.4.4.2" 
} 
} 
```

```shell
GET /network-device/count 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": 3 
} 
``` 

```shell
GET /network-device 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"location": "ddd36d94-6719-4644-939f-4ffffdac3202", 
"type": "router", 
"serialNumber": "FTX1730AH2B", 
"role": "SampleData", 
"hostname": "EFT-CAMPUS-ISR3900", 
"managementIpAddress": "14.4.4.1", 
"interfaceCount": "3", 
"networkDeviceId": "dc607890-1ebf-4f0e-a019-3ba392803076", 
"lastUpdated": "2013-09-28 15:33:32.365773-07", 
"platformId": "C3900-SPE150/K9", 
"numUpdates": 1854, 
"macAddress": "7C:69:F6:64:E2:01", 
"upTime": "2 weeks, 3 days, 23 hours, 14 minutes", 
"family": "C3900", 
"vendor": "Cisco", 
"imageName": "c3900-universalk9-mz.SPA.152-4.M3.bin", 
"chassisType": "C3900", 
"softwareVersion": "15.2(4)M3" 
}, 
{ 
"location": "ddd36d94-6719-4644-939f-4ffffdac3202", 
"type": "switch", 
"serialNumber": "SMG1027NQNX", 
"tag": "TestTag", 
"role": "Updated", 
"hostname": "EFT-CAMPUS-CAT6509E", 
"managementIpAddress": "14.4.4.2", 
"interfaceCount": "114", 
"networkDeviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"lastUpdated": "2013-09-30 02:07:53.136698-07", 
"platformId": "WS-C6509-E", 
"avgUpdateFrequency": 67, 
"numUpdates": 1861, 
"macAddress": "00:18:74:9E:1C:00", 
"upTime": "2 weeks, 3 days, 23 hours, 32 minutes", 
"family": "s3223_rp", 
"vendor": "Cisco", 
"imageName": "s3223-advipservicesk9_wan-vz.122-33.SXH4.bin", 
"chassisType": "s3223_rp", 
"softwareVersion": "12.2(33)SXH4" 
}, 
{ 
"location": "ddd36d94-6719-4644-939f-4ffffdac3202", 
"type": "switch", 
"serialNumber": "SMG1027NQNX", 
"role": "SampleData", 
"hostname": "EFT-CAMPUS-CAT6509E", 
"managementIpAddress": "14.4.4.2", 
"interfaceCount": "114", 
"networkDeviceId": "5d29f72a-8b3e-4a01-a4b5-cdecefdefd8c", 
"lastUpdated": "2013-09-28 14:27:47.128554-07", 
"platformId": "WS-C6509-E", 
"numUpdates": 1849, 
"macAddress": "00:18:74:9E:1C:00", 
"upTime": "2 weeks, 3 days, 22 hours, 30 minutes", 
"family": "s3223_rp", 
"vendor": "Cisco", 
"imageName": "s3223-advipservicesk9_wan-vz.122-33.SXH4.bin", 
"chassisType": "s3223_rp", 
"softwareVersion": "12.2(33)SXH4" 
} 
] 
} 
```

```shell
GET /network-device/1/2 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"location": "ddd36d94-6719-4644-939f-4ffffdac3202", 
"type": "router", 
"serialNumber": "FTX1730AH2B", 
"role": "SampleData", 
"hostname": "EFT-CAMPUS-ISR3900", 
"managementIpAddress": "14.4.4.1", 
"interfaceCount": "3", 
"networkDeviceId": "dc607890-1ebf-4f0e-a019-3ba392803076", 
"lastUpdated": "2013-09-28 15:33:32.365773-07", 
"platformId": "C3900-SPE150/K9", 
"numUpdates": 1854, 
"macAddress": "7C:69:F6:64:E2:01", 
"upTime": "2 weeks, 3 days, 23 hours, 14 minutes", 
"family": "C3900", 
"vendor": "Cisco", 
"imageName": "c3900-universalk9-mz.SPA.152-4.M3.bin", 
"chassisType": "C3900", 
"softwareVersion": "15.2(4)M3" 
}, 
{ 
"location": "ddd36d94-6719-4644-939f-4ffffdac3202", 
"type": "switch", 
"serialNumber": "SMG1027NQNX", 
"tag": "TestTag", 
"role": "Updated", 
"hostname": "EFT-CAMPUS-CAT6509E", 
"managementIpAddress": "14.4.4.2", 
"interfaceCount": "114", 
"networkDeviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"lastUpdated": "2013-09-30 02:07:53.136698-07", 
"platformId": "WS-C6509-E", 
"avgUpdateFrequency": 67, 
"numUpdates": 1861, 
"macAddress": "00:18:74:9E:1C:00", 
"upTime": "2 weeks, 3 days, 23 hours, 32 minutes", 
"family": "s3223_rp", 
"vendor": "Cisco", 
"imageName": "s3223-advipservicesk9_wan-vz.122-33.SXH4.bin", 
"chassisType": "s3223_rp", 
"softwareVersion": "12.2(33)SXH4" 
} 
] 
}
``` 

# network-device-reachability-info 

| HTTP Method | URI | Description |
|-------------|----|----------| 
| GET | /network-device/{network-device-id}/reachability-info | Returns complete information of a network-device's reachability info | 
| GET | /network-device/reachability-info/{start}/{end} | Returns complete information of all the network-devices' reachability info in the given range, start & end are 32 bit numbers, start < end | 
| GET | /network-device/reachability-info/ | Returns complete information of all the network-devices' reachability info | 

```shell
GET /network-device/517faa8a-cfe9-4307-9844-c7c1f048f5f8/reachability-info 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": { 
"password": "YWRtaW4=", 
"protocolList": "SSH,TELNET,HTTPS,HTTP,SNMP", 
"reachabilityFailureReason": null, 
"reachabilityStatus": "Success", 
"snmpCommunity": null, 
"userName": "admin", 
"networkDeviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"discoveryId": "e9dc9901-53a1-488e-97de-2c4125274cb2", 
"protocolUsed": "TELNET", 
"mgmtIp": "14.4.4.2" 
} 
} 
```

```shell
GET /network-device/reachability-info/1/2 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"password": "YWRtaW4=", 
"userName": "admin", 
"discoveryId": "218168b6-fcbf-4776-97d9-af005f367d0d", 
"networkDeviceId": "dc607890-1ebf-4f0e-a019-3ba392803076", 
"protocolList": "SSH,TELNET,HTTPS,HTTP,SNMP", 
"reachabilityFailureReason": null, 
"reachabilityStatus": "Success", 
"snmpCommunity": null, 
"mgmtIp": "14.4.4.1", 
"protocolUsed": "TELNET" 
}, 
{ 
"password": "YWRtaW4=", 
"userName": "admin", 
"discoveryId": "e9dc9901-53a1-488e-97de-2c4125274cb2", 
"networkDeviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"protocolList": "SSH,TELNET,HTTPS,HTTP,SNMP", 
"reachabilityFailureReason": null, 
"reachabilityStatus": "Success", 
"snmpCommunity": null, 
"mgmtIp": "14.4.4.2", 
"protocolUsed": "TELNET" 
} 
] 
} 
```

```shell
GET /network-device/reachability-info 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"password": "YWRtaW4=", 
"userName": "admin", 
"discoveryId": "218168b6-fcbf-4776-97d9-af005f367d0d", 
"networkDeviceId": "dc607890-1ebf-4f0e-a019-3ba392803076", 
"protocolList": "SSH,TELNET,HTTPS,HTTP,SNMP", 
"reachabilityFailureReason": null, 
"reachabilityStatus": "Success", 
"snmpCommunity": null, 
"mgmtIp": "14.4.4.1", 
"protocolUsed": "TELNET" 
}, 
{ 
"password": "YWRtaW4=", 
"userName": "admin", 
"discoveryId": "e9dc9901-53a1-488e-97de-2c4125274cb2", 
"networkDeviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"protocolList": "SSH,TELNET,HTTPS,HTTP,SNMP", 
"reachabilityFailureReason": null, 
"reachabilityStatus": "Success", 
"snmpCommunity": null, 
"mgmtIp": "14.4.4.2", 
"protocolUsed": "TELNET" 
}, 
{ 
"password": "YWRtaW4=", 
"userName": "admin", 
"discoveryId": "2d3b0988-2de7-4887-a27e-9f0d28ff20fe", 
"networkDeviceId": "5d29f72a-8b3e-4a01-a4b5-cdecefdefd8c", 
"protocolList": "SSH,TELNET,HTTPS,HTTP,SNMP", 
"reachabilityFailureReason": null, 
"reachabilityStatus": "Success", 
"snmpCommunity": null, 
"mgmtIp": "14.4.4.2", 
"protocolUsed": "HTTPS" 
} 
] 
}
``` 
# network-device-config

| HTTP Method | URI | Description |
|-------------|----|----------| 
| GET | /network-device/{network-device-id}/config | Returns the network-device running-config | 
| GET | /network-device/config/{start}/{end} | Returns the network-device running-config of all network-devices in the given range, start & end are 32 bit numbers, start < end | 
| GET | /network-device/config | Returns the network-device running-config of all network-devices | 

```shell
GET /network-device/517faa8a-cfe9-4307-9844-c7c1f048f5f8/config 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": "Building configuration... 
Current configuration : 18341 bytes 
! 
nupgrade fpd auto	nversion 12.2 
service timestamps debug uptime 
service timestamps log uptime 
no service password-encryption 
service counters max age 5 
! 
hostname EFT-CAMPUS-CAT6509E 
! 
boot-start-marker 
boot system sup-bootdisk:s3223-advipservicesk9_wan-vz.122-33.SXH4.bin 
..... 
} 
```

```shell
GET /network-device/config 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response":[ 
"Building configuration... 
Current configuration : 18341 bytes 
! 
nupgrade fpd auto	nversion 12.2 
service timestamps debug uptime 
service timestamps log uptime 
no service password-encryption 
service counters max age 5 
! 
hostname EFT-CAMPUS-CAT6509E 
! 
boot-start-marker 
boot system sup-bootdisk:s3223-advipservicesk9_wan-vz.122-33.SXH4.bin 
....., 
"Building configuration... 
Current configuration : 18341 bytes 
! 
nupgrade fpd auto	nversion 12.2 
service timestamps debug uptime 
service timestamps log uptime 
no service password-encryption 
service counters max age 5 
! 
hostname EFT-CAMPUS-CAT6509E 
! 
boot-start-marker 
boot system sup-bootdisk:s3223-advipservicesk9_wan-vz.122-33.SXH4.bin 
....., 
"Building configuration... 
Current configuration : 18341 bytes 
! 
nupgrade fpd auto	nversion 12.2 
service timestamps debug uptime 
service timestamps log uptime 
no service password-encryption 
service counters max age 5 
! 
hostname EFT-CAMPUS-CAT6509E 
! 
boot-start-marker 
boot system sup-bootdisk:s3223-advipservicesk9_wan-vz.122-33.SXH4.bin 
..... 
] 
}
``` 

# network-device-role 
| HTTP Method | URI | Description |
|-------------|----|----------| 
| GET | /network-device/{network-device-id}/role | Returns the network-device role | 
| GET | /network-device/role/{start}/{end} | Returns the network-device roles of all network-devices in the given range, start & end are 32 bit numbers, start < end | 
| GET | /network-device/role | Returns the network-device roles of all network-devices | 
| PUT | /network-device/role | Updates the network-device role (or roles of a list of network-devices) with the network-device-ids and role specified in the Request Object, if network_device-id="ALL", it is updated for all devices | 
```shell
GET /network-device/dc607890-1ebf-4f0e-a019-3ba392803076/role 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": { 
"role": "SampleData" 
} 
} 
```

```shell
GET /network-device/role 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"role": "SampleData", 
"networkDeviceId": "dc607890-1ebf-4f0e-a019-3ba392803076" 
}, 
{ 
"role": "Updated", 
"networkDeviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8" 
}, 
{ 
"role": "SampleData", 
"networkDeviceId": "5d29f72a-8b3e-4a01-a4b5-cdecefdefd8c" 
} 
] 
} 
```

```shell
PUT /network-device/role 
Request : 
{ 
"networkDeviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"role": "SampleData", 
"roleSource": "manual" /* UI should always use "manual" */ 
} 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": "Number of records updated for network devices [517faa8a-cfe9-4307-9844-c7c1f048f5f8] 1" 
} 
PUT /network-device/role 
Request : 
{ 
"networkDeviceId": "ALL", 
"role": "SampleData" 
"roleSource" : "manual" /* UI should always use "manual" */ 
} 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": "Number of records updated for network devices ALL 3" 
} 
```

```shell
GET /network-device/role/1/2 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"role": "SampleData", 
"networkDeviceId": "dc607890-1ebf-4f0e-a019-3ba392803076" 
}, 
{ 
"role": "SampleData", 
"networkDeviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8" 
} 
] 
}
```

# role 

| HTTP Method | URI | Description |
|-------------|----|----------| 
| GET | /role/ | Returns all the roles | 

# role-network-device 
| HTTP Method | URI | Description |
|-------------|----|----------| 
| GET | /role/{role}/network-device/count | Returns all network-devices with given role | 
| GET | /role/{role}/network-device/{start}/{end} | Returns all network-devices with given role in the number range, start & end are 32 bit numbers, start < end | 
| GET | /role/{role}/network-device/ | Returns all network-devices with given role | 

# network-device-location 
| HTTP Method | URI | Description |
|-------------|----|----------| 
| POST | /network-device/location | Updates the network-device location (or locations of a network-device list) with the location specified in the Request Object The network_device-ids are specified in the request object. If the request object has "ALL" then all devices will be updated | 
| GET | /network-device/{network-device-id}/location | Returns the network-device location | 
| DELETE | /network-device/{network-device-id}/location | Deletes the network-device location | 

```shell
GET /network-device/dc607890-1ebf-4f0e-a019-3ba392803076/location 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": { 
"location": "ddd36d94-6719-4644-939f-4ffffdac3202" 
} 
} 
```

```shell
GET /network-device/location/ 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"location": "ddd36d94-6719-4644-939f-4ffffdac3202", 
"networkDeviceId": "dc607890-1ebf-4f0e-a019-3ba392803076" 
}, 
{ 
"location": "ddd36d94-6719-4644-939f-4ffffdac3202", 
"networkDeviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8" 
}, 
{ 
"location": "ddd36d94-6719-4644-939f-4ffffdac3202", 
"networkDeviceId": "5d29f72a-8b3e-4a01-a4b5-cdecefdefd8c" 
} 
] 
} 
```

```shell
PUT /network-device/location/ 
Request: 
{ 
"networkDeviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"location": "ddd36d94-6719-4644-939f-4ffffdac3202" 
} 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": "Number of records updated for network devices [517faa8a-cfe9-4307-9844-c7c1f048f5f8] 1" 
} 
PUT /network-device/location/ 
Request: 
{ 
"networkDeviceId": "ALL", 
"location": "ddd36d94-6719-4644-939f-4ffffdac3202" 
} 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": "Number of records updated for network devices ALL 3" 
}
``` 

# network-device-tag 

| HTTP Method | URI | Description |
|-------------|----|----------| 
| POST | /network-device/tag | Inserts a new tag for one or many network devices, the network-device-ids are specified in the request object | 
| GET | /network-device/{network-device-id}/tag | Returns the network-device tag | 
| GET | /network-device/tag/{start}/{end} | Returns the network-device tags of all network-devices in the given range, start & end are 32 bit numbers, start < end | 
| GET | /network-device/tag/ | Returns the network-device tags of all network-devices | 
| DELETE | /network-device/{network-device-id}/tag/{tag} | Deletes the specified tag for the network device | 

```shell
POST /network-device/tag 
Request : 
{ 
"networkDeviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"tag": "TestTag" 
} 
Response : 
HTTP Status 201 CREATED 
{ 
"version": "0.0", 
"response": "Number of records updated for network devices [517faa8a-cfe9-4307-9844-c7c1f048f5f8] 1" 
} 
```

```shell
GET /network-device/517faa8a-cfe9-4307-9844-c7c1f048f5f8/tag 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": { 
"tag": "TestTag" 
} 
} 
```

```shell
GET /network-device/tag 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"tag": "TestTag", 
"networkDeviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8" 
} 
] 
} 
```

```shell
DELETE /network-device/517faa8a-cfe9-4307-9844-c7c1f048f5f8/tag/TestTag 
Response : 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": "517faa8a-cfe9-4307-9844-c7c1f048f5f8" 
} 
```

# line-card 
| HTTP Method | URI | Description |
|-------------|----|----------| 
| GET | /line-card/{line-card-id} | Returns line card information | 
| GET | /line-card/{line-card-id}/network-device | Returns the network-device-id of the network-device associated with the linecard | 

```shell
GET /line-card/91d58b84-ce17-43dc-8df3-17c86ac710a7 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": { 
"serialNumber": "SMG1027NQNX", 
"status": "Up", 
"interfaceCount": 0, 
"networkDeviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"lineCardId": "91d58b84-ce17-43dc-8df3-17c86ac710a7", 
"attachementStatus": null, 
"lastUpdated": null, 
"platformId": "WS-C6509-E", 
"avgUpdateFrequency": 0, 
"numUpdates": 0, 
"slotNumber": 1, 
"vendor": "Cisco" 
} 
}
``` 

```shell
GET /line-card/91d58b84-ce17-43dc-8df3-17c86ac710a7/network-device 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": "517faa8a-cfe9-4307-9844-c7c1f048f5f8" 
} 

``` 

# link

| HTTP Method | URI | Description |
|-------------|----|----------| 
| GET | /link/{link-id} | Returns a link | 
| GET | /link/network-device/{network-device-id}/count | Returns the number of links for the network_device-id | 
| GET | /link/network-device/{network-device-id}/{start}/{end} | Returns all the links for the network device in the range, start & end are 32 bit numbers, start < end | 
| GET | /link/network-device/{network-device-id} | Returns all the links for the network device | 
| GET | /link/count | Returns the number of links in the controller | 
| GET | /link/{start}/{end} | Returns all the links in the range, start & end are 32 bit numbers, start < end | 
| GET | /link/ | Returns all the links | 
```shell
GET /link/048274fa-6d17-4f51-992a-d78435da9397 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": { 
"linkStatus": "UP", 
"startDeviceId": "dc607890-1ebf-4f0e-a019-3ba392803076", 
"endDeviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"lastUpdated": "2013-09-27 02:34:57.070483-07", 
"numUpdates": 1, 
"endPortId": "4b2f78b2-1270-4c14-9691-be7b9521024f", 
"linkId": "048274fa-6d17-4f51-992a-d78435da9397", 
"startPortId": "f3b6167f-3a2e-4525-a3c2-7922027d0596" 
} 
} 
```

```shell
GET /link/network-device/dc607890-1ebf-4f0e-a019-3ba392803076/count 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": 1 
}
```

```shell
GET /link/network-device/dc607890-1ebf-4f0e-a019-3ba392803076/1/1 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"linkStatus": "UP", 
"startDeviceId": "dc607890-1ebf-4f0e-a019-3ba392803076", 
"endDeviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"lastUpdated": "2013-09-27 02:34:57.070483-07", 
"numUpdates": 1, 
"endPortId": "4b2f78b2-1270-4c14-9691-be7b9521024f", 
"linkId": "048274fa-6d17-4f51-992a-d78435da9397", 
"startPortId": "f3b6167f-3a2e-4525-a3c2-7922027d0596" 
} 
] 
} 
```

```shell
GET /link/network-device/dc607890-1ebf-4f0e-a019-3ba392803076 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"linkStatus": "UP", 
"startDeviceId": "dc607890-1ebf-4f0e-a019-3ba392803076", 
"endDeviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"lastUpdated": "2013-09-27 02:34:57.070483-07", 
"numUpdates": 1, 
"endPortId": "4b2f78b2-1270-4c14-9691-be7b9521024f", 
"linkId": "048274fa-6d17-4f51-992a-d78435da9397", 
"startPortId": "f3b6167f-3a2e-4525-a3c2-7922027d0596" 
} 
] 
}
``` 

```shell
GET /link/count 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": 2 
}
``` 

```shell
GET /link/1/2 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"linkStatus": "UP", 
"startDeviceId": "dc607890-1ebf-4f0e-a019-3ba392803076", 
"endDeviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"lastUpdated": "2013-09-27 02:34:57.070483-07", 
"numUpdates": 1, 
"endPortId": "4b2f78b2-1270-4c14-9691-be7b9521024f", 
"linkId": "048274fa-6d17-4f51-992a-d78435da9397", 
"startPortId": "f3b6167f-3a2e-4525-a3c2-7922027d0596" 
}, 
{ 
"linkStatus": "UP", 
"startDeviceId": "5d29f72a-8b3e-4a01-a4b5-cdecefdefd8c", 
"endDeviceId": "dc607890-1ebf-4f0e-a019-3ba392803076", 
"lastUpdated": "2013-09-27 02:39:48.413527-07", 
"numUpdates": 1, 
"endPortId": "f3b6167f-3a2e-4525-a3c2-7922027d0596", 
"linkId": "9010ad1d-4862-41c5-93d7-fac38aed23ce", 
"startPortId": "9f0ae3db-2b4f-4ae3-a3af-9483c0295c56" 
} 
] 
} 
```

```shell
GET /link 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"linkStatus": "UP", 
"startDeviceId": "dc607890-1ebf-4f0e-a019-3ba392803076", 
"endDeviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"lastUpdated": "2013-09-27 02:34:57.070483-07", 
"numUpdates": 1, 
"endPortId": "4b2f78b2-1270-4c14-9691-be7b9521024f", 
"linkId": "048274fa-6d17-4f51-992a-d78435da9397", 
"startPortId": "f3b6167f-3a2e-4525-a3c2-7922027d0596" 
}, 
{ 
"linkStatus": "UP", 
"startDeviceId": "5d29f72a-8b3e-4a01-a4b5-cdecefdefd8c", 
"endDeviceId": "dc607890-1ebf-4f0e-a019-3ba392803076", 
"lastUpdated": "2013-09-27 02:39:48.413527-07", 
"numUpdates": 1, 
"endPortId": "f3b6167f-3a2e-4525-a3c2-7922027d0596", 
"linkId": "9010ad1d-4862-41c5-93d7-fac38aed23ce", 
"startPortId": "9f0ae3db-2b4f-4ae3-a3af-9483c0295c56" 
} 
] 
}
```

# link-tag 
| HTTP Method | URI | Description |
|-------------|----|----------| 
| POST | /link/tag | Inserts a new tag for one or many network devices, the link-ids are specified in the request object | 
| GET | /link/{link-id}/tag | Returns the link tag | 
| GET | /link/tag/{start}/{end} | Returns the link tags of all links in the given range, start & end are 32 bit numbers, start < end | 
| GET | /link/tag/ | Returns the link tags of all links | 
| DELETE | /link/{link-id}/tag/{tag} | Deletes the specified tag for the link | 

```shell
POST /link/tag 
Request: 
{ 
"linkId": "048274fa-6d17-4f51-992a-d78435da9397", 
"tag": "SampleLink" 
} 
Response: 
HTTP Status 201 CREATED 
{ 
"version": "0.0", 
"response": "Number of records updated for link 048274fa-6d17-4f51-992a-d78435da9397 1" 
}
```

```shell
GET /link/048274fa-6d17-4f51-992a-d78435da9397/tag 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": { 
"tag": "SampleLink" 
} 
}
```

```shell
GET /link/tag 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"tag": "SampleLink", 
"linkId": "048274fa-6d17-4f51-992a-d78435da9397" 
} 
] 
}
``` 

```shell
DELETE /link/048274fa-6d17-4f51-992a-d78435da9397/tag/SampleLink 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": "048274fa-6d17-4f51-992a-d78435da9397" 
}
``` 

# interface 

| HTTP Method | URI | Description |
|-------------|----|----------| 
| GET | /interface/{interface-id} | Returns an interface | 
| GET | /interface/network-device/{network-device-id}/count | Returns the number of interfaces for the network-device-id | 
| GET | /interface/network-device/{network-device-id}/{start}/{end} | Returns all the interfaces for the network device in the range, start & end are 32 bit numbers, start < end | 
| GET | /interface/network-device/{network-device-id} | Returns all the interfaces for the network device | 
| GET | /interface/line-card/{line-card-id}/count | Returns the number of interfaces for the line-card-id | 
| GET | /interface/line-card/{line-card-id}/{start}/{end} | Returns all the interfaces for the line-card in the range, start & end are 32 bit numbers, start < end | 
| GET | /interface/line-card/{line-card-id} | Returns all the interfaces for the line card | 
| GET | /interface/count | Returns the number of interfaces in the controller | 
| GET | /interface/{start}/{end} | Returns all the interfaces in the range, start & end are 32 bit numbers, start < end | 
| GET | /interface/ | Returns all the interfaces | 

```shell
GET /interface/4365b939-186f-427e-95a8-52a823a0f5ac 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": { 
"status": "up", 
"portName": "GigabitEthernet1/3", 
"deviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"interfaceId": "4365b939-186f-427e-95a8-52a823a0f5ac", 
"lineCardId": "", 
"lastUpdated": "2013-09-27 02:32:38.595054-07", 
"numUpdates": 1, 
"macAddress": "00:13:C3:85:BA:8E", 
"serialNo": "SMG1027NQNX", 
"pid": "WS-C6509-E", 
"portType": "ethernetCsmaCd", 
"portMode": "trunk", 
"duplex": true, 
"vendor": "Cisco", 
"securityStatus": false, 
"connectorType": "NA", 
"interfaceType": "Physical", 
"virtualInterfaceType": "NA" 
} 
}
``` 

```shell
GET /interface/network-device/517faa8a-cfe9-4307-9844-c7c1f048f5f8/count 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": 115 
}
``` 

```shell
GET /interface/network-device/517faa8a-cfe9-4307-9844-c7c1f048f5f8/1/2 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"status": "up", 
"portName": "GigabitEthernet1/3", 
"deviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"interfaceId": "4365b939-186f-427e-95a8-52a823a0f5ac", 
"lineCardId": "", 
"lastUpdated": "2013-09-27 02:32:38.595054-07", 
"numUpdates": 1, 
"macAddress": "00:13:C3:85:BA:8E", 
"serialNo": "SMG1027NQNX", 
"pid": "WS-C6509-E", 
"portType": "ethernetCsmaCd", 
"portMode": "trunk", 
"duplex": true, 
"vendor": "Cisco", 
"securityStatus": false, 
"connectorType": "NA", 
"interfaceType": "Physical", 
"virtualInterfaceType": "NA" 
}, 
{ 
"status": "down", 
"portName": "GigabitEthernet1/4", 
"deviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"interfaceId": "b56c7a29-f2cf-488f-b747-70bd30e4c5bf", 
"lineCardId": "", 
"lastUpdated": "2013-09-27 02:32:38.599265-07", 
"numUpdates": 1, 
"macAddress": "00:18:74:9E:1C:00", 
"serialNo": "SMG1027NQNX", 
"pid": "WS-C6509-E", 
"portType": "ethernetCsmaCd", 
"portMode": "routed", 
"speed": 1000000, 
"duplex": false, 
"vendor": "Cisco", 
"securityStatus": false, 
"connectorType": "NA", 
"interfaceType": "Physical", 
"virtualInterfaceType": "NA" 
} 
] 
}
```

```shell
GET /interface/network-device/517faa8a-cfe9-4307-9844-c7c1f048f5f8 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"status": "up", 
"portName": "GigabitEthernet1/3", 
"deviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"interfaceId": "4365b939-186f-427e-95a8-52a823a0f5ac", 
"lineCardId": "", 
"lastUpdated": "2013-09-27 02:32:38.595054-07", 
"numUpdates": 1, 
"macAddress": "00:13:C3:85:BA:8E", 
"serialNo": "SMG1027NQNX", 
"pid": "WS-C6509-E", 
"portType": "ethernetCsmaCd", 
"portMode": "trunk", 
"duplex": true, 
"vendor": "Cisco", 
"securityStatus": false, 
"connectorType": "NA", 
"interfaceType": "Physical", 
"virtualInterfaceType": "NA" 
}, 
{ 
"status": "down", 
"portName": "GigabitEthernet1/4", 
"deviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"interfaceId": "b56c7a29-f2cf-488f-b747-70bd30e4c5bf", 
"lineCardId": "", 
"lastUpdated": "2013-09-27 02:32:38.599265-07", 
"numUpdates": 1, 
"macAddress": "00:18:74:9E:1C:00", 
"serialNo": "SMG1027NQNX", 
"pid": "WS-C6509-E", 
"portType": "ethernetCsmaCd", 
"portMode": "routed", 
"speed": 1000000, 
"duplex": false, 
"vendor": "Cisco", 
"securityStatus": false, 
"connectorType": "NA", 
"interfaceType": "Physical", 
"virtualInterfaceType": "NA" 
}, 
{ 
"status": "down", 
"portName": "GigabitEthernet1/5", 
"deviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"interfaceId": "7822c1d7-f2d7-445e-be47-267b987993e4", 
"lineCardId": "", 
"lastUpdated": "2013-09-27 02:32:38.604339-07", 
"numUpdates": 1, 
"macAddress": "00:18:74:9E:1C:00", 
"serialNo": "SMG1027NQNX", 
"pid": "WS-C6509-E", 
"portType": "ethernetCsmaCd", 
"portMode": "routed", 
"speed": 1000000, 
"duplex": false, 
"vendor": "Cisco", 
"securityStatus": false, 
"connectorType": "NA", 
"interfaceType": "Physical", 
"virtualInterfaceType": "NA" 
} 
] 
}
```

```shell
GET /interface/line-card/91d58b84-ce17-43dc-8df3-17c86ac710a7/count 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": 1 
}
```

```shell
GET /interface/line-card/91d58b84-ce17-43dc-8df3-17c86ac710a7 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"status": "down", 
"portName": "GigabitEthernet1/2", 
"deviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"interfaceId": "9af8bc6e-d02a-49e8-adb8-9a7039b2bafa", 
"lineCardId": "91d58b84-ce17-43dc-8df3-17c86ac710a7", 
"lastUpdated": "2013-09-27 02:32:38.590758-07", 
"numUpdates": 1, 
"macAddress": "00:13:C3:85:BA:8D", 
"serialNo": "SMG1027NQNX", 
"pid": "WS-C6509-E", 
"portType": "ethernetCsmaCd", 
"portMode": "Access", 
"speed": 1000000, 
"duplex": false, 
"vendor": "Cisco", 
"securityStatus": false, 
"connectorType": "NA", 
"interfaceType": "Physical", 
"virtualInterfaceType": "NA" 
} 
] 
}
```

```shell
GET /interface/count 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": 234 
}
```

```shell
GET /interface/1/2 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"status": "down", 
"portName": "GigabitEthernet1/2", 
"deviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"interfaceId": "9af8bc6e-d02a-49e8-adb8-9a7039b2bafa", 
"lineCardId": "", 
"lastUpdated": "2013-09-27 02:32:38.590758-07", 
"numUpdates": 1, 
"macAddress": "00:13:C3:85:BA:8D", 
"serialNo": "SMG1027NQNX", 
"pid": "WS-C6509-E", 
"portType": "ethernetCsmaCd", 
"portMode": "Access", 
"speed": 1000000, 
"duplex": false, 
"vendor": "Cisco", 
"securityStatus": false, 
"connectorType": "NA", 
"interfaceType": "Physical", 
"virtualInterfaceType": "NA" 
}, 
{ 
"status": "up", 
"portName": "GigabitEthernet1/3", 
"deviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"interfaceId": "4365b939-186f-427e-95a8-52a823a0f5ac", 
"lineCardId": "", 
"lastUpdated": "2013-09-27 02:32:38.595054-07", 
"numUpdates": 1, 
"macAddress": "00:13:C3:85:BA:8E", 
"serialNo": "SMG1027NQNX", 
"pid": "WS-C6509-E", 
"portType": "ethernetCsmaCd", 
"portMode": "trunk", 
"duplex": true, 
"vendor": "Cisco", 
"securityStatus": false, 
"connectorType": "NA", 
"interfaceType": "Physical", 
"virtualInterfaceType": "NA" 
} 
] 
}
```

```shell
GET /interface/ 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"status": "down", 
"portName": "GigabitEthernet1/2", 
"deviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"interfaceId": "9af8bc6e-d02a-49e8-adb8-9a7039b2bafa", 
"lineCardId": "", 
"lastUpdated": "2013-09-27 02:32:38.590758-07", 
"numUpdates": 1, 
"macAddress": "00:13:C3:85:BA:8D", 
"serialNo": "SMG1027NQNX", 
"pid": "WS-C6509-E", 
"portType": "ethernetCsmaCd", 
"portMode": "Access", 
"speed": 1000000, 
"duplex": false, 
"vendor": "Cisco", 
"securityStatus": false, 
"connectorType": "NA", 
"interfaceType": "Physical", 
"virtualInterfaceType": "NA" 
}, 
{ 
"status": "up", 
"portName": "GigabitEthernet1/3", 
"deviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"interfaceId": "4365b939-186f-427e-95a8-52a823a0f5ac", 
"lineCardId": "", 
"lastUpdated": "2013-09-27 02:32:38.595054-07", 
"numUpdates": 1, 
"macAddress": "00:13:C3:85:BA:8E", 
"serialNo": "SMG1027NQNX", 
"pid": "WS-C6509-E", 
"portType": "ethernetCsmaCd", 
"portMode": "trunk", 
"duplex": true, 
"vendor": "Cisco", 
"securityStatus": false, 
"connectorType": "NA", 
"interfaceType": "Physical", 
"virtualInterfaceType": "NA" 
}, 
{ 
"status": "down", 
"portName": "GigabitEthernet1/4", 
"deviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"interfaceId": "b56c7a29-f2cf-488f-b747-70bd30e4c5bf", 
"lineCardId": "", 
"lastUpdated": "2013-09-27 02:32:38.599265-07", 
"numUpdates": 1, 
"macAddress": "00:18:74:9E:1C:00", 
"serialNo": "SMG1027NQNX", 
"pid": "WS-C6509-E", 
"portType": "ethernetCsmaCd", 
"portMode": "routed", 
"speed": 1000000, 
"duplex": false, 
"vendor": "Cisco", 
"securityStatus": false, 
"connectorType": "NA", 
"interfaceType": "Physical", 
"virtualInterfaceType": "NA" 
} 
] 
}
```

# interface-tag 

| HTTP Method | URI | Description |
|-------------|----|----------| 
| POST | /interface/tag | Inserts a new tag for one or many network devices, the interface-ids are specified in the request object | 
| GET | /interface/{interface-id}/tag | Returns the interface tag | 
| GET | /interface/tag/{start}/{end} | Returns the interface tags of all interfaces in the given range, start & end are 32 bit numbers, start < end | 
| GET | /interface/tag/ | Returns the interface tags of all interfaces | 
| DELETE | /interface/{interface-id}/tag/{tag} | Deletes the specified tag for the interface | 

```shell
POST /interface/tag 
Request: 
{ 
"interfaceId": "4b2f78b2-1270-4c14-9691-be7b9521024f", 
"tag" : "TestTag" 
} 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": "Number of records updated for interface 4b2f78b2-1270-4c14-9691-be7b9521024f 1" 
}
```

```shell
GET /interface/4b2f78b2-1270-4c14-9691-be7b9521024f/tag 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"tag": "TestTag" 
} 
] 
}
```

```shell
GET /interface/tag 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"tag": "TestTag", 
"interfaceId": "4b2f78b2-1270-4c14-9691-be7b9521024f" 
} 
] 
}
```

```shell
DELETE /interface/4b2f78b2-1270-4c14-9691-be7b9521024f/tag/TestTag 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": "4b2f78b2-1270-4c14-9691-be7b9521024f" 
}
```

```shell
GET /interface/tag/1/5 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"tag": "TestTag", 
"interfaceId": "4b2f78b2-1270-4c14-9691-be7b9521024f" 
} 
] 
}
``` 

# interface-queue-statistics 


| HTTP Method | URI | Description |
|-------------|----|----------| 
| POST | /interface-queue-statistics/ | Enable queue statistics collection for the given device IDs in the request If "device-id":ALL, enable for all active devices | 
| GET | /interface-queue-statistics/{interface-id} | Get the interface statistics for the given interface-id | 
| GET | /interface-queue-statistics/ | Get the interface statistics for all the devices | 
| DELETE | /interface-queue-statistics/{device-id} | Deletes the interfaces statistics collection for the given device-id | 
| DELETE | /interface-queue-statistics/ | Deletes the interface statistics collection for all devices |

```shell
POST statistics-manager/interface-queue-statistics 
Request: 
{ 
"deviceId":""//Values: single / comma separated deviceIds / ALL 
} 
Sample Request: Single deviceId 
{ 
"deviceId":"d5311c35-a439-49b3-ae3e-7a317f17d2a9" 
} 
Sample Request: Comma separated deviceIds 
{ 
"deviceId":"d5311c35-a439-49b3-ae3e-7a317f17d2a9,64f10293-7f7c-4e9c-9c91-e221a14e540a" 
} 
Sample Request: ALL 
{ 
"deviceId":"ALL" 
} 
Response: 
HTTP Status 201 CREATED 
{ 
"response": "Success", 
"version": "0.0" 
} 
```

```shell
GET statistics-manager/interface-queue-statistics/60590bec-3209-48a2-9631-d4566cda3526 
Response: 
HTTP 200 OK 

{ 
"response": 
{ 
"queueStatsEnq": 4, 
"queueStatsDrop": 0, 
"queueStatsEnq0AggDelta": 0, 
"queueStatsEnq1AggDelta": 0, 
"queueStatsEnq2AggDelta": 0, 
"queueStatsEnq3AggDelta": 0, 
"queueStatsEnq4AggDelta": 0, 
"queueStatsEnq5AggDelta": 0, 
"queueStatsEnq6AggDelta": 0, 
"queueStatsEnq7AggDelta": 0, 
"queueStatsEnqDelta": 0, 
"queueStatsDrop0AggDelta": 0, 
"queueStatsDrop1AggDelta": 0, 
"queueStatsDrop2AggDelta": 0, 
"queueStatsDrop3AggDelta": 0, 
"queueStatsDrop4AggDelta": 0, 
"queueStatsDrop5AggDelta": 0, 
"queueStatsDrop6AggDelta": 0, 
"queueStatsDrop7AggDelta": 0, 
"queueStatsDropDelta": 0, 
"interfaceId": "60590bec-3209-48a2-9631-d4566cda3526" 
}, 
"version": "0.0" 
} 
```

```shell
GET /interface-queue-statistics 
Response: 
HTTP 200 OK 

{ 
"response": 
[ 
{ 
"deviceId": "639c99c6-9588-4258-8c15-02d9a6787cfe", 
"portStatisticsNIOs": 
[ 
{ 
"queueStatsEnq": 4, 
"queueStatsDrop": 0, 
"queueStatsEnq0AggDelta": 0, 
"queueStatsEnq1AggDelta": 0, 
"queueStatsEnq2AggDelta": 0, 
"queueStatsEnq3AggDelta": 0, 
"queueStatsEnq4AggDelta": 0, 
"queueStatsEnq5AggDelta": 0, 
"queueStatsEnq6AggDelta": 0, 
"queueStatsEnq7AggDelta": 0, 
"queueStatsEnqDelta": 0, 
"queueStatsDrop0AggDelta": 0, 
"queueStatsDrop1AggDelta": 0, 
"queueStatsDrop2AggDelta": 0, 
"queueStatsDrop3AggDelta": 0, 
"queueStatsDrop4AggDelta": 0, 
"queueStatsDrop5AggDelta": 0, 
"queueStatsDrop6AggDelta": 0, 
"queueStatsDrop7AggDelta": 0, 
"queueStatsDropDelta": 0, 
"interfaceId": "60590bec-3209-48a2-9631-d4566cda3526" 
}, 
{ 
"queueStatsEnq": 4, 
"queueStatsDrop": 0, 
"queueStatsEnq0AggDelta": 0, 
"queueStatsEnq1AggDelta": 0, 
"queueStatsEnq2AggDelta": 0, 
"queueStatsEnq3AggDelta": 0, 
"queueStatsEnq4AggDelta": 0, 
"queueStatsEnq5AggDelta": 0, 
"queueStatsEnq6AggDelta": 0, 
"queueStatsEnq7AggDelta": 0, 
"queueStatsEnqDelta": 0, 
"queueStatsDrop0AggDelta": 0, 
"queueStatsDrop1AggDelta": 0, 
"queueStatsDrop2AggDelta": 0, 
"queueStatsDrop3AggDelta": 0, 
"queueStatsDrop4AggDelta": 0, 
"queueStatsDrop5AggDelta": 0, 
"queueStatsDrop6AggDelta": 0, 
"queueStatsDrop7AggDelta": 0, 
"queueStatsDropDelta": 0, 
"interfaceId": "303bb996-9aab-46b9-9419-44d5520ff010" 
}, 

] 
} 
], 
"version": "0.0" 
} 
```

```shell
DELETE /interface-queue-statistics/017b043c-86d1-42d9-8481-b2acb6762b69 
Response: 
HTTP Status 200 OK 

{ 
"response": "Success", 
"version": "0.0" 
} 
```

```shell
DELETE /interface-queue-statistics 
Response: 
HTTP Status 200 OK 

{ 
"response": "Success", 
"version": "0.0" 
} 
```

# tag-network-device 

| HTTP Method | URI | Description |
|-------------|----|----------| 
| GET | /tag/{tag}/network-device | Returns all network-devices with given tag | 

```shell
GET /tag/TestTag/network-device 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"location": "ddd36d94-6719-4644-939f-4ffffdac3202", 
"type": "switch", 
"serialNumber": "SMG1027NQNX", 
"tag": "TestTag", 
"role": "SampleData", 
"hostname": "EFT-CAMPUS-CAT6509E", 
"managementIpAddress": "14.4.4.2", 
"interfaceCount": "114", 
"networkDeviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"lastUpdated": "2013-09-30 05:50:24.969-07", 
"platformId": "WS-C6509-E", 
"avgUpdateFrequency": 71, 
"numUpdates": 1864, 
"macAddress": "00:18:74:9E:1C:00", 
"upTime": "2 weeks, 3 days, 23 hours, 32 minutes", 
"family": "s3223_rp", 
"vendor": "Cisco", 
"imageName": "s3223-advipservicesk9_wan-vz.122-33.SXH4.bin", 
"chassisType": "s3223_rp", 
"softwareVersion": "12.2(33)SXH4" 
} 
] 
}
``` 

# tag-link 

| HTTP Method | URI | Description |
|-------------|----|----------| 
| GET | /tag/{tag}/link | Returns all links with given tag | 

```shell
GET /tag/SampleLink/link 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"tag": "SampleLink", 
"linkStatus": "UP", 
"startDeviceId": "dc607890-1ebf-4f0e-a019-3ba392803076", 
"endDeviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"lastUpdated": "2013-09-30 06:47:34.895905-07", 
"avgUpdateFrequency": 91453, 
"numUpdates": 4, 
"endPortId": "4b2f78b2-1270-4c14-9691-be7b9521024f", 
"linkId": "048274fa-6d17-4f51-992a-d78435da9397", 
"startPortId": "f3b6167f-3a2e-4525-a3c2-7922027d0596" 
} 
] 
}
``` 

# tag-interface 

| HTTP Method | URI | Description |
|-------------|----|----------| 
| GET | /tag/{tag}/interface | Returns all interfaces with given tag | 

```shell
GET /tag/TestTag/interface 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"tag": "TestTag", 
"status": "up", 
"portName": "GigabitEthernet1/1", 
"deviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"interfaceId": "4b2f78b2-1270-4c14-9691-be7b9521024f", 
"lineCardId": "", 
"lastUpdated": "2013-09-27 02:32:38.58175-07", 
"numUpdates": 1, 
"macAddress": "00:13:C3:85:BA:8C", 
"serialNo": "SMG1027NQNX", 
"pid": "WS-C6509-E", 
"portType": "ethernetCsmaCd", 
"portMode": "Access", 
"duplex": false, 
"vendor": "Cisco", 
"securityStatus": false, 
"connectorType": "NA", 
"interfaceType": "Physical", 
"virtualInterfaceType": "NA" 
} 
] 
}
``` 

# host 

| HTTP Method | URI | Description |
|-------------|----|----------| 
| GET | /host/{host-id} | Returns information about a host | 
| GET | /host/count | Returns the number of hosts in the controller | 
| GET | /host/{start}/{end} | Returns information about all the hosts stored in the range, start & end are 32 bit numbers, start < end | 
| GET | /host/ | Returns information about all the hosts stored in the controller | 
| GET | /network-device/{network-device-id}/host | Returns all the hosts attached to the network-device | 

```shell
GET /host 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"hostId": "d0648d65-b3f6-449d-8778-6d51f72972a4", 
"hostIpAddress": "10.77.165.7", 
"hostMACAddress": "de:ad:be:ef:de:ad", 
"hostName": "sdn's computer", 
"hostType": "wired", 
"connectedDeviceId": "dc607890-1ebf-4f0e-a019-3ba392803076", 
"connectedPortId": "4b2f78b2-1270-4c14-9691-be7b9521024f", 
"vlanId":"1", 
"lastUpdated": "2013-09-30 04:52:48.426133-07", 
"avgUpdateFrequency": 10, 
"numUpdates": 1, 
} 
] 
}
```

```shell
GET /host/1/1 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"connectedDeviceId": "dc607890-1ebf-4f0e-a019-3ba392803076", 
"connectedPortId": "4b2f78b2-1270-4c14-9691-be7b9521024f", 
"hostIpAddress": "10.77.165.7", 
"lastUpdated": "2013-09-30 04:52:48.426133-07", 
"avgUpdateFrequency": 10, 
"numUpdates": 1, 
"hostType": "test", 
"hostId": "d0648d65-b3f6-449d-8778-6d51f72972a4", 
"cdpInformation": "test", 
"lldpInformation": "text" 
} 
] 
}
```

```shell
GET /host/count 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": 1 
}
```

```shell
GET /host/d0648d65-b3f6-449d-8778-6d51f72972a4 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"hostId": "d0648d65-b3f6-449d-8778-6d51f72972a4", 
"hostIpAddress": "10.77.165.7", 
"hostMACAddress": "de.ad.be.ef.de.ad", 
"hostName": "sdn's computer", 
"hostType": "test", 
"connectedDeviceId": "dc607890-1ebf-4f0e-a019-3ba392803076", 
"connectedInterfaceId": "4b2f78b2-1270-4c14-9691-be7b9521024f", 
"vlanId":1, 
"lastUpdated": "2013-09-30 04:52:48.426133-07", 
"avgUpdateFrequency": 10, 
"numUpdates": 1, 
} 
] 
}
```

# location

| HTTP Method | URI | Description |
|-------------|----|----------| 
| POST | /location/ | Creates a location | 
| GET | /location/{location-id} | Returns a location by location-id | 
| GET count | /location/count | Get the number of locations in the controller | 
| GET | /location/{start}/{end} | Returns all the locations in the given range, start & end are 32 bit numbers, start < end | 
| GET | /location/ | Returns all the locations | 
| PUT | /location/ | Updates the location (or a list of locations) with the location-ids and attributes specified in the Request Object, if "location-id":"ALL", update all | 
| DELETE | /location/{location-id} | Deletes a location by location-id | 
| DELETE | /location/ | Deletes all locations stored in the controller |

```shell
POST /location 
Request : 
{ 
"locationId": "", 
"civicAddress": "Chennai", 
"geographicalAddress": "India", 
"description": "TEST", 
"tag": "Test" 
} 
Response : 
HTTP Status 201 CREATED 
{ 
"version": "0.0", 
"response": "ddd36d94-6719-4644-939f-4ffffdac3202" 
}
```

```shell
GET /location/ddd36d94-6719-4644-939f-4ffffdac3202 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": { 
"description": "TEST", 
"tag": "Test", 
"civicAddress": "Chennai", 
"geographicalAddress": "India", 
"locationId": "ddd36d94-6719-4644-939f-4ffffdac3202" 
} 
}
``` 
```shell
GET /location/count 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": 2 
}
```

```shell
GET /location/1/2 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"description": "TEST", 
"tag": "Test", 
"civicAddress": "City2", 
"geographicalAddress": "Test1", 
"locationId": "ddd36d94-6719-4644-939f-4ffffdac3202" 
}, 
{ 
"description": "TEST", 
"tag": "Test", 
"civicAddress": "City1", 
"geographicalAddress": "Test2", 
"locationId": "8e1831de-ef81-4cff-8303-7ba9f4f8115b" 
} 
] 
}
``` 

```shell
GET /location 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"description": "TEST", 
"tag": "Test", 
"civicAddress": "City2", 
"geographicalAddress": "Test1", 
"locationId": "ddd36d94-6719-4644-939f-4ffffdac3202" 
}, 
{ 
"description": "TEST", 
"tag": "Test", 
"civicAddress": "City1", 
"geographicalAddress": "Test2", 
"locationId": "8e1831de-ef81-4cff-8303-7ba9f4f8115b" 
} 
] 
}
``` 
```shell
PUT /location 
Request: 
{ 
"description": "Test update", 
"tag": "Test", 
"civicAddress": "Test", 
"geographicalAddress": "Test", 
"locationId": "ddd36d94-6719-4644-939f-4ffffdac3202" 
} 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": "Number of records updated for location ddd36d94-6719-4644-939f-4ffffdac3202 1" 
}
``` 
```shell
DELETE /location/8e1831de-ef81-4cff-8303-7ba9f4f8115b 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": "8e1831de-ef81-4cff-8303-7ba9f4f8115b" 
}
```

# location-network-device

| HTTP Method | URI | Description |
|-------------|----|----------| 
| GET | /location/{location-id}/network-device/count | Returns the count of network devices at the location specified by {location-id} | 
| GET | /location/{location-id}/network-device/{start}/{end} | Returns all network-devices belonging to location specified by {location-id} and in the range, start & end are 32 bit numbers, start < end | 
| GET | /location/{location-id}/network-device/ | Returns all network-devices belonging to location specified by {location-id} | 

```shell
GET /location/ddd36d94-6719-4644-939f-4ffffdac3202/network-device/count 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": 3 
}
``` 

```shell
GET /location/ddd36d94-6719-4644-939f-4ffffdac3202/network-device/1/2 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"location": "ddd36d94-6719-4644-939f-4ffffdac3202", 
"type": "router", 
"serialNumber": "FTX1730AH2B", 
"role": "SampleData", 
"hostname": "EFT-CAMPUS-ISR3900", 
"managementIpAddress": "14.4.4.1", 
"interfaceCount": "3", 
"networkDeviceId": "dc607890-1ebf-4f0e-a019-3ba392803076", 
"lastUpdated": "2013-09-28 15:33:32.365773-07", 
"platformId": "C3900-SPE150/K9", 
"numUpdates": 1854, 
"macAddress": "7C:69:F6:64:E2:01", 
"upTime": "2 weeks, 3 days, 23 hours, 14 minutes", 
"family": "C3900", 
"vendor": "Cisco", 
"imageName": "c3900-universalk9-mz.SPA.152-4.M3.bin", 
"chassisType": "C3900", 
"softwareVersion": "15.2(4)M3" 
}, 
{ 
"location": "ddd36d94-6719-4644-939f-4ffffdac3202", 
"type": "switch", 
"serialNumber": "SMG1027NQNX", 
"tag": "TestTag", 
"role": "Updated", 
"hostname": "EFT-CAMPUS-CAT6509E", 
"managementIpAddress": "14.4.4.2", 
"interfaceCount": "114", 
"networkDeviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"lastUpdated": "2013-09-30 02:07:53.136698-07", 
"platformId": "WS-C6509-E", 
"avgUpdateFrequency": 67, 
"numUpdates": 1861, 
"macAddress": "00:18:74:9E:1C:00", 
"upTime": "2 weeks, 3 days, 23 hours, 32 minutes", 
"family": "s3223_rp", 
"vendor": "Cisco", 
"imageName": "s3223-advipservicesk9_wan-vz.122-33.SXH4.bin", 
"chassisType": "s3223_rp", 
"softwareVersion": "12.2(33)SXH4" 
} 
] 
}
``` 

```shell
GET /location/ddd36d94-6719-4644-939f-4ffffdac3202/network-device/ 
Response: 
HTTP Status 200 OK 
{ 
"version": "0.0", 
"response": [ 
{ 
"location": "ddd36d94-6719-4644-939f-4ffffdac3202", 
"type": "router", 
"serialNumber": "FTX1730AH2B", 
"role": "SampleData", 
"hostname": "EFT-CAMPUS-ISR3900", 
"managementIpAddress": "14.4.4.1", 
"interfaceCount": "3", 
"networkDeviceId": "dc607890-1ebf-4f0e-a019-3ba392803076", 
"lastUpdated": "2013-09-28 15:33:32.365773-07", 
"platformId": "C3900-SPE150/K9", 
"numUpdates": 1854, 
"macAddress": "7C:69:F6:64:E2:01", 
"upTime": "2 weeks, 3 days, 23 hours, 14 minutes", 
"family": "C3900", 
"vendor": "Cisco", 
"imageName": "c3900-universalk9-mz.SPA.152-4.M3.bin", 
"chassisType": "C3900", 
"softwareVersion": "15.2(4)M3" 
}, 
{ 
"location": "ddd36d94-6719-4644-939f-4ffffdac3202", 
"type": "switch", 
"serialNumber": "SMG1027NQNX", 
"tag": "TestTag", 
"role": "Updated", 
"hostname": "EFT-CAMPUS-CAT6509E", 
"managementIpAddress": "14.4.4.2", 
"interfaceCount": "114", 
"networkDeviceId": "517faa8a-cfe9-4307-9844-c7c1f048f5f8", 
"lastUpdated": "2013-09-30 02:07:53.136698-07", 
"platformId": "WS-C6509-E", 
"avgUpdateFrequency": 67, 
"numUpdates": 1861, 
"macAddress": "00:18:74:9E:1C:00", 
"upTime": "2 weeks, 3 days, 23 hours, 32 minutes", 
"family": "s3223_rp", 
"vendor": "Cisco", 
"imageName": "s3223-advipservicesk9_wan-vz.122-33.SXH4.bin", 
"chassisType": "s3223_rp", 
"softwareVersion": "12.2(33)SXH4" 
}, 
{ 
"location": "ddd36d94-6719-4644-939f-4ffffdac3202", 
"type": "switch", 
"serialNumber": "SMG1027NQNX", 
"role": "SampleData", 
"hostname": "EFT-CAMPUS-CAT6509E", 
"managementIpAddress": "14.4.4.2", 
"interfaceCount": "114", 
"networkDeviceId": "5d29f72a-8b3e-4a01-a4b5-cdecefdefd8c", 
"lastUpdated": "2013-09-28 14:27:47.128554-07", 
"platformId": "WS-C6509-E", 
"numUpdates": 1849, 
"macAddress": "00:18:74:9E:1C:00", 
"upTime": "2 weeks, 3 days, 22 hours, 30 minutes", 
"family": "s3223_rp", 
"vendor": "Cisco", 
"imageName": "s3223-advipservicesk9_wan-vz.122-33.SXH4.bin", 
"chassisType": "s3223_rp", 
"softwareVersion": "12.2(33)SXH4" 
} 
] 
}
``` 

# external-aaa-keystore-file 

| HTTP Method | URI | Description |
|-------------|----|----------| 
| POST | /external-aaa-keystore-file/ | Uploads a AAA server keystore file | 
| GET | /external-aaa-keystore-file/ | Returns list of uploaded AAA server keystore files | 

```shell
POST /external-aaa-keystore-file 
Request : 
"jksPreferredName": "MyFile.jks" 
"jksFile": a multi-part java keystore file to be uploaded 
Response: 
HTTP/1.1 201 CREATED 
{ 
version: "0.0" 
response: " AAA Keystore File Successfully uploaded: External AAA Server Keystore file POST - insertion/updation SUCCESSFUL" 
} 
```

```shell
GET /external-aaa-keystore-file 
Response : 
{ 
version: "0.0" 
response: [1] 
0: { 
filePath: "/opt/campuscontroller/conf/test" 
fileName: "test" 
} 
}
```

# external-aaa-server-config 

| HTTP Method | URI | Description |
|-------------|----|----------| 
| POST | /external-aaa-server-config/ | Creates or Updates aaa server config | 
| GET | /external-aaa-server-config/ | Returns aaa server config | 
| DELETE | /external-aaa-server-config/ | Deletes aaa server config | 

```shell
POST /external-aaa-server-config/ 
Request: 
{ 
"aaaIpAddress":"192.168.68.130", 
"aaaSubscriberName":"subscriber", 
"keystoreFileName":"MyFile.jks", 
"keystorePassPhrase":"cisco123" 
} 
Response: 
HTTP/1.1 201 CREATED 
{ 
version: "0.0" 
response: " AAA Server Config Successfully Created: External AAA Server Config POST - insertion/updation SUCCESSFUL" 
} 
```

```shell
GET /external-aaa-server-config/ 
Response: 
HTTP/1.1 200 OK 
{ 
version: "0.0" 
response: [1] 
0: { 
aaaIpAddress: "192.168.68.130" 
aaaSubscriberName: "subscriber" 
keystorePath: "/opt/campuscontroller/conf/MyFile.jks" 
keystorePassPhrase: "cisco123" 
aaaServerState: "Inactive" 
} 
} 
```

```shell
DELETE /external-aaa-server-config/ 
Response: 
HTTP/1.1 200 OK 
{ 
version: "0.0" 
response: " AAA Server Config Successfully Deleted: External AAA Server Configuration DELETE All Successful" 
} 
```

# user 

| HTTP Method | URI | Description |
|-------------|----|----------| 
| GET | /user/{userid} | Returns information about a userid | 
| GET | /user/count | Returns the number of users in the controller | 
| GET | /user/{start}/{end} | Returns information about all the users in the given range, start & end are 32 bit numbers, start < end | 
| GET | /user/ | Returns information about all the users | 

```shell
GET /user/{userid} 
Response: 
HTTP/1.1 200 OK 
{"version":"0.0", 
"response": 
[{ 
"mgmtDeviceIpAddress":"14.4.4.3", 
"userId":"smailapa", 
"identityId":"7968d7cf-ec4a-419e-92f4-49fa9fa920b9", 
"updateTime":"December 4, 2013 1:36:58 PM PST", 
"ipAddress":"14.4.4.15", 
"macAddress":"00-1B-21-D4-B9-C0", 
"mgmtPortId":"FastEthernet5/0/3", 
"mgmtMacAddress":"00-15-62-7A-2B-85", 
"userGroups":"groupmembership: eng_eng_rw, pisces-authz, uag_eng_rw, englearn-cdo, enged-news, enged-i3e, enged, crrq-access, isbuwebauth, ciscoreg, xmp_presnt_ro, pcg_mmabu_eng, pcg_mmabu_all, pcg_eng, pcg_all, netscape7_test1, mmabu_all, mcpsw_guest, mcp_rw, mcp_guest, emtp-oss_ro, group_reg_rlloyd, group-sagupta, group-jeffreed, dpt34940, atg_abu_rw, ckrt_rw, dpt24675, englearn-cisco, complaint-handle, rtg_ops, cdo_all, pisces-users, engall-icz, allusers, c2cusers, c2users, c3-routing, c3-routing-cvs, csg-codedrop, ecssbu_ro, engall, engonly, filengall-chn, filengall2, filengall3, fit-users, guido, ibsgit, it-uc-cdo, owt370-r, owtallusers, video_init_rw, solpmt, sn_team, rlspreview-eng, relops-website, ciscoall", 
"status":"Active" 
}] 
} 
] 
```

```shell
GET /user/count 
Response: 
HTTP/1.1 200 OK 
{ 
version: "0.0" 
response: { 
count: 2 
} 
} 
```

```shell
GET /user/{start}/{end} 
Response: 
HTTP/1.1 200 OK 
{"version":"0.0", 
"response":[{ 
"mgmtDeviceIpAddress":"14.4.4.3", 
"userId":"smailapa", 
"identityId":"7968d7cf-ec4a-419e-92f4-49fa9fa920b9", 
"updateTime":"December 4, 2013 1:36:58 PM PST", 
"ipAddress":"14.4.4.15", 
"macAddress":"00-1B-21-D4-B9-C0", 
"mgmtPortId":"FastEthernet5/0/3", 
"mgmtMacAddress":"00-15-62-7A-2B-85", 
"userGroups":"groupmembership: eng_eng_rw, pisces-authz, uag_eng_rw, englearn-cdo, enged-news, enged-i3e, enged, crrq-access, isbuwebauth, ciscoreg, xmp_presnt_ro, pcg_mmabu_eng, pcg_mmabu_all, pcg_eng, pcg_all, netscape7_test1, mmabu_all, mcpsw_guest, mcp_rw, mcp_guest, emtp-oss_ro, group_reg_rlloyd, group-sagupta, group-jeffreed, dpt34940, atg_abu_rw, ckrt_rw, dpt24675, englearn-cisco, complaint-handle, rtg_ops, cdo_all, pisces-users, engall-icz, allusers, c2cusers, c2users, c3-routing, c3-routing-cvs, csg-codedrop, ecssbu_ro, engall, engonly, filengall-chn, filengall2, filengall3, fit-users, guido, ibsgit, it-uc-cdo, owt370-r, owtallusers, video_init_rw, solpmt, sn_team, rlspreview-eng, relops-website, ciscoall", 
"status":"Active" 
}, 
{ 
"mgmtDeviceIpAddress":"26.6.6.2", 
"mgmtSlotNum":"1", 
"userId":"kyedaval", 
"identityId":"e77db4e5-8201-4a00-8bf8-4fefdface05b", 
"updateTime":"December 4, 2013 1:48:34 PM PST", 
"vlanId":"[]", 
"macAddress":"00:1B:21:D4:B9:C2", 
"mgmtModuleNum":"0", 
"mgmtPortNum":"7", 
"userGroups":"groupmembership: eng_eng_rw, pisces-authz, uag_eng_rw, crrq-access, enged, enged-i3e, enged-news, englearn-cdo, dpt24675, engmgrs, el-cosi-admin, approvrs, allmgrs, isbuwebauth, englearn-cisco, onectrldocrread, emtp-oss_ro, group_reg_rlloyd, complaint-handle, pcg_mmabu_eng, pcg_mmabu_all, pcg_eng, pcg_all, netscape7_test1, mmabu_all, mcp_rw, dpt34940, atg_abu_rw, sdn-core, pisces-users, mcpsw_guest, mcp_guest, ckrt_rw, engall-icz, filengall-chn, filengall2, filengall3, group-jeffreed, group-sagupta, allusers, c2cusers, c2users, c3-routing, c3-routing-cvs, ciscoall, csg-codedrop, ecssbu_ro, engall, engonly, fit-users, guido, ibsgit, it-uc-cdo, owt370-r, owtallusers, relops-website, rlspreview-eng, sn_team, solpmt, video_init_rw, ciscoreg, xmp_presnt_ro, wnbu-wip03-r, wnbu-owt-wr-gr, wnbu-owt-read-gr, vxworksmaint03-w, vxworksmaint03-r, swtest-ah03-w, swtest-ah03-r, sw_slides03-r, screameagle03-r, rtg_ops, pegasus03-w, pegasus03-r, owt958-r, owt916-r, owt856-r, owt799-r, owt750-r, owt708-r, owt705-w, owt705-r, owt690-w, owt690-r, owt620-r, owt610-r, owt529-w, owt520-w, owt494-r, owt492-r, goldenrod03-r, gibraltar03-r, fluorine03-r, europium03-r, europeum03-r, erbium03-r, eab_video_r, eab-video-extend, dubnium03-r, cross_bu03-r, cobalt03-r, cdo_all, ccx03-r, carbon03-w, carbon03-r, boron03-w, boron03-r, bering3003-w, bering3003-r, bering2003-w, bering2003-r, bering1003-w, bering1003-r, argon03-w, argon03-r, ap-gui03-w, ajax03-r", 
"status":"Active"}]} 
```

```shell
GET /user/ 
Response: 
HTTP/1.1 200 OK 
{"version":"0.0", 
"response":{ 
"mgmtDeviceIpAddress":"26.6.6.2", 
"mgmtSlotNum":"1", 
"userId":"kyedaval", 
"identityId":"e77db4e5-8201-4a00-8bf8-4fefdface05b", 
"updateTime":"December 4, 2013 1:48:34 PM PST", 
"vlanId":"[]", 
"macAddress":"00:1B:21:D4:B9:C2", 
"mgmtModuleNum":"0", 
"mgmtPortNum":"7", 
"userGroups":"groupmembership: eng_eng_rw, pisces-authz, uag_eng_rw, crrq-access, enged, enged-i3e, enged-news, englearn-cdo, dpt24675, engmgrs, el-cosi-admin, approvrs, allmgrs, isbuwebauth, englearn-cisco, onectrldocrread, emtp-oss_ro, group_reg_rlloyd, complaint-handle, pcg_mmabu_eng, pcg_mmabu_all, pcg_eng, pcg_all, netscape7_test1, mmabu_all, mcp_rw, dpt34940, atg_abu_rw, sdn-core, pisces-users, mcpsw_guest, mcp_guest, ckrt_rw, engall-icz, filengall-chn, filengall2, filengall3, group-jeffreed, group-sagupta, allusers, c2cusers, c2users, c3-routing, c3-routing-cvs, ciscoall, csg-codedrop, ecssbu_ro, engall, engonly, fit-users, guido, ibsgit, it-uc-cdo, owt370-r, owtallusers, relops-website, rlspreview-eng, sn_team, solpmt, video_init_rw, ciscoreg, xmp_presnt_ro, wnbu-wip03-r, wnbu-owt-wr-gr, wnbu-owt-read-gr, vxworksmaint03-w, vxworksmaint03-r, swtest-ah03-w, swtest-ah03-r, sw_slides03-r, screameagle03-r, rtg_ops, pegasus03-w, pegasus03-r, owt958-r, owt916-r, owt856-r, owt799-r, owt750-r, owt708-r, owt705-w, owt705-r, owt690-w, owt690-r, owt620-r, owt610-r, owt529-w, owt520-w, owt494-r, owt492-r, goldenrod03-r, gibraltar03-r, fluorine03-r, europium03-r, europeum03-r, erbium03-r, eab_video_r, eab-video-extend, dubnium03-r, cross_bu03-r, cobalt03-r, cdo_all, ccx03-r, carbon03-w, carbon03-r, boron03-w, boron03-r, bering3003-w, bering3003-r, bering2003-w, bering2003-r, bering1003-w, bering1003-r, argon03-w, argon03-r, ap-gui03-w, ajax03-r", 
"status":"Active"}} 
```

# configured-application 

| HTTP Method | URI | Description |
|-------------|----|----------| 
| POST | /configured-application/ | Creates a configured application | 
| GET | /configured-application/{application-id} | Returns a configured application by application-id | 
| GET | /configured-application/count | Returns the number of configured applications in the controller | 
| GET | /configured-application/{start}/{end} | Returns all configured applications in the given range, start & end are 32 bit numbers, start <= end | 
| GET | /configured-application/ | Returns all configured applications | 
| PUT | /configured-application/ | Updates the configured application (or a list of applications) with the {application-id} and attributes specified in the Request Object | 
| DELETE | /configured-application/{application-id} | Deletes a configured application by application-id | 
| DELETE | /configured-application/ | Deletes all configured applications stored in the controller | 
*POST /configured-application* 

```shell
{"applicationName":"FOOBAR","applicationClass":"Client-Server","lowerPort":90,"upperPort":90,"applicationProtocol":"tcp"} 
```

Response HTTP/1.1 201 Created 
```shell
{"version":"0.0","response":" Configured App with Id 4bd516a5-d9fc-43fd-9154-a074a57e9a6a Successfully Created"} 
```

*GET /configured-application/4bd516a5-d9fc-43fd-9154-a074a57e9a6a* 
Response HTTP/1.1 200 OK 
```shell
{"version":"0.0", 
"response": 
{ 
"applicationId":"4bd516a5-d9fc-43fd-9154-a074a57e9a6a", 
"applicationName":"FOOBAR", 
"applicationClass":"Client-Server", 
"applicationProtocol":"tcp", 
"lowerPort":90, 
"upperPort":90 
} 
} 
```

*GET /configured-application* 
Response HTTP/1.1 200 OK 

```shell
{ 
"version":"0.0", 
"response": 
[ 
{ 
"applicationId":"1", 
"applicationName":"CUPC", 
"applicationClass":"Multimedia Conferencing", 
"applicationProtocol":"tcp", 
"lowerPort":16384, 
"upperPort":32767}, 
{ 
"applicationId":"2", 
"applicationName":"SCCP", 
"applicationClass":"Signaling", 
"applicationProtocol":"tcp", 
"lowerPort":2000, 
"upperPort":2002}, 
{ 
"applicationId":"3", 
"applicationName":"SIP", 
"applicationClass":"Signaling", 
"applicationProtocol":"tcp/udp", 
"lowerPort":5060,"upperPort":5061 
}, 
{ 
"applicationId":"4bd516a5-d9fc-43fd-9154-a074a57e9a6a", 
"applicationName":"FOOBAR", 
"applicationClass":"Client-Server", 
"applicationProtocol":"tcp", 
"lowerPort":90, 
"upperPort":90 
} 
]} 
```

*GET /configured-application/count* 
```shell
HTTP/1.1 200 OK 
{"version":"0.0","response":23} 
```
*GET /configured-application/1/3* 
```shell
HTTP/1.1 200 OK 
{"version":"0.0", 
"response": 
[ 
{"applicationId":"2", 
"applicationName":"SCCP", 
"applicationClass":"Signaling", 
"applicationProtocol":"tcp", 
"lowerPort":2000, 
"upperPort":2002 
},{ 
"applicationId":"3", 
"applicationName":"SIP", 
"applicationClass":"Signaling", 
"applicationProtocol":"tcp/udp", 
"lowerPort":5060,"upperPort":5061}, 
{"applicationId":"4", 
"applicationName":"HTTPS", 
"applicationClass":"Transactional Data", 
"applicationProtocol":"tcp", 
"lowerPort":443, 
"upperPort":443 
} 
]} 
```

*DELETE /configured-application/1* 

```shell
HTTP/1.1 200 OK 
{"version":"0.0","response":"configured-app DELETE Successful"} 
```

*DELETE /configured-application* 

```shell
HTTP/1.1 200 OK 
{"version":"0.0","response":"configured-app DELETE All Successful"} 
```

*PUT/configured-application* 

```shell
[ 
{ 
"applicationId":"1", 
"applicationName":"CUPC", 
"applicationClass":"Multimedia Conferencing", 
"applicationProtocol":"tcp", 
"lowerPort":4,"upperPort":4 
}, 
{ 
"applicationId":"2", 
"applicationName":"SCCP", 
"applicationClass":"Signaling", 
"applicationProtocol":"tcp", 
"lowerPort":5,"upperPort":5 
} 
] 

```shell
Response HTTP/1.1 201 Created 
```shell
{"version":"0.0","response":"Configured Application PUT Request successful"} 
```

# policy 

| HTTP Method | URI | Description |
|-------------|----|----------| 
| POST | /policy | Creates a policy | 
| GET | /policy/{policy-id} | Returns a policy | 
| GET | /policy/count | Returns the number of policies | 
| GET | /policy/{start}/{end} | Returns all the policies stored in the given range, start & end are 32 bit numbers, start <= end | 
| GET | /policy/ | Returns all the policies | 
| PUT | /policy/ | Updates the policy attributes for policy-ids specified in the Request Object | 
| DELETE | /policy/{policy-id} | Deletes a policy by policy ID | 
| DELETE (To Be Implemented) | /policy/{policy-name} | Deletes policy by policy name | 
| DELETE | /policy | Deletes all the policies stored in the controller | 

*POST /policy* 

```shell
{ 
"policyName":"IPTestPolicy", 
"policyOwner":"admin", 
"policyPriority":4095, 
"resource":{ 
"userIdentifiers":["server"], 
"applications":["SMTP"] 
}, 
"networkUser":{ 
"userIdentifiers":["tom"], 
"applications":["0,0,tcp"] 
}, 
"actions":["PERMIT"], 
"scope":"Segment1", 
"actionProperty":{"priorityLevel":11} 
} 
```

*Response* 

```shell
HTTP/1.1 201 CREATED 
{"version":"0.0","response":"ae6dc8ba-9d50-4c51-b30c-8878bb695e09: Qos Policy Created Successfully on the Device: 26.6.6.2"} 
```

*GET /policy* 

```shell
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response":\[ 
{ 
"policyId":"90ce1337-2c45-46e8-bd90-42b3cbbca1c9", 
"policyName":"IPTestPolicy", 
"policyOwner":"admin", 
"policyPriority":4095, 
"networkUser": 
{ 
"userIdentifiers":["tom"], 
"applications":["0,0,TCP"] 
}, 
"resource": 
{ 
"userIdentifiers":["server"], 
"applications":["SMTP"] 
}, 
"actions":["PERMIT"], 
"actionProperty":{"priorityLevel":"11"}, 
"scope":"Segment1", 
"state":"Active" 
}, 
{ 
"policyOwner":"admin", 
"policyId":"0a5157ab-5ccc-4558-817e-0c0a6a8d7b76", 
"policyName":"IPTestPolicy2", 
"policyPriority":4095, 
"networkUser": 
{ 
"userIdentifiers":["tom"], 
"applications":["0,0,TCP"] 
}, 
"resource": 
{ 
"userIdentifiers":["server"], 
"applications":["HTTPS"] 
}, 
"actions":["DENY"], 
"actionProperty":{"priorityLevel":"21"}, 
"state":"Active" 
} 
\] 
} 
```

*GET /policy/0a5157ab-5ccc-4558-817e-0c0a6a8d7b76* 

```shell
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response": 
{ 
"policyOwner":"admin", 
"policyId":"0a5157ab-5ccc-4558-817e-0c0a6a8d7b76", 
"policyName":"IPTestPolicy2", 
"policyPriority":4095, 
"networkUser": 
{ 
"userIdentifiers":["tom"], 
"applications":["0,0,TCP"] 
}, 
"resource": 
{ 
"userIdentifiers":["server"], 
"applications":["HTTPS"] 
}, 
"actions":["DENY"], 
"actionProperty":{"priorityLevel":"21"}, 
"state":"Active" 
} 
} 
```

*GET /policy/count* 

```shell
HTTP/1.1 200 OK 
{"version":"0.0","response":2} 
```

*GET /policy/0/1* 

```shell
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response": 
\[ 
{ 
"policyId":"a14ff5e1-7167-4996-9c99-eaf92351e9d4", 
"policyName":"IPTestPolicy", 
"policyPriority":4095, 
"policyOwner":"admin", 
"networkUser": 
{ 
"userIdentifiers":["tom"], 
"applications":["0,0,TCP"] 
}, 
"resource": 
{ 
"userIdentifiers":["server"], 
"applications":["HTTPS"] 
}, 
"actionProperty":{"priorityLevel":"21"}, 
"actions":["DENY"], 
"state":"Active" 
}, 
{ 
"policyId":"8ca1cac0-ae6e-43d5-bb91-e7ec92bed680", 
"policyName":"IPTestPolicy", 
"policyPriority":4095, 
"policyOwner":"admin", 
"networkUser": 
{ 
"userIdentifiers":["tom"], 
"applications":["0,0,TCP"] 
}, 
"resource": 
{ 
"userIdentifiers":["server"], 
"applications":["SMTP"] 
}, 
"actionProperty":{"priorityLevel":"11"}, 
"actions":["PERMIT"], 
"scope":"Segment1", 
"state":"Active" 
} 
\]} 
```

*PUT /policy* 

```shell
[ 
{ 
"policyId":"b444ed30-46ad-42cd-bb9e-5a8b5f792841", 
"policyName":"IPTestPolicy", 
"policyOwner":"admin", 
"policyPriority":4095, 
"networkUser": 
{ 
"userIdentifiers":["tom"], 
"applications":["0,0,TCP"] 
}, 
"resource": 
{ 
"userIdentifiers":["server"], 
"applications":["SMTP"] 
}, 
"actionProperty": 
{ 
"priorityLevel":"21" 
}, 
"actions":["PERMIT"], 
"scope":"Segment2", 
"state":"Active" 
} 
] 
```

*Response*

```shell
HTTP/1.1 201 CREATED 
{"version":"0.0","response":"PUT Request Successfully Processed"} 
```

*DELETE /policy/* 
```shell
HTTP/1.1 200 OK 
{"version":"0.0","response":"Delete Successfully Processed"} 
```

*DELETE /policy/0a5157ab-5ccc-4558-817e-0c0a6a8d7b76* 
```shell
HTTP/1.1 200 OK 
{"version":"0.0","response":"Delete Successfully Processed"} 
```shell
# qos 
| HTTP Method | URI | Description |
|-------------|----|----------| 
| POST | /qos | Enables EasyQos for given scope & mappingName as a Qos Status object (scope (default = all), mappingName, status) | 
| DELETE | /qos/scope/{scope}/mapping-name/{mappingName} | Disables EasyQos for given scope (default = all) & mappingName | 
| POST | /qos/policy/scope/{scope} | Save the App-Class-Map into the DB & create the marking policy on the devices for the given scope (default = all) (DB + Network changes). Call this API only when you know this mapping is "enabled" otherwise call the '/qos/app-class-map/' POST Api | 
| DELETE | /qos/policy/scope/{scope}/mapping-name/{mappingName}/app-name/{appName} | Remove the App-Class-Map from the DB & delete the marking policy from the devices for the given scope (default = all) (DB + Network changes). Call this API only when you know this mapping is "enabled" otherwise call the '/qos/app-class-map/mapping-name/{mappingName}/app-name/{appName}' DELETE Api | 
| GET | /qos/status | GETS all Qos Status | 
| GET | /qos/status/scope/{scope} | GETS Qos Status for this particular {scope} | 
| GET | /qos/status/mapping-name/{mappingName} | GETS Qos Status for this particular {mappingName} | 
| GET | /qos/class | GETS all Qos Classes | 
| GET | /qos/app-class-map | GETs all Mapping info (Mapping, Applications & Classes) | 
| GET | /qos/app-class-map/mapping-name | GETs DISTINCT mapping names for App-Class-Maps | 
| GET | /qos/app-class-map/mapping-name/{mappingName} | GETs Mapping info (Mapping, Applications & Classes) for this particular {mappingName} | 
| POST | /qos/app-class-map | Creates a new Mapping info (Mapping, Applications & Classes) (1 or many objects in the same request) | 
| DELETE | /qos/app-class-map/mapping-name/{mappingName} | DELETEs all mapping info (Mapping, Applications & Classes) for this particular {mappingName} ('cvd' can never be deleted) | 
| DELETE | /qos/app-class-map/mapping-name/{mappingName}/app-name/{appName} | DELETEs the mapping info (Mapping, Applications & Classes) for this particular {mappingName} & {applicationName} ('cvd' can never be deleted) | 

*POST /qos* 

```shell
{"scope":"tag1","mappingName":"cvd","status":"enabled"} 
```

*POST /qos/policy/scope/*{*}{scope\}{_}* 

```shell
{"appName":"CUPC","mappingName":"Custom","className":"Realtime"} 
```

*POST /qos/app-class-map* 

```shell
[{"appName":"CUPC","mappingName":"Custom","className":"Realtime"},{"appName":"SIP","mappingName":"Custom","className":"Realtime"}] 
```

# qos-compliance 

| HTTP Method | URI | Description |
|-------------|----|----------| 
| POST | /reference-config | Upload the reference config the type. The type could be a name to identify the config uploaded. | 
| PUT | /reference-config | Uploads a new config file with the existing config name | 
| GET | /reference-config | Returns all the reference configs uploaded. | 
| DELETE | /reference-config/{config-name\} | Deletes the reference-config named&nbsp;{config-name\} | 
| POST | /qos/compliance/ | Do QoS compliance check on the given device IDs or the scope tag (given in the request object) with the reference config The scope tag could be in the location of the device, device-role of the device, or an actual tag | 
| GET | /qos/compliance/{job-id\}/{device-id\}/status | Returns the status of compliance check for the given ID as Failed / In progress / Completed | 
| GET | /qos/compliance/{job-id\}/{device-id\}/result | Returns the resultof compliance check for the given ID as Compliant / Non-Compliant | 
| GET | /qos/compliance/{job-id\}/{device-id\}/diff | Returns the compliance diff for the given ID | 
| POST | /qos/compliance/fix | Initiates QoS compliance fix&nbsp; for the given device IDs | 
| GET | /qos/compliance/fix/{job-id\}/{device-id\}/status | Returns the status of QoS compliance fix | 

```shell
POST /reference-config 
Request: 
{ 
"configName":"Switch", 
"referenceconfig": 
"Current configuration : 3724 bytes 
! 
! Last configuration change at 01:51:01 UTC Fri Nov 22 2013 by admin 
! 
version 15.3 
service timestamps debug datetime msec 
service timestamps log datetime msec 
no platform punt-keepalive disable-kernel-core 
! 
hostname ATT-ASR-1002F 
! 
! 
line con 0 
stopbits 1 
line aux 0 
stopbits 1 
line vty 0 4 
password admin 
login local 
transport input telnet 
line vty 5 15 
login local 
transport input telnet 
line vty 16 97 
login local 
! 
! 
end" 
} 
Response: 
HTTP/1.1 201 CREATED 
{ 
"version":"0.0", 
"response": "success" 
} 
```

```shell
GET /reference-config 
Response: 
[ 
{ 
"configName":"Switch", 
"referenceconfig": 
"Current configuration : 3724 bytes 
! 
! Last configuration change at 01:51:01 UTC Fri Nov 22 2013 by admin 
! 
version 15.3 
service timestamps debug datetime msec 
service timestamps log datetime msec 
no platform punt-keepalive disable-kernel-core 
! 
hostname sdn-switch 
! 
! 
line con 0 
stopbits 1 
line aux 0 
stopbits 1 
line vty 0 4 
password admin 
login local 
transport input telnet 
line vty 5 15 
login local 
transport input telnet 
line vty 16 97 
login local 
! 
! 
end" 
}, 
{ 
"configName":"Router", 
"referenceconfig": 
"Current configuration : 3724 bytes 
! 
! Last configuration change at 01:51:01 UTC Fri Nov 22 2013 by admin 
! 
version 15.3 
service timestamps debug datetime msec 
service timestamps log datetime msec 
no platform punt-keepalive disable-kernel-core 
! 
hostname ATT-ASR-1002F 
! 
! 
line con 0 
stopbits 1 
line aux 0 
stopbits 1 
line vty 0 4 
password admin 
login local 
transport input telnet 
line vty 5 15 
login local 
transport input telnet 
line vty 16 97 
login local 
! 
! 
end" 
} 
]
```

```shell
PUT /reference-config 
Request: 
{ 
"configName":"Switch", 
"referenceconfig": 
"Current configuration : 3724 bytes 
! 
! Last configuration change at 01:51:01 UTC Fri Nov 22 2013 by admin 
! 
version 15.3 
service timestamps debug datetime msec 
service timestamps log datetime msec 
no platform punt-keepalive disable-kernel-core 
! 
hostname ATT-ASR-1002F 
! 
! 
line con 0 
stopbits 1 
line aux 0 
stopbits 1 
line vty 0 4 
password admin 
login local 
transport input telnet 
line vty 5 15 
login local 
transport input telnet 
line vty 16 97 
login local 
! 
! 
end" 
} 
Response: 
HTTP/1.1 200 CREATED 
{ 
"version":"0.0", 
"response": "success" 
}
```

```shell
POST /qos/compliance 
Request: 
{ 
"deviceId":"64cfc466-24f4-4dae-b89d-6f4a93c24716", 
"configName":"Switch" 
} 
Response: 
HTTP/1.1 201 CREATED 
{ 
"version": "0.0", 
"response": 
{ 
"jobId": "0ca69006-4fb7-4529-9b30-19ba7730fe03", 
"successDeviceIds": 
[ 
"118df837-91d8-490e-a241-e99372795300", 
"118df837-91d8-490e-a241-e99372795310" 
] 
} 
} 
Request: 
{ 
"deviceId":"64cfc466-24f4-4dae-b89d-6f4a93c24716,e9dc9901-53a1-488e-97de-2c4125274cb2", 
"configName":"Switch" 
} 
Response: 
HTTP/1.1 201 CREATED 
{ 
"version": "0.0", 
"response": 
{ 
"jobId": "72ee0807-fecd-4d29-b521-398ae8059bba", 
"successDeviceIds": 
[ 
"118df837-91d8-490e-a241-e99372795300", 
"118df837-91d8-490e-a241-e99372795310" 
] 
} 
} 
Request: 
{ 
"scope":"Test", 
"configName":"Switch" 
} 
Response: 
HTTP/1.1 200 
{ 
"version": "0.0", 
"response": 
{ 
"jobId": "f3f52ab0-3ac4-4fba-9889-49857a44552c", 
"successDeviceIds": 
[ 
"118df837-91d8-490e-a241-e99372795300", 
"118df837-91d8-490e-a241-e99372795310" 
] 
} 
} 
Request: 
{ 
"scope":"TestScope", 
"configName":"Switch" 
} 
Response: 
{ 
"version": "0.0", 
"response": 
{ 
"jobId": "8fa64e90-234a-40d8-9ddd-ad33f513bedb", 
"successDeviceIds": 
[ 
"118df837-91d8-490e-a241-e99372795300", 
"118df837-91d8-490e-a241-e99372795310" 
], 
"failedDevices": 
[ 
{ 
"reason": "QoS compliance could not be started due to mismatch between interfaces of device and the reference config", 
"deviceId": "118df837-91d8-490e-a241-e99372795320" 
}, 
{ 
"reason": "QoS compliance could not be started as the given device ID not found", 
"deviceId": "118df837-91d8-490e-a241-e99372795330" 
} 
] 
} 
} 
```

```shell
Request: 
GET /qos/compliance/8fa64e90-234a-40d8-9ddd-ad33f513bedb/118df837-91d8-490e-a241-e99372795310/status 
Response: 
HTTP/1.1 200 
{ 
"version":"0.0" 
"response":"Completed" 
} 
Request: 
GET /qos/compliance/8fa64e90-234a-40d8-9ddd-ad33f513bedb/118df837-91d8-490e-a241-e99372795300/status 
Response: 
HTTP/1.1 200 
{ 
"version":"0.0" 
"response":"In Progress" 
} 
Request: 
GET /qos/compliance/8fa64e90-234a-40d8-9ddd-ad33f513bedb/118df837-91d8-490e-a241-e99372795301/status 
Response: 
HTTP/1.1 404 
{ 
"version": "0.0", 
"response": 
{ 
"message": "Device ID not found", 
"errorCode": 0, 
"href": null, 
"detail": "The given device ID not found" 
} 
} 
```

```shell
Request: 
GET /qos/compliance/8fa64e90-234a-40d8-9ddd-ad33f513bedb/118df837-91d8-490e-a241-e99372795310/result 
Response: 
HTTP/1.1 200 
{ 
"version":"0.0" 
"response":"Compliant" 
} 
Request: 
GET /qos/compliance/8fa64e90-234a-40d8-9ddd-ad33f513bedb/118df837-91d8-490e-a241-e99372795300/result 
Response: 
HTTP/1.1 200 
{ 
"version":"0.0" 
"response":"Non-Compliant" 
} 
Request: 
GET qos/compliance/8fa64e90-234a-40d8-9ddd-ad33f513bedb/118df837-91d8-490e-a241-e9937279530/result 
Response: 
HTTP/1.1 404 
{ 
"version": "0.0", 
"response": 
{ 
"message": "Device ID not found", 
"errorCode": 0, 
"href": null, 
"detail": "The given device ID not found" 
} 
} 
```

```shell
POST /qos/compliance/fix 
Request: 
{ 
"jobId":"8fa64e90-234a-40d8-9ddd-ad33f513bedb", 
"deviceId":"118df837-91d8-490e-a241-e99372795300" 
} 
Response: 
HTTP/1.1 201 
{ 
"version": "0.0", 
"response": 
{ 
"successDeviceIds": 
[ 
"118df837-91d8-490e-a241-e99372795300" 
] 
} 
} 
Request: 
{ 
"jobId":"8fa64e90-234a-40d8-9ddd-ad33f513bedb", 
"deviceId":"118df837-91d8-490e-a241-e99372795320,118df837-91d8-490e-a241-e99372795330" 
} 
Response: 
{ 
"version": "0.0", 
"response": 
{ 
"failedDevices": 
[ 
{ 
"reason": "Device ID not found", 
"deviceId": "118df837-91d8-490e-a241-e99372795330" 
} 
], 
"successDeviceIds": 
[ 
"118df837-91d8-490e-a241-e99372795320" 
] 
} 
} 
```

```shell
Request: 
GET /qos/compliance/fix/8fa64e90-234a-40d8-9ddd-ad33f513bedb/118df837-91d8-490e-a241-e99372795310/status 
Response: 
HTTP/1.1 200 
{ 
"version":"0.0", 
"response":"Completed" 
} 
Request: 
GET /qos/compliance/fix/8fa64e90-234a-40d8-9ddd-ad33f513bedb/118df837-91d8-490e-a241-e99372795300/status 
Response: 
HTTP/1.1 200 
{ 
"version":"0.0", 
"response":"In Progress" 
} 
Request: 
GET /qos/compliance/fix/8fa64e90-234a-40d8-9ddd-ad33f513bedb/118df837-91d8-490e-a241-e99372795322/status 
{ 
"version": "0.0", 
"response": 
{ 
"detail": "The given device ID not found", 
"href": null, 
"message": "Device ID not found", 
"errorCode": 0 
} 
} 
```

```shell
Request: 
GET /qos/compliance/118df837-91d8-490e-a241-e99372795313/118df837-91d8-490e-a241-e99372795310/diff 
{ 
"version": "0.0", 
"response": 
{ 
"message": "Device ID not found", 
"errorCode": 0, 
"href": null, 
"detail": "The given device ID not found" 
} 
} 
Request: 
GET qos/compliance/118df837-91d8-490e-a241-e99372795313/118df837-91d8-490e-a241-e99372795311/diff 
{ 
"version": "0.0", 
"response": 
[ 
{ 
"lineOne": "policy-map User-PolicyMap--6754960067595276376", 
"lineTwo": "policy-map User-PolicyMap--6754960067595276376", 
"polarity": "NEUTRAL" 
}, 
{ 
"lineOne": "class User-ClassMap--9110918806622209889", 
"lineTwo": "class User-ClassMap--9110918806622209889", 
"polarity": "NEUTRAL" 
}, 
{ 
"lineOne": "set dscp default", 
"lineTwo": "", 
"polarity": "POSITIVE" 
}, 
{ 
"lineOne": "set dscp cs3", 
"lineTwo": "set dscp cs3", 
"polarity": "NEUTRAL" 
}, 
{ 
"lineOne": "class User-ClassMap--8317114407100979446", 
"lineTwo": "class User-ClassMap--8317114407100979446", 
"polarity": "NEUTRAL" 
}, 
{ 
"lineOne": "set dscp af21", 
"lineTwo": "set dscp af21", 
"polarity": "NEUTRAL" 
}, 
{ 
"lineOne": "class User-ClassMap--7114186299001398166", 
"lineTwo": "class User-ClassMap--7114186299001398166", 
"polarity": "NEUTRAL" 
}, 
{ 
"lineOne": "set dscp ef", 
"lineTwo": "set dscp ef", 
"polarity": "NEUTRAL" 
}, 
{ 
"lineOne": "", 
"lineTwo": "class User-ClassMap--6063884787600512362", 
"polarity": "NEGATIVE" 
}, 
{ 
"lineOne": "class User-ClassMap--6063884787600512363", 
"lineTwo": "class User-ClassMap--7668021313983365", 
"polarity": "POSNEG" 
}, 
{ 
"lineOne": "set dscp af21", 
"lineTwo": "set dscp af21", 
"polarity": "NEUTRAL" 
} 
] 
} 
```

# tftp-server-configuration 

| HTTP Method | URI | Description |
|-------------|----|----------| 
| POST | /tftp-server-configuration/ | Creates a tftp-server-confiugration record, write the properties file and tftp server configuration file | 
| GET | /tftp-server-configuration/ | Returns a tftp-server-configuration record | 
| PUT | /tftp-server-configuration/ | Updates the tftp-server-configuration record, write the properties file and tftp server configuration file | 
| GET | /tftp-server-configuration/default-ip | Returns default tftp-server ip addresses | 

```shell
GET /tftp-server-configuration/ 
Response: 
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response":{ 
"tftpServerIp":"5.5.5.2", 
"tftpServerDescription":"tftp server configuration"} 
} 
```

```shell
POST /tftp-server-configuration/ 
Request: 
{ 
"tftpServerIp":"5.5.5.2"(Required), 
"tftpServerDescription":"tftp server configuration" 
} 
Response: 
HTTP/1.1 201 CREATED 
{ 
"version":"0.0", 
"response":"success" 
} 
```

```shell
PUT /tftp-server-configuration/ 
Request: 
{ 
"tftpServerIp":"5.5.5.2", 
"tftpServerDescription":"tftp server configuration" 
} 
Response: 
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response":"success" 
} 
```

```shell
GET /tftp-server-configuration/default-ip 
Response: 
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response":[{"ip":"172.20.239.106"},{"ip":"192.168.68.117"}] 
} 
```

# configuration-file 

| HTTP Method | URI | Description |
|-------------|----|----------| 
| POST | /configuration-file/ | Creates a configuration-file | 
| GET | /configuration-file/{configuration-file-id} | Returns a configuration-file | 
| GET | /configuration-file/count | Get the number of configuration files. | 
| GET | /configuration-file/{start}/{end} | Returns all the configuration-files in the given range, start & end are 32 bit numbers, start < end | 
| GET | /configuration-file/ | Returns all the configuration-files | 
| PUT | /configuration-file/ | Updates the configuration-file record with the attributes for configuration-file-id specified in the Request Object | 
| DELETE | /configuration-file/{configuration-file-id} | Deletes a configuration-file | 
| DELETE | /configuration-file/ | Deletes all configuration-files stored in the controller | 

```shell
GET /configuration-file 
Response: 
HTTP/1.1 200 OK 
{"version":"0.0", 
"response":{[{ 
"configID": "99ad73a3-87ec-4b70-aea2-0921fe281261", 
"configPreference": "ztd-config", 
"configName": "network-config" 
},{},...]}} 
```

```shell
GET /configuration-file/99ad73a3-87ec-4b70-aea2-0921fe281261 
Response: 
HTTP/1.1 200 OK 
{"version":"0.0", 
"response":{ 
"configID": "99ad73a3-87ec-4b70-aea2-0921fe281261", 
"configPreference": "ztd-config", 
"configName": "network-config"} 
} 
```

```shell
GET /configuration-file/count 
Response: 
HTTP/1.1 200 OK 
{   
"version":"0.0", 
"response":4 
} 
```

```shell
GET /configuration-file/{start}/{end} 
Response: 
HTTP/1.1 200 OK 
{"version":"0.0", 
"response":[{ 
"configID": "99ad73a3-87ec-4b70-aea2-0921fe281261", 
"configPreference": "ztd-config", 
"configName": "network-config" 
},{},...]} 
```

```shell
POST /configuration-file 
Request : 
"configPreference": "ztd-config" 
"configFile": configuration file (this is a multipart file) 
Response: 
HTTP/1.1 201 CREATED 
{ 
"version":"0.0", 
"response": "configuration-id" 
} 
```

```shell
PUT /configuration-file 
Request : 
{ 
"configID": "99ad73a3-87ec-4b70-aea2-0921fe281261", (required) 
"configPreference": "ztd-config" (required) 
} 
Response: 
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response": "success" 
} 
```

```shell
DELETE /configuration-file 
Response: 
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response": "success" 
} 
```

```shell
DELETE /configuration-file/99ad73a3-87ec-4b70-aea2-0921fe281261 
Response: 
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response": "success" 
} 
```

# image 

| HTTP Method | URI | Description |
|-------------|----|----------| 
| POST | /image/ | Creates an image | 
| GET | /image/{image-id} | Returns an image | 
| GET | /image/count | Returns the number of images in the controller | 
| GET | /image/{start}/{end} | Returns all the images stored in the given range, start & end are 32 bit numbers, start < end | 
| GET | /image/ | Returns all the images | 
| PUT | /image/ | Updates the image record with the attributes and image-ids specified in the Request Object | 
| DELETE | /image/{image-id} | Deletes an image | 
| DELETE | /image/ | Deletes all images stored in the controller | 

```shell
GET /image 
Response: 
HTTP/1.1 200 OK 
{"version":"0.0", 
"response":{[{ 
"imageID": "2580d0a8-366f-4d67-8de8-26ad70691c3a", 
"imagePreference": "ztd-image", 
"imageName": "image.bin" 
},{},...]}} 
```

```shell
GET /image/2580d0a8-366f-4d67-8de8-26ad70691c3a 
Response: 
HTTP/1.1 200 OK 
{"version":"0.0", 
"response":{ 
"imageID": "2580d0a8-366f-4d67-8de8-26ad70691c3a", 
"imagePreference": "ztd-image", 
"imageName": "image.bin"} 
} 
```

```shell
GET /image/count 
Response: 
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response":4 
} 
```

```shell
GET /image/{start}/{end} 
Response: 
HTTP/1.1 200 OK 
{"version":"0.0", 
"response":{[{ 
"imageID": "2580d0a8-366f-4d67-8de8-26ad70691c3a", 
"imagePreference": "ztd-image", 
"imageName": "image.bin" 
},{},...]}} 
```

```shell
POST /image 
Request: 
"imagePreference": "userDefinedImagePreference" 
"imageFile": image File (this is a multipart file) 
Response: 
HTTP/1.1 201 CREATED 
{ 
"version":"0.0", 
"response": "image-id" 
} 
```

```shell
PUT /image 
Request: 
{ 
"imageID": "2580d0a8-366f-4d67-8de8-26ad70691c3a", (required) 
"imagePreference": "userDefinedImagePreference" (required) 
} 
Response: 
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response": "success" 
} 
```

```shell
DELETE /image 
Response: 
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response": "success" 
} 
```

```shell
DELETE /image/2580d0a8-366f-4d67-8de8-26ad70691c3a 
Response: 
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response": "success" 
} 
```

# ztd-rule 

for ztd-rule, if the value in the reponse is null or empty string, then the corresponding attribute would be ignored to save bandwidth. 
| HTTP Method | URI | Description |
|-------------|----|----------| 
| POST | /ztd-rule/ | Creates a ztd rule | 
| GET | /ztd-rule/{ztd-rule-id} | Returns a ztd rule | 
| GET | /ztd-rule/count | Returns the number of ztd rules | 
| GET | /ztd-rule/{start}/{end} | Returns all the ztd rules stored in the given range, start & end are 32 bit numbers, start < end | 
| GET | /ztd-rule/ | Returns all the ztd rules | 
| PUT | /ztd-rule/ | Updates the rule with the attributes and ztd-rule-ids specified in the Request Object, if "ztd-ulre-id"="ALL", update all | 
| DELETE | /ztd-rule/{ztd-rule-id} | Deletes a ztd rule | 
| DELETE | /ztd-rule/ | Deletes all ztd rules stored in the controller | 

```shell
GET /ztd-rule 
Response: 
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response":{ 
[{ 
"tag": "sdn-switch" 
"imageID": "55d7d993-29b4-4c60-a9c6-5d96b5d266f6" 
"imagePreference": "ztd-image" 
"connectedToDeviceID": "2dc83ca1-3ba5-4030-8d59-fca1c865f2a6" 
"connectedToDeviceHostName": "sdn-3850" 
"connectedToPortID": "79c87c61-8880-40b0-8c12-ae3c55b73a83" 
"connectedToPortName": "geo-0-0-1" 
"ruleID": "7303cd69-9ee1-40de-9bd8-c7cb4a5182b0" 
"locationID": "6303cd69-9ee1-40de-9bd8-c7cb4a5182b0" 
"connetedToLocationCivicAddr": "San Jose" 
"connetedToLocationGeoAddr": "US" 
"platformID": "WS-C2960S-48TS-S" 
"configID": "40a486a8-5727-44b8-ba40-fa4572f8172c" 
"configPreference": "ztd-config" 
"serialNumber": "FOC1709Z006" 
},{}...]}} 
```

```shell
GET /ztd-rule/bf55d370-88d6-4bfe-85ca-48b8cb226171 
Response: 
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response":{ 
"tag": "sdn-switch" 
"imageID": "55d7d993-29b4-4c60-a9c6-5d96b5d266f6" 
"imagePreference": "ztd-image" 
"connectedToDeviceID": "2dc83ca1-3ba5-4030-8d59-fca1c865f2a6" 
"connectedToDeviceHostName": "sdn-3850" 
"connectedToPortID": "79c87c61-8880-40b0-8c12-ae3c55b73a83" 
"connectedToPortName": "geo-0-0-1" 
"ruleID": "7303cd69-9ee1-40de-9bd8-c7cb4a5182b0" 
"locationID": "6303cd69-9ee1-40de-9bd8-c7cb4a5182b0" 
"connetedToLocationCivicAddr": "San Jose" 
"connetedToLocationGeoAddr": "US" 
"platformID": "WS-C2960S-48TS-S" 
"configID": "40a486a8-5727-44b8-ba40-fa4572f8172c" 
"configPreference": "ztd-config" 
"serialNumber": "FOC1709Z006" 
} 
} 
```

```shell
GET /ztd-rule/count 
Response: 
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response":4 
} 
```

```shell
GET /ztd-rule/{start}/{end} 
Response: 
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response":{ 
[{ 
"tag": "sdn-switch" 
"imageID": "55d7d993-29b4-4c60-a9c6-5d96b5d266f6" 
"imagePreference": "ztd-image" 
"connectedToDeviceID": "2dc83ca1-3ba5-4030-8d59-fca1c865f2a6" 
"connectedToDeviceHostName": "sdn-3850" 
"connectedToPortID": "79c87c61-8880-40b0-8c12-ae3c55b73a83" 
"connectedToPortName": "geo-0-0-1" 
"ruleID": "7303cd69-9ee1-40de-9bd8-c7cb4a5182b0" 
"locationID": "6303cd69-9ee1-40de-9bd8-c7cb4a5182b0" 
"connetedToLocationCivicAddr": "San Jose" 
"connetedToLocationGeoAddr": "US" 
"platformID": "WS-C2960S-48TS-S" 
"configID": "40a486a8-5727-44b8-ba40-fa4572f8172c" 
"configPreference": "ztd-config" 
"serialNumber": "FOC1709Z006" 
},{}...]}} 
```

```shell
POST /ztd-rule 
Note: tag, locationID, connectedToDeviceID, connectedToPortID, platformID, serialNumber should be at least specified for one field; 
if connectedToPortID is specified, connectedToDeviceID must be specified. 
Request: 
{ 
"tag": "sdn-switch" 
"imageID": "55d7d993-29b4-4c60-a9c6-5d96b5d266f6" 
"connectedToDeviceID": "2dc83ca1-3ba5-4030-8d59-fca1c865f2a6" 
"connectedToPortID": "79c87c61-8880-40b0-8c12-ae3c55b73a83" 
"locationID": "6303cd69-9ee1-40de-9bd8-c7cb4a5182b0" 
"platformID": "WS-C2960S-48TS-S" 
"configID": "40a486a8-5727-44b8-ba40-fa4572f8172c" 
"serialNumber": "FOC1709Z006" 
} 
Response: 
HTTP/1.1 201 CREATED 
{ 
"version":"0.0", 
"response":"rule-id" 
} 
```

```shell
PUT /ztd-rule 
Request: 
{ 
"ruleID": "bf55d370-88d6-4bfe-85ca-48b8cb226171", (required, if All, then update all with the same input) 
"configID": "40a486a8-5727-44b8-ba40-fa4572f8172c", (required) 
"imageID": "55d7d993-29b4-4c60-a9c6-5d96b5d266f6" (required)} 
} 
Response: 
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response": "success" 
} 
```

```shell
DELETE /ztd-rule 
Response: 
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response": "success" 
} 
```

```shell
DELETE /ztd-rule/99ad73a3-87ec-4b70-aea2-0921fe281261 
Response: 
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response": "success" 
} 
```shell
# unclaimed-device 
for unclaimed-device, if the value in the reponse is null or empty string, then the corresponding attribute would be ignored to save bandwidth. 
| GET | /unclaimed-device/count | Returns the number of unclaimed devices in the controller | 
| GET | /unclaimed-device/{start}/{end} | Returns all the unclaimed devices stored in the given range, start & end are 32 bit numbers, start < end |
| GET | /unclaimed-device/ | Returns all the unclaimed devices | 
| POST | /unclaimed-device/device-add/ | Pushes the image and config to the device specified by device_id in the request object | 
| DELETE | /unclaimed-device/{unclaimed-device-id} | Deletes an unclaimed device | 
| DELETE | /unclaimed-device/ | Deletes all unclaimed devices stored in the controller | 
```shell
GET /unclaimed-device 
Response: 
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response":{[{ 
"deviceID": "bf55d370-88d6-4bfe-85ca-48b8cb226171" 
"hostName": "CISCO-ZTD-DEVICE-CISCO" 
"serialNumber": "device serial number" 
"platformID": "platform id" 
"connectedToHostName": "parent switch name" 
"connectedToPortName": "parent switch port name" 
"connectedToMacAddr": "parent switch mac addr" 
"connectedToIpAddr": "parent switch ip addr" 
},{}...]}} 
```

```shell
GET /unclaimed-device/count 
Response: 
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response":4 
} 
```

```shell
GET /unclaimed-device/{start}/{end} 
Response: 
HTTP/1.1 200 OK 
{"version":"0.0", 
"reponse":{[{ 
"deviceID": "bf55d370-88d6-4bfe-85ca-48b8cb226171" 
"hostName": "CISCO-ZTD-DEVICE-CISCO" 
"serialNumber": "device serial number" 
"platformID": "platform id" 
"connectedToHostName": "parent switch name" 
"connectedToPortName": "parent switch port name" 
"connectedToMacAddr": "parent switch mac addr" 
"connectedToIpAddr": "parent switch ip addr" 
},{}...]}} 
```

```shell
POST /unclaimed-device/device-add/ 
Request: 
{ 
"deviceID": "bf55d370-88d6-4bfe-85ca-48b8cb226171", (required) 
"configID": "1f55d370-88d6-4bfe-85ca-48b8cb226171", (required) 
"imageID": "2f55d370-88d6-4bfe-85ca-48b8cb226171",(required) 
"platformID": "platform id"(required) 
} 
Response: 
HTTP/1.1 200 OK{ 
"version":"0.0", 
"response": "success" 
} 
```

```shell
DELETE /unclaimed-device 
Response: 
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response": "success" 
} 
```

```shell
DELETE /unclaimed-device/99ad73a3-87ec-4b70-aea2-0921fe281261 
Response: 
HTTP/1.1 200 OK 
{ 
"version":"0.0", 
"response": "success" 
} 
```shell

# topology 

| HTTP Method | URI | Description |
|-------------|----|----------| 
| GET | topology/L2/{vlanId} | Get L2 topology data | 
| GET | topology/l3/ospf/ | Get L3 topology for OSPF protocol | 
| GET | topology/l3/isis/ | Get L3 topology for ISIS protocol | 
| GET | topology/physical/ | Get physical topology data | 
| GET | topology/routing-path/{src-host-ip}/{dest-host-ip} | Get topology routing path | 
| GET | topology/status/ | Get topology status | 
| POST | topology/status/ | indicate topology that status of network has changed | 

```shell
Request: 
GET topology/physical 
Response: 
HTTP/1.1 200 OK 
{ 
{ 
nodes: 
[ 
{ 
interfaces: null, 
device_type: "SWITCH", 
label: "ATT-BRANCH-II-CAT3850", 
id: "-4758341095005273760", 
x: 525, 
y: 183, 
ip: "26.6.6.2", 
software_version: "03.11.21.EMD", 
os_type: "IOS", 
networkType: null, 
datapathID: null, 
fixed: true, 
role: "Unknown", 
greyOut: false, 
nodeType: "device", 
deviceRoleOrigin: "auto", 
userId: null, 
aclApplied: true 
} 
], 
links: 
[ 
{ 
id: "-7821567219239415768", 
source: "-6286628062831808977", 
startPortID: "-8346331168462417980", 
tarGET: "-4877751339438217083", 
endPortID: "-6494742936005504283", 
linkStatus: "UP", 
greyOut: false 
} 
] 
}, 

} 
```

```shell
Request: 
GET topology/l2/{vlan_id} 
Response: 
HTTP/1.1 200 OK 
{ 
{ 
nodes: 
[ 
{ 
interfaces: null, 
device_type: "SWITCH", 
label: "ATT-BRANCH-II-CAT3850", 
id: "-4758341095005273760", 
x: 525, 
y: 183, 
ip: "26.6.6.2", 
software_version: "03.11.21.EMD", 
os_type: "IOS", 
networkType: null, 
datapathID: null, 
fixed: true, 
role: "Unknown", 
greyOut: false, 
nodeType: "device", 
deviceRoleOrigin: "auto", 
userId: null, 
aclApplied: true 
} 
], 
links: 
[ 
{ 
id: "-7821567219239415768", 
source: "-6286628062831808977", 
startPortID: "-8346331168462417980", 
tarGET: "-4877751339438217083", 
endPortID: "-6494742936005504283", 
linkStatus: "UP", 
greyOut: false 
} 
] 
}, 

} 
```

```shell
Request: 
GET topology/l3 
Response: 
HTTP/1.1 200 OK 
{ 
{ 
nodes: 
[ 
{ 
interfaces: null, 
device_type: "SWITCH", 
label: "ATT-BRANCH-II-CAT3850", 
id: "-4758341095005273760", 
x: 525, 
y: 183, 
ip: "26.6.6.2", 
software_version: "03.11.21.EMD", 
os_type: "IOS", 
networkType: null, 
datapathID: null, 
fixed: true, 
role: "Unknown", 
greyOut: false, 
nodeType: "device", 
deviceRoleOrigin: "auto", 
userId: null, 
aclApplied: true 
} 
], 
links: 
[ 
{ 
id: "-7821567219239415768", 
source: "-6286628062831808977", 
startPortID: "-8346331168462417980", 
tarGET: "-4877751339438217083", 
endPortID: "-6494742936005504283", 
linkStatus: "UP", 
greyOut: false 
} 
] 
}, 

} 
```

# acl

| HTTP Method | URI | Description |
|-------------|----|----------| 
| GET | acl/device/{network-device-id} | Get All ACL from device | 
| GET | acl/interface/{interface-id} | Get ACL from interface | 
| GET | acl/conflict/{acl-id} | Find Conflict ACEs for specified ACL ID | 
| POST | acl/interfaces/ | Create a cached ACL list by interface-ids posted and return the list | 
| POST | acl/devices/ | Create a cached ACL list by network-device-id posted and return the list | 
| POST | acl/trackacls/ | Craete a track between hosts to find is the specified application is passed and return the relevant ACEs | 

```shell
acl/device/5a5398db-5243-4bb8-a716-34e281e76fac  
HTTP/1.1 200 OK 
{ 
"response":[], 
"version":"0.0" 
} 
```

```shell
acl/interface/e8bf666b-5835-43e9-aa43-0e42ad1a2f4f 
HTTP/1.1 200 OK 
{ 
"response": 
[ 
{"acl": 
{"id":"25b307af-32e7-4020-8f8f-7761b067ffe0","name":"User-Acl--5468353513092604984","type":"extended","refcount":1,"source":"network","in":true}, 
"aceList": 
[ 
{"id":"a432aa43-d4f5-4664-a8a6-c1cd208e6139","action":"deny","protocol":"tcp","srcAddr":"any","srcAddrMask":null,"srcPort":1,"srcPortUpper":65535,"destAddr":"host 26.6.6.11","destAddrMask":null,"destPort":1,"destPortUpper":65535,"dscp":0}, 
{"id":"6a299f9a-92ca-4956-b59d-5f828eadfd1c","action":"permit","protocol":"ip","srcAddr":"any","srcAddrMask":null,"srcPort":1,"srcPortUpper":65535,"destAddr":"any","destAddrMask":null,"destPort":1,"destPortUpper":65535,"dscp":0}],"suggestionList":null}
], 
"version":"0.0" 
} 
```

```shell
acl/conflict/9620e08b-e59f-4809-9e62-06a0c596536e Response: 
HTTP/1.1 200 OK 
{ 
"response": 
[[ 
{"conflictType":"PERMITANYATLINE", 
"index":1,"ace":{"id":"6a299f9a-92ca-4956-b59d-5f828eadfd1c","action":"permit","protocol":"ip","srcAddr":"any","srcAddrMask":null,"srcPort":1,"srcPortUpper":65535,"destAddr":"any","destAddrMask":null,"destPort":1,"destPortUpper":65535,"dscp":0}}
]], 
"version":"0.0" 
} 
```

```shell
acl/trackacls Request: 
{ 
"usecase":"073e1d79-e257-43d5-8dfa-3b6684f6da96", 
"device_ids":["70ad0a46-e131-4a46-9344-27786c2511a1", 
"d9a1b951-6be2-496c-85e4-92108fbca0a8","e218d301-0336-4ba4-8ce9-f21ec577e28e"], 
"port_ids":["","e8bf666b-5835-43e9-aa43-0e42ad1a2f4f","879aab2d-45d7-48a4-8641-671a60c313e5",""], 
"source":"14.4.4.10", 
"dest":"14.4.4.11" 
} 
Response 
HTTP/1.1 200 OK 
{ 
"response": 
[ 
{"acls":[], 
"blockingPorts":"", 
"status":"pass"}, 
{"acls":[{"interfaceName":"FastEthernet5/0/2","interfaceID":"e8bf666b-5835-43e9-aa43-0e42ad1a2f4f", 
"aclmodules":[{"acl":{"id":"25b307af-32e7-4020-8f8f-7761b067ffe0","name":"User-Acl--5468353513092604984","type":"extended","refcount":1,"source":"network","in":true}, 
"aceList":[{"id":"6a299f9a-92ca-4956-b59d-5f828eadfd1c","action":"permit","protocol":"ip","srcAddr":"any","srcAddrMask":null,"srcPort":1,"srcPortUpper":65535,"destAddr":"any","destAddrMask":null,"destPort":1,"destPortUpper":65535,"dscp":0}],
"suggestionList":[]}]}],"blockingPorts":"","status":"pass"},{"acls":[],"blockingPorts":"","status":"pass"} 
], 
"version":"0.0" 
} 
```

# energywise-info 

| HTTP Method | URI | Description |
|-------------|----|----------| 
| GET | /energywise-info | Get all energywise objects | 
| GET | /energywise-info/network-device/{network-device-id\} | Get energywise objects by network device | 

```shell
Request: 
GET /energywise-info 
Response: 
200 OK 
{ 
"version": "0.0", 
"response": 
[ 
{ 
"name": "svsdgvs", 
"type": "endpoint", 
"level": 1, 
"usage": 10.12, 
"importance": 10, 
"role": "ip phone", 
"deviceId": "98786767678ce941", 
"energywiseInfoId": "3", 
"interfaceId": "c349090f6789cf32", 
"category": "consumer", 
"interfaceName": "GigabitEthernet1/0/1" 
}, 
{ 
"name": "svsdgvs", 
"type": "endpoint", 
"level": 1, "usage": 10.12, 
"importance": 10, 
"role": "ip phone", 
"deviceId": "98786767678ce941", 
"energywiseInfoId": "2", 
"interfaceId": "387659t44401cb8e76", 
"category": "consumer", 
"interfaceName": "GigabitEthernet1/0/2" 
}, 
{ 
"name": "svsdgvs", 
"type": "endpoint", 
"level": 1, 
"usage": 10.12, 
"importance": 10, 
"role": "ip phone", 
"deviceId": "1118765g09326711l", 
"energywiseInfoId": "1", 
"interfaceId": "387659t44401cb8e76", 
"category": "consumer", "interfaceName": 
"GigabitEthernet1/0/2" 
} 
] 
}
``` 

```shell
Request: 
GET /energywise-info/network-device-id/98786767678ce941 
Response: 
200 OK 
{ 
"version": "0.0", 
"response": 
[ 
{ 
"name": "svsdgvs", 
"type": "endpoint", 
"level": 1, 
"usage": 10.12, 
"importance": 10, 
"role": "ip phone", 
"deviceId": "98786767678ce941", 
"energywiseInfoId": "3", 
"interfaceId": "c349090f6789cf32", 
"category": "consumer", 
"interfaceName": "GigabitEthernet1/0/1" 
}, 
{ 
"name": "svsdgvs", 
"type": "endpoint", 
"level": 1, 
"usage": 10.12, 
"importance": 10, 
"role": "ip phone", 
"deviceId": "98786767678ce941", 
"energywiseInfoId": "2", 
"interfaceId": "387659t44401cb8e76", 
"category": "consumer", 
"interfaceName": "GigabitEthernet1/0/2" 
} 
] 
} 
```