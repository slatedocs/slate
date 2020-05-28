## Charts


<!-------------------- LIST CHARTS -------------------->

### List charts

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/k8s/an_environment/charts"
```
> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "stable/aerospike",
      "type": "chart",
      "attributes": {
        "name": "aerospike",
        "repo": {
          "name": "stable",
          "url": "https://kubernetes-charts.storage.googleapis.com"
        },
        "repoUrl": "https://hub.helm.sh/api/chartsvc",
        "description": "A Helm chart for Aerospike in Kubernetes",
        "home": "http://aerospike.com",
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
        "sources": [
          "https://github.com/aerospike/aerospike-server"
        ],
        "icon": "/v1/assets/stable/aerospike/logo"
      },
      "links": {
        "self": "/v1/charts/stable/aerospike"
      },
      "relationships": {
        "latestChartVersion": {
          "data": {
            "version": "0.3.2",
            "digest": "97cfd56a20129d65b30de9d77267bf30f7b5f2d28565285282e16b26678a4ce3",
            "urls": [
              "https://kubernetes-charts.storage.googleapis.com/aerospike-0.3.2.tgz"
            ],
            "readme": "/v1/assets/stable/aerospike/versions/0.3.2/README.md",
            "values": "/v1/assets/stable/aerospike/versions/0.3.2/values.yaml"
          },
          "links": {
            "self": "/v1/charts/stable/aerospike/versions/0.3.2"
          }
        }
      },
      "insecureServer": false
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```



<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/charts</code>

Retrieve a list of all charts in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id` <br/>*string* | The id for the chart.  
`type` <br/>*string* | The type of chart
`attributes` <br/>*object* | The annotations of the pod
`attributes.name` <br/>*string* | The name of the chart
`attributes.repo` <br/>*map* | The repository information where this chart was fetched (name,url)
`attributes.repoUrl` <br/>*string* | The url of the source of the chart
`attributes.description` <br/>*string* | The chart description
`attributes.home` <br/>*string* | The home url for the chart
`attributes.keywords` <br/>*string* | The keywords linked to the chart
`attributes.maintainers` <br/>*object* | The maintainers of the charts and their information
`attributes.sources` <br/>*list* | The sources for the chart
`attributes.icon` <br/>*string* | The icon for the chart
`relationships` <br/>*objection* | The relationship information for the chart
`relationships.latestChartVersion` <br/>*object* | The lastest version chart information
`relationships.latestChartVersion.data.version` <br/>*string* | The digest validating the chart
`relationships.latestChartVersion.data.digest` <br/>*string* | The name of the chart
`relationships.latestChartVersion.data.urls` <br/>*string* | The URLs for the package to download
`relationships.latestChartVersion.data.readme` <br/>*string* | The readme file location
`relationships.latestChartVersion.data.values` <br/>*string* | The values file location
`version`<br/>*string* | The revision of the release
`insecureServer`<br/>*boolean* | Specify if to access the chart we need an unsecure connection



<!-------------------- GET CHART -------------------->

### Get chart

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/k8s/an_environment/charts/stable/aerospike"
```
> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "stable/aerospike",
    "type": "chart",
    "attributes": {
      "name": "aerospike",
      "repo": {
        "name": "stable",
        "url": "https://kubernetes-charts.storage.googleapis.com"
      },
      "repoUrl": "https://hub.helm.sh/api/chartsvc",
      "description": "A Helm chart for Aerospike in Kubernetes",
      "home": "http://aerospike.com",
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
      "sources": [
        "https://github.com/aerospike/aerospike-server"
      ],
      "icon": "/v1/assets/stable/aerospike/logo"
    },
    "links": {
      "self": "/v1/charts/stable/aerospike"
    },
    "relationships": {
      "latestChartVersion": {
        "data": {
          "version": "0.3.2",
          "digest": "97cfd56a20129d65b30de9d77267bf30f7b5f2d28565285282e16b26678a4ce3",
          "urls": [
            "https://kubernetes-charts.storage.googleapis.com/aerospike-0.3.2.tgz"
          ],
          "readme": "/v1/assets/stable/aerospike/versions/0.3.2/README.md",
          "values": "/v1/assets/stable/aerospike/versions/0.3.2/values.yaml"
        },
        "links": {
          "self": "/v1/charts/stable/aerospike/versions/0.3.2"
        }
      }
    },
    "insecureServer": false
  }
}
```



<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/charts/:id</code>

Retrieve a specific chart in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id` <br/>*string* | The id for the chart.  
`type` <br/>*string* | The type of chart
`attributes` <br/>*object* | The annotations of the pod
`attributes.name` <br/>*string* | The name of the chart
`attributes.repo` <br/>*map* | The repository information where this chart was fetched (name,url)
`attributes.repoUrl` <br/>*string* | The url of the source of the chart
`attributes.description` <br/>*string* | The chart description
`attributes.home` <br/>*string* | The home url for the chart
`attributes.keywords` <br/>*string* | The keywords linked to the chart
`attributes.maintainers` <br/>*object* | The maintainers of the charts and their information
`attributes.sources` <br/>*list* | The sources for the chart
`attributes.icon` <br/>*string* | The icon for the chart
`relationships` <br/>*objection* | The relationship information for the chart
`relationships.latestChartVersion` <br/>*object* | The lastest version chart information
`relationships.latestChartVersion.data.version` <br/>*string* | The digest validating the chart
`relationships.latestChartVersion.data.digest` <br/>*string* | The name of the chart
`relationships.latestChartVersion.data.urls` <br/>*string* | The URLs for the package to download
`relationships.latestChartVersion.data.readme` <br/>*string* | The readme file location
`relationships.latestChartVersion.data.values` <br/>*string* | The values file location
`version`<br/>*string* | The revision of the release
`insecureServer`<br/>*boolean* | Specify if to access the chart we need an unsecure connection




