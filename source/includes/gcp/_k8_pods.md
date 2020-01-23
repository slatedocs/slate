### Pods


<!-------------------- LIST PODS -------------------->

#### List pods

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/k8s/anenvironment/pods?cluster_id=projects/cmc-k8s-enabled-llb/locations/us-central1-a/clusters/standard-cluster-1"

# The above command returns JSON structured like this:
```
```json
{
  "data": [
    {
      "id": "alavoie-consul-0/default",
      "metadata": {
        "creationTimestamp": "2020-01-22T09:10:14.000-05:00",
        "generateName": "alavoie-consul-",
        "labels": {
          "chart": "consul-3.9.4",
          "component": "alavoie-consul",
          "controller-revision-hash": "alavoie-consul-fbd44db4d",
          "heritage": "Helm",
          "release": "alavoie",
          "statefulset.kubernetes.io/pod-name": "alavoie-consul-0"
        },
        "name": "alavoie-consul-0",
        "namespace": "default",
        "ownerReferences": [
          {
            "apiVersion": "apps/v1",
            "blockOwnerDeletion": true,
            "controller": true,
            "kind": "StatefulSet",
            "name": "alavoie-consul",
            "uid": "8f793ec4-39ff-11ea-8e85-025000000001"
          }
        ],
        "resourceVersion": "103705",
        "selfLink": "/api/v1/namespaces/default/pods/alavoie-consul-0",
        "uid": "e93003a2-3d20-11ea-ac6c-025000000001"
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
                        "key": "component",
                        "operator": "In",
                        "values": [
                          "alavoie-consul"
                        ]
                      }
                    ]
                  },
                  "topologyKey": "kubernetes.io/hostname"
                },
                "weight": 1
              }
            ]
          }
        },
        "containers": [
          {
            "command": [
              "/bin/sh",
              "-ec",
              "set -o pipefail\n\nif [ -z \"$POD_IP\"  ]; then\n  POD_IP=$(hostname -i)\nfi\nFQDN_SUFFIX=\"${STATEFULSET_NAME}.${STATEFULSET_NAMESPACE}.svc\"\nNODE_NAME=\"$(hostname -s).${FQDN_SUFFIX}\"\nif [ -e /etc/consul/secrets/gossip-key ]; then\n  echo \"{\\\"encrypt\\\": \\\"$(base64 /etc/consul/secrets/gossip-key)\\\"}\" > /etc/consul/encrypt.json\n  GOSSIP_KEY=\"-config-file /etc/consul/encrypt.json\"\nfi\n\nJOIN_PEERS=\"\"\nJOIN_PEERS=\"\"\nfor i in $( seq 0 $((${INITIAL_CLUSTER_SIZE} - 1)) ); do\n  JOIN_PEERS=\"${JOIN_PEERS}${JOIN_PEERS:+ }${STATEFULSET_NAME}-${i}.${FQDN_SUFFIX}\"\ndone\n\nJOIN_PEERS=$( printf \"%s\\n\" $JOIN_PEERS | sort | uniq )\n\n# Require multiple loops in the case of unstable DNS resolution\nSUCCESS_LOOPS=5\nwhile [ \"$SUCCESS_LOOPS\" -gt 0 ]; do\n  ALL_READY=true\n  JOIN_LAN=\"\"\n  for THIS_PEER in $JOIN_PEERS; do\n      # Make sure we can resolve hostname and ping IP\n      if PEER_IP=\"$(ping -c 1 $THIS_PEER | awk -F'[()]' '/PING/{print $2}')\" && [ \"$PEER_IP\" != \"\" ]; then\n        if [ \"${PEER_IP}\" != \"${POD_IP}\" ]; then\n          JOIN_LAN=\"${JOIN_LAN}${JOIN_LAN:+ } -retry-join=$THIS_PEER\"\n        fi\n      else\n        ALL_READY=false\n        break\n      fi\n  done\n  if $ALL_READY; then\n    SUCCESS_LOOPS=$(( SUCCESS_LOOPS - 1 ))\n    echo \"LAN peers appear ready, $SUCCESS_LOOPS verifications left\"\n  else\n    echo \"Waiting for LAN peer $THIS_PEER...\"\n  fi\n  sleep 1s\ndone\n\n\nWAN_PEERS=\"\"\n\nJOIN_WAN=\"\"\nSUCCESS_LOOPS=5\nwhile [ \"$WAN_PEERS\" != \"\" ] && [ \"$SUCCESS_LOOPS\" -gt 0 ]; do\n  ALL_READY=true\n  JOIN_WAN=\"\"\n  for THIS_PEER in $WAN_PEERS; do\n      # We don't care if we can ping the peer, but we do care that we can get its IP\n      if PEER_IP=\"$( ( ping -c 1 $THIS_PEER || true ) | awk -F'[()]' '/PING/{print $2}')\" && [ \"$PEER_IP\" != \"\" ]; then\n        if [ \"${PEER_IP}\" != \"${POD_IP}\" ]; then\n          JOIN_WAN=\"${JOIN_WAN}${JOIN_WAN:+ } -retry-join-wan=$THIS_PEER\"\n        fi\n      else\n        ALL_READY=false\n        break\n      fi\n  done\n  if $ALL_READY; then\n    SUCCESS_LOOPS=$(( SUCCESS_LOOPS - 1 ))\n    echo \"WAN peers appear ready, $SUCCESS_LOOPS verifications left\"\n  else\n    echo \"Waiting for WAN peer $THIS_PEER...\"\n  fi\n  sleep 1s\ndone\n\nexec /bin/consul agent \\\n  -ui \\\n  -domain=consul \\\n  -data-dir=/var/lib/consul \\\n  -server \\\n  -bootstrap-expect=$( echo \"$JOIN_PEERS\" | wc -w ) \\\n  -disable-keyring-file \\\n  -bind=0.0.0.0 \\\n  -advertise=${POD_IP} \\\n  ${JOIN_LAN} \\\n  ${JOIN_WAN} \\\n  ${GOSSIP_KEY} \\\n  -client=0.0.0.0 \\\n  -dns-port=${DNSPORT} \\\n  -http-port=8500\n"
            ],
            "env": [
              {
                "name": "INITIAL_CLUSTER_SIZE",
                "value": "3"
              },
              {
                "name": "STATEFULSET_NAME",
                "value": "alavoie-consul"
              },
              {
                "name": "POD_IP",
                "valueFrom": {
                  "fieldRef": {
                    "apiVersion": "v1",
                    "fieldPath": "status.podIP"
                  }
                }
              },
              {
                "name": "STATEFULSET_NAMESPACE",
                "valueFrom": {
                  "fieldRef": {
                    "apiVersion": "v1",
                    "fieldPath": "metadata.namespace"
                  }
                }
              },
              {
                "name": "DNSPORT",
                "value": "8600"
              }
            ],
            "image": "consul:1.5.3",
            "imagePullPolicy": "Always",
            "livenessProbe": {
              "exec": {
                "command": [
                  "consul",
                  "members",
                  "-http-addr=http://127.0.0.1:8500"
                ]
              },
              "failureThreshold": 3,
              "initialDelaySeconds": 300,
              "periodSeconds": 10,
              "successThreshold": 1,
              "timeoutSeconds": 5
            },
            "name": "alavoie-consul",
            "ports": [
              {
                "containerPort": 8500,
                "name": "http",
                "protocol": "TCP"
              },
              {
                "containerPort": 8400,
                "name": "rpc",
                "protocol": "TCP"
              },
              {
                "containerPort": 8301,
                "name": "serflan-tcp",
                "protocol": "TCP"
              },
              {
                "containerPort": 8301,
                "name": "serflan-udp",
                "protocol": "UDP"
              },
              {
                "containerPort": 8302,
                "name": "serfwan-tcp",
                "protocol": "TCP"
              },
              {
                "containerPort": 8302,
                "name": "serfwan-udp",
                "protocol": "UDP"
              },
              {
                "containerPort": 8300,
                "name": "server",
                "protocol": "TCP"
              },
              {
                "containerPort": 8600,
                "name": "consuldns-tcp",
                "protocol": "TCP"
              },
              {
                "containerPort": 8600,
                "name": "consuldns-udp",
                "protocol": "UDP"
              }
            ],
            "resources": {},
            "terminationMessagePath": "/dev/termination-log",
            "terminationMessagePolicy": "File",
            "volumeMounts": [
              {
                "mountPath": "/var/lib/consul",
                "name": "datadir"
              },
              {
                "mountPath": "/etc/consul/secrets",
                "name": "gossip-key",
                "readOnly": true
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
        "hostname": "alavoie-consul-0",
        "nodeName": "docker-desktop",
        "priority": 0,
        "restartPolicy": "Always",
        "schedulerName": "default-scheduler",
        "securityContext": {
          "fsGroup": 1000
        },
        "serviceAccount": "default",
        "serviceAccountName": "default",
        "subdomain": "alavoie-consul",
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
            "name": "datadir",
            "persistentVolumeClaim": {
              "claimName": "datadir-alavoie-consul-0"
            }
          },
          {
            "name": "gossip-key",
            "secret": {
              "defaultMode": 420,
              "secretName": "alavoie-consul-gossip-key"
            }
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
            "lastTransitionTime": "2020-01-22T09:10:14.000-05:00",
            "status": "True",
            "type": "Initialized"
          },
          {
            "lastTransitionTime": "2020-01-22T09:10:18.000-05:00",
            "status": "True",
            "type": "Ready"
          },
          {
            "lastTransitionTime": "2020-01-22T09:10:18.000-05:00",
            "status": "True",
            "type": "ContainersReady"
          },
          {
            "lastTransitionTime": "2020-01-22T09:10:14.000-05:00",
            "status": "True",
            "type": "PodScheduled"
          }
        ],
        "containerStatuses": [
          {
            "containerID": "docker://27f8b0975074553a5f827c24fed9c9bd70189148e0cf0e0d9da8364fa31a2f85",
            "image": "consul:1.5.3",
            "imageID": "docker-pullable://consul@sha256:ee3b33fc5a009623d609189d5c0888b36efd429dd91ac429bc88e1b77a4f3c5f",
            "lastState": {},
            "name": "alavoie-consul",
            "ready": true,
            "restartCount": 0,
            "state": {
              "running": {
                "startedAt": "2020-01-22T09:10:17.000-05:00"
              }
            }
          }
        ],
        "hostIP": "192.168.65.3",
        "phase": "Running",
        "podIP": "10.1.0.139",
        "qosClass": "BestEffort",
        "startTime": "2020-01-22T09:10:14.000-05:00"
      }
    },
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
    },
    {
      "id": "kube-scheduler-docker-desktop/kube-system",
      "metadata": {
        "annotations": {
          "kubernetes.io/config.hash": "ef4d089e81b94aa15841e51ed8c41712",
          "kubernetes.io/config.mirror": "ef4d089e81b94aa15841e51ed8c41712",
          "kubernetes.io/config.seen": "2020-01-17T21:50:28.063231421Z",
          "kubernetes.io/config.source": "file"
        },
        "creationTimestamp": "2020-01-17T16:51:49.000-05:00",
        "labels": {
          "component": "kube-scheduler",
          "tier": "control-plane"
        },
        "name": "kube-scheduler-docker-desktop",
        "namespace": "kube-system",
        "resourceVersion": "95063",
        "selfLink": "/api/v1/namespaces/kube-system/pods/kube-scheduler-docker-desktop",
        "uid": "905f5843-3973-11ea-bde4-025000000001"
      },
      "spec": {
        "containers": [
          {
            "command": [
              "kube-scheduler",
              "--bind-address=127.0.0.1",
              "--kubeconfig=/etc/kubernetes/scheduler.conf",
              "--leader-elect=true"
            ],
            "image": "k8s.gcr.io/kube-scheduler:v1.14.8",
            "imagePullPolicy": "IfNotPresent",
            "livenessProbe": {
              "failureThreshold": 8,
              "httpGet": {
                "host": "127.0.0.1",
                "path": "/healthz",
                "port": 10251,
                "scheme": "HTTP"
              },
              "initialDelaySeconds": 15,
              "periodSeconds": 10,
              "successThreshold": 1,
              "timeoutSeconds": 15
            },
            "name": "kube-scheduler",
            "resources": {
              "requests": {
                "cpu": "100m"
              }
            },
            "terminationMessagePath": "/dev/termination-log",
            "terminationMessagePolicy": "File",
            "volumeMounts": [
              {
                "mountPath": "/etc/kubernetes/scheduler.conf",
                "name": "kubeconfig",
                "readOnly": true
              }
            ]
          }
        ],
        "dnsPolicy": "ClusterFirst",
        "enableServiceLinks": true,
        "hostNetwork": true,
        "nodeName": "docker-desktop",
        "priority": 2000000000,
        "priorityClassName": "system-cluster-critical",
        "restartPolicy": "Always",
        "schedulerName": "default-scheduler",
        "securityContext": {},
        "terminationGracePeriodSeconds": 30,
        "tolerations": [
          {
            "effect": "NoExecute",
            "operator": "Exists"
          }
        ],
        "volumes": [
          {
            "hostPath": {
              "path": "/etc/kubernetes/scheduler.conf",
              "type": "FileOrCreate"
            },
            "name": "kubeconfig"
          }
        ]
      },
      "status": {
        "conditions": [
          {
            "lastTransitionTime": "2020-01-21T15:05:03.000-05:00",
            "status": "True",
            "type": "Initialized"
          },
          {
            "lastTransitionTime": "2020-01-21T15:05:06.000-05:00",
            "status": "True",
            "type": "Ready"
          },
          {
            "lastTransitionTime": "2020-01-21T15:05:06.000-05:00",
            "status": "True",
            "type": "ContainersReady"
          },
          {
            "lastTransitionTime": "2020-01-21T15:05:03.000-05:00",
            "status": "True",
            "type": "PodScheduled"
          }
        ],
        "containerStatuses": [
          {
            "containerID": "docker://05c676485218c2d6ff961349574ce209eeac001bf7d5468698619f8ce372751b",
            "image": "k8s.gcr.io/kube-scheduler:v1.14.8",
            "imageID": "docker-pullable://k8s.gcr.io/kube-scheduler@sha256:54ba7d0b618ca22d2a86ae31eb810ebda110045fe4eeb15d8777a4252a01ccb3",
            "lastState": {
              "terminated": {
                "containerID": "docker://219bbc98442ab8ab426abbf4f85d38c30873e71afc417eb1a2670d308c93b25b",
                "exitCode": 255,
                "finishedAt": "2020-01-21T15:04:35.000-05:00",
                "reason": "Error",
                "startedAt": "2020-01-20T10:28:06.000-05:00"
              }
            },
            "name": "kube-scheduler",
            "ready": true,
            "restartCount": 7,
            "state": {
              "running": {
                "startedAt": "2020-01-21T15:05:05.000-05:00"
              }
            }
          }
        ],
        "hostIP": "192.168.65.3",
        "phase": "Running",
        "podIP": "192.168.65.3",
        "qosClass": "Burstable",
        "startTime": "2020-01-21T15:05:03.000-05:00"
      }
    }
  ],
  "metadata": {
    "recordCount": 3
  }
}
```



<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/pods?cluster_id=:cluster_id</code>

Retrieve a list of all pods in a given [environment](#administration-environments)

Mandatory | &nbsp;
------- | -----------
`cluster_id` <br/>*string* | The id of the cluster in which to list the pods. 

Attributes | &nbsp;
------- | -----------
`id` <br/>*string* | The id of the pod.  
`metadata` <br/>*object* | The metadata of the the pod
`metadata.annotations` <br/>*map* | The annotations of the pod
`metadata.creationTimestamp` <br/>*string* | The date of creation of the pod as a string
`metadata.labels` <br/>*map* | The labels associated to the pod and there associated values
`metadata.name` <br/>*string* | The name of the pod
`metadata.namespace` <br/>*string* | The namespace in which the pod is created
`metadata.uid` <br/>*object* | The UUID of the pod
`spec`<br/>*object* | The specification used to create and run the pod
`spec.container`<br/>*string* | The name of the container running
`status`<br/>*object* | The status information of the the pod
`status.phase`<br/>*string* | The status of the the pod. Possible statuses are Running, Pending, Succeeded, Unknown and Failed


Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).



<!-------------------- GET A POD -------------------->

#### Get a pod

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/k8s/anenvironment/pods/my-aerospike-0/default?cluster_id=projects/cmc-k8s-enabled-llb/locations/us-central1-a/clusters/standard-cluster-1"

# The above command returns JSON structured like this:
```
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

