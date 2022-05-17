### Instance groups

An instance group is a collection of [VM instances](#gcp-instances) that you can manage as a single entity. Instance groups are used to apply [load balancing](#gcp-load-balancer) to groups of heterogeneous instances. In a load balancer setup, an instance group can be used as part of a [backend service](#gcp-backend-service).

<!-------------------- LIST INSTANCE GROUPS -------------------->

#### List instance groups

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/instancegroups"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "creationTimestamp": "2019-09-06T12:28:47.389-07:00",
      "description": "",
      "fingerprint": "42WmSpB8rSM=",
      "kind": "compute#instanceGroup",
      "namedPorts": [
        {
          "name": "http",
          "port": 80
        }
      ],
      "network": "https://www.googleapis.com/compute/v1/projects/test-area/global/networks/default",
      "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area/zones/us-central1-a/instanceGroups/ig-test-vmd",
      "size": 0,
      "subnetwork": "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/subnetworks/default",
      "zone": "https://www.googleapis.com/compute/v1/projects/test-area/zones/us-central1-a",
      "id": "2986056884972096897",
      "name": "ig-test-vmd",
      "shortZone": "us-central1-a",
      "shortRegion": "us-central1"
    }
  ],
    "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instancegroups</code>

Retrieve a list of all instance groups in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`description`<br/>*string* | An optional description of this resource.
`fingerprint`<br/>*string* | A short sequence of bytes used to identify the named ports.
`id`<br/>*UUID* | The id of the instance group.
`kind`<br/>*string* | Type of the resource.
`name`<br/>*string* | The display name of the instance group.
`namedPorts`<br/>*object* | Assigns a name to a port number. This allows the system to reference ports by the assigned name instead of a port number. Named ports apply to all instances in this instance group.
`network`<br/>*string* | The network to which the instance group is connected to.
`selfLink`<br/>*string* | Server-defined URL for this resource.
`shortRegion`<br/>*string* | A short version of the region name.
`shortZone`<br/>*string* | A short version of the zone name.
`size`<br/>*integer* | The number of instances in the group.
`subnetwork`<br/>*string* | The sub-network within the network the instance group is connected to.
`zone`<br/>*string* | URL of the zone where the instance group resides.

<!-------------------- RETRIEVE AN INSTANCE GROUP -------------------->

#### Retrieve an instance group

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/instancegroups/2986056884972096897"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "creationTimestamp": "2019-09-06T12:28:47.389-07:00",
    "description": "",
    "fingerprint": "42WmSpB8rSM=",
    "kind": "compute#instanceGroup",
    "namedPorts": [
      {
        "name": "http",
        "port": 80
      }
    ],
    "network": "https://www.googleapis.com/compute/v1/projects/test-area/global/networks/default",
    "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area/zones/us-central1-a/instanceGroups/ig-test-vmd",
    "size": 0,
    "subnetwork": "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/subnetworks/default",
    "zone": "https://www.googleapis.com/compute/v1/projects/test-area/zones/us-central1-a",
    "id": "2986056884972096897",
    "name": "ig-test-vmd",
    "shortZone": "us-central1-a",
    "shortRegion": "us-central1"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instancegroups/:id</code>

Retrieve an instance group in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`description`<br/>*string* | An optional description of this resource.
`fingerprint`<br/>*string* | A short sequence of bytes used to identify the named ports.
`id`<br/>*UUID* | The id of the instance group.
`kind`<br/>*string* | Type of the resource.
`name`<br/>*string* | The display name of the instance group.
`namedPorts`<br/>*object* | Assigns a name to a port number. This allows the system to reference ports by the assigned name instead of a port number. Named ports apply to all instances in this instance group.
`network`<br/>*string* | The network to which the instance group is connected to.
`selfLink`<br/>*string* | Server-defined URL for this resource.
`shortRegion`<br/>*string* | A short version of the region name.
`shortZone`<br/>*string* | A short version of the zone name.
`size`<br/>*integer* | The number of instances in the group.
`subnetwork`<br/>*string* | The sub-network within the network the instance group is connected to.
`zone`<br/>*string* | URL of the zone where the instance group resides.

<!-------------------- CREATE AN INSTANCE GROUP -------------------->

#### Create an instance group

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/instancegroups"
```
> Request body example:

```json
{
  "name": "my-group",
  "shortRegion": "northamerica-northeast1",
  "shortZone": "northamerica-northeast1-b",
  "shortNetwork": "default",
  "shortSubnetwork": "default",
  "shortInstances": ["instance-1"]
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instancegroups</code>

Create a new instance group.

Required | &nbsp;
------- | -----------
`name`<br/>*string* | The display name of the instance group.
`shortZone`<br/>*string* | A short version of the zone name.

Optional | &nbsp;
------- | -----------
`shortInstances`<br/>*array[string]* | Array of instance names to add to the instance group upon creation. All these instances should belong to the zone provided and should be in the same subnet.
`shortNetwork`<br/>*string* | The network to which the instance group is connected to.
`shortRegion`<br/>*string* | A short version of the region name.
`shortSubnetwork`<br/>*string* | The sub-network within the network the instance group is connected to. This will only be applied to the instance group if instances are being bound at creation time, if not, only the network will be applied to the instance group.

<!-------------------- DELETE AN INSTANCE GROUP -------------------->

#### Delete an instance group

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/instancegroups/2986056884972096897"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instancegroups/:id</code>

Delete an existing instance group.

<!-------------------- MANAGE INSTANCE MEMBERS -------------------->

#### Manage instance members

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/instancegroups/2986056884972096897?operation=manage_instance_members"
```
> Request body example:

```json
{
    "shortInstances": ["instance-2"]
}
```


<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instancegroups/:id?operation=manage_instance_members</code>

Manage instance members in an existing instance group.

<aside class="notice">
An instance can only belong to one load balanced instance group. But you can add an instance to multiple non-load balanced instance groups.
</aside>

Required | &nbsp;
------ | -----------
`shortInstances`<br/>*array[string]* | Array of instance names representing the current members of the instance group. If a current instance member is not kept in the list, it will be removed from the group. If the array is empty, all the instance members will be removed.
