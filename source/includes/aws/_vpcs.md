### Virtual Private Clouds

View and manage vpcs.

<!-------------------- LIST VPCS -------------------->

#### List VPCs

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-env/vpcs"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "vpc-0fc6135adfbe4a69c",
      "name": "vpc-0fc6135adfbe4a69c",
      "ownerId": "187065266101",
      "instanceTenancy": "default",
      "cidrBlock": "172.31.0.0/16",
      "dhcpOptionsId": "dopt-04a202f0ccfc4ecb2",
      "state": "available",
      "isDefault": true
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpcs</code>

Retrieve a list of all vpcs in a given [environment](#administration-environments).

| Attributes                     | &nbsp;                                                                                                        |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------- |
| `id`<br/>_string_              | The ID of the VPC.                                                                                            |
| `name`<br/>_string_            | The name of the VPC.                                                                                          |
| `ownerId`<br/>_string_         | Amazon account id of organization owner.                                                                      |
| `instanceTenancy`<br/>_string_ | The tenancy options for instances launched into the VPC (default, dedicated, host), set as shared by default. |
| `cidrBlock`<br/>_string_       | IPv4 network range for the VPC in CIDR notation.                                                              |
| `dhcpOptionsId`<br/>_string_   | The DHCP options set applied to the network configuration of the VPC.                                         |
| `state`<br/>_string_           | The state of VPC access (pending, available).                                                                 |
| `isDefault`<br/>_boolean_      | Whether or not the VPC is the default environment VPC.                                                        |

<!-------------------- RETRIEVE A VPC -------------------->

#### Retrieve a VPC

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-env/vpcs/vpc_id"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "vpc-0fc6135adfbe4a69c",
    "name": "vpc-0fc6135adfbe4a69c",
    "ownerId": "187065266101",
    "instanceTenancy": "default",
    "cidrBlock": "172.31.0.0/16",
    "dhcpOptionsId": "dopt-04a202f0ccfc4ecb2",
    "state": "available",
    "isDefault": true
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpcs/:id</code>

Retrieve a vpc in a given [environment](#administration-environments).

| Attributes                     | &nbsp;                                                                                                        |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------- |
| `id`<br/>_string_              | The ID of the VPC.                                                                                            |
| `name`<br/>_string_            | The name of the VPC.                                                                                          |
| `ownerId`<br/>_string_         | Amazon account id of organization owner.                                                                      |
| `instanceTenancy`<br/>_string_ | The tenancy options for instances launched into the VPC (default, dedicated, host), set as shared by default. |
| `cidrBlock`<br/>_string_       | IPv4 network range for the VPC in CIDR notation.                                                              |
| `dhcpOptionsId`<br/>_string_   | The DHCP options set applied to the network configuration of the VPC.                                         |
| `state`<br/>_string_           | The state of VPC access (pending, available).                                                                 |
| `isDefault`<br/>_boolean_      | Whether or not the VPC is the default environment VPC.                                                        |



<!-------------------- CREATE A VPC -------------------->

#### Create a VPC

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-env/vpcs"
```

> Request body example for a named VPC:

```json
{
  "name": "name-of-the-vpc",
  "cidrBlock": "10.0.0.0/24"
}
```

> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpcs</code>

Create a VPC in a given [environment](#administration-environments).

| Attributes        | &nbsp;             |
| ----------------- | ------------------ |
| `id`<br/>_string_ | The ID of the VPC. |

| Optional            | &nbsp;                                                                       |
| ------------------- | ---------------------------------------------------------------------------- |
| `name`<br/>_string_ | The VPC name. A default name will be created if there isn't one provided. |

<!-------------------- DELETE A VPC -------------------->

#### Delete a VPC

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-env/vpcs/vpc-05a6af2e6a6360915"
```

> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpcs/:id</code>

Delete a VPC in a given [environment](#administration-environments).

| Attributes                 | &nbsp;                                        |
|----------------------------|-----------------------------------------------|
| `taskId` <br/>*string*     | The task id related to the VPC deletion. |
| `taskStatus` <br/>*string* | The status of the operation.                  |
