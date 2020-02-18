### Disks

Deploy and manage your disks.

For information regarding azure disks, please see [azure docs](https://docs.microsoft.com/en-us/rest/api/compute/disks/get#disk).

<!-------------------- LIST DISKS -------------------->

#### List disks

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/azure-conn/test_env/disks"

# The above command returns JSON structured like this:
```

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

Retrieve a list of all the disks in a given [environment](#administration-environments)

Attributes | &nbsp;
------- | -----------
`data`<br/>*array* | A list of Azure disks. _(See ["Retrieve an Azure disk"](#azure-retrieve-an-azure-disk) API for the strucutre of each disk object)_
`metadata`<br/>*object* | Consists of the meta information related to the returned disk list. The attribute `recordCount` contains the number of disks returned. 


<!-------------------- RETRIEVE A DISK -------------------->

#### Retrieve an Azure disk

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/azure-conn/test_env/disks/subscriptions/60a3c9eebe64-55c1-4b1d-969b-60a3c/resourceGroups/azure-connect-system-ssamadh-mean-env/providers/Microsoft.Compute/disks/the-sheep_disk1_c0cbe27c49aa928525e93bd2519aac4"

# The above command returns JSON structured like this:
```
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

Retrieve a specific disk in a given [environment](#administration-environments)

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
   "https://cloudmc_endpoint/v1/services/azure/example/disks"

# Request Example:
```
```json
{
  "name":"ad_root_vme",
  "type":"premium_lrs",
  "region":"australiaeast",
	"sizeGb":"20"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/disks</code>

Create a disk in an [environment](#administration-environments)

Attributes | &nbsp;
---------- | -----
`name`<br/>*string* | The name of the azure disk. Supported characters for the name are `a-z`, `A-Z`, `0-9` and `_`; The maximum name length is 80 characters
`type`<br/>*string* | The managed disk type. Can be one of the following:<br>`premium_lrs`, `standard_lrs`, `standardssd_lrs`, `ultrassd_lrs`
`region`<br/>*string* | The azure region in which the disk is to be created. See list of regions [here](https://azure.microsoft.com/en-ca/global-infrastructure/regions/)
`sizeGb`<br/>*string* | The size of the disk
`iops`<br/>*string* | The number of read/write operations per second on the disk<br>_`(Only supported for disks of type ultrassd_lrs)`_
`throughput`<br/>*string* | The throughput of the disk<br>_`(Only supported for disks of type ultrassd_lrs)`_