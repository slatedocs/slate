### Clusters
List your Kubernetes clusters.

<!-------------------- LIST CLUSTERS -------------------->

#### List clusters

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/clusters"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "status": "RUNNING",
      "nodeCount": 3,
      "endpoint": "104.197.118.234",
      "location": "us-central1-a",
      "creationTimestamp": "2019-07-08T18:45:16+00:00",
      "caCert": "LS0tLS1CRUdJTiBD...",
      "addressRange": "10.4.0.0/14",
      "networkName": "default",
      "subnetName": "default",
      "currentMasterVersion": "1.15.12-gke.20",
      "cpuCount": 12,
      "memoryInGB": 24.00,
      "labels": {
        "key1": "value1"
      },
      "nodePoolMachineTypes": {
            "e2-medium": 1,
      },
      "id": "projects/cmc-k8s-enabled-llb/locations/us-central1-a/clusters/standard-cluster-1",
      "name": "standard-cluster-1"
    },
    {
      "status": "RUNNING",
      "nodeCount": 1,
      "endpoint": "34.66.215.161",
      "location": "us-central1-a",
      "creationTimestamp": "2019-07-08T14:59:19+00:00",
      "caCert": "LS0tLS1CRUdJS0K...",
      "addressRange": "10.44.0.0/14",
      "networkName": "default",
      "subnetName": "default",
      "currentMasterVersion": "1.15.12-gke.20",
      "cpuCount": 6,
      "memoryInGB": 12.00,
      "labels": {},
      "nodePoolMachineTypes": {
        "e2-custom-2-1024": 3
        },
      "id": "projects/cmc-k8s-enabled-llb/locations/us-central1-a/clusters/your-first-cluster-1",
      "name": "your-first-cluster-1",
    }
  ],
  "metadata": {
    "recordCount": 2
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/clusters</code>

Attributes | &nbsp;
------- | -----------
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`nodeCount`<br/>*integer* | Number of nodes in the cluster.
`endpoint`<br/>*string* | The IP address of the cluster's master node. All interactions with the Kubernetes API are done through the master node.
`location` <br/> *string* | The zone or region in which the cluster is running. For regional clusters, your cluster nodes may span multiple zones within the region.
`status` <br/> *string* | The status of the cluster.
`caCert` <br/> *string* | The *base64 encoded* certificate authority certificate for the cluster.
`addressRange` <br/> *string* | The IP address range of the container pods in this cluster, in CIDR notation (e.g. 10.96.0.0/14).
`networkName` <br/> *string* | The name of the Google Compute Engine network to which the cluster is connected.
`subnetName` <br/> *string* | The name of the Google Compute Engine subnetwork to which the cluster is connected.
`currentMasterVersion` <br/> *string* | The current software version of the master endpoint.
`cpuCount` <br/> *int* | The sum of CPU cores of all compute instances of the cluster.
`memoryInGB` <br/> *double* | The sum of memory allocated for all compute instances of the cluster.
`labels` <br/> *Map<String, String>* | The resource labels for the cluster to use to annotate any related Google Compute Engine resources.
`nodePoolMachineTypes` <br/> *Map<String, Integer>* | The machine type of the nodepools of the cluster, and the number of machines with that type for the cluster.
`id` <br/> *string* | The cluster is uniquely identified by the project name, location and cluster name.
`name` <br/> *string* | The name of the cluster.
<!-------------------- RETRIEVE A CLUSTER -------------------->

#### Retrieve a cluster

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/clusters/standard-cluster-1/projects/testarea-ugx/locations/us-central1-a/clusters/standard-cluster-1"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
      "status": "RUNNING",
      "nodeCount": 3,
      "endpoint": "104.197.118.234",
      "location": "us-central1-a",
      "creationTimestamp": "2019-07-08T18:45:16+00:00",
      "caCert": "LS0tLS1CRUdJTiBD...",
      "addressRange": "10.4.0.0/14",
      "networkName": "default",
      "subnetName": "default",
      "currentMasterVersion": "1.15.12-gke.20",
      "cpuCount": 12,
      "memoryInGB": 24.00,
      "labels": {
        "key1": "value1"
      },
      "nodePoolMachineTypes": {
      "e2-medium": 1,
    },

      "id": "projects/cmc-k8s-enabled-llb/locations/us-central1-a/clusters/standard-cluster-1",
      "name": "standard-cluster-1"
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/clusters/:cluster_id</a></code>


Attributes | &nbsp;
------- | -----------
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`nodeCount`<br/>*integer* | Number of nodes in the cluster.
`endpoint`<br/>*string* | The IP address of the cluster's master node. All interactions with the Kubernetes API are done through the master node.
`location` <br/> *string* | The zone or region in which the cluster is running. For regional clusters, your cluster nodes may span multiple zones within the region.
`status` <br/> *string* | The status of the cluster.
`caCert` <br/> *string* | The *base64 encoded* certificate authority certificate for the cluster.
`addressRange` <br/> *string* | The IP address range of the container pods in this cluster, in CIDR notation (e.g. 10.96.0.0/14).
`networkName` <br/> *string* | The name of the Google Compute Engine network to which the cluster is connected.
`subnetName` <br/> *string* | The name of the Google Compute Engine subnetwork to which the cluster is connected.
`currentMasterVersion` <br/> *string* | The current software version of the master endpoint.
`cpuCount` <br/> *int* | The sum of CPU cores of all compute instances of the cluster.
`memoryInGB` <br/> *double* | The sum of memory allocated for all compute instances of the cluster.
`labels` <br/> *Map<String, String>* | The resource labels for the cluster to use to annotate any related Google Compute Engine resources.
`nodePoolMachineTypes` <br/> *Map<String, Integer>* | The machine type of the nodepools of the cluster, and the number of machines with that type for the cluster.
`id` <br/> *string* | The cluster is uniquely identified by the project name, location and cluster name.
`name` <br/> *string* | The name of the cluster.
`caCert` <br/> *string* | The *base64 encoded* certificate authority certificate for the cluster. 



<!-------------------- CREATE A CLUSTER -------------------->

#### Create a cluster

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/clusters"
```
> Request body examples:

```js
// Create a cluster
{
  "name": "my-cluster",
  "shortRegion": "northamerica-northeast1",
  "shortZone": "northamerica-northeast1-a",
  "currentMasterVersion": "1.17.12-gke.1501",
  "nodeCount":3,
  "nodeType":"e2-highcpu-16",
  "networkName": "default",
  "subnetName": "default"
}
  ```


<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/clusters</code>

Create a new cluster.

Required | &nbsp;
------- | -----------
`name`<br/>*string* | The display name of the cluster.
`shortRegion`<br/>*string* | A short version of the region name.
`shortZone`<br/>*string* | A short version of the zone name.
`currentMasterVersion`<br/>*string* | The version of GKE used for this cluster.
`nodeCount` <br/>*integer* | The number of nodes in the primary node pool of this cluster. This must be greater than 0.
`nodeType`<br/>*string* | The machine types of the nodes in the default node pool of this cluster.
`networkName`<br/>*string* | The network that the Kubernetes cluster is in.
`subnetName`<br/>*string* | Subnetwork to which the cluster will belong. The subnetwork specified must belong the network specified.

<!-------------------- DELETE A CLUSTER -------------------->

#### Delete a cluster

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/clusters/projects/cmc-test-area-ugx/locations/us-central1-c/clusters/cluster-1"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/clusters/:id</code>

Delete a cluster. A cluster can only be deleted if it is in RUNNING or ERROR state.

> The above command returns a JSON structured like this:

```json
{
  "taskId": "3e4d4466-ce4b-404b-ada5-ee5a3fb76f4e",
  "taskStatus": "PENDING"
}
```