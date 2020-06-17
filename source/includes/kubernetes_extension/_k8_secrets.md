### Secrets

<!-------------------- LIST Secrets -------------------->

#### List secrets

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/secrets?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "default-token-xxxmt/default",
      "apiVersion": "v1",
      "data": {
        "ca.crt": [],
        "namespace": [],
        "token": []
      },
      "kind": "Secret",
      "metadata": {},
      "type": "kubernetes.io/service-account-token"
    }
  ],
  "metadata": {
    "recordCount": 100
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/secrets?cluster_id=:cluster_id</code>

Retrieve a list of all secrets in a given [environment](#administration-environments).

| Required                   | &nbsp;                                              |
| -------------------------- | --------------------------------------------------- |
| `cluster_id` <br/>_string_ | The id of the cluster in which to list the secrets. |

| Attributes                 | &nbsp;                                                                     |
| -------------------------- | ---------------------------------------------------------------------------|
| `id` <br/>_string_         | The id of the secret.                                                      |
| `apiVersion` <br/>_string_ | The API version used to retrieve the secret.                               |
| `data` <br/>_string_       | The data that the secret contains.                                         |
| `metadata` <br/>_object_   | The metadata of the secret.                                                |
| `kind` <br/>_string_       | A string value representing the REST resource that this object represents. |
| `type` <br/>_string_       | A string used to facilitate programmatic handling of a secret's data.      |

<!-------------------- GET A secret -------------------->

#### Get a secret

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/secrets/default-token-xxxmt/default?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": "default-token-xxxmt/default",
        "apiVersion": "v1",
        "data": {
            "ca.crt": [],
            "namespace": [],
            "token": []
        },
        "kind": "Secret",
        "metadata": {},
        "type": "kubernetes.io/service-account-token"
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/secrets/:id?cluster_id=:cluster_id</code>

Retrieve a secret and all its info in a given [environment](#administration-environments).

| Required                   | &nbsp;                                            |
| -------------------------- | ------------------------------------------------- |
| `cluster_id` <br/>_string_ | The id of the cluster in which to get the secret. |

| Attributes                 | &nbsp;                                                                     |
| -------------------------- | ---------------------------------------------------------------------------|
| `id` <br/>_string_         | The id of the secret.                                                      |
| `apiVersion` <br/>_string_ | The API version used to retrieve the secret.                               |
| `data` <br/>_string_       | The data that the secret contains.                                         |
| `metadata` <br/>_object_   | The metadata of the secret.                                                |
| `kind` <br/>_string_       | A string value representing the REST resource that this object represents. |
| `type` <br/>_string_       | A string used to facilitate programmatic handling of a secret's data.      |
