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
      "id": "/subscriptions/60a3c9ee-55c1-4b1d-969b-6b6a1f27be64/resourceGroups/azure-conn-system-test_env/providers/Microsoft.Compute/disks/the-goat-disk",
      "name": "the-goat-disk",
      "type": "standard_lrs",
      "osOrDataDisk": "Data",
      "displaySize": {
        "value": "8",
        "unitKey": "units.filesizes.GB"
      },
      "region": "South East Asia",
      "isAttachedToInstance": false,
      "state": "unattached",
      "provisioningState": "succeeded"
    },
    {
      "id": "/subscriptions/60a3c9ee-55c1-4b1d-969b-6b6a1f27be64/resourceGroups/azure-conn-system-test_env/providers/Microsoft.Compute/disks/the-sheep-disk",
      "name": "the-sheep-disk",
      "type": "premium_lrs",
      "osOrDataDisk": "Data",
      "displaySize": {
        "value": "4",
        "unitKey": "units.filesizes.GB"
      },
      "region": "East Asia",
      "isAttachedToInstance": true,
      "instanceId": "/subscriptions/6b6a1f27-55c1-4b1d-969b-60a3c9eebe64/resourceGroups/azure-connect-system-test_env/providers/Microsoft.Compute/virtualMachines/the-sheep",
      "instance": "the-sheep",
      "state": "attached",
      "provisioningState": "succeeded"
    }
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
`id`<br/>*string* | The id of the disk. This is a canonized id from azure which is the form of `/subscriptions/${subscriptionid}/resourceGroups/${resourcegroup}/providers/Microsoft.Compute/disks/${diskName}`
`name`<br/>*string* | The display name of the disk
`type`<br/>*string* | The managed disk type. Can be one of the following: `premium_lrs` _(Premium SSD)_, `standard_lrs` _(Standard HDD)_, `standardssd_lrs` _(Standard SSD)_ or `ultrassd_lrs` _(Ultra SSD)_
`osOrDataDisk`<br/>*string* | The type of the managed disk, whether it's a `OS` or a `Data` disk
`displaySize`<br/>*object* | The size value of disk with it's unit _(ex: 32 Gb)_
`region`<br/>*string* | The regional location in which the disk was instantiated
`isAttachedToInstance`<br/>*boolean* | An indication of whether the disk has been attached to an Azure instance
`instanceId`<br/>*string* | The id of the instance to which the disk is attached to. This is a canonized id from azure which is the form of `/subscriptions/${subscriptionid}/resourceGroups/${resourcegroup}/providers/Microsoft.Compute/virtualMachines/${instanceName}` 
`instance`<br/>*string* | The name of the instance to which the disk is attahced to _(available only if the disk is attached to an instance)_
`state`<br/>*string* | An indication of the _state_ of the disk. Can be one of the following: `Unattached`, `Attached`, `Reserved`, `ActiveSAS`, `ReadyToUpload`, `ActiveUpload`
`provisioningState`<br/>*string* | An indication of the _provisioning state_ of the disk _(SUCCESS or FAILURE)_
