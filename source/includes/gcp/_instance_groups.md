### Instance groups
An instance group is a collection of VM instances that you can manage as a single entity

<!-------------------- LIST INSTANCE GROUPS -------------------->

#### List instance groups

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/instancegroups"

# The above command returns JSON structured like this:
```
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

Retrieve a list of all instance groups in a given [environment](#administration-environments)


Attributes | &nbsp;
------- | -----------
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format
`description`<br/>*string* | An optional description of this resource
`fingerprint`<br/>*string* | A short sequence of bytes used to identify the named ports
`kind`<br/>*string* | Type of the resource
`namedPorts`<br/>*object* | Assigns a name to a port number. This allows the system to reference ports by the assigned name instead of a port number. Named ports apply to all instances in this instance group.
`network`<br/>*string* | The network to which the instance group is connected to
`selfLink`<br/>*string* | Server-defined URL for this resource
`size`<br/>*integer* | The number of instances in the group
`subnetwork`<br/>*string* | The sub-network within the network the instance group is connected to
`zone`<br/>*string* | URL of the zone where the instance group resides
`id`<br/>*UUID* | The id of the instance group
`name`<br/>*string* | The display name of the instance group
`shortZone`<br/>*string* | A short version of the zone name
`shortRegion`<br/>*string* | A short version of the region name


<!-------------------- RETRIEVE AN INSTANCE -------------------->

#### Retrieve an instance

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/instancegroups/2986056884972096897"

# The above command returns JSON structured like this:
```
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

Retrieve an instance group in a given [environment](#administration-environments)

Attributes | &nbsp;
------- | -----------
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format
`description`<br/>*string* | An optional description of this resource
`fingerprint`<br/>*string* | A short sequence of bytes used to identify the named ports
`kind`<br/>*string* | Type of the resource
`namedPorts`<br/>*object* | Assigns a name to a port number. This allows the system to reference ports by the assigned name instead of a port number. Named ports apply to all instances in this instance group.
`network`<br/>*string* | The network to which the instance group is connected to
`selfLink`<br/>*string* | Server-defined URL for this resource
`size`<br/>*integer* | The number of instances in the group
`subnetwork`<br/>*string* | The sub-network within the network the instance group is connected to
`zone`<br/>*string* | URL of the zone where the instance group resides
`id`<br/>*UUID* | The id of the instance group
`name`<br/>*string* | The display name of the instance group
`shortZone`<br/>*string* | A short version of the zone name
`shortRegion`<br/>*string* | A short version of the region name

<!-------------------- CREATE AN INSTANCE GROUP -------------------->

#### Create an instance group

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/instancegroups"

# Request example:
```
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

Create a new instance group

Required | &nbsp;
------- | -----------
`name`<br/>*string* | The display name of the instance group
`shortZone`<br/>*string* | A short version of the zone name
`shortRegion`<br/>*string* | A short version of the region name

Optional | &nbsp;
------- | -----------
`shortNetwork`<br/>*string* | The network to which the instance group is connected to
`shortSubnetwork`<br/>*string* | The sub-network within the network the instance group is connected to
`shortInstances`<br/>*array[string]* | Array of instance names to add to the instance group upon creation

<!-------------------- DELETE AN INSTANCE GROUP -------------------->

#### Delete an instance group

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/instancegroups/2986056884972096897"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instancegroups/:id</code>

Delete an existing instance group

<!-------------------- ADD INSTANCES TO INSTANCE GROUP -------------------->

#### Add instances to instance group

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/instancegroups/2986056884972096897?operation=add_instances"

# Request example:
```
```json
{
    "shortInstances": ["instance-2"]
}
```
Required | &nbsp;
------ | -----------
`shortInstances`<br/>*array[string]* | Array of instance names to add to the instance group

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instancegroups/:id?operation=add_instances</code>

Add instances to an existing instance group

<!-------------------- REMOVE INSTANCES TO INSTANCE GROUP -------------------->

#### Remove instances to instance group

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/instancegroups/2986056884972096897?operation=remove_instances"

# Request example:
```
```json
{
    "shortInstances": ["instance-2"]
}
```

Required | &nbsp;
------ | -----------
`shortInstances`<br/>*array[string]* | Array of instance names to remove from the instance group

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instancegroups/:id?operation=remove_instances</code>

Remove instances from an existing instance group
