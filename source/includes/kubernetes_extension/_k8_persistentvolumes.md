#### Persistent volumes

<!-------------------- LIST Persistent volumes -------------------->

##### List persistent volumes

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
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/persistentvolumes?cluster_id=:cluster_id</code>

Retrieve a list of all persistent volumes in a given [environment](#administration-environments).

| Required                   | &nbsp;                                                      |
| -------------------------- | ----------------------------------------------------------- |
| `cluster_id` <br/>_string_ | The id of the cluster in which to list the persistent volumes. |

| Attributes                            | &nbsp;                                                                                                                                      |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `id` <br/>_string_ | The id of the persistent volume. This is the name of the resource. |
| `metadata` <br/>_object_ | The metadata of the persistent volume.|
| `spec` <br/>_object_ | The specification of the persistent volume. |
| `spec.accessModes` <br/>_string_ | The volume can be mounted on a host in any way supported by the resource provider and will give the provider access to different capabilities. Value is one of `ReadWriteOnce` (by a single node), `ReadOnlyMany` (by many nodes) or `ReadWriteMany` (by many nodes). |
| `spec.capacity.storage` <br/>_string_ | Storage capacity of the persistent volume. |
| `spec.persistentVolumeReclaimPolicy` <br/>_string_     | One of `Retain` (manual reclamation), `Recycle` (basic scrub) or `Delete` (associated storage asset such as AWS EBS, GCE PD, Azure Disk, or OpenStack Cinder volume is deleted).|
| `spec.storageClassName` <br/>_string_ | Storage class associated to the volume. |
| `spec.capacity.volumeMode` <br/>_string_ | If set to `Filesystem` (default value), the volume is mounted into Pods into a directory. If set to `Block`, then the volume is used as a raw block device. |
| `status.phase` <br/>_string_ | Volume is in one of the following phases: `Available`, `Bound`, `Released` or `Failed`. |


<!-------------------- GET A persistent volume -------------------->

##### Get a persistent volume

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/persistentvolumes/pvc-05097a93-120d-45d2?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
  "id": "pvc-05097a93-120d-45d2",
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
| `id` <br/>_string_ | The id of the persistent volume. This is the name of the resource. |
| `metadata` <br/>_object_ | The metadata of the persistent volume.|
| `spec` <br/>_object_ | The specification of the persistent volume. |
| `spec.accessModes` <br/>_string_ | The volume can be mounted on a host in any way supported by the resource provider and will give the provider access to different capabilities. Value is one of `ReadWriteOnce` (by a single node), `ReadOnlyMany` (by many nodes) or `ReadWriteMany` (by many nodes). |
| `spec.capacity.storage` <br/>_string_ | Storage capacity of the persistent volume. |
| `spec.persistentVolumeReclaimPolicy` <br/>_string_     | One of `Retain` (manual reclamation), `Recycle` (basic scrub) or `Delete` (associated storage asset such as AWS EBS, GCE PD, Azure Disk, or OpenStack Cinder volume is deleted).|
| `spec.storageClassName` <br/>_string_ | Storage class associated to the volume. |
| `spec.capacity.volumeMode` <br/>_string_ | If set to `Filesystem` (default value), the volume is mounted into Pods into a directory. If set to `Block`, then the volume is used as a raw block device. |
| `status.phase` <br/>_string_ | Volume is in one of the following phases: `Available`, `Bound`, `Released` or `Failed`. |

<!-------------------- CREATE a persistent volume  -------------------->

##### Create a persistent volume 
```shell
curl -X POST \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/persistentvolumes"
  Content-Type: application/json
   {
      "apiVersion": "v1",
      "kind": "PersistentVolume",
      "metadata": {
         "name": "small-pvc",
         "namespace": "default"
      },
      "spec": {
         "accessModes": [
            "ReadWriteOnce"
         ],
         "resources": {
            "requests": {
               "storage": "10G"
            }
         }
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

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/persistentvolumes</code>

Create a persistent volume in a given [environment](#administration-environments).

| Required Attributes                             | &nbsp;                                                                                                                                                                                                          |
| ----------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `apiVersion` <br/>_string_                      | The api version (versioned schema) of the persistent volume.                                                                                                                                               |
| `metadata` <br/>_object_                        | The metadata of the persistent volume.                                                                                                                                                                     |
| `metadata.name` <br/>_string_                   | The name of the persistent volume.                                                                                                                                                                         |
| `spec` <br/>_object_                            | The spec for the persistent volume.                                                                                                                                                                        |
| `spec.accessModes` <br/>_array_                 | A list of access modes, the options are: ReadWriteOnce, ReadOnlyMany and ReadWriteMany.                                                                                                                          |
| `spec.capacity.storage` <br/>_string_           | Measured in bytes. You can express storage as a plain integer or as a fixed-point integer using one of these suffixes: E, P, T, G, M, K. You can also use the power-of-two equivalents: Ei, Pi, Ti, Gi, Mi, Ki. |
| `spec.hostPath.path` <br/>_string_              | Directory location on host.|


| Optional Attributes                   | &nbsp;                                                                                        |
| ------------------------------------- | --------------------------------------------------------------------------------------------- |
| `kind`<br/>_string_                   | The string value representing the REST resource this object represents.                       |
| `metadata.namespace` <br/>_string_    | The namespace in which the pod is created, if not specified will create the persistent volume in default. |
| `spec.storageClassName` <br/>_string_ | Storage class associated to the volume.   |
| `spec.claimRef` <br/>_array_          | The name of the PersistentVolumeClaim associated to the persistent volume.          |
| `spec.mountOptions` <br/>_array_      | Mount options for when a Persistent Volume is mounted on a node.                             |
| `spec.nodeAffinity` <br/>_array_      | Defines constraints that limit what nodes this volume can be accessed from.                   |
| `spec.persistentVolumeReclaimPolicy` <br/>_array_ | One of `Retain` (manual reclamation), `Recycle` (basic scrub) or `Delete` (associated storage asset such as AWS EBS, GCE PD, Azure Disk, or OpenStack Cinder volume is deleted).  |
| `spec.volumeMode` <br/>_array_        | If set to `Filesystem` (default value), the volume is mounted into Pods into a directory. If set to `Block`, then the volume is used as a raw block device.                           |
| `status.phase` <br/>_string_          | Volume is in one of the following phases: `Available`, `Bound`, `Released` or `Failed`.                |


Return value:

| Attributes                 | &nbsp;                                                           |
| -------------------------- | ---------------------------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the create persistent volume task.       |
| `taskStatus` <br/>_string_ | The status of the operation.                                     |


<!-------------------- DELETE a persistent volume  -------------------->
##### Delete a persistent volume

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/persistentvolumes/pvc-05097a93-120d-45d2?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "1542bd45-4732-419b-87b6-4ea6ec695c2b",
  "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/persistentvolumes/:id?cluster_id=:cluster_id</code>

Delete a perstent volume from a given [environment](#administration-environments).

| Attributes                 | &nbsp;                                              |
| -------------------------- | --------------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the delete persistent volume task. |
| `taskStatus` <br/>_string_ | The status of the operation.                        |