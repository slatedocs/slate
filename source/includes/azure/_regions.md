### Regions

A region is location where Azure resources are physically deployed. They can be whitelisted in the service configuration for an Azure connection in CloudMC.

#### List regions

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/azure/example/regions"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "name": "eastasia"
    },
    {
      "name": "eastus"
    }
  ],
  "metadata": {
    "recordCount": 2
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/regions</code>

Retrieve a list of all regions enabled. 

Attributes | &nbsp;
---------- | -----
`name`<br/>*string* | The name of the region.

#### Retrieve a region

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/azure/example/regions/useast"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "name": "eastus"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/regions/:name</code>

Retrieve a specific enabled region.

Attributes | &nbsp;
---------- | -----
`name`<br/>*string* | The name of the region.