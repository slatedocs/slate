### Network Security Groups

A network security group is a group of security rules that allow or deny inbound network traffic to, or outbound network traffic from, several types of Azure resources, including Azure virtual networks.

<!-------------------- LIST NETWORK SECURITY GROUPS -------------------->

#### List network security groups

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/azure/example/networksecuritygroups"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "/subscriptions/subscription/resourceGroups/example-system-azure-example/providers/Microsoft.Network/networksecuritygroups/sample-network-security-group",
      "name": "sample-network-security-group",
      "region": "canadacentral",
      "provisioningState": "Succeeded",
       "defaultSecurityRules": [
        {
          "name": "SampleRule",
          "id": "/subscriptions/subscription/resourceGroups/example-system-azure-example/providers/Microsoft.Network/networksecuritygroups/sample-network-security-group/defaultSecurityRules/SampleRuleInBound",
          "direction": "Inbound"
        }],
      "customSecurityRules": [],
      "numberInbound": 3,
      "numberOutbound": 3,
      "numberAssociatedSubnets": 0,
      "numberAssociatedNetworkInterfaces": 0
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networksecuritygroups</code>

Retrieve a list of all network security groups in an [environment](#administration-environments).

Attributes | &nbsp;
---------- | -----
`id`<br/>*string* | The id associated to the network security group. This is a canonized id from azure which is the form of `/subscriptions/:subscriptionid/resourceGroups/:resourcegroup/providers/Microsoft.Network/networksecuritygroups/:networkSecurityGroupName`
`name`<br/>*string* | The name of the network security group.
`region`<br/>*string* | The region in which the network security group is located
`provisioningState`<br/>*string* | The provisioning state of the network security group. Possible values are : Succeeded, Updating, Deleting and Failed
`defaultSecurityRules`<br/>*List* | The default security rules of network security group
`customSecurityRules`<br/>*List* | A collection of security rules of the network security group
`numberInbound`<br/>*int* | The number of security rules (default and custom) which are inbound
`numberOutbound`<br/>*int* | The number of security rules (default and custom) which are outbound
`numberAssociatedSubnets`<br/>*int* | The number of subnets associated with this network security group
`numberAssociatedNetworkInterfaces`<br/>*int* | The number of network interfaces associated with this network security group

<!-------------------- CREATE A NETWORK SECURITY GROUP -------------------->

#### Create a network security group

```shell
curl -X POST \
  'http://cloudmc_endpoint/v1/services/azure/my-azure/networkSecurityGroups' \
  -H 'mc-api-key: your_api_key' \
  -d '{
	"name": "network-security-group", 
	"region": "eastus"
}'
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networkSecurityGroups</code>

Create a new network security group.

Required | &nbsp;
------- | -----------
`name` <br/>*string* | The name of the network security group. The name cannot exceed 64 characters
`region`<br/>*string* | The region in which the network security group is located

#### Delete a network security group

```shell 
curl -X DELETE \
  'http://cloudmc_endpoint/v1/services/azure/my-azure/networkSecurityGroups/subscriptions/6b6a1f27-55c1-4b1d-969b-60a3c9eebe64/resourceGroups/azure-system-co-cloudmc-eastus/providers/Microsoft.Network/networkSecurityGroups/test' \
  -H 'mc-api-key: your_api_key'
  ```

  <code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networkSecurityGroups/:id</code>

  Delete an existing network security group.