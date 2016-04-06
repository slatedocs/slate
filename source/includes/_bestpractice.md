# Client Best Practices

When developing a client for the RESTful API, be sure to not code based upon assumptions that are not guaranteed. The reason avoiding these assumptions is so important is that implementations may vary across systems and firmware versions, and we want your code to work consistently.

## API Architecture ##
The RESTful API is a hypermedia API by design. This is to avoid building in restrictive assumptions to the data model that will make it difficult to adapt to future hardware implementations. A hypermedia API avoids these assumptions by making the data model discoverable via links between resources.

The client should not interact with a URI as if it will remain static. Only specific top-level URIs (any URI in this sample code) can be assumed as static.

All URIs, with the exception of known top-level URIs, must be discovered dynamically by following the href links in the data model. Clients should not make assumptions about the URIs for the resource members of a collection. For instance, the URI of a collection member will NOT always be `/rest/v1/.../collection/1`, or 2. On Moonshot a System collection member might be `/rest/v1/systems/c1n1`.

## Traversing the data model

Although the resources in the data model are linked together, because of cross link references between resources, a client may not assume the resource model is a tree. It is a graph instead, so any crawl of the data model should keep track of visited resources to avoid an infinite traversal loop.

A reference to another resource is any property called href (@odata.id in Redfish) no matter whereit occurs in a resource.

An external reference to a resource outside the data model is referred to by a property called "extref". Any resource referred to by extref should not be assumed to follow the conventions of the API.

## HTTP POST to Create

When POSTing to create a resource (e.g. create an account or session), a successful response includes a Location HTTP header indicating the resource URI of the newly created resource. The POST may also include a representation of the newly created object in a JSON response body but may not. Do not assume the response body, but test it. It may also be an ExtendedError object.

## HTTP Redirect

All clients must correctly handle HTTP redirect (e.g. 308, 301, and so on.) iLO 4 will use redirection as a way to alias portions of the data model and to migrate the data model to the Redfish specified URIs (for example, /redfish/…).

