#### Config Maps

<!-------------------- LIST CONFIG MAPS -------------------->

##### List config maps

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/configmaps?cluster_id=a_cluster_id"
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

| Attributes                 | &nbsp;                                            |
| -------------------------- | ------------------------------------------------- |
| `id` <br/>_string_         | The id of the config map.                         |
| `apiVersion` <br/>_string_ | The API version used to retrieve this config map. |
| `metadata` <br/>_object_   | The metadata of the config map.                   |

<!-------------------- GET A CONFIG MAP -------------------->

##### Get a config map

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/configmaps/coredns/kube-system?cluster_id=a_cluster_id"
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

Retrieve a config map and all its info in a given [environment](#administration-environments).

| Required                   | &nbsp;                                                |
| -------------------------- | ----------------------------------------------------- |
| `cluster_id` <br/>_string_ | The id of the cluster in which to get the config map. |

| Attributes                 | &nbsp;                                            |
| -------------------------- | ------------------------------------------------- |
| `id` <br/>_string_         | The id of the config map.                         |
| `apiVersion` <br/>_string_ | The API version used to retrieve this config map. |
| `metadata` <br/>_object_   | The metadata of the config map.                   |

<!-------------------- CREATE A CONFIG MAP -------------------->

##### Create a config map

```shell
curl -X POST \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/configmaps?cluster_id=:cluster_id"
  Content-Type: application/json
  {
  "apiVersion": "v1",
  "kind": "ConfigMap",
  "metadata": {
    "name": "game-demo"
  },
  "data": {
    "player_initial_lives": "3",
    "ui_properties_file_name": "user-interface.properties",
    "game.properties": "enemy.types=aliens,monsters\nplayer.maximum-lives=5\n",
    "user-interface.properties": "color.good=purple\ncolor.bad=yellow\nallow.textmode=true\n"
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

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/configmaps?cluster_id=:cluster_id</code>

Create a config map in a given [environment](#administration-environments).

| Required Attributes           | &nbsp;                                                                   |
| ----------------------------- | ------------------------------------------------------------------------ |
| `cluster_id` <br/>_string_    | The id of the cluster in which to create the config map.                 |
| `apiVersion` <br/> _string_   | The api version (versioned schema) of the config map.                    |
| `metadata` <br/>_object_      | The metadata of the config map.                                          |
| `metadata.name` <br/>_string_ | The name of the config map.                                              |
| `data`<br/>_object_           | The non-confidential data (in key-value pairs) stored in the config map. |

| Optional Attributes                | &nbsp;                                           |
| ---------------------------------- | ------------------------------------------------ |
| `metadata.namespace` <br/>_string_ | The namespace in which the config map is created |

Return value:

| Attributes                 | &nbsp;                                               |
| -------------------------- | ---------------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the create config maps task. |
| `taskStatus` <br/>_string_ | The status of the operation.                         |

<!-------------------- REPLACE A CONFIG MAP -------------------->

##### Replace a config map

```shell
curl -X PUT \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/configmaps/game-demo/default?cluster_id=:cluster_id"
  Content-Type: application/json
  {
  "apiVersion": "v1",
  "kind": "ConfigMap",
  "metadata": {
    "name": "game-demo",
    "namespace": "default"
  },
  "data": {
    "player_initial_lives": "5",
    "ui_properties_file_name": "user-interface.properties",
    "game.properties": "enemy.types=aliens,monsters\nplayer.maximum-lives=5\n",
    "user-interface.properties": "color.good=purple\ncolor.bad=yellow\nallow.textmode=true\n"
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

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/configmaps/:id?cluster_id=:cluster_id</code>

Replace a config map in a given [environment](#administration-environments).

| Required Attributes           | &nbsp;                                                                   |
| ----------------------------- | ------------------------------------------------------------------------ |
| `cluster_id` <br/>_string_    | The id of the cluster in which to replace the config map.                |
| `apiVersion` <br/> _string_   | The api version (versioned schema) of the config map.                    |
| `metadata` <br/>_object_      | The metadata of the config map.                                          |
| `metadata.name` <br/>_string_ | The name of the config map.                                              |
| `data`<br/>_object_           | The non-confidential data (in key-value pairs) stored in the config map. |

| Optional Attributes                | &nbsp;                                             |
| ---------------------------------- | -------------------------------------------------- |
| `metadata.namespace` <br/>_string_ | The namespace in which the config map is replaced. |

Return value:

| Attributes                 | &nbsp;                                                |
| -------------------------- | ----------------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the replace config maps task. |
| `taskStatus` <br/>_string_ | The status of the operation.                          |

<!-------------------- DELETE A CONFIG MAP -------------------->

##### Delete a config map

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/configmaps/cert-manager-cainjector-leader-election/kube-system?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "1542bd45-4732-419b-87b6-4ea6ec695c2b",
  "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/configmaps/:id?cluster_id=:cluster_id</code>

Delete a config map from a given [environment](#administration-environments).

| Required                   | &nbsp;                                                   |
| -------------------------- | -------------------------------------------------------- |
| `cluster_id` <br/>_string_ | The id of the cluster in which to delete the config map. |

| Attributes                 | &nbsp;                                              |
| -------------------------- | --------------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the delete config map task. |
| `taskStatus` <br/>_string_ | The status of the operation.                        |
