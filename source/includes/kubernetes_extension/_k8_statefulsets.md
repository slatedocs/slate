### Stateful Sets

<!-------------------- LIST STATEFUL SETS -------------------->

#### List stateful sets

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/statefulsets?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "test-aerospike/auth",
      "images": ["aerospike/aerospike-server:4.5.0.5"],
      "metadata": {},
      "spec": {},
      "status": {}
    }
  ],
  "metadata": {
    "recordCount": 4
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/statefulsets?cluster_id=:cluster_id</code>

Retrieve a list of all stateful sets in a given [environment](#administration-environments).

| Required                   | &nbsp;                                                    |
| -------------------------- | --------------------------------------------------------- |
| `cluster_id` <br/>_string_ | The id of the cluster in which to list the stateful sets. |

| Attributes                                 | &nbsp;                                                    |
| ------------------------------------------ | --------------------------------------------------------- |
| `id` <br/>_string_                         | The id of the stateful set                                |
| `metadata` <br/>_object_                   | The metadata of the stateful set                          |
| `spec`<br/>_object_                        | The specification used to create and run the stateful set |
| `status`<br/>_object_                      | The status information of the stateful set                |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- GET A STATEFUL SET -------------------->

#### Get a stateful set

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/statefulsets/test-aerospike/auth?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "test-aerospike/auth",
    "replicaRatio": "1 / 1",
    "images": ["aerospike/aerospike-server:4.5.0.5"],
    "apiVersion": "apps/v1",
    "kind": "StatefulSet",
    "metadata": {},
    "spec": {},
    "status": {}
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/statefulsets/:id?cluster_id=:cluster_id</code>

Retrieve a stateful set and all its info in a given [environment](#administration-environments).

| Required                   | &nbsp;                                                  |
| -------------------------- | ------------------------------------------------------- |
| `cluster_id` <br/>_string_ | The id of the cluster in which to get the stateful set. |

| Attributes                                 | &nbsp;                                                    |
| ------------------------------------------ | --------------------------------------------------------- |
| `id` <br/>_string_                         | The id of the stateful set                                |
| `metadata` <br/>_object_                   | The metadata of the stateful set                          |
| `spec`<br/>_object_                        | The specification used to create and run the stateful set |
| `status`<br/>_object_                      | The status information of the stateful set                |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- CREATE A STATEFUL SET -------------------->

#### Create a stateful set
```shell
curl -X POST \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/statefulsets"
  Content-Type: application/json
  {
  "apiVersion": "apps/v1",
  "metadata": {
    "name": "stateful-set-name",
    "namespace": "default"
  },
  "spec": {
    "selector": {
      "matchLabels": {
        "app": "nginx"
      }
    },
    "template": {
      "metadata": {
        "labels": {
          "app": "nginx"
        }
      },
      "spec": {
        "containers": [
          {
            "name": "nginx",
            "image": "k8s.gcr.io/nginx-slim:0.8"
          }
        ]
      }
    }
  }
}
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "1542bd45-4732-419b-87b6-4ea6ec695c2b",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/statefulsets</code>


Create a stateful set in a given [environment](#administration-environments).

| Attributes                                 | &nbsp;                                                                      |
| ------------------------------------------ | ----------------------------------------------------------------------------|
| `apiVersion` <br/> _string_                | The api version (versioned schema) of the stateful set                      |
| `metadata` <br/>_object_                   | The metadata of the stateful set                                            |
| `metadata.name` <br/>_string_              | The name of the stateful set                                                |
| `metadata.namespace` <br/>_string_         | The namespace in which the stateful set is created                          |
| `spec`<br/>_object_                        | The specification used to create and run the stateful set                   |
| `spec.selector.matchLabels`<br/>_object_   | The key value pairs retrieved by a label query from a stateful set          |
| `spec.template`<br/>_object_               | The data a stateful set's pod should have when created                      |
| `spec.spec`<br/>*object*                   | The specification used to create and run the pod(s) within the stateful set |

Return value:

| Attributes                 | &nbsp;                                                |
---------------------------- | ------------------------------------------------------|
| `taskId` <br/>*string*     | The id corresponding to the stateful set create task. |
| `taskStatus` <br/>*string* | The status of the operation.                          |
