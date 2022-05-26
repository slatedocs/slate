### Services

<!-------------------- LIST SERVICES -------------------->

#### List services

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/services"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "alaintest-aerospike/default",
      "ports": ["3000/TCP", "3002/TCP"],
      "type": "ClusterIP",
      "metadata": {},
      "spec": {},
      "status": {
        "loadBalancer": {}
      }
    },
    {
      "id": "alertmanager-operated/monitoring",
      "ports": ["9093/TCP", "9094/TCP", "9094/UDP"],
      "type": "NodePort",
      "apiVersion": "v1",
      "kind": "Service",
      "metadata": {},
      "spec": {},
      "status": {
        "loadBalancer": {}
      }
    }
  ],
  "metadata": {
    "recordCount": 2
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/services</code>

Retrieve a list of all services in a given [environment](#administration-environments).

| Attributes                         | &nbsp;                                                                                                  |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------- |
| `id` <br/>_string_                 | The id of the service                                                                                   |
| `metadata` <br/>_object_           | The metadata of the service                                                                             |
| `metadata.name` <br/>_string_      | The name of the service                                                                                 |
| `metadata.namespace` <br/>_string_ | The namespace in which the service is created                                                           |
| `metadata.uid` <br/>_object_       | The UUID of the service                                                                                 |
| `type` <br/>_object_               | The container images within a service                                                                   |
| `ports`<br/>_object_               | The list of ports that are exposed by this service                                                      |
| `spec`<br/>_object_                | The attributes that a user creates on a service                                                         |
| `spec.selector`<br/>_object_       | The keys and values corresponding to pod labels, used to determine where service traffic will be routed |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- GET A SERVICE -------------------->

#### Get a service

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/services/test-aerospike/auth"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "test-aerospike/auth",
    "ports": ["3000/TCP", "3002/TCP"],
    "type": "ClusterIP",
    "apiVersion": "v1",
    "kind": "Service",
    "metadata": {},
    "spec": {},
    "status": {
      "loadBalancer": {}
    }
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/services/:id</code>

Retrieve a service and all its info in a given [environment](#administration-environments).

| Attributes                         | &nbsp;                                                                                                  |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------- |
| `id` <br/>_string_                 | The id of the service                                                                                   |
| `metadata` <br/>_object_           | The metadata of the service                                                                             |
| `metadata.name` <br/>_string_      | The name of the service                                                                                 |
| `metadata.namespace` <br/>_string_ | The namespace in which the service is created                                                           |
| `metadata.uid` <br/>_object_       | The UUID of the service                                                                                 |
| `type` <br/>_object_               | The container images within a service                                                                   |
| `ports`<br/>_object_               | The list of ports that are exposed by this service                                                      |
| `spec`<br/>_object_                | The attributes that a user creates on a service                                                         |
| `spec.selector`<br/>_object_       | The keys and values corresponding to pod labels, used to determine where service traffic will be routed |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- CREATE A SERVICE -------------------->

#### Create a service

```shell
curl -X POST \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/services"
  Content-Type: application/json
  {
  "apiVersion": "v1",
  "kind": "Service",
  "metadata": {
    "name": "service-name",
    "namespace": "default"
  },
  "spec": {
    "ports": [
      {
        "port": 3000,
        "protocol": "TCP"
      }
    ],
    "type": "ClusterIP"
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

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/services</code>

Create a service in a given [environment](#administration-environments).

| Required Attributes           | &nbsp;                                                                  |
| ----------------------------- | ----------------------------------------------------------------------- |
| `apiVersion` <br/> _string_   | The api version (versioned schema) of the service.                      |
| `metadata` <br/>_object_      | The metadata of the service.                                            |
| `metadata.name` <br/>_string_ | The name of the service.                                                |
| `spec`<br/>_object_           | The specification used to create and run the service.                   |
| `spec.ports`<br/>_object_     | The list of ports that are exposed by this service.                     |
| `spec.type`<br/>_object_      | The type of service (ClusterIP, NodePort, ExternalName or LoadBalancer) |

| Optional Attributes                      | &nbsp;                                                             |
| ---------------------------------------- | ------------------------------------------------------------------ |
| `metadata.namespace` <br/>_string_       | The namespace in which the service is created.                     |
| `spec.selector`<br/>_object_             | The label query over the service's set of resources.               |
| `spec.selector.matchLabels`<br/>_object_ | The key value pairs retrieved by a label query from a service.     |

Return value:

| Attributes                 | &nbsp;                                           |
| -------------------------- | ------------------------------------------------ |
| `taskId` <br/>_string_     | The id corresponding to the create service task. |
| `taskStatus` <br/>_string_ | The status of the operation.                     |

<!-------------------- REPLACE A SERVICE -------------------->

#### Replace a service

```shell
curl -X PUT \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/services/service-name/default"
```
> Request body example:

```json
{
    "type": "LoadBalancer",
    "ports": [
        "4000/TCP"
    ],
    "apiVersion": "v1",
    "kind": "Service",
    "metadata": {
        "creationTimestamp": "2020-08-13T11:05:00.000-04:00",
        "name": "service-name",
        "namespace": "default",
        "resourceVersion": "170742452",
        "selfLink": "/api/v2/namespaces/default/services/service-name",
        "uid": "a84c8fea-f9d9-47ab-8e58-37059e9f18bd"
    },
    "spec": {
        "clusterIP": "10.245.44.45",
        "externalTrafficPolicy": "Cluster",
        "ports": [
            {
                "nodePort": 31167,
                "port": 3000,
                "protocol": "TCP",
                "targetPort": 306
            }
        ],
        "sessionAffinity": "ClientIP",
        "sessionAffinityConfig": {
            "clientIP": {
                "timeoutSeconds": 10555
            }
        },
        "type": "LoadBalancer"
    },
    "status": {
        "loadBalancer": {}
    }
}
```

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/services/:id</code>

Replace a service in a given [environment](#administration-environments).

| Required Attributes           | &nbsp;                                                             |
| ----------------------------- | ------------------------------------------------------------------ |
| `apiVersion` <br/> _string_   | The api version (versioned schema) of the service.                 |
| `metadata` <br/>_object_      | The metadata of the service.                                       |
| `metadata.name` <br/>_string_ | The name of the service.                                           |
| `spec`<br/>_object_           | The specification used to create and run the service.              |

Return value:

| Attributes                 | &nbsp;                                            |
| -------------------------- | ------------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the replace service task. |
| `taskStatus` <br/>_string_ | The status of the operation.                      |

<!-------------------- DELETE A SERVICE -------------------->

#### Delete a service

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/services/test-service/default"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/services/:id</code>

Delete a service from a given [environment](#administration-environments).

| Attributes                 | &nbsp;                                           |
| -------------------------- | ------------------------------------------------ |
| `taskId` <br/>_string_     | The id corresponding to the delete service task. |
| `taskStatus` <br/>_string_ | The status of the operation.                     |
