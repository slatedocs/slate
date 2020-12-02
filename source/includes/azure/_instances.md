### Instances

Deploy and manage your instances.

<!-------------------- LIST INSTANCES -------------------->

#### List instances

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/azure/example/instances"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "/subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Compute/virtualMachines/example-small-server",
      "name": "example-small-server",
      "machineType": "Standard_B1ls",
      "numberOfCores": 2,
      "memoryInGB": 1.75,
      "imagePublisher": "LinuxPublisher",
      "imageOffer": "CoreOS",
      "imageSku": "Alpha",
      "imageVersion": "1000.0.0",
      "osType": "Linux",
      "displayImage": "CoreOS - Alpha",
      "region": "canadacentral",
      "privateIp": "10.0.0.4",
      "macAddress": "00-0D-3A-84-0B-EF",
      "subnetName": "default",
      "networkName": "vn_root_qyg",
      "supportsPremiumIO": true,
      "supportsUltraIO": false,
      "attachableDiskSlots": 2,
      "usedLuns": [1],
      "powerState": "PowerState/running",
      "displayPowerState": "running",
      "networkInterfaces": [
        {
          "id": "/subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Network/networkInterfaces/nicexample",
          "name": "nicexample",
          "primary": true
        }
      ],
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
`id` <br/>*string* | The id of the instance. This is a canonized id from azure which is the form of `/subscriptions/:subscriptionid/resourceGroups/:resourcegroup/providers/`Microsoft.Compute/virtualMachines/:instanceName.
`name` <br/>*string* | The name of the instance.
`machineType`<br/>*string* | The type of machine assigned for this instance.
`numberOfCores`<br/>*int* | The number of cores provisioned for this instance. This is determined by the machine type.
`memoryInGB`<br/>*int* | The number of memory in GB provisioned for this instance. This is determined by the machine type.
`imagePublisher`<br/>*string* | The publisher of the instance used to create the instance.
`imageOffer`<br/>*string* | The image offer that was used to create the instance.
`imageSku`<br/>*string* | The image SKU that was used to create the instance.
`imageVersion`<br/>*string* | The image version that was used to create the instance.
`displayImage`<br/>*string* | Displayable value of the image information.
`osType`<br/>*string* | The OS type of the instance. This can be either Windows or Linux.
`region`<br/>*string* | The region in which the instance is located.
`privateIp`<br/>*string* | The private ip address assigned to the instance.
`internalFqdn`<br/>*string* | The internal FQDN assigned to the instance.
`macAddress`<br/>*string* | The MAC address assigned to the instance.
`subnetName`<br/>*string* | The name of the subnet that the instance is part of.
`networkName`<br/>*string* | The name of the network that the instance is part of.
`supportsPremiumIO`<br/>*boolean* | If the instance supports Premium disks. This is fixed by the machine type.
`supportsUltraIO`<br/>*boolean* | If the instance supports Ultra disks. This is fixed by the machine type.
`attachableDiskSlots`<br/>*integer* | The number of managed disks that can be attached to the instance. This is fixed by the machine type.
`usedLuns`<br/>*array* | An array of all the LUNs associated with the managed disks attached to this instance.
`publicIp`<br/>*string* | The public ip address assigned to the instance.
`powerState`<br/>*string* | The status of the instance. One of the following values:    PowerState/running, PowerState/deallocating, PowerState/deallocated, PowerState/starting, PowerState/stopped, PowerState/stopping and PowerState/unknown.
`displayPowerState`<br/>*string* | The status of the instance. One of the following values: running, deallocating, deallocated, starting, stopped, stopping and unknown.
`networkInterfaces`<br/>*list* | A list of network interfaces of the instance. Contains fields: `id`, `name`, `primary`.

<!-------------------- RETRIEVE AN INSTANCE -------------------->

#### Retrieve an instance

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/azure/example/instances/subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Compute/virtualMachines/example-small-server"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "/subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Compute/virtualMachines/example-small-server",
    "name": "example-small-server",
    "machineType": "Standard_B1s",
    "numberOfCores": 2,
    "memoryInGB": 1.75,
    "imagePublisher": "LinuxPublisher",
    "imageOffer": "CoreOS",
    "imageSku": "Alpha",
    "imageVersion": "1000.0.0",
    "osType": "Linux",
    "displayImage": "CoreOS - Alpha",
    "region": "canadacentral",
    "privateIp": "10.0.0.4",
    "macAddress": "00-0D-3A-0B-F2-96",
    "subnetName": "default",
    "networkName": "vn_root_qyg",
    "supportsPremiumIO": true,
    "supportsUltraIO": false,
    "attachableDiskSlots": 2,
    "usedLuns": [],
    "powerState": "PowerState/running",
    "displayPowerState": "running",
    "networkInterfaces": [
      {
        "id": "/subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Network/networkInterfaces/nicexample",
        "name": "nicexample",
        "primary": true
      }
    ],
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id</code>

