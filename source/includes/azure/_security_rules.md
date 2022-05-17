### Security Rules

A security rule in Azure is a filter which controls both inbound and outbound traffic on a network security group attacted to the ressource that receives the traffic.

<!-------------------- LIST SECURITY RULES -------------------->

#### List security rules

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/azure/example/securityrules"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "/subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Network/networksecuritygroups/sample-network-security-group/defaultSecurityRules/SampleRuleInBound",
      "name": "SampleRule",
      "direction": "Inbound",
      "access": "Deny",
      "priority": 110,
      "protocol": "Udp",
      "sourcePortRanges": [
        "1024"
      ],
      "sources": [
        "0.0.0.1",
        "10.0.0.0/32"
      ],
      "destinationPortRanges": [
        "8080"
      ],
      "destinations": [
        "10.0.0.0/16"
      ],
      "securityGroupId": "/subscriptions/:subscription/resourceGroups/:resourceGroup/providers/Microsoft.Network/networkSecurityGroups/sample-network-security-group"
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/securityrules</code>

Retrieve a list of all security rules in an [environment](#administration-environments).

Query parameters | &nbsp;
---------- | -----
`security_group_id`<br/>*string* | The id of the [network security group](#azure-network-security-groups) in which we want to fetch the list of security rules.
`direction`<br/>*string* | Filter on the list of security rules. Either `Inbound` or `Outbound`. No value will passed will return a list with both included.

Attributes | &nbsp;
---------- | -----
`id`<br/>*string* | The id associated to the security rule. This is a canonized id from azure which is the form of `/subscriptions/:subscriptionid/resourceGroups/:resourcegroup/providers/Microsoft.Network/networksecuritygroups/:networkSecurityGroupName/defaultSecurityRules/:securityRuleName` if it is a default rule or `/subscriptions/:subscriptionid/resourceGroups/:resourcegroup/providers/Microsoft.Network/networksecuritygroups/:networkSecurityGroupName/securityRule/:securityRuleName` if it is a custom rule.
`name`<br/>*string* | The name of the security rule.
`priority`<br/> *int* | Rules are processed in priority order; the lower the number, the higher the priority. Values are between 100 and 4096.
`direction`<br/> *string* | Either `Inbound` or `Outbound`.
`access`<br/> *string* | Determine if rule is allowing or blocking trafic. Either `Access` or `Deny`.
`protocol`<br/> *string* | One of `*`, `TCP`, `UDP` and `ICMP`. `*` is allowing any protocol.
`sourcePortRanges`<br/> *List* | This specifies on which ports traffic will be allowed or denied by this rule. If the list is empty then all values are included.
`sources`<br/> *List* | List of IP address ranges or/and IP adresses. If the list is empty then all values are included.
`destinationPortRanges`<br/> *List* | This specifies on which ports traffic will be allowed or denied by this rule. If the list is empty then all values are included.
`destinations`<br/> *List* | List of IP address ranges or/and IP adresses. If the list is empty then all values are included.
`securityGroupId`<br/> *String* | The id of the network security group to which the rule belongs.

<!-------------------- GET A SECURITY RULE -------------------->

#### Retrieve a security rule

```shell
curl -X GET \
  -H 'mc-api-key: your_api_key' \
  "https://cloudmc_endpoint/api/v1/services/azure/example/securityrules/subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Network/networkSecurityGroups/mySecurityGroup/securityRules/mySeccurityRule"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "/subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Network/networkSecurityGroups/mySecurityGroup/defaultSecurityRules/SampleRuleInBound",
    "name": "SampleRuleInBound",
    "direction": "Inbound",
    "access": "Allow",
    "priority": 65001,
    "protocol": "*",
    "sourcePortRanges": [],
    "destinationPortRanges": [],
    "destinationAddressPrefixes": [],
    "sourceAddressPrefixes": [
      "AzureLoadBalancer"
    ],
    "securityGroupId": "/subscriptions/:subscription/resourceGroups/:resourceGroup/providers/Microsoft.Network/networkSecurityGroups/sample-network-security-group"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/securityrules/:id</code>

Retrieve a specific security rule by rule id.

Attributes | &nbsp;
---------- | -----
`id`<br/>*string* | The id associated to the security rule. This is a canonized id from azure which is the form of `/subscriptions/:subscriptionid/resourceGroups/:resourcegroup/providers/Microsoft.Network/networksecuritygroups/:networkSecurityGroupName/defaultSecurityRules/:securityRuleName` if the rule is a default security rule or `/subscriptions/:subscriptionid/resourceGroups/:resourcegroup/providers/Microsoft.Network/networksecuritygroups/:networkSecurityGroupName/securityRules/:securityRuleName` if the rule is a custom rule.
`name`<br/>*string* | The name of the security rule.
`priority`<br/> *int* | The priority of the security rule.
`direction`<br/> *string* | Either `Inbound` or `Outbound`.
`access`<br/> *string* | Determine if rule is allowing or blocking trafic. Either `Access` or `Deny`.
`protocol`<br/> *string* | One of `*`, `TCP`, `UDP` and `ICMP`. `*` is allowing any protocol.
`sourcePortRanges`<br/> *List* | This specifies on which ports traffic will be allowed or denied by this rule. If the list is empty then all values are included.
`sources`<br/> *List* | List of IP address ranges or/and IP adresses. If the list is empty then all values are included.
`destinationPortRanges`<br/> *List* | This specifies on which ports traffic will be allowed or denied by this rule. If the list is empty then all values are included.
`destinations`<br/> *List* | List of IP address ranges or/and IP adresses. If the list is empty then all values are included.
`securityGroupId`<br/> *String* | The id of the network security group to which the rule belongs.

<!-------------------- CREATE A SECURITY RULE -------------------->

#### Create a security rule

```shell
curl -X POST \
  -H "MC-Api-Key: your_api_key" \
  -d "request_body"
    "https://cloudmc_endpoint/api/v1/services/azure/example/securityrules"
```
> Request body example:

```json
{
  "securityGroupId": "/subscriptions/subscription/resourceGroups/example-system-azure-example/providers/Microsoft.Network/networksecuritygroups/sample-network-security-group",
  "name": "SampleRule",
  "priority": 110,
  "direction": "Inbound",
  "access": "Deny",
  "protocol": "Udp",
  "sourcePortRanges": [
    "1024"
  ],
  "sources": [
    "0.0.0.1",
    "10.0.0.0/32"
  ],
  "destinationPortRanges": [
    "8080"
  ],
  "destinations": [
    "10.0.0.0/16"
  ]
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/securityrules</code>

Create a new network security rule in an existing security group.

Required | &nbsp;
------- | -----------
`securityGroupId`<br/>*string* | The id of the [network security group](#azure-network-security-groups) in which we want to create the security rule.
`name`<br/>*string* | The name of the security rule.
`priority`<br/> *int* | Rules are processed in priority order; the lower the number, the higher the priority. Values are between 100 and 4096.
`direction`<br/> *string* | Either `Inbound` or `Outbound`.
`access`<br/> *string* | Determine if rule is allowing or blocking trafic. Either `Access` or `Deny`.
`protocol`<br/> *string* | One of `*`, `TCP`, `UDP` and `ICMP`. `*` is allowing any protocol.

Optional | &nbsp;
------- | -----------
`sourcePortRanges`<br/> *List* | This specifies on which ports traffic will be allowed or denied by this rule. If the list is empty then all values are included.
`sources`<br/> *List* | List of IP address ranges or/and IP adresses. If the list is empty then all values are included.
`destinationPortRanges`<br/> *List* | This specifies on which ports traffic will be allowed or denied by this rule. If the list is empty then all values are included.
`destinations`<br/> *List* | List of IP address ranges or/and IP adresses. If the list is empty then all values are included.

<!-------------------- DELETE A SECURITY RULE -------------------->

#### Delete a security rule

```shell
curl -X DELETE \
  -H 'mc-api-key: your_api_key' \
  "https://cloudmc_endpoint/api/v1/services/azure/example/securityrules/subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Network/sample-network-security-group/securityRules/securityRule1"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/securityrules/:id</code>

Delete an existing security rule.

<!-------------------- EDIT A SECURITY RULE -------------------->

#### Edit a security rule

```shell
curl -X POST \
  -H 'mc-api-key: your_api_key' \
  -d "request_body" \
  "https://cloudmc_endpoint/api/v1/services/azure/example/securityrules/subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Network/networkSecurityGroups/mySecurityGroup/securityRules/mySecurityRule?operation=edit"
```
> Request body example:

```json
{
  "access": "Allow",
  "priority": 180,
  "protocol": "Tcp",
  "sourcePortRanges": [],
  "sources": [
    "10.0.0.0/24"
  ],
  "destinationPortRanges": [
    "8080"
  ],
  "destinations": [
    "192.168.99.0"
  ]
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/securityrules/:id?operation=edit</code>

Update a specific security rule.

Attributes | &nbsp;
---------- | -----
`id`<br/>*string* | The id associated to the security rule. This is a canonized id from azure which is the form of `/subscriptions/:subscriptionid/resourceGroups/:resourcegroup/providers/Microsoft.Network/networksecuritygroups/:networkSecurityGroupName/defaultSecurityRules/:securityRuleName` if the rule is a default security rule or `/subscriptions/:subscriptionid/resourceGroups/:resourcegroup/providers/Microsoft.Network/networksecuritygroups/:networkSecurityGroupName/securityRules/:securityRuleName` if the rule is a custom rule.
`access`<br/> *string* | Determine if rule is allowing or blocking trafic. Either `Access` or `Deny`.
`priority`<br/> *int* | The priority of the security rule.
`protocol`<br/> *string* | One of `*`, `TCP`, `UDP` and `ICMP`. `*` is allowing any protocol.
`sourcePortRanges`<br/> *List* | This specifies on which ports traffic will be allowed or denied by this rule. If the list is empty then all values are included.
`sources`<br/> *List* | List of IP address ranges or/and IP adresses. If the list is empty then all values are included.
`destinationPortRanges`<br/> *List* | This specifies on which ports traffic will be allowed or denied by this rule. If the list is empty then all values are included.
`destinations`<br/> *List* | List of IP address ranges or/and IP adresses. If the list is empty then all values are included.
