### Firewall rules

Firewall allows you to control inbound and outbound traffic to your [environment](#administration-environments).

#### List firewall rules

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/firewallrules"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "allowed": [
        {
          "IPProtocol": "tcp",
          "ports": [
            "80"
          ]
        }
      ],
      "creationTimestamp": "2019-03-13T13:28:49.840-07:00",
      "description": "",
      "direction": "INGRESS",
      "disabled": false,
      "id": "4890726785951782638",
      "kind": "compute#firewall",
      "logConfig": {
        "enable": false
      },
      "name": "default-allow-http",
      "network": "https://www.googleapis.com/compute/v1/projects/flo-cmc-gcp-cay/global/networks/default",
      "priority": 1000,
      "selfLink": "https://www.googleapis.com/compute/v1/projects/flo-cmc-gcp-cay/global/firewalls/default-allow-http",
      "sourceRanges": [
        "0.0.0.0/0"
      ],
      "targetTags": [
        "http-server"
      ],
      "details": "tcp : 80",
      "action": "allow"
    }
  ],
  "metadata": {
    "recordCount": 7
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/firewallrules</code>

Retrieve a list of all firewall rules in a given [environment](#administration-environments).

 Attributes | &nbsp;
------- | -----------
`allowed`<br/>*Array[object]* | The list of ALLOW rules specified by this firewall.
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`denied`<br/>*Array[object]* | The list of DENY rules specified by this firewall.
`description`<br/>*string* | An optional description of this firewall rule.
`direction`<br/>*string* | Direction of traffic to which this firewall applies, either INGRESS or EGRESS. The default is INGRESS.
`disabled`<br/>*boolean* | Denotes whether the firewall rule is disabled. When set to true, the firewall rule is not enforced and the network behaves as if it did not exist.
`id`<br/>*string* | The unique identifier for the resource.
`kind`<br/>*string* | Type of the resource.
`logConfig`<br/>*object* | This field denotes the logging options for a particular firewall rule. If logging is enabled, logs will be exported to Stackdriver.
`name`<br/>*string* | The display name of the firewall rule.
`network`<br/>*string* | URL of the network resource for this firewall rule.
`priority`<br/>*integer* | Priority for this rule. This is an integer between 0 and 65535, both inclusive. The default value is 1000. Relative priorities determine which rule takes effect if multiple rules apply. Lower values indicate higher priority. For example, a rule with priority 0 has higher precedence than a rule with priority 1. DENY rules take precedence over ALLOW rules if they have equal priority. Note that VPC networks have implied rules with a priority of 65535. To avoid conflicts with the implied rules, use a priority number less than 65535.
`selfLink`<br/>*string* | Server-defined URL for this resource.
`sourceRanges`<br/>*Array[string]* | Server-defined URL for the resource.
`targetTags`<br/>*Array[string]* | A list of tags that controls which instances the firewall rule applies to. If targetTags are specified, then the firewall rule applies only to instances in the VPC network that have one of those tags. If no targetTags are specified, the firewall rule applies to all instances on the specified network.
`details`<br/>*string* | Concatenation of the IP protocols followed by the port ranges.
`action`<br/>*string* | The firewall rule type: 'allow' (allow traffic) or 'deny' (deny traffic).

#### Retrieve a firewall rule

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/firewallrules/4890726785951782638"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "allowed": [
    {
        "IPProtocol": "tcp",
        "ports": [
        "80"
        ]
    }
    ],
    "creationTimestamp": "2019-03-13T13:28:49.840-07:00",
    "description": "",
    "direction": "INGRESS",
    "disabled": false,
    "id": "4890726785951782638",
    "kind": "compute#firewall",
    "logConfig": {
    "enable": false
    },
    "name": "default-allow-http",
    "network": "https://www.googleapis.com/compute/v1/projects/flo-cmc-gcp-cay/global/networks/default",
    "priority": 1000,
    "selfLink": "https://www.googleapis.com/compute/v1/projects/flo-cmc-gcp-cay/global/firewalls/default-allow-http",
    "sourceRanges": [
    "0.0.0.0/0"
    ],
    "targetTags": [
    "http-server"
    ],
    "details": "tcp : 80",
    "action": "allow"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/firewallrules/:id</code>

Retrieve a firewall rules in a given [environment](#administration-environments).

 Attributes | &nbsp;
------- | -----------
`allowed`<br/>*Array[object]* | The list of ALLOW rules specified by this firewall.
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`denied`<br/>*Array[object]* | The list of DENY rules specified by this firewall.
`description`<br/>*string* | An optional description of this firewall rule.
`direction`<br/>*string* | Direction of traffic to which this firewall applies, either INGRESS or EGRESS. The default is INGRESS.
`disabled`<br/>*boolean* | Denotes whether the firewall rule is disabled. When set to true, the firewall rule is not enforced and the network behaves as if it did not exist.
`id`<br/>*string* | The unique identifier for the resource.
`kind`<br/>*string* | Type of the resource.
`logConfig`<br/>*object* | This field denotes the logging options for a particular firewall rule. If logging is enabled, logs will be exported to Stackdriver.
`name`<br/>*string* | The display name of the firewall rule.
`network`<br/>*string* | URL of the network resource for this firewall rule.
`priority`<br/>*integer* | Priority for this rule. This is an integer between 0 and 65535, both inclusive. The default value is 1000. Relative priorities determine which rule takes effect if multiple rules apply. Lower values indicate higher priority. For example, a rule with priority 0 has higher precedence than a rule with priority 1. DENY rules take precedence over ALLOW rules if they have equal priority. Note that VPC networks have implied rules with a priority of 65535. To avoid conflicts with the implied rules, use a priority number less than 65535.
`selfLink`<br/>*string* | Server-defined URL for this resource.
`sourceRanges`<br/>*Array[string]* | Server-defined URL for the resource.
`targetTags`<br/>*Array[string]* | A list of tags that controls which instances the firewall rule applies to. If targetTags are specified, then the firewall rule applies only to instances in the VPC network that have one of those tags. If no targetTags are specified, the firewall rule applies to all instances on the specified network.
`details`<br/>*string* | Concatenation of the IP protocols followed by the port ranges.
`action`<br/>*string* | The firewall rule type: 'allow' (allow traffic) or 'deny' (deny traffic).

<!-------------------- CREATE A FIREWALL RULE -------------------->

#### Create a firewall rule

```shell
curl -X POST \
  -H "MC-Api-Key: your_api_key" \
  -d "request_body" \
  "https://cloudmc_endpoint/api/v2/services/gcp/test-area/firewallrule"
```
> Request body example:

```json
{
  "action": "allow",
  "all": true,
  "direction": "INGRESS",
  "name": "fw-rd-tuv",
  "priority": 1000,
  "range": "0.0.0.0/0",
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/firewallrule</code>

Create a new firewall rule.

Required | &nbsp;
------- | -----------
`action`<br/>*string* | The firewall rule type: 'allow' (allow traffic) or 'deny' (deny traffic).
`direction`<br/>*string* | Direction of traffic to which this firewall applies, either INGRESS or EGRESS. The default is INGRESS.
`name`<br/>*string* | The display name of the firewall rule.
`priority`<br/>*string* | Priority for this rule. This is an integer between 0 and 65535, both inclusive. The default value is 1000.
`range`<br/>*Array[string]* | The source or destination range depending on the `direction` specified. The firewall rule applies only to traffic that has a source/destination IP address in these ranges. These ranges must be expressed in CIDR format.


Optional | &nbsp;
------- | -----------
`all`<br/>*boolean* | Specifies if the firewall rule is an allow all or deny all rule.
`tcpPorts`<br/>*Array[string]* | The tcp ports on which to apply the rule. These must be in the range [0, 65535).
`udpPorts`<br/>*Array[string]* | The udp ports on which to apply the rule. These must be in the range [0, 65535).
`protocols`<br/>*Array[string]* | Supported protocols are: icmp, esp, ah, sctp, ipip or a valid [decimal IP protocol number](https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml).


<!-------------------- DELETE A FIREWALL RULE -------------------->

#### Delete a firewall rule

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/firewallrule/4890726785951782638"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/firewallrule/:id</code>

Delete an existing firewall rule.
