### Templates
A template is a virtual disk image that can be used on the creation of an [instance](#cloudstack-instances). It contains the operating system which can contain some predefined configuration, files and software.

#### List templates

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/compute-on/test_area/templates"

# Example:
```
```json
{
  "data": [{
    "id": "0b3fea04-b1ed-48cf-921d-96795dfe9a81",
    "name": "ubuntu",
    "description": "Example template",
    "defaultUsername": "cmc-user",
    "size": 52428800,
    "availablePublicly": false,
    "ready": true,
    "dynamicallyScalable": true,
    "extractable": false,
    "sshKeyEnabled": true,
    "created":"2016-10-24 2:40:29 PM EDT",
    "zoneId":"ea901007-056b-4c50-bb3a-2dd635fce2ab",
    "zoneName": "zone1",
    "osTypeId":"d38dc1d9-dd34-4fdd-8f51-a973f8fe5f3b",
    "osType": "Other (64-bit)",
    "availableInZones": [
       "ea901007-056b-4c50-bb3a-2dd635fce2ab"
    ]
  }],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/templates</code>

Retrieve a list of all templates of an [environment](#administration-environments) It will include all the public templates of the system.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the template
`name`<br/>*string* | The name of the template
`description`<br/>*string* | The description of the template
`defaultUsername`<br/>*string* | The default username of the template
`size`<br/>*long* | The size of the template in bytes
`availablePublicly`<br/>*boolean* | true if public to everyone. Your custom templates will always be private
`ready`<br/>*boolean* | true if the template is ready to be used for a new [instance](#cloudstack-instances)
`dynamicallyScalable`<br/>*boolean* | true if you can dynamically scale an [instance](#cloudstack-instances) with this template
`extractable`<br/>*boolean* | true if the template allows download from a generated URL
`created`<br/>*string* | The creation date of the template
`osTypeId`<br/>*UUID* | Id of th OS type
`osType`<br/>*string* | The OS type of the template (e.g. Ubuntu, CentOS...)
`zoneId`<br/>*UUID* |The [zone id](#cloudstack-zones) that the template is available in. Empty if available in multiple zones
`zoneName`<br/>*string* |The [zone id](#cloudstack-zones) that the template is available in. Empty if available in multiple zones
`availableInZones`<br/>*array[UUID]* | List of all [zone ids](#cloudstack-zones) that the template is available in

#### Retrieve a template

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
"https://cloudmc_endpoint/v1/services/compute-on/test_area/templates/162cdfcb-45e5-4aa6-81c4-124c94621bdb"

# Example:
```
```json
{
  "data": {
    "id": "0b3fea04-b1ed-48cf-921d-96795dfe9a81",
    "name": "ubuntu",
    "description": "Example template",
    "defaultUsername": "cmc-user",
    "size": 52428800,
    "availablePublicly": false,
    "ready": true,
    "dynamicallyScalable": true,
    "extractable": false,
    "sshKeyEnabled": true,
    "created":"2016-10-24 2:40:29 PM EDT",
    "zoneId":"ea901007-056b-4c50-bb3a-2dd635fce2ab",
    "zoneName": "zone1",
    "osTypeId":"d38dc1d9-dd34-4fdd-8f51-a973f8fe5f3b",
    "osType": "Other (64-bit)",
    "availableInZones": [
       "ea901007-056b-4c50-bb3a-2dd635fce2ab"
    ]
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/templates/:id</code>

Retrieve information about a public or private template of an [environment](#administration-environments)

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the template
`name`<br/>*string* | The name of the template
`description`<br/>*string* | The description of the template
`defaultUsername`<br/>*string* | The default username of the template
`size`<br/>*long* | The size of the template in bytes
`availablePublicly`<br/>*boolean* | true if public to everyone. Your custom templates will always be private
`ready`<br/>*boolean* | true if the template is ready to be used for a new [instance](#cloudstack-instances)
`dynamicallyScalable`<br/>*boolean* | true if you can dynamically scale an [instance](#cloudstack-instances) with this template
`extractable`<br/>*boolean* | true if the template allows download from a generated URL
`created`<br/>*string* | The creation date of the template
`osTypeId`<br/>*UUID* | Id of th OS type
`osType`<br/>*string* | The OS type of the template (e.g. Ubuntu, CentOS...)
`zoneId`<br/>*UUID* |The [zone id](#cloudstack-zones) that the template is available in. Empty if available in multiple zones
`zoneName`<br/>*string* |The [zone id](#cloudstack-zones) that the template is available in. Empty if available in multiple zones
`availableInZones`<br/>*array[UUID]* | List of all [zone ids](#cloudstack-zones) that the template is available in
