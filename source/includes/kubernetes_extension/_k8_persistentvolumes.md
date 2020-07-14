### Persistent volumes

<!-------------------- LIST Persistent volumes -------------------->

#### List persistent volumes

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/persistentvolumes?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "pvc-05097a93-120d-45d2-aaab-0f273849fccd",
      "metadata": {
        "annotations": {
          "pv.kubernetes.io/provisioned-by": "rook-ceph.rbd.csi.ceph.com"
        },
        "creationTimestamp": "2020-07-03T09:12:17.000-04:00",
        "finalizers": [
          "kubernetes.io/pv-protection"
        ],
        "name": "pvc-05097a93-120d-45d2-aaab-0f273849fccd",
        "resourceVersion": "147569183",
        "selfLink": "/api/v1/persistentvolumes/pvc-05097a93-120d-45d2-aaab-0f273849fccd",
        "uid": "2e20a8fb-d90c-4c39-acd8-7007f85e2d8e"
      },
      "spec": {
        "accessModes": [
          "ReadWriteOnce"
        ],
        "capacity": {
          "storage": "8Gi"
        },
        "claimRef": {
          "apiVersion": "v1",
          "kind": "PersistentVolumeClaim",
          "name": "data-cmc-cluster-zookeeper-1",
          "namespace": "cmc-kafka",
          "resourceVersion": "147569124",
          "uid": "05097a93-120d-45d2-aaab-0f273849fccd"
        },
        "csi": {
          "driver": "rook-ceph.rbd.csi.ceph.com",
          "fsType": "ext4",
          "nodeStageSecretRef": {
            "name": "rook-csi-rbd-node",
            "namespace": "rook-ceph"
          },
          "volumeAttributes": {
            "clusterID": "rook-ceph",
            "imageFeatures": "layering",
            "imageFormat": "2",
            "pool": "replicapool",
            "storage.kubernetes.io/csiProvisionerIdentity": "1593101040137-8081-rook-ceph.rbd.csi.ceph.com"
          },
          "volumeHandle": "0001-0009-rook-ceph-0000000000000001-d11d2a4d-bd2e-11ea-b56e-7a7db811cab1"
        },
        "persistentVolumeReclaimPolicy": "Delete",
        "storageClassName": "rook-ceph-block",
        "volumeMode": "Filesystem"
      },
      "status": {
        "phase": "Bound"
      }
    }
    ],
  "metadata": {
    "recordCount": 1
  }
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/persistentvolumes?cluster_id=:cluster_id</code>

Retrieve a list of all persistent volumes in a given [environment](#administration-environments).

| Required                   | &nbsp;                                                      |
| -------------------------- | ----------------------------------------------------------- |
| `cluster_id` <br/>_string_ | The id of the cluster in which to list the persistent volumes. |

| Attributes                            | &nbsp;                                                                                                                                      |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `id` <br/>_string_                    | The id of the persistent volume. This is the name of the resource.                                                                              |
| `metadata` <br/>_object_              | The metadata of the persistent volume.                                                                                                          |
| `parameters` <br/>_object_            | The parameters for the storage provisioner. These are storage provisioner specific and you will likely have to read external documentation. |
| `provisioner` <br/>_string_           | The provisioner for the storage class.                                                                                                      |
| `reclaimPolicy` <br/>_string_         | The default volume reclaim policy for this storage class. You have a choice between `Reclaim` or `Delete`.                                  |
| `volumeBindingMode` <br/>_string_     | The default volume binding model for this storage class. You have a choice between `Immediate` or `WaitForFirstConsumer`.                   |
| `status.phase` <br/>_string_     | Volume is in one of the following phases: `Available`, `Bound`, `Released` or `Failed`.                   |


<!-------------------- GET A persistent volume -------------------->

#### Get a persistent volume

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/persistentvolumes/rook-ceph-block?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
      "id": "pvc-05097a93-120d-45d2-aaab-0f273849fccd",
      "metadata": {
        "annotations": {
          "pv.kubernetes.io/provisioned-by": "rook-ceph.rbd.csi.ceph.com"
        },
        "creationTimestamp": "2020-07-03T09:12:17.000-04:00",
        "finalizers": [
          "kubernetes.io/pv-protection"
        ],
        "name": "pvc-05097a93-120d-45d2-aaab-0f273849fccd",
        "resourceVersion": "147569183",
        "selfLink": "/api/v1/persistentvolumes/pvc-05097a93-120d-45d2-aaab-0f273849fccd",
        "uid": "2e20a8fb-d90c-4c39-acd8-7007f85e2d8e"
      },
      "spec": {
        "accessModes": [
          "ReadWriteOnce"
        ],
        "capacity": {
          "storage": "8Gi"
        },
        "claimRef": {
          "apiVersion": "v1",
          "kind": "PersistentVolumeClaim",
          "name": "data-cmc-cluster-zookeeper-1",
          "namespace": "cmc-kafka",
          "resourceVersion": "147569124",
          "uid": "05097a93-120d-45d2-aaab-0f273849fccd"
        },
        "csi": {
          "driver": "rook-ceph.rbd.csi.ceph.com",
          "fsType": "ext4",
          "nodeStageSecretRef": {
            "name": "rook-csi-rbd-node",
            "namespace": "rook-ceph"
          },
          "volumeAttributes": {
            "clusterID": "rook-ceph",
            "imageFeatures": "layering",
            "imageFormat": "2",
            "pool": "replicapool",
            "storage.kubernetes.io/csiProvisionerIdentity": "1593101040137-8081-rook-ceph.rbd.csi.ceph.com"
          },
          "volumeHandle": "0001-0009-rook-ceph-0000000000000001-d11d2a4d-bd2e-11ea-b56e-7a7db811cab1"
        },
        "persistentVolumeReclaimPolicy": "Delete",
        "storageClassName": "rook-ceph-block",
        "volumeMode": "Filesystem"
      },
      "status": {
        "phase": "Bound"
      }
    }
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/persistentvolumes/:id?cluster_id=:cluster_id</code>

Retrieve a persistent volume and all its info in a given [environment](#administration-environments).

| Required                   | &nbsp;                                                      |
| -------------------------- | ----------------------------------------------------------- |
| `cluster_id` <br/>_string_ | The id of the cluster in which to get the persistent volume. |

| Attributes                            | &nbsp;                                                                                                                                      |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `id` <br/>_string_                    | The id of the storage class. This is the name of the resource                                                                               |
| `isDefault` <br/>_boolean_            | Whether or not the storage class is the default one                                                                                         |
| `allowVolumeExpansion` <br/>_boolean_ | Whether not the storage class allows for expandable volumes.                                                                                |
| `metadata` <br/>_object_              | The metadata of the storage class.                                                                                                          |
| `parameters` <br/>_object_            | The parameters for the storage provisioner. These are storage provisioner specific and you will likely have to read external documentation. |
| `provisioner` <br/>_string_           | The provsioner for the storage class                                                                                                        |
| `reclaimPolicy` <br/>_string_         | The default volume reclaim policy for this storage class. You have a choice between `Reclaim` or `Delete`.                                  |
| `volumeBindingMode` <br/>_string_     | The default volume binding model for this storage class. You have a choice between `Immediate` or `WaitForFirstConsumer`.                   |