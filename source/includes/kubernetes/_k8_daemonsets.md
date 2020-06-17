## Daemon Sets

<!-------------------- LIST DAEMON SETS -------------------->

### List daemon sets

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/k8s/an_environment/daemonsets"
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

| Attributes                                 | &nbsp;                                                  |
| ------------------------------------------ | ------------------------------------------------------- |
| `id` <br/>_string_                         | The id of the daemon set                                |
| `metadata` <br/>_object_                   | The metadata of the daemon set                          |
| `spec`<br/>_object_                        | The specification used to create and run the daemon set |
| `status`<br/>_object_                      | The status information of the daemon set                |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- GET A DAEMON SET -------------------->

### Get a daemon set

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/k8s/an_environment/daemonsets/test-aerospike/auth"
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
| `id` <br/>_string_                         | The id of the daemon set                                        |
| `metadata` <br/>_object_                   | The metadata of the daemon set                                  |
| `spec`<br/>_object_                        | The specification used to create and run the daemon set         |
| `status`<br/>_object_                      | The status information of the daemon set                        |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).
