## Network policy rules

Network policy rules allows you to control inbound and outbound traffic to your [workload](#stackpath-workloads).


<!-------------------- CREATE A NETWORK POLICY RULE -------------------->

### Create a network policy rule

```shell
curl -X POST \
  -H "MC-Api-Key: your_api_key" \
  -d "request_body" \
  "https://cloudmc_endpoint/v1/services/stackpath/test-area/networkpolicyrules?workloadId=bf9fd2ac-f761-46ef-88e0-b61ef68f8619"
```
> Request body example:

```json
{
  "description": "npr_cloudmc_isk",
  "protocol": "tcp",
  "type": "INBOUND",
  "action": "ALLOW",
  "source": "0.0.0.0/0",
  "portRange": "8080"
}
```

<code>CREATE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networkpolicyrules/?workloadId=:workloadId</code>

Create a new network policy rule.

Query Params | &nbsp;
---- | -----------
`workloadId`<br/>*string* | The workload ID to create a network policy for. It is mandatory.

Required | &nbsp;
------- | -----------
`description`<br/>*string* | A summary of what this rule does or a name of this rule. It is highly recommended to give a unique description to easily identify a rule.
`protocol`<br/>*string* | Supported protocols are: `tcp`, `udp`, `tcp/udp`, `esp` and `ah`. 
`type`<br/>*string* | Either Inbound or Outbound
`action`<br/>*string* | The network policy rule action: `ALLOW` (allow traffic) or `DENY` (deny traffic).
`source`<br/>*string* | A subnet that will define all the IPs allowed or denied by this rule.
`portRange`<br/>*string* | This specifies on which ports traffic will be allowed or denied by this rule. It can be a range of ports separated by a hyphen.