#### Pods

<!-------------------- LIST PODS -------------------->

##### List pods

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/pods?cluster_id=projects/cmc-k8s-enabled-llb/locations/us-central1-a/clusters/standard-cluster-1"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "my-aerospike-0/default",
      "metadata": {
        "annotations": {
          "checksum/config": "0e07919467cc16f2c07ac99d0036405deafa06f7d3b430215915470b3a6ca631"
        },
        "creationTimestamp": "2020-01-20T09:35:02.000-05:00",
        "generateName": "my-aerospike-",
        "labels": {
          "app": "aerospike",
          "controller-revision-hash": "my-aerospike-d9969496d",
          "release": "my-aerospike",
          "statefulset.kubernetes.io/pod-name": "my-aerospike-0"
        },
        "name": "my-aerospike-0",
        "namespace": "default",
        "ownerReferences": [
          {
            "apiVersion": "apps/v1",
            "blockOwnerDeletion": true,
            "controller": true,
            "kind": "StatefulSet",
            "name": "my-aerospike",
            "uid": "0b00ea3d-3b92-11ea-935e-025000000001"
          }
        ],
        "resourceVersion": "95058",
        "selfLink": "/api/v1/namespaces/default/pods/my-aerospike-0",
        "uid": "0b055519-3b92-11ea-935e-025000000001"
      },
      "spec": {
        "containers": [
          {
            "image": "aerospike/aerospike-server:4.5.0.5",
            "imagePullPolicy": "IfNotPresent",
            "name": "my-aerospike",
            "ports": [
              {
                "containerPort": 3000,
                "name": "clients",
                "protocol": "TCP"
              },
              {
                "containerPort": 3002,
                "name": "mesh",
                "protocol": "TCP"
              },
              {
                "containerPort": 3003,
                "name": "info",
                "protocol": "TCP"
              }
            ],
            "readinessProbe": {
              "failureThreshold": 3,
              "initialDelaySeconds": 15,
              "periodSeconds": 10,
              "successThreshold": 1,
              "tcpSocket": {
                "port": 3000
              },
              "timeoutSeconds": 1
            },
            "resources": {},
            "terminationMessagePath": "/dev/termination-log",
            "terminationMessagePolicy": "File",
            "volumeMounts": [
              {
                "mountPath": "/etc/aerospike",
                "name": "config-volume"
              },
              {
                "mountPath": "/var/run/secrets/kubernetes.io/serviceaccount",
                "name": "default-token-64jnc",
                "readOnly": true
              }
            ]
          }
        ],
        "dnsPolicy": "ClusterFirst",
        "enableServiceLinks": true,
        "hostname": "my-aerospike-0",
        "nodeName": "docker-desktop",
        "priority": 0,
        "restartPolicy": "Always",
        "schedulerName": "default-scheduler",
        "securityContext": {},
        "serviceAccount": "default",
        "serviceAccountName": "default",
        "subdomain": "my-aerospike",
        "terminationGracePeriodSeconds": 30,
        "tolerations": [
          {
            "effect": "NoExecute",
            "key": "node.kubernetes.io/not-ready",
            "operator": "Exists",
            "tolerationSeconds": 300
          },
          {
            "effect": "NoExecute",
            "key": "node.kubernetes.io/unreachable",
            "operator": "Exists",
            "tolerationSeconds": 300
          }
        ],
        "volumes": [
          {
            "configMap": {
              "defaultMode": 420,
              "items": [
                {
                  "key": "aerospike.conf",
                  "path": "aerospike.conf"
                }
              ],
              "name": "my-aerospike"
            },
            "name": "config-volume"
          },
          {
            "name": "default-token-64jnc",
            "secret": {
              "defaultMode": 420,
              "secretName": "default-token-64jnc"
            }
          }
        ]
      },
      "status": {
        "conditions": [
          {
            "lastTransitionTime": "2020-01-20T09:35:02.000-05:00",
            "status": "True",
            "type": "Initialized"
          },
          {
            "lastTransitionTime": "2020-01-21T15:05:33.000-05:00",
            "status": "True",
            "type": "Ready"
          },
          {
            "lastTransitionTime": "2020-01-21T15:05:33.000-05:00",
            "status": "True",
            "type": "ContainersReady"
          },
          {
            "lastTransitionTime": "2020-01-20T09:35:02.000-05:00",
            "status": "True",
            "type": "PodScheduled"
          }
        ],
        "containerStatuses": [
          {
            "containerID": "docker://b45436d2978cb8e6186b22c24d3b819cabd00921a009b30c2599a935d0c69b49",
            "image": "aerospike/aerospike-server:4.5.0.5",
            "imageID": "docker-pullable://aerospike/aerospike-server@sha256:5bec98d46c8a521003e1c5b6f015713f2663384dd66916cca696e4e1c142c539",
            "lastState": {
              "terminated": {
                "containerID": "docker://5e4b23c07269669f302c7c6a446399e59d553cf1a622094c1d3cc64b6f65a9e0",
                "exitCode": 255,
                "finishedAt": "2020-01-21T15:04:35.000-05:00",
                "reason": "Error",
                "startedAt": "2020-01-20T10:28:19.000-05:00"
              }
            },
            "name": "my-aerospike",
            "ready": true,
            "restartCount": 2,
            "state": {
              "running": {
                "startedAt": "2020-01-21T15:05:16.000-05:00"
              }
            }
          }
        ],
        "hostIP": "192.168.65.3",
        "phase": "Running",
        "podIP": "10.1.0.129",
        "qosClass": "BestEffort",
        "startTime": "2020-01-20T09:35:02.000-05:00"
      }
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/pods?cluster_id=:cluster_id</code>

