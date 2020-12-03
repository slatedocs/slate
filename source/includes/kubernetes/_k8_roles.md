### Roles

<!-------------------- LIST ROLES -------------------->

#### List (namespace) Roles

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/roles"
```

> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "id": "role-id",
            "age": "1w4d",
            "metadata": {
                "creationTimestamp": "2020-09-18T10:01:26.000-04:00",
                "name": "kubeadm:bootstrap-signer-clusterinfo",
                "namespace": "kube-public",
                "uid": "57ef0321-e44a-43c9-9f2a-e448c3a66a46"
            },
            "rules": [
                {
                    "apiGroups": [],
                    "resourceNames": [],
                    "resources": [],
                    "verbs": []
                }
            ]
        }
    ],
    "metadata": {
        "recordCount": 1
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/roles</code>

Retrieve a list of all roles in a given [environment](#administration-environments).

| Attributes                                 | &nbsp;                                                                                       |
| ------------------------------------------ | -------------------------------------------------------------------------------------------- |
| `id` <br/>_string_                         | The id of the role.|
| `metadata` <br/>_object_                   | The metadata of the role.|
| `metadata.creationTimestamp` <br/>_string_ | The date of creation of the service account as a string.|
| `metadata.name` <br/>_string_              | The name of the role.|
| `metadata.namespace` <br/>_string_         | The namespace in which the role is created.|
| `metadata.uid` <br/>_object_               | The UUID of the role.|
| `rules` <br/>_array_               | The array of rules associated with this role.|

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- GET A ROLE -------------------->

#### Get a role

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/roles/role-name/role-namespace"
```

> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": "kubeadm:bootstrap-signer-clusterinfo",
        "age": "1w4d",
        "apiVersion": "rbac.authorization.k8s.io/v1",
        "kind": "Role",
        "metadata": {
            "creationTimestamp": "2020-09-18T10:01:26.000-04:00",
            "name": "kubeadm:bootstrap-signer-clusterinfo",
            "namespace": "kube-public",
            "uid": "57ef0321-e44a-43c9-9f2a-e448c3a66a47"
        },
        "rules": [
            {
                "apiGroups": [],
                "resourceNames": [],
                "resources": [],
                "verbs": []
            }
        ]
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/roles/:id</code>

Retrieve a role and all its info in a given [environment](#administration-environments).

| Attributes                 | &nbsp;                                            |
| -------------------------- | ------------------------------------------------- |
| `id` <br/>_string_         | The id of the role.                          |
| `apiVersion` <br/>_string_ | The API version used to retrieve this role.  |
| `metadata` <br/>_object_   | The metadata of the role.                    |
| `rules` <br/>_array_       | The array of rules associated with this role.|

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- CREATE ROLE -------------------->

#### Create a role

```shell
curl -X POST \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/roles"
  Content-Type: application/json
  {
   "apiVersion": "rbac.authorization.k8s.io/v1",
   "kind": "Role",
   "namespace": "default",
   "name": "test-name",
   "metadata": {
      "namespace": "default",
      "name": "test-name"
   },
   "rules": [
      {
         "apiGroups": [
            ""
         ],
         "resources": [
            "resource"
         ],
         "verbs": [
            "get",
            "watch"
         ]
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

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/roles</code>

Create a role in a given [environment](#administration-environments).

| Attributes                 | &nbsp;                                            |
| -------------------------- | ------------------------------------------------- |
| `id` <br/>_string_         | The id of the role.                          |
| `apiVersion` <br/>_string_ | The API version used to create this role.  |
| `metadata.name` <br/>_string_   | The name of the role.                    |
| `metadata.namespace` <br/>_string_   | The namespace of the role.                    |
| `rules` <br/>_array_       | The array of rules associated with this role.|

Return value:

| Attributes                 | &nbsp;                                       |
| -------------------------- | -------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the create role task. |
| `taskStatus` <br/>_string_ | The status of the operation.                 |

<!-------------------- REPLACE ROLE -------------------->

#### Replace a role

```shell
curl -X PUT \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/roles/role-name/namespace-name?cluster_id=:cluster_id"
  Content-Type: application/json
  {
    "metadata": {
        "name": "role-name",
        "namespace": "namespace-name"
    }
    "rules": [
      {
         "apiGroups": [
            ""
         ],
         "resources": [
            "resource"
         ],
         "verbs": [
            "get",
            "watch",
            "..."
         ]
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

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/roles/:id?cluster_id=:cluster_id</code>

Replace a role in a given [environment](#administration-environments).

| Required Attributes                 | &nbsp;                                                      |
| ----------------------------------- | ----------------------------------------------------------- |
| `metadata` <br/>_object_            | The metadata of the role.                                     |
| `metadata.name` <br/>_string_       | The name of the role.                                         |
| `metadata.namespace` <br/>_string_       | The namespace of the role.                                         |
| `metadata.namespace` <br/>_string_       | The namespace of the role.                                         |

| Optional Attributes                 | &nbsp;                                                      |
| ----------------------------------- | ----------------------------------------------------------- |
| `rules` <br/>_array_       | The array of rules associated with this role.|

Return value:

| Attributes                 | &nbsp;                                       |
| -------------------------- | -------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the replace role operation. |
| `taskStatus` <br/>_string_ | The status of the operation.                 |


<!-------------------- DELETE A ROLE -------------------->

#### Delete a role

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/roles/default-token-xxxmt/default"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "1542bd45-4732-419b-87b6-4ea6ec695c2b",
  "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/roles/:id</code>

Delete a roles from a given [environment](#administration-environments).

| Attributes                 | &nbsp;                                          |
| -------------------------- | ----------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the delete role task. |
| `taskStatus` <br/>_string_ | The status of the operation.                    |
