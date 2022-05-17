#### Stateful Sets

<!-------------------- LIST STATEFUL SETS -------------------->

##### List stateful sets

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/statefulsets?cluster_id=a_cluster_id"
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

| Attributes               | &nbsp;                                                    |
| ------------------------ | --------------------------------------------------------- |
| `id` <br/>_string_       | The id of the stateful set                                |
| `metadata` <br/>_object_ | The metadata of the stateful set                          |
| `spec`<br/>_object_      | The specification used to create and run the stateful set |
| `status`<br/>_object_    | The status information of the stateful set                |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- GET A STATEFUL SET -------------------->

##### Get a stateful set

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/statefulsets/test-aerospike/auth?cluster_id=a_cluster_id"
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

| Attributes               | &nbsp;                                                    |
| ------------------------ | --------------------------------------------------------- |
| `id` <br/>_string_       | The id of the stateful set                                |
| `metadata` <br/>_object_ | The metadata of the stateful set                          |
| `spec`<br/>_object_      | The specification used to create and run the stateful set |
| `status`<br/>_object_    | The status information of the stateful set                |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- CREATE A STATEFUL SET -------------------->

##### Create a stateful set

```shell
curl -X POST \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/statefulsets?cluster_id=a_cluster_id"
  Content-Type: application/json
  {
  "apiVersion": "apps/v1",
  "kind":"StatefulSet",
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

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/statefulsets?cluster_id=:cluster_id</code>

Create a stateful set in a given [environment](#administration-environments).

| Required Attributes           | &nbsp;                                                                      |
| ----------------------------- | --------------------------------------------------------------------------- |
| `apiVersion` <br/> _string_   | The api version (versioned schema) of the stateful set                      |
| `metadata` <br/>_object_      | The metadata of the stateful set                                            |
| `metadata.name` <br/>_string_ | The name of the stateful set                                                |
| `spec`<br/>_object_           | The specification used to create and run the stateful set                   |
| `spec.selector`<br/>_object_  | The label query over the stateful set's resources                           |
| `spec.template`<br/>_object_  | The data a stateful set's pod should have when created                      |
| `spec.spec`<br/>_object_      | The specification used to create and run the pod(s) within the stateful set |

| Optional Attributes                      | &nbsp;                                                                 |
| ---------------------------------------- | ---------------------------------------------------------------------- |
| `metadata.namespace` <br/>_string_       | The namespace in which the stateful set is created                     |
| `spec.selector.matchLabels`<br/>_object_ | The key value pairs retrieved by a label query from a stateful set     |

Return value:

| Attributes                 | &nbsp;                                                |
| -------------------------- | ----------------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the create stateful set task. |
| `taskStatus` <br/>_string_ | The status of the operation.                          |

<!-------------------- REPLACE A STATEFUL SET -------------------->

##### Replace a stateful set

```shell
curl -X PUT \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/statefulsets/stateful-set-name/default"
  Content-Type: application/json
  {
  "apiVersion": "apps/v1",
  "kind": "StatefulSet",
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

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/statefulsets/:id</code>

Replace a stateful set in a given [environment](#administration-environments).

| Required Attributes                        | &nbsp;                                                                       |
| ------------------------------------------ | -----------------------------------------------------------------------------|
| `apiVersion` <br/> _string_                | The api version (versioned schema) of the stateful set.                      |
| `metadata` <br/>_object_                   | The metadata of the stateful set.                                            |
| `metadata.name` <br/>_string_              | The name of the stateful set.                                                |
| `spec`<br/>_object_                        | The specification used to replaced and run the stateful set.                   |
| `spec.selector`<br/>_object_               | The label query over the stateful set's of resources.                        |
| `spec.template`<br/>_object_               | The data a stateful set's pod should have when replaced.                      |
| `spec.spec`<br/>_object_                   | The specification used to replace and run the pod(s) within the stateful set. |

| Optional Attributes                        | &nbsp;                                                                    |
| ------------------------------------------ | ------------------------------------------------------------------------- |
| `metadata.namespace` <br/>_string_         | The namespace in which the stateful set is replaced.                      |
| `spec.selector.matchLabels`<br/>_object_   | The key value pairs retrieved by a label query from a stateful set.       |

Return value:

| Attributes                 | &nbsp;                                                |
| -------------------------- | ----------------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the replace stateful set task.|
| `taskStatus` <br/>_string_ | The status of the operation.                          |

<!-------------------- DELETE STATEFUL SET -------------------->

##### Delete a stateful set

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/statefulsets/my-aerospike/default"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "1542bd45-4732-419b-87b6-4ea6ec695c2b",
  "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/statefulsets/:id?cluster_id=:cluster_id</code>

Delete a stateful set from a given [environment](#administration-environments).

| Attributes                 | &nbsp;                                                |
| -------------------------- | ----------------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the delete stateful set task. |
| `taskStatus` <br/>_string_ | The status of the operation.                          |
