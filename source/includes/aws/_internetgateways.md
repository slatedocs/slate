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

<!-------------------- CREATE AN INTERNET GATEWAY -------------------->

#### Create an Internet Gateway
```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/aws-tesv/internetgateways?operation=create"
```
> Request body example to create an internet gateway:

```json
{
  "name": "igw-root-guthc",
  "vpcId": "vpc-0094a0760c22437ec"
}
```

> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/internetgateways</code>

Create a new internet gateway in a DETACHED state in a given [environment](#administration-environments).

| Optional                                           | &nbsp;                                |
|----------------------------------------------------|---------------------------------------|
| `name`<br/>*string*                                | The name of the internet gateway. Automatically generated if not provided.   |
| `vpcId`<br/>*string*                               | The ID of the VPC.   |


<aside class="notice">
If the VPC ID is provided, it'll attach the newly created Internet Gateway to the VPC.
</aside>

<aside class="notice">
There is a default limit (5) to the number of internet gateways per region.
</aside>

<!-------------------- ATTACH AN INTERNET GATEWAY -------------------->

#### Attach an Internet Gateway
```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/aws-tesv/internetgateways?operation=attach"
```
> Request body example to attach an internet gateway:

```json
{
  "id": "igw-09adee4bafdef2c31",
  "vpcId": "vpc-0094a0760c22437ec"
}
```

> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/internetgateways</code>

Attach an internet gateway to a VPC in a given [environment](#administration-environments).

| Required                                         | &nbsp;                                |
|--------------------------------------------------|---------------------------------------|
| `id`<br/>*string*                                | The ID of the internet gateway.       |
| `vpcId`<br/>*string*                             | The ID of the VPC.                    |

<aside class="notice">
A VPC can only have a single Internet Gateway attached at the same time.
</aside>

<!-------------------- DETACH AN INTERNET GATEWAY -------------------->

#### Detach an Internet Gateway
```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/aws-tesv/internetgateways?operation=detach"
```
> Request body example to detach an internet gateway:

```json
{
  "id": "igw-09adee4bafdef2c31",
  "vpcId": "vpc-0094a0760c22437ec"
}
```

> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/internetgateways</code>

Detach an internet gateway from a VPC in a given [environment](#administration-environments).

| Required                                         | &nbsp;                                |
|--------------------------------------------------|---------------------------------------|
| `id`<br/>*string*                                | The ID of the internet gateway.       |
| `vpcId`<br/>*string*                             | The ID of the VPC.                    |