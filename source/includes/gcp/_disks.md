### Disks
Deploy and manage your disks.

<!-------------------- LIST DISKS -------------------->

#### List disks

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/disks"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "creationTimestamp": "2019-05-07T08:46:06.488-07:00",
      "sizeGb": "10",
      "zone": "https://www.googleapis.com/compute/v1/projects/test-area/zones/northamerica-northeast1-a",
      "status": "ATTACHED",
      "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area/zones/northamerica-northeast1-a/disks/d-test-dow",
      "type": "https://www.googleapis.com/compute/v1/projects/test-area/zones/northamerica-northeast1-a/diskTypes/pd-standard",
      "lastAttachTimestamp": "2019-05-07T08:46:11.989-07:00",
      "users": [
        "https://www.googleapis.com/compute/v1/projects/test-area/zones/northamerica-northeast1-a/instances/i-test-aum"
      ],
      "labelFingerprint": "42WmSpB8rSM=",
      "physicalBlockSizeBytes": "4096",
      "kind": "compute#disk",
      "shortUsers": "i-test-aum",
      "shortType": "pd-standard",
      "attachMode": "READ_WRITE",
      "autoDelete": false,
      "id": "5333546534174463697",
      "name": "d-test-dow",
      "shortZone": "northamerica-northeast1-a",
      "shortRegion": "northamerica-northeast1"
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```
<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/disks</code>

Retrieve a list of all disks in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`sizeGb` <br/>*string* | The size of the disk in GB. Acceptable values are 1 to 65536, inclusive.
`zone`<br/>*string* | URL of the zone where the instance resides. 
`status`<br/>*string* | The status of the disk. One of the following values: READY, CREATING, ATTACHING, ATTACHED, DETACHING, RESIZING, DELETING, and DEPRECATED.
`selfLink`<br/>*string* | Server-defined URL for this resource.
`type`<br/>*string* | URL of the disk type resource describing which disk type to use to create the disk. Choices are ':url/pd-standard' or ':url/pd-ssd'.
`lastAttachTimestamp`<br/>*string* | Timestamp representing the last time the disk was attached.
`users`<br/>*Array[string]* | Links to the instances the disk is attached to.
`labelFingerprint`<br/>*string* | A base64-encoded string. A hash of the label's contents and used for optimistic locking.
`physicalBlockSizeBytes`<br/>*string* | Physical block size of the persistent disk, in bytes. Currently supported sizes are 4096 and 16384.
`kind`<br/>*string* | Type of the resource.
`shortUsers`<br/>*string* | The names of the instances the disk is attached to.
`shortType`<br/>*string* | The disk type. Choices are 'pd-standard' or 'pd-ssd'.
`attach_mode`<br/>*string* | The mode used to attach the disk to instances. Valid modes are READ_WRITE or READ_ONLY.
`autoDelete`<br/>*boolean* | Whether the resource should be deleted when the instance it's attached to are deleted.
`id`<br/>*UUID* | The id of the instance.
`name`<br/>*string* | The display name of the instance.
`shortZone`<br/>*string* | A short version of the zone name.
`shortRegion`<br/>*string* | A short version of the region name.

<!-------------------- RETRIEVE A DISK -------------------->

#### Retrieve a disk

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/disks/5333546534174463697"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "creationTimestamp": "2019-05-07T08:46:06.488-07:00",
    "sizeGb": "10",
    "zone": "https://www.googleapis.com/compute/v1/projects/test-area/zones/northamerica-northeast1-a",
    "status": "ATTACHED",
    "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area/zones/northamerica-northeast1-a/disks/d-test-dow",
    "type": "https://www.googleapis.com/compute/v1/projects/test-area/zones/northamerica-northeast1-a/diskTypes/pd-standard",
    "lastAttachTimestamp": "2019-05-07T08:46:11.989-07:00",
    "users": [
      "https://www.googleapis.com/compute/v1/projects/test-area/zones/northamerica-northeast1-a/instances/i-test-aum"
      ],
    "labelFingerprint": "42WmSpB8rSM=",
    "physicalBlockSizeBytes": "4096",
    "kind": "compute#disk",
    "shortUsers": "i-test-aum",
    "shortType": "pd-standard",
    "attachMode": "READ_WRITE",
    "autoDelete": false,
    "id": "5333546534174463697",
    "name": "d-test-dow",
    "shortZone": "northamerica-northeast1-a",
    "shortRegion": "northamerica-northeast1"
  }
}
```
<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/disks/:id</code>

