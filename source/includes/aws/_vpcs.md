###Virtual Private Clouds

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
   "data":[
      {
         "id":"vpc-0fc6135adfbe4a69c",
         "name":"vpc-0fc6135adfbe4a69c",
         "ownerId":"187065266101",
         "instanceTenancy":"default",
         "cidrBlock":"172.31.0.0/16",
         "dhcpOptionsId":"dopt-04a202f0ccfc4ecb2",
         "state":"available",
         "isDefault":true
      }
   ],
   "metadata":{
      "recordCount":1
   }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpcs</code>

Retrieve a list of all vpcs in a given [environment](#administration-environments).

| Attributes                        | &nbsp;                                                                                                                                                                                                                   |
|-----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `id`<br/>*string*                 | The ID of the VPC.                                                                                                                                                                                                  |
| `name`<br/>*string*               | The name of the VPC.                                                                                                                                                                                                |
| `ownerId`<br/>*string*            | Amazon account id of organization owner.                                                                                                                                                     |
| `instanceTenancy`<br/>*string*    | The tenancy options for instances launched into the VPC (default, dedicated, host), set as shared by default.                                                                                                                                                                           |
| `cidrBlock`<br/>*string*          | IPv4 network range for the VPC in CIDR notation.                                                                                                                                                                                                       |
| `dhcpOptionsId`<br/>*string*      | The DHCP options set applied to the network configuration of the VPC.                                                                                                                                                                                      |
| `state`<br/>*string*              | The state of VPC access (pending, available).                                                                                                                                                                                   |
| `isDefault`<br/>*boolean*         | Whether or not the VPC is the default environment VPC.            |

<!-------------------- RETRIEVE A VPC -------------------->

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-env/vpcs/vpc_id"
```
> The above command returns a JSON structured like this:

```json
{
   "data":{
      "id":"vpc-0fc6135adfbe4a69c",
      "name":"vpc-0fc6135adfbe4a69c",
      "ownerId":"187065266101",
      "instanceTenancy":"default",
      "cidrBlock":"172.31.0.0/16",
      "dhcpOptionsId":"dopt-04a202f0ccfc4ecb2",
      "state":"available",
      "isDefault":true
   }
}
```
<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpcs/:id</code>

Retrieve a vpc in a given [environment](#administration-environments).
| Attributes                        | &nbsp;                                                                                                                                                                                                                   |
|-----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `id`<br/>*string*                 | The ID of the VPC.                                                                                                                                                                                                  |
| `name`<br/>*string*               | The name of the VPC.                                                                                                                                                                                                |
| `ownerId`<br/>*string*            | Amazon account id of organization owner.                                                                                                                                                     |
| `instanceTenancy`<br/>*string*    | The tenancy options for instances launched into the VPC (default, dedicated, host), set as shared by default.                                                                                                                                                                           |
| `cidrBlock`<br/>*string*          | IPv4 network range for the VPC in CIDR notation.                                                                                                                                                                                                       |
| `dhcpOptionsId`<br/>*string*      | The DHCP options set applied to the network configuration of the VPC.                                                                                                                                                                                      |
| `state`<br/>*string*              | The state of VPC access (pending, available).                                                                                                                                                                                   |
| `isDefault`<br/>*boolean*         | Whether or not the VPC is the default environment VPC.            |
