#### ConfigMaps

<!-------------------- LIST CONFIG MAPS -------------------->

##### List configmaps

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/configmaps?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "coredns/kube-system",
      "data": {
        "Corefile": ".:53 {\n    errors\n    health\n    kubernetes cluster.local in-addr.arpa ip6.arpa {\n      pods insecure\n      upstream\n      fallthrough in-addr.arpa ip6.arpa\n    }\n    prometheus :9153\n    forward . /etc/resolv.conf\n    cache 30\n    loop\n    reload\n    loadbalance\n    import custom/*.override\n}\nimport custom/*.server\n"
      },
      "metadata": {}
    }
  ],
  "metadata": {
    "recordCount": 4
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/configmaps?cluster_id=:cluster_id</code>

Retrieve a list of all config maps in a given [environment](#administration-environments).

| Required                   | &nbsp;                                                  |
| -------------------------- | ------------------------------------------------------- |
| `cluster_id` <br/>_string_ | The id of the cluster in which to list the config maps. |

| Attributes                                 | &nbsp;                                             |
| ------------------------------------------ | -------------------------------------------------- |
| `id` <br/>_string_                         | The id of the config map                           |
| `apiVersion` <br/>_string_                 | The API version used to retrieve this config map   |
| `kind` <br/>_string_                       | The type of the returned resource. ie, ConfigMap   |
| `metadata` <br/>_object_                   | The metadata of the config map                     |

<!-------------------- GET A configmap -------------------->

##### Get a configmap

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/configmaps/coredns/kube-system?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "coredns/kube-system",
    "apiVersion": "v1",
    "data": {
      "Corefile": ".:53 {\n    errors\n    health\n    kubernetes cluster.local in-addr.arpa ip6.arpa {\n      pods insecure\n      upstream\n      fallthrough in-addr.arpa ip6.arpa\n    }\n    prometheus :9153\n    forward . /etc/resolv.conf\n    cache 30\n    loop\n    reload\n    loadbalance\n    import custom/*.override\n}\nimport custom/*.server\n"
    },
    "kind": "ConfigMap",
    "metadata": {}
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/configmaps/:id?cluster_id=:cluster_id</code>

Retrieve a configmap and all its info in a given [environment](#administration-environments).

| Required                   | &nbsp;                                                |
| -------------------------- | ----------------------------------------------------- |
| `cluster_id` <br/>_string_ | The id of the cluster in which to get the config map. |

| Attributes                                 | &nbsp;                                             |
| ------------------------------------------ | -------------------------------------------------- |
| `id` <br/>_string_                         | The id of the config map                           |
| `apiVersion` <br/>_string_                 | The API version used to retrieve this config map   |
| `kind` <br/>_string_                       | The type of the returned resource. ie, ConfigMap   |
| `metadata` <br/>_object_                   | The metadata of the config map                     |
