## Releases

<!-------------------- LIST RELEASES -------------------->

### List releases

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/releases"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "my-namespace/my-cloudflare",
      "name": "my-cloudflare",
      "info": {
        "first_deployed": "2020-11-03T09:48:49.301166-05:00",
        "last_deployed": "2020-11-05T11:24:37.096888-05:00",
        "deleted": "",
        "description": "Upgrade complete",
        "status": "installed",
        "notes": "You can connect to the container running cloudflare-dyndns. To open a shell session in the pod run the following:\n..."
      },
      "chart": {
        "metadata": {
          "name": "cloudflare-dyndns",
          "home": "https://github.com/billimek/billimek-charts/tree/master/charts/cloudflare-dyndns",
          "sources": [
            "https://github.com/hotio/docker-cloudflare-ddns/",
            "https://github.com/billimek/billimek-charts"
          ],
          "version": "2.0.0",
          "description": "Dynamic DNS using Cloudflare's DNS Services",
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
          "icon": "https://www.cloudflare.com/img/cf-facebook-card.png",
          "apiVersion": "v1",
          "appVersion": "1.0",
          "deprecated": false
        },
        "values": {
          "affinity": {},
          "cloudflare": {
            "detection_mode": "dig-google.com",
            "hosts": "somehosts",
            "log_level": 1.0,
            "record_types": "somerecordtypes",
            "sleep_interval": 300.0,
            "token": "sometoken",
            "user": "someuser",
            "zones": "somezones"
          },
          "image": {
            "pullPolicy": "Always",
            "repository": "hotio/cloudflare-ddns",
            "tag": "latest"
          },
          "nodeSelector": {},
          "replicaCount": 1.0,
          "resources": {},
          "tolerations": []
        }
      },
      "config": {
        "affinity": {},
        "cloudflare": {
          "detection_mode": "dig-google.com",
          "hosts": "somehosts",
          "log_level": 1.0,
          "record_types": "somerecordtypes",
          "sleep_interval": 300.0,
          "token": "sometoken",
          "user": "someuser",
          "zones": "somezones"
        },
        "image": {
          "pullPolicy": "Always",
          "repository": "hotio/cloudflare-ddns",
          "tag": "latest"
        },
        "nodeSelector": {},
        "replicaCount": 1.0,
        "resources": {},
        "tolerations": []
      },
      "version": 10,
      "namespace": "my-namespace",
      "keepHistory": false,
      "chartVersion": "cloudflare-dyndns / 2.0.0"
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/releases</code>

Or

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/releases?namespace=default</code>

