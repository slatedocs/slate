### Internet Gateways

An internet gateway is a VPC child component that allows communication between your VPC and the internet.
An internet gateway enables resources in your public subnets to connect to the internet if the resource has a public IPv4 address or an IPv6 address.

<!-------------------- LIST INTERNET GATEWAYS -------------------->

#### List Internet Gateways

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-env/internetgateways"
```
> The above command returns a JSON structured like this:
```json
{
    "data": [
        {
            "id": "igw-03d0a0c6cb0d12279",
            "name": "my-internet-getaway",
            "state": "ATTACHED",
            "vpcId": "vpc-03326d9953f72ec19"
        },
        {
            "id": "igw-06d73b330ef63d750",
            "name": "my-internet-gateway",
            "state": "ATTACHED",
            "vpcId": "vpc-0094a0760c22437ec"
        },
        {
            "id": "igw-077302734797e7b3e",
            "name": "project-igw",
            "state": "ATTACHED",
            "vpcId": "vpc-0d9134bbb657cc1e3"
        },
        {
            "id": "igw-09f61d7c642156d6e",
            "name": "igw-09f61d7c642156d6e",
            "state": "DETACHED"
        }
    ],
    "metadata": {
        "recordCount": 4
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/internetgateways</code>

Optional Query Parameters | &nbsp;
---------- | -----------
`vpcId`<br/>*string* | Filter Internet Gateways by VPC Identifier

Retrieve a list of all internet gateways.

| Attributes                        | &nbsp;                                                                                                                                                                                                                   |
|-----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `id`<br/>*string*                 | The ID of the Internet Gateway.                                                                                                                                                                                                  |
| `name`<br/>*string*               | The name of the Internet Gateway, which is derived from a Tag with the Name key.                                                                                                                                                                                                |
| `state`<br/>*string*              | The state of the Internet Gateway depending whether or not it is attached or not to a VPC. The possible values include: ATTACHED, DETACHED.                                                                                                                                                  |
| `vpcId`<br/>*string*              | The identifier of the VPC, if attached. Else this field is not returned                                                                                                                                                                         |

<!-------------------- RETRIEVE INTERNET GATEWAY BY ID-------------------->

#### Retrieve an Internet Gateway

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test/internetgateways/igw-03d0a0c6cb0d12279"
```
> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": "igw-03d0a0c6cb0d12279",
        "name": "my-internet-getaway",
        "state": "ATTACHED",
        "vpcId": "vpc-03326d9953f72ec19"
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/internetgateways/:id</code>

Retrieve an internet gateway in a given [environment](#administration-environments).

| Attributes                        | &nbsp;                                                                                                                                                                                                                   |
|-----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `id`<br/>*string*                 | The ID of the Internet Gateway.                                                                                                                                                                                                  |
| `name`<br/>*string*               | The name of the Internet Gateway, which is derived from a Tag with the Name key.                                                                                                                                                                                                |
| `state`<br/>*string*              | The state of the Internet Gateway depending whether or not it is attached or not to a VPC. The possible values include: ATTACHED, DETACHED.                                                                                                                                                  |
| `vpcId`<br/>*string*              | The identifier of the VPC, if attached. Else this field is not returned.                                                                                                                                                                         |