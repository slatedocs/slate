## Namespaces

<!-------------------- LIST NAMESPACES -------------------->

### List namespaces

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/namespaces"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "auth",
      "metadata": {},
      "spec": {},
      "status": {}
    }
  ],
  "metadata": {
    "recordCount": 3
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/namespaces</code>

Retrieve a list of all namespaces in a given [environment](#administration-environments).

| Attributes                     | &nbsp;                                                                                    |
| ------------------------------ | ----------------------------------------------------------------------------------------- |
| `id` <br/>_string_             | The id of the namespace.                                                                  |
| `metadata` <br/>_object_       | The metadata of the namespace.                                                            |
| `spec`<br/>_object_            | The specification describes the attributes on a namespace.                                |
| `status`<br/>_object_          | The status information of the namespace.                                                  |

<!-------------------- GET A NAMESPACE -------------------->

### Get a namespace

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/namespaces/cert-manager"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "cert-manager",
    "apiVersion": "v1",
    "kind": "Namespace",
    "metadata": {},
    "spec": {},
    "status": {}
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/namespaces/:id</code>

Retrieve a namespace and all its info in a given [environment](#administration-environments).

| Attributes                 | &nbsp;                                                                                |
| -------------------------- | ------------------------------------------------------------------------------------- |
| `id` <br/>_string_         | The id of the namespace.                                                              |
| `apiVersion` <br/>_string_ | APIVersion defines the versioned schema of this representation of a namespace object. |
| `kind`<br/>_string_        | The string value of the REST resource that this object represents.                    |
| `metadata` <br/>_object_   | The metadata of the namespace.                                                        |
| `spec`<br/>_object_        | The specification describes the attributes on a namespace.                            |
| `status`<br/>_object_      | The status information of the namespace.                                              |