Retrieve a list of all releases in a given [environment](#administration-environments).

| Optional                  | &nbsp;                                                         |
| ------------------------- | -------------------------------------------------------------- |
| `namespace` <br/>_string_ | The namespace to list the release. This needs the exact value. |

| Attributes                                 | &nbsp;                                                                                                                                                               |
|--------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `id` <br/>_string_                         | The release id, of the form `namespace/releaseName`. |
| `name` <br/>_string_                       | The name of the release.                                                                                                                                             |
| `info` <br/>_object_                       | The information about the release.                                                                                                                                    |
| `info.first_deployed` <br/>_string_        | The annotations of the pod.                                                                                                                                           |
| `info.last_deployed` <br/>_string_         | The date of creation of the pod as a string.                                                                                                                          |
| `info.deleted` <br/>_string_               | The labels associated to the pod.                                                                                                                                     |
| `info.description` <br/>_string_           | The name of the pod.                                                                                                                                                  |
| `info.status` <br/>_string_                | The status of the release. Possible values are `unknown`, `installed`, `uninstalled`, `superseded`, `failed`, `uninstalling`, `pending-install`, `pending-upgrade`, `pending-rollback`. |
| `info.notes` <br/>_string_                 | The notes linked to the release.                                                                                                                                      |
| `chart`<br/>_object_                       | The information related to the chart of used in the release.                                                                                                          |
| `chart.version` <br/>_string_              | The version of the chart.                                                                                                                                             |
| `chart.metadata` <br/>_object_             | The metadata associated to the chart.                                                                                                                                 |
| `chart.metadata.name` <br/>_string_        | The name of the chart.                                                                                                                                                |
| `chart.metadata.home` <br/>_string_        | The home URL for the chart.                                                                                                                                           |
| `chart.metadata.sources` <br/>_list_       | The list of source of the charts.                                                                                                                                     |
| `chart.metadata.version` <br/>_string_     | The version of the chart.                                                                                                                                             |
| `chart.metadata.description` <br/>_string_ | The description of the chart.                                                                                                                                         |
| `chart.metadata.keywords` <br/>_list_      | The list of keywords linked to the chart.                                                                                                                             |
| `chart.metadata.maintainers` <br/>_list_   | The list of the maintainer contact information.                                                                                                                       |
| `chart.metadata.icon` <br/>_string_        | The icon URL for the chart.                                                                                                                                           |
| `chart.metadata.appVersion` <br/>_string_  | The version of the application.                                                                                                                                       |
| `chart.metadata.deprecate` <br/>_bool_     | If the chart is deprecated or not of the application.                                                                                                                 |
| `config` <br/>_object_                     | All values that were used to install the release.                                                                                                                     |
| `version`<br/>_string_                     | The revision of the release.                                                                                                                                          |
| `namespace`<br/>_string_                   | The namespace to which the release is installed.                                                                                                                      |

The information is not totally returned in the list. We filter out the manifest portion. We also filter out the files and the templates of the chart details. This information will be present in the GET request for an individual release.

<!-------------------- GET RELEASE -------------------->

### Get release

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/releases/my-namespace/my-cloudflare"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "my-namespace/my-cloudflare",
    "name": "my-cloudflare",
    "info": {
      "first_deployed": "2020-11-03T09:48:49.301166-05:00",
      "last_deployed": "2020-11-05T19:44:46.775668959Z",
      "deleted": "",
      "description": "Upgrade complete",
      "status": "installed",
      "notes": "You can connect to the container running cloudflare-dyndns. To open a shell session in the pod run the following:\n..."
    },
    "chart": {
      "metadata": {
        "name": "cloudflare-dyndns",
        "home": "https://github.com/billimek/billimek-charts/tree/master/charts/cloudflare-dyndns",
        "sources": [
          "https://github.com/hotio/docker-cloudflare-ddns/",
          "https://github.com/billimek/billimek-charts"
        ],
        "version": "2.0.0",
        "description": "Dynamic DNS using Cloudflare's DNS Services",
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
        "icon": "https://www.cloudflare.com/img/cf-facebook-card.png",
        "apiVersion": "v1",
        "appVersion": "1.0",
        "deprecated": false
      },
      "templates": [
        {
          "name": "templates/NOTES.txt",
          "data": "WW91I...fScp"
        },
        {
          "name": "templates/_helpers.tpl",
          "data": "e3svKi...9Cg=="
        },
        {
          "name": "templates/deployment.yaml",
          "data": "YXBpVm...9Cg=="
        },
        {
          "name": "templates/secret.yaml",
          "data": "YXBpVmVy...X0="
        }
      ],
      "values": {
        "affinity": {},
        "cloudflare": {
          "detection_mode": "dig-google.com",
          "hosts": "somehosts",
          "log_level": 1.0,
          "record_types": "somerecordtypes",
          "sleep_interval": 300.0,
          "token": "sometoken",
          "user": "someuser",
          "zones": "somezones"
        },
        "image": {
          "pullPolicy": "Always",
          "repository": "hotio/cloudflare-ddns",
          "tag": "latest"
        },
        "nodeSelector": {},
        "replicaCount": 1.0,
        "resources": {},
        "tolerations": []
      },
      "files": [
        {
          "name": ".helmignore",
          "data": "IyBQYX...b2oK"
        },
        {
          "name": "README.md",
          "data": "IyBE..4K"
        }
      ]
    },
    "manifest": "---\n# Source: cloudflare-dyndns/templates/secret.yaml\napiVersion: v1\n...",
    "config": {
      "affinity": {},
      "cloudflare": {
        "detection_mode": "dig-google.com",
        "hosts": "somehosts",
        "log_level": 1.0,
        "record_types": "somerecordtypes",
        "sleep_interval": 300.0,
        "token": "sometoken",
        "user": "someuser",
        "zones": "somezones"
      },
      "image": {
        "pullPolicy": "Always",
        "repository": "hotio/cloudflare-ddns",
        "tag": "latest"
      },
      "nodeSelector": {},
      "replicaCount": 1.0,
      "resources": {},
      "tolerations": []
    },
    "version": 11,
    "namespace": "my-namespace",
    "keepHistory": false,
    "chartVersion": "cloudflare-dyndns / 2.0.0"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/releases/:id</code>

| Attributes                                 | &nbsp;                                                                                                                                                                                  |
|--------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `id` <br/>_string_                         | The release id, of the form `namespace/releaseName`.                                                                                                                                    |
| `name` <br/>_string_                       | The name of the release.                                                                                                                                                                |
| `info` <br/>_object_                       | The information about the release.                                                                                                                                                      |
| `info.first_deployed` <br/>_string_        | The date the release was created.                                                                                                                                                       |
| `info.last_deployed` <br/>_string_         | The date the release was last updated.                                                                                                                                                  |
| `info.deleted` <br/>_string_               | The labels associated to the pod                                                                                                                                                        |
| `info.description` <br/>_string_           | Description of the release's status.                                                                                                                                                    |
| `info.status` <br/>_string_                | The status of the release. Possible values are `unknown`, `installed`, `uninstalled`, `superseded`, `failed`, `uninstalling`, `pending-install`, `pending-upgrade`, `pending-rollback`. |
| `info.notes` <br/>_string_                 | The notes linked to the release.                                                                                                                                                        |
| `chart`<br/>_object_                       | The information related to the chart used to install the release.                                                                                                                       |
| `chart.version` <br/>_string_              | The version of the chart.                                                                                                                                                               |
| `chart.metadata` <br/>_object_             | The metadata associated to the chart.                                                                                                                                                   |
| `chart.metadata.name` <br/>_string_        | The name of the chart.                                                                                                                                                                  |
| `chart.metadata.home` <br/>_string_        | The home URL for the chart.                                                                                                                                                             |
| `chart.metadata.sources` <br/>_list_       | The list of source of the charts.                                                                                                                                                       |
| `chart.metadata.version` <br/>_string_     | The version of the chart.                                                                                                                                                               |
| `chart.metadata.description` <br/>_string_ | The description of the chart.                                                                                                                                                           |
| `chart.metadata.keywords` <br/>_list_      | The list of keywords linked to the chart.                                                                                                                                               |
| `chart.metadata.maintainers` <br/>_list_   | The list of the maintainer contact information.                                                                                                                                         |
| `chart.metadata.icon` <br/>_string_        | The icon URL for the chart.                                                                                                                                                             |
| `chart.metadata.appVersion` <br/>_string_  | The version of the application.                                                                                                                                                         |
| `chart.metadata.deprecate` <br/>_bool_     | If the chart is deprecated or not of the application.                                                                                                                                   |
| `chart.templates` <br/> _list_             | The list of templates contained inside the chart.                                                                                                                                       |
| `chart.templates.name` <br/> _string_      | The path name of the template inside the chart.                                                                                                                                         |
| `chart.templates.data` <br/> _string_      | The contents of the template. This is a base64 encoded string.                                                                                                                           |
| `chart.files` <br/> _list_                 | The list of files contained inside the chart. These are not YAML files unlike the templates.                                                                                            |
| `chart.files.name` <br/> _string_          | The path name of the file inside the chart.                                                                                                                                             |
| `chart.files.data` <br/> _string_          | The contents of the file. This is a base64 encoded string.                                                                                                                               |
| `manifest` <br/> _string_                  | The YAML Kubernetes resources created by the Helm templating.                                                                                                                           |
| `config` <br/>_object_                     | All values that were used to install the release.                                                                                                                                       |
| `version`<br/>_string_                     | The revision of the release.                                                                                                                                                            |
| `namespace`<br/>_string_                   | The namespace to which the release is installed.                                                                                                                                        |

<!-- ROLLBACK RELEASE -->

### Rollback release to previous revision

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/releases/pspensieri/aerospike-1579797954&operation=rollback"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
      "name": "aerospike-1579797954",
      "version": 8,
      "info": {
          "deleted": "",
          "description": "Rollback to 6",
          "status": "deployed",
          ...
      ...
  },
  "taskId": "13943961-4a2c-4439-b7c9-05113d3b593a",
  "taskStatus": "SUCCESS"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/releases/:id?operation=rollback</code>

Rollback a release in a given [environment](#administration-environments) to the previous revision.

| Attributes                 | &nbsp;                                                                                           |
| -------------------------- | ------------------------------------------------------------------------------------------------ |
| `data` <br/>_Object_       | The release object. See [get release](#get-release) for a description of the release attributes. |
| `taskId` <br/>_string_     | The task id related to the pod rollback.                                                         |
| `taskStatus` <br/>_string_ | The status of the operation.                                                                     |

<!-------------------- UPGRADE RELEASE -------------------->

### Upgrade release

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/releases/my-namespace/my-aerospike?operation=upgrade"
   -d "request_body"
```

> Request body examples:

```js
// Change to the latest version of a chart
{
	"upgradeChart": {
		"name": "aerospike",
		"repository": {
			"url": "https://aerospike.github.io/aerospike-kubernetes-enterprise"
		}
	}
}

// Change to a specific version of a chart
{
	"upgradeChart": {
		"name": "aerospike",
		"version": "4.9.0",
		"repository": {
			"url": "https://aerospike.github.io/aerospike-kubernetes-enterprise"
		}
	}
}

// Change the values for the latest version
{
	"upgradeChart": {
		"name": "aerospike",
		"repository": {
			"url": "https://aerospike.github.io/aerospike-kubernetes-enterprise"
		}
	},
	"upgradeValues": "\"replicaCount\": 3"
}
```

> The above commands return JSON structured like this:

```json
{
  "taskId": "c50390c7-9d5b-4af4-a2da-e2a2678a83e8",
  "taskStatus": "SUCCESS"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/releases/:id?operation=upgrade</code>

Upgrade a release in a given [environment](#administration-environments).

| Required                          | &nbsp;                                                       |
|-----------------------------------|--------------------------------------------------------------|
| `upgradeChart` <br/>_Object_      | The chart object that should be used to ugprade the release. |
| `upgradeChart.name` <br/>_string_ | The chart name.                                              |
| `repository` <br/>_Object_        | The repository object to which the chart belongs.            |
| `repository.url` <br/>_string_    | The repository's URL.                                        |

| Optional                             | &nbsp;                                                                                                 |
|--------------------------------------|--------------------------------------------------------------------------------------------------------|
| `upgradeChart.version` <br/>_string_ | The chart version that should be used to upgrade the chart. If none is provided, the latest is used.   |
| `upgradeChart.values` <br/>_string_  | YAML structured text that will overwrite the default values for the upgrade/installation of the chart. |

| Attributes                 | &nbsp;                                  |
| -------------------------- | --------------------------------------- |
| `taskId` <br/>_string_     | The task id related to the pod upgrade. |
| `taskStatus` <br/>_string_ | The status of the operation.            |

<!-- UNINSTALL RELEASE -->

### Uninstall a release

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/a_service/an_environment/releases/pspensieri/aerospike-1579797954&operation=uninstall"
   -d "request_body"
```

> Request body example:

```json
{
  "keepHistory": true
}
```

> The above command returns a JSON structured like this:

```js
{
  "data": {
      "version": 0,
      "keepHistory": false
  },
  "taskId": "938f11b2-b37d-459e-8cf2-dea05c4d8f63",
  "taskStatus": "SUCCESS"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/releases/:id?operation=uninstall</code>

Uninstall a release in a given [environment](#administration-environments).

| Optional                  | &nbsp;                                                                    |
| ------------------------- | ------------------------------------------------------------------------- |
| `keepHistory` <br/>_bool_ | If true, will keep release history after uninstalling. Defaults to false. |

| Attributes                  | &nbsp;                                                                       |
| --------------------------- | ---------------------------------------------------------------------------- |
| `version` <br/>_string_     | The uninstalled release's revision. Revision 0 indicated it was uninstalled. |
| `keepHistory` <br/>_string_ | The *keepHistory* value used when uninstalling the chart.                    |
| `taskId` <br/>_string_      | The task id related to the pod uninstall.                                    |
| `taskStatus` <br/>_string_  | The status of the operation.                                                 |
