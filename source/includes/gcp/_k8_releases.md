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

### Get release

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/k8s/anenvironment/releases/pspensieri/aerospike-1579797954?cluster_id=projects/cmc-k8s-enabled-llb/locations/us-central1-a/clusters/standard-cluster-1"

# The above command returns JSON structured like this:
```
```json
{
  "data": {
    "id": "pspensieri/aerospike-1579797954",
    "name": "aerospike-1579797954",
    "info": {
      "first_deployed": "2020-01-23T11:45:57.255189-05:00",
      "last_deployed": "2020-01-24T19:06:12.956425-05:00",
      "deleted": "",
      "description": "Rollback to 2",
      "status": "installed",
      "notes": "The Aerospike can be accessed via port 3000 on the following DNS name from within your cluster:\n\n  aerospike-1579797954.pspensieri.svc.cluster.local\n\nYou can connect to aeropike in your local machine using port-forwarding:\n\n  export POD_NAME=$(kubectl get pods --namespace pspensieri -l \"app=aerospike,release=aerospike-1579797954\" -o jsonpath=\"{.items[0].metadata.name}\")\n  kubectl  --namespace pspensieri port-forward $POD_NAME 3000:3000\n"
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
      "templates": [
        {
          "name": "templates/NOTES.txt",
          "data": "VGhlIEFlcm9zcGlrZSBjYW4gYmUgYWNjZXNzZWQgdmlhIHBvcnQgMzAwMCBvbiB0aGUgZm9sbG93aW5nIEROUyBuYW1lIGZyb20gd2l0aGluIHlvdXIgY2x1c3RlcjoKCiAge3sgdGVtcGxhdGUgImFlcm9zcGlrZS5mdWxsbmFtZSIgLiB9fS57eyAuUmVsZWFzZS5OYW1lc3BhY2UgfX0uc3ZjLmNsdXN0ZXIubG9jYWwKCllvdSBjYW4gY29ubmVjdCB0byBhZXJvcGlrZSBpbiB5b3VyIGxvY2FsIG1hY2hpbmUgdXNpbmcgcG9ydC1mb3J3YXJkaW5nOgoKICBleHBvcnQgUE9EX05BTUU9JChrdWJlY3RsIGdldCBwb2RzIC0tbmFtZXNwYWNlIHt7IC5SZWxlYXNlLk5hbWVzcGFjZSB9fSAtbCAiYXBwPXt7IHRlbXBsYXRlICJhZXJvc3Bpa2UubmFtZSIgLiB9fSxyZWxlYXNlPXt7IC5SZWxlYXNlLk5hbWUgfX0iIC1vIGpzb25wYXRoPSJ7Lml0ZW1zWzBdLm1ldGFkYXRhLm5hbWV9IikKICBrdWJlY3RsICAtLW5hbWVzcGFjZSB7eyAuUmVsZWFzZS5OYW1lc3BhY2UgfX0gcG9ydC1mb3J3YXJkICRQT0RfTkFNRSAzMDAwOjMwMDAK"
        },
        {
          "name": "templates/_helpers.tpl",
          "data": "e3svKiB2aW06IHNldCBmaWxldHlwZT1tdXN0YWNoZTogKi99fQp7ey8qCkV4cGFuZCB0aGUgbmFtZSBvZiB0aGUgY2hhcnQuCiovfX0Ke3stIGRlZmluZSAiYWVyb3NwaWtlLm5hbWUiIC19fQp7ey0gZGVmYXVsdCAuQ2hhcnQuTmFtZSAuVmFsdWVzLm5hbWVPdmVycmlkZSB8IHRydW5jIDYzIHwgdHJpbVN1ZmZpeCAiLSIgLX19Cnt7LSBlbmQgLX19Cgp7ey8qCkNyZWF0ZSBhIGRlZmF1bHQgZnVsbHkgcXVhbGlmaWVkIGFwcCBuYW1lLgpXZSB0cnVuY2F0ZSBhdCA2MyBjaGFycyBiZWNhdXNlIHNvbWUgS3ViZXJuZXRlcyBuYW1lIGZpZWxkcyBhcmUgbGltaXRlZCB0byB0aGlzIChieSB0aGUgRE5TIG5hbWluZyBzcGVjKS4KSWYgcmVsZWFzZSBuYW1lIGNvbnRhaW5zIGNoYXJ0IG5hbWUgaXQgd2lsbCBiZSB1c2VkIGFzIGEgZnVsbCBuYW1lLgoqL319Cnt7LSBkZWZpbmUgImFlcm9zcGlrZS5mdWxsbmFtZSIgLX19Cnt7LSBpZiAuVmFsdWVzLmZ1bGxuYW1lT3ZlcnJpZGUgLX19Cnt7LSAuVmFsdWVzLmZ1bGxuYW1lT3ZlcnJpZGUgfCB0cnVuYyA2MyB8IHRyaW1TdWZmaXggIi0iIC19fQp7ey0gZWxzZSAtfX0Ke3stICRuYW1lIDo9IGRlZmF1bHQgLkNoYXJ0Lk5hbWUgLlZhbHVlcy5uYW1lT3ZlcnJpZGUgLX19Cnt7LSBpZiBjb250YWlucyAkbmFtZSAuUmVsZWFzZS5OYW1lIC19fQp7ey0gLlJlbGVhc2UuTmFtZSB8IHRydW5jIDYzIHwgdHJpbVN1ZmZpeCAiLSIgLX19Cnt7LSBlbHNlIC19fQp7ey0gcHJpbnRmICIlcy0lcyIgLlJlbGVhc2UuTmFtZSAkbmFtZSB8IHRydW5jIDYzIHwgdHJpbVN1ZmZpeCAiLSIgLX19Cnt7LSBlbmQgLX19Cnt7LSBlbmQgLX19Cnt7LSBlbmQgLX19Cgp7ey8qCkNyZWF0ZSBhZXJvc3Bpa2UgbWVzaCBzZXR1cAoqL319Cnt7LSBkZWZpbmUgImFlcm9zcGlrZS5tZXNoIiAtfX0KICAgIHt7LSAkZnVsbG5hbWUgOj0gaW5jbHVkZSAiYWVyb3NwaWtlLmZ1bGxuYW1lIiAuIC19fQogICAge3stIHJhbmdlICRpLCAkZSA6PSB1bnRpbCAoLlZhbHVlcy5yZXBsaWNhQ291bnR8aW50KSB9fQogICAge3sgcHJpbnRmICJtZXNoLXNlZWQtYWRkcmVzcy1wb3J0ICVzLSVkLiVzIDMwMDIiICRmdWxsbmFtZSAkaSAkZnVsbG5hbWUgfX0KICAgIHt7LSBlbmQgLX19Cnt7LSBlbmQgLX19Cg=="
        },
        {
          "name": "templates/configmap.yaml",
          "data": "YXBpVmVyc2lvbjogdjEKa2luZDogQ29uZmlnTWFwCm1ldGFkYXRhOgogIG5hbWU6IHt7IHRlbXBsYXRlICJhZXJvc3Bpa2UuZnVsbG5hbWUiIC4gfX0KICBsYWJlbHM6CiAgICBhcHA6IHt7IHRlbXBsYXRlICJhZXJvc3Bpa2UubmFtZSIgLiB9fQogICAgY2hhcnQ6IHt7IC5DaGFydC5OYW1lIH19LXt7IC5DaGFydC5WZXJzaW9uIHwgcmVwbGFjZSAiKyIgIl8iIH19CiAgICByZWxlYXNlOiB7eyAuUmVsZWFzZS5OYW1lIH19CiAgICBoZXJpdGFnZToge3sgLlJlbGVhc2UuU2VydmljZSB9fQogICAge3stIHdpdGggLlZhbHVlcy5sYWJlbHMgfX0KICAgIHt7IHRvWWFtbCAuIHwgbmluZGVudCA0IH19CiAgICB7ey0gZW5kIH19CmRhdGE6CiAgYWVyb3NwaWtlLmNvbmY6IHwKICAgICMgYWVyb3NwaWtlIGNvbmZpZ3VyYXRpb24KICAgIHt7LSAkbWVzaCA6PSBpbmNsdWRlICJhZXJvc3Bpa2UubWVzaCIgLiAgfX0KICAgIHt7IC5WYWx1ZXMuY29uZkZpbGUgfHJlcGxhY2UgIiNSRVBMQUNFX1RISVNfTElORV9XSVRIX01FU0hfQ09ORklHIiAkbWVzaCB8IGluZGVudCA0fX0K"
        },
        {
          "name": "templates/nodeport.yaml",
          "data": "e3stIGlmIC5WYWx1ZXMuc2VydmljZS5ub2RlUG9ydC5lbmFibGVkIH19CmFwaVZlcnNpb246IHYxCmtpbmQ6IFNlcnZpY2UKbWV0YWRhdGE6CiAgbGFiZWxzOgogICAgYXBwOiB7eyB0ZW1wbGF0ZSAiYWVyb3NwaWtlLm5hbWUiIC4gfX0KICAgIGNoYXJ0OiB7eyAuQ2hhcnQuTmFtZSB9fS17eyAuQ2hhcnQuVmVyc2lvbiB8IHJlcGxhY2UgIisiICJfIiB9fQogICAgcmVsZWFzZToge3sgLlJlbGVhc2UuTmFtZSB9fQogICAgaGVyaXRhZ2U6IHt7IC5SZWxlYXNlLlNlcnZpY2UgfX0KICAgIHt7LSB3aXRoIC5WYWx1ZXMubGFiZWxzIH19CiAgICB7eyB0b1lhbWwgLiB8IG5pbmRlbnQgNCB9fQogICAge3stIGVuZCB9fQogIG5hbWU6IHt7IHRlbXBsYXRlICJhZXJvc3Bpa2UubmFtZSIgLiB9fS1ub2RlcG9ydApzcGVjOgogIHBvcnRzOgogIC0gbmFtZTogY2xpZW50CiAgICBub2RlUG9ydDoge3sgLlZhbHVlcy5zZXJ2aWNlLm5vZGVQb3J0LnBvcnQgfX0KICAgIHBvcnQ6IDMwMDAKICAgIHByb3RvY29sOiBUQ1AKICAgIHRhcmdldFBvcnQ6IDMwMDAKICBzZWxlY3RvcjoKICAgIGFwcDoge3sgdGVtcGxhdGUgImFlcm9zcGlrZS5uYW1lIiAuIH19CiAgICByZWxlYXNlOiB7eyAuUmVsZWFzZS5OYW1lIH19CiAgdHlwZTogTm9kZVBvcnQKe3stIGVuZCB9fQo="
        },
        {
          "name": "templates/service.yaml",
          "data": "YXBpVmVyc2lvbjogdjEKa2luZDogU2VydmljZQptZXRhZGF0YToKICBuYW1lOiB7eyB0ZW1wbGF0ZSAiYWVyb3NwaWtlLmZ1bGxuYW1lIiAuIH19CiAgbGFiZWxzOgogICAgYXBwOiB7eyB0ZW1wbGF0ZSAiYWVyb3NwaWtlLm5hbWUiIC4gfX0KICAgIGNoYXJ0OiB7eyAuQ2hhcnQuTmFtZSB9fS17eyAuQ2hhcnQuVmVyc2lvbiB8IHJlcGxhY2UgIisiICJfIiB9fQogICAgcmVsZWFzZToge3sgLlJlbGVhc2UuTmFtZSB9fQogICAgaGVyaXRhZ2U6IHt7IC5SZWxlYXNlLlNlcnZpY2UgfX0KICAgIHt7LSB3aXRoIC5WYWx1ZXMubGFiZWxzIH19CiAgICB7eyB0b1lhbWwgLiB8IG5pbmRlbnQgNCB9fQogICAge3stIGVuZCB9fQogIGFubm90YXRpb25zOgogICAge3stIHdpdGggLlZhbHVlcy5zZXJ2aWNlLmFubm90YXRpb25zIH19CiAgICB7eyB0cGwgKHRvWWFtbCAuKSAkIHwgbmluZGVudCA0IH19CiAgICB7ey0gZW5kIH19CnNwZWM6CiAgIyBzbyB0aGUgbWVzaCBwZWVyLWZpbmRlciB3b3JrcwogIHB1Ymxpc2hOb3RSZWFkeUFkZHJlc3NlczogdHJ1ZQogIHt7IGlmIC5WYWx1ZXMuc2VydmljZS5jbHVzdGVySVAgfX0KICBjbHVzdGVySVA6IHt7IC5WYWx1ZXMuc2VydmljZS5jbHVzdGVySVAgfCBxdW90ZSAgfX0KICB7eyBlbmQgfX0KICB0eXBlOiB7eyAuVmFsdWVzLnNlcnZpY2UudHlwZSB9fQogIHt7IGlmIGVxIC5WYWx1ZXMuc2VydmljZS50eXBlICJMb2FkQmFsYW5jZXIiIC19fSB7eyBpZiAuVmFsdWVzLnNlcnZpY2UubG9hZEJhbGFuY2VySVAgLX19CiAgbG9hZEJhbGFuY2VySVA6IHt7IC5WYWx1ZXMuc2VydmljZS5sb2FkQmFsYW5jZXJJUCB9fQogIHt7IGVuZCAtfX0KICB7ey0gaWYgLlZhbHVlcy5zZXJ2aWNlLmxvYWRCYWxhbmNlclNvdXJjZVJhbmdlcyB9fQogIGxvYWRCYWxhbmNlclNvdXJjZVJhbmdlczoKICB7eyB0b1lhbWwgLlZhbHVlcy5zZXJ2aWNlLmxvYWRCYWxhbmNlclNvdXJjZVJhbmdlcyB8IG5pbmRlbnQgMn19CiAge3sgZW5kIC19fQogIHt7LSBlbmQgLX19CiAgcG9ydHM6CiAgICAtIHBvcnQ6IDMwMDAKICAgICAgcHJvdG9jb2w6IFRDUAogICAgICBuYW1lOiBjbGllbnQKICAgIC0gcG9ydDogMzAwMgogICAgICBwcm90b2NvbDogVENQCiAgICAgIG5hbWU6IG1lc2gKICAgIHt7IGlmIC5WYWx1ZXMubWV0cmljcy5lbmFibGVkIH19CiAgICAtIHBvcnQ6IDkxNDUKICAgICAgcHJvdG9jb2w6IFRDUAogICAgICBuYW1lOiBtZXRyaWNzCiAgICB7ey0gZW5kIH19CiAgc2VsZWN0b3I6CiAgICBhcHA6IHt7IHRlbXBsYXRlICJhZXJvc3Bpa2UubmFtZSIgLiB9fQogICAgcmVsZWFzZToge3sgLlJlbGVhc2UuTmFtZSB9fQo="
        },
        {
          "name": "templates/servicemonitor.yaml",
          "data": "e3stIGlmIGFuZCAoLlZhbHVlcy5tZXRyaWNzLmVuYWJsZWQpICguVmFsdWVzLm1ldHJpY3Muc2VydmljZU1vbml0b3IuZW5hYmxlZCkgfX0KYXBpVmVyc2lvbjogbW9uaXRvcmluZy5jb3Jlb3MuY29tL3YxCmtpbmQ6IFNlcnZpY2VNb25pdG9yCm1ldGFkYXRhOiAgCiAgbmFtZToge3sgdGVtcGxhdGUgImFlcm9zcGlrZS5mdWxsbmFtZSIgLiB9fQogIGxhYmVsczoKICAgIGFwcDoge3sgdGVtcGxhdGUgImFlcm9zcGlrZS5uYW1lIiAuIH19CiAgICBjaGFydDoge3sgLkNoYXJ0Lk5hbWUgfX0te3sgLkNoYXJ0LlZlcnNpb24gfCByZXBsYWNlICIrIiAiXyIgfX0KICAgIHJlbGVhc2U6IHt7IC5SZWxlYXNlLk5hbWUgfX0KICAgIGhlcml0YWdlOiB7eyAuUmVsZWFzZS5TZXJ2aWNlIH19CiAgICB7ey0gd2l0aCAuVmFsdWVzLmxhYmVscyB9fQogICAge3sgdG9ZYW1sIC4gfCBuaW5kZW50IDQgfX0KICAgIHt7LSBlbmQgfX0Kc3BlYzoKICBlbmRwb2ludHM6CiAgLSBwYXRoOiAvbWV0cmljcwogICAgcG9ydDogbWV0cmljcwogIG5hbWVzcGFjZVNlbGVjdG9yOgogICAgbWF0Y2hOYW1lczoKICAgIC0ge3sgLlJlbGVhc2UuTmFtZXNwYWNlIH19CiAgc2VsZWN0b3I6CiAgICBtYXRjaExhYmVsczoKICAgICAgYXBwOiB7eyB0ZW1wbGF0ZSAiYWVyb3NwaWtlLm5hbWUiIC4gfX0KICB0YXJnZXRMYWJlbHM6CiAge3sgcmFuZ2UgLlZhbHVlcy5tZXRyaWNzLnNlcnZpY2VNb25pdG9yLnRhcmdldExhYmVscyB9fQogIC0ge3sgLiB9fQogIHt7LSBlbmQgfX0Ke3stIGVuZCB9fQo="
        },
        {
          "name": "templates/statefulset.yaml",
          "data": "YXBpVmVyc2lvbjogYXBwcy92MQpraW5kOiBTdGF0ZWZ1bFNldAptZXRhZGF0YToKICBuYW1lOiB7eyB0ZW1wbGF0ZSAiYWVyb3NwaWtlLmZ1bGxuYW1lIiAuIH19CiAgbGFiZWxzOgogICAgYXBwOiB7eyB0ZW1wbGF0ZSAiYWVyb3NwaWtlLm5hbWUiIC4gfX0KICAgIGNoYXJ0OiB7eyAuQ2hhcnQuTmFtZSB9fS17eyAuQ2hhcnQuVmVyc2lvbiB8IHJlcGxhY2UgIisiICJfIiB9fQogICAgcmVsZWFzZToge3sgLlJlbGVhc2UuTmFtZSB9fQogICAgaGVyaXRhZ2U6IHt7IC5SZWxlYXNlLlNlcnZpY2UgfX0KICAgIHt7LSB3aXRoIC5WYWx1ZXMubGFiZWxzIH19CiAgICB7eyB0b1lhbWwgLiB8IG5pbmRlbnQgNCB9fQogICAge3stIGVuZCB9fQogIHt7LSB3aXRoIC5WYWx1ZXMuYW5ub3RhdGlvbnMgfX0KICBhbm5vdGF0aW9uczoKICAgIHt7IHRvWWFtbCAuIHwgbmluZGVudCA0IH19CiAge3stIGVuZCB9fQpzcGVjOgogIHNlcnZpY2VOYW1lOiB7eyB0ZW1wbGF0ZSAiYWVyb3NwaWtlLmZ1bGxuYW1lIiAuIH19CiAgcmVwbGljYXM6IHt7IC5WYWx1ZXMucmVwbGljYUNvdW50IH19CiAgc2VsZWN0b3I6CiAgICBtYXRjaExhYmVsczoKICAgICAgYXBwOiB7eyB0ZW1wbGF0ZSAiYWVyb3NwaWtlLm5hbWUiIC4gfX0KICAgICAgcmVsZWFzZToge3sgLlJlbGVhc2UuTmFtZSB9fQogIHRlbXBsYXRlOgogICAgbWV0YWRhdGE6CiAgICAgIGxhYmVsczoKICAgICAgICBhcHA6IHt7IHRlbXBsYXRlICJhZXJvc3Bpa2UubmFtZSIgLiB9fQogICAgICAgIHJlbGVhc2U6IHt7IC5SZWxlYXNlLk5hbWUgfX0KICAgICAgYW5ub3RhdGlvbnM6CiAgICAgICAgY2hlY2tzdW0vY29uZmlnOiB7eyAuVmFsdWVzLmNvbmZGaWxlIHwgc2hhMjU2c3VtIH19CiAgICBzcGVjOgogICAgICB0ZXJtaW5hdGlvbkdyYWNlUGVyaW9kU2Vjb25kczoge3sgLlZhbHVlcy50ZXJtaW5hdGlvbkdyYWNlUGVyaW9kU2Vjb25kcyB9fQogICAgICBjb250YWluZXJzOgogICAgICAtIG5hbWU6IHt7IHRlbXBsYXRlICJhZXJvc3Bpa2UuZnVsbG5hbWUiIC4gfX0KICAgICAgICBpbWFnZTogInt7IC5WYWx1ZXMuaW1hZ2UucmVwb3NpdG9yeSB9fTp7eyAuVmFsdWVzLmltYWdlLnRhZyB9fSIKICAgICAgICBpbWFnZVB1bGxQb2xpY3k6IHt7IC5WYWx1ZXMuaW1hZ2UucHVsbFBvbGljeSB9fQogICAgICAgIHt7IGlmIC5WYWx1ZXMuY29tbWFuZCB9fQogICAgICAgIGNvbW1hbmQ6CiAgICAgICAgICB7eyB0b1lhbWwgLlZhbHVlcy5jb21tYW5kIHwgbmluZGVudCAxMCB9fQogICAgICAgIHt7IGVuZCB9fQogICAgICAgIHt7IGlmIC5WYWx1ZXMuYXJncyB9fQogICAgICAgIGFyZ3M6CiAgICAgICAgICB7eyB0b1lhbWwgLlZhbHVlcy5hcmdzIHwgbmluZGVudCAxMCB9fQogICAgICAgIHt7IGVuZCB9fQogICAgICAgIHBvcnRzOgogICAgICAgIC0gY29udGFpbmVyUG9ydDogMzAwMAogICAgICAgICAgbmFtZTogY2xpZW50cwogICAgICAgIC0gY29udGFpbmVyUG9ydDogMzAwMgogICAgICAgICAgbmFtZTogbWVzaAogICAgICAgIC0gY29udGFpbmVyUG9ydDogMzAwMwogICAgICAgICAgbmFtZTogaW5mbwogICAgICAgIHJlYWRpbmVzc1Byb2JlOgogICAgICAgICAgdGNwU29ja2V0OgogICAgICAgICAgICAgIHBvcnQ6IDMwMDAKICAgICAgICAgIGluaXRpYWxEZWxheVNlY29uZHM6IDE1CiAgICAgICAgICB0aW1lb3V0U2Vjb25kczogMQogICAgICAgIHZvbHVtZU1vdW50czoKICAgICAgICAtIG5hbWU6IGNvbmZpZy12b2x1bWUKICAgICAgICAgIG1vdW50UGF0aDogL2V0Yy9hZXJvc3Bpa2UKICAgICAgICB7ey0gcmFuZ2UgJHB2IDo9IC5WYWx1ZXMucGVyc2lzdGVudFZvbHVtZSB9fQogICAgICAgIC0gbmFtZToge3sgJHB2Lm5hbWUgfCBxdW90ZSB9fQogICAgICAgICAgbW91bnRQYXRoOiB7eyAkcHYubW91bnRQYXRoIHwgcXVvdGUgfX0KICAgICAgICB7ey0gZW5kIH19CiAgICAgICAgcmVzb3VyY2VzOgogICAgICAgICAge3sgdG9ZYW1sIC5WYWx1ZXMucmVzb3VyY2VzIHwgbmluZGVudCAxMCB9fQogICAgICB7eyBpZiAuVmFsdWVzLm1ldHJpY3MuZW5hYmxlZCB9fQogICAgICAtIG5hbWU6IHt7IHRlbXBsYXRlICJhZXJvc3Bpa2UuZnVsbG5hbWUiIC4gfX0tbWV0cmljcwogICAgICAgIGltYWdlOiAie3sgLlZhbHVlcy5tZXRyaWNzLmltYWdlLnJlcG9zaXRvcnkgfX06e3sgLlZhbHVlcy5tZXRyaWNzLmltYWdlLnRhZyB9fSIKICAgICAgICBwb3J0czoKICAgICAgICAtIGNvbnRhaW5lclBvcnQ6IDkxNDUKICAgICAgICAgIG5hbWU6IG1ldHJpY3MKICAgICAge3stIGVuZCB9fQogICAgICB7ey0gaWYgLlZhbHVlcy5ub2RlU2VsZWN0b3IgfX0KICAgICAgbm9kZVNlbGVjdG9yOgogICAgICAgIHt7IHRvWWFtbCAuVmFsdWVzLm5vZGVTZWxlY3RvciB8IG5pbmRlbnQgOCB9fQogICAgICB7ey0gZW5kIH19CiAgICAgIHt7LSBpZiAuVmFsdWVzLmFmZmluaXR5IH19CiAgICAgIGFmZmluaXR5OgogICAgICAgIHt7IHRvWWFtbCAuVmFsdWVzLmFmZmluaXR5IHwgbmluZGVudCA4IH19CiAgICAgIHt7LSBlbmQgfX0KICAgICAge3stIGlmIC5WYWx1ZXMudG9sZXJhdGlvbnN9fQogICAgICB0b2xlcmF0aW9uczoKICAgICAgICB7eyB0b1lhbWwgLlZhbHVlcy50b2xlcmF0aW9ucyB8IG5pbmRlbnQgOCB9fQogICAgICB7ey0gZW5kIH19CiAgICAgIHZvbHVtZXM6CiAgICAgIC0gbmFtZTogY29uZmlnLXZvbHVtZQogICAgICAgIGNvbmZpZ01hcDoKICAgICAgICAgIG5hbWU6IHt7IHRlbXBsYXRlICJhZXJvc3Bpa2UuZnVsbG5hbWUiIC4gfX0KICAgICAgICAgIGl0ZW1zOgogICAgICAgICAgLSBrZXk6IGFlcm9zcGlrZS5jb25mCiAgICAgICAgICAgIHBhdGg6IGFlcm9zcGlrZS5jb25mCiAgICAgIHt7IGlmIC5WYWx1ZXMuaW1hZ2UucHVsbFNlY3JldCB9fQogICAgICBpbWFnZVB1bGxTZWNyZXRzOgogICAgICAtIG5hbWU6IHt7IC5WYWx1ZXMuaW1hZ2UucHVsbFNlY3JldCB9fQogICAgICB7ey0gZW5kIH19CiAgdm9sdW1lQ2xhaW1UZW1wbGF0ZXM6CiAge3stIHJhbmdlICRwdiA6PSAuVmFsdWVzLnBlcnNpc3RlbnRWb2x1bWUgfX0KICAtIG1ldGFkYXRhOgogICAgICBuYW1lOiB7eyAkcHYubmFtZSB8IHF1b3RlIH19CiAgICBzcGVjOgogICAgICB7eyB0b1lhbWwgJHB2LnRlbXBsYXRlIHwgbmluZGVudCA2IH19CiAge3stIGVuZCB9fQo="
        }
      ],
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
      },
      "files": [
        {
          "name": ".helmignore",
          "data": "IyBQYXR0ZXJucyB0byBpZ25vcmUgd2hlbiBidWlsZGluZyBwYWNrYWdlcy4KIyBUaGlzIHN1cHBvcnRzIHNoZWxsIGdsb2IgbWF0Y2hpbmcsIHJlbGF0aXZlIHBhdGggbWF0Y2hpbmcsIGFuZAojIG5lZ2F0aW9uIChwcmVmaXhlZCB3aXRoICEpLiBPbmx5IG9uZSBwYXR0ZXJuIHBlciBsaW5lLgouRFNfU3RvcmUKIyBDb21tb24gVkNTIGRpcnMKLmdpdC8KLmdpdGlnbm9yZQouYnpyLwouYnpyaWdub3JlCi5oZy8KLmhnaWdub3JlCi5zdm4vCiMgQ29tbW9uIGJhY2t1cCBmaWxlcwoqLnN3cAoqLmJhawoqLnRtcAoqfgojIFZhcmlvdXMgSURFcwoucHJvamVjdAouaWRlYS8KKi50bXByb2oK"
        },
        {
          "name": "OWNERS",
          "data": "YXBwcm92ZXJzOgotIG9rZ29sb3ZlCnJldmlld2VyczoKLSBva2dvbG92ZQo="
        },
        {
          "name": "README.md",
          "data": "IyBBZXJvc3Bpa2UgSGVsbSBDaGFydAoKVGhpcyBpcyBhbiBpbXBsZW1lbnRhdGlvbiBvZiBBZXJvc3Bpa2UgU3RhdGVmdWxTZXQgZm91bmQgaGVyZToKKiA8aHR0cHM6Ly9naXRodWIuY29tL2Flcm9zcGlrZS9hZXJvc3Bpa2Uta3ViZXJuZXRlcz4KCiMjIFByZSBSZXF1aXNpdGVzCiogS3ViZXJuZXRlcyAxLjkrCiogUFYgc3VwcG9ydCBvbiB1bmRlcmx5aW5nIGluZnJhc3RydWN0dXJlIChvbmx5IGlmIHlvdSBhcmUgcHJvdmlzaW9uaW5nIHBlcnNpc3RlbnQgdm9sdW1lKS4KKiBSZXF1aXJlcyBhdCBsZWFzdCBgdjIuNS4wYCB2ZXJzaW9uIG9mIGhlbG0gdG8gc3VwcG9ydAoKIyMgU3RhdGVmdWxTZXQgRGV0YWlscwoqIDxodHRwczovL2t1YmVybmV0ZXMuaW8vZG9jcy9jb25jZXB0cy93b3JrbG9hZHMvY29udHJvbGxlcnMvc3RhdGVmdWxzZXQvPgoKIyMgU3RhdGVmdWxTZXQgQ2F2ZWF0cwoqIDxodHRwczovL2t1YmVybmV0ZXMuaW8vZG9jcy9jb25jZXB0cy93b3JrbG9hZHMvY29udHJvbGxlcnMvc3RhdGVmdWxzZXQvI2xpbWl0YXRpb25zPgoKIyMgQ2hhcnQgRGV0YWlscwpUaGlzIGNoYXJ0IHdpbGwgZG8gdGhlIGZvbGxvd2luZzoKKiBJbXBsZW1lbnQgYSBkeW5hbWljYWxseSBzY2FsYWJsZSBBZXJvc3Bpa2UgY2x1c3RlciB1c2luZyBLdWJlcm5ldGVzIFN0YXRlZnVsU2V0cwoKIyMjIEluc3RhbGxpbmcgdGhlIENoYXJ0ClRvIGluc3RhbGwgdGhlIGNoYXJ0IHdpdGggdGhlIHJlbGVhc2UgbmFtZSBgbXktYWVyb3NwaWtlYCB1c2luZyBhIGRlZGljYXRlZCBuYW1lc3BhY2UocmVjb21tZW5kZWQpOgoKYGBgc2gKaGVsbSByZXBvIGFkZCBpbmN1YmF0b3IgaHR0cDovL3N0b3JhZ2UuZ29vZ2xlYXBpcy5jb20va3ViZXJuZXRlcy1jaGFydHMtaW5jdWJhdG9yCmhlbG0gaW5zdGFsbCAtLW5hbWUgbXktYWVyb3NwaWtlIC0tbmFtZXNwYWNlIGFlcm9zcGlrZSBzdGFibGUvYWVyb3NwaWtlCmBgYAoKVGhlIGNoYXJ0IGNhbiBiZSBjdXN0b21pemVkIHVzaW5nIHRoZSBmb2xsb3dpbmcgY29uZmlndXJhYmxlIHBhcmFtZXRlcnM6Cgp8IFBhcmFtZXRlciAgICAgICAgICAgICAgICAgICAgICAgfCBEZXNjcmlwdGlvbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBEZWZhdWx0ICAgICAgICAgICAgICAgICAgICAgIHwKfCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIHwgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLXwgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS18CnwgYGltYWdlLnJlcG9zaXRvcnlgICAgICAgICAgICAgICB8IEFlcm9zcGlrZSBDb250YWluZXIgaW1hZ2UgbmFtZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IGBhZXJvc3Bpa2UvYWVyb3NwaWtlLXNlcnZlcmAgfAp8IGBpbWFnZS50YWdgICAgICAgICAgICAgICAgICAgICAgfCBBZXJvc3Bpa2UgQ29udGFpbmVyIGltYWdlIHRhZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBgNC41LjAuNWAgICAgICAgICAgICAgICAgICAgIHwKfCBgaW1hZ2UucHVsbFBvbGljeWAgICAgICAgICAgICAgIHwgQWVyb3NwaWtlIENvbnRhaW5lciBwdWxsIHBvbGljeSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgYEFsd2F5c2AgICAgICAgICAgICAgICAgICAgICB8CnwgYGltYWdlLnB1bGxTZWNyZXRgICAgICAgICAgICAgICB8IEFlcm9zcGlrZSBQb2QgcHVsbCBzZWNyZXQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IGBgICAgICAgICAgICAgICAgICAgICAgfAp8IGByZXBsaWNhQ291bnRgICAgICAgICAgICAgICAgICAgfCBBZXJvc3Bpa2UgQnJva2VycyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBgMWAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKfCBgY29tbWFuZGAgICAgICAgICAgICAgICAgICAgICAgIHwgQ3VzdG9tIGNvbW1hbmQgKERvY2tlciBFbnRyeXBvaW50KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgYFtdYCAgICAgICAgICAgICAgICAgICAgICAgICB8CnwgYGFyZ3NgICAgICAgICAgICAgICAgICAgICAgICAgICB8IEN1c3RvbSBhcmdzIChEb2NrZXIgQ21kKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IGBbXWAgICAgICAgICAgICAgICAgICAgICAgICAgfAp8IGBsYWJlbHNgICAgICAgICAgICAgICAgICAgICAgICAgfCBNYXAgb2YgbGFiZWxzIHRvIGFkZCB0byB0aGUgc3RhdGVmdWxzZXQgICAgICAgICAgICAgICAgICAgICAgICAgfCBge31gICAgICAgICAgICAgICAgICAgICAgICAgIHwKfCBgYW5ub3RhdGlvbnNgICAgICAgICAgICAgICAgICAgIHwgTWFwIG9mIGFubm90YXRpb25zIHRvIGFkZCB0byB0aGUgc3RhdGVmdWxzZXQgICAgICAgICAgICAgICAgICAgIHwgYHt9YCAgICAgICAgICAgICAgICAgICAgICAgICB8CnwgYHRvbGVyYXRpb25zYCAgICAgICAgICAgICAgICAgICB8IExpc3Qgb2Ygbm9kZSB0YWludHMgdG8gdG9sZXJhdGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IGBbXWAgICAgICAgICAgICAgICAgICAgICAgICAgfAp8IGBwZXJzaXN0ZW50Vm9sdW1lYCAgICAgICAgICAgICAgfCBDb25maWcgb2YgcGVyc2lzdGVudCB2b2x1bWVzIGZvciBzdG9yYWdlLWVuZ2luZSAgICAgICAgICAgICAgICAgfCBge31gICAgICAgICAgICAgICAgICAgICAgICAgIHwKfCBgY29uZkZpbGVgICAgICAgICAgICAgICAgICAgICAgIHwgQ29uZmlnIGZpbGVuYW1lLiBUaGlzIGZpbGUgc2hvdWxkIGJlIGluY2x1ZGVkIGluIHRoZSBjaGFydCBwYXRoLiBJZiB0aGUgY29uZmlnIGlzIHVwZGF0ZWQsIHRoZSBzdGF0ZWZ1bHNldCB3aWxsIGJlIHJlZGVwbG95ZWQgd2l0aCB0aGUgbmV3IGNvbmZpZyB8IGBhZXJvc3Bpa2UuY29uZmAgICAgICAgICAgICAgfAp8IGByZXNvdXJjZXNgICAgICAgICAgICAgICAgICAgICAgfCBSZXNvdXJjZSByZXF1ZXN0cyBhbmQgbGltaXRzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBge31gICAgICAgICAgICAgICAgICAgICAgICAgIHwKfCBgbm9kZVNlbGVjdG9yYCAgICAgICAgICAgICAgICAgIHwgTGFiZWxzIGZvciBwb2QgYXNzaWdubWVudCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgYHt9YCAgICAgICAgICAgICAgICAgICAgICAgICB8CnwgYHRlcm1pbmF0aW9uR3JhY2VQZXJpb2RTZWNvbmRzYCB8IFdhaXQgdGltZSBiZWZvcmUgZm9yY2VmdWxseSB0ZXJtaW5hdGluZyBjb250YWluZXIgICAgICAgICAgICAgICB8IGAzMGAgICAgICAgICAgICAgICAgICAgICAgICAgfAp8IGBzZXJ2aWNlLnR5cGVgICAgICAgICAgICAgICAgICAgfCBLdWJlcm5ldGVzIFNlcnZpY2UgdHlwZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBgQ2x1c3RlcklQYCAgICAgICAgICAgICAgICAgIHwKfCBgc2VydmljZS5hbm5vdGF0aW9uc2AgICAgICAgICAgIHwgS3ViZXJuZXRlcyBzZXJ2aWNlIGFubm90YXRpb25zLCBldmFsdWF0ZWQgYXMgYSB0ZW1wbGF0ZSAgICAgICAgIHwgYHt9YCAgICAgICAgICAgICAgICAgICAgICAgICB8CnwgYHNlcnZpY2UubG9hZEJhbGFuY2VySVBgICAgICAgICB8IFN0YXRpYyBJUCBBZGRyZXNzIHRvIHVzZSBmb3IgTG9hZEJhbGFuY2VyIHNlcnZpY2UgdHlwZSAgICAgICAgICB8IGBuaWxgICAgICAgICAgICAgICAgICAgICAgICAgfAp8IGBzZXJ2aWNlLmNsdXN0ZXJJUGAgICAgICAgICAgICAgfCBTdGF0aWMgY2x1c3RlcklQIG9yIE5vbmUgZm9yIGhlYWRsZXNzIHNlcnZpY2VzICAgICAgICAgICAgICAgICAgfCBgTm9uZWAgICAgICAgICAgICAgICAgICAgICAgIHwKfCBgc2VydmljZS5ub2RlUG9ydC5lbmFibGVkYCAgICAgICB8IEVuYWJsZSBOb2RlUG9ydCB0byBtYWtlIGFlcm9zcGlrZSBjbHVzdGVyIGF2YWlsYWJsZSBvdXRzaWRlIHRoZSBLdWJlcm5ldGVzIGNsdXN0ZXIgICAgICAgICB8IGBmYWxzZWAgICAgICAgICAgICAgICAgICAgICAgICAgfAp8IGBzZXJ2aWNlLm5vZGVQb3J0LnBvcnRgICAgICAgIHwgVGhlIE5vZGVQb3J0IHBvcnQgdG8gZXhwb3NlICAgICAgICAgfCBge31gICAgICAgICAgICAgICAgICAgICAgICAgIHwKfCBgbWV0cmljcy5lbmFibGVkYCAgICAgICB8IEVuYWJsZWQgdGhlIG1ldHJpYyBzaWRlY2FyIHRoYXQgc2NyYXBlcyBBZXJvc3Bpa2UgYXQgYGxvY2FsaG9zdDozMDAwYC4gTmVlZHMgdG8gYmUgcHJvdmlkZWQgYSBzaWRlY2FyIGltYWdlL3JlcG8uIFtUaGlzXSgpIGlzIGEgZ29vZCBwbGFjZSB0byBzdGFydDogaHR0cHM6Ly9naXRodWIuY29tL2FsaWNlYm9iL2FzcHJvbSAgICAgICAgIHwgYGZhbHNlYCAgICAgICAgICAgICAgICAgICAgICAgICB8CnwgYG1ldHJpY3MuaW1hZ2UucmVwb3NpdG9yeWAgICAgICAgfCBNZXRyaWMgc2lkZWNhciBpbWFnZSByZXBvc2l0b3J5ICAgICAgICAgfCBge31gICAgICAgICAgICAgICAgICAgICAgICAgIHwKfCBgbWV0cmljcy5pbWFnZS50YWdgICAgICAgIHwgTWV0cmljIHNpZGVjYXIgaW1hZ2UgdGFnICAgICAgICAgfCBge31gICAgICAgICAgICAgICAgICAgICAgICAgIHwKfCBgbWV0cmljcy5zZXJ2aWNlTW9uaXRvci5lbmFibGVkYCAgICAgICB8IEVuYWJsZSBtZXRyaWNzIHNlcnZpY2UgbW9uaXRvci4gRm9yIG1vcmUgaW5mbywgY2hlY2sgW1Byb21ldGhldXMgT3BlcmF0b3JdKFtodHRwczovL2dpdGh1Yi5jb20vY29yZW9zL3Byb21ldGhldXMtb3BlcmF0b3JdKGh0dHBzOi8vZ2l0aHViLmNvbS9jb3Jlb3MvcHJvbWV0aGV1cy1vcGVyYXRvcikpICAgICAgICAgfCBgZmFsc2VgICAgICAgICAgICAgICAgICAgICAgICAgIHwKfCBgbWV0cmljcy5zZXJ2aWNlTW9uaXRvci50YXJnZXRMYWJlbHNgICAgICAgIHwgQWRkIHRoZXNlIGFkZGl0aW9uYWwgbGFiZWxzIGZyb20geW91ciBzZXJ2aWNlIHRvIHRoZSBzZXJ2aWNlIG1vbml0b3IuICBGb3IgbW9yZSBpbmZvLCBjaGVjayBbUHJvbWV0aGV1cyBPcGVyYXRvcl0oW2h0dHBzOi8vZ2l0aHViLmNvbS9jb3Jlb3MvcHJvbWV0aGV1cy1vcGVyYXRvcl0oaHR0cHM6Ly9naXRodWIuY29tL2NvcmVvcy9wcm9tZXRoZXVzLW9wZXJhdG9yKSkgICAgICAgICB8IGB7fWAgICAgICAgICAgICAgICAgICAgICAgICAgfAoKU3BlY2lmeSBwYXJhbWV0ZXJzIHVzaW5nIGAtLXNldCBrZXk9dmFsdWVbLGtleT12YWx1ZV1gIGFyZ3VtZW50IHRvIGBoZWxtIGluc3RhbGxgCgpBbHRlcm5hdGl2ZWx5IGEgWUFNTCBmaWxlIHRoYXQgc3BlY2lmaWVzIHRoZSB2YWx1ZXMgZm9yIHRoZSBwYXJhbWV0ZXJzIGNhbiBiZSBwcm92aWRlZCBsaWtlIHRoaXM6CgpgYGBzaApoZWxtIGluc3RhbGwgLS1uYW1lIG15LWFlcm9zcGlrZSAtZiB2YWx1ZXMueWFtbCBzdGFibGUvYWVyb3NwaWtlCmBgYAoKIyMjIENvbmYgZmlsZXMgZm9yIEFlcm9zcGlrZQpUaGVyZSBpcyBvbmUgY29uZiBmaWxlIGFkZGVkIHRvIGVhY2ggQWVyb3NwaWtlIHJlbGVhc2UuIFRoaXMgY29uZiBmaWxlIGNhbiBiZSByZXBsYWNlZCB3aXRoIGEgY3VzdG9tIGZpbGUgYW5kIHVwZGF0aW5nIHRoZSBgY29uZkZpbGVgIHZhbHVlLgoKSWYgeW91IG1vZGlmeSB0aGUgYGFlcm9zcGlrZS5jb25mYCAoYW5kIHlvdSB1c2UgbW9yZSB0aGFuIDEgcmVwbGljYSksIHlvdSB3YW50IHRvIGFkZCB0aGUgYCNSRVBMQUNFX1RISVNfTElORV9XSVRIX01FU0hfQ09ORklHYCBjb21tZW50IHRvIHRoZSBjb25maWcgZmlsZSAoc2VlIHRoZSBkZWZhdWx0IGNvbmYgZmlsZSkuIFRoaXMgd2lsbCB1cGRhdGUgeW91ciBtZXNoIHRvIGNvbm5lY3QgZWFjaCByZXBsaWNhLgo="
        }
      ]
    },
    "manifest": "---\n# Source: aerospike/templates/configmap.yaml\napiVersion: v1\nkind: ConfigMap\nmetadata:\n  name: aerospike-1579797954\n  labels:\n    app: aerospike\n    chart: aerospike-0.3.2\n    release: aerospike-1579797954\n    heritage: Helm\ndata:\n  aerospike.conf: |\n    # aerospike configuration\n        #default config file\n    service {\n        user root\n        group root\n        paxos-protocol v5\n        paxos-single-replica-limit 1\n        pidfile /var/run/aerospike/asd.pid\n        # HERE UPDATE changed service threads from 4 to 3\n        service-threads 3\n        transaction-queues 4\n        transaction-threads-per-queue 4\n        proto-fd-max 15000\n    }\n    \n    logging {\n        file /var/log/aerospike/aerospike.log {\n            context any info\n        }\n    \n        console {\n            context any info\n        }\n    }\n    \n    network {\n        service {\n            address any\n            port 3000\n        }\n    \n        heartbeat {\n            address any\n            interval 150\n            \n        mesh-seed-address-port aerospike-1579797954-0.aerospike-1579797954 3002\n            mode mesh\n            port 3002\n            timeout 20\n            protocol v3\n        }\n    \n        fabric {\n            port 3001\n        }\n    \n        info {\n            port 3003\n        }\n    }\n    \n    namespace test {\n        replication-factor 2\n        memory-size 1G\n        default-ttl 5d\n        storage-engine device {\n            file /opt/aerospike/data/test.dat\n            filesize 4G\n        }\n    }\n---\n# Source: aerospike/templates/service.yaml\napiVersion: v1\nkind: Service\nmetadata:\n  name: aerospike-1579797954\n  labels:\n    app: aerospike\n    chart: aerospike-0.3.2\n    release: aerospike-1579797954\n    heritage: Helm\n  annotations:\nspec:\n  # so the mesh peer-finder works\n  publishNotReadyAddresses: true\n  \n  clusterIP: \"None\"\n  \n  type: ClusterIP\n  ports:\n    - port: 3000\n      protocol: TCP\n      name: client\n    - port: 3002\n      protocol: TCP\n      name: mesh\n    \n  selector:\n    app: aerospike\n    release: aerospike-1579797954\n---\n# Source: aerospike/templates/statefulset.yaml\napiVersion: apps/v1\nkind: StatefulSet\nmetadata:\n  name: aerospike-1579797954\n  labels:\n    app: aerospike\n    chart: aerospike-0.3.2\n    release: aerospike-1579797954\n    heritage: Helm\nspec:\n  serviceName: aerospike-1579797954\n  replicas: 1\n  selector:\n    matchLabels:\n      app: aerospike\n      release: aerospike-1579797954\n  template:\n    metadata:\n      labels:\n        app: aerospike\n        release: aerospike-1579797954\n      annotations:\n        checksum/config: a070d13fbcb5b721657425639577690b36bcd60897798a9e979ea6c2a2fa24c2\n    spec:\n      terminationGracePeriodSeconds: 30\n      containers:\n      - name: aerospike-1579797954\n        image: \"aerospike/aerospike-server:4.5.0.5\"\n        imagePullPolicy: IfNotPresent\n        \n        \n        ports:\n        - containerPort: 3000\n          name: clients\n        - containerPort: 3002\n          name: mesh\n        - containerPort: 3003\n          name: info\n        readinessProbe:\n          tcpSocket:\n              port: 3000\n          initialDelaySeconds: 15\n          timeoutSeconds: 1\n        volumeMounts:\n        - name: config-volume\n          mountPath: /etc/aerospike\n        resources:\n          \n          {}\n      \n      volumes:\n      - name: config-volume\n        configMap:\n          name: aerospike-1579797954\n          items:\n          - key: aerospike.conf\n            path: aerospike.conf\n      \n  volumeClaimTemplates:\n",
    "version": 4,
    "namespace": "pspensieri",
    "chartVersion": "aerospike / 0.3.2"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/releases?cluster_id=:cluster_id</code>

Retrieve a release in a given [environment](#administration-environments)

Mandatory | &nbsp;
------- | -----------
`cluster_id` <br/>*string* | The id of the cluster in which to list the releases. 


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
`chart.templates` <br/> *list* | The list of templates contained inside the chart.
`chart.templates.name` <br/> *string* | The path name of the template inside the chart.
`chart.templates.data` <br/> *string* | The contents of the template. This is a base64 encode string.
`chart.files` <br/> *list* | The list of files contained inside the chart. These are not YAML files unlike the templates.
`chart.files.name` <br/> *string* | The path name of the file inside the chart.
`chart.files.data` <br/> *string* | The contents of the file. This is a base64 encode string.
`manifest` <br/> *string* | The YAML Kubernetes resources created by the Helm templating.
`values` <br/>*object* | All values that were used to install the release
`version`<br/>*string* | The revision of the release
`namespace`<br/>*string* | The namespace to which the release is installed