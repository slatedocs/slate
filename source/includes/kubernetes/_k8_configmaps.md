## ConfigMaps

<!-------------------- LIST CONFIG MAPS -------------------->

### List configmaps

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/k8s/an_environment/configmaps"
```

> The above command returns a JSON structured like this:

```js
{
  "data": [{
      "id": "cert-manager-cainjector-leader-election/kube-system",
      "apiVersion": "v1",
      "kind": "ConfigMap",
      "metadata": {
        "annotations": {
          "control-plane.alpha.kubernetes.io/leader": "{\"holderIdentity\":\"cert-manager-cainjector-54c4796c5d-9txng_7d63d35e-a197-497b-9b5f-c9722aabc6cd\",\"leaseDurationSeconds\":15,\"acquireTime\":\"2020-06-14T02:01:27Z\",\"renewTime\":\"2020-06-16T19:54:04Z\",\"leaderTransitions\":23}"
        },
        "creationTimestamp": "2020-03-20T15:48:41.000-04:00",
        "name": "cert-manager-cainjector-leader-election",
        "namespace": "kube-system",
        "resourceVersion": "25190285",
        "selfLink": "/api/v1/namespaces/kube-system/configmaps/cert-manager-cainjector-leader-election",
        "uid": "255fdf58-4f53-4260-abb9-334445c187a2"
      }
    }, {
      etc...
    } 
  ]
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/configmaps</code>

Retrieve a list of all config maps in a given [environment](#administration-environments).

| Attributes                                 | &nbsp;                                                  |
| ------------------------------------------ | ------------------------------------------------------- |
| `id` <br/>_string_                         | The id of the config map                                |
| `apiVersion` <br/>_string_                 | The API version used to retrieve this config map        |
| `kind` <br/>_string_                       | The type of the returned resource. ie, ConfigMap        |
| `metadata` <br/>_object_                   | The metadata of the config map                          |
| `metadata.creationTimestamp` <br/>_string_ | The date of creation of the config map as a string       |
| `metadata.annotations` <br/>_map_          | The annotations associated to the config map            |
| `metadata.name` <br/>_string_              | The name of the config map                              |
| `metadata.namespace` <br/>_string_         | The namespace in which the config map is created        |
| `metadata.uid` <br/>_object_               | The UUID of the config map                              |
| `metadata.selfLink` <br/>_object_          | A link that uniquely identifies this config map         |
| `metadata.resourceVersion` <br/>_object_   | The resource version of the config map                  |

<!-------------------- GET A configmap -------------------->

### Get a configmap

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/k8s/an_environment/configmaps/cert-manager-cainjector-leader-election/kube-system"
```

> The above command returns a JSON structured like this:

```js
{
    "data": {
      "id": "cert-manager-cainjector-leader-election/kube-system",
      "apiVersion": "v1",
      "kind": "ConfigMap",
      "metadata": {
        "annotations": {
          "control-plane.alpha.kubernetes.io/leader": "{\"holderIdentity\":\"cert-manager-cainjector-54c4796c5d-9txng_7d63d35e-a197-497b-9b5f-c9722aabc6cd\",\"leaseDurationSeconds\":15,\"acquireTime\":\"2020-06-14T02:01:27Z\",\"renewTime\":\"2020-06-16T19:54:04Z\",\"leaderTransitions\":23}"
        },
        "creationTimestamp": "2020-03-20T15:48:41.000-04:00",
        "name": "cert-manager-cainjector-leader-election",
        "namespace": "kube-system",
        "resourceVersion": "25190285",
        "selfLink": "/api/v1/namespaces/kube-system/configmaps/cert-manager-cainjector-leader-election",
        "uid": "255fdf58-4f53-4260-abb9-334445c187a2"
      }
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/configmaps/:id</code>

Retrieve a configmap and all its info in a given [environment](#administration-environments).

| Attributes                                 | &nbsp;                                                  |
| ------------------------------------------ | ------------------------------------------------------- |
| `id` <br/>_string_                         | The id of the config map                                |
| `apiVersion` <br/>_string_                 | The API version used to retrieve this config map        |
| `kind` <br/>_string_                       | The type of the returned resource. ie, ConfigMap        |
| `metadata` <br/>_object_                   | The metadata of the config map                          |
| `metadata.creationTimestamp` <br/>_string_ | The date of creation of the config map as a string       |
| `metadata.annotations` <br/>_map_          | The annotations associated to the config map            |
| `metadata.name` <br/>_string_              | The name of the config map                              |
| `metadata.namespace` <br/>_string_         | The namespace in which the config map is created        |
| `metadata.uid` <br/>_object_               | The UUID of the config map                              |
| `metadata.selfLink` <br/>_object_          | A link that uniquely identifies this config map         |
| `metadata.resourceVersion` <br/>_object_   | The resource version of the config map                  |