Retrieve a pod and all its info in a given [environment](#administration-environments)

Mandatory | &nbsp;
------- | -----------
`cluster_id` <br/>*string* | The id of the cluster in which to get the pod. 


Attributes | &nbsp;
------- | -----------
`id` <br/>*string* | The id of the pod.  
`metadata` <br/>*object* | The metadata of the the pod
`metadata.annotations` <br/>*map* | The annotations of the pod
`metadata.creationTimestamp` <br/>*string* | The date of creation of the pod as a string
`metadata.labels` <br/>*map* | The labels associated to the pod and there associated values
`metadata.name` <br/>*string* | The name of the pod
`metadata.namespace` <br/>*string* | The namespace in which the pod is created
`metadata.uid` <br/>*object* | The UUID of the pod
`spec`<br/>*object* | The specification used to create and run the pod
`spec.container`<br/>*string* | The name of the container running
`status`<br/>*object* | The status information of the the pod
`status.phase`<br/>*string* | The status of the the pod. Possible statuses are Running, Pending, Succeeded, Unknown and Failed


Note that the list is not complete, since it is refering to the [kubernetes api details](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md).



<!-------------------- DELETE POD -------------------->

#### Delete a pod

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/k8s/anenvironment/pods/my-aerospike-0/default?cluster_id=projects/cmc-k8s-enabled-llb/locations/us-central1-a/clusters/standard-cluster-1"

# The above command returns JSON structured like this:
```
```json
{
  "taskId": "1542bd45-4732-419b-87b6-4ea6ec695c2b",
  "taskStatus": "PENDING"
}
```



<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/pods/:id?cluster_id=:cluster_id</code>

Delete a pod from a given [environment](#administration-environments)

Mandatory | &nbsp;
------- | -----------
`cluster_id` <br/>*string* | The id of the cluster in which to delete the pod. 


Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the delete pod.  
`taskStatus` <br/>*string* | The status of the operation
