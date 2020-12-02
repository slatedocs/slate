## Regions

A region is a geographical area where a resource is located. Regions contains multiple Zones.

<!-------------------- LIST REGIONS -------------------->

#### List regions

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v1/services/gcp/test-area/regions"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "creationTimestamp": "1969-12-31T16:00:00.000-08:00",
      "description": "northamerica-northeast1",
      "id": "1330",
      "kind": "compute#region",
      "name": "northamerica-northeast1",
      "quotas": [
        {
          "limit": 24.0,
          "metric": "CPUS",
          "usage": 0.0
        },
        {
          "limit": 4096.0,
          "metric": "DISKS_TOTAL_GB",
          "usage": 40.0
        }
      ],
      "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area-oox/regions/northamerica-northeast1",
      "status": "UP",
      "zones": [
        "https://www.googleapis.com/compute/v1/projects/test-area-oox/zones/northamerica-northeast1-a",
        "https://www.googleapis.com/compute/v1/projects/test-area-oox/zones/northamerica-northeast1-b",
        "https://www.googleapis.com/compute/v1/projects/test-area-oox/zones/northamerica-northeast1-c"
      ]
    },
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/regions</code>

Retrieve a list of available regions, filtered by the [service connection](#administration-service-connections)'s policies.

Attributes | &nbsp;
------- | -----------
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`description`<br/>*string* | An optional description of this resource.
`id`<br/>*UUID* | The region's id.
`kind`<br/>*string* | Type of the resource.
`name`<br/>*string* | The region's name.
`quotas`<br/>*Array[object]* | Quotas assigned to this region.
`selfLink`<br/>*string* | Server-defined URL for this resource.
`status`<br/>*string* | tatus of the region, either UP or DOWN.
`zones`<br/>*Array[URL]* | A list of zones available in this region, in the form of resource URLs.

<!-------------------- RETRIEVE A REGION -------------------->

#### Retrieve a region

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v1/services/gcp/test-area/regions/1330"
```
> The above command returns a JSON structured like this:

```json
{
   "data": {
      "creationTimestamp": "1969-12-31T16:00:00.000-08:00",
      "description": "northamerica-northeast1",
      "id": "1330",
      "kind": "compute#region",
      "name": "northamerica-northeast1",
      "quotas": [
        {
          "limit": 24.0,
          "metric": "CPUS",
          "usage": 0.0
        },
        {
          "limit": 4096.0,
          "metric": "DISKS_TOTAL_GB",
          "usage": 40.0
        }
      ],
      "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area-oox/regions/northamerica-northeast1",
      "status": "UP",
      "zones": [
        "https://www.googleapis.com/compute/v1/projects/test-area-oox/zones/northamerica-northeast1-a",
        "https://www.googleapis.com/compute/v1/projects/test-area-oox/zones/northamerica-northeast1-b",
        "https://www.googleapis.com/compute/v1/projects/test-area-oox/zones/northamerica-northeast1-c"
      ]
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/regions/:id</code>

Retrieve information about a region.

Attributes | &nbsp;
------- | -----------
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`description`<br/>*string* | An optional description of this resource.
`id`<br/>*UUID* | The region's id.
`kind`<br/>*string* | Type of the resource.
`name`<br/>*string* | The region's name.
`quotas`<br/>*Array[object]* | Quotas assigned to this region.
`selfLink`<br/>*string* | Server-defined URL for this resource.
`status`<br/>*string* | tatus of the region, either UP or DOWN.
`zones`<br/>*Array[URL]* | A list of zones available in this region, in the form of resource URLs.
