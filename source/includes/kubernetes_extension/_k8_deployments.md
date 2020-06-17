### Deployments

<!-------------------- LIST DEPLOYMENTS -------------------->

#### List deployments

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/deployments?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "id": "coredns/kube-system",
            "deploymentStatus": "Progressing",
            "readyRatio": "2/2",
            "metadata": {
                "annotations": {
                    "deployment.kubernetes.io/revision": "1",
                    "kubectl.kubernetes.io/last-applied-configuration": "{\"apiVersion\":\"apps/v1\",\"kind\":\"Deployment\",\"metadata\":{\"annotations\":{},\"labels\":{\"addonmanager.kubernetes.io/mode\":\"Reconcile\",\"k8s-app\":\"kube-dns\",\"kubernetes.io/cluster-service\":\"true\",\"kubernetes.io/name\":\"CoreDNS\",\"version\":\"v20\"},\"name\":\"coredns\",\"namespace\":\"kube-system\"},\"spec\":{\"paused\":false,\"selector\":{\"matchLabels\":{\"k8s-app\":\"kube-dns\",\"version\":\"v20\"}},\"strategy\":{\"rollingUpdate\":{\"maxUnavailable\":1},\"type\":\"RollingUpdate\"},\"template\":{\"metadata\":{\"annotations\":{\"prometheus.io/port\":\"9153\"},\"labels\":{\"k8s-app\":\"kube-dns\",\"kubernetes.io/cluster-service\":\"true\",\"version\":\"v20\"}},\"spec\":{\"affinity\":{\"podAntiAffinity\":{\"preferredDuringSchedulingIgnoredDuringExecution\":[{\"podAffinityTerm\":{\"labelSelector\":{\"matchExpressions\":[{\"key\":\"k8s-app\",\"operator\":\"In\",\"values\":[\"kube-dns\"]}]},\"topologyKey\":\"failure-domain.beta.kubernetes.io/zone\"},\"weight\":10},{\"podAffinityTerm\":{\"labelSelector\":{\"matchExpressions\":[{\"key\":\"k8s-app\",\"operator\":\"In\",\"values\":[\"kube-dns\"]}]},\"topologyKey\":\"kubernetes.io/hostname\"},\"weight\":5}]}},\"containers\":[{\"args\":[\"-conf\",\"/etc/coredns/Corefile\"],\"image\":\"mcr.microsoft.com/oss/kubernetes/coredns:1.6.6\",\"imagePullPolicy\":\"IfNotPresent\",\"livenessProbe\":{\"failureThreshold\":5,\"httpGet\":{\"path\":\"/health\",\"port\":8080,\"scheme\":\"HTTP\"},\"initialDelaySeconds\":60,\"successThreshold\":1,\"timeoutSeconds\":5},\"name\":\"coredns\",\"ports\":[{\"containerPort\":53,\"name\":\"dns\",\"protocol\":\"UDP\"},{\"containerPort\":53,\"name\":\"dns-tcp\",\"protocol\":\"TCP\"},{\"containerPort\":9153,\"name\":\"metrics\",\"protocol\":\"TCP\"}],\"resources\":{\"limits\":{\"memory\":\"170Mi\"},\"requests\":{\"cpu\":\"100m\",\"memory\":\"70Mi\"}},\"securityContext\":{\"allowPrivilegeEscalation\":false,\"capabilities\":{\"add\":[\"NET_BIND_SERVICE\"],\"drop\":[\"all\"]},\"procMount\":\"Default\",\"readOnlyRootFilesystem\":true},\"volumeMounts\":[{\"mountPath\":\"/etc/coredns\",\"name\":\"config-volume\",\"readOnly\":true},{\"mountPath\":\"/etc/coredns/custom\",\"name\":\"custom-config-volume\",\"readOnly\":true},{\"mountPath\":\"/tmp\",\"name\":\"tmp\"}]}],\"dnsPolicy\":\"Default\",\"nodeSelector\":{\"beta.kubernetes.io/os\":\"linux\"},\"priorityClassName\":\"system-node-critical\",\"serviceAccountName\":\"coredns\",\"tolerations\":[{\"effect\":\"NoSchedule\",\"key\":\"node-role.kubernetes.io/master\"},{\"key\":\"CriticalAddonsOnly\",\"operator\":\"Exists\"}],\"volumes\":[{\"configMap\":{\"items\":[{\"key\":\"Corefile\",\"path\":\"Corefile\"}],\"name\":\"coredns\"},\"name\":\"config-volume\"},{\"configMap\":{\"name\":\"coredns-custom\",\"optional\":true},\"name\":\"custom-config-volume\"},{\"emptyDir\":{},\"name\":\"tmp\"}]}}}}\n"
                },
                "creationTimestamp": "2020-06-15T16:14:37.000-04:00",
                "generation": 2,
                "labels": {
                    "addonmanager.kubernetes.io/mode": "Reconcile",
                    "k8s-app": "kube-dns",
                    "kubernetes.io/cluster-service": "true",
                    "kubernetes.io/name": "CoreDNS",
                    "version": "v20"
                },
                "name": "coredns",
                "namespace": "kube-system",
                "resourceVersion": "653",
                "selfLink": "/apis/apps/v1/namespaces/kube-system/deployments/coredns",
                "uid": "4c15009d-1e32-4b73-9c82-559b81f1bd93"
            },
            "spec": {
                "progressDeadlineSeconds": 600,
                "replicas": 2,
                "revisionHistoryLimit": 10,
                "selector": {
                    "matchLabels": {
                        "k8s-app": "kube-dns",
                        "version": "v20"
                    }
                },
                "strategy": {
                    "rollingUpdate": {
                        "maxSurge": "25%",
                        "maxUnavailable": 1
                    },
                    "type": "RollingUpdate"
                },
                "template": {
                    "metadata": {
                        "annotations": {
                            "prometheus.io/port": "9153"
                        },
                        "labels": {
                            "k8s-app": "kube-dns",
                            "kubernetes.io/cluster-service": "true",
                            "version": "v20"
                        }
                    },
                    "spec": {
                        "affinity": {
                            "podAntiAffinity": {
                                "preferredDuringSchedulingIgnoredDuringExecution": [
                                    {
                                        "podAffinityTerm": {
                                            "labelSelector": {
                                                "matchExpressions": [
                                                    {
                                                        "key": "k8s-app",
                                                        "operator": "In",
                                                        "values": [
                                                            "kube-dns"
                                                        ]
                                                    }
                                                ]
                                            },
                                            "topologyKey": "failure-domain.beta.kubernetes.io/zone"
                                        },
                                        "weight": 10
                                    },
                                    {
                                        "podAffinityTerm": {
                                            "labelSelector": {
                                                "matchExpressions": [
                                                    {
                                                        "key": "k8s-app",
                                                        "operator": "In",
                                                        "values": [
                                                            "kube-dns"
                                                        ]
                                                    }
                                                ]
                                            },
                                            "topologyKey": "kubernetes.io/hostname"
                                        },
                                        "weight": 5
                                    }
                                ]
                            }
                        },
                        "containers": [
                            {
                                "args": [
                                    "-conf",
                                    "/etc/coredns/Corefile"
                                ],
                                "image": "mcr.microsoft.com/oss/kubernetes/coredns:1.6.6",
                                "imagePullPolicy": "IfNotPresent",
                                "livenessProbe": {
                                    "failureThreshold": 5,
                                    "httpGet": {
                                        "path": "/health",
                                        "port": 8080,
                                        "scheme": "HTTP"
                                    },
                                    "initialDelaySeconds": 60,
                                    "periodSeconds": 10,
                                    "successThreshold": 1,
                                    "timeoutSeconds": 5
                                },
                                "name": "coredns",
                                "ports": [
                                    {
                                        "containerPort": 53,
                                        "name": "dns",
                                        "protocol": "UDP"
                                    },
                                    {
                                        "containerPort": 53,
                                        "name": "dns-tcp",
                                        "protocol": "TCP"
                                    },
                                    {
                                        "containerPort": 9153,
                                        "name": "metrics",
                                        "protocol": "TCP"
                                    }
                                ],
                                "resources": {
                                    "limits": {
                                        "memory": "170Mi"
                                    },
                                    "requests": {
                                        "cpu": "100m",
                                        "memory": "70Mi"
                                    }
                                },
                                "securityContext": {
                                    "allowPrivilegeEscalation": false,
                                    "capabilities": {
                                        "add": [
                                            "NET_BIND_SERVICE"
                                        ],
                                        "drop": [
                                            "all"
                                        ]
                                    },
                                    "procMount": "Default",
                                    "readOnlyRootFilesystem": true
                                },
                                "terminationMessagePath": "/dev/termination-log",
                                "terminationMessagePolicy": "File",
                                "volumeMounts": [
                                    {
                                        "mountPath": "/etc/coredns",
                                        "name": "config-volume",
                                        "readOnly": true
                                    },
                                    {
                                        "mountPath": "/etc/coredns/custom",
                                        "name": "custom-config-volume",
                                        "readOnly": true
                                    },
                                    {
                                        "mountPath": "/tmp",
                                        "name": "tmp"
                                    }
                                ]
                            }
                        ],
                        "dnsPolicy": "Default",
                        "nodeSelector": {
                            "beta.kubernetes.io/os": "linux"
                        },
                        "priorityClassName": "system-node-critical",
                        "restartPolicy": "Always",
                        "schedulerName": "default-scheduler",
                        "securityContext": {},
                        "serviceAccount": "coredns",
                        "serviceAccountName": "coredns",
                        "terminationGracePeriodSeconds": 30,
                        "tolerations": [
                            {
                                "effect": "NoSchedule",
                                "key": "node-role.kubernetes.io/master"
                            },
                            {
                                "key": "CriticalAddonsOnly",
                                "operator": "Exists"
                            }
                        ],
                        "volumes": [
                            {
                                "configMap": {
                                    "defaultMode": 420,
                                    "items": [
                                        {
                                            "key": "Corefile",
                                            "path": "Corefile"
                                        }
                                    ],
                                    "name": "coredns"
                                },
                                "name": "config-volume"
                            },
                            {
                                "configMap": {
                                    "defaultMode": 420,
                                    "name": "coredns-custom",
                                    "optional": true
                                },
                                "name": "custom-config-volume"
                            },
                            {
                                "emptyDir": {},
                                "name": "tmp"
                            }
                        ]
                    }
                }
            },
            "status": {
                "availableReplicas": 2,
                "conditions": [
                    {
                        "lastTransitionTime": "2020-06-15T16:16:23.000-04:00",
                        "lastUpdateTime": "2020-06-15T16:16:23.000-04:00",
                        "message": "Deployment has minimum availability.",
                        "reason": "MinimumReplicasAvailable",
                        "status": "True",
                        "type": "Available"
                    },
                    {
                        "lastTransitionTime": "2020-06-15T16:14:37.000-04:00",
                        "lastUpdateTime": "2020-06-15T16:16:27.000-04:00",
                        "message": "ReplicaSet \"coredns-698df7b9b5\" has successfully progressed.",
                        "reason": "NewReplicaSetAvailable",
                        "status": "True",
                        "type": "Progressing"
                    }
                ],
                "observedGeneration": 2,
                "readyReplicas": 2,
                "replicas": 2,
                "updatedReplicas": 2
            }
        },
        ...
    ],
    "metadata": {
        "recordCount": 6
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/deployments?cluster_id=:cluster_id</code>

Retrieve a list of all deployments in a given [environment](#administration-environments).

| Required                   | &nbsp;                                                  |
|----------------------------|---------------------------------------------------------|
| `cluster_id` <br/>*string* | The id of the cluster in which to list the deployments. |

| Attributes                                 | &nbsp;                                                          |
| ------------------------------------------ | --------------------------------------------------------------- |
| `id` <br/>_string_                         | The id of the deployment                                        |
| `metadata` <br/>_object_                   | The metadata of the deployment                                  |
| `metadata.name` <br/>_string_              | The name of the deployment                                      |
| `metadata.namespace` <br/>_string_         | The namespace in which the deployment is created                |
| `metadata.uid` <br/>_object_               | The UUID of the deployment                                      |
| `images` <br/>_object_                     | The container images within a deployment                        |
| `spec`<br/>_object_                        | The specification used to create and run the deployment         |
| `status`<br/>_object_                      | The status information of the deployment                        |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- GET A DEPLOYMENT -------------------->

#### Get a deployment

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/k8s/an_environment/deployments/coredns/kube-system?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": "coredns/kube-system",
        "deploymentStatus": "Progressing",
        "readyRatio": "2/2",
        "apiVersion": "apps/v1",
        "kind": "Deployment",
        "metadata": {
            "annotations": {
                "deployment.kubernetes.io/revision": "1",
                "kubectl.kubernetes.io/last-applied-configuration": "{\"apiVersion\":\"apps/v1\",\"kind\":\"Deployment\",\"metadata\":{\"annotations\":{},\"labels\":{\"addonmanager.kubernetes.io/mode\":\"Reconcile\",\"k8s-app\":\"kube-dns\",\"kubernetes.io/cluster-service\":\"true\",\"kubernetes.io/name\":\"CoreDNS\",\"version\":\"v20\"},\"name\":\"coredns\",\"namespace\":\"kube-system\"},\"spec\":{\"paused\":false,\"selector\":{\"matchLabels\":{\"k8s-app\":\"kube-dns\",\"version\":\"v20\"}},\"strategy\":{\"rollingUpdate\":{\"maxUnavailable\":1},\"type\":\"RollingUpdate\"},\"template\":{\"metadata\":{\"annotations\":{\"prometheus.io/port\":\"9153\"},\"labels\":{\"k8s-app\":\"kube-dns\",\"kubernetes.io/cluster-service\":\"true\",\"version\":\"v20\"}},\"spec\":{\"affinity\":{\"podAntiAffinity\":{\"preferredDuringSchedulingIgnoredDuringExecution\":[{\"podAffinityTerm\":{\"labelSelector\":{\"matchExpressions\":[{\"key\":\"k8s-app\",\"operator\":\"In\",\"values\":[\"kube-dns\"]}]},\"topologyKey\":\"failure-domain.beta.kubernetes.io/zone\"},\"weight\":10},{\"podAffinityTerm\":{\"labelSelector\":{\"matchExpressions\":[{\"key\":\"k8s-app\",\"operator\":\"In\",\"values\":[\"kube-dns\"]}]},\"topologyKey\":\"kubernetes.io/hostname\"},\"weight\":5}]}},\"containers\":[{\"args\":[\"-conf\",\"/etc/coredns/Corefile\"],\"image\":\"mcr.microsoft.com/oss/kubernetes/coredns:1.6.6\",\"imagePullPolicy\":\"IfNotPresent\",\"livenessProbe\":{\"failureThreshold\":5,\"httpGet\":{\"path\":\"/health\",\"port\":8080,\"scheme\":\"HTTP\"},\"initialDelaySeconds\":60,\"successThreshold\":1,\"timeoutSeconds\":5},\"name\":\"coredns\",\"ports\":[{\"containerPort\":53,\"name\":\"dns\",\"protocol\":\"UDP\"},{\"containerPort\":53,\"name\":\"dns-tcp\",\"protocol\":\"TCP\"},{\"containerPort\":9153,\"name\":\"metrics\",\"protocol\":\"TCP\"}],\"resources\":{\"limits\":{\"memory\":\"170Mi\"},\"requests\":{\"cpu\":\"100m\",\"memory\":\"70Mi\"}},\"securityContext\":{\"allowPrivilegeEscalation\":false,\"capabilities\":{\"add\":[\"NET_BIND_SERVICE\"],\"drop\":[\"all\"]},\"procMount\":\"Default\",\"readOnlyRootFilesystem\":true},\"volumeMounts\":[{\"mountPath\":\"/etc/coredns\",\"name\":\"config-volume\",\"readOnly\":true},{\"mountPath\":\"/etc/coredns/custom\",\"name\":\"custom-config-volume\",\"readOnly\":true},{\"mountPath\":\"/tmp\",\"name\":\"tmp\"}]}],\"dnsPolicy\":\"Default\",\"nodeSelector\":{\"beta.kubernetes.io/os\":\"linux\"},\"priorityClassName\":\"system-node-critical\",\"serviceAccountName\":\"coredns\",\"tolerations\":[{\"effect\":\"NoSchedule\",\"key\":\"node-role.kubernetes.io/master\"},{\"key\":\"CriticalAddonsOnly\",\"operator\":\"Exists\"}],\"volumes\":[{\"configMap\":{\"items\":[{\"key\":\"Corefile\",\"path\":\"Corefile\"}],\"name\":\"coredns\"},\"name\":\"config-volume\"},{\"configMap\":{\"name\":\"coredns-custom\",\"optional\":true},\"name\":\"custom-config-volume\"},{\"emptyDir\":{},\"name\":\"tmp\"}]}}}}\n"
            },
            "creationTimestamp": "2020-06-15T16:14:37.000-04:00",
            "generation": 2,
            "labels": {
                "addonmanager.kubernetes.io/mode": "Reconcile",
                "k8s-app": "kube-dns",
                "kubernetes.io/cluster-service": "true",
                "kubernetes.io/name": "CoreDNS",
                "version": "v20"
            },
            "name": "coredns",
            "namespace": "kube-system",
            "resourceVersion": "653",
            "selfLink": "/apis/apps/v1/namespaces/kube-system/deployments/coredns",
            "uid": "4c15009d-1e32-4b73-9c82-559b81f1bd93"
        },
        "spec": {
            "progressDeadlineSeconds": 600,
            "replicas": 2,
            "revisionHistoryLimit": 10,
            "selector": {
                "matchLabels": {
                    "k8s-app": "kube-dns",
                    "version": "v20"
                }
            },
            "strategy": {
                "rollingUpdate": {
                    "maxSurge": "25%",
                    "maxUnavailable": 1
                },
                "type": "RollingUpdate"
            },
            "template": {
                "metadata": {
                    "annotations": {
                        "prometheus.io/port": "9153"
                    },
                    "labels": {
                        "k8s-app": "kube-dns",
                        "kubernetes.io/cluster-service": "true",
                        "version": "v20"
                    }
                },
                "spec": {
                    "affinity": {
                        "podAntiAffinity": {
                            "preferredDuringSchedulingIgnoredDuringExecution": [
                                {
                                    "podAffinityTerm": {
                                        "labelSelector": {
                                            "matchExpressions": [
                                                {
                                                    "key": "k8s-app",
                                                    "operator": "In",
                                                    "values": [
                                                        "kube-dns"
                                                    ]
                                                }
                                            ]
                                        },
                                        "topologyKey": "failure-domain.beta.kubernetes.io/zone"
                                    },
                                    "weight": 10
                                },
                                {
                                    "podAffinityTerm": {
                                        "labelSelector": {
                                            "matchExpressions": [
                                                {
                                                    "key": "k8s-app",
                                                    "operator": "In",
                                                    "values": [
                                                        "kube-dns"
                                                    ]
                                                }
                                            ]
                                        },
                                        "topologyKey": "kubernetes.io/hostname"
                                    },
                                    "weight": 5
                                }
                            ]
                        }
                    },
                    "containers": [
                        {
                            "args": [
                                "-conf",
                                "/etc/coredns/Corefile"
                            ],
                            "image": "mcr.microsoft.com/oss/kubernetes/coredns:1.6.6",
                            "imagePullPolicy": "IfNotPresent",
                            "livenessProbe": {
                                "failureThreshold": 5,
                                "httpGet": {
                                    "path": "/health",
                                    "port": 8080,
                                    "scheme": "HTTP"
                                },
                                "initialDelaySeconds": 60,
                                "periodSeconds": 10,
                                "successThreshold": 1,
                                "timeoutSeconds": 5
                            },
                            "name": "coredns",
                            "ports": [
                                {
                                    "containerPort": 53,
                                    "name": "dns",
                                    "protocol": "UDP"
                                },
                                {
                                    "containerPort": 53,
                                    "name": "dns-tcp",
                                    "protocol": "TCP"
                                },
                                {
                                    "containerPort": 9153,
                                    "name": "metrics",
                                    "protocol": "TCP"
                                }
                            ],
                            "resources": {
                                "limits": {
                                    "memory": "170Mi"
                                },
                                "requests": {
                                    "cpu": "100m",
                                    "memory": "70Mi"
                                }
                            },
                            "securityContext": {
                                "allowPrivilegeEscalation": false,
                                "capabilities": {
                                    "add": [
                                        "NET_BIND_SERVICE"
                                    ],
                                    "drop": [
                                        "all"
                                    ]
                                },
                                "procMount": "Default",
                                "readOnlyRootFilesystem": true
                            },
                            "terminationMessagePath": "/dev/termination-log",
                            "terminationMessagePolicy": "File",
                            "volumeMounts": [
                                {
                                    "mountPath": "/etc/coredns",
                                    "name": "config-volume",
                                    "readOnly": true
                                },
                                {
                                    "mountPath": "/etc/coredns/custom",
                                    "name": "custom-config-volume",
                                    "readOnly": true
                                },
                                {
                                    "mountPath": "/tmp",
                                    "name": "tmp"
                                }
                            ]
                        }
                    ],
                    "dnsPolicy": "Default",
                    "nodeSelector": {
                        "beta.kubernetes.io/os": "linux"
                    },
                    "priorityClassName": "system-node-critical",
                    "restartPolicy": "Always",
                    "schedulerName": "default-scheduler",
                    "securityContext": {},
                    "serviceAccount": "coredns",
                    "serviceAccountName": "coredns",
                    "terminationGracePeriodSeconds": 30,
                    "tolerations": [
                        {
                            "effect": "NoSchedule",
                            "key": "node-role.kubernetes.io/master"
                        },
                        {
                            "key": "CriticalAddonsOnly",
                            "operator": "Exists"
                        }
                    ],
                    "volumes": [
                        {
                            "configMap": {
                                "defaultMode": 420,
                                "items": [
                                    {
                                        "key": "Corefile",
                                        "path": "Corefile"
                                    }
                                ],
                                "name": "coredns"
                            },
                            "name": "config-volume"
                        },
                        {
                            "configMap": {
                                "defaultMode": 420,
                                "name": "coredns-custom",
                                "optional": true
                            },
                            "name": "custom-config-volume"
                        },
                        {
                            "emptyDir": {},
                            "name": "tmp"
                        }
                    ]
                }
            }
        },
        "status": {
            "availableReplicas": 2,
            "conditions": [
                {
                    "lastTransitionTime": "2020-06-15T16:16:23.000-04:00",
                    "lastUpdateTime": "2020-06-15T16:16:23.000-04:00",
                    "message": "Deployment has minimum availability.",
                    "reason": "MinimumReplicasAvailable",
                    "status": "True",
                    "type": "Available"
                },
                {
                    "lastTransitionTime": "2020-06-15T16:14:37.000-04:00",
                    "lastUpdateTime": "2020-06-15T16:16:27.000-04:00",
                    "message": "ReplicaSet \"coredns-698df7b9b5\" has successfully progressed.",
                    "reason": "NewReplicaSetAvailable",
                    "status": "True",
                    "type": "Progressing"
                }
            ],
            "observedGeneration": 2,
            "readyReplicas": 2,
            "replicas": 2,
            "updatedReplicas": 2
        }
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/deployments/:id?cluster_id=:cluster_id</code>

Retrieve a deployment and all its info in a given [environment](#administration-environments).

| Required                   | &nbsp;                                                |
|----------------------------|-------------------------------------------------------|
| `cluster_id` <br/>*string* | The id of the cluster in which to get the deployment. |

| Attributes                                 | &nbsp;                                                          |
| ------------------------------------------ | --------------------------------------------------------------- |
| `id` <br/>_string_                         | The id of the deployment                                        |
| `metadata` <br/>_object_                   | The metadata of the deployment                                  |
| `metadata.name` <br/>_string_              | The name of the deployment                                      |
| `metadata.namespace` <br/>_string_         | The namespace in which the deployment is created                |
| `metadata.uid` <br/>_object_               | The UUID of the deployment                                      |
| `images` <br/>_object_                     | The container images within a deployment                        |
| `spec`<br/>_object_                        | The specification used to create and run the deployment         |
| `status`<br/>_object_                      | The status information of the deployment                        |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).
