### Instances
Deploy and manage your instances.

<!-------------------- LIST INSTANCES -------------------->

#### List instances

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/instances"

# The above command returns JSON structured like this:
```
```json
{
  "data": [
    {
      "status": "RUNNING",
      "zone": "https://www.googleapis.com/compute/v1/projects/test-area-oox/zones/northamerica-northeast1-a",
      "machineType": "https://www.googleapis.com/compute/v1/projects/test-area-oox/zones/northamerica-northeast1-a/machineTypes/f1-micro",
      "cpuPlatform": "Intel Skylake",
      "creationTimestamp": "2019-04-19T12:12:30.756-07:00",
      "deletionProtection": false,
      "disks": [
        {
          "autoDelete": true,
          "boot": true,
          "deviceName": "i-test-kkn",
          "guestOsFeatures": [
            {
              "type": "VIRTIO_SCSI_MULTIQUEUE"
            }
          ],
          "index": 0,
          "interface": "SCSI",
          "kind": "compute#attachedDisk",
          "licenses": [
            "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/licenses/debian-9-stretch"
          ],
          "mode": "READ_WRITE",
          "source": "https://www.googleapis.com/compute/v1/projects/test-area-oox/zones/northamerica-northeast1-a/disks/i-test-kkn",
          "type": "PERSISTENT"
        }
      ],
      "kind": "compute#instance",
      "labelFingerprint": "42WmSpB8rSM=",
      "metadata": {
        "fingerprint": "WFshDDge4fM=",
        "kind": "compute#metadata"
      },
      "networkInterfaces": [
        {
          "accessConfigs": [
            {
              "kind": "compute#accessConfig",
              "name": "external-nat",
              "natIP": "35.203.99.102",
              "networkTier": "PREMIUM",
              "type": "ONE_TO_ONE_NAT"
            }
          ],
          "fingerprint": "NG6-4Cdf0KA=",
          "kind": "compute#networkInterface",
          "name": "nic0",
          "network": "https://www.googleapis.com/compute/v1/projects/test-area-oox/global/networks/default",
          "networkIP": "10.162.0.7",
          "subnetwork": "https://www.googleapis.com/compute/v1/projects/test-area-oox/regions/northamerica-northeast1/subnetworks/default"
        }
      ],
      "scheduling": {
        "automaticRestart": true,
        "onHostMaintenance": "MIGRATE",
        "preemptible": false
      },
      "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area-oox/zones/northamerica-northeast1-a/instances/i-test-kkn",
      "startRestricted": false,
      "tags": {
        "fingerprint": "42WmSpB8rSM="
      },
      "shortMachineType": "custom-2-2048",
      "project": "test-area-oox",
      "internalIp": "10.162.0.7",
      "externalIp": "35.203.99.102",
      "networkName": "default",
      "subnetworkName": "default",
      "iconUrl": "/rest/services/assets/gcp/os_logo/debian.png",
      "osImageName": "debian-9-stretch",
      "osImageUrl": "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20190514",
      "osImageSizeInGb": 0,
      "bootDiskSizeInGb": 0,
      "cpuCount": 2,
      "memoryInGB": 2.000000,
      "id": "5611478403377505138",
      "name": "i-test-kkn",
      "shortZone": "northamerica-northeast1-a",
      "shortRegion": "northamerica-northeast1"
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```
<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances</code>

Retrieve a list of all instances in a given [environment](#administration-environments)

Attributes | &nbsp;
------- | -----------
`status`<br/>*string* | The status of the instance. One of the following values: PROVISIONING, STAGING, RUNNING, STOPPING, STOPPED, SUSPENDING, SUSPENDED, and TERMINATED.
`zone`<br/>*string* | URL of the zone where the instance resides. 
`machineType`<br/>*string* | URL of the machine type resource used by this instance
`cpuPlatform`<br/>*string* | The CPU platform used by this instance
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format
`deletionProtection`<br/>*string* | Whether the resource should be protected against deletion
`disks`<br/>*Array[Disk]* | Array of disks associated with this instance
`kind`<br/>*string* | Type of the resource
`labelFingerprint`<br/>*string* | A base64-encoded string. A hash of the label's contents and used for optimistic locking
`metadata`<br/>*object* | The metadata key/value pairs assigned to this instance
`networkInterfaces`<br/>*Array[object]* | An array of network configurations for this instance
`scheduling`<br/>*object* | Sets the scheduling options for this instance
`selfLink`<br/>*string* | Server-defined URL for this resource
`startRestricted`<br/>*boolean* | Whether a VM has been restricted for start because Compute Engine has detected suspicious activity.
`tags`<br/>*object* | Tags to apply to this instance. Tags are used to identify valid sources or targets for network firewalls and are specified by the client during instance creation
`shortMachineType`<br/>*string* | A short version of the machineType name
`project`<br/>*string* | The project where the instance resides
`internalIp`<br/>*string* | The instance's internal IP
`networkName`<br/>*string* | The network to which the instance is connected to
`subnetworkName`<br/>*string* | The sub-network within the network the instance is connected to
`iconUrl`<br/>*string* | Icon representing the OS installed on the instance's boot disk
`osImageName`<br/>*string* | The name of the OS image installed on the instance's boot disk
`osImageUrl`<br/>*string* | The full URL to the OS image
`osImageSizeInGb`<br/>*string* | The size of the OS image
`bootDiskSizeInGb`<br/>*string* | The size of the instance's boot disk
`cpuCount`<br/>*string* | The number of vCPUs for the machine type
`memoryInGB`<br/>*string* | The memory size for the machine name
`id`<br/>*UUID* | The id of the instance
`name`<br/>*string* | The display name of the instance
`shortZone`<br/>*string* | A short version of the zone name
`shortRegion`<br/>*string* | A short version of the region name

<!-------------------- RETRIEVE AN INSTANCE -------------------->

#### Retrieve an instance

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/instances/5611478403377505138"

# The above command returns JSON structured like this:
```
```json
{
  "data": {
    "status": "RUNNING",
    "zone": "https://www.googleapis.com/compute/v1/projects/test-area-oox/zones/northamerica-northeast1-a",
    "machineType": "https://www.googleapis.com/compute/v1/projects/test-area-oox/zones/northamerica-northeast1-a/machineTypes/f1-micro",
    "cpuPlatform": "Intel Skylake",
    "creationTimestamp": "2019-04-19T12:12:30.756-07:00",
    "deletionProtection": false,
    "disks": [
      {
        "autoDelete": true,
        "boot": true,
        "deviceName": "i-test-kkn",
        "guestOsFeatures": [
          {
            "type": "VIRTIO_SCSI_MULTIQUEUE"
          }
        ],
        "index": 0,
        "interface": "SCSI",
        "kind": "compute#attachedDisk",
        "licenses": [
          "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/licenses/debian-9-stretch"
        ],
        "mode": "READ_WRITE",
        "source": "https://www.googleapis.com/compute/v1/projects/test-area-oox/zones/northamerica-northeast1-a/disks/i-test-kkn",
        "type": "PERSISTENT"
      }
    ],
    "kind": "compute#instance",
    "labelFingerprint": "42WmSpB8rSM=",
    "metadata": {
      "fingerprint": "WFshDDge4fM=",
      "kind": "compute#metadata"
    },
    "networkInterfaces": [
      {
        "accessConfigs": [
          {
            "kind": "compute#accessConfig",
            "name": "external-nat",
            "natIP": "35.203.99.102",
            "networkTier": "PREMIUM",
            "type": "ONE_TO_ONE_NAT"
          }
        ],
        "fingerprint": "NG6-4Cdf0KA=",
        "kind": "compute#networkInterface",
        "name": "nic0",
        "network": "https://www.googleapis.com/compute/v1/projects/test-area-oox/global/networks/default",
        "networkIP": "10.162.0.7",
        "subnetwork": "https://www.googleapis.com/compute/v1/projects/test-area-oox/regions/northamerica-northeast1/subnetworks/default"
      }
    ],
    "scheduling": {
      "automaticRestart": true,
      "onHostMaintenance": "MIGRATE",
      "preemptible": false
    },
    "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area-oox/zones/northamerica-northeast1-a/instances/i-test-kkn",
    "startRestricted": false,
    "tags": {
      "fingerprint": "42WmSpB8rSM="
    },
    "shortMachineType": "custom-2-2048",
    "project": "test-area-oox",
    "internalIp": "10.162.0.7",
    "externalIp": "35.203.99.102",
    "networkName": "default",
    "subnetworkName": "default",
    "iconUrl": "/rest/services/assets/gcp/os_logo/debian.png",
    "osImageName": "debian-9-stretch",
    "osImageUrl": "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20190514",
    "osImageSizeInGb": 0,
    "bootDiskSizeInGb": 0,
    "cpuCount": 2,
    "memoryInGB": 2.000000,
    "id": "5611478403377505138",
    "name": "i-test-kkn",
    "shortZone": "northamerica-northeast1-a",
    "shortRegion": "northamerica-northeast1"
  }
}
```
<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id</code>

Retrieve an instance in a given [environment](#administration-environments)

Attributes | &nbsp;
------- | -----------
`status`<br/>*string* | The status of the instance. One of the following values: PROVISIONING, STAGING, RUNNING, STOPPING, STOPPED, SUSPENDING, SUSPENDED, and TERMINATED.
`zone`<br/>*string* | URL of the zone where the instance resides. 
`machineType`<br/>*string* | URL of the machine type resource used by this instance
`cpuPlatform`<br/>*string* | The CPU platform used by this instance
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format
`deletionProtection`<br/>*string* | Whether the resource should be protected against deletion
`disks`<br/>*Array[Disk]* | Array of disks associated with this instance
`kind`<br/>*string* | Type of the resource
`labelFingerprint`<br/>*string* | A base64-encoded string. A hash of the label's contents and used for optimistic locking
`metadata`<br/>*object* | The metadata key/value pairs assigned to this instance
`networkInterfaces`<br/>*Array[object]* | An array of network configurations for this instance
`scheduling`<br/>*object* | Sets the scheduling options for this instance
`selfLink`<br/>*string* | Server-defined URL for this resource
`startRestricted`<br/>*boolean* | Whether a VM has been restricted for start because Compute Engine has detected suspicious activity.
`tags`<br/>*object* | Tags to apply to this instance. Tags are used to identify valid sources or targets for network firewalls and are specified by the client during instance creation
`shortMachineType`<br/>*string* | A short version of the machineType name
`project`<br/>*string* | The project where the instance resides
`internalIp`<br/>*string* | The instance's internal IP
`networkName`<br/>*string* | The network to which the instance is connected to
`subnetworkName`<br/>*string* | The sub-network within the network the instance is connected to
`iconUrl`<br/>*string* | Icon representing the OS installed on the instance's boot disk
`osImageName`<br/>*string* | The name of the OS image installed on the instance's boot disk
`osImageUrl`<br/>*string* | The full URL to the OS image
`osImageSizeInGb`<br/>*string* | The size of the OS image
`bootDiskSizeInGb`<br/>*string* | The size of the instance's boot disk
`cpuCount`<br/>*string* | The number of vCPUs for the machine type
`memoryInGB`<br/>*string* | The memory size for the machine name
`id`<br/>*UUID* | The id of the instance
`name`<br/>*string* | The display name of the instance
`shortZone`<br/>*string* | A short version of the zone name
`shortRegion`<br/>*string* | A short version of the region name

<!-------------------- CREATE AN INSTANCE -------------------->

#### Create an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/instances"

# Request should look like this
```
```json
{
  "name": "my-instance",
  "shortRegion": "northamerica-northeast1",
  "shortZone": "northamerica-northeast1-a",
  "bootDiskType": "pd-standard",
  "bootDiskSizeInGb": "10",
  "cpuCount": "2",
  "memoryInGB": "4.5",
  "osImageUrl": "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20190514"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances</code>

Creates a new instance

Required | &nbsp;
------- | -----------
`name`<br/>*string* | The display name of the instance
`shortRegion`<br/>*string* | A short version of the region name
`shortZone`<br/>*string* | A short version of the zone name
`bootDiskType`<br/>*string* | The boot disk type. Choices are 'pd-standard' or 'pd-ssd'
`bootDiskSizeInGb` <br/>*string* | The size of the boot disk in GB. Acceptable values are 1 to 2000, inclusive
`cpuCount`<br/>*string* | Updated number of vCPUs of instance
`memoryInGB`<br/>*string* | Updated memory of instance
`osImageUrl`<br/>*string* | The full URL to the OS image

<!-------------------- DELETE AN INSTANCE -------------------->

#### Delete an instance

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/instances/5611478403377505138"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id</code>

Destroy an existing instance.

<!-------------------- CHANGE MACHINE TYPE -------------------->

#### Change machine type
A machine type determine the number of vCPUs and the size of the memory allocated to new [instances](#gcp-instances).

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/instances/6564997542943928188?operation=resize"

# Request example:
```
```json
{
   "cpuCount": "2",
   "memoryInGB": "4.5"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=resize</code>

Updates the number of vCPUs and memory of an existing instance.

<aside class="notice">
The maximum number of vCPUs allowed for a machine type is determined by the zone where the instance will be hosted.
Above 1, the instance vCPU count must be even, such as 2, 4, 6, 8, 10, and so on.
This number is enforced by the 'CPUS' Quota.
</aside>
<aside class="notice">
The memory per vCPU of a machine type must be between 0.9 GB and 6.5 GB per vCPU, inclusive.
The total memory for a machine type must be a multiple of 512 MB. For example, 6.9 GB is not acceptable, but 6.5 GB and 7 GB are acceptable.
</aside>

<aside class="warning">
  Changing the number of vCPUs and memory of a running instance will force a reboot of that instance.
</aside>

Optional | &nbsp;
------ | -----------
`cpuCount`<br/>*string* | Updated number of vCPUs of instance
`memoryInGB`<br/>*string* | Updated memory of instance

<!-------------------- START AN INSTANCE -------------------->

#### Start an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/instances/6564997542943928188?operation=start"

```

 <code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=start</code>

Start an existing instance. The instance must be in the *TERMINATED* status for this operation to work.

<!-------------------- STOP AN INSTANCE -------------------->

#### Stop an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/instances/6564997542943928188?operation=stop"
```

 <code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=stop</code>

 Stop an existing instance. The instance must be in either the *RUNNING* or *STOPPING* status for this operation to work. The default behavior is that the instance (denote by **id**) will be stopped gracefully.