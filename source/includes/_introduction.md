# Introduction

The RESTful API for HPE iLO 4 is a programming interface enabling state-of-the-art server management. This document contains helpful information about how to interact with the RESTful API. The RESTful API uses the basic HTTP operations (GET, PUT, POST, DELETE, and PATCH) to submit or return a JSON formatted resource to or from a URI on iLO 4.

With modern scripting languages, you can easily write simple REST clients for RESTful APIs. Most languages, like Python, can transform JSON into internal-data structures, like dictionaries, allowing for easy access to data. This enables you to write custom code directly to the RESTful API, instead of using intermediate tools such as HPE’s HPQLOCFG or CONREP.

This document has been updated with examples from iLO 4 version 2.30 firmware.
 
## Redfish 1.0 Conformance

The RESTful API was first released with iLO 4 2.00 on HPE Gen9 servers. The RESTful API also functioned as the starting point for the new Redfish 1.0 DMTF standard at [http:// www.dmtf.org/standards/redfish](http://www.dmtf.org/standards/redfish)

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
1. Returning only Redfish conformant properties (with Hewlett Packard Enterprise extensions) if the Redfish-required OData header is included in the request (`OData-Version: 4.0`).

Full details on how Redfish 1.0 was implemented in iLO 4 2.30 and how it impacts clients written for previous versions is found here:  [http://www8.hp.com/h20195/V2/GetDocument.aspx?docname=4AA6-1727ENW&cc=us&lc=en](http://www8.hp.com/h20195/V2/GetDocument.aspx?docname=4AA6-1727ENW&cc=us&lc=en "Redfish Implementation on HP RESTful API for HPE iLO 4 - Technical White Paper")

## REST APIs Architected using HATEOS

Representational State Transfer (REST) is a web service that uses basic CRUD (Create, Read, Update, Delete, and Patch) operations performed on resources using HTTP commands such as POST, GET, PUT, PATCH, and DELETE. The RESTful API is designed using a REST architecture called HATEOS (Hypermedia as the Engine of Application State). This architecture allows the client to interact with iLO through a simple fixed URL (rest/v1) and several other top-level URIs documented in the iLO Data Model. The rest of the data model is discoverable by following clearly identified “links” in the data. This has the advantage that the client does not need to know a set of fixed URLs. When you create a script to automate tasks using the RESTful API, you only need to hardcode this simple URL and design the script to discover the REST API URLs that are needed to complete a task. To learn more about REST and HATEOAS concepts, see:

* [http://en.wikipedia.org/wiki/Representational_state_transfer](http://en.wikipedia.org/wiki/Representational_state_transfer)
* [http://en.wikipedia.org/wiki/HATEOAS](http://en.wikipedia.org/wiki/HATEOAS)

## Key benefits of the RESTful API for HPE iLO

The RESTful API is becoming the main management interface for iLO 4 Hewlett Packard Enterprise servers. Its feature set will become larger than the existing iLO XML API (RIBCL) and IPMI interfaces. Using the RESTful API, you can take full inventory of the server, control power and reset, configure BIOS and iLO settings, fetch event logs, as well as many other functions.

The RESTful API follows the trend of the Internet in moving to a common pattern for new software interfaces. Many web services in a variety of industries use REST APIs because they are easy to implement, easy to consume, and offer scalability advantages over previous technologies.

HPE OneView, OpenStack, and many other server management APIs are now REST APIs. Most Hewlett Packard Enterprise Management software offerings, as well as the entire Software Defined Infrastructure, are built upon REST APIs.

The RESTful API has the additional advantage of consistency across all present and projected server architectures. The same data model works for traditional rack-mount servers, blades, as well as newer types of systems like Moonshot. This advantage comes because the data model is designed to self-describe the service’s capabilities to the client and has room for flexibility designed in from the start

