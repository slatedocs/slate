#### Storage Classes

<!-------------------- LIST Storage classes -------------------->

##### List storage classes

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/storageclasses?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "rook-ceph-block",
      "isDefault": true,
      "allowVolumeExpansion": true,
      "metadata": {
        "annotations": {
          "storageclass.kubernetes.io/is-default-class": "true"
        },
        "creationTimestamp": "2020-04-20T16:08:54.000-04:00",
        "name": "rook-ceph-block",
        "resourceVersion": "107033002",
        "selfLink": "/apis/storage.k8s.io/v1/storageclasses/rook-ceph-block",
        "uid": "f289c0e6-3f20-4274-8cb8-5db8b34dece6"
      },
      "parameters": {
        "clusterID": "rook-ceph",
        "csi.storage.k8s.io/controller-expand-secret-name": "rook-csi-rbd-provisioner",
        "csi.storage.k8s.io/controller-expand-secret-namespace": "rook-ceph",
        "csi.storage.k8s.io/fstype": "ext4",
        "csi.storage.k8s.io/node-stage-secret-name": "rook-csi-rbd-node",
        "csi.storage.k8s.io/node-stage-secret-namespace": "rook-ceph",
        "csi.storage.k8s.io/provisioner-secret-name": "rook-csi-rbd-provisioner",
        "csi.storage.k8s.io/provisioner-secret-namespace": "rook-ceph",
        "imageFeatures": "layering",
        "imageFormat": "2",
        "pool": "replicapool"
      },
      "provisioner": "rook-ceph.rbd.csi.ceph.com",
      "reclaimPolicy": "Delete",
      "volumeBindingMode": "Immediate"
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/storageclasses?cluster_id=:cluster_id</code>

