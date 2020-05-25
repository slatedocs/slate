## Namespaces


<!-------------------- LIST NAMESPACES -------------------->

### List namespaces

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/k8s/anenvironment/namespaces"
```
> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "auth",
      "metadata": {
        "creationTimestamp": "2019-06-06T16:55:32.000-04:00",
        "name": "auth",
        "resourceVersion": "17516456",
        "selfLink": "/api/v1/namespaces/auth",
        "uid": "6cd793ae-889d-11e9-95db-02007a9a453g"
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
    {
      "id": "cert-manager",
      "metadata": {
        "annotations": {
          "kubectl.kubernetes.io/last-applied-configuration": "{\"apiVersion\":\"v1\",\"kind\":\"Namespace\",\"metadata\":{\"annotations\":{},\"name\":\"cert-manager\"}}\n"
        },
        "creationTimestamp": "2020-04-24T15:06:10.000-04:00",
        "name": "cert-manager",
        "resourceVersion": "110011696",
        "selfLink": "/api/v1/namespaces/cert-manager",
        "uid": "ab4376c2-bb6d-44ae-a576-hdyr45839djs"
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
    {
      "id": "lab",
      "metadata": {
        "creationTimestamp": "2019-07-10T16:51:13.000-04:00",
        "name": "lab",
        "resourceVersion": "25347372",
        "selfLink": "/api/v1/namespaces/lab",
        "uid": "74716eb1-a354-11e9-8c9b-1029384wedad"
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
  ],
  "metadata": {
    "recordCount": 3
  }
}
```



<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/namespaces</code>

Retrieve a list of all namespaces in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id` <br/>*string* | The id of the namespace.  
`metadata` <br/>*object* | The metadata of the the namespace
`metadata.annotations` <br/>*map* | The annotations of the namespace
`metadata.creationTimestamp` <br/>*string* | The date of creation of the namespace as a string
`metadata.name` <br/>*string* | The name of the namespace
`metadata.resourceVersion` <br/>*string* | An opaque value that represents the internal version of namespace object
`metadata.selfLink` <br/>*string* | A URL representing the namespace object
`metadata.uid` <br/>*object* | The UUID of the namespace
`spec`<br/>*object* | The specification describes the attributes on a namespace.
`spec.finalizers`<br/>*string* | An opaque list of values that must be empty to permanently remove object from storage
`status`<br/>*object* | The status information of the namespace
`status.phase`<br/>*string* | The status of the namespace. Possible statuses are Active, Terminating and Unknown



<!-------------------- GET A NAMESPACE -------------------->

### Get a namespace

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/k8s/anenvironment/namespaces/cert-manager"
```
> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "cert-manager",
    "apiVersion": "v1",
    "kind": "Namespace",
    "metadata": {
      "annotations": {
        "kubectl.kubernetes.io/last-applied-configuration": "{\"apiVersion\":\"v1\",\"kind\":\"Namespace\",\"metadata\":{\"annotations\":{},\"name\":\"cert-manager\"}}\n"
      },
      "creationTimestamp": "2020-04-24T15:06:10.000-04:00",
      "name": "cert-manager",
      "resourceVersion": "110011696",
      "selfLink": "/api/v1/namespaces/cert-manager",
      "uid": "ab4376c2-bb6d-44ae-a576-f9b24f2ea624"
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



<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/namespaces/:id</code>

Retrieve a namespace and all its info in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id` <br/>*string* | The id of the namespace.
`apiVersion` <br/>*string* | APIVersion defines the versioned schema of this representation of a namespace object
`kind` <br/>*string* | A string value representing the REST resource this object represents
`metadata` <br/>*object* | The metadata of the the namespace
`metadata.annotations` <br/>*map* | The annotations of the namespace
`metadata.creationTimestamp` <br/>*string* | The date of creation of the namespace as a string
`metadata.name` <br/>*string* | The name of the namespace
`metadata.resourceVersion` <br/>*string* | An opaque value that represents the internal version of namespace object
`metadata.selfLink` <br/>*string* | A URL representing the namespace object
`metadata.uid` <br/>*object* | The UUID of the namespace
`spec`<br/>*object* | The specification describes the attributes on a namespace.
`spec.finalizers`<br/>*string* | An opaque list of values that must be empty to permanently remove object from storage
`status`<br/>*object* | The status information of the namespace
`status.phase`<br/>*string* | The status of the namespace. Possible statuses are Active, Terminating and Unknown