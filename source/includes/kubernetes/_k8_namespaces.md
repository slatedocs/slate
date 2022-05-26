## Namespaces

<!-------------------- LIST NAMESPACES -------------------->

### List namespaces

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/namespaces"
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
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/namespaces/cert-manager"
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
| `metadata` <br/>_object_   | The metadata of the namespace.                                                        |
| `spec`<br/>_object_        | The specification describes the attributes on a namespace.                            |
| `status`<br/>_object_      | The status information of the namespace.                                              |

<!-------------------- CREATE A NAMESPACE -------------------->

### Create a namespace

```shell
curl -X POST \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/namespaces"
  Content-Type: application/json
  {
  "apiVersion": "v1",
  "kind": "Namespace",
  "metadata": {
    "name": "test-namespace"
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

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/namespaces</code>

Create a namespace in a given [environment](#administration-environments).

| Required Attributes           | &nbsp;                                               |
| ----------------------------- | ---------------------------------------------------- |
| `apiVersion` <br/> _string_   | The api version (versioned schema) of the namespace. |
| `metadata` <br/>_object_      | The metadata of the namespace.                       |
| `metadata.name` <br/>_string_ | The name of the namespace.                           |

Return value:

| Attributes                 | &nbsp;                                             |
| -------------------------- | -------------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the create namespace task. |
| `taskStatus` <br/>_string_ | The status of the operation.                       |

<!-------------------- DELETE A NAMESPACE -------------------->

### Delete a namespace

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/namespaces/test-namespace"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "1542bd45-4732-419b-87b6-4ea6ec695c2b",
  "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/namespaces/:id</code>

Delete a namespace from a given [environment](#administration-environments).

| Attributes                 | &nbsp;                                              |
| -------------------------- | --------------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the delete namespaces task. |
| `taskStatus` <br/>_string_ | The status of the operation.                        |
