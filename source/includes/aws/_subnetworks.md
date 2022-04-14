###Subnetworks

Subnets are a range of IP addresses within your VPC. You can use a public subnet for resources that that will be connected to the internet, and a private subnet for resources that won't be. The CIDR block of a subnet can be the same as the CIDR block for the VPC (for a single subnet in the VPC), or a subset of the CIDR block for the VPC (to create multiple subnets in the VPC). The allowed block size is between a /28 netmask and /16 netmask. If you create more than one subnet in a VPC, the CIDR blocks of the subnets cannot overlap. Each subnet must be associated with a route table, which specifies the allowed routes for outbound traffic leaving the subnet. Every subnet that you create is automatically associated with the main route table for the VPC. 

<!-------------------- LIST SUBNETWORKS -------------------->

#### List Subnets

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-env/subnetworks"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "name": "subnet-0b9cd03ba220cff0c",
      "id": "subnet-0b9cd03ba220cff0c",
      "cidrBlock": "172.31.32.0/20",
      "availabilityZone": "us-east-1c",
      "defaultSubnet": true,
      "state": "available",
      "subnetARN": "arn:aws:ec2:us-east-1:559465017721:subnet/subnet-0b9cd03ba220cff0c",
      "routeTableId": "rtb-0ffdc3e3c20fb0246",
      "availabilityZoneId": "use1-az6",
      "resourceNameDNSARecordEnabled": false,
      "dns64Enabled": false,
      "autoAssignIPv4Address": true,
      "autoAssignCustomerOwnedIPv4Address": false,
      "ipv4CIDRReservations": false,
      "availableIPv4Addresses": 4091,
      "vpcId": "vpc-040e8c412dc149b2a"
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/subnetworks</code>

Retrieve a list of all subnets in a given [environment](#administration-environments).

| Attributes                                         | &nbsp;                                                                                                                          |
| -------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `name`<br/>_string_                                | The name of the subnet. (ID if not set)                                                                                         |
| `id`<br/>_string_                                  | The id of the subnet.                                                                                                           |
| `cidrBlock`<br/>_string_                           | IPv4 network range for the subnet in CIDR.                                                                                      |
| `availabilityZone`<br/>_string_                    | The availability zone of the subnet.                                                                                            |
| `defaultSubnet`<br/>_boolean_                      | If the subnet is the default for its availability zone.                                                                         |
| `state`<br/>_string_                               | State of the subnet. (pending, availabile)                                                                                      |
| `subnetARN`<br/>_string_                           | The Amazon Resource Name (ARN) of the subnet.                                                                                   |
| `routeTableId`<br/>_string_                        | ID of the route table associated with the subnet.                                                                               |
| `availabilityZoneId`<br/>_string_                  | The ID of the subnet's availability zone.                                                                                       |
| `resourceNameDNSARecordEnabled`<br/>_boolean_      | Indicates whether to respond to DNS queries for instance hostnames with DNS A records.                                          |
| `dns64Enabled`<br/>_boolean_                       | Indicates if DNS queries made to the resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. |
| `autoAssignIPv4Address`<br/>_boolean_              | Indicates whether instances launched in this subnet receive a public IPv4 address.                                              |
| `autoAssignCustomerOwnedIPv4Address`<br/>_boolean_ | Indicates whether a network interface created in this subnet receives a customer-owned IPv4 address.                            |
| `ipv4CIDRReservations`<br/>_boolean_               | Indicates whether the subnet has IPv4 CIDR reservations.                                                                        |
| `availableIPv4Addreses`<br/>_int_                  | The number of available addresses in the subnet's CIDR block.                                                                   |
| `vpcId`<br/>_string_                               | The ID of the VPC the subnet is associated with.                                                                                |

<!-------------------- RETRIEVE A SUBNETWORK -------------------->

#### Retrieve a Subnet

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-env/subnetwork/subnet_id"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "name": "subnet-0b9cd03ba220cff0c",
    "id": "subnet-0b9cd03ba220cff0c",
    "cidrBlock": "172.31.32.0/20",
    "availabilityZone": "us-east-1c",
    "defaultSubnet": true,
    "state": "available",
    "subnetARN": "arn:aws:ec2:us-east-1:559465017721:subnet/subnet-0b9cd03ba220cff0c",
    "routeTableId": "rtb-0ffdc3e3c20fb0246",
    "availabilityZoneId": "use1-az6",
    "resourceNameDNSARecordEnabled": false,
    "dns64Enabled": false,
    "autoAssignIPv4Address": true,
    "autoAssignCustomerOwnedIPv4Address": false,
    "ipv4CIDRReservations": false,
    "availableIPv4Addresses": 4091,
    "vpcId": "vpc-040e8c412dc149b2a"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/subnetworks/:id</code>

Retrieve a subnetwork in a given [environment](#administration-environments).

| Attributes                                         | &nbsp;                                                                                                                          |
| -------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `name`<br/>_string_                                | The name of the subnet. (ID if not set)                                                                                         |
| `id`<br/>_string_                                  | The id of the subnet.                                                                                                           |
| `cidrBlock`<br/>_string_                           | IPv4 network range for the subnet in CIDR.                                                                                      |
| `availabilityZone`<br/>_string_                    | The availability zone of the subnet.                                                                                            |
| `defaultSubnet`<br/>_boolean_                      | If the subnet is the default for its availability zone.                                                                         |
| `state`<br/>_string_                               | State of the subnet. (pending, availabile)                                                                                      |
| `subnetARN`<br/>_string_                           | The Amazon Resource Name (ARN) of the subnet.                                                                                   |
| `routeTableId`<br/>_string_                        | ID of the route table associated with the subnet.                                                                               |
| `availabilityZoneId`<br/>_string_                  | The ID of the subnet's availability zone.                                                                                       |
| `resourceNameDNSARecordEnabled`<br/>_boolean_      | Indicates whether to respond to DNS queries for instance hostnames with DNS A records.                                          |
| `dns64Enabled`<br/>_boolean_                       | Indicates if DNS queries made to the resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. |
| `autoAssignIPv4Address`<br/>_boolean_              | Indicates whether instances launched in this subnet receive a public IPv4 address.                                              |
| `autoAssignCustomerOwnedIPv4Address`<br/>_boolean_ | Indicates whether a network interface created in this subnet receives a customer-owned IPv4 address.                            |
| `ipv4CIDRReservations`<br/>_boolean_               | Indicates whether the subnet has IPv4 CIDR reservations.                                                                        |
| `availableIPv4Addreses`<br/>_int_                  | The number of available addresses in the subnet's CIDR block.                                                                   |
| `vpcId`<br/>_string_                               | The ID of the VPC the subnet is associated with.                                                                                |

<!-------------------- DELETE A SUBNETWORK -------------------->

#### Delete a Subnetwork

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-env/subnetworks/subnet-07baec16047092451"
```

> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/subnetworks/:id</code>

Delete a Subnetwork in a given [environment](#administration-environments).

| Attributes                 | &nbsp;                                        |
|----------------------------|-----------------------------------------------|
| `taskId` <br/>*string*     | The task id related to the subnet deletion. |
| `taskStatus` <br/>*string* | The status of the operation.                  |