Retrieve a list of all pods in a given [environment](#administration-environments).

| Required                   | &nbsp;                                           |
| -------------------------- | ------------------------------------------------ |
| `cluster_id` <br/>_string_ | The id of the cluster in which to list the pods. |

| Attributes                                 | &nbsp;                                                                                        |
| ------------------------------------------ | --------------------------------------------------------------------------------------------- |
| `id` <br/>_string_                         | The id of the pod.                                                                            |
| `metadata` <br/>_object_                   | The metadata of the pod.                                                                      |
| `metadata.annotations` <br/>_map_          | The annotations of the pod.                                                                   |
| `metadata.creationTimestamp` <br/>_string_ | The date of creation of the pod as a string.                                                  |
| `metadata.labels` <br/>_map_               | The labels associated to the pod.                                                             |
| `metadata.name` <br/>_string_              | The name of the pod.                                                                          |
| `metadata.namespace` <br/>_string_         | The namespace in which the pod is created.                                                    |
| `metadata.uid` <br/>_object_               | The UUID of the pod.                                                                          |
| `spec`<br/>_object_                        | The specification used to create and run the pod.                                             |
| `spec.container`<br/>_string_              | The name of the container running.                                                            |
| `status`<br/>_object_                      | The status information of the pod.                                                            |
| `status.phase`<br/>_string_                | The status of the pod. Possible statuses are Running, Pending, Succeeded, Unknown and Failed. |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- GET A POD -------------------->

##### Get a pod

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/pods/my-aerospike-0/default?cluster_id=projects/cmc-k8s-enabled-llb/locations/us-central1-a/clusters/standard-cluster-1"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "my-aerospike-0/default",
      "metadata": {
        "annotations": {
          "checksum/config": "0e07919467cc16f2c07ac99d0036405deafa06f7d3b430215915470b3a6ca631"
        },
        "creationTimestamp": "2020-01-20T09:35:02.000-05:00",
        "generateName": "my-aerospike-",
        "labels": {
          "app": "aerospike",
          "controller-revision-hash": "my-aerospike-d9969496d",
          "release": "my-aerospike",
          "statefulset.kubernetes.io/pod-name": "my-aerospike-0"
        },
        "name": "my-aerospike-0",
        "namespace": "default",
        "ownerReferences": [
          {
            "apiVersion": "apps/v1",
            "blockOwnerDeletion": true,
            "controller": true,
            "kind": "StatefulSet",
            "name": "my-aerospike",
            "uid": "0b00ea3d-3b92-11ea-935e-025000000001"
          }
        ],
        "resourceVersion": "95058",
        "selfLink": "/api/v1/namespaces/default/pods/my-aerospike-0",
        "uid": "0b055519-3b92-11ea-935e-025000000001"
      },
      "spec": {
        "containers": [
          {
            "image": "aerospike/aerospike-server:4.5.0.5",
            "imagePullPolicy": "IfNotPresent",
            "name": "my-aerospike",
            "ports": [
              {
                "containerPort": 3000,
                "name": "clients",
                "protocol": "TCP"
              },
              {
                "containerPort": 3002,
                "name": "mesh",
                "protocol": "TCP"
              },
              {
                "containerPort": 3003,
                "name": "info",
                "protocol": "TCP"
              }
            ],
            "readinessProbe": {
              "failureThreshold": 3,
              "initialDelaySeconds": 15,
              "periodSeconds": 10,
              "successThreshold": 1,
              "tcpSocket": {
                "port": 3000
              },
              "timeoutSeconds": 1
            },
            "resources": {},
            "terminationMessagePath": "/dev/termination-log",
            "terminationMessagePolicy": "File",
            "volumeMounts": [
              {
                "mountPath": "/etc/aerospike",
                "name": "config-volume"
              },
              {
                "mountPath": "/var/run/secrets/kubernetes.io/serviceaccount",
                "name": "default-token-64jnc",
                "readOnly": true
              }
            ]
          }
        ],
        "dnsPolicy": "ClusterFirst",
        "enableServiceLinks": true,
        "hostname": "my-aerospike-0",
        "nodeName": "docker-desktop",
        "priority": 0,
        "restartPolicy": "Always",
        "schedulerName": "default-scheduler",
        "securityContext": {},
        "serviceAccount": "default",
        "serviceAccountName": "default",
        "subdomain": "my-aerospike",
        "terminationGracePeriodSeconds": 30,
        "tolerations": [
          {
            "effect": "NoExecute",
            "key": "node.kubernetes.io/not-ready",
            "operator": "Exists",
            "tolerationSeconds": 300
          },
          {
            "effect": "NoExecute",
            "key": "node.kubernetes.io/unreachable",
            "operator": "Exists",
            "tolerationSeconds": 300
          }
        ],
        "volumes": [
          {
            "configMap": {
              "defaultMode": 420,
              "items": [
                {
                  "key": "aerospike.conf",
                  "path": "aerospike.conf"
                }
              ],
              "name": "my-aerospike"
            },
            "name": "config-volume"
          },
          {
            "name": "default-token-64jnc",
            "secret": {
              "defaultMode": 420,
              "secretName": "default-token-64jnc"
            }
          }
        ]
      },
      "status": {
        "conditions": [
          {
            "lastTransitionTime": "2020-01-20T09:35:02.000-05:00",
            "status": "True",
            "type": "Initialized"
          },
          {
            "lastTransitionTime": "2020-01-21T15:05:33.000-05:00",
            "status": "True",
            "type": "Ready"
          },
          {
            "lastTransitionTime": "2020-01-21T15:05:33.000-05:00",
            "status": "True",
            "type": "ContainersReady"
          },
          {
            "lastTransitionTime": "2020-01-20T09:35:02.000-05:00",
            "status": "True",
            "type": "PodScheduled"
          }
        ],
        "containerStatuses": [
          {
            "containerID": "docker://b45436d2978cb8e6186b22c24d3b819cabd00921a009b30c2599a935d0c69b49",
            "image": "aerospike/aerospike-server:4.5.0.5",
            "imageID": "docker-pullable://aerospike/aerospike-server@sha256:5bec98d46c8a521003e1c5b6f015713f2663384dd66916cca696e4e1c142c539",
            "lastState": {
              "terminated": {
                "containerID": "docker://5e4b23c07269669f302c7c6a446399e59d553cf1a622094c1d3cc64b6f65a9e0",
                "exitCode": 255,
                "finishedAt": "2020-01-21T15:04:35.000-05:00",
                "reason": "Error",
                "startedAt": "2020-01-20T10:28:19.000-05:00"
              }
            },
            "name": "my-aerospike",
            "ready": true,
            "restartCount": 2,
            "state": {
              "running": {
                "startedAt": "2020-01-21T15:05:16.000-05:00"
              }
            }
          }
        ],
        "hostIP": "192.168.65.3",
        "phase": "Running",
        "podIP": "10.1.0.129",
        "qosClass": "BestEffort",
        "startTime": "2020-01-20T09:35:02.000-05:00"
      }
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/pods/:id?cluster_id=:cluster_id</code>

Retrieve a pod and all its info in a given [environment](#administration-environments).

| Required                   | &nbsp;                                         |
| -------------------------- | ---------------------------------------------- |
| `cluster_id` <br/>_string_ | The id of the cluster in which to get the pod. |

| Attributes                                 | &nbsp;                                                                                        |
| ------------------------------------------ | --------------------------------------------------------------------------------------------- |
| `id` <br/>_string_                         | The id of the pod.                                                                            |
| `metadata` <br/>_object_                   | The metadata of the pod.                                                                      |
| `metadata.annotations` <br/>_map_          | The annotations of the pod.                                                                   |
| `metadata.creationTimestamp` <br/>_string_ | The date of creation of the pod as a string.                                                  |
| `metadata.labels` <br/>_map_               | The labels associated to the pod.                                                             |
| `metadata.name` <br/>_string_              | The name of the pod.                                                                          |
| `metadata.namespace` <br/>_string_         | The namespace in which the pod is created.                                                    |
| `metadata.uid` <br/>_object_               | The UUID of the pod.                                                                          |
| `spec`<br/>_object_                        | The specification used to create and run the pod.                                             |
| `spec.container`<br/>_string_              | The name of the container running.                                                            |
| `status`<br/>_object_                      | The status information of the pod.                                                            |
| `status.phase`<br/>_string_                | The status of the pod. Possible statuses are Running, Pending, Succeeded, Unknown and Failed. |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- CREATE POD -------------------->

##### Create a pod

```shell
curl -X POST \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/pods"
  Content-Type: application/json
  {
	  "apiVersion": "v1",
    "kind": "Pod",
	  "metadata": {
	  	"name": "edgar-allen-pod",
		  "namespace": "default"
  	},
	  "spec": {
		"containers": [
			{
				"image": "nginx",
				"name": "nginx"
			}
		  ]
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

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/pods</code>

Create a pod in a given [environment](#administration-environments).

| Required Attributes                 | &nbsp;                                                      |
| ----------------------------------- | ----------------------------------------------------------- |
| `apiVersion` <br/>_string_          | The api version (versioned schema) of the pod               |
| `metadata` <br/>_object_            | The metadata of the pod                                     |
| `metadata.name` <br/>_string_       | The name of the pod                                         |
| `spec`<br/>_object_                 | The specification used to create and run the pod            |
| `spec.container.image`<br/>_string_ | The docker image name                                       |
| `spec.container.name`<br/>_string_  | The (unique) name of the container specified as a DNS_LABEL |

| Optional Attributes                | &nbsp;                                                                 |
| ---------------------------------- | ---------------------------------------------------------------------- |
| `metadata.namespace` <br/>_string_ | The namespace in which the pod is created                              |

Return value:

| Attributes                 | &nbsp;                                       |
| -------------------------- | -------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the create pod task. |
| `taskStatus` <br/>_string_ | The status of the operation.                 |

<!-------------------- REPLACE POD -------------------->

##### Replace a pod

```shell
curl -X PUT \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/pods/edgar-allen-pod/default"
  Content-Type: application/json
  {
    "apiVersion": "v1",
    "kind": "Pod",
	  "metadata": {
	  	"name": "edgar-allen-pod",
		  "namespace": "default"
  },
	  "spec": {
		"containers": [
			{
				"image": "nginx",
				"name": "nginx"
			}
		  ]
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

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/pods/:id</code>

Replace a pod in a given [environment](#administration-environments).

Required Attributes                 | &nbsp;
----------------------------------- | ------------------------------------------------------------
`apiVersion` <br/>_string_          | The api version (versioned schema) of the pod.
`metadata` <br/>_object_            | The metadata of the pod.
`metadata.name` <br/>_string_       | The name of the pod.
`spec`<br/>_object_                 | The specification used to replace and run the pod.
`spec.container.image`<br/>_string_ | The docker image name.
`spec.container.name`<br/>_string_  | The (unique) name of the container specified as a DNS_LABEL.

| Optional Attributes                       | &nbsp;                                                                  |
| ----------------------------------------- | ----------------------------------------------------------------------- |
| `metadata.namespace` <br/>_string_        | The namespace in which the pod is replaced.                             |

Return value:

| Attributes                 | &nbsp;                                       |
| -------------------------- | -------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the replace pod task.|
| `taskStatus` <br/>_string_ | The status of the operation.                 |

<!-------------------- DELETE POD -------------------->

##### Delete a pod

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/pods/my-aerospike-0/default?cluster_id=projects/cmc-k8s-enabled-llb/locations/us-central1-a/clusters/standard-cluster-1"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "1542bd45-4732-419b-87b6-4ea6ec695c2b",
  "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/pods/:id?cluster_id=:cluster_id</code>

Delete a pod from a given [environment](#administration-environments).

| Required                   | &nbsp;                                            |
| -------------------------- | ------------------------------------------------- |
| `cluster_id` <br/>_string_ | The id of the cluster in which to delete the pod. |

| Attributes                 | &nbsp;                                      |
| -------------------------- | ------------------------------------------- |
| `taskId` <br/>_string_     | The task id related to the delete pod task. |
| `taskStatus` <br/>_string_ | The status of the operation.                |
