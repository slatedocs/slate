### Virtual Networks

A virtual network is an isolated network where you can place groups of resources, such as [instances](#azure-instances).

<!-------------------- LIST VIRTUAL NETWORKS -------------------->

#### List virtual networks

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/azure/example/networks"

# Example:
```
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

Retrieve a list of all virtual networks in an [environment](#administration-environments)

Attributes | &nbsp;
---------- | -----
`id`<br/>*string* | The id associated to the virtual network.  This is a canonized id from azure which is the form of /subscriptions/:subscriptionid/resourceGroups/:resourcegroup/providers/Microsoft.Network/virtualNetworks/:networkName
`name`<br/>*string* | The name of the virtual network
`region`<br/>*string* | The region in which the virtual network is located
`provisioningState`<br/>*string* | The provisioning state of the virtual network. Possible values are : Succeeded, Updating, Deleting and Failed
`addressSpace`<br/>*list* | List of address space that are covered by this virtual network
