### Persistent Volume Claims

<!-------------------- LIST Persistent volume claims -------------------->

#### List persistent volume claims

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/persistentvolumeclaims"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "cmc-staging-mysql/cmc-stg",
      "metadata": {
        "annotations": {
          "pv.kubernetes.io/bind-completed": "yes",
          "pv.kubernetes.io/bound-by-controller": "yes",
          "volume.beta.kubernetes.io/storage-provisioner": "rook-ceph.rbd.csi.ceph.com"
        },
        "creationTimestamp": "2020-04-27T12:01:22.000-04:00",
        "finalizers": ["kubernetes.io/pvc-protection"],
        "labels": {
          "app": "cmc-staging-mysql",
          "chart": "mysql-0.4.5",
          "heritage": "Helm",
          "release": "cmc-staging"
        },
        "name": "cmc-staging-mysql",
        "namespace": "cmc-stg",
        "resourceVersion": "111495311",
        "selfLink": "/api/v1/namespaces/cmc-stg/persistentvolumeclaims/cmc-staging-mysql",
        "uid": "ba115a65-e3c5-4e37-8548-e37ec395e79f"
      },
      "spec": {
        "accessModes": ["ReadWriteOnce"],
        "resources": {
          "requests": {
            "storage": "8Gi"
          }
        },
        "storageClassName": "rook-ceph-block",
        "volumeMode": "Filesystem",
        "volumeName": "pvc-ba115a65-e3c5-4e37-8548-e37ec395e79f"
      },
      "status": {
        "accessModes": ["ReadWriteOnce"],
        "capacity": {
          "storage": "8Gi"
        },
        "phase": "Bound"
      }
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/persistentvolumeclaims</code>

