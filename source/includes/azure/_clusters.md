### Clusters

Deploy and manage your Azure Kubenetes Service (AKS) Clusters.

For information regarding AKS clusters, please see [azure docs](https://docs.microsoft.com/en-us/azure/aks/).

<!-------------------- LIST AKS Clusters -------------------->

#### List AKS clusters

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/azure-conn/test_env/clusters"
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
   "https://cloudmc_endpoint/v1/services/azure-conn/test_env/clusters/subscriptions/9e548d49-7d56-452c-8fc8-e81a25d05ddf/resourcegroups/azure-connect-system-ssamadh-mean-env/providers/Microsoft.ContainerService/managedClusters/ssamadh-aks-mean"
```

Note: The cluster may also be retrieved by the cluster name: 
```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/azure-conn/test_env/clusters/ssamadh-aks-mean"
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
id                | The resource id
name              | The name of the resource, unique within the environment
provisioningState | The state of the cluster could be any of [Succeeded, Creating, Deleting, Updating, Cancelled, Failed],
dnsPrefix         | DNS prefix specified when creating the managed cluster
nodePools         | Number of node container service agent pool.
totalNodes        | The total number of nodes across all nodePools
rbacEnabled       | Indicates of RBAC is enabled for this kubernetes cluster
endpoint          | The fully qualified domain name (fqdn) for the master pool
region            | The resource location
version           | The version of kubernetes running in the cluster,
