#### Service accounts


<!-------------------- LIST SERVICE ACCOUNTS -------------------->

##### List service accounts

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/serviceaccounts?cluster_id=:cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
      "metadata": {
        "name": "vpnkit-controller",
        "namespace": "kube-system",
        "selfLink": "/api/v1/namespaces/kube-system/serviceaccounts/vpnkit-controller",
        "uid": "b9afa8a8-3d64-4605-959f-12bb5c6cfba2",
        "resourceVersion": "481",
        "creationTimestamp": "2020-09-18T14:47:48Z",
        "annotations": {
          "kubectl.kubernetes.io/last-applied-configuration": "{\"apiVersion\":\"v1\",\"kind\":\"ServiceAccount\",\"metadata\":{\"annotations\":{},\"name\":\"vpnkit-controller\",\"namespace\":\"kube-system\"}}\n"
        }
      },
      "secrets": [
        {
          "name": "vpnkit-controller-token-hl674"
        }
      ]
    }
  ]
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/serviceaccounts?cluster_id=:cluster_id</code>

Retrieve a list of all service accounts in a given [environment](#administration-environments).

| Attributes                                 | &nbsp;                                                                                       |
| ------------------------------------------ | -------------------------------------------------------------------------------------------- |
| `id` <br/>_string_                         | The id of the service account.                                                               |
| `metadata.annotations` <br/>_map_          | The annotations of the service account.                                                      |
| `metadata` <br/>_object_                   | The metadata of the service account.                                                         |
| `metadata.creationTimestamp` <br/>_string_ | The date of creation of the service account as a string.                                     |
| `metadata.name` <br/>_string_              | The name of the service account.                                                             |
| `metadata.namespace` <br/>_string_         | The namespace in which the service account is created.                                       |
| `metadata.uid` <br/>_object_               | The UUID of the service account.                                                             |
| `metadata.secrets` <br/>_List&lt;object&gt;_     | The secrets of the service account.                                                          |
| `secretsSize` <br/>_integer_               | The number of secrets of the service account.                                                |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- GET A SERVICE ACCOUNT -------------------->

##### Get a service account

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/serviceaccounts/serviceaccount-name/serviceaccount-namespace?cluster_id=:cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
            "id": "default",
            "age": "1w5d",
            "secretsSize": 1,
            "metadata": {
              "creationTimestamp": "2020-09-18T10:46:40.000-04:00",
              "name": "default",
              "namespace": "default",
              "uid": "80a0de4d-a187-44c3-b691-1481220a5817"
            },
            "secrets": [
              {
                "name": "default-token-lrth9"
              }
            ]
          },
          "fieldTransitions": {},
          "operations": []
        }
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/serviceaccounts/:id?cluster_id=:cluster_id</code>

Retrieve a service account and all its info in a given [environment](#administration-environments).

| Attributes                                 | &nbsp;                                                                                       |
| ------------------------------------------ | -------------------------------------------------------------------------------------------- |
| `id` <br/>_string_                         | The id of the service account.                                                               |
| `metadata` <br/>_object_                   | The metadata of the service account.                                                         |
| `metadata.creationTimestamp` <br/>_string_ | The date of creation of the service account as a string.                                     |
| `metadata.name` <br/>_string_              | The name of the service account.                                                             |
| `metadata.namespace` <br/>_string_         | The namespace in which the service account is created.                                       |
| `metadata.uid` <br/>_object_               | The UUID of the service account.                                                             |
| `metadata.secrets` <br/>_List&lt;object&gt;_     | The secrets of the service account.                                                          |
| `secretsSize` <br/>_integer_               | The number of secrets of the service account.                                                |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- CREATE SERVICE ACCOUNT -------------------->

##### Create a service account

```shell
curl -X POST \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/serviceaccounts?cluster_id=:cluster_id"
  Content-Type: application/json
  {
    "apiVersion": "v1",
    "metadata": {
        "name": "service-account-name",
        "namespace": "default"
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

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/serviceaccounts?cluster_id=:cluster_id</code>

Create a service account in a given [environment](#administration-environments).

| Required Attributes                 | &nbsp;                                                      |
| ----------------------------------- | ----------------------------------------------------------- |
| `apiVersion` <br/>_string_          | The api version (versioned schema) of the service account.               |
| `metadata` <br/>_object_            | The metadata of the service account.                                     |
| `metadata.name` <br/>_string_       | The name of the service account.                                         |
| `metadata.namespace` <br/>_string_       | The namespace of the service account.                                         |

Return value:

| Attributes                 | &nbsp;                                       |
| -------------------------- | -------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the create service account task. |
| `taskStatus` <br/>_string_ | The status of the operation.                 |

<!-------------------- REPLACE SERVICE ACCOUNT -------------------->

##### Replace a service account

```shell
curl -X PUT \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/serviceaccounts/service-account-name/namespace-name?cluster_id=:cluster_id"
  Content-Type: application/json
  {
    "metadata": {
        "name": "service-account-name",
        "namespace": "namespace-name"
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

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/serviceaccounts/:id?cluster_id=:cluster_id</code>

Replace a service account in a given [environment](#administration-environments).

| Required Attributes                 | &nbsp;                                                      |
| ----------------------------------- | ----------------------------------------------------------- |
| `metadata` <br/>_object_            | The metadata of the service account.                                     |
| `metadata.name` <br/>_string_       | The name of the service account.                                         |
| `metadata.namespace` <br/>_string_       | The namespace of the service account.                                         |

Return value:

| Attributes                 | &nbsp;                                       |
| -------------------------- | -------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the create service account task. |
| `taskStatus` <br/>_string_ | The status of the operation.                 |

<!-------------------- DELETE SERVICE ACCOUNT -------------------->

##### Delete a service account

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/serviceaccounts/my-service-account/my-namespace?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "1542bd45-4732-419b-87b6-4ea6ec695c2b",
  "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/serviceaccounts/:id?cluster_id=:cluster_id</code>

Delete a service account from a given [environment](#administration-environments).

| Required                   | &nbsp;                                               |
| -------------------------- | ---------------------------------------------------- |
| `cluster_id` <br/>_string_ | The id of the cluster in which to delete the service account. |

| Attributes                 | &nbsp;                                          |
| -------------------------- | ----------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the delete service account task. |
| `taskStatus` <br/>_string_ | The status of the operation.                    |
