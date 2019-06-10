### Networks

A network is an isolated network where you can place groups of resources, such as [instances](#gcp-instances).

<!-------------------- LIST NETWORKS -------------------->

#### List networks

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/networks"

# Example:
```
```json
{
  "data": [
    {
      "autoCreateSubnetworks": true,
      "creationTimestamp": "2019-03-12T07:09:22.374-07:00",
      "description": "Default network for the project",
      "id": "6402509859159933821",
      "name": "default",
      "kind": "compute#network",
      "routingConfig": {
        "routingMode": "REGIONAL"
      },
      "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area-oox/global/networks/default",
      "subnetworks": [
        "https://www.googleapis.com/compute/v1/projects/test-area-oox/regions/us-east1/subnetworks/default",
        "https://www.googleapis.com/compute/v1/projects/test-area-oox/regions/us-central1/subnetworks/default",
        "https://www.googleapis.com/compute/v1/projects/test-area-oox/regions/us-west2/subnetworks/default",
        "https://www.googleapis.com/compute/v1/projects/test-area-oox/regions/us-west1/subnetworks/default",
        "https://www.googleapis.com/compute/v1/projects/test-area-oox/regions/northamerica-northeast1/subnetworks/default",
        "https://www.googleapis.com/compute/v1/projects/test-area-oox/regions/us-east4/subnetworks/default"
      ]
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networks</code>

Retrieve a list of all networks in an [environment](#administration-environments)

Attributes | &nbsp;
---------- | -----
`autoCreateSubnetworks`<br/>*boolean* | When set to true, the VPC network is created in "auto" mode. When set to false, the VPC network is created in "custom" mode.
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format
`description`<br/>*string* | An optional description of this resource
`id`<br/>*string* | The network's id
`name`<br/>*string* | The network's name
`kind`<br/>*string* | Type of the resource
`routingConfig`<br/>*object* | The network-level routing configuration for this network. Used by Cloud Router to determine what type of network-wide routing behavior to enforce. RoutingMode is either REGIONAL or GLOBAL.
`selfLink`<br/>*string* | Server-defined URL for this resource
`subnetworks`<br/>*Array[URL]* | Server-defined fully-qualified URLs for all subnetworks in this VPC network

<!-------------------- RETRIEVE A NETWORK -------------------->

#### Retrieve a network

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://api.your.cloudmc/v1/services/gcp/test-area/networks/6402509859159933821"

Response body:
```
```json
{
   "data": {
      "autoCreateSubnetworks": true,
      "creationTimestamp": "2019-03-12T07:09:22.374-07:00",
      "description": "Default network for the project",
      "id": "6402509859159933821",
      "name": "default",
      "kind": "compute#network",
      "routingConfig": {
        "routingMode": "REGIONAL"
      },
      "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area-oox/global/networks/default",
      "subnetworks": [
        "https://www.googleapis.com/compute/v1/projects/test-area-oox/regions/us-east1/subnetworks/default",
        "https://www.googleapis.com/compute/v1/projects/test-area-oox/regions/us-central1/subnetworks/default",
        "https://www.googleapis.com/compute/v1/projects/test-area-oox/regions/us-west2/subnetworks/default",
        "https://www.googleapis.com/compute/v1/projects/test-area-oox/regions/us-west1/subnetworks/default",
        "https://www.googleapis.com/compute/v1/projects/test-area-oox/regions/northamerica-northeast1/subnetworks/default",
        "https://www.googleapis.com/compute/v1/projects/test-area-oox/regions/us-east4/subnetworks/default"
      ]
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networks/:id</code>

Retrieve information about a network

Attributes | &nbsp;
---------- | -----
`autoCreateSubnetworks`<br/>*boolean* | When set to true, the VPC network is created in "auto" mode. When set to false, the VPC network is created in "custom" mode.
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format
`description`<br/>*string* | An optional description of this resource
`id`<br/>*string* | The network's id
`name`<br/>*string* | The network's name
`kind`<br/>*string* | Type of the resource
`routingConfig`<br/>*object* | The network-level routing configuration for this network. Used by Cloud Router to determine what type of network-wide routing behavior to enforce. RoutingMode is either REGIONAL or GLOBAL.
`selfLink`<br/>*string* | Server-defined URL for this resource
`subnetworks`<br/>*Array[URL]* | Server-defined fully-qualified URLs for all subnetworks in this VPC network