Retrieve an instance in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id` <br/>*string* | The id of the instance. This is a canonized id from azure which is the form of `/subscriptions/${subscriptionid}/resourceGroups/${resourcegroup}/providers/Microsoft.Compute/virtualMachines/${instanceName}`.
`name` <br/>*string* | The name of the instance.
`machineType`<br/>*string* | The type of machine assigned for this instance.
`numberOfCores`<br/>*int* | The number of cores provisioned for this instance. This is determined by the machine type.
`memoryInGB`<br/>*int* | The number of memory in GB provisioned for this instance. This is determined by the machine type.
`imagePublisher`<br/>*string* | The publisher of the instance used to create the instance.
`imageOffer`<br/>*string* | The image offer that was used to create the instance.
`imageSku`<br/>*string* | The image SKU that was used to create the instance.
`imageVersion`<br/>*string* | The image version that was used to create the instance.
`osType`<br/>*string* | The OS type of the instance. This can be either Windows or Linux.
`displayImage`<br/>*string* | Displayable value of the image information.
`region`<br/>*string* | The region in which the instance is located.
`privateIp`<br/>*string* | The private ip address assigned to the instance.
`internalFqdn`<br/>*string* | The internal FQDN assigned to the instance.
`macAddress`<br/>*string* | The MAC address assigned to the instance.
`subnetName`<br/>*string* | The name of the subnet that the instance is part of.
`networkName`<br/>*string* | The name of the network that the instance is part of.
`supportsPremiumIO`<br/>*boolean* | If the instance supports Premium disks. This is fixed by the machine type.
`supportsUltraIO`<br/>*boolean* | If the instance supports Ultra disks. This is fixed by the machine type.
`attachableDiskSlots`<br/>*integer* | The number of managed disks that can be attached to the instance. This is fixed by the machine type.
`usedLuns`<br/>*array* | An array of all the LUNs associated with the managed disks attached to this instance.
`publicIp`<br/>*string* | The public ip address assigned to the instance.
`powerState`<br/>*string* | The status of the instance. One of the following values:    PowerState/running, PowerState/deallocating, PowerState/deallocated, PowerState/starting, PowerState/stopped, PowerState/stopping and PowerState/unknown.
`displayPowerState`<br/>*string* | The status of the instance. One of the following values: running, deallocating, deallocated, starting, stopped, stopping and unknown.
`networkInterfaces`<br/>*list* | A list of network interfaces of the instance. Contains fields: `id`, `name`, `primary`.

<!-------------------- CREATE AN INSTANCE -------------------->

#### Create an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/azure/example/instances"
```

> Request body examples:

```js
// Create an instance using ssh key authentication
{
  "name": "new-server",
  "machineType": "Standard_B1ls",
  "imagePublisher": "CoreOS",
  "imageOffer": "CoreOS",
  "imageSku": "Stable",
  "imageVersion": "1010.5.0",
  "region": "canadacentral",
  "subnet": "/subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Network/virtualNetworks/vn_example_lud/subnets/default",
  "username": "johndoe",
  "sshkey": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCguvgDRuUF/wijOJCNmYlQHujCmUHl/i0Ubos4nHy5uCBdn1LGF+PG3TpJqO1LUWqpHaPl4yN7bpsdXyq6a9nxe0C1bQ4FK6P5qm0X320uvqv34jwTPsIbnhw9I317df+xJyXXsL/P5vS4ULPMC5UZjWm4BYe7did4zmXXhA/zmLY6cUg19sZp5r5SUQcf5xHAqO3cQVZwzBhBMwroflZZ59zNpxy+xXPBqC3IdusF2yTDW7bwCQHESUOsd9XhwrzCB+1wETKjLpk0wkWj8G2j1pkKGRpv60QcG85lbZvQAg54v3HYD7fVJCaz9gJJoiyRBnqQ6XVxam5bZgiMKa0J johndoe@machine.local"
}

// Create an instance using password authentication
{
  "name": "new-server",
  "machineType": "Standard_B1ls",
  "imagePublisher": "CoreOS",
  "imageOffer": "CoreOS",
  "imageSku": "Stable",
  "imageVersion": "1010.5.0",
  "region": "canadacentral",
  "subnet": "/subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Network/virtualNetworks/vn_example_lud/subnets/default",
  "username": "johndoe",
  "password": "SomePassw0rdVal!d"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances</code>

Create a new instance.

Required | &nbsp;
------- | -----------
`name` <br/>*string* | The name of the instance. The name cannot exceed 64 characters.
`machineType`<br/>*string* | The type of machine assigned for this instance.
`imagePublisher`<br/>*string* | The image publisher from which the image is selected.
`imageOffer`<br/>*string* | The image offer that was used to create the instance.
`imageSku`<br/>*string* | The image SKU that was used to create the instance.
`imageVersion`<br/>*string* | The image version that was used to create the instance.
`region`<br/>*string* | The region in which the instance is located.
`subnet`<br/>*string* | The subnet id that the instance will be part of.
`username`<br/>*string* | The administrator username which will be created on the instance. It cannot be a reserve user such as admin, root or administrator and must not be more than 20 characters.

Optional | &nbsp;
------- | -----------
`password`<br/>*string* | The password of the administrator account. It must be between between 12 and 72 characters and must be a combination of 3 of the following patterns : Special characters, Uppercase, Lowercase and Numbers. The password is mandatory if the sshkey is not provided.
`sshkey`<br/>*string* | The ssh key public portion that will be assigned to the user on the machine. This cannot be used for a Windows based OS.
`publicIpAddressId`<br/>*string* | The fully qualified id of the public IP address to associate to the instance.

<!-------------------- DELETE AN INSTANCE -------------------->

#### Delete an instance

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/azure/example/instances/subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Compute/virtualMachines/example-small-server"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id</code>

Delete an existing instance.

<aside class="notice">
This will not delete the disks (OS/Data) attached to the instance but will leave them in detached state. To delete the OS disk attached to the instance `deleteOsDisk` query parameter can be used.
</aside>

Query Parameter | &nbsp;
---------- | -----
`deleteOsDisk`<br/>*boolean* | Will delete the OS disk attached to this instance. Default value is `false`.

<!-------------------- CHANGE MACHINE TYPE -------------------->

#### Change machine type

A machine type determines the number of vCPUs and the size of the memory allocated to the [instances](#azure-instances).

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/azure/example/instances/subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Compute/virtualMachines/example-small-server?operation=resize"
```

