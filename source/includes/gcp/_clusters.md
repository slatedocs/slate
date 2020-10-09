### Clusters
List your Kubernetes clusters.

<!-------------------- LIST CLUSTERS -------------------->

#### List clusters

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/clusters"
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
      "id": "projects/cmc-k8s-enabled-llb/locations/us-central1-a/clusters/standard-cluster-1",
      "name": "standard-cluster-1"
    },
    {
      "status": "RUNNING",
      "nodeCount": 1,
      "endpoint": "34.66.215.161",
      "location": "us-central1-a",
      "creationTimestamp": "2019-07-08T14:59:19+00:00",
      "id": "projects/cmc-k8s-enabled-llb/locations/us-central1-a/clusters/your-first-cluster-1",
      "name": "your-first-cluster-1",
      "caCert": "LS0tLS1CRUdJS0K"
    }
  ],
  "metadata": {
    "recordCount": 2
  }
}
```

Attributes | &nbsp;
------- | -----------
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`nodeCount`<br/>*number* | Number of nodes in the cluster.
`endpoint`<br/>*string* | The IP address of the cluster's master node. All interactions with the Kubernetes API are done through the master node.
`location` <br/> *string* | The zone or region in which the cluster is running. For regional clusters, your cluster nodes may span multiple zones within the region.
`status` <br/> *string* | The status of the cluster.
`id` <br/> *string* | The cluster is uniquely identified by the project name, location and cluster name.
`name` <br/> *string* | The name of the cluster.
`caCert` <br/> *string* | The *base64 encoded* certificate authority certificate for the cluster. 

<!-------------------- RETRIEVE A CLUSTER -------------------->

#### Retrieve a cluster

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/clusters/standard-cluster-1"
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
      "id": "projects/cmc-k8s-enabled-llb/locations/us-central1-a/clusters/standard-cluster-1",
      "name": "standard-cluster-1",
      "caCert": "LS0tLS1CRUdJS0K"
    }
}
```

Attributes | &nbsp;
------- | -----------
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`nodeCount`<br/>*number* | Number of nodes in the cluster.
`endpoint`<br/>*string* | The IP address of the cluster's master node. All interactions with the Kubernetes API are done through the master node.
`location` <br/> *string* | The zone or region in which the cluster is running. For regional clusters, your cluster nodes may span multiple zones within the region.
`status` <br/> *string* | The status of the cluster.
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
   "https://cloudmc_endpoint/v1/services/gcp/test-area/clusters"
```
> Request body examples:

```js
// Create a cluster
{
  "name": "my-instance",
  "shortRegion": "northamerica-northeast1",
  "shortZone": "northamerica-northeast1-a",
  "initialClusterVersion": "1.17.12-gke.500",
  "nodePools": {
    "initialNodeCount":"3",
    "nodeConfig":{
      "machineType":"e2-highcpu-16"
    }
  },
  "network": "default",
  "subnetwork": "default"
  }
  ```


<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/clusters</code>

Create a new cluster.

Required | &nbsp;
------- | -----------
`name`<br/>*string* | The display name of the cluster.
`shortRegion`<br/>*string* | A short version of the region name.
`shortZone`<br/>*string* | A short version of the zone name.
`initialClusterVersion`<br/>*string* | The version of GKE used for this cluster.
`initialNodeCount` <br/>*string* | The number of nodes in the primary node pool of this cluster. This must be greater than 0.
`nodeType`<br/>*string* | The machine types of the nodes in the default node pool of this cluster.
`network`<br/>*string* | The network that the Kubernetes cluster is in.
`subnetwork`<br/>*string* | Subnetwork to which the cluster will belong. The subnetwork specified must belong the network specified.