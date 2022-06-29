### Instances

Deploy and manage your instances.

<!-------------------- LIST INSTANCES -------------------->

#### List instances

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/instances"
```
> The above command returns a JSON structured like this:

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
      "fingerprint": "RnfaWQ2UP4U=",
      "items": [
        {
          "key": "startup-script",
          "value": "#! /bin/bash\napt-get update\nEOF"
        }
      ],
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
      "shortNetwork": "default",
      "shortSubnetwork": "default",
      "iconUrl": "/rest/services/assets/gcp/os_logo/debian.png",
      "osImageName": "debian-9-stretch",
      "osImageSelfLink": "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20190514",
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

Retrieve a list of all instances in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`status`<br/>*string* | The status of the instance. One of the following values: PROVISIONING, STAGING, RUNNING, STOPPING, STOPPED, SUSPENDING, SUSPENDED, and TERMINATED.
`zone`<br/>*string* | URL of the zone where the instance resides.
`machineType`<br/>*string* | URL of the machine type resource used by this instance.
`cpuPlatform`<br/>*string* | The CPU platform used by this instance.
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`deletionProtection`<br/>*string* | Whether the resource should be protected against deletion.
`disks`<br/>*Array[Disk]* | Array of disks associated with this instance.
`kind`<br/>*string* | Type of the resource.
`labelFingerprint`<br/>*string* | A base64-encoded string. A hash of the label's contents and used for optimistic locking.
`metadata`<br/>*object* | The metadata key/value pairs assigned to this instance.
`networkInterfaces`<br/>*Array[object]* | An array of network configurations for this instance.
`scheduling`<br/>*object* | Sets the scheduling options for this instance.
`selfLink`<br/>*string* | Server-defined URL for this resource.
`startRestricted`<br/>*boolean* | Whether a VM has been restricted for start because Compute Engine has detected suspicious activity.
`tags`<br/>*object* | Tags to apply to this instance. Tags are used to identify valid sources or targets for network firewalls and are specified by the client during instance creation.
`shortMachineType`<br/>*string* | A short version of the machineType name.
`project`<br/>*string* | The project where the instance resides.
`internalIp`<br/>*string* | The instance's internal IP.
`shortNetwork`<br/>*string* | The network to which the instance is connected to.
`shortSubnetwork`<br/>*string* | The sub-network within the network the instance is connected to.
`iconUrl`<br/>*string* | Icon representing the OS installed on the instance's boot disk.
`osImageName`<br/>*string* | The name of the OS image installed on the instance's boot disk.
`osImageSelfLink`<br/>*string* | The full URL to the OS image.
`osImageSizeInGb`<br/>*string* | The size of the OS image.
`bootDiskSizeInGb`<br/>*string* | The size of the instance's boot disk.
`cpuCount`<br/>*string* | The number of vCPUs for the machine type.
`memoryInGB`<br/>*string* | The memory size for the machine name.
`id`<br/>*UUID* | The id of the instance.
`name`<br/>*string* | The display name of the instance.
`shortZone`<br/>*string* | A short version of the zone name.
`shortRegion`<br/>*string* | A short version of the region name.

<!-------------------- RETRIEVE AN INSTANCE -------------------->

#### Retrieve an instance

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/instances/5611478403377505138"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "status": "RUNNING",
    "zone": "https://www.googleapis.com/compute/v1/projects/test-area-oox/zones/northamerica-northeast1-a",
    "machineType": "https://www.googleapis.com/compute/v1/projects/test-area-oox/zones/northamerica-northeast1-a/machinetypes/f1-micro",
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
      "items": [
        {
          "key": "startup-script",
          "value": "#! /bin/bash\napt-get update\nEOF"
        }
      ],
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
    "shortNetwork": "default",
    "shortSubnetwork": "default",
    "iconUrl": "/rest/services/assets/gcp/os_logo/debian.png",
    "osImageName": "debian-9-stretch",
    "osImageSelfLink": "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20190514",
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

Retrieve an instance in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`status`<br/>*string* | The status of the instance. One of the following values: PROVISIONING, STAGING, RUNNING, STOPPING, STOPPED, SUSPENDING, SUSPENDED, and TERMINATED.
`zone`<br/>*string* | URL of the zone where the instance resides.
`machineType`<br/>*string* | URL of the machine type resource used by this instance.
`cpuPlatform`<br/>*string* | The CPU platform used by this instance.
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`deletionProtection`<br/>*string* | Whether the resource should be protected against deletion.
`disks`<br/>*Array[Disk]* | Array of disks associated with this instance.
`kind`<br/>*string* | Type of the resource.
`labelFingerprint`<br/>*string* | A base64-encoded string. A hash of the label's contents and used for optimistic locking.
`metadata`<br/>*object* | The metadata key/value pairs assigned to this instance.
`networkInterfaces`<br/>*Array[object]* | An array of network configurations for this instance.
`scheduling`<br/>*object* | Sets the scheduling options for this instance.
`selfLink`<br/>*string* | Server-defined URL for this resource.
`startRestricted`<br/>*boolean* | Whether a VM has been restricted for start because Compute Engine has detected suspicious activity.
`tags`<br/>*object* | Tags to apply to this instance. Tags are used to identify valid sources or targets for network firewalls and are specified by the client during instance creation.
`shortMachineType`<br/>*string* | A short version of the machineType name.
`project`<br/>*string* | The project where the instance resides.
`internalIp`<br/>*string* | The instance's internal IP.
`shortNetwork`<br/>*string* | The network to which the instance is connected to.
`shortSubnetwork`<br/>*string* | The sub-network within the network the instance is connected to.
`iconUrl`<br/>*string* | Icon representing the OS installed on the instance's boot disk.
`osImageName`<br/>*string* | The name of the OS image installed on the instance's boot disk.
`osImageSelfLink`<br/>*string* | The full URL to the OS image.
`osImageSizeInGb`<br/>*string* | The size of the OS image.
`bootDiskSizeInGb`<br/>*string* | The size of the instance's boot disk.
`cpuCount`<br/>*string* | The number of vCPUs for the machine type.
`memoryInGB`<br/>*string* | The memory size for the machine name.
`id`<br/>*UUID* | The id of the instance.
`name`<br/>*string* | The display name of the instance.
`shortZone`<br/>*string* | A short version of the zone name.
`shortRegion`<br/>*string* | A short version of the region name.

<!-------------------- CREATE AN INSTANCE -------------------->

#### Create an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/instances"
```
> Request body examples:

