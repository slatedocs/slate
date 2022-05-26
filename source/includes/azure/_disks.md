### Disks

Deploy and manage your disks.

For information regarding azure disks, please see [azure docs](https://docs.microsoft.com/en-us/rest/api/compute/disks/get#disk).

<!-------------------- LIST DISKS -------------------->

#### List disks

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/azure-conn/test_env/disks"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "/subscriptions/6b6a1f27-55c1-4b1d-969b-60a3c9eebe64/resourceGroups/azure-connect-system-ssamadh-mean-env/providers/Microsoft.Compute/disks/ssamadh-basic",
      "name": "ssamadh-basic",
      "type": "premium_lrs",
      "region": "southeastasia",
      "state": "unattached",
      "provisioningState": "succeeded",
      "creationDate": "2020-02-05T19:17:43.749Z",
      "sizeInBytes": 8589934592,
      "iops": 120,
      "throughputInMBps": 25,
      "dataDisk": true,
      "isAttachedToInstance": false
    },
    {
      "id": "/subscriptions/6b6a1f27-55c1-4b1d-969b-60a3c9eebe64/resourceGroups/azure-connect-system-ssamadh-mean-env/providers/Microsoft.Compute/disks/the-sheep_disk1_e93bd2519aac4c0cbe27c49aa928525e",
      "name": "the-sheep_disk1_e93bd2519aac4c0cbe27c49aa928525e",
      "type": "premium_lrs",
      "osType": "Linux",
      "region": "eastasia",
      "instanceId": "/subscriptions/6b6a1f27-55c1-4b1d-969b-60a3c9eebe64/resourceGroups/azure-connect-system-ssamadh-mean-env/providers/Microsoft.Compute/virtualMachines/the-sheep",
      "instance": "the-sheep",
      "state": "attached",
      "provisioningState": "succeeded",
      "creationDate": "2020-02-05T21:02:36.062Z",
      "sizeInBytes": 32213303296,
      "iops": 120,
      "throughputInMBps": 25,
      "dataDisk": false,
      "isAttachedToInstance": true
    },
  ],
  "metadata": {
    "recordCount": 2
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/disks</code>

Retrieve a list of all the disks in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`data`<br/>*array* | A list of Azure disks. _(See ["Retrieve an Azure disk"](#azure-retrieve-an-azure-disk) API for the strucutre of each disk object)_
`metadata`<br/>*object* | Consists of the meta information related to the returned disk list. The attribute `recordCount` contains the number of disks returned.

<!-------------------- RETRIEVE A DISK -------------------->

#### Retrieve an Azure disk

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/azure-conn/test_env/disks/subscriptions/60a3c9eebe64-55c1-4b1d-969b-60a3c/resourceGroups/azure-connect-system-ssamadh-mean-env/providers/Microsoft.Compute/disks/the-sheep_disk1_c0cbe27c49aa928525e93bd2519aac4"
```

> The above command returns a JSON structured like this:

```json
{
  "id": "/subscriptions/6b6a1f27-55c1-4b1d-969b-60a3c9eebe64/resourceGroups/azure-connect-system-ssamadh-mean-env/providers/Microsoft.Compute/disks/the-sheep_disk1_e93bd2519aac4c0cbe27c49aa928525e",
  "name": "the-sheep_disk1_e93bd2519aac4c0cbe27c49aa928525e",
  "type": "premium_lrs",
  "osType": "Linux",
  "region": "eastasia",
  "instanceId": "/subscriptions/6b6a1f27-55c1-4b1d-969b-60a3c9eebe64/resourceGroups/azure-connect-system-ssamadh-mean-env/providers/Microsoft.Compute/virtualMachines/the-sheep",
  "instance": "the-sheep",
  "state": "attached",
  "provisioningState": "succeeded",
  "creationDate": "2020-02-05T21:02:36.062Z",
  "sizeInBytes": 32213303296,
  "iops": 120,
  "throughputInMBps": 25,
  "dataDisk": false,
  "isAttachedToInstance": true
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/disks/:id</code>

Retrieve a specific disk in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | The id of the disk. This is a canonized id from azure which is the form of `/subscriptions/${subscriptionid}/resourceGroups/${resourcegroup}/providers/Microsoft.Compute/disks/${diskName}`
`name`<br/>*string* | The display name of the disk
`type`<br/>*string* | The managed disk type. Can be one of the following: `premium_lrs` _(Premium SSD)_, `standard_lrs` _(Standard HDD)_, `standardssd_lrs` _(Standard SSD)_ or `ultrassd_lrs` _(Ultra SSD)_
`region`<br/>*string* | The regional location in which the disk was instantiated
`instanceId`<br/>*string* | The id of the instance to which the disk is attached to. This is a canonized id from azure which is the form of `/subscriptions/${subscriptionid}/resourceGroups/${resourcegroup}/providers/Microsoft.Compute/virtualMachines/${instanceName}`
`instance`<br/>*string* | The name of the instance to which the disk is attached to _(available only if the disk is attached to an instance)_
`state`<br/>*string* | An indication of the _state_ of the disk. Can be one of the following: `Unattached`, `Attached`, `Reserved`, `ActiveSAS`, `ReadyToUpload`, `ActiveUpload`
`provisioningState`<br/>*string* | An indication of the _provisioning state_ of the disk _(SUCCESS or FAILURE)_
`creationDate`<br/>*string* | The date in which the disk was created
`sizeInBytes`<br/>*long* | The size of the disk in bytes
`iops`<br/>*long* | The number of IOPS allowed for this disk _(only settable for UltraSSD disks)_. One operation can transfer between 4k and 256k bytes.
`throughputInMBps`<br/>*long* | The bandwidth allowed for this disk; only settable for UltraSSD disks. MBps means millions of bytes per second - MB here uses the ISO notation, of powers of 10.
`dataDisk`<br/>*boolean* | Indication of whether the disk is a `DATA` disk. If `false` then it's an `OS` disk
`isAttachedToInstance`<br/>*boolean* | An indication of whether the disk has been attached to an Azure instance

<!-------------------- CREATE A DISK -------------------->

#### Create a disk

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body"
   "https://cloudmc_endpoint/api/v2/services/azure/example/disks"
```

> Request body example:

```json
{
  "name":"ad_root_smean",
  "region":"northeurope",
  "type":"ultrassd_lrs",
  "sizeGb":"200",
  "iops": "40",
  "throughputInMBps": "200"
}
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "802c5ae0-8431-47dc-9abe-7e10a9badddc",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/disks</code>

_(Use the [task API](#tasks) to get the status of the operation)_

Create a disk in an [environment](#administration-environments).

Attributes | &nbsp;
---------- | -----
`name`<br/>*string* | The name of the azure disk. Supported characters for the name are `a-z`, `A-Z`, `0-9` and `_`; The maximum name length is 80 characters
`region`<br/>*string* | The azure region in which the disk is to be created. See list of regions [here](https://azure.microsoft.com/en-ca/global-infrastructure/regions/)
`type`<br/>*string* | The managed disk type. Can be one of the following:<br>`premium_lrs`, `standard_lrs`, `standardssd_lrs`, `ultrassd_lrs`
`sizeGb`<br/>*string* | The size of the disk
`iops`<br/>*string* | The number of read/write operations per second on the disk<br>_`(Only supported for disks of type ultrassd_lrs)`_
`throughputInMBps`<br/>*string* | The throughput of the disk<br>_`(Only supported for disks of type ultrassd_lrs)`_

<!-------------------- Edit A DISK -------------------->

#### Edit a disk

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body"
   "https://cloudmc_endpoint/api/v2/services/azure-conn/test_env/disks/subscriptions/60a3c9eebe64-55c1-4b1d-969b-60a3c/resourceGroups/azure-connect-system-ssamadh-mean-env/providers/Microsoft.Compute/disks/the-sheep_disk1_c0cbe27c49aa928525e93bd2519aac4"

```

> Request body examples:

```json
{
  "type":"standardssd_lrs",
  "sizeGb":"200",
}
```

```json
{
  "iops": "40",
  "throughputInMBps": "200"
}
```

> The above commands return JSON structured like this:

```json
{
  "taskId": "802c5ae0-8431-47dc-9abe-7e10a9badddc",
  "taskStatus": "PENDING"
}
```

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/disks/:id</code>

_(Use the [task API](#tasks) to get the status of the operation)_

Edit a disk in an [environment](#administration-environments).

Optional | &nbsp;
---------- | -----
`type`<br/>*string* | The managed disk type. Can only be one of the following:<br>`premium_lrs`, `standard_lrs`, `standardssd_lrs`<br>_Updating the type of an `Ultra` disk is not allowed_<br>_Updating the type to `ultrassd_lrs` is also not allowed_
`sizeGb`<br/>*string* | The size of the disk<br>_Disk size can only be increased during an update_<br>_Updating the disk size of Ultra disks are not allowed_
`iops`<br/>*string* | The number of read/write operations per second on the disk<br>_`(Only supported for disks of type ultrassd_lrs)`_
`throughputInMBps`<br/>*string* | The throughput of the disk<br>_`(Only supported for disks of type ultrassd_lrs)`_

**Note:** _If the disk is attached to an instance, then the attached instance will be deallocated (removed from the host hypervisor) before the disk update and will be restored back to its original power state._

<!-------------------- DELETE A DISK -------------------->

#### Delete a disk

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/azure-conn/test_env/disks/subscriptions/60a3c9eebe64-55c1-4b1d-969b-60a3c/resourceGroups/azure-connect-system-ssamadh-mean-env/providers/Microsoft.Compute/disks/the-sheep_disk1_c0cbe27c49aa928525e93bd2519aac4"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/disks/:id</code>

Destroy an existing disk. A disk can only be deleted if it's not attached to an [instance](#azure-instances).

<!-------------------- DETACH A DISK -------------------->

#### Detach a disk

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/azure-conn/test_env/disks/subscriptions/60a3c9eebe64-55c1-4b1d-969b-60a3c/resourceGroups/azure-connect-system-ssamadh-mean-env/providers/Microsoft.Compute/disks/the-sheep_disk1_c0cbe27c49aa928525e93bd2519aac4?operation=detach"
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/disks/:id?operation=detach</code>

Detach an existing disk from a given [instance](#azure-instances).

<!-------------------- ATTACH A DISK -------------------->

#### Attach a disk (disk side)

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/azure-conn/test_env/disks/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Compute/disks/{diskName}?operation=attach"
```

> Request body examples:

```json
{
  "instance" : "cool-instance",
}
```

```json
{
  "instance" : "cool-instance",
  "lun" : 10
}
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "802c5ae0-8431-47dc-9abe-7e10a9badddc",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/disks/:id?operation=attach</code>

Attach a disk to an instance.

Optional | &nbsp;
---------- | -----
`lun`<br/>*Integer* | The logic unit number of a disk. Can only be between 1 and 63 inclusive. If the LUN is not specified it will default to the first available LUN for that instance.
