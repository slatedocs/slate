## Stateful Sets

<!-------------------- LIST STATEFUL SETS -------------------->

### List stateful sets

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/k8s/anenvironment/statefulsets"
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "test-aerospike/auth",
      "replicaRatio": "1 / 1",
      "images": [
        "aerospike/aerospike-server:4.5.0.5"
      ],
      "metadata": {
        "creationTimestamp": "2020-04-27T09:13:49.000-04:00",
        "generation": 1,
        "labels": {
          "app": "aerospike",
          "chart": "aerospike-0.3.2",
          "heritage": "Helm",
          "release": "test"
        },
        "name": "test-aerospike",
        "namespace": "auth",
        "resourceVersion": "117166675",
        "selfLink": "/apis/apps/v1/namespaces/auth/statefulsets/test-aerospike",
        "uid": "0aeff29e-e33d-48da-b933-651a9070d58c"
      },
      "spec": {
        "podManagementPolicy": "OrderedReady",
        "replicas": 1,
        "revisionHistoryLimit": 10,
        "selector": {
          "matchLabels": {
            "app": "aerospike",
            "release": "test"
          }
        },
        "serviceName": "test-aerospike",
        "template": {
          "metadata": {
            "annotations": {
              "checksum/config": "0e07919467cc16f2c07ac99d0036405deafa06f7d3b430215915470b3a6ca631"
            },
            "labels": {
              "app": "aerospike",
              "release": "test"
            }
          },
          "spec": {
            "containers": [
              {
                "image": "aerospike/aerospike-server:4.5.0.5",
                "imagePullPolicy": "IfNotPresent",
                "name": "test-aerospike",
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
                  }
                ]
              }
            ],
            "dnsPolicy": "ClusterFirst",
            "restartPolicy": "Always",
            "schedulerName": "default-scheduler",
            "securityContext": {},
            "terminationGracePeriodSeconds": 30,
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
                  "name": "test-aerospike"
                },
                "name": "config-volume"
              }
            ]
          }
        },
        "updateStrategy": {
          "rollingUpdate": {
            "partition": 0
          },
          "type": "RollingUpdate"
        }
      },
      "status": {
        "collisionCount": 0,
        "currentReplicas": 1,
        "currentRevision": "test-aerospike-6db7776c7d",
        "observedGeneration": 1,
        "readyReplicas": 1,
        "replicas": 1,
        "updateRevision": "test-aerospike-6db7776c7d",
        "updatedReplicas": 1
      }
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/statefulsets</code>

Retrieve a list of all stateful sets in a given [environment](#administration-environments).

| Attributes                                 | &nbsp;                                                          |
| ------------------------------------------ | --------------------------------------------------------------- |
| `id` <br/>*string*                         | The id of the stateful set                                      |
| `metadata` <br/>*object*                   | The metadata of the stateful set                                |
| `metadata.creationTimestamp` <br/>*string* | The date of creation of the stateful set as a string            |
| `metadata.labels` <br/>*map*               | The labels associated to the stateful set                       |
| `metadata.name` <br/>*string*              | The name of the stateful set                                    |
| `metadata.namespace` <br/>*string*         | The namespace in which the stateful set is created              |
| `metadata.uid` <br/>*object*               | The UUID of the stateful set                                    |
| `spec`<br/>*object*                        | The specification used to create and run the stateful set       |
| `status`<br/>*object*                      | The status information of the stateful set                      |
| `status.readyReplicas`<br/>*integer*       | Total number of ready pods targeted by this deployment          |
| `status.replicas`<br/>*integer*            | Total number of non-terminated pods targeted by this deployment |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- GET A STATEFUL SET -------------------->

### Get a stateful sets

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/k8s/anenvironment/statefulsets/test-aerospike/auth"
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "test-aerospike/auth",
    "replicaRatio": "1 / 1",
    "images": [
      "aerospike/aerospike-server:4.5.0.5"
    ],
    "apiVersion": "apps/v1",
    "kind": "StatefulSet",
    "metadata": {
      "creationTimestamp": "2020-04-27T09:13:49.000-04:00",
      "generation": 1,
      "labels": {
        "app": "aerospike",
        "chart": "aerospike-0.3.2",
        "heritage": "Helm",
        "release": "test"
      },
      "name": "test-aerospike",
      "namespace": "auth",
      "resourceVersion": "117166675",
      "selfLink": "/apis/apps/v1/namespaces/auth/statefulsets/test-aerospike",
      "uid": "0aeff29e-e33d-48da-b933-651a9070d58c"
    },
    "spec": {
      "podManagementPolicy": "OrderedReady",
      "replicas": 1,
      "revisionHistoryLimit": 10,
      "selector": {
        "matchLabels": {
          "app": "aerospike",
          "release": "test"
        }
      },
      "serviceName": "test-aerospike",
      "template": {
        "metadata": {
          "annotations": {
            "checksum/config": "0e07919467cc16f2c07ac99d0036405deafa06f7d3b430215915470b3a6ca631"
          },
          "labels": {
            "app": "aerospike",
            "release": "test"
          }
        },
        "spec": {
          "containers": [
            {
              "image": "aerospike/aerospike-server:4.5.0.5",
              "imagePullPolicy": "IfNotPresent",
              "name": "test-aerospike",
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
                }
              ]
            }
          ],
          "dnsPolicy": "ClusterFirst",
          "restartPolicy": "Always",
          "schedulerName": "default-scheduler",
          "securityContext": {},
          "terminationGracePeriodSeconds": 30,
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
                "name": "test-aerospike"
              },
              "name": "config-volume"
            }
          ]
        }
      },
      "updateStrategy": {
        "rollingUpdate": {
          "partition": 0
        },
        "type": "RollingUpdate"
      }
    },
    "status": {
      "collisionCount": 0,
      "currentReplicas": 1,
      "currentRevision": "test-aerospike-6db7776c7d",
      "observedGeneration": 1,
      "readyReplicas": 1,
      "replicas": 1,
      "updateRevision": "test-aerospike-6db7776c7d",
      "updatedReplicas": 1
    }
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/statefulsets/:id</code>

Retrieve a stateful set and all its info in a given [environment](#administration-environments).

| Attributes                                 | &nbsp;                                                          |
| ------------------------------------------ | --------------------------------------------------------------- |
| `id` <br/>*string*                         | The id of the stateful set                                      |
| `metadata` <br/>*object*                   | The metadata of the stateful set                                |
| `metadata.creationTimestamp` <br/>*string* | The date of creation of the stateful set as a string            |
| `metadata.labels` <br/>*map*               | The labels associated to the stateful                           |
| `metadata.name` <br/>*string*              | The name of the stateful set                                    |
| `metadata.namespace` <br/>*string*         | The namespace in which the stateful set is created              |
| `metadata.uid` <br/>*object*               | The UUID of the stateful set                                    |
| `spec`<br/>*object*                        | The specification used to create and run the stateful set       |
| `status`<br/>*object*                      | The status information of the stateful set                      |
| `status.readyReplicas`<br/>*integer*       | Total number of ready pods targeted by this deployment          |
| `status.replicas`<br/>*integer*            | Total number of non-terminated pods targeted by this deployment |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).
