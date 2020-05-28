### Daemon Sets

<!-------------------- LIST DAEMON SETS -------------------->

#### List daemon sets

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/k8s/anenvironment/daemonsets"
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "canal/kube-system",
      "metadata": {
        "annotations": {
          "deprecated.daemonset.template.generation": "8",
          "kubectl.kubernetes.io/last-applied-configuration": "{...}"
        },
        "creationTimestamp": "2019-03-12T14:22:52.000-04:00",
        "generation": 8,
        "labels": {
          "k8s-app": "canal"
        },
        "name": "canal",
        "namespace": "kube-system",
        "resourceVersion": "117221602",
        "selfLink": "/apis/apps/v1/namespaces/kube-system/daemonsets/canal",
        "uid": "d946db1b-44f3-11e9-960d-02007a9a001f"
      },
      "spec": {
        /*...*/
      },
      "status": {
        "currentNumberScheduled": 10,
        "desiredNumberScheduled": 10,
        "numberAvailable": 10,
        "numberMisscheduled": 0,
        "numberReady": 10,
        "observedGeneration": 8,
        "updatedNumberScheduled": 10
      }
    }
  ],
  // ...
  "metadata": {
    "recordCount": 9
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/daemonsets</code>

Retrieve a list of all daemon sets in a given [environment](#administration-environments).

| Attributes                                 | &nbsp;                                                  |
| ------------------------------------------ | ------------------------------------------------------- |
| `id` <br/>_string_                         | The id of the daemon set                                |
| `metadata` <br/>_object_                   | The metadata of the daemon set                          |
| `metadata.creationTimestamp` <br/>_string_ | The date of creation of the daemon set as a string      |
| `metadata.labels` <br/>_map_               | The labels associated to the daemon set                 |
| `metadata.name` <br/>_string_              | The name of the daemon set                              |
| `metadata.namespace` <br/>_string_         | The namespace in which the daemon set is created        |
| `metadata.uid` <br/>_object_               | The UUID of the daemon set                              |
| `spec`<br/>_object_                        | The specification used to create and run the daemon set |
| `status`<br/>_object_                      | The status information of the daemon set                |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- GET A DAEMON SET -------------------->

#### Get a daemon set

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/k8s/anenvironment/statefulsets/test-aerospike/auth"
```

> The above command returns JSON structured like this:

```json
{
    "data": {
        "id": "canal/kube-system",
        "metadata": {
            "annotations": {
                "deprecated.daemonset.template.generation": "8",
                "kubectl.kubernetes.io/last-applied-configuration": "{...}"
            },
            "creationTimestamp": "2019-03-12T14:22:52.000-04:00",
            "generation": 8,
            "labels": {
                "k8s-app": "canal"
            },
            "name": "canal",
            "namespace": "kube-system",
            "resourceVersion": "117221602",
            "selfLink": "/apis/apps/v1/namespaces/kube-system/daemonsets/canal",
            "uid": "d946db1b-44f3-11e9-960d-02007a9a001f"
        },
        "spec": {
          // ...
        },
        "status": {
            "currentNumberScheduled": 10,
            "desiredNumberScheduled": 10,
            "numberAvailable": 10,
            "numberMisscheduled": 0,
            "numberReady": 10,
            "observedGeneration": 8,
            "updatedNumberScheduled": 10
        }
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/statefulsets/:id</code>

Retrieve a daemon set and all its info in a given [environment](#administration-environments).

| Attributes                                 | &nbsp;                                                          |
| ------------------------------------------ | --------------------------------------------------------------- |
| `id` <br/>_string_                         | The id of the daemon set                                        |
| `metadata` <br/>_object_                   | The metadata of the daemon set                                  |
| `metadata.creationTimestamp` <br/>_string_ | The date of creation of the daemon set as a string              |
| `metadata.labels` <br/>_map_               | The labels associated to the daemon                             |
| `metadata.name` <br/>_string_              | The name of the daemon set                                      |
| `metadata.namespace` <br/>_string_         | The namespace in which the daemon set is created                |
| `metadata.uid` <br/>_object_               | The UUID of the daemon set                                      |
| `spec`<br/>_object_                        | The specification used to create and run the daemon set         |
| `status`<br/>_object_                      | The status information of the daemon set                        |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).
