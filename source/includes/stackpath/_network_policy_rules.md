### Network policy rules

Network policy rules allows you to control inbound and outbound traffic to your [workload](#stackpath-workloads).


<!-------------------- LIST NETWORK POLICY RULES -------------------->
#### List network policy rules

```shell
curl -X GET \
  -H "MC-Api-Key: your_api_key" \
  "https://cloudmc_endpoint/api/v2/services/stackpath/test-area/networkpolicyrules"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "stackId": "bcc60174-50e6-44e4-bd45-463845124d87",
      "workloadId": "",
      "networkPolicyId": "f89e80ed-1208-4607-82b2-df2779d90f21",
      "id": "f89e80ed-1208-4607-82b2-df2779d90f21/701825869",
      "description": "Allow ICMP packets",
      "type": "INBOUND",
      "source": "0.0.0.0/0",
      "action": "INBOUND",
      "protocol": "ICMP",
      "portRange": ""
    },
    {
      "stackId": "bcc60174-50e6-44e4-bd45-463845124d87",
      "workloadId": "6ca53aff-8930-46d6-ba86-afbeb0b46bb7",
      "networkPolicyId": "2ac958f2-0976-4de9-95f6-3546fc10f8d0",
      "id": "2ac958f2-0976-4de9-95f6-3546fc10f8d0/INBOUND/-812331665/0",
      "description": "custom-inbound",
      "type": "INBOUND",
      "source": "192.168.0.1/32",
      "action": "ALLOW",
      "protocol": "TCP",
      "portRange": "80"
    }
  ],
  "metadata": {
    "recordCount": 2
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networkpolicyrules</code>

Retrieve a list of all network policy rules in a given [environment](#administration-environments).

Query Params | &nbsp;
---- | -----------
`workloadId`<br/>*string* | The workload ID to get the network policy rules for. It is optional.
`type`<br/>*string* | The type of network policy rule, either `INBOUND` or `OUTBOUND`. It is optional.

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | The ID of the network policy rule, in the form `networkProfileId/type/hashCode/occurrence`.
`stackId`<br/>*UUID* | The UUID of the stack to which the network policy belongs.
`workloadId`<br/>*UUID* | The UUID of the workload to which the network policy rule is applied. Corresponds to the first workload ID in the network policy's list of instance selectors.
`networkPolicyId`<br/>*UUID* | The UUID of the network policy to which the network policy rule belongs.
`description`<br/>*string* | A summary of what this rule does or a name of this rule. It is highly recommended to give a unique description to easily identify a rule.
`type`<br/>*string* | The type of network policy rule, either `INBOUND` or `OUTBOUND`.
`source`<br/>*string* | A subnet that will define all the IPs allowed or denied by this rule.
`action`<br/>*string* | The network policy rule action: `ALLOW` (allow traffic) or `BLOCK` (deny traffic).
`protocol`<br/>*string* | Supported protocols are: `TCP`, `UDP`, `TCP_UDP`, `ESP`, `AH`, `ICMP` or `GRE`.
`portRange`<br/>*string* | This specifies on which ports traffic will be allowed or denied by this rule. It can be a range of ports separated by a hyphen.

<!-------------------- GET A NETWORK POLICY RULE -------------------->

#### Retrieve a network policy rule

```shell
curl -X GET \
  -H "MC-Api-Key: your_api_key" \
  "https://cloudmc_endpoint/api/v2/services/stackpath/test-area/networkpolicyrules/2ac958f2-0976-4de9-95f6-3546fc10f8d0/INBOUND/-812331665/0"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "stackId": "bcc60174-50e6-44e4-bd45-463845124d87",
    "workloadId": "6ca53aff-8930-46d6-ba86-afbeb0b46bb7",
    "networkPolicyId": "2ac958f2-0976-4de9-95f6-3546fc10f8d0",
    "id": "2ac958f2-0976-4de9-95f6-3546fc10f8d0/INBOUND/-812331665/0",
    "description": "custom-inbound",
    "type": "INBOUND",
    "source": "192.168.0.1/32",
    "action": "ALLOW",
    "protocol": "TCP",
    "portRange": "80"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networkpolicyrules/:id</code>

Retrieve a network policy rule in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | The ID of the network policy rule, in the form `networkProfileId/type/hashCode/occurrence`.
`stackId`<br/>*UUID* | The UUID of the stack to which the network policy belongs.
`workloadId`<br/>*UUID* | The UUID of the workload to which the network policy rule is applied. Corresponds to the first workload ID in the network policy's list of instance selectors.
`networkPolicyId`<br/>*UUID* | The UUID of the network policy to which the network policy rule belongs.
`description`<br/>*string* | A summary of what this rule does or a name of this rule. It is highly recommended to give a unique description to easily identify a rule.
`type`<br/>*string* | The type of network policy rule, either `INBOUND` or `OUTBOUND`.
`source`<br/>*string* | A subnet that will define all the IPs allowed or denied by this rule.
`action`<br/>*string* | The network policy rule action: `ALLOW` (allow traffic) or `BLOCK` (deny traffic).
`protocol`<br/>*string* | Supported protocols are: `TCP`, `UDP`, `TCP_UDP`, `ESP`, `AH`, `ICMP` or `GRE`.
`portRange`<br/>*string* | This specifies on which ports traffic will be allowed or denied by this rule. It can be a range of ports separated by a hyphen.

<!-------------------- CREATE A NETWORK POLICY RULE -------------------->

#### Create a network policy rule

```shell
curl -X POST \
  -H "MC-Api-Key: your_api_key" \
  -d "request_body" \
  "https://cloudmc_endpoint/api/v2/services/stackpath/test-area/networkpolicyrules"
```
> Request body example:

```json
{
  "workloadId": "bf9fd2ac-f761-46ef-88e0-b61ef68f8619",
  "description": "npr_cloudmc_isk",
  "protocol": "TCP",
  "type": "INBOUND",
  "action": "ALLOW",
  "source": "0.0.0.0/0",
  "portRange": "8080"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networkpolicyrules</code>

Create a new network policy rule.

Required | &nbsp;
------- | -----------
`workloadId`<br/>*UUID* | The workload UUID to create a network policy for.
`description`<br/>*string* | A summary of what this rule does or a name of this rule. It is highly recommended to give a unique description to easily identify a rule.
`protocol`<br/>*string* | Supported protocols are: `TCP`, `UDP`, `TCP_UDP`, `ESP` and `AH`. 
`type`<br/>*string* | The type of network policy rule. Supported types are: `INBOUND` (Ingress) and `OUTBOUND` (Egress).
`action`<br/>*string* | The network policy rule action: `ALLOW` (allow traffic) or `BLOCK` (block traffic).
`source`<br/>*string* | A subnet that will define all the IPs allowed or denied by this rule.
`portRange`<br/>*string* | This specifies on which ports traffic will be allowed or denied by this rule. It can be a range of ports separated by a hyphen.

<!-------------------- DELETE A NETWORK POLICY RULE -------------------->

#### Delete a network policy rule

```shell
curl -X POST \
  -H "MC-Api-Key: your_api_key" \
  "https://cloudmc_endpoint/api/v2/services/stack/razine-test-env/networkpolicyrules/93cf3029-3657-44c4-add1-22c4ee2bcb94/INBOUND/1617554972/0"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networkpolicyrules/:id</code>

Delete a network policy rule.

<!-------------------- EDIT A NETWORK POLICY RULE -------------------->

#### Edit a network policy rule

```shell
curl -X PUT \
  -H "MC-Api-Key: your_api_key" \
  -d "request_body" \
  "https://cloudmc_endpoint/api/v2/services/stackpath/test-area/networkpolicyrules/2ac958f2-0976-4de9-95f6-3546fc10f8d0/INBOUND/-812331665/0"
```
> Request body example:

```json
{
  "description": "npr_cloudmc_isk",
  "workloadId": "6ca53aff-8930-46d6-ba86-afbeb0b46bb7",
  "type": "INBOUND",
  "source": "192.168.0.1/32",
  "action": "ALLOW",
  "protocol": "TCP",
  "portRange": "80"
}
```

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networkpolicyrules/:id</code>

Edit a network policy rule.

Required | &nbsp;
------- | -----------
`description`<br/>*string* | A summary of what this rule does or a name of this rule. It is highly recommended to give a unique description to easily identify a rule.
`workloadId`<br/>*UUID* | The UUID of the workload to which the network policy rule is applied. Corresponds to the first workload ID in the network policy's list of instance selectors.
`type`<br/>*string* | The type of network policy rule. Supported types are: `INBOUND` (Ingress) and `OUTBOUND` (Egress).
`source`<br/>*string* | A CIDR subnet that will define all the IPs allowed or denied by this rule.
`action`<br/>*string* | The network policy rule action: `ALLOW` (allow traffic) or `BLOCK` (deny traffic).
`protocol`<br/>*string* | Supported protocols are: `TCP`, `UDP`, `TCP_UDP`, `ESP` or `AH`.
`portRange`<br/>*string* | This specifies on which ports traffic will be allowed or denied by this rule. It can be a range of ports separated by a hyphen. Not required for protocol for `ESP` or `AH`. 
