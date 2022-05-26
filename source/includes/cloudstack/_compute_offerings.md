### Compute offerings

Compute offerings determine the number of vCPUs and the size of the memory allocated to new [instances](#cloudstack-instances).

#### List compute offerings

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/computeofferings"
```
> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "id": "40a2e5f7-22e6-4d1e-b03b-4a4b7c9cbc6f",
            "name": "Custom CPU and memory",
            "custom" : true,
            "availableCpuCountValues": [1, 2, 4, 8],
            "availableMemoryInMBValues": [1024, 2048, 4096, 8192],
            "maxMemoryInMBToCpuRatio": 2048
        },
        {
            "id": "1fb0caba-8ffb-4e77-8dcb-401170e15e0a",
            "name": "1vCPU.1GB",
            "cpuCount": 1,
            "memoryInMB": 1024,
            "custom" : false
        },
        {
            "id": "37dabe14-1b7f-4f40-ab87-b3ab90c2e871",
            "name": "32 CPU - 256 GB RAM",
            "memoryInMB": 262144,
            "cpuCount": 32,
            "custom": false,
            "type": "BareMetal",
            "availabilityCount": 1
        }
    ],
    "metadata": {
        "recordCount": 3
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/computeofferings</code>

Retrieve a list of available compute offerings.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the compute offering
`name`<br/>*string* | The name of the compute offering
`availabilityCount`<br/>*integer* | The number of compute offerings available to acquire. Only present for bare metal compute offerings.
`availableCpuCountValues`<br/>*Array[integer]* | The list of valid cpu counts when used in the [create instance operation](#cloudstack-create-an-instance). Only present for custom offerings
`availableMemoryInMBValues`<br/>*Array[integer]* | The list of valid amounts of memory (in MB) that can be used in the [create instance operation](#cloudstack-create-an-instance). Only present for custom offerings
`cpuCount`<br/>*int* | The number of vCPUs available to the created [instance](#cloudstack-instances)
`custom`<br/>*boolean* | If true, the `cpuCount` and `memoryInMB` fields will be missing from the response and will be required on [instance create](#cloudstack-create-an-instance)
`maxMemoryInMBToCpuRatio`<br/>*integer* | The maximum ratio of memory (in MB) to number of CPU of an [instance](#cloudstack-instances) created with this offering. Only present for custom offerings.
`memoryInMB`<br/>*int* | The amount of provisioned memory in MB
`type`<br/>*enum* | The type of compute offering. Only present for bare metal compute offerings. Value is BareMetal.

#### Retrieve a compute offering

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/computeofferings/40a2e5f7-22e6-4d1e-b03b-4a4b7c9cbc6f"
```
> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": "40a2e5f7-22e6-4d1e-b03b-4a4b7c9cbc6f",
        "name": "1vCPU.512MB",
        "cpuCount": 1,
        "memoryInMB": 512,
        "custom": false
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/computeofferings/:id</code>

Retrieve a compute offering.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the compute offering
`name`<br/>*string* | The name of the compute offering
`availabilityCount`<br/>*integer* | The number of compute offerings available to acquire. Only present for bare metal compute offerings.
`availableCpuCountValues`<br/>*Array[integer]* | The list of valid cpu counts when used in the [create instance operation](#cloudstack-create-an-instance). Only present for custom offerings
`availableMemoryInMBValues`<br/>*Array[integer]* | The list of valid amounts of memory (in MB) that can be used in the [create instance operation](#cloudstack-create-an-instance). Only present for custom offerings
`cpuCount`<br/>*int* | The number of vCPUs available to the created [instance](#cloudstack-instances)
`custom`<br/>*boolean* | If true, the `cpuCount` and `memoryInMB` fields will be missing from the response and will be required on [instance create](#cloudstack-create-an-instance)
`maxMemoryInMBToCpuRatio`<br/>*integer* | The maximum ratio of memory (in MB) to number of CPU of an [instance](#cloudstack-instances) created with this offering. Only present for custom offerings.
`memoryInMB`<br/>*int* | The amount of provisioned memory in MB
`type`<br/>*enum* | The type of compute offering. Only present for bare metal compute offerings. Value is BareMetal.