Retrieve a list of all persistent volume claims in a given [environment](#administration-environments).

| Attributes                                      | &nbsp;                                                                                                                                                                                                                                                                                           |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `id` <br/>_string_                              | The id of the persistent volume claim. This is the name and namespace of the resource.                                                                                                                                                                                                           |
| `metadata` <br/>_object_                        | The metadata of the persistent volume claim.                                                                                                                                                                                                                                                     |
| `spec` <br/>_object_                            | The specification of the persistent volume claim.                                                                                                                                                                                                                                                |
| `spec.accessModes` <br/>_string_                | The requested access mode. The volume can be mounted on a host in any way supported by the resource provider and will give the provider access to different capabilities. Value is one of `ReadWriteOnce` (by a single node), `ReadOnlyMany` (by many nodes) or `ReadWriteMany` (by many nodes). |
| `spec.resources.requests.storage` <br/>_string_ | The requested storage capacity of the persistent volume.                                                                                                                                                                                                                                         |
| `spec.storageClassName` <br/>_string_           | Storage class associated to the volume.                                                                                                                                                                                                                                                          |
| `spec.capacity.volumeMode` <br/>_string_        | If set to `Filesystem` (default value), the volume is mounted into Pods into a directory. If set to `Block`, then the volume is used as a raw block device.                                                                                                                                      |
| `status` <br/>_object_                          | The status of the persistent volume claim.                                                                                                                                                                                                                                                       |
| `status.phase` <br/>_string_                    | The claim is in one of the following phases: `Pending`, `Bound`, `Lost` or `Terminating`.                                                                                                                                                                                                        |
| `status.accessModes` <br/>_string_              | The allocated access mode. The volume can be mounted on a host in any way supported by the resource provider and will give the provider access to different capabilities. Value is one of `ReadWriteOnce` (by a single node), `ReadOnlyMany` (by many nodes) or `ReadWriteMany` (by many nodes). |
| `status.capacity.storage` <br/>_string_         | The allocated storage capacity.                                                                                                                                                                                                                                                                  |

<!-------------------- GET A persistent volume claim-------------------->

#### Get a persistent volume claim

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/persistentvolumeclaims/cmc-staging-mysql/cmc-stg"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "cmc-staging-mysql/cmc-stg",
    "apiVersion": "v1",
    "kind": "PersistentVolumeClaim",
    "metadata": {
      "annotations": {
        "pv.kubernetes.io/bind-completed": "yes",
        "pv.kubernetes.io/bound-by-controller": "yes",
        "volume.beta.kubernetes.io/storage-provisioner": "rook-ceph.rbd.csi.ceph.com"
      },
      "creationTimestamp": "2020-04-27T12:01:22.000-04:00",
      "finalizers": ["kubernetes.io/pvc-protection"],
      "labels": {
        "app": "cmc-staging-mysql",
        "chart": "mysql-0.4.5",
        "heritage": "Helm",
        "release": "cmc-staging"
      },
      "name": "cmc-staging-mysql",
      "namespace": "cmc-stg",
      "resourceVersion": "111495311",
      "selfLink": "/api/v1/namespaces/cmc-stg/persistentvolumeclaims/cmc-staging-mysql",
      "uid": "ba115a65-e3c5-4e37-8548-e37ec395e79f"
    },
    "spec": {
      "accessModes": ["ReadWriteOnce"],
      "resources": {
        "requests": {
          "storage": "8Gi"
        }
      },
      "storageClassName": "rook-ceph-block",
      "volumeMode": "Filesystem",
      "volumeName": "pvc-ba115a65-e3c5-4e37-8548-e37ec395e79f"
    },
    "status": {
      "accessModes": ["ReadWriteOnce"],
      "capacity": {
        "storage": "8Gi"
      },
      "phase": "Bound"
    }
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/persistentvolumeclaims/:id</code>

Retrieve a persistent volume claim and all its info in a given [environment](#administration-environments).

| Attributes                                      | &nbsp;                                                                                                                                                                                                                                                                                           |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `id` <br/>_string_                              | The id of the persistent volume claim. This is the name and namespace of the resource.                                                                                                                                                                                                           |
| `metadata` <br/>_object_                        | The metadata of the persistent volume claim.                                                                                                                                                                                                                                                     |
| `spec` <br/>_object_                            | The specification of the persistent volume claim.                                                                                                                                                                                                                                                |
| `spec.accessModes` <br/>_string_                | The requested access mode. The volume can be mounted on a host in any way supported by the resource provider and will give the provider access to different capabilities. Value is one of `ReadWriteOnce` (by a single node), `ReadOnlyMany` (by many nodes) or `ReadWriteMany` (by many nodes). |
| `spec.resources.requests.storage` <br/>_string_ | The requested storage capacity of the persistent volume.                                                                                                                                                                                                                                         |
| `spec.storageClassName` <br/>_string_           | Storage class associated to the volume.                                                                                                                                                                                                                                                          |
| `spec.capacity.volumeMode` <br/>_string_        | If set to `Filesystem` (default value), the volume is mounted into Pods into a directory. If set to `Block`, then the volume is used as a raw block device.                                                                                                                                      |
| `status` <br/>_object_                          | The status of the persistent volume claim.                                                                                                                                                                                                                                                       |
| `status.phase` <br/>_string_                    | The claim is in one of the following phases: `Pending`, `Bound`, `Lost` or `Terminating`.                                                                                                                                                                                                        |
| `status.accessModes` <br/>_string_              | The allocated access mode. The volume can be mounted on a host in any way supported by the resource provider and will give the provider access to different capabilities. Value is one of `ReadWriteOnce` (by a single node), `ReadOnlyMany` (by many nodes) or `ReadWriteMany` (by many nodes). |
| `status.capacity.storage` <br/>_string_         | The allocated storage capacity.                                                                                                                                                                                                                                                                  |

<!-------------------- CREATE a persistent volume claim -------------------->

#### Create a persistent volume claim

```shell
curl -X POST \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/persistentvolumeclaims"
  Content-Type: application/json
   {
      "apiVersion": "v1",
      "kind": "PersistentVolumeClaim",
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

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/persistentvolumeclaims</code>

Create a persistent volume claim in a given [environment](#administration-environments).

| Required Attributes                             | &nbsp;                                                                                                                                                                                                          |
| ----------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `apiVersion` <br/>_string_                      | The api version (versioned schema) of the persistent volume claim.                                                                                                                                              |
| `metadata` <br/>_object_                        | The metadata of the persistent volume claim.                                                                                                                                                                    |
| `metadata.name` <br/>_string_                   | The name of the persistent volume claim.                                                                                                                                                                        |
| `spec` <br/>_object_                            | The spec for the persistent volume claim.                                                                                                                                                                       |
| `spec.accessModes` <br/>_array_                 | A list of access modes, the options are: ReadWriteOnce, ReadOnlyMany and ReadWriteMany.                                                                                                                         |
| `spec.resources.requests.storage` <br/>_string_ | Measured in bytes. You can express storage as a plain integer or as a fixed-point integer using one of these suffixes: E, P, T, G, M, K. You can also use the power-of-two equivalents: Ei, Pi, Ti, Gi, Mi, Ki. |

| Optional Attributes                   | &nbsp;                                                                                        |
| ------------------------------------- | --------------------------------------------------------------------------------------------- |
| `metadata.namespace` <br/>_string_    | The namespace in which the pod is created, if not specified will create the claim in default. |
| `spec.storageClassName` <br/>_string_ | The storage class for the persistent volume claim, will use the default if not specified.     |
| `spec.resources.limits` <br/>_object_ | Limits describe the maximum number of storage resources allowed.                              |

Return value:

| Attributes                 | &nbsp;                                                           |
| -------------------------- | ---------------------------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the create persistent volume claim task. |
| `taskStatus` <br/>_string_ | The status of the operation.                                     |

<!-------------------- REPLACE PERSISTENT VOLUME CLAIM -------------------->

#### Replace a persistent volume claim

```shell
curl -X PUT \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/persistentvolumeclaims/my-persistent-volume-claim/default"
  Content-Type: application/json
  {
    "id": "pv-claim-name/default",
    "apiVersion": "v1",
    "kind": "PersistentVolumeClaim",
    "metadata": {
        "name": "pv-claim-name",
        "namespace": "default"
    },
    "spec": {
        "accessModes": [
            "ReadWriteOnce"
        ],
        "resources": {
            "requests": {
                "storage": "1Gi"
            }
        },
        "storageClassName": "standard",
        "volumeName": "persistentvolumes-name",
        "dataSource": "dataSource"
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

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/persistentvolumeclaims/:id</code>

Replace a persistent volume claim in a given [environment](#administration-environments).

Required Attributes                 | &nbsp;
----------------------------------- | ------------------------------------------------------------
`apiVersion` <br/>_string_          | The api version (versioned schema) of the claim.
`metadata` <br/>_object_            | The metadata of the claim.
`metadata.name` <br/>_string_       | The name of the claim.
`spec`<br/>_object_                 | The specification used to replace and run the claim.
`spec.accessModes`<br/>_string_ | The desired access modes the volume should have.
`spec.resources.requests.storage`<br/>_string_  | The size of the claim.
`spec.storageClassName`<br/>_string_  | The name of the StorageClass required by the claim.
`spec.volumeName`<br/>_string_  | The binding reference to the PersistentVolume backing this claim. Only required if claim is bound.

| Optional Attributes                       | &nbsp;                                                                  |
| ----------------------------------------- | ----------------------------------------------------------------------- |
| `spec.volumemode` <br/>_string_        | What type of volume is required by the claim. Value of Filesystem is implied when not included in claim spec.|
| `spec.dataSource` <br/>_string_        | This field can be used to specify either: an existing VolumeSnapshot object, an existing PVC or an existing custom resource/object that implements data population.|

Note that the list is not complete, since it is refering to the [kubernetes api details](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.19/#persistentvolumeclaim-v1-core).

Return value:

| Attributes                 | &nbsp;                                       |
| -------------------------- | -------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the replace persistent volume claim task.|
| `taskStatus` <br/>_string_ | The status of the operation.                 |

<!-------------------- DELETE a persistent volume claim  -------------------->

#### Delete a persistent volume claim

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/persistentvolumeclaims/cmc-staging-mysql/cmc-stg"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "1542bd45-4732-419b-87b6-4ea6ec695c2b",
  "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/persistentvolumeclaims/:id</code>

Delete a perstent volume claim from a given [environment](#administration-environments).

| Attributes                 | &nbsp;                                                           |
| -------------------------- | ---------------------------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the delete persistent volume claim task. |
| `taskStatus` <br/>_string_ | The status of the operation.                                     |