Retrieve a list of all storage classes in a given [environment](#administration-environments).

| Required                   | &nbsp;                                                      |
| -------------------------- | ----------------------------------------------------------- |
| `cluster_id` <br/>_string_ | The id of the cluster in which to list the storage classes. |

| Attributes                            | &nbsp;                                                                                                                                      |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `id` <br/>_string_                    | The id of the storage class. This is the name of the resource.                                                                              |
| `isDefault` <br/>_boolean_            | Whether or not the storage class is the default one.                                                                                        |
| `allowVolumeExpansion` <br/>_boolean_ | Whether not the storage class allows for expandable volumes.                                                                                |
| `metadata` <br/>_object_              | The metadata of the storage class.                                                                                                          |
| `parameters` <br/>_object_            | The parameters for the storage provisioner. These are storage provisioner specific and you will likely have to read external documentation. |
| `provisioner` <br/>_string_           | The provisioner for the storage class.                                                                                                      |
| `reclaimPolicy` <br/>_string_         | The default volume reclaim policy for this storage class. You have a choice between `Reclaim` or `Delete`.                                  |
| `volumeBindingMode` <br/>_string_     | The default volume binding model for this storage class. You have a choice between `Immediate` or `WaitForFirstConsumer`.                   |

<!-------------------- GET A storage class -------------------->

##### Get a storage class

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/storageclasses/rook-ceph-block?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "rook-ceph-block",
    "isDefault": true,
    "allowVolumeExpansion": true,
    "metadata": {
      "annotations": {
        "storageclass.kubernetes.io/is-default-class": "true"
      },
      "creationTimestamp": "2020-04-20T16:08:54.000-04:00",
      "name": "rook-ceph-block",
      "resourceVersion": "107033002",
      "selfLink": "/apis/storage.k8s.io/v1/storageclasses/rook-ceph-block",
      "uid": "f289c0e6-3f20-4274-8cb8-5db8b34dece6"
    },
    "parameters": {
      "clusterID": "rook-ceph",
      "csi.storage.k8s.io/controller-expand-secret-name": "rook-csi-rbd-provisioner",
      "csi.storage.k8s.io/controller-expand-secret-namespace": "rook-ceph",
      "csi.storage.k8s.io/fstype": "ext4",
      "csi.storage.k8s.io/node-stage-secret-name": "rook-csi-rbd-node",
      "csi.storage.k8s.io/node-stage-secret-namespace": "rook-ceph",
      "csi.storage.k8s.io/provisioner-secret-name": "rook-csi-rbd-provisioner",
      "csi.storage.k8s.io/provisioner-secret-namespace": "rook-ceph",
      "imageFeatures": "layering",
      "imageFormat": "2",
      "pool": "replicapool"
    },
    "provisioner": "rook-ceph.rbd.csi.ceph.com",
    "reclaimPolicy": "Delete",
    "volumeBindingMode": "Immediate"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/storageclasses/:id?cluster_id=:cluster_id</code>

Retrieve a storage class and all its info in a given [environment](#administration-environments).

| Required                   | &nbsp;                                                      |
| -------------------------- | ----------------------------------------------------------- |
| `cluster_id` <br/>_string_ | The id of the cluster in which to list the storage classes. |

| Attributes                            | &nbsp;                                                                                                                                      |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `id` <br/>_string_                    | The id of the storage class. This is the name of the resource                                                                               |
| `isDefault` <br/>_boolean_            | Whether or not the storage class is the default one                                                                                         |
| `allowVolumeExpansion` <br/>_boolean_ | Whether not the storage class allows for expandable volumes.                                                                                |
| `metadata` <br/>_object_              | The metadata of the storage class.                                                                                                          |
| `parameters` <br/>_object_            | The parameters for the storage provisioner. These are storage provisioner specific and you will likely have to read external documentation. |
| `provisioner` <br/>_string_           | The provisioner for the storage class                                                                                                       |
| `reclaimPolicy` <br/>_string_         | The default volume reclaim policy for this storage class. You have a choice between `Reclaim` or `Delete`.                                  |
| `volumeBindingMode` <br/>_string_     | The default volume binding model for this storage class. You have a choice between `Immediate` or `WaitForFirstConsumer`.                   |

<!-------------------- CREATE A storage class -------------------->

##### Create a storage class

```shell
curl -X POST \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/storageclasses?cluster_id=a_cluster_id"
  Content-Type: application/json
  {
  "apiVersion": "storage.k8s.io/v1",
  "kind": "StorageClass",
  "metadata": {
    "name": "local-storage-name"
  },
  "provisioner": "kubernetes.io/no-provisioner",
  "volumeBindingMode": "WaitForFirstConsumer"
}
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "1542bd45-4732-419b-87b6-4ea6ec695c2b",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/storageclasses?cluster_id=:cluster_id</code>

Create a storage class in a given [environment](#administration-environments).

| Required Attributes               | &nbsp;                                                                                                                    |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `apiVersion` <br/> _string_       | The api version (versioned schema) of the storage class.                                                                  |
| `metadata` <br/>_object_          | The metadata of the storage class.                                                                                        |
| `metadata.name` <br/>_string_     | The name of the storage class.                                                                                            |
| `provisioner` <br/>_string_       | The provisioner for the storage class                                                                                     |
| `volumeBindingMode` <br/>_string_ | The default volume binding model for this storage class. You have a choice between `Immediate` or `WaitForFirstConsumer`. |

| Optional Attributes                   | &nbsp;                                                                                                                                      |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `reclaimPolicy` <br/>_string_         | The default volume reclaim policy for this storage class. You have a choice between `Reclaim` or `Delete`.                                  |
| `parameters` <br/>_object_            | The parameters for the storage provisioner. These are storage provisioner specific and you will likely have to read external documentation. |
| `allowVolumeExpansion` <br/>_boolean_ | Whether not the storage class allows for expandable volumes.                                                                                |

Return value:

| Attributes                 | &nbsp;                                                |
| -------------------------- | ----------------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the create stateful set task. |
| `taskStatus` <br/>_string_ | The status of the operation.                          |

<!-------------------- REPLACE STORAGE CLASS -------------------->

##### Replace a storage class

```shell
curl -X PUT \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/storageclasses/rook-ceph-block?cluster_id=a_cluster_id"
  Content-Type: application/json
  {
    "apiVersion": "storage.k8s.io/v1",
    "metadata": {
        "name": "hostpath"
    },
    "provisioner": "docker.io/hostpath"
}
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "1542bd45-4732-419b-87b6-4ea6ec695c2b",
  "taskStatus": "PENDING"
}
```

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/storageclasses/:id?cluster_id=:cluster_id</code>

Replace a storage class in a given [environment](#administration-environments).

Required Attributes                 | &nbsp;
----------------------------------- | ------------------------------------------------------------
`apiVersion` <br/>_string_          | The api version (versioned schema) of the storage class.
`metadata` <br/>_object_            | The metadata of the storage class.
`metadata.name` <br/>_string_       | The name of the storage class.
`provisioner`<br/>_object_          | The type of provisioner.

| Optional Attributes                       | &nbsp;                                                                  |
| ----------------------------------------- | ----------------------------------------------------------------------- |
| `reclaimPolicy` <br/>_string_        | Dynamically provisioned PersistentVolumes of this storage class are created with this reclaimPolicy. Defaults to Delete.|

Note that the list is not complete, since it is refering to the [kubernetes api details](https://kubernetes.io/docs/reference/generated/kubernetes-api/v2.19/#storageclass-v1-storage-k8s-io).

Return value:

| Attributes                 | &nbsp;                                       |
| -------------------------- | -------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the replace storage class task.|
| `taskStatus` <br/>_string_ | The status of the operation.                 |

<!-------------------- DELETE A storage class -------------------->

##### Delete a storage class

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/storageclasses/rook-ceph-block?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "1542bd45-4732-419b-87b6-4ea6ec695c2b",
  "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/storageclasses/:id?cluster_id=:cluster_id</code>

Delete a storage class from a given [environment](#administration-environments).

| Required                   | &nbsp;                                                   |
| -------------------------- | -------------------------------------------------------- |
| `cluster_id` <br/>_string_ | The id of the cluster in which to get the storage class. |

| Attributes                 | &nbsp;                                                 |
| -------------------------- | ------------------------------------------------------ |
| `taskId` <br/>_string_     | The id corresponding to the delete storage class task. |
| `taskStatus` <br/>_string_ | The status of the operation.                           |
