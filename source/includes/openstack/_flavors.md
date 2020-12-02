### Flavors

Flavors are available hardware configurations for instances. They store the information for compute and memory capacity.

#### List flavors

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v1/services/compute-os/devel/flavors"
```
> The above command returns a JSON structured like this:

```json
{
   "data": [
      {
         "id": "1d547941-1738-4d7b-a70b-b52a44ff18e5",
         "name": "1vCPU.256MB",
         "ephemeralSizeInGB": 0,
         "diskSizeInGB": 20,
         "memorySizeInMB": 256,
         "cpuCount": 1
      },
      {
         "id": "921e8296-c801-498c-90a9-4398cd44681f",
         "name": "1vCPU.512MB",
         "ephemeralSizeInGB": 0,
         "diskSizeInGB": 20,
         "memorySizeInMB": 512,
         "cpuCount": 1
      }
   ],
   "metadata": {
      "recordCount": 2
   }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/flavors</code>

Retrieve a list of available flavors.

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | The flavor's id.
`name`<br/>*string* | The flavor name.
`ephemeralSizeInGB`<br/>*string* | The size of the ephemeral disk in GB.
`diskSizeInGB`<br/>*string* | The size of the root disk in GB.
`memorySizeInMB`<br/>*string*| The size of the memory in MB.
`cpuCount`<br/>*string*| The number of vCPU assigned.

#### Retrieve a flavor

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v1/services/compute-os/devel/flavors/1d547941-1738-4d7b-a70b-b52a44ff18e5"
```
> The above command returns a JSON structured like this:

```json
{
   "data": {
      "id": "1d547941-1738-4d7b-a70b-b52a44ff18e5",
      "name": "1vCPU.256MB",
       "ephemeralSizeInGB": 0,
       "diskSizeInGB": 20,
       "memorySizeInMB": 256,
       "cpuCount": 1
   }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/flavors/:id</code>

Retrieve information about a flavor.

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | The flavor's id.
`name`<br/>*string* | The flavor name.
`ephemeralSizeInGB`<br/>*string* | The size of the ephemeral disk in GB.
`diskSizeInGB`<br/>*string* | The size of the root disk in GB.
`memorySizeInMB`<br/>*string*| The size of the memory in MB.
`cpuCount`<br/>*string*| The number of vCPU assigned.
