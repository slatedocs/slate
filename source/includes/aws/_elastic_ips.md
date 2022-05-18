### Elastic IPs

An Elastic IP address is a static public IPv4 formatted address designed to be dynamically associated with an instance.
By using an Elastic IP address, upon failure of its associated instance, the address will be remapped to a new instance
within your account.

<!-------------------- LIST Elastic IPs -------------------->

#### List Elastic IPs

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-env/elasticips"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "eipalloc-0d3879198406bdbd7",
      "name": "eipalloc-0d3879198406bdbd7",
      "associationId": "eipassoc-0c6e3aecfb15418c2",
      "domain": "VPC",
      "instanceId": "i-006d9b167ae39a16f",
      "instanceName": "instance",
      "networkBorderGroup": "us-east-1",
      "networkInterfaceId": "eni-0695dc329b83787e2",
      "privateIpAddress": "10.0.0.172",
      "publicIp": "44.194.69.77",
      "state": "ASSOCIATED"
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>
/<a href="#administration-environments">:environment_name</a>/elasticips</code>

Retrieve a list of all elastic ips in a given [environment](#administration-environments).

| Attributes                         | &nbsp;                                                                                                                     |
|------------------------------------|----------------------------------------------------------------------------------------------------------------------------|
| `id`<br/>_string_                  | The ID of the Elastic IP.                                                                                                  |
| `name`<br/>_string_                | The name of the Elastic IP.                                                                                                |
| `associationId`<br/>_string_       | The ID of the association between the Elastic IP and instance.                                                             |
| `domain`<br/>_string_              | Indicates whether this Elastic IP address is for use with instances in EC2-Classic (standard) or instances in a VPC (vpc). |
| `instanceId`<br/>_string_          | The ID of the instance that the address is associated with (if any).                                                       |
| `instanceName`<br/>_string_        | The name of the instance that the address is associated with (if any).                                                     |
| `networkBorderGroup`<br/>_string_  | The name of the unique set of Availability Zones, Local Zones, or Wavelength Zones from which AWS advertises IP addresses. |
| `networkInterfaceId`<br/>_boolean_ | The ID of the network interface.                                                                                           |
| `privateIpAddress`<br/>_boolean_   | The private IP address associated with the Elastic IP address.                                                             |
| `publicIp`<br/>_boolean_           | The Elastic IP address.                                                                                                    |
| `state`<br/>_boolean_              | The attachment state of the Elastic IP. Can be either Associated or Available.                                             |


<!-------------------- RETRIEVE AN ELASTIC IP -------------------->

#### Retrieve an Elastic IP

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-env/elasticips/elasticip_id"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "eipalloc-0d3879198406bdbd7",
    "name": "eipalloc-0d3879198406bdbd7",
    "associationId": "eipassoc-0c6e3aecfb15418c2",
    "domain": "VPC",
    "instanceId": "i-006d9b167ae39a16f",
    "instanceName": "instance",
    "networkBorderGroup": "us-east-1",
    "networkInterfaceId": "eni-0695dc329b83787e2",
    "privateIpAddress": "10.0.0.172",
    "publicIp": "44.194.69.77",
    "state": "ASSOCIATED"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>
/<a href="#administration-environments">:environment_name</a>/elasticips/:id</code>

Retrieve an elastic ip in a given [environment](#administration-environments).

| Attributes                         | &nbsp;                                                                                                                     |
|------------------------------------|----------------------------------------------------------------------------------------------------------------------------|
| `id`<br/>_string_                  | The ID of the Elastic IP.                                                                                                  |
| `name`<br/>_string_                | The name of the Elastic IP.                                                                                                |
| `associationId`<br/>_string_       | The ID of the association between the Elastic IP and instance.                                                             |
| `domain`<br/>_string_              | Indicates whether this Elastic IP address is for use with instances in EC2-Classic (standard) or instances in a VPC (vpc). |
| `instanceId`<br/>_string_          | The ID of the instance that the address is associated with (if any).                                                       |
| `instanceName`<br/>_string_        | The name of the instance that the address is associated with (if any).                                                     |
| `networkBorderGroup`<br/>_string_  | The name of the unique set of Availability Zones, Local Zones, or Wavelength Zones from which AWS advertises IP addresses. |
| `networkInterfaceId`<br/>_boolean_ | The ID of the network interface.                                                                                           |
| `privateIpAddress`<br/>_boolean_   | The private IP address associated with the Elastic IP address.                                                             |
| `publicIp`<br/>_boolean_           | The Elastic IP address.                                                                                                    |
| `state`<br/>_boolean_              | The attachment state of the Elastic IP. Can be either Associated or Available.                                             |


<!-------------------- ALLOCATE AN ELASTIC IP -------------------->
#### Allocate an Elastic IP


```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws-tesv/test/elasticips?operation=allocate"
```

> Request body to allocate an Elastic IP:

```json
{
  "name": "eip-rbensariro-oxrgp",
  "networkBorderGroup": "us-east-1",
  "instanceId": "i-00b2dcf0e059a2f1e"
}
```
> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```
<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/elasticips?operation=allocate</code>

Allocate an Elastic IP to a given environment [environment](#administration-environments).

| Attributes                        | &nbsp;                                                                                                                                                                                      |
|-----------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `name`<br/>_string_               | The name of the Elastic IP.                                                                                                                                                                 |
| `networkBorderGroup`<br/>_string_ | The AWS network border group of the Elastic IP.Could be a region, an availability zone, local zone or wavelength zone.                                                                      |
| `instanceId`<br/>_string_         | The ID of the instance that the newly allocated Elastic IP will be associated to. This attribute is optional. The instance needs to be in a non-terminating state and possess no public IP. |


<!-------------------- ASSOCIATE AN ELASTIC IP -------------------->

#### Associate an Elastic IP

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws-tesv/test/elasticips/eipalloc-0b1822bb64a812884?operation=associate"
```

> Request body to associate an Elastic IP:

```json
{
  "instanceId": "i-00b2dcf0e059a2f1e"
}
```

> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>
/<a href="#administration-environments">:environment_name</a>/elasticips/:id?operation=associate</code>

Associate an Elastic IP to an Instance in a given [environment](#administration-environments).

| Attributes                | &nbsp;                                                 |
|---------------------------|--------------------------------------------------------|
| `instanceId`<br/>_string_ | The ID of the Instance to associate the Elastic IP to. |

Note: A Virtual Private Cloud has to be configured on the Instance, else this operation will return an error.

<!-------------------- DISASSOCIATE AN ELASTIC IP -------------------->

#### Disassociate an Elastic IP

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/aws-tesv/elasticips/eipalloc-0576a190ce3b575e3?operation=disassociate"
```

> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>
/<a href="#administration-environments">:environment_name</a>/elasticips/:id?operation=disassociate</code>

Disassociate an elastic IP from an Instance in a given [environment](#administration-environments).

<!-------------------- RELEASE AN ELASTIC IP -------------------->

#### Release an Elastic IP

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/aws-tesv/elasticips/eipalloc-0576a190ce3b575e3?operation=release"
```

> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>
/<a href="#administration-environments">:environment_name</a>/elasticips/:id?operation=release</code>

Release an elastic IP in a given [environment](#administration-environments).

Note: The release operation also disassociate the elastic IP if it is associated to an Instance.