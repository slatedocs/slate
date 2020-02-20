### Security Rules

A security rule in Azure is a filter which controls both inbound and outbound traffic on a network security group attacted to the ressource that receives the traffic.

<!-------------------- LIST SECURITY RULES -------------------->

#### List security rules

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/azure/example/securityrules?security_group_id=:securitygroupid"

# Example:
```
```json
{
  "data": [
    {
        "id": "/subscriptions/subscription/resourceGroups/example-system-azure-example/providers/Microsoft.Network/networksecuritygroups/sample-network-security-group/defaultSecurityRules/SampleRuleInBound",
        "name": "SampleRule",
        "priority": 120,
        "direction": "Inbound",
        "access": "Allow",
        "protocol": "*",
        "sourcePortRanges": [],
        "sourceAddressPrefixes": [],
        "destinationPortRanges": [
            "8080"
        ],
        "destinationAddressPrefixes": [
            "10.0.0.0/24"
        ]
    },
    {
      "id": "/subscriptions/subscription/resourceGroups/example-system-azure-example/providers/Microsoft.Network/networksecuritygroups/sample-network-security-group/defaultSecurityRules/SampleRuleInBound2",
      "name": "SampleOutbound",
      "priority": 110,
      "direction": "Outbound",
      "access": "Deny",
      "protocol": "Udp",
      "sourcePortRanges": [
        "1024"
      ],
      "sourceAddressPrefixes": [
        "0.0.0.1",
        "10.0.0.0/32"
      ],
      "destinationPortRanges": [
        "8080"
      ],
      "destinationAddressPrefixes": [
        "10.0.0.0/16"
      ],
    }
  ],
  "metadata": {
    "recordCount": 2
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/securityrules?security_group_id=<a href="#azure-network-security-groups">:security_group_id</a></code>

Retrieve a list of all security rules in an [network security group](#azure-network-security-groups)

Query parameters | &nbsp;
---------- | -----
`direction`<br/>*string* | Filter on the list of security rules. Either `Inbound` or `Outbound`. 

Attributes | &nbsp;
---------- | -----
`id`<br/>*string* | The id associated to the network security group. This is a canonized id from azure which is the form of `/subscriptions/:subscriptionid/resourceGroups/:resourcegroup/providers/Microsoft.Network/networksecuritygroups/:networkSecurityGroupName`
`name`<br/>*string* | The name of the network security group.
`priority`<br/> *int* | Rules are processed in priority order; the lower the number, the higher the priority. Values are between 100 and 4096.
`direction`<br/> *string* | Either `Inbound` or `Outbound`.
`access`<br/> *string* | Determine if rule is allowing or blocking trafic. Either `Access` or `Deny`.
`protocol`<br/> *string* | One of `*`, `TCP`, `UDP` and `ICMP`. `*` is allowing any protocol.
`sourcePortRanges`<br/> *List* | This specifies on which ports traffic will be allowed or denied by this rule.
`sourceAddressPrefixes`<br/> *List* | List of IP address ranges or/and IP adresses.
`destinationPortRanges`<br/> *List* | This specifies on which ports traffic will be allowed or denied by this rule.
`destinationAddressPrefixes`<br/> *List* | List of IP address ranges or/and IP adresses.