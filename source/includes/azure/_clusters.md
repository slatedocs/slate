### Clusters

Deploy and manage your Azure Kubenetes Service (AKS) Clusters.

For information regarding AKS clusters, please see [azure docs](https://docs.microsoft.com/en-us/azure/aks/).

<!-------------------- LIST AKS Clusters -------------------->

#### List AKS clusters

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/azure-conn/test_env/clusters"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "/subscriptions/9e548d49-7d56-452c-8fc8-e81a25d05ddf/resourcegroups/azure-connect-system-ssamadh-mean-env/providers/Microsoft.ContainerService/managedClusters/ssamadh-aks-mean",
      "name": "ssamadh-basic",
      "version": "premium_lrs",
      "region": "southeastasia",
      "nodePools": "4",
      "totalNodes": "7",
    },
    {
       "id": "/subscriptions/ 803c8d4a-80ca-4793-8def-89b5f55d1091/resourcegroups/azure-connect-system-ssamadh-mean-env/providers/Microsoft.ContainerService/managedClusters/ssamadh-aks-mean",
      "name": "ssamadh-basic",
      "version": "premium_lrs",
      "region": "southeastasia",
      "nodePools": "2",
      "totalNodes": "3",
    },
  ],
  "metadata": {
    "recordCount": 2
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/clusters</code>

Retrieve a list of all the AKS clusters in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`data`<br/>*array* | A list of Azure Kubenetes Service (AKS) Clusters. _(See ["Retrieve an AKS cluster"](#azure-retrieve-an-aks-cluster) API for the strucutre of each AKS cluster object)_
`metadata`<br/>*object* | Consists of the meta information related to the returned cluster list. The attribute `recordCount` contains the number of clusters returned.

<!-------------------- Retrieve  AKS Cluster -------------------->

#### Retrieve an AKS clusters

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/azure-conn/test_env/clusters/subscriptions/9e548d49-7d56-452c-8fc8-e81a25d05ddf/resourcegroups/azure-connect-system-ssamadh-mean-env/providers/Microsoft.ContainerService/managedClusters/ssamadh-aks-mean"
```

Note: The above example uses the complete cluster id set by Azure. However, the cluster may also be retrieved by the cluster name as shown below:

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/azure-conn/test_env/clusters/ssamadh-aks-mean"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
      "id": "/subscriptions/9e548d49-7d56-452c-8fc8-e81a25d05ddf/resourcegroups/azure-connect-system-ssamadh-mean-env/providers/Microsoft.ContainerService/managedClusters/ssamadh-aks-mean",
      "name": "ssamadh-basic",
      "version": "premium_lrs",
      "region": "southeastasia",
      "nodePools": "4",
      "totalNodes": "7",
    },
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/clusters/:cluster_name</code>

Retrieve a specific AKS cluster in a given [environment](#administration-environments).

Attributes        | &nbsp;
-------           | -----------
`id` <br/>*string* | The resource id
`name` <br/>*string* | The name of the resource, unique within the environment
`provisioningState` <br/>*string*  | The state of the cluster could be any of [Succeeded, Creating, Deleting, Updating, Cancelled, Failed]
`dnsPrefix`<br/>*string* | The DNS prefix specified when creating the managed cluster
`nodePools`<br/>*int* | The number of node container service agent pool
`totalNodes`<br/>*int* | The total number of nodes across all nodePools
`rbacEnabled`<br/>*boolean* | Indicates of RBAC is enabled for this kubernetes cluster
`endpoint`<br/>*string* | The fully qualified domain name (fqdn) for the master pool
`region`<br/>*string* | The resource location
`version` <br/>*string* | The version of kubernetes running in the cluster

<!-------------------- CREATE AKS CLUSTER -------------------->

#### Create a cluster

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "http://cloudmc_endpoint/v1/services/azure/example/clusters"
```

> Request body examples:

```json
{
	"version": "1.18.2",
	"dnsPrefix": "kub-root-nik-dns",
	"rootUsername": "root_nzk",
	"primaryPoolNodeType": "Standard_B2ms",
	"primaryPoolNodeCount": 1,
	"vmScaleSetsEnabled": false,
	"rbacEnabled": false,
	"region": "canadacentral",
	"name": "kub_root_nzk",
	"sshkey": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCguvgDRuUF/wijOJCNmYlQHujCmUHl/i0Ubos4nHy5uCBdn1LGF+PG3TpJqO1LUWqpHaPl4yN7bpsdXyq6a9nxe0C1bQ4FK6P5qm0X320uvqv34jwTPsIbnhw9I317df+xJyXXsL/P5vS4ULPMC5UZjWm4BYe7did4zmXXhA/zmLY6cUg19sZp5r5SUQcf5xHAqO3cQVZwzBhBMwroflZZ59zNpxy+xXPBqC3IdusF2yTDW7bwCQHESUOsd9XhwrzCB+1wETKjLpk0wkWj8G2j1pkKGRpv60QcG85lbZvQAg54v3HYD7fVJCaz9gJJoiyRBnqQ6XVxam5bZgiMKa0J johndoe@machine.local"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/clusters</code>

Create a new cluster.

Required | &nbsp;
------- | -----------
`dnsPrefix`<br/>*string* | The DNS prefix to be used to create the FQDN for the master pool.
`name`<br/>*string* | . The name of the cluster.
`primaryPoolNodeCount`<br/>*string* | The number of agents (VMs) to host docker containers. Allowed values must be in the range of 1 to 100 (inclusive).
`primaryPoolNodeType`<br/>*string* | The size type of each virtual machine in the agent pool.
`rbacEnabled`<br/>*boolean* | A boolean to indicate whether RBAC should be enabled on this cluster or not.
`region`<br/>*string* | The name of the region for the cluster.
`sshkey`<br/>*string* | The ssh key public portion that will be used to access cluster.
`version` <br/>*string* | The version for the Kubernetes cluster.
`vmScaleSetsEnabled`<br/>*boolean* | The boolean to indicate whether to use virtual machine scale sets or availability set for agent pool.

Optional | &nbsp;
------- | -----------
`rootUsername`<br/>*string* | The user name to create a root user on cluster.

<!-------------------- DELETE A CLUSTER -------------------->

#### Delete a cluster

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/azure/example/clusters/subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.ContainerService/managedClusters/sample_small_cluster"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "3e4d4466-ce4b-404b-ada5-ee5a3fb76f4e",
  "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/clusters/:id</code>

Delete an existing cluster.