Retrieve a disk in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`sizeGb` <br/>*string* | The size of the disk in GB. Acceptable values are 1 to 65536, inclusive.
`zone`<br/>*string* | URL of the zone where the instance resides. 
`status`<br/>*string* | The status of the disk. One of the following values: READY, CREATING, ATTACHING, ATTACHED, DETACHING, RESIZING, DELETING, and DEPRECATED.
`selfLink`<br/>*string* | Server-defined URL for this resource.
`type`<br/>*string* | URL of the disk type resource describing which disk type to use to create the disk. Choices are ':url/pd-standard' or ':url/pd-ssd'.
`lastAttachTimestamp`<br/>*string* | Timestamp representing the last time the disk was attached.
`users`<br/>*Array[string]* | Links to the instances the disk is attached to.
`labelFingerprint`<br/>*string* | A base64-encoded string. A hash of the label's contents and used for optimistic locking.
`physicalBlockSizeBytes`<br/>*string* | Physical block size of the persistent disk, in bytes. Currently supported sizes are 4096 and 16384.
`kind`<br/>*string* | Type of the resource.
`shortUsers`<br/>*string* | The names of the instances the disk is attached to.
`shortType`<br/>*string* | The disk type. Choices are 'pd-standard' or 'pd-ssd'.
`attachMode`<br/>*string* | The mode used to attach the disk to instances. Valid modes are READ_WRITE or READ_ONLY.
`autoDelete`<br/>*boolean* | Whether the resource should be deleted when the instance it's attached to are deleted.
`id`<br/>*UUID* | The id of the instance.
`name`<br/>*string* | The display name of the instance.
`shortZone`<br/>*string* | A short version of the zone name.
`shortRegion`<br/>*string* | A short version of the region name.

<!-------------------- CREATE A DISK -------------------->

#### Create a disk

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/disks"
```
> Request body example:

```json
{
  "name": "my-disk",
  "shortRegion": "northamerica-northeast1",
  "shortZone": "northamerica-northeast1-a",
  "shortType": "pd-standard",
  "sizeGb": "10"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/disks</code>

Create a new disk

Required | &nbsp;
------- | -----------
`name`<br/>*string* | The display name of the instance.
`shortRegion`<br/>*string* | A short version of the region name.
`shortZone`<br/>*string* | A short version of the zone name.
`shortType`<br/>*string* | The disk type. Choices are 'pd-standard' or 'pd-ssd'.
`sizeGb` <br/>*string* | The size of the disk in GB. Acceptable values are 1 to 65536, inclusive.

Optional | &nbsp;
------- | -----------
`physicalBlockSizeBytes`<br/>*string* | Physical block size of the persistent disk, in bytes. Currently supported sizes are 4096 and 16384. Defaults to 4096.

<!-------------------- DELETE A DISK -------------------->

#### Delete a disk

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/disks/5333546534174463697"
```

> Request body example:

```json
{
   "deleteSnapshots": true,
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/disks/:id</code>

Destroy an existing disk. A disk can only be deleted if it's not attached to an [instance](#gcp-instances).

Optional | &nbsp;
------ | -----------
`deleteSnapshots`<br/>*boolean* | Whether captured snapshops should be deleted

<!-------------------- ATTACH A DISK -------------------->

#### Attach a disk to an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/disks/5333546534174463697?operation=attach"
```
> Request body example:

```json
{
   "shortUsers": "5611478403377505138",
   "attachMode": "READ_WRITE",
   "autoDelete": false
}
```
<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/disks/:id?operation=attach</code>

Attach an existing disk to an [instance](#gcp-instances).

Required | &nbsp;
---------- | -----
`shortUsers`<br/>*string* | The id of the [instance](#gcp-instances) to which the created disk should be attached
`attachMode`<br/>*string* | The mode used to attach the disk to the [instance](#gcp-instances). Valid modes are READ_WRITE or READ_ONLY.
`autoDelete`<br/>*boolean* | Whether the resource should be deleted when the instance it's attached to are deleted. If attachMode is READ_ONLY, autoDelete has to be false.

<!-------------------- DETACH A DISK -------------------->

#### Detach a disk from an instance
```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/disks/5333546534174463697?operation=detach"
```
> Request body example:

```json
{
   "shortUsers": "5611478403377505138"
}
```
<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/disks/:id?operation=detach</code>

Detach an existing disk from a given [instance](#gcp-instances).

Required | &nbsp;
---------- | -----
`shortUsers`<br/>*string* | The id of the [instance](#gcp-instances) to which the created disk should be attached.

<!-------------------- RESIZE A DISK -------------------->

#### Resize a disk
```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/disks/5333546534174463697?operation=resize"
```
> Request body example:

```json
{
   "sizeGb": "50"
}
```
<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/disks/:id?operation=resize</code>

Resize an existing disk.

Required | &nbsp;
---------- | -----
`sizeGb` <br/>*string* | The size of the disk in GB. Valid values are 1 to 65536, inclusive, unless this is an [instance](#gcp-instances)'s boot disk, then the valid values are 1 to 2000.

<!-------------------- TAKE SNAPSHOT -------------------->

#### Take a snapshot of a disk
```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/disks/5333546534174463697?operation=snapshot"
```
> Request body example:

```json
{
   "snapshotName": "my-snapshot"
}
```
<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/disks/:id?operation=snapshot</code>

Take a snapshot of a persistent disk.

<aside class="notice">
Snapshots are incremental to avoid billing for redundant data and minimize use of storage. However, snapshots may occasionally capture the full disk for reliability. See the link for more information on <a href="https://cloud.google.com/compute/docs/disks/create-snapshots">creating snapshots.</a>
</aside>

Optional | &nbsp;
---------- | -----
`snapshotName` <br/>*string* | The name of the snapshot. A default value set if a snapshot name is not provided.