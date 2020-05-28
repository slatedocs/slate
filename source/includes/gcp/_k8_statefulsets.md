### Stateful Sets

<!-------------------- LIST STATEFUL SETS -------------------->

#### List stateful sets

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/k8s/an_environment/statefulsets"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "test-aerospike/auth",
      "images": [
        "aerospike/aerospike-server:4.5.0.5"
      ],
      "metadata": {
        "creationTimestamp": "2020-04-27T09:13:49.000-04:00",
        "generation": 1,
        "labels": {
          "app": "aerospike",
          "chart": "aerospike-0.3.2",
          "heritage": "Helm",
          "release": "test"
        },
        "name": "test-aerospike",
        "namespace": "auth",
        "resourceVersion": "117166675",
        "selfLink": "/apis/apps/v1/namespaces/auth/statefulsets/test-aerospike",
        "uid": "0aeff29e-e33d-48da-b933-651a9070d58c"
      },
      "spec": {
        // ...
      },
      "status": {
        "collisionCount": 0,
        "currentReplicas": 1,
        "currentRevision": "test-aerospike-6db7776c7d",
        "observedGeneration": 1,
        "readyReplicas": 1,
        "replicas": 1,
        "updateRevision": "test-aerospike-6db7776c7d",
        "updatedReplicas": 1
      }
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/statefulsets</code>

Retrieve a list of all stateful sets in a given [environment](#administration-environments).

| Attributes                                 | &nbsp;                                                          |
| ------------------------------------------ | --------------------------------------------------------------- |
| `id` <br/>*string*                         | The id of the stateful set                                      |
| `metadata` <br/>*object*                   | The metadata of the stateful set                                |
| `metadata.creationTimestamp` <br/>*string* | The date of creation of the stateful set as a string            |
| `metadata.labels` <br/>*map*               | The labels associated to the stateful set                       |
| `metadata.name` <br/>*string*              | The name of the stateful set                                    |
| `metadata.namespace` <br/>*string*         | The namespace in which the stateful set is created              |
| `metadata.uid` <br/>*object*               | The UUID of the stateful set                                    |
| `spec`<br/>*object*                        | The specification used to create and run the stateful set       |
| `status`<br/>*object*                      | The status information of the stateful set                      |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- GET A STATEFUL SET -------------------->

#### Get a stateful set

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/k8s/an_environment/statefulsets/test-aerospike/auth"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "test-aerospike/auth",
    "replicaRatio": "1 / 1",
    "images": [
      "aerospike/aerospike-server:4.5.0.5"
    ],
    "apiVersion": "apps/v1",
    "kind": "StatefulSet",
    "metadata": {
      "creationTimestamp": "2020-04-27T09:13:49.000-04:00",
      "generation": 1,
      "labels": {
        "app": "aerospike",
        "chart": "aerospike-0.3.2",
        "heritage": "Helm",
        "release": "test"
      },
      "name": "test-aerospike",
      "namespace": "auth",
      "resourceVersion": "117166675",
      "selfLink": "/apis/apps/v1/namespaces/auth/statefulsets/test-aerospike",
      "uid": "0aeff29e-e33d-48da-b933-651a9070d58c"
    },
    "spec": {
      // ...
    },
    "status": {
      "collisionCount": 0,
      "currentReplicas": 1,
      "currentRevision": "test-aerospike-6db7776c7d",
      "observedGeneration": 1,
      "readyReplicas": 1,
      "replicas": 1,
      "updateRevision": "test-aerospike-6db7776c7d",
      "updatedReplicas": 1
    }
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/statefulsets/:id</code>

Retrieve a stateful set and all its info in a given [environment](#administration-environments).

| Attributes                                 | &nbsp;                                                          |
| ------------------------------------------ | --------------------------------------------------------------- |
| `id` <br/>*string*                         | The id of the stateful set                                      |
| `metadata` <br/>*object*                   | The metadata of the stateful set                                |
| `metadata.creationTimestamp` <br/>*string* | The date of creation of the stateful set as a string            |
| `metadata.labels` <br/>*map*               | The labels associated to the stateful                           |
| `metadata.name` <br/>*string*              | The name of the stateful set                                    |
| `metadata.namespace` <br/>*string*         | The namespace in which the stateful set is created              |
| `metadata.uid` <br/>*object*               | The UUID of the stateful set                                    |
| `spec`<br/>*object*                        | The specification used to create and run the stateful set       |
| `status`<br/>*object*                      | The status information of the stateful set                      |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).
