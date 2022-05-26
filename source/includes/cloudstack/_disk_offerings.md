### Disk offerings

Disk offerings determine the size and the performance (IOPS) of [data volumes](#cloudstack-volumes).

#### List disk offerings

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/diskofferings"
```
> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "customIops": false,
            "customSize": false,
            "gbSize": 20,
            "id": "18bbab50-8d85-4b34-8361-0dc223ffd7e5",
            "name": "20GB - 20 IOPS Min."
        },
        {
            "customIops": false,
            "customSize": false,
            "gbSize": 50,
            "id": "0432acc2-9226-4945-bf2e-9c8157be31d1",
            "name": "50GB - 50 IOPS Min."
        }
    ],
    "metadata": {
        "recordCount": 2
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/diskofferings</code>

Retrieve a list of available disk offerings.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the disk offering
`name`<br/>*string* | The name of the disk offering
`gbSize`<br/>*int* | The size of the [data volume](#cloudstack-olumes) in GB
`customSize`<br/>*boolean* | If the offering supports custom size
`customIops`<br/>*boolean* | If the offering supports custom IOPS

#### Retrieve a disk offering

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/diskofferings/18bbab50-8d85-4b34-8361-0dc223ffd7e5"
```
> The above command returns a JSON structured like this:

```json
{
    "data": {
        "customIops": false,
        "customSize": false,
        "gbSize": 20,
        "id": "18bbab50-8d85-4b34-8361-0dc223ffd7e5",
        "name": "20GB - 20 IOPS Min."
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/diskofferings/:id</code>

Retrieve a disk offering.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the disk offering
`name`<br/>*string* | The name of the disk offering
`gbSize`<br/>*int* | The size of the [data volume](#cloudstack-volumes) in GB
`customSize`<br/>*boolean* | If the offering supports custom size
`customIops`<br/>*boolean* | If the offering supports custom IOPS
