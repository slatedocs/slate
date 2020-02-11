### Network Security Groups

A network security group is a group of security rules that allow or deny inbound network traffic to, or outbound network traffic from, several types of Azure resources, including Azure virtual networks.

<!-------------------- LIST VIRTUAL NETWORKS -------------------->

#### List network security groups

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/azure/example/networkSecurityGroups"

# Example:
```
```json
{
  "data": [
    {
      "id": "/subscriptions/subscription/resourceGroups/example-system-azure-example/providers/Microsoft.Network/networkSecurityGroups/sample-network-security-group",
      "name": "sample-network-security-group",
      "region": "canadacentral",
      "provisioningState": "Succeeded",
       "defaultSecurityRules": [
        {
          "name": "SampleRule",
          "id": "/subscriptions/subscription/resourceGroups/example-system-azure-example/providers/Microsoft.Network/networkSecurityGroups/sample-network-security-group/defaultSecurityRules/SampleRuleInBound",
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

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networkSecurityGroups</code>

Retrieve a list of all network security groups in an [environment](#administration-environments)

Attributes | &nbsp;
---------- | -----
`id`<br/>*string* | The id associated to the network security group. This is a canonized id from azure which is the form of `/subscriptions/:subscriptionid/resourceGroups/:resourcegroup/providers/Microsoft.Network/networkSecurityGroups/:networkSecurityGroupName`
`name`<br/>*string* | The name of the network security group.
`region`<br/>*string* | The region in which the network security group is located
`provisioningState`<br/>*string* | The provisioning state of the network security group. Possible values are : Succeeded, Updating, Deleting and Failed
`defaultSecurityRules`<br/>*List* | The default security rules of network security group
`customSecurityRules`<br/>*List* | A collection of security rules of the network security group
`numberInbound`<br/>*int* | The number of security rules (default and custom) which are inbound
`numberOutbound`<br/>*int* | The number of security rules (default and custom) which are outbound
`numberAssociatedSubnets`<br/>*int* | The number of subnets associated with this network security group
`numberAssociatedNetworkInterfaces`<br/>*int* | The number of network interfaces associated with this network security group
