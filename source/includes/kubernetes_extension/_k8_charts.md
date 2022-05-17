### Charts


<!-------------------- LIST CHARTS -------------------->

#### List charts

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/charts?cluster_id=projects/cmc-k8s-enabled-llb/locations/us-central1-a/clusters/standard-cluster-1"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "helm-stable/aerospike",
      "name": "aerospike",
      "description": "A Helm chart for Aerospike in Kubernetes",
      "version": "0.3.3",
      "license": "",
      "deprecated": false,
      "repository": {
        "url": "https://kubernetes-charts.storage.googleapis.com",
        "name": "helm-stable",
        "kind": 0,
        "official": false,
        "displayName": "Stable",
        "repositoryId": "3cc327ae-9403-4521-9b71-f9a41d5f86c8",
        "organizationName": "helm",
        "verifiedPublisher": false,
        "organizationDisplayName": "Helm"
      },
      "packageId": "c4b6ad70-898d-4093-bec8-089d5f48daeb",
      "displayName": "",
      "normalizedName": "aerospike",
      "appVersion": "v4.5.0.5",
      "logoImageId": "50bcf132-ff98-4f9a-9e6a-0c0b06649e48",
      "logoImageUrl": "https://artifacthub.io/image/50bcf132-ff98-4f9a-9e6a-0c0b06649e48"
    }
  ],
  "metadata": {
    "pageSize": 50,
    "pageCurrent": 1,
    "recordCount": 148
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/charts?cluster_id=:cluster_id</code>

Retrieve a list of all charts in a given [environment](#administration-environments). To get more chart details, such as available versions, the chart's readme and list of maintainers, see the GET request for an individual chart.

Required | &nbsp;
------- | -----------
`cluster_id` <br/>*string* | The id of the cluster in which to list the charts. 


Attributes | &nbsp;
------- | -----------
| Attributes                                         | &nbsp;                                                                                                     |
|----------------------------------------------------|------------------------------------------------------------------------------------------------------------|
| `id` <br/>_string_                                 | The id for the chart, of the form `repositoryName/chartName`.                                              |
| `name` <br/>_string_                               | The chart name.                                                                                            |
| `description` <br/>_string_                        | The chart description.                                                                                     |
| `version` <br/>_string_                            | The latest chart version.                                                                                  |
| `license` <br/>_string_                            | The chart's license.                                                                                       |
| `deprecated` <br/>_boolean_                        | True if the chart is deprecated.                                                                           |
| `repository` <br/>_object_                         | The chart's parent repository.                                                                             |
| `repoository.url` <br/>_string_                    | The repository URL.                                                                                        |
| `repository.name` <br/>_string_                    | The repository name.                                                                                       |
| `repository.kind` <br/>_integer_                   | The repository kind, where `{0: Helm chart, 1: Falco rule, 2: OPA policy, 3: OLM operator }`.              |
| `repository.official` <br/>_boolean_               | True if it is an official repository. That is, if the publisher owns the software deployed by the package. |
| `repository.displayName` <br/>_string_             | The repository's display name.                                                                             |
| `repository.repositoryId` <br/>_UUID_              | The UUID of the repository.                                                                                |
| `repository.organizationName` <br/>_string_        | The name of the organization that owns the repository.                                                     |
| `repository.organizationDisplayName` <br/>_string_ | The display name of the organization that owns the repository.                                             |
| `repository.verifiedPublisher` <br/>_boolean_      | True if the publisher owns the repository.                                                                 |
| `packageId` <br/>_UUID_                            | The UUID of the package, given by ArtifactHub.                                                             |
| `displayName` <br/>_string_                        | The chart's display name.                                                                                  |
| `normalizedName` <br/>_string_                     | The chart's normalized name.                                                                               |
| `appVersion` <br/>_string_                         | The chart's app version.                                                                                   |
| `logoImageId` <br/>_UUID_                          | The UUID of the package's logo, given by ArtifactHub.                                                      |
| `logoImageUrl` <br/>_string_                       | The URL for the chart's logo.                                                                              |


<!-------------------- GET CHART -------------------->

#### Get chart

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/a_service/an_environment/charts/k8s-at-home/cloudflare-dyndns?cluster_id=projects/cmc-k8s-enabled-llb/locations/us-central1-a/clusters/standard-cluster-1"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "keywords": [
      "cloudflare",
      "dynamicdns"
    ],
    "maintainers": [
      {
        "name": "billimek",
        "email": "jeff@billimek.com"
      }
    ],
    "links": [
      {
        "url": "https://github.com/hotio/docker-cloudflare-ddns/",
        "name": "source"
      },
      {
        "url": "https://github.com/billimek/billimek-charts",
        "name": "source"
      }
    ],
    "homeUrl": "https://github.com/billimek/billimek-charts/tree/master/charts/cloudflare-dyndns",
    "availableVersions": [
      {
        "version": "1.0.0",
        "createdAt": 1576998322
      },
      {
        "version": "2.0.0",
        "createdAt": 1578688072
      }
    ],
    "readMe": "# Dynamic DNS using Cloudflare's DNS Services\n...",
    "id": "k8s-at-home/cloudflare-dyndns",
    "name": "cloudflare-dyndns",
    "description": "Dynamic DNS using Cloudflare's DNS Services",
    "version": "2.0.0",
    "license": "",
    "deprecated": false,
    "repository": {
      "url": "https://k8s-at-home.com/charts/",
      "name": "k8s-at-home",
      "kind": 0,
      "official": false,
      "displayName": "charts",
      "repositoryId": "9b40a3b3-ed2a-405f-8919-3b824d4f661d",
      "organizationName": "k8s-at-home",
      "verifiedPublisher": true,
      "organizationDisplayName": "k8s@home"
    },
    "packageId": "a6cd6148-977a-4852-8761-80234f39d90b",
    "displayName": "",
    "normalizedName": "cloudflare-dyndns",
    "appVersion": "1.0",
    "logoImageId": "3a0eac41-21b4-4a1b-b127-c7e70123eda8",
    "logoImageUrl": "https://artifacthub.io/image/3a0eac41-21b4-4a1b-b127-c7e70123eda8"
  }
}
```



<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/charts/:id?cluster_id=cluster_id</code>

Retrieve a specific chart in a given [environment](#administration-environments).

Required | &nbsp;
------- | -----------
`cluster_id` <br/>*string* | The id of the cluster in which to get the chart. 


| Attributes                                         | &nbsp;                                                                                                     |
|----------------------------------------------------|------------------------------------------------------------------------------------------------------------|
| `id` <br/>_string_                                 | The id for the chart, of the form `repositoryName/chartName`.                                              |
| `name` <br/>_string_                               | The chart name.                                                                                            |
| `description` <br/>_string_                        | The chart description.                                                                                     |
| `version` <br/>_string_                            | The latest chart version.                                                                                  |
| `license` <br/>_string_                            | The chart's license.                                                                                       |
| `deprecated` <br/>_boolean_                        | True if the chart is deprecated.                                                                           |
| `repository` <br/>_object_                         | The chart's parent repository.                                                                             |
| `repoository.url` <br/>_string_                    | The repository URL.                                                                                        |
| `repository.name` <br/>_string_                    | The repository name.                                                                                       |
| `repository.kind` <br/>_integer_                   | The repository kind, where `{0: Helm chart, 1: Falco rule, 2: OPA policy, 3: OLM operator }`.              |
| `repository.official` <br/>_boolean_               | True if it is an official repository. That is, if the publisher owns the software deployed by the package. |
| `repository.displayName` <br/>_string_             | The repository's display name.                                                                             |
| `repository.repositoryId` <br/>_UUID_              | The UUID of the repository.                                                                                |
| `repository.organizationName` <br/>_string_        | The name of the organization that owns the repository.                                                     |
| `repository.organizationDisplayName` <br/>_string_ | The display name of the organization that owns the repository.                                             |
| `repository.verifiedPublisher` <br/>_boolean_      | True if the publisher owns the repository.                                                                 |
| `packageId` <br/>_UUID_                            | The UUID of the package, given by ArtifactHub.                                                             |
| `displayName` <br/>_string_                        | The chart's display name.                                                                                  |
| `normalizedName` <br/>_string_                     | The chart's normalized name.                                                                               |
| `appVersion` <br/>_string_                         | The chart's app version.                                                                                   |
| `logoImageId` <br/>_UUID_                          | The UUID of the package's logo, given by ArtifactHub.                                                      |
| `logoImageUrl` <br/>_string_                       | The URL for the chart's logo.                                                                              |
| `keywords` <br/>_Array[string]_                    | The chart's keywords.                                                                                      |
| `maintainers` <br/>_Array[Object]_                 | The names and emails of chart maintainers.                                                                 |
| `homeUrl` <br/>_Array[Object]_                     | The chart's home URL.                                                                                      |
| `availableVersions` <br/>_Array[Object]_           | The available chart versions and their created dates.                                                      |




<!-------------------- INSTALL CHART -------------------->

#### Install chart

```shell
curl --request POST \
  --url https://cloudmc_endpoint/api/v1/services/a_service/an_environment/charts?cluster_id=projects/cmc-k8s-enabled-llb/locations/us-central1-a/clusters/standard-cluster-1 \
  --header 'MC-Api-Key: your_api_key' \
  --data '{
	"namespace": "my-namespace",
	"releaseName": "my-aerospike",
	"name": "aerospike",
	"version": "5.0.0",
  "values": ""
	"repository": {
		"url": "https://aerospike.github.io/aerospike-kubernetes-enterprise"
	}
}'
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "ef70cafa-0544-4709-a66a-c68595ee105a",
  "taskStatus": "SUCCESS"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/charts?cluster_id=:cluster_id</code>

Install a chart in a given [environment](#administration-environments).

| Required Query Parameters  | &nbsp;                                               |
|----------------------------|------------------------------------------------------|
| `cluster_id` <br/>*string* | The id of the cluster in which to install the chart. |

| Required Attributes             | &nbsp;                                                           |
|---------------------------------|------------------------------------------------------------------|
| `cluster_id` <br/>*string*      | The id of the cluster in which to install the chart.             |
| `namespace` <br/>_string_       | The namespace in which the chart will be installed.              |
| `releaseName` <br/>_string_     | The desired release name.                                        |
| `name` <br/>_string_            | The chart name.                                                  |
| `repository` <br/>_object_      | The chart's parent repository from which it should be installed. |
| `repoository.url` <br/>_string_ | The repository URL.                                              |

| Optional Attributes            | &nbsp;                                                                                                                       |
|--------------------------------|------------------------------------------------------------------------------------------------------------------------------|
| `version` <br/>_string_        | The chart version to be installed. Defaults to the latest version if left blank.                                             |
| `values` <br/>_string_         | The values used to install the chart. Must be a valid Yaml format. If not provided, the chart's default values will be used. |
| `insecureServer`<br/>_boolean_ | True if accessing the chart requires an unsecured connection.                                                                |
