### Subnets 

A subnet is a child of a virutal network. It is an subset of a network in which IP addresses point to the same group. 

<!-------------------- LIST SUBNETS -------------------->

#### List subnets

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/azure/example/subnets"

# Example:
```
```json
{
  "data": [
    {
      "addressPrefix": "10.1.2.0/24",
      "parentNetworkId": "/subscriptions/:subscription/resourceGroups/:resourceGroup/providers/Microsoft.Network/virtualNetworks/:example-vnet",
      "allocatedIpAddresses": 3,
      "availableAddresses": 248,
      "totalNumberIps": 251,
      "id": "/subscriptions/:subscription/resourceGroups/:resourceGroup/providers/Microsoft.Network/virtualNetworks/:example-vnet/subnets/example-subnet",
      "region": "eastus",
      "name": "exampple-subnet"
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
`name`<br/>*string* | The name of the subnet.
`region`<br/>*string* | The region in which the parent of the subnet is located. 
`allocatedAddresses`<br/>*int* | The number of allocated addresses in the subnet.
`availableAddresses`<br/>*int* | The number of available ip addresses in the subnet.
`totalNumberIps`<br/>*int* | The total number of ip addresses in the address space of the subnet.

Additional Attributes: Network filter included | &nbsp;
---------- | -----
`networkSecurityGroupName` <br/>*string* | The name of the network security group for the subnet, if it it exists. 
`nics`<br/> *list* | A list of nics associated to the subnet. 
`nics.name`<br/>*string* | The name of the nic.
`nics.primaryPrivateIp`<br/>*string* | The primary private ip for the nic. 
`nics.id`<br/>*string* | The id for the nic. 
`nics.subnetName`<br/>*string* | The name for the subnet to which to the nic belongs. 


<!-------------------- GET A SUBNET -------------------->

#### Retrieve a subnet

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/azure/example/subnets/subscriptions/:subscription/resourceGroups/:resourceGroup/providers/Microsoft.Network/virtualNetworks/:example-vnet/subnets/example-subnet"

# Example:
```
```json
{
  "data": [
    {
      "addressPrefix": "10.1.2.0/24",
      "parentNetworkId": "/subscriptions/:subscription/resourceGroups/:resourceGroup/providers/Microsoft.Network/virtualNetworks/:example-vnet",
      "allocatedIpAddresses": 3,
      "availableAddresses": 248,
      "totalNumberIps": 251,
      "id": "/subscriptions/:subscription/resourceGroups/:resourceGroup/providers/Microsoft.Network/virtualNetworks/:example-vnet/subnets/example-subnet",
      "region": "eastus",
      "name": "example-subnet",
      "networkSecurityGroupName": "test-rg",
      "nics": [
        {
          "name": "sample-nic",
          "subnetName": "example-subnet",
          "primaryPrivateIp": "10.1.2.4",
          "id": "/subscriptions/:subscription/resourceGroups/:resourceGroup/providers/networkInterfaces/virtualNetworks/sample-nic"
        }
      ],
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/subnets/:subnet_id</code>

Retrieve a specific subnet by id. 

Attributes | &nbsp;
---------- | -----
`id`<br/>*string* | The id associated to the subnet. This is a canonized id from azure which is the form of `/subscriptions/:subscriptionid/resourceGroups/:resourcegroup/providers/Microsoft.Network/virtualNetworks/:networkName/subnets/:subnetName`
`parentNetworkId` <br/>*string* | The id for the parent network. 
`name`<br/>*string* | The name of the subnet.
`region`<br/>*string* | The region in which the parent of the subnet is located. 
`allocatedAddresses`<br/>*int* | The number of allocated addresses in the subnet.
`availableAddresses`<br/>*int* | The number of available ip addresses in the subnet.
`totalNumberIps`<br/>*int* | The total number of ip addresses in the address space of the subnet.
`networkSecurityGroupName` <br/>*string* | The name of the network security group for the subnet, if it it exists. 
`nics`<br/> *list* | A list of nics associated to the subnet. 
`nics.name`<br/>*string* | The name of the nic.
`nics.primaryPrivateIp`<br/>*string* | The primary private ip for the nic. 
`nics.id`<br/>*string* | The id for the nic. 
`nics.subnetName`<br/>*string* | The name for the subnet to which to the nic belongs. 