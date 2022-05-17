### Persistent volumes

<!-------------------- LIST Persistent volumes -------------------->

#### List persistent volumes

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/persistentvolumes"
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
        "finalizers": ["kubernetes.io/pv-protection"],
        "name": "pvc-05097a93-120d-45d2-aaab-0f273849fccd",
        "resourceVersion": "147569183",
        "selfLink": "/api/v1/persistentvolumes/pvc-05097a93-120d-45d2-aaab-0f273849fccd",
        "uid": "2e20a8fb-d90c-4c39-acd8-7007f85e2d8e"
      },
      "spec": {
        "accessModes": ["ReadWriteOnce"],
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

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/persistentvolumes</code>

Retrieve a list of all persistent volumes in a given [environment](#administration-environments).

| Attributes                                         | &nbsp;                                                                                                                                                                                                                                                                |
| -------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id` <br/>_string_                                 | The id of the persistent volume. This is the name of the resource.                                                                                                                                                                                                    |
| `metadata` <br/>_object_                           | The metadata of the persistent volume.                                                                                                                                                                                                                                |
| `spec` <br/>_object_                               | The specification of the persistent volume.                                                                                                                                                                                                                           |
| `spec.accessModes` <br/>_string_                   | The volume can be mounted on a host in any way supported by the resource provider and will give the provider access to different capabilities. Value is one of `ReadWriteOnce` (by a single node), `ReadOnlyMany` (by many nodes) or `ReadWriteMany` (by many nodes). |
| `spec.capacity.storage` <br/>_string_              | Storage capacity of the persistent volume.                                                                                                                                                                                                                            |
| `spec.persistentVolumeReclaimPolicy` <br/>_string_ | One of `Retain` (manual reclamation), `Recycle` (basic scrub) or `Delete` (associated storage asset such as AWS EBS, GCE PD, Azure Disk, or OpenStack Cinder volume is deleted).                                                                                      |
| `spec.storageClassName` <br/>_string_              | Storage class associated to the volume.                                                                                                                                                                                                                               |
| `spec.capacity.volumeMode` <br/>_string_           | If set to `Filesystem` (default value), the volume is mounted into Pods into a directory. If set to `Block`, then the volume is used as a raw block device.                                                                                                           |
| `status.phase` <br/>_string_                       | Volume is in one of the following phases: `Available`, `Bound`, `Released` or `Failed`.                                                                                                                                                                               |

<!-------------------- GET A persistent volume -------------------->

#### Get a persistent volume

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/persistentvolumes/pvc-05097a93-120d-45d2"
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
    "finalizers": ["kubernetes.io/pv-protection"],
    "name": "pvc-05097a93-120d-45d2-aaab-0f273849fccd",
    "resourceVersion": "147569183",
    "selfLink": "/api/v1/persistentvolumes/pvc-05097a93-120d-45d2-aaab-0f273849fccd",
    "uid": "2e20a8fb-d90c-4c39-acd8-7007f85e2d8e"
  },
  "spec": {
    "accessModes": ["ReadWriteOnce"],
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

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/persistentvolumes/:id</code>

Retrieve a persistent volume and all its info in a given [environment](#administration-environments).

| Attributes                                         | &nbsp;                                                                                                                                                                                                                                                                |
| -------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id` <br/>_string_                                 | The id of the persistent volume. This is the name of the resource.                                                                                                                                                                                                    |
| `metadata` <br/>_object_                           | The metadata of the persistent volume.                                                                                                                                                                                                                                |
| `spec` <br/>_object_                               | The specification of the persistent volume.                                                                                                                                                                                                                           |
| `spec.accessModes` <br/>_string_                   | The volume can be mounted on a host in any way supported by the resource provider and will give the provider access to different capabilities. Value is one of `ReadWriteOnce` (by a single node), `ReadOnlyMany` (by many nodes) or `ReadWriteMany` (by many nodes). |
| `spec.capacity.storage` <br/>_string_              | Storage capacity of the persistent volume.                                                                                                                                                                                                                            |
| `spec.persistentVolumeReclaimPolicy` <br/>_string_ | One of `Retain` (manual reclamation), `Recycle` (basic scrub) or `Delete` (associated storage asset such as AWS EBS, GCE PD, Azure Disk, or OpenStack Cinder volume is deleted).                                                                                      |
| `spec.storageClassName` <br/>_string_              | Storage class associated to the volume.                                                                                                                                                                                                                               |
| `spec.capacity.volumeMode` <br/>_string_           | If set to `Filesystem` (default value), the volume is mounted into Pods into a directory. If set to `Block`, then the volume is used as a raw block device.                                                                                                           |
| `status.phase` <br/>_string_                       | Volume is in one of the following phases: `Available`, `Bound`, `Released` or `Failed`.                                                                                                                                                                               |

<!-------------------- CREATE a persistent volume  -------------------->
#### Create a persistent volume

```shell
curl -X POST \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/persistentvolumes"
  Content-Type: application/json
   {
      "apiVersion": "v1",
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
| `spec.<VOLUME_TYPE>` <br/>_object_              | Volume types are identified by name and what volume types are supported differ heavily by Kubernetes deployment. The contents of the object also depend on the volume type. Examples of common volumes types are `nfs`, `hostPath`, or `local`. |

| Optional Attributes                   | &nbsp;                                                                                        |
| ------------------------------------- | --------------------------------------------------------------------------------------------- |
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

<!-------------------- REPLACE PERSISTENT VOLUME -------------------->

#### Replace a persistent volume

```shell
curl -X PUT \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/persistentvolumes/my-persistent-volume"
  Content-Type: application/json
  {
    "apiVersion": "v1",
    "kind": "PersistentVolume",
    "metadata": {
        "annotations": {
            "key": "value"
        },
        "name": "persistentvolumes-name"
    },
    "spec": {
        "accessModes": [
            "ReadWriteMany"
        ],
        "capacity": {
            "storage": "2Gi"
        },
        "claimRef": {
            "apiVersion": "v1",
            "kind": "PersistentVolumeClaim",
            "name": "pv-claim-name",
            "namespace": "default",
            "resourceVersion": "259087",
            "uid": "11957feb-1acc-4c7e-911e-f77d5d7be5ac"
        },
        "hostPath": {
            "path": "/etc/path"
        },
        "persistentVolumeReclaimPolicy": "Retain",
        "storageClassName": "standard",
        "volumeMode": "Filesystem"
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

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/persistentvolumes/:id</code>

Replace a persistent volume in a given [environment](#administration-environments).

Required Attributes                 | &nbsp;
----------------------------------- | ------------------------------------------------------------
`apiVersion` <br/>_string_          | The api version (versioned schema) of the volume.
`metadata` <br/>_object_            | The metadata of the volume.
`metadata.name` <br/>_string_       | The name of the volume.
`spec`<br/>_object_                 | The specification used to replace and run the volume.
`spec.accessModes`<br/>_string_ | The desired access modes the volume should have.
`spec.capacity.storage`<br/>_string_  | The size of the claim.
`spec.hostPath.path`<br/>_string_  | The path of the directory on the host.

| Optional Attributes                       | &nbsp;                                                                  |
| ----------------------------------------- | ----------------------------------------------------------------------- |
| `metadata.annotations` <br/>_string_        | Annotations is an unstructured key value map stored with a resource that may be set by external tools to store and retrieve arbitrary metadata.|
| `spec.claimRef` <br/>_string_        | part of a bi-directional binding between PersistentVolume and PersistentVolumeClaim. Expected to be non-nil when bound.|
| `spec.persistentVolumeReclaimPolicy` <br/>_string_        | What happens to a persistent volume when released from its claim.|
| `spec.storageClassName` <br/>_string_        | Name of StorageClass to which this persistent volume belongs. Empty value means that this volume does not belong to any StorageClass.|
| `spec.volumeMode` <br/>_string_        | Defines if a volume is intended to be used with a formatted filesystem or to remain in raw block state. Value of Filesystem is implied when not included in spec.|

Note that the list is not complete, since it is refering to the [kubernetes api details](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.19/#persistentvolume-v1-core).

Return value:

| Attributes                 | &nbsp;                                       |
| -------------------------- | -------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the replace volume task.|
| `taskStatus` <br/>_string_ | The status of the operation.                 |


<!-------------------- DELETE a persistent volume  -------------------->

#### Delete a persistent volume

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/persistentvolumes/pvc-05097a93-120d-45d2"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "1542bd45-4732-419b-87b6-4ea6ec695c2b",
  "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/persistentvolumes/:id</code>

Delete a perstent volume from a given [environment](#administration-environments).

| Attributes                 | &nbsp;                                                     |
| -------------------------- | ---------------------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the delete persistent volume task. |
| `taskStatus` <br/>_string_ | The status of the operation.                               |
