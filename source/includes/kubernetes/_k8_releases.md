## Releases


<!-------------------- LIST RELEASES -------------------->

### List releases

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/k8s/anenvironment/releases"

# The above command returns JSON structured like this:
```
```json
{
  "data": [
    {
      "name": "alavoie",
      "info": {
        "first_deployed": "2020-01-18T09:33:57.147149-05:00",
        "last_deployed": "2020-01-20T10:01:41.76109-05:00",
        "deleted": "",
        "description": "Upgrade complete",
        "status": "installed",
        "notes": "Thanks for installing the MasterPortal API!\n\nIf you run \n$ kubectl get pods\n\nYou should see that the master-portal-api pods have an error. Don't panic! You have to unseal\nthe Vault and assign a token so the proxy and api can both communicate with this.\n\nTo do this you must run the command on any vault pod the delongs to the deployment.\n\n$ kubectl exec -it <VAULT_POD_NAME> vault operator init\n\nIMPORTANT: SAVE THE KEYS AND THE ROOT TOKEN IN A SAFE PLACE.\n\nNow you must unseal all your Vaults! This is a bit tedious.\n\n$ kubectl exec -it <VAULT_POD_NAME> vault operator unseal <KEY_NAME>\n\nYou must do this x3 (by default) with every Vault pod in the deployment with\na different key that you copied from the output above.\n\nOnce you've done this you should see your vault pods with Running 1/1.\n\nNow another manual step!\nYou must edit both the config maps for traefik and master-portal-api. \n\nRun: \n\n$ kubectl edit cm alavoie-traefik \n\nAnd replace the proxyPolicyToken with your vault token.\n\n$ $ kubectl edit cm alavoie-master-portal\n\nAnd replace the vaultToken value with your vault token.\n\nNow the last step! You need to manually delete all your master-portal and traefik pods\nthat are currently running in order for the config maps to reload.\n\nIf you run \n\n$ kubectl get pods \n\nYou should now see everything is running smoothly! It may take a bit of time before \neverything is running."
      },
      "chart": {
        "metadata": {
          "name": "master-portal",
          "sources": [
            "https://github.com/cloudops/master-portal-helm",
            "https://github.com/cloudops/master-portal-api",
            "https://github.com/cloudops/master-portal-proxy"
          ],
          "version": "0.4.0",
          "description": "A Helm chart for the MasterPortal application.",
          "apiVersion": "v1",
          "deprecated": false,
          "dependencies": [
            {
              "name": "vault",
              "version": "0.12.0",
              "repository": "@incubator",
              "enabled": true
            },
            {
              "name": "mysql",
              "version": "0.4.5",
              "repository": "@stable",
              "enabled": true
            },
            {
              "name": "consul",
              "version": "3.9.4",
              "repository": "@stable",
              "enabled": true
            }
          ]
        },
        "values": {
          "consul": {
            "Component": "consul",
            "ConsulConfig": [],
            "ConsulDnsPort": 8600.0,
            "DisableHostNodeId": false,
            "Domain": "consul",
            "Gossip": {
              "Create": true,
              "Encrypt": true
            },
            "HttpPort": 8500.0,
            "Image": "consul",
            "ImagePullPolicy": "Always",
            "ImageTag": "1.5.3",
            "Replicas": 3.0,
            "Resources": {},
            "RpcPort": 8400.0,
            "SerflanPort": 8301.0,
            "SerflanUdpPort": 8301.0,
            "SerfwanPort": 8302.0,
            "SerfwanUdpPort": 8302.0,
            "ServerPort": 8300.0,
            "Storage": "1Gi",
            "acl": {
              "agentToken": "",
              "enabled": false,
              "masterToken": ""
            },
            "additionalLabels": {},
            "affinity": "podAntiAffinity:\n  preferredDuringSchedulingIgnoredDuringExecution:\n  - weight: 1\n    podAffinityTerm:\n      topologyKey: kubernetes.io/hostname\n      labelSelector:\n        matchExpressions:\n        - key: component\n          operator: In\n          values:\n          - \"{{ .Release.Name }}-{{ .Values.Component }}\"\n",
            "forceIpv6": false,
            "global": {
              "enabled": false,
              "github_oauth_token": "1b6f6ba177b6a6e37d91d7ec5d223ee35d791a5",
              "mpHost": "alavoie.cloudops-devteam.com",
              "vaultToken": "7f47c08c-a48c-f2cc-2651-54b9c89b0a21"
            },
            "joinPeers": [],
            "joinWan": [],
            "maxUnavailable": 1.0,
            "nodeSelector": {},
            "podAnnotations": {},
            "priorityClassName": "",
            "server": {
              "enabled": true
            },
            "test": {
              "image": "lachlanevenson/k8s-kubectl",
              "imageTag": "v1.4.8-bash",
              "rbac": {
                "create": false,
                "serviceAccountName": ""
              }
            },
            "tolerations": [],
            "ui": {
              "enabled": true
            },
            "uiIngress": {
              "annotations": {},
              "enabled": false,
              "hosts": [],
              "labels": {},
              "path": "/",
              "tls": []
            },
            "uiService": {
              "annotations": {},
              "enabled": true,
              "type": "NodePort"
            }
          },
          "dbName": "masterportal",
          "dbPassword": "masterportal",
          "dbUser": "masterportal",
          "global": {},
          "image": "cloudops/master-portal-api",
          "imageTag": "devel",
          "mpApiDev": false,
          "mysql": {
            "global": {
              "github_oauth_token": "1b6f6ba177b6a6e37d91d7ec5d223ee35d791a5",
              "mpHost": "alavoie.cloudops-devteam.com",
              "vaultToken": "7f47c08c-a48c-f2cc-2651-54b9c89b0a21"
            },
            "image": "mysql",
            "imagePullPolicy": "IfNotPresent",
            "imageTag": "5.7.14",
            "initializationFiles": {
              "first-db.sql": "create database masterportal;\ncreate user 'masterportal'@'%' identified by 'masterportal';\ncreate user 'masterportal'@'localhost' identified by 'masterportal';\nset password for 'masterportal'@'%'=password('masterportal');\nset password for 'masterportal'@'localhost'=password('masterportal');\nflush privileges;\ngrant all privileges on *.* to 'masterportal'@'%' with Grant option;\ngrant all privileges on *.* to 'masterportal'@'localhost' with Grant option;\nflush privileges;"
            },
            "livenessProbe": {
              "failureThreshold": 3.0,
              "initialDelaySeconds": 30.0,
              "periodSeconds": 10.0,
              "successThreshold": 1.0,
              "timeoutSeconds": 5.0
            },
            "mysqlAllowEmptyPassword": true,
            "nodeSelector": {},
            "persistence": {
              "accessMode": "ReadWriteOnce",
              "enabled": true,
              "size": "8Gi"
            },
            "readinessProbe": {
              "failureThreshold": 3.0,
              "initialDelaySeconds": 5.0,
              "periodSeconds": 10.0,
              "successThreshold": 1.0,
              "timeoutSeconds": 1.0
            },
            "resources": {
              "requests": {
                "cpu": "100m",
                "memory": "256Mi"
              }
            },
            "service": {
              "port": 3306.0,
              "type": "ClusterIP"
            },
            "ssl": {
              "enabled": false,
              "secret": "mysql-ssl-certs"
            }
          },
          "registry": {},
          "tls": {},
          "traefik": {
            "global": {
              "github_oauth_token": "1b6f6ba177b6a6e37d91d7ec5d223ee35d791a5",
              "mpHost": "alavoie.cloudops-devteam.com",
              "vaultToken": "7f47c08c-a48c-f2cc-2651-54b9c89b0a21"
            },
            "image": "cloudops/master-portal-proxy",
            "imageTag": "devel",
            "loginEntryPoint": "http"
          },
          "vault": {
            "affinity": "podAntiAffinity:\n  preferredDuringSchedulingIgnoredDuringExecution:\n  - weight: 100\n    podAffinityTerm:\n      topologyKey: kubernetes.io/hostname\n      labelSelector:\n        matchLabels:\n          app: {{ template \"vault.fullname\" . }}\n          release: {{ .Release.Name }}\n",
            "annotations": {},
            "consulAgent": {
              "HttpPort": 8500.0,
              "pullPolicy": "IfNotPresent",
              "repository": "consul",
              "tag": "1.0.7"
            },
            "global": {
              "github_oauth_token": "1b6f6ba177b6a6e37d91d7ec5d223ee35d791a5",
              "mpHost": "alavoie.cloudops-devteam.com",
              "vaultToken": "7f47c08c-a48c-f2cc-2651-54b9c89b0a21"
            },
            "image": {
              "pullPolicy": "IfNotPresent",
              "repository": "vault",
              "tag": "0.10.1"
            },
            "ingress": {
              "enabled": false,
              "labels": {}
            },
            "podAnnotations": {},
            "replicaCount": 3.0,
            "resources": {},
            "service": {
              "annotations": {},
              "externalPort": 8200.0,
              "loadBalancerSourceRanges": [],
              "name": "vault",
              "port": 8200.0,
              "type": "ClusterIP"
            },
            "vault": {
              "config": {
                "listener": {
                  "tcp": {
                    "address": "[::]:8200",
                    "cluster_address": "[::]:8201",
                    "tls_cipher_suites": "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA,TLS_RSA_WITH_AES_128_GCM_SHA256,TLS_RSA_WITH_AES_256_GCM_SHA384,TLS_RSA_WITH_AES_128_CBC_SHA,TLS_RSA_WITH_AES_256_CBC_SHA",
                    "tls_disable": true,
                    "tls_prefer_server_cipher_suites": true
                  }
                },
                "storage": {
                  "consul": {}
                }
              },
              "customSecrets": [],
              "dev": false,
              "extraContainers": {},
              "extraEnv": [
                {
                  "name": "VAULT_ADDR",
                  "value": "http://127.0.0.1:8200"
                }
              ],
              "extraVolumes": {},
              "readiness": {
                "readyIfSealed": false,
                "readyIfStandby": true,
                "readyIfUninitialized": true
              }
            }
          },
          "vaultStorageClass": "default"
        }
      },
      "version": 2,
      "namespace": "default"
    },
    {
      "name": "my-aerospike",
      "info": {
        "first_deployed": "2020-01-20T09:35:02.267449-05:00",
        "last_deployed": "2020-01-20T09:35:02.267449-05:00",
        "deleted": "",
        "description": "Install complete",
        "status": "installed",
        "notes": "The Aerospike can be accessed via port 3000 on the following DNS name from within your cluster:\n\n  my-aerospike.default.svc.cluster.local\n\nYou can connect to aeropike in your local machine using port-forwarding:\n\n  export POD_NAME=$(kubectl get pods --namespace default -l \"app=aerospike,release=my-aerospike\" -o jsonpath=\"{.items[0].metadata.name}\")\n  kubectl  --namespace default port-forward $POD_NAME 3000:3000\n"
      },
      "chart": {
        "metadata": {
          "name": "aerospike",
          "home": "http://aerospike.com",
          "sources": [
            "https://github.com/aerospike/aerospike-server"
          ],
          "version": "0.3.2",
          "description": "A Helm chart for Aerospike in Kubernetes",
          "keywords": [
            "aerospike",
            "big-data"
          ],
          "maintainers": [
            {
              "name": "kavehmz",
              "email": "kavehmz@gmail.com"
            },
            {
              "name": "okgolove",
              "email": "okgolove@markeloff.net"
            }
          ],
          "icon": "https://s3-us-west-1.amazonaws.com/aerospike-fd/wp-content/uploads/2016/06/Aerospike_square_logo.png",
          "apiVersion": "v1",
          "appVersion": "v4.5.0.5",
          "deprecated": false
        },
        "values": {
          "annotations": {},
          "args": [],
          "command": [],
          "confFile": "#default config file\nservice {\n    user root\n    group root\n    paxos-protocol v5\n    paxos-single-replica-limit 1\n    pidfile /var/run/aerospike/asd.pid\n    service-threads 4\n    transaction-queues 4\n    transaction-threads-per-queue 4\n    proto-fd-max 15000\n}\n\nlogging {\n    file /var/log/aerospike/aerospike.log {\n        context any info\n    }\n\n    console {\n        context any info\n    }\n}\n\nnetwork {\n    service {\n        address any\n        port 3000\n    }\n\n    heartbeat {\n        address any\n        interval 150\n        #REPLACE_THIS_LINE_WITH_MESH_CONFIG\n        mode mesh\n        port 3002\n        timeout 20\n        protocol v3\n    }\n\n    fabric {\n        port 3001\n    }\n\n    info {\n        port 3003\n    }\n}\n\nnamespace test {\n    replication-factor 2\n    memory-size 1G\n    default-ttl 5d\n    storage-engine device {\n        file /opt/aerospike/data/test.dat\n        filesize 4G\n    }\n}",
          "image": {
            "pullPolicy": "IfNotPresent",
            "repository": "aerospike/aerospike-server",
            "tag": "4.5.0.5"
          },
          "labels": {},
          "metrics": {
            "serviceMonitor": {}
          },
          "nodeSelector": {},
          "persistentVolume": {},
          "replicaCount": 1.0,
          "resources": {},
          "service": {
            "annotations": {},
            "clusterIP": "None",
            "nodePort": {},
            "type": "ClusterIP"
          },
          "terminationGracePeriodSeconds": 30.0,
          "tolerations": []
        }
      },
      "version": 1,
      "namespace": "default"
    }
  ],
  "metadata": {
    "recordCount": 2
  }
}
```



<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/releases</code>

Or

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/releases?namespace=default</code>



Retrieve a list of all releases in a given [environment](#administration-environments)

	 
Optional | &nbsp;
------- | -----------
`namespace` <br/>*string* | The namespace to list the release. This needs the exact value.  


Attributes | &nbsp;
------- | -----------
`name` <br/>*string* | The name of the release.  
`info` <br/>*object* | The information about the release
`info.first_deployed` <br/>*string* | The annotations of the pod
`info.last_deployed` <br/>*string* | The date of creation of the pod as a string
`info.deleted` <br/>*string* | The labels associated to the pod and there associated values
`info.description` <br/>*string* | The name of the pod
`info.status` <br/>*string* | The status of the release. Possible values are unknown, installed, uninstalled, superseded, failed, uninstalling, pending-install, pending-upgrade, pending-rollback
`info.notes` <br/>*string* | The notes linked to the release
`chart`<br/>*object* | The information related to the chart of used in the release
`chart.version` <br/>*string* | The version of the chart
`chart.metadata` <br/>*object* | The metadata associated to the chart
`chart.metadata.name` <br/>*string* | The name of the chart
`chart.metadata.home` <br/>*string* | The home URL for the chart
`chart.metadata.sources` <br/>*list* | The list of source of the charts
`chart.metadata.version` <br/>*string* | The version of the chart
`chart.metadata.description` <br/>*string* | The description of the chart
`chart.metadata.keywords` <br/>*list* | The list of keywords linked to the chart
`chart.metadata.maintainers` <br/>*list* | The list of the maintainer contact information
`chart.metadata.icon` <br/>*string* | The icon URL for the chart
`chart.metadata.appVersion` <br/>*string* | The version of the application
`chart.metadata.deprecate` <br/>*bool* | If the chart is deprecated or not of the application
`values` <br/>*object* | All values that were used to install the release
`version`<br/>*string* | The revision of the release
`namespace`<br/>*string* | The namespace to which the release is installed


The information is not totally returned in the list. We filter out the manifest portion. We also filter ou  returning the files and the templates of the charts details. This information will be present in the get request for an individual release.



