### ISOs
An ISO is a disk image that is a copy of a file system. A bootable ISO can be used to create an [instance](#cloudstack-instances). Otherwise, an ISO may be attached to an existing instance.

#### List ISOs

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/isos"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [{
    "id": "0b3fea04-b1ed-48cf-921d-96795dfe9a81",
    "name": "ubuntu",
    "description": "Example ISO",
    "architectureWidth": 64,
    "size": 52428800,
    "ready": true,
    "bootable": true,
    "availablePublicly": false,
    "extractable": false,
    "osTypeId":"d38dc1d9-dd34-4fdd-8f51-a973f8fe5f3b",
    "osTypeName": "Other (64-bit)",
    "zoneId":"ea901007-056b-4c50-bb3a-2dd635fce2ab",
    "zoneName": "zone1",
    "created": "2017-12-21 4:41:33 PM Z",
    "availableInZones": ["ea901007-056b-4c50-bb3a-2dd635fce2ab"]
  }],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/isos</code>

Retrieve a list of all ISOs of an [environment](#administration-environments).

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the ISO
`name`<br/>*string* | The name of the ISO
`description`<br/>*string* | The description of the ISO
`architectureWidth`<br/>*string* | Number of bits
`size`<br/>*long* | The size of the ISO in bytes
`ready`<br/>*boolean* | true if the ISO is ready to be used
`bootable`<br/>*boolean* | true if the ISO can be used for a new [instance](#cloudstack-instances)
`osTypeId`<br/>*UUID* | Id of th OS type
`osTypeName`<br/>*string* | The OS type of the ISO (e.g. Ubuntu, CentOS...)
`zoneId`<br/>*UUID* |The [zone id](#cloudstack-zones) that the ISO is available in. Empty if available in multiple zones
`zoneName`<br/>*string* |The [zone id](#cloudstack-zones) that the ISO is available in. Empty if available in multiple zones
`created`<br/>*string* | The date the template was created
`availableInZones`<br/>*List[String]* | The list of [zone ids](#cloudstack-zones)  that the ISO is available in

#### Retrieve a ISO

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
"https://cloudmc_endpoint/api/v1/services/compute-on/test_area/isos/162cdfcb-45e5-4aa6-81c4-124c94621bdb"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "0b3fea04-b1ed-48cf-921d-96795dfe9a81",
    "name": "ubuntu",
    "description": "Example ISO",
    "architectureWidth": 64,
    "size": 52428800,
    "ready": true,
    "bootable": true,
    "availablePublicly": false,
    "extractable": false,
    "osTypeId":"d38dc1d9-dd34-4fdd-8f51-a973f8fe5f3b",
    "osTypeName": "Other (64-bit)",
    "zoneId":"ea901007-056b-4c50-bb3a-2dd635fce2ab",
    "zoneName": "zone1",
    "created": "2017-12-21 4:41:33 PM Z",
    "availableInZones": ["ea901007-056b-4c50-bb3a-2dd635fce2ab"]
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/isos/:id</code>

Retrieve information about a public or private ISO of an [environment](#administration-environments).

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the ISO
`name`<br/>*string* | The name of the ISO
`description`<br/>*string* | The description of the ISO
`architectureWidth`<br/>*string* | Number of bits
`size`<br/>*long* | The size of the ISO in bytes
`ready`<br/>*boolean* | true if the ISO is ready to be used
`bootable`<br/>*boolean* | true if the ISO can be used for a new [instance](#cloudstack-instances)
`extractable`<br/>*boolean* | true if the template allows download from a generated URL
`osTypeId`<br/>*UUID* | Id of th OS type
`osTypeName`<br/>*string* | The OS type of the ISO (e.g. Ubuntu, CentOS...)
`zoneId`<br/>*UUID* |The [zone id](#cloudstack-zones) that the ISO is available in. Empty if available in multiple zones
`zoneName`<br/>*string* |The [zone id](#cloudstack-zones) that the ISO is available in. Empty if available in multiple zones
`created`<br/>*string* | The date the template was created
`availableInZones`<br/>*List[String]* | The list of [zone ids](#cloudstack-zones)  that the ISO is available in

#### Import ISO

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/isos"
```
> Request body example:

```json
{
   "name": "windows",
   "description":"This is my ISO",
   "url":"http://somewhere.com/somefile.iso",
   "zoneId":"d342520b-94aa-4e44-b066-6c18c9e4d65b"
}
```
<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/isos</code>

Import an ISO.

Required                   | &nbsp;
---------------------------|-------
`name`<br/>*string*        | The name of the ISO
`description`<br/>*string* | The description of the ISO
`url`<br/>*string*         | The URL where the ISO is hosted. N.B. only `http` protocol is supported
`zoneId`<br/>*UUID*        | The zone where it will be available. If there is only 1 zone, the field is optional

Optional                   | &nbsp;
---------------------------|-------
`bootable`<br/>*boolean*   | Indicates if the ISO is bootable or not. If provided, the `osTypeId` must be provided.
`osTypeId`<br/>*UUID*      | The OS type of the image. Must only be provided if `bootable` is `true`.


#### Attach an ISO to an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/testing/isos/e922e5fc-8fee-4688-ad93-c9ef5d7eb685?operation=attach"
```
> Request body example:

```json
{
   "instanceId": "c043e651-8b3f-4941-b47f-5ecb77f3423b"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/isos/:id?operation=attach</code>

Attach an existing, non-bootable ISO to an [instance](#cloudstack-instances). Each instance may have only one ISO attached at a time.

Required                | &nbsp;                                                  
------------------------|----------------------------------------------------------
`instanceId`<br/>*UUID* | The id of the instance to which the ISO will be attached

#### Detach the ISO from an instance

See the [*Detach the ISO from an instance* endpoint](#cloudstack-instances-detach-iso-from-instance) under *Instances*.

#### Generate a download URL for an ISO

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/testing/isos/e922e5fc-8fee-4688-ad93-c9ef5d7eb685?operation=generateDownloadUrl"

# No parameters required
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/isos/:id?operation=generateDownloadUrl</code>

Generate a URL that can be used to download an extractable ISO. The URL may also be used to import the ISO into another region. To be able to generate the download URL, the ISO must have been imported with the `extractable` flag set to `true`. The download URL will be placed in the `url` field of the task result.

#### Delete an ISO

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/isos/84fc07a8-c6a3-4538-b493-11ce69ea3c88"
```
<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/isos/:id</code>

Delete an ISO.
