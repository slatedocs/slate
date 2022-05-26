<!-- ACLs -->

### Network ACLs

Manage access control lists and their rules. To apply an ACL to a VPC subnet, [replace the ACL of a network](#cloudstack-replace-the-network-acl-of-a-network).

#### List network ACLs

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/networkacls?vpc_id=eb763d03-9935-4cd4-8a42-99134e242ccb"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "736d0c2e-d6b5-43fc-bcf0-732fce9a509e",
      "vpcId": "eb763d03-9935-4cd4-8a42-99134e242ccb",
      "name": "custom-1",
      "description": "Allows network egress"
    },
    {
      "id": "3246de94-e7e7-11e3-9187-06669c0000ad",
      "name": "default_allow",
      "description": "Default Network ACL Allow All"
    },
    {
      "id": "32467792-e7e7-11e3-9187-06669c0000ad",
      "name": "default_deny",
      "description": "Default Network ACL Deny All"
    }
  ],
  "metadata": {
    "recordCount": 3
  }
}
```
<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networkacls?vpc_id=:vpc_id</code>

Retrieve a list of network ACLs in a VPC.

Attributes                 | &nbsp;
---------------------------|-------
`id`<br/>*UUID*            | The id of the network ACL
`name`<br/>*string*        | The name of the network ACL
`description`<br/>*string* | The description of the network ACL
`vpcId`<br/>*UUID*         | The VPC where this rule is available. Not present on `default_allow` and `default_deny` ACLs


Query Parameters | &nbsp;
---------- | -----
`vpc_id`<br/>*UUID*    | Filter the list to only retrieve the network ACLs of a specific [VPC](#cloudstack-vpcs)

#### Retrieve a network ACL

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/networkacls/736d0c2e-d6b5-43fc-bcf0-732fce9a509e"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "736d0c2e-d6b5-43fc-bcf0-732fce9a509e",
    "vpcId": "eb763d03-9935-4cd4-8a42-99134e242ccb",
    "name": "custom-1",
    "description": "Allows network egress"
  }
}
```
<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networkacls/:id</code>

Retrieve a specific network ACL by its id.

Attributes                 | &nbsp;
---------------------------|-------
`id`<br/>*UUID*            | The id of the network ACL
`name`<br/>*string*        | The name of the network ACL
`description`<br/>*string* | The description of the network ACL
`vpcId`<br/>*UUID*         | The VPC where this rule is available. Not present on `default_allow` and `default_deny` ACLs

#### Create network ACL

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/networkacls"
```
<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networkacls</code>

Create a new network ACL associated to a VPC.

Required                   | &nbsp;
---------------------------|-------
`name`<br/>*string*        | The name of the network ACL
`description`<br/>*string* | The description of the network ACL
`vpcId`<br/>*UUID*         | Networks of this VPC will be able to use the new ACL

#### Delete a network ACL

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/networkacls/736d0c2e-d6b5-43fc-bcf0-732fce9a509e"
```
<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networkacls/:id</code>

Delete an ACL and all of its rules.

<!-- ACL rules -->
#### List a network ACL's rules

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/networkaclrules?network_acl_id=3246de94-e7e7-11e3-9187-06669c0000ad"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "3247167a-e7e7-11e3-9187-06669c0000ad",
      "networkAclId": "3246de94-e7e7-11e3-9187-06669c0000ad",
      "ruleNumber": "2",
      "description":"Allow all egress",
      "cidr": "0.0.0.0/0",
      "action": "Allow",
      "protocol": "ALL",
      "trafficType": "Egress",
      "state": "Active"
    },
    {
      "id": "3246fdb6-e7e7-11e3-9187-06669c0000ad",
      "networkAclId": "3246de94-e7e7-11e3-9187-06669c0000ad",
      "ruleNumber": "1",
      "description":"Allow all ingress",
      "cidr": "0.0.0.0/0",
      "action": "Allow",
      "protocol": "ALL",
      "trafficType": "Ingress",
      "state": "Active"
    }
  ],
  "metadata": {
    "recordCount": 2
  }
}
```
<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networkaclrules?network_acl_id=:network_acl_id</code>

List a network ACL's rules.

Attributes                 | &nbsp;
---------------------------|-------
`id`<br/>*UUID*            | The id of the network ACL rule
`networkAclId`<br/>*UUID*  | The id of the network ACL that this rule belongs to
`ruleNumber`<br/>*int* | The relative position of this rule in its ACL
`cidr`<br/>*CIDR*          | The network addresses targeted by this rule
`action`<br/>*string*      | What to do with traffic matched by this rule. Either Allow or Deny
`protocol`<br/>*string*    | The protocols targeted by this rule. TCP, UDP, ICMP, or ALL
`trafficType`<br/>*string* | The direction of traffic targeted by this rule. Either Ingress or Egress
`state`<br/>*string*       | The state of this rule. Either Active or Inactive
`description`<br/>*string* | The description of the rule

Query Parameters | &nbsp;
---------- | -----
`network_acl_id`<br/>*UUID* | Filter the list to only retrieve the rules of a specific [network ACL](#cloudstack-network-acls)

#### Retrieve a network ACL rule

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/networkaclrules/3247167a-e7e7-11e3-9187-06669c0000ad"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "3247167a-e7e7-11e3-9187-06669c0000ad",
    "networkAclId": "3246de94-e7e7-11e3-9187-06669c0000ad",
    "ruleNumber": "2",
    "description":"Allow all egress",
    "cidr": "0.0.0.0/0",
    "action": "Allow",
    "protocol": "ALL",
    "trafficType": "Egress",
    "state": "Active"
  }
}
```
<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networkaclrules/:id</code>

