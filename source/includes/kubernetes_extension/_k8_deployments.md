### Deployments

<!-------------------- LIST DEPLOYMENTS -------------------->

#### List deployments

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/deployments?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "coredns/kube-system",
      "deploymentStatus": "Progressing",
      "readyRatio": "2/2",
      "metadata": {},
      "spec": {},
      "status": {}
    }
  ],
  "metadata": {
    "recordCount": 6
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/deployments?cluster_id=:cluster_id</code>

Retrieve a list of all deployments in a given [environment](#administration-environments).

| Required                   | &nbsp;                                                  |
| -------------------------- | ------------------------------------------------------- |
| `cluster_id` <br/>_string_ | The id of the cluster in which to list the deployments. |

| Attributes                         | &nbsp;                                                  |
| ---------------------------------- | ------------------------------------------------------- |
| `id` <br/>_string_                 | The id of the deployment                                |
| `metadata` <br/>_object_           | The metadata of the deployment                          |
| `images` <br/>_object_             | The container images within a deployment                |
| `spec`<br/>_object_                | The specification used to create and run the deployment |
| `status`<br/>_object_              | The status information of the deployment                |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- GET A DEPLOYMENT -------------------->

#### Get a deployment

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/deployments/coredns/kube-system?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "coredns/kube-system",
    "deploymentStatus": "Progressing",
    "readyRatio": "2/2",
    "apiVersion": "apps/v1",
    "kind": "Deployment",
    "metadata": {},
    "spec": {},
    "status": {}
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/deployments/:id?cluster_id=:cluster_id</code>

Retrieve a deployment and all its info in a given [environment](#administration-environments).

| Required                   | &nbsp;                                                |
| -------------------------- | ----------------------------------------------------- |
| `cluster_id` <br/>_string_ | The id of the cluster in which to get the deployment. |

| Attributes                         | &nbsp;                                                  |
| ---------------------------------- | ------------------------------------------------------- |
| `id` <br/>_string_                 | The id of the deployment                                |
| `metadata` <br/>_object_           | The metadata of the deployment                          |
| `images` <br/>_object_             | The container images within a deployment                |
| `spec`<br/>_object_                | The specification used to create and run the deployment |
| `status`<br/>_object_              | The status information of the deployment                |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).