> Request body example:

```json
{
  "machineType": "Standard_B1ls"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=resize</code>

Update the machine type for the existing instance.

<aside class="notice">
Each machine type has a predefined number of vCPUs, memory, and disk limitation and capacity.
See the links for detailed information on sizes of <a href="https://docs.microsoft.com/en-us/azure/virtual-machines/windows/sizes">Windows</a>
 and <a href="https://docs.microsoft.com/en-us/azure/virtual-machines/linux/sizes">Linux</a> virtual machines
</aside>
<aside class="notice">
The subscription is limiting the number VMs and different machine sizes you can use. This limitation is setup per region per subscription. Refer to the quota settings in your subscription for more details.
</aside>

<aside class="warning">
  Changing the number of vCPUs and memory of a running instance will reboot of that instance.
</aside>

Required | &nbsp;
------ | -----------
`machineType`<br/>*string* | The new machine type to assign to the instance.

<!-------------------- RESET PASSWORD -------------------->

#### Reset password

Reset the administrator password on Windows or Linux [instances](#azure-instances).

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/azure/example/instances/subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Compute/virtualMachines/example-small-server?operation=reset_password"
```

> Request body example:

```json
{
  "password": "SomePassw0rdVal!d"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=reset_password</code>

For Linux instances, reset the administrator account.
For Windows instances, reset the administrator account and reset the Remote Desktop service configuration.

Optional | &nbsp;
------ | -----------
`password`<br/>*string* | The password of the administator account. It must be between between 12 and 72 characters and must be a combination of 3 of the following patterns : Special characters, Uppercase, Lowercase and Numbers. If not provided, a new password is generated.

<!-------------------- START AN INSTANCE -------------------->

#### Start an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/azure/example/instances/subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Compute/virtualMachines/example-small-server?operation=start"

```

 <code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=start</code>

Start an existing instance. The instance must be in the power state *PowerState/deallocated* or *PowerState/stopped* for this operation to work.

<!-------------------- STOP AN INSTANCE -------------------->

#### Stop an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/azure/example/instances/subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Compute/virtualMachines/example-small-server?operation=stop"
```

 <code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=stop</code>

 Stop an existing instance. The instance must be in either the power state *PowerState/running* or *PowerState/starting* status for this operation to work.

<!-------------------- ATTACH A DISK -------------------->

#### Attach a disk (instance side)

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
 "https://cloudmc_endpoint/api/v1/services/azure-conn/test_env/instances/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Compute/instances/{instanceName}?operation=attach_disk"
```

> Request body example:

```json
{
  "diskToAttach" : "disktest1",
  "diskLun": 10
}
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "802c5ae0-8431-47dc-9abe-7e10a9badddc",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=attach_disk</code>

Required | &nbsp;
------ | -----------
`diskToAttach` <br/>*String* | The Id of the disk that you want to be attached to the instance.
`diskLun`<br/>*Integer* | The logic unit number of a disk. Can only be between 1 and 63 inclusive.
