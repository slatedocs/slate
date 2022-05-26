### Role bindings

<!-------------------- LIST ROLE BINDINGS -------------------->

#### List role bindings

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/rolebindings"
```

> The above command returns a JSON structured like this:

```json
{

    "data": {
        "entity": {
          "id": "kubeadm:bootstrap-signer-clusterinfo",
          "age": "1w5d",
          "metadata": {
            "creationTimestamp": "2020-09-18T10:46:32.000-04:00",
            "name": "kubeadm:bootstrap-signer-clusterinfo",
            "namespace": "kube-public",
            "uid": "4fcfe5b9-a1c3-4b3b-9cb6-6df4a1da945f"
          },
          "roleRef": {
            "apiGroup": "rbac.authorization.k8s.io",
            "kind": "Role",
            "name": "kubeadm:bootstrap-signer-clusterinfo"
          },
          "subjects": [
            {
              "apiGroup": "rbac.authorization.k8s.io",
              "kind": "User",
              "name": "system:anonymous"
            }
          ]
        },
        "fieldTransitions": {},
        "operations": []
      },
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/rolebindings</code>

Retrieve a list of all role bindings in a given [environment](#administration-environments).

| Attributes                                 | &nbsp;                                                                                       |
| ------------------------------------------ | -------------------------------------------------------------------------------------------- |
| `id` <br/>_string_                         | The id of the role binding.                                                               |                                                    |
| `metadata` <br/>_object_                   | The metadata of the role binding.                                                         |
| `metadata.creationTimestamp` <br/>_string_ | The date of creation of the role binding as a string.                                     |
| `metadata.name` <br/>_string_              | The name of the role binding.                                                             |
| `metadata.namespace` <br/>_string_         | The namespace in which the role binding is created.                                       |
| `metadata.uid` <br/>_object_               | The UUID of the role binding.                                                          |       `subjects`<br/>_array_      | The array of subjects associated with this role binding.                                               |                                             |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- GET A ROLE BINDING -------------------->

#### Get a role binding

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/rolebindings/rolebinding-name/rolebinding-namespace"
```

> The above command returns a JSON structured like this:

```json
{

    "data": {

          "id": "kubeadm:bootstrap-signer-clusterinfo",
          "age": "1w5d",
          "metadata": {
            "creationTimestamp": "2020-09-18T10:46:32.000-04:00",
            "name": "kubeadm:bootstrap-signer-clusterinfo",
            "namespace": "kube-public",
            "uid": "4fcfe5b9-a1c3-4b3b-9cb6-6df4a1da945f"
          },
          "roleRef": {
            "apiGroup": "rbac.authorization.k8s.io",
            "kind": "Role",
            "name": "kubeadm:bootstrap-signer-clusterinfo"
          },
          "subjects": [
            {
              "apiGroup": "rbac.authorization.k8s.io",
              "kind": "User",
              "name": "system:anonymous"
            }
          ]
        },
        "fieldTransitions": {},
        "operations": []
      },
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/rolebindings/:id</code>

Retrieve a role binding and all its info in a given [environment](#administration-environments).

| Attributes                 | &nbsp;                                            |
| -------------------------- | ------------------------------------------------- |
| `id` <br/>_string_         | The id of the role binding.                          |
| `apiVersion` <br/>_string_ | The API version used to retrieve this role binding.  |
| `metadata` <br/>_object_   | The metadata of the role binding.                    |
| `subjects` <br/>_array_       | The array of subjects associated with this role binding.|

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- CREATE ROLE BINDING -------------------->

#### Create a role binding

```shell
curl -X POST \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/rolebindings"
  Content-Type: application/json
  {
    "kind": "Rolebinding",
    "metadata": {
        "name": "rolebinding-name",
        "namespace": "namespace-name"
    },
    "roleRef": {
        "apiGroup": "rbac.authorization.k8s.io",
        "kind": "Role",
        "name": "role-name"
    },
    "subjects": [
        {
            "kind": "ServiceAccount",
            "name": "service-account-name",
            "namespace": "service-account-namespace"
        },
        {
            "kind": "Group",
            "name": "group-name",
            "namespace": "group-namespace"
        },
        {
            "kind": "User",
            "name": "user-name",
        }

    ]
  }
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "1542bd45-4732-419b-87b6-4ea6ec695c2b",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/rolebindings</code>

Create a role binding in a given [environment](#administration-environments).

Required Attributes                 | &nbsp;
----------------------------------- | ------------------------------------------------------------
`metadata` <br/>_object_            | The metadata of the role binding.
`metadata.name` <br/>_string_       | The name of the role binding.
`metadata.namespace` <br/>_string_       | The namespace of the role binding.
`roleRef`<br/>_object_                 | The role to bind. Can reference a Role in the current namespace or a ClusterRole in the global namespace.
`subjects`<br/>_array_ | Subjects hold references to the objets the role applies to. Can be users, groups, or service accounts.

Return value:

| Attributes                 | &nbsp;                                       |
| -------------------------- | -------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the create role binding task. |
| `taskStatus` <br/>_string_ | The status of the operation.                 |

<!-------------------- REPLACE ROLE BINDING -------------------->

#### Replace a role binding

```shell
curl -X PUT \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/rolebindings/rolebinding-name/namespace-name"
  Content-Type: application/json
  {
    "metadata": {
        "name": "service-account-name",
        "namespace": "namespace-name"
    },
    "roleRef": {
      "apiGroup": "",
      "kind": "Role",
      "name": "role-name"
    },
    "subjects": [
      {
        "kind": "ServiceAccount",
        "name": "default",
        "namespace": "default"
      },
      {
        "kind": "user",
        "name": "user1",
      }
    ]
  }
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "1542bd45-4732-419b-87b6-4ea6ec695c2b",
  "taskStatus": "PENDING"
}
```

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/rolebindings/:id</code>

Replace a role binding in a given [environment](#administration-environments).

| Required Attributes                 | &nbsp;                                                      |
| ----------------------------------- | ----------------------------------------------------------- |
| `metadata` <br/>_object_            | The metadata of the role binding.|
| `metadata.name` <br/>_string_       | The name of the role binding.|
| `metadata.namespace` <br/>_string_       | The namespace of the role binding.|
|`roleRef`<br/>_object_                 | The role to bind. Can reference a Role in the current namespace or a ClusterRole in the global namespace.|
|`subjects`<br/>_array_ | Subjects hold references to the objets the role applies to. Can be users, groups, or service accounts.|

Return value:

| Attributes                 | &nbsp;                                       |
| -------------------------- | -------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the replace role binding operation.|
| `taskStatus` <br/>_string_ | The status of the operation.                 |

<!-------------------- DELETE ROLE BINDING -------------------->

#### Delete a role binding

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/rolebindings/default-token-xxxmt/default"
```

> The above command returns a JSON structured like this:
```json
{
  "taskId": "1542bd45-4732-419b-87b6-4ea6ec695c2b",
  "taskStatus": "PENDING"
}
```
<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/rolebindings/:id</code>

Delete a role binding from a given [environment](#administration-environments).

| Attributes                 | &nbsp;                                          |
| -------------------------- | ----------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the delete role binding task. |
| `taskStatus` <br/>_string_ | The status of the operation.                    |