```js
// Create an instance with an existing IP
{
  "name": "my-instance",
  "shortRegion": "northamerica-northeast1",
  "shortZone": "northamerica-northeast1-a",
  "bootDiskType": "pd-standard",
  "bootDiskSizeInGb": "10",
  "cpuCount": "2",
  "memoryInGB": "4.5",
  "osImageSelfLink": "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20190514",
  "shortSubnetwork": "production-net",
  "shortIP": "my-ip-name",
  "startupScript": "#! /bin/bash\napt-get update\nEOF"
}

// Create an instance with a new static IP
{
  "name": "my-instance",
  "shortRegion": "northamerica-northeast1",
  "shortZone": "northamerica-northeast1-a",
  "bootDiskType": "pd-standard",
  "bootDiskSizeInGb": "10",
  "cpuCount": "2",
  "memoryInGB": "4.5",
  "osImageSelfLink": "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20190514",
  "shortSubnetwork": "staging-net",
  "reserveStaticIP": true
}

// Create an instance with an ephemeral IP
{
  "name": "my-instance",
  "shortRegion": "northamerica-northeast1",
  "shortZone": "northamerica-northeast1-a",
  "bootDiskType": "pd-standard",
  "bootDiskSizeInGb": "10",
  "cpuCount": "2",
  "memoryInGB": "4.5",
  "osImageSelfLink": "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20190514",
  "shortSubnetwork": "development-net",
  "ephemeralIP": true
}

// Create an instance with no external IP
{
  "name": "my-instance",
  "shortRegion": "northamerica-northeast1",
  "shortZone": "northamerica-northeast1-a",
  "bootDiskType": "pd-standard",
  "bootDiskSizeInGb": "10",
  "cpuCount": "2",
  "memoryInGB": "4.5",
  "osImageSelfLink": "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20190514",
  "shortSubnetwork": "demo-net",
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances</code>

Create a new instance.

Required | &nbsp;
------- | -----------
`name`<br/>*string* | The display name of the instance.
`shortRegion`<br/>*string* | A short version of the region name.
`shortZone`<br/>*string* | A short version of the zone name.
`bootDiskType`<br/>*string* | The boot disk type. Choices are 'pd-standard' or 'pd-ssd'.
`bootDiskSizeInGb` <br/>*string* | The size of the boot disk in GB. Acceptable values are 1 to 2000, inclusive.
`cpuCount`<br/>*string* | Updated number of vCPUs of instance.
`memoryInGB`<br/>*string* | Updated memory of instance.
`osImageSelfLink`<br/>*string* | The full URL to the OS image.
`shortSubnetwork`<br/>*string* | The subnet that the instance is attached to upon creation. _(Note that the subnet must be in the same region as the instance)_.

Optional | &nbsp;
------- | -----------
`reserveStaticIP`<br/>*boolean* | If the value is true, a new static IP would be reserved and provided to the resource.
`shortIP`<br/>*string* | The name of an existing regional external IP address assigned to this instance in the same region. This argument is only valid in conjunction with reserveStaticIP and ephemeral IP being false.
`ephemeralIP`<br/>*boolean* | If the value is false, reserve static IP is false and if no shortIP is provided the instance won't have an external IP. If the value is true, an ephemeral external IP address will be assigned.
`startupScript`<br/>*string* | A startup script metadata item to run every time the instance boots up.

<!-------------------- DELETE AN INSTANCE -------------------->

#### Delete an instance

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/instances/5611478403377505138"
```

