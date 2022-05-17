### Templates
A template is a virtual disk image that can be used on the creation of an [instance](#cloudstack-instances). It contains the operating system which can contain some predefined configuration, files and software.

#### List templates

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/templates"
```
> The above command returns a JSON structured like this:

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
    "osTypeName": "Other (64-bit)",
    "availableInZones": [
       "ea901007-056b-4c50-bb3a-2dd635fce2ab"
    ],
    "hypervisor": "VMware",
    "format": "OVA",
    "nicAdapter": "e1000",
    "rootDiskController": "scsi",
    "keyboard": "uk"
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
`availablePublicly`<br/>*boolean* | **true** if public to everyone. Your custom templates will always be private
`ready`<br/>*boolean* | **true** if the template is ready to be used for a new [instance](#cloudstack-instances)
`dynamicallyScalable`<br/>*boolean* | **true** if you can dynamically scale an [instance](#cloudstack-instances) with this template
`extractable`<br/>*boolean* | **true** if you want the template to be downloadable from a generated URL
`created`<br/>*string* | The creation date of the template
`osTypeId`<br/>*UUID* | Id of the OS type
`osTypeName`<br/>*string* | The OS type of the template (e.g. Ubuntu, CentOS...)
`sshEnabled`<br/>*boolean* | **false** if you want to enable sshKey for the template
`zoneId`<br/>*UUID* |The [zone id](#cloudstack-zones) that the template is available in. Empty if available in multiple zones
`zoneName`<br/>*string* |The [zone id](#cloudstack-zones) that the template is available in. Empty if available in multiple zones
`availableInZones`<br/>*array[UUID]* | List of all [zone ids](#cloudstack-zones) that the template is available in
`hypervisor`<br>*string* | The name of the hypervisor
`format`<br>*string* | The template format for the chosen hypervisor
`nicAdapter`<br>*string* | `VMWare only` The network interface controller name. Empty if not selected.<br>*Values*: e1000, pcnet32, vmxnet2 or vmxnet3.
`rootDiskController`<br>*string* | `VMWare only` The root disk controller name. Empty if not selected.<br>*Values*: ide, scsi for CloudStack version up to 4.4.<br>*Values*: ide, scsi, osdefault, pvscsi, lsilogic, lsisas1068, buslogic for CloudStack version 4.5 and up.
`keyboard`<br>*string* | `VMWare only` The keyboard type name. Empty if not selected.<br>*Values*: us, uk, jp, sc.

#### Retrieve a template

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
"https://cloudmc_endpoint/api/v1/services/compute-on/test_area/templates/162cdfcb-45e5-4aa6-81c4-124c94621bdb"
```
> The above command returns a JSON structured like this:

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
    "osTypeName": "Other (64-bit)",
    "availableInZones": [
       "ea901007-056b-4c50-bb3a-2dd635fce2ab"
    ],
    "hypervisor": "VMware",
    "format": "OVA",
    "nicAdapter": "e1000",
    "rootDiskController": "scsi",
    "keyboard": "uk"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/templates/:id</code>

Retrieve information about a public or private template of an [environment](#administration-environments).

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the template
`name`<br/>*string* | The name of the template
`description`<br/>*string* | The description of the template
`defaultUsername`<br/>*string* | The default username of the template
`size`<br/>*long* | The size of the template in bytes
`availablePublicly`<br/>*boolean* | **true** if public to everyone. Your custom templates will always be private
`ready`<br/>*boolean* | **true** if the template is ready to be used for a new [instance](#cloudstack-instances)
`dynamicallyScalable`<br/>*boolean* | **true** if you can dynamically scale an [instance](#cloudstack-instances) with this template
`extractable`<br/>*boolean* | **true** if you want the template to be downloadable from a generated URL
`created`<br/>*string* | The creation date of the template
`osTypeId`<br/>*UUID* | Id of the OS type
`osTypeName`<br/>*string* | The OS type of the template (e.g. Ubuntu, CentOS...)
`sshEnabled`<br/>*boolean* | **false** if you want to enable sshKey for the template
`zoneId`<br/>*UUID* |The [zone id](#cloudstack-zones) that the template is available in. Empty if available in multiple zones
`zoneName`<br/>*string* |The [zone id](#cloudstack-zones) that the template is available in. Empty if available in multiple zones
`availableInZones`<br/>*array[UUID]* | List of all [zone ids](#cloudstack-zones) that the template is available in
`hypervisor`<br>*string* | The name of the hypervisor
`format`<br>*string* | The template format for the chosen hypervisor
`nicAdapter`<br>*string* | `VMWare only` The network interface controller name. Empty if not selected.<br>*Values*: e1000, pcnet32, vmxnet2 or vmxnet3
`rootDiskController`<br>*string* | `VMWare only` The root disk controller name. Empty if not selected.<br>*Values*: ide, scsi for CloudStack version up to 4.4.<br>*Values*: ide, scsi, osdefault, pvscsi, lsilogic, lsisas1068, buslogic for CloudStack version 4.5 and up
`keyboard`<br>*string* | `VMWare only` The keyboard type name. Empty if not selected.<br>*Values*: us, uk, jp, sc

#### Import a template

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/templates"
```
> Request body example:

```json
{
  "name": "debian",
  "description":"This is my template",
  "url":"http://somewhere.com/template-vmware.ova",
  "hypervisor":"VMWare",
  "format":"OVA",
  "keyboard":"us",
  "nicAdapter":"vmxnet3",
  "osTypeId": "53161a9c-6019-11e7-914a-0200246f00c5",
  "osTypeName": "Debian GNU/Linux 7(64-bit)",
  "zoneId":"e2cf7fa0-c3c2-4a39-9f8d-ee01ac3546cd"
}
```
<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/templates</code>

Import a template.

Required | &nbsp;
-------- | ------
`name`<br/>*string* | The name of the template
`description`<br/>*string* | The description of the template
`url`<br/>*string* | The URL where the template is hosted. Both `http` and `https` URLs are supported
`zoneId`<br/>*UUID* | The zone where it will be available. If there is only 1 zone, the field is optional
`hypervisor`<br>*string* | The name of the hypervisor
`format`<br>*string* | The template format for the chosen hypervisor
`osTypeId`<br/>*UUID* | Id of the OS type
`osTypeName`<br/>*string*  | The OS type of the template (e.g. Ubuntu, CentOS...)

Optional | &nbsp;
-------- | ------
`defaultUsername`<br/>*string* | The default username of the template
`size`<br/>*long* | The size of the template in bytes
`availablePublicly`<br/>*boolean* | **true** if public to everyone. Your custom templates will always be private
`dynamicallyScalable`<br/>*boolean* | **true** if you can dynamically scale an [instance](#cloudstack-instances) with this template
`extractable`<br/>*boolean* | **true** if you want the template to be downloadable from a generated URL
`nicAdapter`<br>*string* | `VMWare only` The network interface controller name. Empty if not selected.<br>*Values*: e1000, pcnet32, vmxnet2 or vmxnet3
`rootDiskController`<br>*string* | `VMWare only` The root disk controller name. Empty if not selected.<br>*Values*: ide, scsi for CloudStack version up to 4.4.<br>*Values*: ide, scsi, osdefault, pvscsi, lsilogic, lsisas1068, buslogic for CloudStack version 4.5 and up
`keyboard`<br>*string* | `VMWare only` The keyboard type name. Empty if not selected.<br>*Values*: us, uk, jp, sc
`passwordEnabled`<br/>*boolean* | **false** if want to set the reset password feature
`sshEnabled`<br/>*boolean* | **false** if you want to enable sshKey for the template

#### Update a template

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/templates/162cdfcb-45e5-4aa6-81c4-124c94621bdb?operation=update"
```
> Request body example:

```json
{
  "description":"This is my updated template description"
}
```
<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/templates/:id/operation=update</code>

Update a template.

Required | &nbsp;
-------- | ------
`name`<br/>*string* | The name of the template
`description`<br/>*string* | The description of the template

Optional | &nbsp;
-------- | ------
`format`<br>*string* | The template format for the chosen hypervisor
`osTypeId`<br/>*UUID* | Id of the OS type
`passwordEnabled`<br/>*boolean* | **false** if want to set the reset password feature
`sshEnabled`<br/>*boolean* | **false** if you want to enable sshKey for the template
`defaultUsername`<br/>*string* | The default username of the template
`dynamicallyScalable`<br/>*boolean* | **true** if you can dynamically scale an [instance](#cloudstack-instances) with this template
`nicAdapter`<br>*string* | `VMWare only` The network interface controller name. Empty if not selected.<br>*Values*: e1000, pcnet32, vmxnet2 or vmxnet3
`rootDiskController`<br>*string* | `VMWare only` The root disk controller name. Empty if not selected.<br>*Values*: ide, scsi for CloudStack version up to 4.4.<br>*Values*: ide, scsi, osdefault, pvscsi, lsilogic, lsisas1068, buslogic for CloudStack version 4.5 and up
`keyboard`<br>*string* | `VMWare only` The keyboard type name. Empty if not selected.<br>*Values*: us, uk, jp, sc

#### Delete a template

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
"https://cloudmc_endpoint/api/v1/services/compute-on/test_area/templates/162cdfcb-45e5-4aa6-81c4-124c94621bdb"
```
<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/templates/:id</code>

Delete a private template.