## Images

Images are virtual machine images that have a virtual disk which contains a bootable operating system.

<!-------------------- LIST IMAGES -------------------->

#### List images

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v1/services/gcp/test-area/images"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "archiveSizeBytes": "10843137280",
      "creationTimestamp": "2019-05-14T16:49:57.269-07:00",
      "description": "Debian, Debian GNU/Linux, 9 (stretch), amd64 built on 20190514",
      "diskSizeGb": "10",
      "family": "debian-9",
      "guestOsFeatures": [
        {
          "type": "VIRTIO_SCSI_MULTIQUEUE"
        }
      ],
      "kind": "compute#image",
      "labelFingerprint": "42WmSpB8rSM=",
      "licenseCodes": [
        "1000205"
      ],
      "licenses": [
        "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/licenses/debian-9-stretch"
      ],
      "rawDisk": {
        "containerType": "TAR",
        "source": ""
      },
      "selfLink": "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20190514",
      "sourceType": "RAW",
      "status": "READY",
      "vendorFamily": "debian-cloud",
      "shortName": "Debian",
      "iconUrl": "/rest/services/assets/gcp/os_logo/debian.png",
      "id": "2447790134347098827",
      "name": "debian-9-stretch-v20190514"
    },
    {
      "archiveSizeBytes": "16469314560",
      "creationTimestamp": "2019-05-15T19:01:21.060-07:00",
      "description": "CentOS, CentOS, 7, x86_64 built on 20190515",
      "diskSizeGb": "10",
      "family": "centos-7",
      "kind": "compute#image",
      "labelFingerprint": "42WmSpB8rSM=",
      "licenseCodes": [
        "1000207"
      ],
      "licenses": [
        "https://www.googleapis.com/compute/v1/projects/centos-cloud/global/licenses/centos-7"
      ],
      "rawDisk": {
        "containerType": "TAR",
        "source": ""
      },
      "selfLink": "https://www.googleapis.com/compute/v1/projects/centos-cloud/global/images/centos-7-v20190515",
      "sourceType": "RAW",
      "status": "READY",
      "vendorFamily": "centos-cloud",
      "shortName": "CentOS",
      "iconUrl": "/rest/services/assets/gcp/os_logo/centos.png",
      "id": "4658005417542122143",
      "name": "centos-7-v20190515"
    }
  ],
  "metadata": {
    "recordCount": 2
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/images</code>

Retrieve a list of available images.

Attributes | &nbsp;
------- | -----------
`archiveSizeBytes`<br/>*string* | Size of the image tar.gz archive stored in Google Cloud Storage (in bytes).
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`description`<br/>*string* | An optional description of this resource.
`diskSizeGb`<br/>*string* | Size of the image when restored onto a persistent disk (in GB).
`family`<br/>*string* | The name of the image family to which this image belongs.
`kind`<br/>*string* | Type of the resource.
`labelFingerprint`<br/>*string* | A base64-encoded string. A hash of the label's contents and used for optimistic locking.
`licenseCodes`<br/>*Array[integer]* | License codes indicating which licenses are attached to this image..
`licenses`<br/>*Array[URI]* | Any applicable license URI.
`rawDisk`<br/>*Object* | The parameters of the raw disk image.
`selfLink`<br/>*string* | Server-defined URL for this resource.
`sourceType`<br/>*string* | The type of the image used to create this disk. The default and only value is RAW.
`status`<br/>*string* | The status of the image. An image can be used to create other resources, such as instances, only after the image has been successfully created and the status is set to READY. Possible values are FAILED, PENDING, or READY.
`vendorFamily`<br/>*string* | Image family's vendor name.
`shortName`<br/>*string* | A short version of the OS image's name.
`iconUrl`<br/>*string* | Icon representing the OS image.
`id`<br/>*UUID* | The image's id.
`name`<br/>*string* | The image's name.

<!-------------------- RETRIEVE AN IMAGE -------------------->

#### Retrieve an image

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v1/services/gcp/test-area/images/4658005417542122143"
```
> The above command returns a JSON structured like this:

```json
{
   "data": {
      "archiveSizeBytes": "16469314560",
      "creationTimestamp": "2019-05-15T19:01:21.060-07:00",
      "description": "CentOS, CentOS, 7, x86_64 built on 20190515",
      "diskSizeGb": "10",
      "family": "centos-7",
      "kind": "compute#image",
      "labelFingerprint": "42WmSpB8rSM=",
      "licenseCodes": [
        "1000207"
      ],
      "licenses": [
        "https://www.googleapis.com/compute/v1/projects/centos-cloud/global/licenses/centos-7"
      ],
      "rawDisk": {
        "containerType": "TAR",
        "source": ""
      },
      "selfLink": "https://www.googleapis.com/compute/v1/projects/centos-cloud/global/images/centos-7-v20190515",
      "sourceType": "RAW",
      "status": "READY",
      "vendorFamily": "centos-cloud",
      "shortName": "CentOS",
      "iconUrl": "/rest/services/assets/gcp/os_logo/centos.png",
      "id": "4658005417542122143",
      "name": "centos-7-v20190515"
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/images/:id</code>

Retrieve information about an image.

Attributes | &nbsp;
------- | -----------
`archiveSizeBytes`<br/>*string* | Size of the image tar.gz archive stored in Google Cloud Storage (in bytes).
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`description`<br/>*string* | An optional description of this resource.
`diskSizeGb`<br/>*string* | Size of the image when restored onto a persistent disk (in GB).
`family`<br/>*string* | The name of the image family to which this image belongs.
`kind`<br/>*string* | Type of the resource.
`labelFingerprint`<br/>*string* | A base64-encoded string. A hash of the label's contents and used for optimistic locking.
`licenseCodes`<br/>*Array[integer]* | License codes indicating which licenses are attached to this image.
`licenses`<br/>*Array[URI]* | Any applicable license URI.
`rawDisk`<br/>*Object* | The parameters of the raw disk image.
`selfLink`<br/>*string* | Server-defined URL for this resource.
`sourceType`<br/>*string* | The type of the image used to create this disk. The default and only value is RAW.
`status`<br/>*string* | The status of the image. An image can be used to create other resources, such as instances, only after the image has been successfully created and the status is set to READY. Possible values are FAILED, PENDING, or READY.
`vendorFamily`<br/>*string* | Image family's vendor name.
`shortName`<br/>*string* | A short version of the OS image's name.
`iconUrl`<br/>*string* | Icon representing the OS image.
`id`<br/>*UUID* | The image's id.
`name`<br/>*string* | The image's name.
