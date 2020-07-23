#### Persistent Volume Claims

<!-------------------- LIST Persistent volume claims -------------------->

##### List persistent volume claims

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/persistentvolumeclaims?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
   "data":[
     {
         "id":"cmc-staging-mysql/cmc-stg",
         "metadata":{
            "annotations":{
               "pv.kubernetes.io/bind-completed":"yes",
               "pv.kubernetes.io/bound-by-controller":"yes",
               "volume.beta.kubernetes.io/storage-provisioner":"rook-ceph.rbd.csi.ceph.com"
            },
            "creationTimestamp":"2020-04-27T12:01:22.000-04:00",
            "finalizers":[
               "kubernetes.io/pvc-protection"
            ],
            "labels":{
               "app":"cmc-staging-mysql",
               "chart":"mysql-0.4.5",
               "heritage":"Helm",
               "release":"cmc-staging"
            },
            "name":"cmc-staging-mysql",
            "namespace":"cmc-stg",
            "resourceVersion":"111495311",
            "selfLink":"/api/v1/namespaces/cmc-stg/persistentvolumeclaims/cmc-staging-mysql",
            "uid":"ba115a65-e3c5-4e37-8548-e37ec395e79f"
         },
         "spec":{
            "accessModes":[
               "ReadWriteOnce"
            ],
            "resources":{
               "requests":{
                  "storage":"8Gi"
               }
            },
            "storageClassName":"rook-ceph-block",
            "volumeMode":"Filesystem",
            "volumeName":"pvc-ba115a65-e3c5-4e37-8548-e37ec395e79f"
         },
         "status":{
            "accessModes":[
               "ReadWriteOnce"
            ],
            "capacity":{
               "storage":"8Gi"
            },
            "phase":"Bound"
         }
      }
   ],
   "metadata":{
      "recordCount":1
   }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/persistentvolumeclaims?cluster_id=:cluster_id</code>

Retrieve a list of all persistent volume claims in a given [environment](#administration-environments).

| Required                   | &nbsp;                                                      |	
| -------------------------- | ----------------------------------------------------------- |	
| `cluster_id` <br/>_string_ | The id of the cluster in which to list the persistent volume claims. |	


| Attributes                            | &nbsp;                                                                                                                                      |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `id` <br/>_string_ | The id of the persistent volume claim. This is the name and namespace of the resource. |
| `metadata` <br/>_object_ | The metadata of the persistent volume claim.|
| `spec` <br/>_object_ | The specification of the persistent volume claim. |
| `spec.accessModes` <br/>_string_ | The requested access mode. The volume can be mounted on a host in any way supported by the resource provider and will give the provider access to different capabilities. Value is one of `ReadWriteOnce` (by a single node), `ReadOnlyMany` (by many nodes) or `ReadWriteMany` (by many nodes). |
| `spec.resources.requests.storage` <br/>_string_ | The requested storage capacity of the persistent volume. |
| `spec.storageClassName` <br/>_string_ | Storage class associated to the volume. |
| `spec.capacity.volumeMode` <br/>_string_ | If set to `Filesystem` (default value), the volume is mounted into Pods into a directory. If set to `Block`, then the volume is used as a raw block device. |
| `status` <br/>_object_ | The status of the persistent volume claim. |
| `status.phase` <br/>_string_ | The claim is in one of the following phases: `Pending`, `Bound`, `Lost` or `Terminating`. |
| `status.accessModes` <br/>_string_ | The allocated access mode. The volume can be mounted on a host in any way supported by the resource provider and will give the provider access to different capabilities. Value is one of `ReadWriteOnce` (by a single node), `ReadOnlyMany` (by many nodes) or `ReadWriteMany` (by many nodes).|
| `status.capacity.storage` <br/>_string_ | The allocated storage capacity. |

<!-------------------- GET A persistent volume claim -------------------->

##### Get a persistent volume claim

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/persistentvolumeclaims/cmc-staging-mysql/cmc-stg"
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
      "finalizers": [
        "kubernetes.io/pvc-protection"
      ],
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
      "accessModes": [
        "ReadWriteOnce"
      ],
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
      "accessModes": [
        "ReadWriteOnce"
      ],
      "capacity": {
        "storage": "8Gi"
      },
      "phase": "Bound"
    }
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/persistentvolumeclaims/:id?cluster_id=:cluster_id</code>

Retrieve a persistent volume claim and all its info in a given [environment](#administration-environments).

		
| Required                   | &nbsp;                                                      |	
| -------------------------- | ----------------------------------------------------------- |	
| `cluster_id` <br/>_string_ | The id of the cluster in which to get the persistent volume claim. |

| Attributes                            | &nbsp;                                                                                                                                      |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| `id` <br/>_string_ | The id of the persistent volume claim. This is the name and namespace of the resource. |
| `metadata` <br/>_object_ | The metadata of the persistent volume claim.|
| `spec` <br/>_object_ | The specification of the persistent volume claim. |
| `spec.accessModes` <br/>_string_ | The requested access mode. The volume can be mounted on a host in any way supported by the resource provider and will give the provider access to different capabilities. Value is one of `ReadWriteOnce` (by a single node), `ReadOnlyMany` (by many nodes) or `ReadWriteMany` (by many nodes). |
| `spec.resources.requests.storage` <br/>_string_ | The requested storage capacity of the persistent volume. |
| `spec.storageClassName` <br/>_string_ | Storage class associated to the volume. |
| `spec.capacity.volumeMode` <br/>_string_ | If set to `Filesystem` (default value), the volume is mounted into Pods into a directory. If set to `Block`, then the volume is used as a raw block device. |
| `status` <br/>_object_ | The status of the persistent volume claim. |
| `status.phase` <br/>_string_ | The claim is in one of the following phases: `Pending`, `Bound`, `Lost` or `Terminating`. |
| `status.accessModes` <br/>_string_ | The allocated access mode. The volume can be mounted on a host in any way supported by the resource provider and will give the provider access to different capabilities. Value is one of `ReadWriteOnce` (by a single node), `ReadOnlyMany` (by many nodes) or `ReadWriteMany` (by many nodes).|
| `status.capacity.storage` <br/>_string_ | The allocated storage capacity. |
