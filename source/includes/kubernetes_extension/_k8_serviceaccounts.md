### Service accounts


<!-------------------- LIST SERVICE ACCOUNTS -------------------->

#### List service accounts

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/serviceaccounts"
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

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/serviceaccounts</code>

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
| `metadata.secrets` <br/>_List<object>_     | The secrets of the service account.                                                          |
| `secretsSize` <br/>_integer_               | The number of secrets of the service account.                                                |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).
