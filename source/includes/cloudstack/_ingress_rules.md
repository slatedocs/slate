### Ingress rules

Manage inbound traffic rules for isolated networks.

#### List ingress rules
```shell
curl -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/ingressrules"
```
> The above command returns a JSON structured like this:

```json
{
    "data": [
       {
            "id": "f6c7f86f-1e28-42fd-804f-0416a201a778",
            "networkId": "858d3ab6-04c9-43ef-9e83-07f28df59323",
            "publicIp": "172.31.3.202",
            "publicIpId": "44ebac5d-18cc-4eea-ab59-7a2af0691c88",
            "sourceCidr": "10.2.1.0/25",
            "protocol": "TCP",
            "startPort": "80",
            "endPort": "90",
            "state": "Active"
        },
        {
            "id": "f1863d10-e7ec-4f17-8cdd-0e4046643b0b",
            "networkId": "858d3ab6-04c9-43ef-9e83-07f28df59323",
            "publicIp": "172.31.3.202",
            "publicIpId": "44ebac5d-18cc-4eea-ab59-7a2af0691c88",
            "sourceCidr": "10.2.1.0/24",
            "protocol": "UDP",
            "startPort": "",
            "endPort": "",
            "state": "Active"
        },
        {
            "id": "d860f2e7-ad15-4cb0-8477-6aa439245d1f",
            "networkId": "858d3ab6-04c9-43ef-9e83-07f28df59323",
            "publicIp": "172.31.3.202",
            "publicIpId": "44ebac5d-18cc-4eea-ab59-7a2af0691c88",
            "sourceCidr": "10.2.1.0/24",
            "protocol": "ICMP",
            "icmpType": "3",
            "icmpCode": "5",
            "state": "Active"
        }
    ],
    "metadata": {
        "recordCount": 3
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/ingressrules</code>

List ingress rules.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the ingress rule
`networkId`<br/>*string* | The id of the isolated network the rule applies to
`publicIp`<br/>*string* | The [public IP](#cloudstack-public-ips) of this ingress rule
`publicIpId`<br/>*UUID* | The id of the [public IP](#cloudstack-public-ips) of this ingress rule
`sourceCidr`<br/>*string* | The source cidr
`protocol`<br/>*string* | The protocol the rule applies to. <br/>*Possible values:* `TCP`, `UDP`, `ICMP`
`startPort`<br/>*string* | The start port (for TCP/UDP protocols only). Can be empty for all ports.
`endPort`<br/>*string* | The end port (for TCP/UDP protocols only). Can be empty to match the start port value.
`icmpType`<br/>*string* | The ICMP type (for ICMP protocol only)
`icmpCode`<br/>*string* | The ICMP code (for ICMP protocol only)
`state`<br/>*string* | The state.<br/>*Possible values:* `Active`, `Inactive`

Query Parameters | &nbsp;
---------- | -----
`network_id`<br/>*UUID* | Filter the list to only retrieve the ingress rules of a specific [Network](#cloudstack-networks)
`public_ip_id`<br/>*UUID* | Filter the list to only retrieve the ingress rules of a specific [public IP](#cloudstack-public-ips)

#### Retrieve a specific ingress rule
```shell
curl -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/ingressrules/f1863d10-e7ec-4f17-8cdd-0e4046643b0b"
```
> The above command returns a JSON structured like this:

```json
{
    "data": {
            "id": "f1863d10-e7ec-4f17-8cdd-0e4046643b0b",
            "networkId": "858d3ab6-04c9-43ef-9e83-07f28df59323",
            "publicIp": "172.31.3.202",
            "publicIpId": "44ebac5d-18cc-4eea-ab59-7a2af0691c88",
            "sourceCidr": "10.2.1.0/24",
            "protocol": "UDP",
            "startPort": "80",
            "endPort": "80",
            "state": "Active"
        }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/ingressrules/:id</code>

Retrieve an ingress rule by its id.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the ingress rule
`networkId`<br/>*string* | The id of the isolated network the rule applies to
`publicIp`<br/>*string* | The [public IP](#cloudstack-public-ips) of this ingress rule
`publicIpId`<br/>*UUID* | The id of the [public IP](#cloudstack-public-ips) of this ingress rule
`sourceCidr`<br/>*string* | The source cidr
`protocol`<br/>*string* | The protocol the rule applies to. <br/>*Possible values:* `TCP`, `UDP`, `ICMP`
`startPort`<br/>*string* | The start port (for TCP/UDP protocols only). Can be empty for all ports.
`endPort`<br/>*string* | The end port (for TCP/UDP protocols only). Can be empty to match the start port value.
`icmpType`<br/>*string* | The ICMP type (for ICMP protocol only)
`icmpCode`<br/>*string* | The ICMP code (for ICMP protocol only)
`state`<br/>*string* | The state.<br/>*Possible values:* `Active`, `Inactive`

#### Create an ingress rule

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/ingressrules"
```
<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/ingressrules</code>

Required                   | &nbsp;
---------------------------|-------
`networkId`<br/>*string* | The id of the isolated network the rule applies to
`sourceCidr`<br/>*string* | The source cidr
`protocol`<br/>*string*    | The protocols targeted by this rule (TCP, UDP, ICMP).


Protocol-specific       | &nbsp;
------------------------|-------
`publicIpId`<br/>*UUID* | The id of the [public IP](#cloudstack-public-ips) where the ingress be applied. If not provided, a new public IP will be acquired.
`startPort`<br/>*string* | The start of the port range targeted by this rule. Required if the protocol is TCP or UDP. If left empty, all ports will be opened.
`endPort`<br/>*string*   | The end of the port range targeted by this rule. Only valid if the protocol is TCP or UDP. If left empty, it will match the startPort value.
`icmpType`<br/>*string*  | ICMP message type. Required if the protocol is ICMP
`icmpCode`<br/>*string*  | ICMP message error code. Required if the protocol is ICMP

#### Delete an ingress rule

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/ingressrules/3247167a-e7e7-11e3-9187-06669c0000ad"
```
<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/ingressrules/:id</code>

Delete a specific ingress rule.