Attributes                 | &nbsp;
---------------------------|-------
`id`<br/>*UUID*            | The id of the network ACL rule
`networkAclId`<br/>*UUID*  | The id of the network ACL that this rule belongs to
`ruleNumber`<br/>*int* | The relative position of this rule in its ACL
`cidr`<br/>*CIDR*          | The network addresses targeted by this rule
`action`<br/>*string*      | What to do with traffic matched by this rule. Either Allow or Deny
`protocol`<br/>*string*    | The protocols targeted by this rule. TCP, UDP, ICMP, or ALL
`trafficType`<br/>*string* | The direction of traffic targeted by this rule. Either Ingress or Egress
`state`<br/>*string*       | The state of this rule. Either Active or Inactive
`description`<br/>*string* | The description of the rule

#### Create a network ACL rule

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/networkaclrules"
```
<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networkaclrules</code>

Required                   | &nbsp;
---------------------------|-------
`networkAclId`<br/>*UUID*  | The id of the network ACL to add this rule to
`ruleNumber`<br/>*int* | The relative position of this rule in its ACL
`cidr`<br/>*CIDR*          | The network addresses targeted by this rule
`action`<br/>*string*      | What to do with traffic matched by this rule. Either Allow or Deny
`protocol`<br/>*string*    | The protocols targeted by this rule. TCP, UDP, ICMP, or ALL
`trafficType`<br/>*string* | The direction of traffic targeted by this rule. Either Ingress or Egress

<aside class="notice">
For rules with protocol <code>ALL</code>, no protocol-specific information is required. For all other protocols, see the protocol-specific fields below.
</aside>

Protocol-specific       | &nbsp;
------------------------|-------
`startPort`<br/>*int* | The start of the port range targeted by this rule. Required if the protocol is TCP or UDP
`endPort`<br/>*int*   | The end of the port range targeted by this rule. Required if the protocol is TCP or UDP
`icmpType`<br/>*int*  | ICMP message type. Required if the protocol is ICMP
`icmpCode`<br/>*int*  | ICMP message error code. Required if the protocol is ICMP

Optional                   | &nbsp;
---------------------------|-------
`description`<br/>*string* | The description of the rule

#### Update a network ACL rule

```shell
curl -X PUT \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/networkaclrules/3247167a-e7e7-11e3-9187-06669c0000ad"
```
<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networkaclrules/:id</code>

Update a network ACL rule.

<aside class="notice">
A rule's protocol can only be changed from TCP to UDP or vice versa.
</aside>

Optional                   | &nbsp;
---------------------------|-------
`ruleNumber`<br/>*int* | The relative position of this rule in its ACL
`cidr`<br/>*CIDR*          | The network addresses targeted by this rule
`description`<br/>*string* | The description of the rule
`action`<br/>*string*      | What to do with traffic matched by this rule. Either Allow or Deny
`protocol`<br/>*string*    | The protocols targeted by this rule. TCP, UDP, ICMP, or ALL
`trafficType`<br/>*string* | The direction of traffic targeted by this rule. Either Ingress or Egress
`startPort`<br/>*int*  | The start of the port range targeted by this rule
`endPort`<br/>*int*    | The end of the port range targeted by this rule
`icmpType`<br/>*int*   | ICMP message type
`icmpCode`<br/>*int*   | ICMP message error code

#### Delete a network ACL rule

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/networkaclrules/3247167a-e7e7-11e3-9187-06669c0000ad"
```
<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networkaclrules/:id</code>

Delete a specific rule of a network ACL.
