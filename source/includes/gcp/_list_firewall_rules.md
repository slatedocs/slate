### List firewall rules 

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "http://cloudmc_endpoint/api/v2/services/gcp-co/testing/firewallrules"

# The above command returns JSON structured like this:
```
```json
{
   "data":[
      {
         "allowed":[
            {
               "IPProtocol":"icmp"
            }
         ],
         "creationTimestamp":"2019-06-05T13:08:23.835-07:00",
         "description":"Allow ICMP from anywhere",
         "direction":"INGRESS",
         "disabled":false,
         "id":"6753322336928505816",
         "kind":"compute#firewall",
         "logConfig":{
            "enable":false
         },
         "name":"default-allow-icmp",
         "network":"https://www.googleapis.com/compute/v1/projects/testing-uxx/global/networks/default",
         "priority":65534,
         "selfLink":"https://www.googleapis.com/compute/v1/projects/testing-uxx/global/firewalls/default-allow-icmp",
         "sourceRanges":[
            "0.0.0.0/0"
         ],
         "action":"allow"
      },
      {
         "allowed":[
            {
               "IPProtocol":"tcp",
               "ports":[
                  "0-65535"
               ]
            },
            {
               "IPProtocol":"udp",
               "ports":[
                  "0-65535"
               ]
            },
            {
               "IPProtocol":"icmp"
            }
         ],
         "creationTimestamp":"2019-06-05T13:08:23.802-07:00",
         "description":"Allow internal traffic on the default network",
         "direction":"INGRESS",
         "disabled":false,
         "id":"95649327595495384",
         "kind":"compute#firewall",
         "logConfig":{
            "enable":false
         },
         "name":"default-allow-internal",
         "network":"https://www.googleapis.com/compute/v1/projects/testing-uxx/global/networks/default",
         "priority":65534,
         "selfLink":"https://www.googleapis.com/compute/v1/projects/testing-uxx/global/firewalls/default-allow-internal",
         "sourceRanges":[
            "10.128.0.0/9"
         ],
         "action":"allow"
      },
      {
         "allowed":[
            {
               "IPProtocol":"tcp",
               "ports":[
                  "3389"
               ]
            }
         ],
         "creationTimestamp":"2019-06-05T13:08:23.825-07:00",
         "description":"Allow RDP from anywhere",
         "direction":"INGRESS",
         "disabled":false,
         "id":"8521921759829925848",
         "kind":"compute#firewall",
         "logConfig":{
            "enable":false
         },
         "name":"default-allow-rdp",
         "network":"https://www.googleapis.com/compute/v1/projects/testing-uxx/global/networks/default",
         "priority":65534,
         "selfLink":"https://www.googleapis.com/compute/v1/projects/testing-uxx/global/firewalls/default-allow-rdp",
         "sourceRanges":[
            "0.0.0.0/0"
         ],
         "action":"allow"
      },
      {
         "allowed":[
            {
               "IPProtocol":"tcp",
               "ports":[
                  "22"
               ]
            }
         ],
         "creationTimestamp":"2019-06-05T13:08:23.814-07:00",
         "description":"Allow SSH from anywhere",
         "direction":"INGRESS",
         "disabled":false,
         "id":"4638036624227540952",
         "kind":"compute#firewall",
         "logConfig":{
            "enable":false
         },
         "name":"default-allow-ssh",
         "network":"https://www.googleapis.com/compute/v1/projects/testing-uxx/global/networks/default",
         "priority":65534,
         "selfLink":"https://www.googleapis.com/compute/v1/projects/testing-uxx/global/firewalls/default-allow-ssh",
         "sourceRanges":[
            "0.0.0.0/0"
         ],
         "action":"allow"
      }
   ],
   "metadata":{
      "recordCount":4
   }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/firewallrules</code>

Retrieve a list of all firewall rules in a given [environment](#administration-environments)

Attributes | &nbsp;
------- | -----------
`IPProtocol`<br/>*string* | The IP protocol to which this rule applies. The protocol type is required when creating a firewall rule. This value can either be one of the following well known protocol strings (tcp, udp, icmp, esp, ah, ipip, sctp) or the IP protocol number.
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`description`<br/>*string* | An optional description of this resource. Provide this field when you create the resource.
`direction`<br/>*string* | Direction of traffic to which this firewall applies, either INGRESS or EGRESS. The default is INGRESS. For INGRESS traffic, you cannot specify the destinationRanges field, and for EGRESS traffic, you cannot specify the sourceRanges or sourceTags fields.
`disabled`<br/>*boolean* | Denotes whether the firewall rule is disabled. When set to true, the firewall rule is not enforced and the network behaves as if it did not exist. If this is unspecified, the firewall rule will be enabled.
`id`<br/>*string* | The unique identifier for the resource. This identifier is defined by the server.
`kind`<br/>*string* | Type of the resource.
`logConfig`<br/>*object* | This field denotes the logging options for a particular firewall rule. If logging is enabled, logs will be exported to Stackdriver.
`name`<br/>*string* | Name of the resource; provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long. The first character must be a lowercase letter, and all following characters (except for the last character) must be a dash, lowercase letter, or digit. The last character must be a lowercase letter or digit.
`network`<br/>*string* | URL of the network resource for this firewall rule. If not specified when creating a firewall rule, the default network is used.
`priority`<br/>*integer* | Priority for this rule. This is an integer between 0 and 65535, both inclusive. The default value is 1000. Relative priorities determine which rule takes effect if multiple rules apply. Lower values indicate higher priority. For example, a rule with priority 0 has higher precedence than a rule with priority 1. DENY rules take precedence over ALLOW rules if they have equal priority. Note that VPC networks have implied rules with a priority of 65535. To avoid conflicts with the implied rules, use a priority number less than 65535.
`selfLink`<br/>*string* | Server-defined URL for this resource.
`sourceRanges`<br/>*Array[string]* | Server-defined URL for the resource.
`action`<br/>*string* | ALLOW (allow traffic) or DENY (deny traffic)
`allowed`<br/>*Array[object]* | The list of ALLOW rules specified by this firewall. Each rule specifies a protocol and port-range tuple that describes a permitted connection.

