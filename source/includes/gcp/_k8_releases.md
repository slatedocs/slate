### Releases


<!-------------------- LIST RELEASES -------------------->

#### List releases

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/k8s/anenvironment/releases?cluster_id=projects/cmc-k8s-enabled-llb/locations/us-central1-a/clusters/standard-cluster-1"

# The above command returns JSON structured like this:
```
```json
{
  "data": [
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
    "recordCount": 1
  }
}
```



<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/releases?cluster_id=:cluster_id</code>

Or

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/releases?namespace=default&cluster_id=:cluster_id</code>



Retrieve a list of all releases in a given [environment](#administration-environments)

Mandatory | &nbsp;
------- | -----------
`cluster_id` <br/>*string* | The id of the cluster in which to list the releases. 


	 
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



