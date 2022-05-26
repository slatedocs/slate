### Daemon Sets

<!-------------------- LIST DAEMON SETS -------------------->

#### List daemon sets

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/daemonsets"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "canal/kube-system",
      "metadata": {},
      "spec": {},
      "status": {}
    }
  ],
  "metadata": {
    "recordCount": 9
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/daemonsets</code>

Retrieve a list of all daemon sets in a given [environment](#administration-environments).

| Attributes                                 | &nbsp;                                                   |
| ------------------------------------------ | -------------------------------------------------------- |
| `id` <br/>_string_                         | The id of the daemon set.                                |
| `metadata` <br/>_object_                   | The metadata of the daemon set.                          |
| `spec`<br/>_object_                        | The specification used to create and run the daemon set. |
| `status`<br/>_object_                      | The status information of the daemon set.                |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- GET A DAEMON SET -------------------->

#### Get a daemon set

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/daemonsets/test-aerospike/auth"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "canal/kube-system",
    "metadata": {},
    "spec": {},
    "status": {}
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/daemonsets/:id</code>

Retrieve a daemon set and all its info in a given [environment](#administration-environments).

| Attributes                                 | &nbsp;                                                          |
| ------------------------------------------ | --------------------------------------------------------------- |
| `id` <br/>_string_                         | The id of the daemon set.                                       |
| `metadata` <br/>_object_                   | The metadata of the daemon set.                                 |
| `spec`<br/>_object_                        | The specification used to create and run the daemon set.        |
| `status`<br/>_object_                      | The status information of the daemon set.                       |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- CREATE DAEMON SET -------------------->

#### Create a daemon set

```shell
curl -X POST \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/daemonsets"
  Content-Type: application/json
  {
  "apiVersion": "apps/v1",
  "kind": "DaemonSet",
  "metadata": {
    "name": "daemonset-name",
    "namespace": "default"
  },
  "spec": {
    "selector": {
      "matchLabels": {
        "name": "fluentd-elasticsearch"
      }
    },
    "template": {
      "metadata": {
        "labels": {
          "name": "fluentd-elasticsearch"
        }
      },
      "spec": {
        "containers": [
          {
            "name": "fluentd-elasticsearch",
            "image": "quay.io/fluentd_elasticsearch/fluentd:v2.5.2"
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

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/daemonsets</code>

Create a daemon set in a given [environment](#administration-environments).

| Required Attributes                        | &nbsp;                                                                     |
| ------------------------------------------ | ---------------------------------------------------------------------------|
| `apiVersion` <br/> _string_                | The api version (versioned schema) of the daemon set.                      |
| `metadata` <br/>_object_                   | The metadata of the daemon set.                                            |
| `metadata.name` <br/>_string_              | The name of the daemon set.                                                |
| `spec`<br/>_object_                        | The specification used to create and run the daemon set.                   |
| `spec.selector`<br/>_object_               | The label query over the daemon set's resources.                           |
| `spec.template`<br/>_object_               | The data a daemon set's pod should have when created.                      |
| `spec.spec`<br/>*object*                   | The specification used to create and run the pod(s) within the daemon set. |


| Optional Attributes                        | &nbsp;                                                                     |
| ------------------------------------------ | -------------------------------------------------------------------------- |
| `metadata.namespace` <br/>_string_         | The namespace in which the daemon set is created.                          |
| `spec.selector.matchLabels`<br/>_object_   | The key value pairs retrieved by a label query from a daemon set.          |

Return value:

| Attributes                 | &nbsp;                                              |
| -------------------------- | --------------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the create daemon set task. |
| `taskStatus` <br/>_string_ | The status of the operation.                        |

<!-------------------- REPLACE DAEMON SET -------------------->

#### Replace a daemon set

```shell
curl -X PUT \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/daemonsets/daemonset-name/default"
  Content-Type: application/json
  {
  "apiVersion": "apps/v1",
  "kind": "DaemonSet",
  "metadata": {
    "name": "daemonset-name",
    "namespace": "default"
  },
  "spec": {
    "selector": {
      "matchLabels": {
        "name": "fluentd-elasticsearch"
      }
    },
    "template": {
      "metadata": {
        "labels": {
          "name": "fluentd-elasticsearch"
        }
      },
      "spec": {
        "containers": [
          {
            "name": "fluentd-elasticsearch",
            "image": "quay.io/fluentd_elasticsearch/fluentd:v2.5.2"
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

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/daemonsets/:id</code>

Replace a daemon set in a given [environment](#administration-environments).

| Required Attributes                        | &nbsp;                                                                     |
| ------------------------------------------ | ---------------------------------------------------------------------------|
| `apiVersion` <br/> _string_                | The api version (versioned schema) of the daemon set.                      |
| `metadata` <br/>_object_                   | The metadata of the daemon set.                                            |
| `metadata.name` <br/>_string_              | The name of the daemon set.                                                |
| `spec`<br/>_object_                        | The specification used to replace and run the daemon set.                  |
| `spec.selector`<br/>_object_               | The label query over the daemon set's resources.                           |
| `spec.template`<br/>_object_               | The data a daemon set's pod should have when replaced.                     |
| `spec.spec`<br/>*object*                   | The specification used to create and run the pod(s) within the daemon set. |


| Optional Attributes                        | &nbsp;                                                                     |
| ------------------------------------------ | -------------------------------------------------------------------------- |
| `metadata.namespace` <br/>_string_         | The namespace in which the daemon set is replaced.                         |
| `spec.selector.matchLabels`<br/>_object_   | The key value pairs retrieved by a label query from a daemon set.          |

Return value:

| Attributes                 | &nbsp;                                              |
| -------------------------- | --------------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the replace daemon set task.|
| `taskStatus` <br/>_string_ | The status of the operation.                        |

<!-------------------- DELETE DAEMON SET -------------------->

#### Delete a daemon set

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/daemonsets/nginx-ingress-controller/ingress-nginx"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "1542bd45-4732-419b-87b6-4ea6ec695c2b",
  "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/daemonsets/:id</code>

Delete a daemon set from a given [environment](#administration-environments).

| Attributes                 | &nbsp;                                              |
| -------------------------- | --------------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the delete daemon set task. |
| `taskStatus` <br/>_string_ | The status of the operation.                        |
