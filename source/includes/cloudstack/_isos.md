### ISOs
An ISO is a disk image that is a copy of a file system. A bootable ISO can be used to create an [instance](#cloudstack-instances). Otherwise, an ISO may be attached to an existing instance.

#### List ISOs

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/compute-on/test_area/isos"

# Example:
```
```json
{
  "data": [{
    "id": "0b3fea04-b1ed-48cf-921d-96795dfe9a81",
    "name": "ubuntu",
    "description": "Example ISO",
    "size": 52428800,
    "ready": true,
    "bootable": true,
    "osTypeId":"d38dc1d9-dd34-4fdd-8f51-a973f8fe5f3b",
    "osTypeName": "Other (64-bit)",
    "zoneId":"ea901007-056b-4c50-bb3a-2dd635fce2ab"
  }],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/isos</code>

Retrieve a list of all ISOs of an [environment](#administration-environments)

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the ISO
`name`<br/>*string* | The name of the ISO
`description`<br/>*string* | The description of the ISO
`size`<br/>*long* | The size of the ISO in bytes
`ready`<br/>*boolean* | true if the ISO is ready to be used
`bootable`<br/>*boolean* | true if the ISO can be used for a new [instance](#cloudstack-instances)
`osTypeId`<br/>*UUID* | Id of th OS type
`osTypeName`<br/>*string* | The OS type of the ISO (e.g. Ubuntu, CentOS...)
`zoneId`<br/>*UUID* |The [zone id](#cloudstack-zones) that the ISO is available in

#### Retrieve a ISO

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
"https://cloudmc_endpoint/v1/services/compute-on/test_area/isos/162cdfcb-45e5-4aa6-81c4-124c94621bdb"

# Example:
```
```json
{
  "data": {
    "id": "0b3fea04-b1ed-48cf-921d-96795dfe9a81",
    "name": "ubuntu",
    "description": "Example ISO",
    "size": 52428800,
    "ready": true,
    "bootable": true,
    "osTypeId":"d38dc1d9-dd34-4fdd-8f51-a973f8fe5f3b",
    "osTypeName": "Other (64-bit)",
    "zoneId":"ea901007-056b-4c50-bb3a-2dd635fce2ab"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/ISOs/:id</code>

Retrieve information about a public or private ISO of an [environment](#administration-environments)

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the ISO
`name`<br/>*string* | The name of the ISO
`description`<br/>*string* | The description of the ISO
`size`<br/>*long* | The size of the ISO in bytes
`ready`<br/>*boolean* | true if the ISO is ready to be used
`bootable`<br/>*boolean* | true if the ISO can be used for a new [instance](#cloudstack-instances)
`osTypeId`<br/>*UUID* | Id of th OS type
`osTypeName`<br/>*string* | The OS type of the ISO (e.g. Ubuntu, CentOS...)
`zoneId`<br/>*UUID* |The [zone id](#cloudstack-zones) that the ISO is available in
