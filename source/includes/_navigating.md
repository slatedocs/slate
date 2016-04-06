# Navigating the Data Model

Unlike some simple REST service, this API is designed to be implemented on many different models of servers and other IT infrastructure devices for years to come.  These devices may be quite different from one another.  For this reason, the API does not specify the URIs to various resources. Do not assume the BIOS version information is always at a particular URI.

This is more complex for the client, but is necessary to make sure the data model can change to accommodate various future server architectures without requiring specification changes. As an example, if the BIOS version is at `/redfish/v1/systems/1/`, and a client assumed it is always there, the client would then break when the interface is implemented on a different type of architecture with many compute nodes, each with its own BIOS version. 

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


