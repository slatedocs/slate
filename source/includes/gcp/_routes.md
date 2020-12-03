### Routes

A route is a path that network traffic takes from an [instance](#gcp-instances) to other destinations. The destination can be inside a GCP network or outside.

<!-------------------- LIST ROUTES -------------------->

#### List routes

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/routes"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    { "id": "6918030089270271318",
      "creationTimestamp": "2020-05-21T08:52:26.010-07:00",
      "name": "default-route-0f2f9d9f9910829a",
      "description": "Default local route to the subnetwork 10.172.0.0/20.",
      "network": "https://www.googleapis.com/compute/v1/projects/test-area/global/networks/default",
      "destRange": "10.172.0.0/20",
      "priority": 0,
      "nextHopNetwork": "https://www.googleapis.com/compute/v1/projects/test-area/global/networks/default",
      "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area/global/routes/default-route-0f2f9d9f9910829a",
      "kind": "compute#route",
      "networkName": "default"
    }],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/routes</code>

Retrieve a list of all routes in an [environment](#administration-environments).

Attributes | &nbsp;
---------- | -----
`id`<br/>*string* | The route's id.
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`name`<br/>*string* | The route's name.
`description`<br/>*string* | An optional description of this resource.
`network`<br/>*string* | URL of the network to which this route is attached.
`destRange`<br/>*string* | The route's address destination.
`priority`<br/>*integer* | Priority for this route. Number should be a positive integer. Priority is used to break ties when there is more than one matching route of maximum length.
`nextHopNetwork`<br/>*string* | The next hop handles the matching packets for this route. It can be an instance, an IP address or the default internet gateway.
`selfLink`<br/>*string* | Server-defined URL for the resource.
`kind`<br/>*string* | Type of the resource.
`networkName`<br/>*string* | Name of the network to which this route is attached.


<!-------------------- RETRIEVE A ROUTE -------------------->

#### Retrieve a route

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v1/services/gcp/test-area/routes/6918030089270271318"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "6918030089270271318",
    "creationTimestamp": "2020-05-21T08:52:26.010-07:00",
    "name": "default-route-0f2f9d9f9910829a",
    "description": "Default local route to the subnetwork 10.172.0.0/20.",
    "network": "https://www.googleapis.com/compute/v1/projects/test-area/global/networks/default",
    "destRange": "10.172.0.0/20",
    "priority": 0,
    "nextHopNetwork": "https://www.googleapis.com/compute/v1/projects/test-area/global/networks/default",
    "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area/global/routes/default-route-0f2f9d9f9910829a",
    "kind": "compute#route",
    "networkName": "default"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/routes/:id</code>

Retrieve a route in a given [environment](#administration-environments).

Attributes | &nbsp;
---------- | -----
`id`<br/>*string* | The route's id.
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`name`<br/>*string* | The route's name.
`description`<br/>*string* | An optional description of this resource.
`network`<br/>*string* | URL of the network to which this route is attached.
`destRange`<br/>*string* | The route's address destination.
`priority`<br/>*integer* | Priority for this route. Number should be a positive integer. Priority is used to break ties when there is more than one matching route of maximum length.
`nextHopNetwork`<br/>*string* | The next hop handles the matching packets for this route. It can be an instance, an IP address or the default internet gateway.
`selfLink`<br/>*string* | Server-defined URL for the resource.
`kind`<br/>*string* | Type of the resource.
`networkName`<br/>*string* | Name of the network to which this route is attached.