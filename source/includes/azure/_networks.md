### Virtual Networks

A virtual network is an isolated network where you can place groups of resources, such as [instances](#azure-instances).

<!-------------------- LIST VIRTUAL NETWORKS -------------------->

#### List virtual networks

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/azure/example/networks"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "/subscriptions/subscription/resourceGroups/example-system-azure-example/providers/Microsoft.Network/virtualNetworks/sample-network",
      "name": "sample-network",
      "region": "canadacentral",
      "provisioningState": "Succeeded",
      "addressSpace": [
        "10.2.0.0/16"
      ]
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networks</code>

Retrieve a list of all virtual networks in an [environment](#administration-environments).

Optional query parameters | &nbsp;
---------- | -----
`subnetList`<br/>*boolean* | If set to true, it will also include the subnet information in the list. 


Attributes | &nbsp;
---------- | -----
`id`<br/>*string* | The id associated to the virtual network. This is a canonized id from azure which is the form of `/subscriptions/:subscriptionid/resourceGroups/:resourcegroup/providers/Microsoft.Network/virtualNetworks/:networkName`
`name`<br/>*string* | The name of the virtual network
`region`<br/>*string* | The region in which the virtual network is located
`provisioningState`<br/>*string* | The provisioning state of the virtual network. Possible values are : Succeeded, Updating, Deleting and Failed
`addressSpace`<br/>*list* | List of address space that are covered by this virtual network


<!-------------------- CREATE VIRTUAL NETWORKS -------------------->

#### Create virtual networks

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body"
   "https://cloudmc_endpoint/api/v1/services/azure/example/networks"
```
> Request body example:

```json
{
	"name": "simpleNetwork",
	"region" : "canadaeast",
	"addressSpace": "10.0.0.0/16",
	"subnetName": "default",
	"subnetAddressPrefix": "10.0.0.0/16"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networks</code>

Create a virtual network in an [environment](#administration-environments).

Attributes | &nbsp;
---------- | -----
`name`<br/>*string* | The name of the virtual network
`region`<br/>*string* | The region in which the virtual network is located
`addressSpace`<br/>*string* | The first address range (IPV4 CIDR format) that will be covered by this virtual network
`subnetName`<br/>*string* | The first subnet name within this virtual network
`subnetAddressPrefix`<br/>*string* | The first subnet address range (IPV4 CIDR format) within this virtual network
`networkSecurityGroupId`<br>*string* | The id of the network security group for the subnet, can also enter NONE or omit the field.