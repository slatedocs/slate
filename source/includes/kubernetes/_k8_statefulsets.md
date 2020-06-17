## Stateful Sets

<!-------------------- LIST STATEFUL SETS -------------------->

### List stateful sets

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/statefulsets"
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
      "metadata": {},
      "spec": {},
      "status": {}
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
| `spec`<br/>*object*                        | The specification used to create and run the stateful set       |
| `status`<br/>*object*                      | The status information of the stateful set                      |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- GET A STATEFUL SET -------------------->

### Get a stateful set

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/statefulsets/test-aerospike/auth"
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
    "metadata": {},
    "spec": {},
    "status": {}
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/statefulsets/:id</code>

Retrieve a stateful set and all its info in a given [environment](#administration-environments).

| Attributes                                 | &nbsp;                                                          |
| ------------------------------------------ | --------------------------------------------------------------- |
| `id` <br/>*string*                         | The id of the stateful set                                      |
| `metadata` <br/>*object*                   | The metadata of the stateful set                                |
| `spec`<br/>*object*                        | The specification used to create and run the stateful set       |
| `status`<br/>*object*                      | The status information of the stateful set                      |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).