> Request body example:

```json
{
   "deleteSnapshots": true,
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id</code>

Delete an existing instance.

Optional | &nbsp;
------ | -----------
`deleteSnapshots`<br/>*boolean* | Whether captured snapshops of associated auto-deletable disks should be deleted
<!-------------------- CHANGE MACHINE TYPE -------------------->

#### Change machine type

A machine type determines the number of vCPUs and the size of the memory allocated to new [instances](#gcp-instances).

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/instances/6564997542943928188?operation=resize"
```
> Request body example:

```json
{
  "cpuCount": "2",
  "memoryInGB": "4.5"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=resize</code>

Update the number of vCPUs and memory of an existing instance.

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
`cpuCount`<br/>*string* | Updated number of vCPUs of instance.
`memoryInGB`<br/>*string* | Updated memory of instance.

<!-------------------- CHANGE EXTERNAL IP -------------------->

#### Change external IP

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/instances/6564997542943928188?operation=change_external_ip"
```
> Request body examples:

```js
// Changing the IP to an ephemeral IP, just leave it empty
{ }

// Changing the IP to a new static IP
{
  "reserveStaticIP" : true
}

// Changing the IP to an existing IP
{
  "shortIP" : "your-ip-name"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=change_external_ip</code>

Change the static external IP of an existing instance.

Optional | &nbsp;
------ | -----------
`shortIP`<br/>*String* | The name of a static external IP in the same region as the instance.
`reserveStaticIP`<br/>*boolean* | Specify to reserve a new external IP for the instance. Cannot be specified when 'shortIP' is also specified. 

<!-------------------- GET SSH COMMAND -------------------->

#### Get SSH command

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/instances/6564997542943928188?operation=get_ssh"
```
> Request body example:

```json
{
  "sshKeyId": "my-ssh-key"
}
```

> The above command(s) return(s) JSON structured like this:

```js
{
  "taskId": "c50390c7-9d5b-4af4-a2da-e2a2678a83e8",
  "taskStatus": "SUCCESS"
}
```
```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/tasks/c50390c7-9d5b-4af4-a2da-e2a2678a83e8"
```
> The above command(s) return(s) JSON structured like this:

