### Storage Classes

<!-------------------- LIST Storage classes -------------------->

#### List storage classes

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/storageclasses?cluster_id=a_cluster_id"
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

| Attributes                           | &nbsp;                                                                                                                                      |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `id` <br/>_string_                   | The id of the storage class. This is the name of the resource                                                                               |
| `isDefault` <br/>_boolean_           | Whether or not the storage class is the default one                                                                                         |
| `allowVolumExpansion` <br/>_boolean_ | Whether not the storage class allows for expandeable volumes                                                                                |
| `metadata` <br/>_object_             | The metadata of the storage class.                                                                                                          |
| `parameters` <br/>_object_           | The parameters for the storage provisioner. These are storage provisioner specific and you will likely have to read external documentation. |
| `provisioner` <br/>_string_          | The provsioner for the storage class                                                                                                        |
| `reclaimPolicy` <br/>_string_        | The default volume reclaim policy for this storage class. You have a choice between `Reclaim` or `Delete`.                                  |
| `volumeBindingMode` <br/>_string_    | The default volume binding model for this storage class. You have a choice between `Immediate` or `WaitForFirstConsumer`.                   |
<!-------------------- GET A storage class -------------------->

#### Get a storage class

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/storageclasses/rook-ceph-block?cluster_id=a_cluster_id"
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

| Attributes                           | &nbsp;                                                                                                                                      |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `id` <br/>_string_                   | The id of the storage class. This is the name of the resource                                                                               |
| `isDefault` <br/>_boolean_           | Whether or not the storage class is the default one                                                                                         |
| `allowVolumExpansion` <br/>_boolean_ | Whether not the storage class allows for expandeable volumes                                                                                |
| `metadata` <br/>_object_             | The metadata of the storage class.                                                                                                          |
| `parameters` <br/>_object_           | The parameters for the storage provisioner. These are storage provisioner specific and you will likely have to read external documentation. |
| `provisioner` <br/>_string_          | The provsioner for the storage class                                                                                                        |
| `reclaimPolicy` <br/>_string_        | The default volume reclaim policy for this storage class. You have a choice between `Reclaim` or `Delete`.                                  |
| `volumeBindingMode` <br/>_string_    | The default volume binding model for this storage class. You have a choice between `Immediate` or `WaitForFirstConsumer`.                   |