### Fixes [MC-](https://cloud-ops.atlassian.net/browse/MC-)

#### Changes made
- ...

#### Related PRs
- []()

<!-- CLOUDMC-API-DOCS TEMPLATE

### Upgrade release

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/v1/services/k8s/my-env/releases/my-release/aerospike?operation=upgrade"
```
> Request body example(s):

```js
// Add request descriptions (use 'js' instead of 'json', else comments appear in red)
// Change to the latest version of a chart
{
  "upgradeChart":  "stable/aerospike",
  "upgradeChart":  1 
}
```

```js
// Change to a specific version of a chart
{
  "upgradeChart" : "https://kubernetes-charts.storage.googleapis.com/aerospike-0.3.2.tgz"
}
```
> The above command(s) return(s) JSON structured like this:

```js
{
  "taskId": "c50390c7-9d5b-4af4-a2da-e2a2678a83e8",
  "taskStatus": "SUCCESS"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/releases/:id?operation=upgrade</code>

Upgrade a release in a given [environment](#administration-environments)

Required | &nbsp;
------- | -----------
`upgradeChart` <br/>*string* | The id of the chart to upgrade (repo/name) or the url to the version of the chart to use.  

Optional | &nbsp;
------- | -----------
`values` <br/>*string* | YAML structured text that will overwrite the default values for the upgrade/installation of the chart.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the pod upgrade.
`taskStatus` <br/>*string* | The status of the operation.
-->