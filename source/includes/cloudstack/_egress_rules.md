### Egress rules

Manage outbound traffic rules for isolated networks

#### List egress rules
```shell
curl -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/egressrules"
```
> The above command returns a JSON structured like this:

```json
{
    "data": [
       {
            "id": "f6c7f86f-1e28-42fd-804f-0416a201a778",
            "networkId": "858d3ab6-04c9-43ef-9e83-07f28df59323",
            "sourceCidr": "10.2.1.0/25",
            "destinationCidr": "0.0.0.0/0",
            "protocol": "ALL",
            "state": "Active"
        },
        {
            "id": "d860f2e7-ad15-4cb0-8477-6aa439245d1f",
            "networkId": "858d3ab6-04c9-43ef-9e83-07f28df59323",
            "sourceCidr": "10.2.1.0/24",
            "destinationCidr": "",
            "protocol": "ICMP",
            "icmpType": "3",
            "icmpCode": "5",
            "state": "Active",
            "allPortsAllowed": false
        },
        {
            "id": "f1863d10-e7ec-4f17-8cdd-0e4046643b0b",
            "networkId": "858d3ab6-04c9-43ef-9e83-07f28df59323",
            "sourceCidr": "10.2.1.0/24",
            "destinationCidr": "",
            "protocol": "UDP",
            "startPort": "",
            "endPort": "",
            "state": "Active",
            "allPortsAllowed": true
        }
    ],
    "metadata": {
        "recordCount": 3
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/egressrules</code>

List egress rules.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the egress rule
`networkId`<br/>*string* | The id of the network the rule applies to
`sourceCidr`<br/>*string* | The source cidr
`destinationCidr`<br/>*string* | The destination cidr
`protocol`<br/>*string* | The protocol the rule applies to. <br/>*Possible values:* `TCP`, `UDP`, `ICMP`, `ALL`
`startPort`<br/>*string* | The start port (for TCP/UDP protocols only)
`endPort`<br/>*string* | The end port (for TCP/UDP protocols only)
`allPortsAllowed`<br/>*boolean* | The flag indicating all the port range selection (for TCP/UDP protocols only)
`icmpType`<br/>*string* | The ICMP type (for ICMP protocol only)
`icmpCode`<br/>*string* | The ICMP code (for ICMP protocol only)
`state`<br/>*string* | The state.<br/>*Possible values:* `Active`, `Inactive`

Query Parameters | &nbsp;
---------- | -----
`network_id`<br/>*UUID* | Filter the list to only retrieve the egress rules of a specific [Network](#cloudstack-networks)

#### Retrieve an egress rule
```shell
curl -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/egressrules/f1863d10-e7ec-4f17-8cdd-0e4046643b0b"
```
> The above command returns a JSON structured like this:

```json
{
    "data": {
            "id": "f1863d10-e7ec-4f17-8cdd-0e4046643b0b",
            "networkId": "858d3ab6-04c9-43ef-9e83-07f28df59323",
            "sourceCidr": "10.2.1.0/24",
            "destinationCidr": "",
            "protocol": "UDP",
            "startPort": "",
            "endPort": "",
            "state": "Active",
            "allPortsAllowed": true
        }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/egressrules/:id</code>

Retrieve an egress rule by its id.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the egress rule
`networkId`<br/>*string* | The id of the network the rule applies to
`sourceCidr`<br/>*string* | The source cidr
`destinationCidr`<br/>*string* | The destination cidr
`protocol`<br/>*string* | The protocol the rule applies to
`startPort`<br/>*string* | The start port (for TCP/UDP protocols only)
`endPort`<br/>*string* | The end port (for TCP/UDP protocols only)
`allPortsAllowed`<br/>*boolean* | The flag indicating all the port range selection (for TCP/UDP protocols only)
`icmpType`<br/>*string* | The ICMP message type (for ICMP protocol only)
`icmpCode`<br/>*string* | The ICMP message error code (for ICMP protocol only)
`state`<br/>*string* | The state.<br/>*Possible values:* `Active`, `Inactive`

#### Create an egress rule

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/egressrules"
```
<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/egressrules</code>

Required                   | &nbsp;
---------------------------|-------
`networkId`<br/>*string* | The id of the network the rule applies to
`sourceCidr`<br/>*string* | The source cidr
`protocol`<br/>*string*    | The protocols targeted by this rule. TCP, UDP, ICMP, or ALL

Optional                   | &nbsp;
---------------------------|-------
`destinationCidr`<br/>*string* | The destination cidr

<aside class="notice">
For rules with protocol <code>ALL</code>, no protocol-specific information is required. For all other protocols, see the protocol-specific fields below.
</aside>

Protocol-specific       | &nbsp;
------------------------|-------
`startPort`<br/>*string* | The start of the port range targeted by this rule. Required if the protocol is TCP or UDP
`endPort`<br/>*string*   | The end of the port range targeted by this rule. Required if the protocol is TCP or UDP
`allPortsAllowed`<br/>*boolean* | The flag indicating the selection of all the port range, i.e. 1-65535. Required if the protocol is TCP or UDP. <br/>*Default value:* `false`
`icmpType`<br/>*string*  | ICMP message type. Required if the protocol is ICMP
`icmpCode`<br/>*string*  | ICMP message error code. Required if the protocol is ICMP

#### Delete an egress rule

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/egressrules/3247167a-e7e7-11e3-9187-06669c0000ad"
```
<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/egressrules/:id</code>

Delete a specific egress rule.