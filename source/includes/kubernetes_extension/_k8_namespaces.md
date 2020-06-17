### Namespaces

<!-------------------- LIST NAMESPACES -------------------->

#### List namespaces

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/namespaces?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "id": "default",
            "metadata": {
                "creationTimestamp": "2020-06-15T16:14:16.000-04:00",
                "name": "default",
                "resourceVersion": "42",
                "selfLink": "/api/v1/namespaces/default",
                "uid": "74fa5ce7-4537-45d8-a683-e73f8772f785"
            },
            "spec": {
                "finalizers": [
                    "kubernetes"
                ]
            },
            "status": {
                "phase": "Active"
            }
        },
        ...
    ],
    "metadata": {
        "recordCount": 4
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/namespaces?cluster_id=:cluster_id</code>

Retrieve a list of all namespaces in a given [environment](#administration-environments).

| Required                   | &nbsp;                                                 |
|----------------------------|--------------------------------------------------------|
| `cluster_id` <br/>*string* | The id of the cluster in which to list the namespaces. |

| Attributes                                 | &nbsp;                                                                                    |
|--------------------------------------------|-------------------------------------------------------------------------------------------|
| `id` <br/>*string*                         | The id of the namespace.                                                                  |
| `apiVersion` <br/>*string*                 | APIVersion defines the versioned schema of this representation of a namespace object      |
| `kind` <br/>*string*                       | A string value representing the REST resource this object represents                      |
| `metadata` <br/>*object*                   | The metadata of the namespace                                                             |
| `metadata.annotations` <br/>*map*          | The annotations of the namespace                                                          |
| `metadata.creationTimestamp` <br/>*string* | The date of creation of the namespace as a string                                         |
| `metadata.name` <br/>*string*              | The name of the namespace                                                                 |
| `metadata.resourceVersion` <br/>*string*   | An opaque value that represents the internal version of the namespace object              |
| `metadata.selfLink` <br/>*string*          | A URL representing the namespace object                                                   |
| `metadata.uid` <br/>*object*               | The UUID of the namespace                                                                 |
| `spec`<br/>*object*                        | The specification describes the attributes on a namespace.                                |
| `spec.finalizers`<br/>*string*             | An opaque list of values that must be empty to permanently remove the object from storage |
| `status`<br/>*object*                      | The status information of the namespace                                                   |
| `status.phase`<br/>*string*                | The status of the namespace. Possible statuses are `Active`, `Terminating` and `Unknown`  |

<!-------------------- GET A NAMESPACE -------------------->

#### Get a namespace

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/namespaces/cert-manager?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": "default",
        "apiVersion": "v1",
        "kind": "Namespace",
        "metadata": {
            "creationTimestamp": "2020-06-15T16:14:16.000-04:00",
            "name": "default",
            "resourceVersion": "42",
            "selfLink": "/api/v1/namespaces/default",
            "uid": "74fa5ce7-4537-45d8-a683-e73f8772f785"
        },
        "spec": {
            "finalizers": [
                "kubernetes"
            ]
        },
        "status": {
            "phase": "Active"
        }
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/namespaces/:id?cluster_id=:cluster_id</code>

Retrieve a namespace and all its info in a given [environment](#administration-environments).

| Required                   | &nbsp;                                               |
|----------------------------|------------------------------------------------------|
| `cluster_id` <br/>*string* | The id of the cluster in which to get the namespace. |

| Attributes                                 | &nbsp;                                                                                    |
|--------------------------------------------|-------------------------------------------------------------------------------------------|
| `id` <br/>*string*                         | The id of the namespace.                                                                  |
| `apiVersion` <br/>*string*                 | APIVersion defines the versioned schema of this representation of a namespace object      |
| `kind` <br/>*string*                       | A string value representing the REST resource this object represents                      |
| `metadata` <br/>*object*                   | The metadata of the namespace                                                             |
| `metadata.annotations` <br/>*map*          | The annotations of the namespace                                                          |
| `metadata.creationTimestamp` <br/>*string* | The date of creation of the namespace as a string                                         |
| `metadata.name` <br/>*string*              | The name of the namespace                                                                 |
| `metadata.resourceVersion` <br/>*string*   | An opaque value that represents the internal version of the namespace object              |
| `metadata.selfLink` <br/>*string*          | A URL representing the namespace object                                                   |
| `metadata.uid` <br/>*object*               | The UUID of the namespace                                                                 |
| `spec`<br/>*object*                        | The specification describes the attributes on a namespace.                                |
| `spec.finalizers`<br/>*string*             | An opaque list of values that must be empty to permanently remove the object from storage |
| `status`<br/>*object*                      | The status information of the namespace                                                   |
| `status.phase`<br/>*string*                | The status of the namespace. Possible statuses are `Active`, `Terminating` and `Unknown`  |