<!-------------------- INSTALL CHART -------------------->

### Install chart

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/k8s/an_environment/charts"
```
> The above command returns JSON structured like this:

```json
{
	"relationships": {
		 "latestChartVersion": {
        "data": {
          "urls": [
						"https://kubernetes-charts.storage.googleapis.com/aerospike-0.3.2.tgz"
					]
				}
		 }
	},
	"insecureServer": false,
	"passedValues": "# Default values for aerospike.\nterminationGracePeriodSeconds: 30\nreplicaCount: 1\nnodeSelector: {}\nimage:\n  repository: aerospike/aerospike-server\n  tag: 4.5.0.5\n  pullPolicy: IfNotPresent\n\n# pass custom command. This is equivalent of Entrypoint in docker\ncommand: []\n\n# pass custom args. This is equivalent of Cmd in docker\nargs: []\n\n# Set as empty object {} if no volumes need to be created\n# See confFile below\npersistentVolume: {}\n  # - mountPath: /opt/aerospike/data\n  #   name: aerospike-data\n  #   template:\n  #     accessModes: [ \"ReadWriteOnce\" ]\n  #     # storageClassName:  \"standard\"\n  #     resources:\n  #       requests:\n  #         storage: \"36G\"\n  #     selector:\n  #       matchLabels:\n  #         diskname: \"aerospike-data\"\n\nservice:\n  type: ClusterIP\n  # Provide any additional annotations which may be required.\n  # The value is evaluated as a template, so, for example, the value can depend on .Release or .Chart\n  annotations: {}\n  loadBalancerIP:\n  clusterIP: None\n  # This field takes a list of IP CIDR ranges, which Kubernetes will use to configure firewall exceptions\n  # loadBalancerSourceRanges:\n  # - 10.0.0.0/8\n  nodePort: {}\n\n# turns on a sidecar that scrapes 'localhost:3000' and exposes to port 9134\n# a docker image built from this repo works well: https://github.com/alicebob/asprom\n# but you will need to build/host it yourself\nmetrics:\n  serviceMonitor: {}\n\nlabels: {}\nannotations: {}\n\ntolerations: []\n\nresources: {}\n  # We usually recommend not to specify default resources and to leave this as a conscious\n  # choice for the user. This also increases chances charts run on environments with little\n  # resources, such as Minikube. If you do want to specify resources, uncomment the following\n  # lines, adjust them as necessary, and remove the curly braces after 'resources:'.\n  # limits:\n  #  cpu: 100m\n  #  memory: 128Mi\n  # requests:\n  #  cpu: 100m\n  #  memory: 128Mi\n\nconfFile: |-\n  #default config file\n  service {\n      user root\n      group root\n      paxos-protocol v5\n      paxos-single-replica-limit 1\n      pidfile /var/run/aerospike/asd.pid\n      service-threads 4\n      transaction-queues 4\n      transaction-threads-per-queue 4\n      proto-fd-max 15000\n  }\n\n  logging {\n      file /var/log/aerospike/aerospike.log {\n          context any info\n      }\n\n      console {\n          context any info\n      }\n  }\n\n  network {\n      service {\n          address any\n          port 3000\n      }\n\n      heartbeat {\n          address any\n          interval 150\n          #REPLACE_THIS_LINE_WITH_MESH_CONFIG\n          mode mesh\n          port 3002\n          timeout 20\n          protocol v3\n      }\n\n      fabric {\n          port 3001\n      }\n\n      info {\n          port 3003\n      }\n  }\n\n  namespace test {\n      replication-factor 2\n      memory-size 1G\n      default-ttl 5d\n      storage-engine device {\n          file /opt/aerospike/data/test.dat\n          filesize 4G\n      }\n  }\n",
	"namespace": "default",
	"releaseName": "test1"
}
```



<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/charts</code>

Install a chart in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`relationships` <br/>*objection* | The relationship information for the chart
`relationships.latestChartVersion` <br/>*object* | The lastest version chart information
`relationships.latestChartVersion.data.urls` <br/>*string* | The URLs for the package to download
`insecureServer`<br/>*boolean* | Specify if to access the chart we need an unsecure connection
`passedValues` <br/>*string* | The values to use to install the chart. It must be a valid Yaml format
`namespace` <br/>*map* | The namespace in which the chart will be installed
`releaseName` <br/>*string* | The name under which the chart will be known.
