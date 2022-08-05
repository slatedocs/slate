### Node groups
<!-------------------- RETRIEVE NODE GROUPS -------------------->

#### List node groups

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/aws/test-area/nodegroups?cluster_id=cluster-1"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "cluster-1/nodegroup-1",
      "clusterName": "cluster-1",
      "name": "node group-1",
      "status": "ACTIVE",
      "version": "1.22",
      "capacityType": "ON_DEMAND",
      "amiType": "AL2_x86_64",
      "instanceTypes": [
        "t2.nano"
      ],
      "desiredNodeCount": 1
    },
    {
      "id": "cluster-1/nodegroup-2",
      "clusterName": "cluster-1",
      "name": "node group-2",
      "status": "ACTIVE",
      "version": "1.22",
      "capacityType": "ON_DEMAND",
      "amiType": "AL2_x86_64",
      "instanceTypes": [
        "t2.nano"
      ],
      "desiredNodeCount": 1
    }
  ],
  "metadata": {
    "recordCount": 2
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/nodegroups?cluster_id=:cluster_id<</code>

Optional | &nbsp; 
-------- | ------
`cluster_id` <br/> *string* | The id of the cluster in which to get the nodegroup.

Attributes | &nbsp;
------- | -----------
`id` <br/> *string* | The node group is uniquely identified by its name.
`clusterName` <br/> *string* | The name of the cluster that the node group belongs to.
`name` <br/> *string* | The name of the node group.
`status` <br/> *string* | The status of the node group.
`version` <br/> *string* | The version of Kubernetes that the node group is using.
`capacityType` <br/> *string* | The capacity type that the node group will use, can either support on-demand, or spot instances.
`amiType` <br/> *string* | The Amazon Machine Image (AMI) type that the node group will use.
`instanceTypes` <br/> *List&lt;string&gt;* | The list of instance types that this node group's generated nodes can have.
`desiredNodeCount` <br/> *integer* | The total amount of virtual CPUs across all nodes in the node group.

<!-------------------- RETRIEVE A NODE GROUP -------------------->

#### Retrieve a node group

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/aws/test-area/nodegroups/cluster-1/nodegroup-1"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "cluster-1/nodegroup-1",
    "clusterName": "cluster-1",
    "name": "nodegroup-1",
    "status": "ACTIVE",
    "version": "1.22",
    "capacityType": "ON_DEMAND",
    "amiType": "AL2_x86_64",
    "instanceTypes": [
      "t2.nano"
    ],
    "desiredNodeCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/nodegroups/:id</a></code>


Attributes | &nbsp;
------- | -----------
`id` <br/> *string* | The node group is uniquely identified by its name.
`clusterName` <br/> *string* | The name of the cluster that the node group belongs to.
`name` <br/> *string* | The name of the node group.
`status` <br/> *string* | The status of the node group.
`version` <br/> *string* | The version of Kubernetes that the node group is using.
`capacityType` <br/> *string* | The capacity type that the node group will use, can either support on-demand, or spot instances.
`amiType` <br/> *string* | The Amazon Machine Image (AMI) type that the node group will use.
`instanceTypes` <br/> *List&lt;string&gt;* | The list of instance types that this node group's generated nodes can have.
`desiredNodeCount` <br/> *integer* | The total amount of virtual CPUs across all nodes in the cluster.
