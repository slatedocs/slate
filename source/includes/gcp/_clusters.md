### Clusters
List your Kubernetes clusters.

<!-------------------- LIST CLUSTERS -------------------->

#### List clusters

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/clusters"
```
> The above command returns JSON structured like this:

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
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format
`nodeCount`<br/>*number* | Number of nodes in the cluster
`endpoint`<br/>*string* | The IP address of the cluster's master node. All interactions with the Kubernetes API are done through the master node.
`location` <br/> *string* | The zone or region in which the cluster is running. For regional clusters, your cluster nodes may span multiple zones within the region.
`status` <br/> *string* | The status of the cluster
`id` <br/> *string* | The cluster is uniquely identified by the project name, location and cluster name.
`name` <br/> *string* | The name of the cluster
`caCert` <br/> *string* | The *base64 encoded* certificate authority certificate for the cluster. 

<!-------------------- RETRIEVE A CLUSTER -------------------->

#### Retrieve a cluster

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/clusters/standard-cluster-1"
```
> The above command returns JSON structured like this:

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
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format
`nodeCount`<br/>*number* | Number of nodes in the cluster
`endpoint`<br/>*string* | The IP address of the cluster's master node. All interactions with the Kubernetes API are done through the master node.
`location` <br/> *string* | The zone or region in which the cluster is running. For regional clusters, your cluster nodes may span multiple zones within the region.
`status` <br/> *string* | The status of the cluster
`id` <br/> *string* | The cluster is uniquely identified by the project name, location and cluster name.
`name` <br/> *string* | The name of the cluster
`caCert` <br/> *string* | The *base64 encoded* certificate authority certificate for the cluster. 
