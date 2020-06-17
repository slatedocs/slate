### Daemon Sets

<!-------------------- LIST DAEMON SETS -------------------->

#### List daemon sets

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/daemonsets?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "id": "kube-proxy/kube-system",
            "readyRatio": "3/3",
            "metadata": {
                "annotations": {
                    "deprecated.daemonset.template.generation": "1",
                    "kubectl.kubernetes.io/last-applied-configuration": "{\"apiVersion\":\"apps/v1\",\"kind\":\"DaemonSet\",\"metadata\":{\"annotations\":{},\"labels\":{\"addonmanager.kubernetes.io/mode\":\"Reconcile\",\"component\":\"kube-proxy\",\"tier\":\"node\"},\"name\":\"kube-proxy\",\"namespace\":\"kube-system\"},\"spec\":{\"selector\":{\"matchLabels\":{\"component\":\"kube-proxy\",\"tier\":\"node\"}},\"template\":{\"metadata\":{\"annotations\":null,\"labels\":{\"component\":\"kube-proxy\",\"tier\":\"node\"}},\"spec\":{\"affinity\":{\"nodeAffinity\":{\"requiredDuringSchedulingIgnoredDuringExecution\":{\"nodeSelectorTerms\":[{\"labelSelector\":null,\"matchExpressions\":[{\"key\":\"kubernetes.azure.com/cluster\",\"operator\":\"Exists\"}]}]}}},\"containers\":[{\"command\":[\"/hyperkube\",\"kube-proxy\",\"--kubeconfig=/var/lib/kubelet/kubeconfig\",\"--cluster-cidr=10.244.0.0/16\",\"--v=3\"],\"image\":\"mcr.microsoft.com/oss/kubernetes/hyperkube:v1.18.2.1\",\"name\":\"kube-proxy\",\"resources\":{\"requests\":{\"cpu\":\"100m\"}},\"securityContext\":{\"privileged\":true},\"volumeMounts\":[{\"mountPath\":\"/var/lib/kubelet\",\"name\":\"kubeconfig\",\"readOnly\":true},{\"mountPath\":\"/etc/kubernetes/certs\",\"name\":\"certificates\",\"readOnly\":true},{\"mountPath\":\"/run/xtables.lock\",\"name\":\"iptableslock\"}]}],\"hostNetwork\":true,\"nodeSelector\":{\"beta.kubernetes.io/os\":\"linux\"},\"priorityClassName\":\"system-node-critical\",\"tolerations\":[{\"key\":\"CriticalAddonsOnly\",\"operator\":\"Exists\"},{\"effect\":\"NoExecute\",\"operator\":\"Exists\"},{\"effect\":\"NoSchedule\",\"operator\":\"Exists\"}],\"volumes\":[{\"hostPath\":{\"path\":\"/var/lib/kubelet\"},\"name\":\"kubeconfig\"},{\"hostPath\":{\"path\":\"/etc/kubernetes/certs\"},\"name\":\"certificates\"},{\"hostPath\":{\"path\":\"/run/xtables.lock\",\"type\":\"FileOrCreate\"},\"name\":\"iptableslock\"}]}},\"updateStrategy\":{\"rollingUpdate\":{\"maxUnavailable\":1},\"type\":\"RollingUpdate\"}}}\n"
                },
                "creationTimestamp": "2020-06-15T16:14:40.000-04:00",
                "generation": 1,
                "labels": {
                    "addonmanager.kubernetes.io/mode": "Reconcile",
                    "component": "kube-proxy",
                    "tier": "node"
                },
                "name": "kube-proxy",
                "namespace": "kube-system",
                "resourceVersion": "630",
                "selfLink": "/apis/apps/v1/namespaces/kube-system/daemonsets/kube-proxy",
                "uid": "ed01c14c-e722-44a0-a0b8-e1d55662a917"
            },
            "spec": {
                "revisionHistoryLimit": 10,
                "selector": {
                    "matchLabels": {
                        "component": "kube-proxy",
                        "tier": "node"
                    }
                },
                "template": {
                    "metadata": {
                        "labels": {
                            "component": "kube-proxy",
                            "tier": "node"
                        }
                    },
                    "spec": {
                        "affinity": {
                            "nodeAffinity": {
                                "requiredDuringSchedulingIgnoredDuringExecution": {
                                    "nodeSelectorTerms": [
                                        {
                                            "matchExpressions": [
                                                {
                                                    "key": "kubernetes.azure.com/cluster",
                                                    "operator": "Exists"
                                                }
                                            ]
                                        }
                                    ]
                                }
                            }
                        },
                        "containers": [
                            {
                                "command": [
                                    "/hyperkube",
                                    "kube-proxy",
                                    "--kubeconfig=/var/lib/kubelet/kubeconfig",
                                    "--cluster-cidr=10.244.0.0/16",
                                    "--v=3"
                                ],
                                "image": "mcr.microsoft.com/oss/kubernetes/hyperkube:v1.18.2.1",
                                "imagePullPolicy": "IfNotPresent",
                                "name": "kube-proxy",
                                "resources": {
                                    "requests": {
                                        "cpu": "100m"
                                    }
                                },
                                "securityContext": {
                                    "privileged": true
                                },
                                "terminationMessagePath": "/dev/termination-log",
                                "terminationMessagePolicy": "File",
                                "volumeMounts": [
                                    {
                                        "mountPath": "/var/lib/kubelet",
                                        "name": "kubeconfig",
                                        "readOnly": true
                                    },
                                    {
                                        "mountPath": "/etc/kubernetes/certs",
                                        "name": "certificates",
                                        "readOnly": true
                                    },
                                    {
                                        "mountPath": "/run/xtables.lock",
                                        "name": "iptableslock"
                                    }
                                ]
                            }
                        ],
                        "dnsPolicy": "ClusterFirst",
                        "hostNetwork": true,
                        "nodeSelector": {
                            "beta.kubernetes.io/os": "linux"
                        },
                        "priorityClassName": "system-node-critical",
                        "restartPolicy": "Always",
                        "schedulerName": "default-scheduler",
                        "securityContext": {},
                        "terminationGracePeriodSeconds": 30,
                        "tolerations": [
                            {
                                "key": "CriticalAddonsOnly",
                                "operator": "Exists"
                            },
                            {
                                "effect": "NoExecute",
                                "operator": "Exists"
                            },
                            {
                                "effect": "NoSchedule",
                                "operator": "Exists"
                            }
                        ],
                        "volumes": [
                            {
                                "hostPath": {
                                    "path": "/var/lib/kubelet",
                                    "type": ""
                                },
                                "name": "kubeconfig"
                            },
                            {
                                "hostPath": {
                                    "path": "/etc/kubernetes/certs",
                                    "type": ""
                                },
                                "name": "certificates"
                            },
                            {
                                "hostPath": {
                                    "path": "/run/xtables.lock",
                                    "type": "FileOrCreate"
                                },
                                "name": "iptableslock"
                            }
                        ]
                    }
                },
                "updateStrategy": {
                    "rollingUpdate": {
                        "maxUnavailable": "1"
                    },
                    "type": "RollingUpdate"
                }
            },
            "status": {
                "currentNumberScheduled": 3,
                "desiredNumberScheduled": 3,
                "numberAvailable": 3,
                "numberMisscheduled": 0,
                "numberReady": 3,
                "observedGeneration": 1,
                "updatedNumberScheduled": 3
            }
        },
        ...
    ],
    "metadata": {
        "recordCount": 5
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/daemonsets?cluster_id=:cluster_id</code>

Retrieve a list of all daemon sets in a given [environment](#administration-environments).

| Required                   | &nbsp;                                                  |
|----------------------------|---------------------------------------------------------|
| `cluster_id` <br/>*string* | The id of the cluster in which to list the daemon sets. |

| Attributes                                 | &nbsp;                                                  |
|--------------------------------------------|---------------------------------------------------------|
| `id` <br/>_string_                         | The id of the daemon set                                |
| `metadata` <br/>_object_                   | The metadata of the daemon set                          |
| `metadata.creationTimestamp` <br/>_string_ | The date of creation of the daemon set as a string      |
| `metadata.labels` <br/>_map_               | The labels associated to the daemon set                 |
| `metadata.name` <br/>_string_              | The name of the daemon set                              |
| `metadata.namespace` <br/>_string_         | The namespace in which the daemon set is created        |
| `metadata.uid` <br/>_object_               | The UUID of the daemon set                              |
| `spec`<br/>_object_                        | The specification used to create and run the daemon set |
| `status`<br/>_object_                      | The status information of the daemon set                |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).

<!-------------------- GET A DAEMON SET -------------------->

#### Get a daemon set

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/daemonsets/test-aerospike/auth?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": "kube-proxy/kube-system",
        "readyRatio": "3/3",
        "apiVersion": "apps/v1",
        "kind": "DaemonSet",
        "metadata": {
            "annotations": {
                "deprecated.daemonset.template.generation": "1",
                "kubectl.kubernetes.io/last-applied-configuration": "{\"apiVersion\":\"apps/v1\",\"kind\":\"DaemonSet\",\"metadata\":{\"annotations\":{},\"labels\":{\"addonmanager.kubernetes.io/mode\":\"Reconcile\",\"component\":\"kube-proxy\",\"tier\":\"node\"},\"name\":\"kube-proxy\",\"namespace\":\"kube-system\"},\"spec\":{\"selector\":{\"matchLabels\":{\"component\":\"kube-proxy\",\"tier\":\"node\"}},\"template\":{\"metadata\":{\"annotations\":null,\"labels\":{\"component\":\"kube-proxy\",\"tier\":\"node\"}},\"spec\":{\"affinity\":{\"nodeAffinity\":{\"requiredDuringSchedulingIgnoredDuringExecution\":{\"nodeSelectorTerms\":[{\"labelSelector\":null,\"matchExpressions\":[{\"key\":\"kubernetes.azure.com/cluster\",\"operator\":\"Exists\"}]}]}}},\"containers\":[{\"command\":[\"/hyperkube\",\"kube-proxy\",\"--kubeconfig=/var/lib/kubelet/kubeconfig\",\"--cluster-cidr=10.244.0.0/16\",\"--v=3\"],\"image\":\"mcr.microsoft.com/oss/kubernetes/hyperkube:v1.18.2.1\",\"name\":\"kube-proxy\",\"resources\":{\"requests\":{\"cpu\":\"100m\"}},\"securityContext\":{\"privileged\":true},\"volumeMounts\":[{\"mountPath\":\"/var/lib/kubelet\",\"name\":\"kubeconfig\",\"readOnly\":true},{\"mountPath\":\"/etc/kubernetes/certs\",\"name\":\"certificates\",\"readOnly\":true},{\"mountPath\":\"/run/xtables.lock\",\"name\":\"iptableslock\"}]}],\"hostNetwork\":true,\"nodeSelector\":{\"beta.kubernetes.io/os\":\"linux\"},\"priorityClassName\":\"system-node-critical\",\"tolerations\":[{\"key\":\"CriticalAddonsOnly\",\"operator\":\"Exists\"},{\"effect\":\"NoExecute\",\"operator\":\"Exists\"},{\"effect\":\"NoSchedule\",\"operator\":\"Exists\"}],\"volumes\":[{\"hostPath\":{\"path\":\"/var/lib/kubelet\"},\"name\":\"kubeconfig\"},{\"hostPath\":{\"path\":\"/etc/kubernetes/certs\"},\"name\":\"certificates\"},{\"hostPath\":{\"path\":\"/run/xtables.lock\",\"type\":\"FileOrCreate\"},\"name\":\"iptableslock\"}]}},\"updateStrategy\":{\"rollingUpdate\":{\"maxUnavailable\":1},\"type\":\"RollingUpdate\"}}}\n"
            },
            "creationTimestamp": "2020-06-15T16:14:40.000-04:00",
            "generation": 1,
            "labels": {
                "addonmanager.kubernetes.io/mode": "Reconcile",
                "component": "kube-proxy",
                "tier": "node"
            },
            "name": "kube-proxy",
            "namespace": "kube-system",
            "resourceVersion": "630",
            "selfLink": "/apis/apps/v1/namespaces/kube-system/daemonsets/kube-proxy",
            "uid": "ed01c14c-e722-44a0-a0b8-e1d55662a917"
        },
        "spec": {
            "revisionHistoryLimit": 10,
            "selector": {
                "matchLabels": {
                    "component": "kube-proxy",
                    "tier": "node"
                }
            },
            "template": {
                "metadata": {
                    "labels": {
                        "component": "kube-proxy",
                        "tier": "node"
                    }
                },
                "spec": {
                    "affinity": {
                        "nodeAffinity": {
                            "requiredDuringSchedulingIgnoredDuringExecution": {
                                "nodeSelectorTerms": [
                                    {
                                        "matchExpressions": [
                                            {
                                                "key": "kubernetes.azure.com/cluster",
                                                "operator": "Exists"
                                            }
                                        ]
                                    }
                                ]
                            }
                        }
                    },
                    "containers": [
                        {
                            "command": [
                                "/hyperkube",
                                "kube-proxy",
                                "--kubeconfig=/var/lib/kubelet/kubeconfig",
                                "--cluster-cidr=10.244.0.0/16",
                                "--v=3"
                            ],
                            "image": "mcr.microsoft.com/oss/kubernetes/hyperkube:v1.18.2.1",
                            "imagePullPolicy": "IfNotPresent",
                            "name": "kube-proxy",
                            "resources": {
                                "requests": {
                                    "cpu": "100m"
                                }
                            },
                            "securityContext": {
                                "privileged": true
                            },
                            "terminationMessagePath": "/dev/termination-log",
                            "terminationMessagePolicy": "File",
                            "volumeMounts": [
                                {
                                    "mountPath": "/var/lib/kubelet",
                                    "name": "kubeconfig",
                                    "readOnly": true
                                },
                                {
                                    "mountPath": "/etc/kubernetes/certs",
                                    "name": "certificates",
                                    "readOnly": true
                                },
                                {
                                    "mountPath": "/run/xtables.lock",
                                    "name": "iptableslock"
                                }
                            ]
                        }
                    ],
                    "dnsPolicy": "ClusterFirst",
                    "hostNetwork": true,
                    "nodeSelector": {
                        "beta.kubernetes.io/os": "linux"
                    },
                    "priorityClassName": "system-node-critical",
                    "restartPolicy": "Always",
                    "schedulerName": "default-scheduler",
                    "securityContext": {},
                    "terminationGracePeriodSeconds": 30,
                    "tolerations": [
                        {
                            "key": "CriticalAddonsOnly",
                            "operator": "Exists"
                        },
                        {
                            "effect": "NoExecute",
                            "operator": "Exists"
                        },
                        {
                            "effect": "NoSchedule",
                            "operator": "Exists"
                        }
                    ],
                    "volumes": [
                        {
                            "hostPath": {
                                "path": "/var/lib/kubelet",
                                "type": ""
                            },
                            "name": "kubeconfig"
                        },
                        {
                            "hostPath": {
                                "path": "/etc/kubernetes/certs",
                                "type": ""
                            },
                            "name": "certificates"
                        },
                        {
                            "hostPath": {
                                "path": "/run/xtables.lock",
                                "type": "FileOrCreate"
                            },
                            "name": "iptableslock"
                        }
                    ]
                }
            },
            "updateStrategy": {
                "rollingUpdate": {
                    "maxUnavailable": "1"
                },
                "type": "RollingUpdate"
            }
        },
        "status": {
            "currentNumberScheduled": 3,
            "desiredNumberScheduled": 3,
            "numberAvailable": 3,
            "numberMisscheduled": 0,
            "numberReady": 3,
            "observedGeneration": 1,
            "updatedNumberScheduled": 3
        }
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/daemonsets/:id?cluster_id=:cluster_id</code>

Retrieve a daemon set and all its info in a given [environment](#administration-environments).

| Required                   | &nbsp;                                                |
|----------------------------|-------------------------------------------------------|
| `cluster_id` <br/>*string* | The id of the cluster in which to get the daemon set. |

| Attributes                                 | &nbsp;                                                  |
|--------------------------------------------|---------------------------------------------------------|
| `id` <br/>_string_                         | The id of the daemon set                                |
| `metadata` <br/>_object_                   | The metadata of the daemon set                          |
| `metadata.creationTimestamp` <br/>_string_ | The date of creation of the daemon set as a string      |
| `metadata.labels` <br/>_map_               | The labels associated to the daemon set                 |
| `metadata.name` <br/>_string_              | The name of the daemon set                              |
| `metadata.namespace` <br/>_string_         | The namespace in which the daemon set is created        |
| `metadata.uid` <br/>_object_               | The UUID of the daemon set                              |
| `spec`<br/>_object_                        | The specification used to create and run the daemon set |
| `status`<br/>_object_                      | The status information of the daemon set                |

Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).
