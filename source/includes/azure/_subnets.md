### Subnets 

A subnet is a child of a virtual network. It is a subset of a network in which IP addresses point to the same group. 

<!-------------------- LIST SUBNETS -------------------->

#### List subnets

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/azure/example/subnets"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "addressPrefix": "10.1.2.0/24",
      "parentNetworkId": "/subscriptions/:subscription/resourceGroups/myResourceGroup/providers/Microsoft.Network/virtualNetworks/example-vnet",
      "parentNetworkName": "example-vnet",
      "allocatedIpAddresses": 3,
      "availableAddresses": 248,
      "totalNumberIps": 251,
      "id": "/subscriptions/:subscription/resourceGroups/myResourceGroup/providers/Microsoft.Network/virtualNetworks/example-vnet/subnets/example-subnet",
      "region": "eastus",
      "name": "example-subnet"
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/subnets</code>

Retrieve a list of all subnets in an [environment](#administration-environments). If the network filter is included, the response bodies will contain additional details specified below. 

Query parameters | &nbsp;
---------- | -----
`network_id`<br/>*string* | The id for the network who's subnets you're fetching. Only subnets of the passed network will be returned. 

Attributes | &nbsp;
---------- | -----
`id`<br/>*string* | The id associated to the subnet. This is a canonized id from azure which is the form of `/subscriptions/:subscriptionid/resourceGroups/:resourcegroup/providers/Microsoft.Network/virtualNetworks/:networkName/subnets/:subnetName`
`parentNetworkId` <br/>*string* | The id for the parent network. 
`parentNetworkName` <br/>*string* | The name for the parent network.
`name`<br/>*string* | The name of the subnet.
`region`<br/>*string* | The region in which the parent of the subnet is located. 
`allocatedAddresses`<br/>*int* | The number of allocated addresses in the subnet.
`availableAddresses`<br/>*int* | The number of available ip addresses in the subnet.
`totalNumberIps`<br/>*int* | The total number of ip addresses in the address space of the subnet.

Additional Attributes: Network filter included | &nbsp;
---------- | -----
`networkSecurityGroupId`<br>*string* | The id of the network security group for the subnet, if it exists. 
`networkSecurityGroupName` <br/>*string* | The name of the network security group for the subnet, if it exists. 
`nics`<br/> *list* | A list of nics associated to the subnet. 
`nics.name`<br/>*string* | The name of the nic.
`nics.primaryPrivateIp`<br/>*string* | The primary private ip for the nic. 
`nics.id`<br/>*string* | The id for the nic. 
`nics.subnetName`<br/>*string* | The name for the subnet to which to the nic belongs. 
`nics.networkName`<br/>*string* | The name for the network to which to the nic belongs. 


<!-------------------- GET A SUBNET -------------------->

#### Retrieve a subnet

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/azure/example/subnets/subscriptions/mySubscription/resourceGroups/myResourceGroup/providers/Microsoft.Network/virtualNetworks/example-vnet/subnets/example-subnet"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "addressPrefix": "10.1.2.0/24",
    "parentNetworkId": "/subscriptions/mySubscription/resourceGroups/myResourceGroup/providers/Microsoft.Network/virtualNetworks/example-vnet",
    "parentNetworkName": "example-vnet",
    "allocatedIpAddresses": 3,
    "availableAddresses": 248,
    "totalNumberIps": 251,
    "id": "/subscriptions/mySubscription/resourceGroups/myResourceGroup/providers/Microsoft.Network/virtualNetworks/example-vnet/subnets/example-subnet",
    "region": "eastus",
    "name": "example-subnet",
    "networkSecurityGroupName": "test-rg",
    "nics": [
      {
        "name": "sample-nic",
        "subnetName": "example-subnet",
        "subnetName": "example-vnet",
        "primaryPrivateIp": "10.1.2.4",
        "id": "/subscriptions/mySubscription/resourceGroups/myResourceGroup/providers/networkInterfaces/virtualNetworks/sample-nic"
      }
    ]
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/subnets/:subnet_id</code>

Retrieve a specific subnet by id. 

Attributes | &nbsp;
---------- | -----
`addressPrefix`<br/>*string* | The IPv4 CIDR representing the address range for the subnet.
`id`<br/>*string* | The id associated to the subnet. This is a canonized id from azure which is the form of `/subscriptions/:subscriptionid/resourceGroups/:resourcegroup/providers/Microsoft.Network/virtualNetworks/:networkName/subnets/:subnetName`
`parentNetworkId` <br/>*string* | The id for the parent network. 
`parentNetworkName` <br/>*string* | The name for the parent network.
`name`<br/>*string* | The name of the subnet.
`region`<br/>*string* | The region in which the parent of the subnet is located. 
`allocatedAddresses`<br/>*int* | The number of allocated addresses in the subnet.
`availableAddresses`<br/>*int* | The number of available ip addresses in the subnet.
`totalNumberIps`<br/>*int* | The total number of ip addresses in the address space of the subnet.
`networkSecurityGroupId`<br>*string* | The id of the network security group for the subnet, if it exists.
`networkSecurityGroupName` <br/>*string* | The name of the network security group for the subnet, if it it exists. 
`nics`<br/> *list* | A list of nics associated to the subnet. 
`nics.name`<br/>*string* | The name of the nic.
`nics.primaryPrivateIp`<br/>*string* | The primary private ip for the nic. 
`nics.id`<br/>*string* | The id for the nic. 
`nics.subnetName`<br/>*string* | The name for the subnet to which to the nic belongs. 
`nics.networkName`<br/>*string* | The name for the network to which to the nic belongs. 

<!-------------------- CREATE A SUBNET -------------------->

#### Create a subnet

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/azure/example/subnets"
```
> Request body example:

```json
{
  "name": "default",
  "addressPrefix": "10.0.1.0/24",
  "parentNetworkId": "/subscriptions/mySubscription/resourceGroups/myResourceGroup/providers/Microsoft.Network/virtualNetworks/example-vnet"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/subnets</code>

Create a new subnet.

Required | &nbsp;
------- | -----------
`name` <br/>*string* | The name of the subnet. The name cannot exceed 80 characters.
`addressPrefix` <br/>*string* | The portion of the parent network's address space (IPV4 CIDR format) allocated to the subnet. The range cannot overlap with other subnets. The smallest range you can specify is /29.
`parentNetworkId` <br/>*string* | The subnet's parent network id.

Optional | &nbsp;
------- | -----------
`networkSecurityGroupId`<br>*string* | The id for the network security group you want to associate the subnet to, can be `NONE`.

<!-------------------- UPDATE A SUBNET -------------------->

#### Update a Subnet

```shell
curl -X PUT \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/azure/example/subnets/subscriptions/mySubscription/resourceGroups/myResourceGroup/providers/Microsoft.Network/virtualNetworks/example-vnet/subnets/example-subnet"
```
> Request body example:

```json
{
  "addressPrefix":"This is my updated template description"
}
```

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/subnets/:subnet_id</code>

Update a subnet. 

Optional | &nbsp;
-------- | ------
`addressPrefix`<br/>*string* | The portion of the parent network's address space (IPV4 CIDR format) allocated to the subnet. The range cannot overlap with other subnets. The smallest range you can specify is /29. Can only be updated if it is contained within the range of the parent network and if no resources are attached to the subnet.
`networkSecurityGroupId`<br>*string* | The id for the network security group you want to associate the subnet to, `NONE` if you want to detach the current network security group.

<!-------------------- DELETE A SUBNET -------------------->

#### Delete a subnet

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/azure/example/subnets/subscriptions/mySubscription/resourceGroups/myResourceGroup/providers/Microsoft.Network/virtualNetworks/example-vnet/subnets/example-subnet"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/subnets/:subnet_id</code>

Deletes a specific subnet by id. 

Attributes | &nbsp;
---------- | -----
`id`<br/>*string* | The id associated to the subnet. This is a canonized id from azure which is the form of `/subscriptions/:subscriptionid/resourceGroups/:resourcegroup/providers/Microsoft.Network/virtualNetworks/:networkName/subnets/:subnetName`