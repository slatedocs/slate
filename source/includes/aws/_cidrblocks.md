### CIDRs

A Classless Inter-Domain Routing (CIDR) block has to be associated to a VPC. Therefore, you need to provide the VPC ID in order to fetch the CIDR blocks.

<!-------------------- LIST CIDRs BY VPC -------------------->

#### Get CIDRs by VPC

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-env/cidrblocks?vpcId=:vpc_id"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "172.31.0.0/16",
      "state": "ASSOCIATED",
      "addressType": "IPv4"
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/cidrblocks</code>

| Required Query Parameters | &nbsp;                           |
| ------------------------- | -------------------------------- |
| `vpcId`<br/>_string_      | Get CIDR block by VPC identifier |

Retrieve a list of all CIDR block attached to the VPC.

| Attributes                 | &nbsp;                                                                                                                      |
| -------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `id`<br/>_string_          | The CIDR Block                                                                                                              |
| `state`<br/>_string_       | The state of the CIDR. The possible values include: ASSOCIATING, ASSOCIATED, DISASSOCIATING, DISASSOCIATED, FAILING, FAILED |
| `addressType`<br/>_string_ | The type of Address. The possible values include: IPv4                                                     |