### Subnets
Create and manage your subnets. Subnets belongs to a network.

<!-------------------- LIST SUBNETS -------------------->

#### List subnets

```shell
curl -X GET \
  -H "mc-api-key: your_api_key" \
  "https://cloudmc_endpoint/api/v1/services/gcp/test-area/subnetworks"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "creationTimestamp": "2020-05-28T07:20:17.315-07:00",
      "fingerprint": "resource_fingerprint",
      "gatewayAddress": "10.128.0.1",
      "ipCidrRange": "10.128.0.0/20",
      "kind": "compute#subnetwork",
      "network": "https://www.googleapis.com/compute/v1/projects/test-area-oox/global/networks/default",
      "privateIpGoogleAccess": false,
      "region": "https://www.googleapis.com/compute/v1/projects/test-area-oox/regions/us-central1",
      "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area-oox/regions/us-central1/subnetworks/default",
      "shortNetwork": "default",
      "id": "resource_id",
      "name": "default",
      "shortRegion": "us-central1"
    }],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/subnetworks</code>

Retrieve a list of all subnets in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`fingerprint`<br/>*string* | A base64-encoded string. A hash of the label's contents and used for optimistic locking.
`gatewayAddress`<br/>*string* | Second address in the primary IP range for the subnet.
`ipCidrRange`<br/>*string* | Primary IP address range for the following resources: VM instances, internal load balancers, and internal protocol forwarding.
`kind`<br/>*string* | Type of the resource.
`network`<br/>*string* | Server-defined URL for the VPC network that contains the subnet.
`privateIpGoogleAccess`<br/>*string* | Whether the Private Google Access is configured.
`region`<br/>*Array[Disk]* | Server-defined URL for the region name.
`selfLink`<br/>*string* | Server-defined URL for this resource.
`shortNetwork`<br/>*string* | Display name of the VPC network that contains the subnet.
`id`<br/>*UUID* | The id of the subnet.
`name`<br/>*string* | The display name of the subnet.
`shortRegion`<br/>*string* | A short version of the region name.

#### Filters

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/subnetworks?network=<a href="#VPC-network-selflink">:VPC-network-selflink</a></code>

Retrieve a list of all networks in a given [environment](#administration-environments) and [VPC-network].

<!-------------------- RETRIEVE A SUBNET -------------------->

#### Retrieve a subnet

```shell
curl -X GET \
  -H "mc-api-key: your_api_key" \
  "https://cloudmc_endpoint/api/v1/services/gcp/test-area/subnetworks/8841143494674098002"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "creationTimestamp": "2020-06-12T08:05:33.741-07:00",
    "fingerprint": "resource_fingerprint",
    "gatewayAddress": "10.128.0.1",
    "ipCidrRange": "10.128.0.0/20",
    "kind": "compute#subnetwork",
    "network": "https://www.googleapis.com/compute/v1/projects/test-area-oox/global/networks/default",
    "privateIpGoogleAccess": false,
    "region": "https://www.googleapis.com/compute/v1/projects/test-area-oox/regions/us-central1",
    "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area-oox/regions/us-central1/subnetworks/default",
    "shortNetwork": "default",
    "id": "resource_id",
    "name": "default",
    "shortRegion": "us-central1"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/subnetworks/:id</code>

Retrieve information about a subnet.

Attributes | &nbsp;
---------- | -----
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`fingerprint`<br/>*string* | A base64-encoded string. A hash of the label's contents and used for optimistic locking.
`gatewayAddress`<br/>*string* | Second address in the primary IP range for the subnet.
`ipCidrRange`<br/>*string* | Primary IP address range for the following resources: VM instances, internal load balancers, and internal protocol forwarding.
`kind`<br/>*string* | Type of the resource.
`network`<br/>*string* | Server-defined URL for the VPC network that contains the subnet.
`privateIpGoogleAccess`<br/>*string* | Whether the Private Google Access is configured.
`region`<br/>*Array[Disk]* | Server-defined URL for the region name.
`selfLink`<br/>*string* | Server-defined URL for this resource.
`shortNetwork`<br/>*string* | Display name of the VPC network that contains the subnet.
`id`<br/>*UUID* | The id of the subnet.
`name`<br/>*string* | The display name of the subnet.
`shortRegion`<br/>*string* | A short version of the region name.

<!-------------------- CREATE A SUBNET -------------------->

#### Create a subnet

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/subnetworks"
```
> Request body example:

```json
{
  "name": "my-subnet",
  "shortRegion": "northamerica-northeast1",
  "ipCidrRange": "10.0.0.0/9",
  "network": "https://www.googleapis.com/compute/v1/projects/my-project/global/networks/my-network"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/subnetworks</code>

Create a new subnet

Required | &nbsp;
------- | -----------
`name`<br/>*string* | The display name of the subnet.
`shortRegion`<br/>*string* | A short version of the region name.
`network`<br/>*string* | The selflink of the network.
`ipCidrRange`<br/>*string* | The CIDR IP range of the subnet.

Optional | &nbsp;
------- | -----------
`description`<br/>*string* | Description of the subnet.

<!-------------------- DELETE A SUBNET -------------------->

#### Delete a subnet

```shell
curl -X DELETE \
  -H "mc-api-key: your_api_key" \
  "https://cloudmc_endpoint/api/v1/services/gcp/test-area/subnetworks/8841143494674098002"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/subnetworks/:id</code>

Delete an existing subnet