```js
{
  "data": {
    "id": "c50390c7-9d5b-4af4-a2da-e2a2678a83e8",
    "status": "SUCCESS",
    "created": "2021-04-20T20:58:59.952881-04:00",
    "result": {
      "command": "ssh my-user@192.0.0.1",
    }
  }
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=get_ssh</code>

Retrieve a command to allow you to SSH into a give running instance.

Required | &nbsp;
------ | -----------
`sshKeyId`<br/>*string* | The id of an existing SSH key already save in the environment. Mutually exclusive with `publicKey`.
`publicKey`<br/>*string* | The SSH key text. Mutually exclusive with `sshKeyId`. A new SSH key will be save in the environment.

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | The task ID.
`status`<br/>*string* | The status.
`created`<br/>*Date* | The task's creation date.
`result`<br/>*Object* | The task result, containing details required to access the instance's console.
`result.command`<br/>*String* | The command to execute to access the instance's console.

<!-------------------- SET WINDOWS PASSWORD -------------------->

#### Set Windows password

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/instances/6564997542943928188?operation=set_windows_password"
```
> Request body example:

```json
{
	"username": "my-user"
}
```

> The above command(s) return(s) JSON structured like this:

```js
{
  "taskId": "c50390c7-9d5b-4af4-a2da-e2a2678a83e8",
  "taskStatus": "SUCCESS"
}
```
```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/tasks/c50390c7-9d5b-4af4-a2da-e2a2678a83e8"
```
> The above command(s) return(s) JSON structured like this:

```js
{
  "data": {
    "id": "c50390c7-9d5b-4af4-a2da-e2a2678a83e8",
    "status": "SUCCESS",
    "created": "2021-04-20T20:58:59.952881-04:00",
    "result": {
      "externalIpAddress": "192.0.0.1",
      "username": "my-user",
      "password": "my-generated-password"
    }
  }
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=set_windows_password</code>

Set and retrieve a generated password to a given user on a running Windows instance.

Required | &nbsp;
------ | -----------
`username`<br/>*string* | The username.

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | The task ID.
`status`<br/>*string* | The status.
`created`<br/>*Date* | The task's creation date.
`result`<br/>*Object* | The task result, containing details required to access the instance's console.
`result.externalIpAddress`<br/>*String* | The instance's external IP address.
`result.username`<br/>*String* | The username.
`result.password`<br/>*String* | The password for the given user.

<!-------------------- MANAGE GROUP MEMBERSHIP -------------------->

#### Manage group membership

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/instances/2986056884972096897?operation=manage_group_membership"
```
> Request body example:

```json
{
    "shortGroups": ["my-group"]
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instancegroups/:id?operation=manage_group_membership</code>

Manage an instance's membership to groups.

<aside class="notice">
An instance can only belong to one load balanced instance group. But you can add an instance to multiple non-load balanced instance groups.
</aside>

Required | &nbsp;
------ | -----------
`shortGroups`<br/>*array[string]* | Array of group names representing the current groups the instance belongs to. If a group, which the instance currently belongs to, is not kept in the list, the instance will be removed from the group. If the array is empty, the instance will be removed from all the groups it currently belongs to.

<!-------------------- START AN INSTANCE -------------------->

#### Start an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/instances/6564997542943928188?operation=start"

```

 <code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=start</code>

Start an existing instance. The instance must be in the *TERMINATED* status for this operation to work.

<!-------------------- STOP AN INSTANCE -------------------->

#### Stop an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/instances/6564997542943928188?operation=stop"
```

 <code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=stop</code>

 Stop an existing instance. The instance must be in either the *RUNNING* or *STOPPING* status for this operation to work. The default behavior is that the instance (denote by **id**) will be stopped gracefully.

<!-------------------- EDIT STARTUP SCRIPT -------------------->

#### Edit a startup script

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/instances/6564997542943928188?operation=edit_startup_script"
```
> Request body example:

```json
{
    "startupScript": "#! /bin/bash\ncat <<EOF > /var/www/html/index.html\n<html><body><h1>Hello World</h1>\n<p>This page was created from a simple startup script!</p>\n</body></html>\nEOF"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=edit_startup_script</code>

Edit the startup script for an existing instance.

Required | &nbsp;
------ | -----------
`startupScript`<br/>*string* | A startup script metadata item to run every time the instance boots up.
