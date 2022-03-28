### Elastic IPs

View and manage Elastic IPs.

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
   "data":[
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
   "metadata":{
      "recordCount":1
   }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/elasticips</code>

Retrieve a list of all elastic ips in a given [environment](#administration-environments).

| Attributes                        | &nbsp;                                                                                                                                                                                                                   |
|-----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `id`<br/>*string*                 | The ID of the Elastic IP.                                                                                                                                                                                                  |
| `name`<br/>*string*               | The name of the Elastic IP.                                                                                                                                                                                                |
| `associationId`<br/>*string*            | The ID of the association between the Elastic IP and instance.                                                                                                                                                   |
| `domain`<br/>*string*    | Indicates whether this Elastic IP address is for use with instances in EC2-Classic (standard) or instances in a VPC (vpc).                                                                                                                                                  |
| `instanceId`<br/>*string*          | The ID of the instance that the address is associated with (if any).                                                                                                                                                                     |
| `instanceName`<br/>*string*      | The name of the instance that the address is associated with (if any).                                                                                 |
| `networkBorderGroup`<br/>*string*              | The name of the unique set of Availability Zones, Local Zones, or Wavelength Zones from which AWS advertises IP addresses.                                                                                                                                                                                   |
| `networkInterfaceId`<br/>*boolean*         | The ID of the network interface.            |
| `privateIpAddress`<br/>*boolean*         | The private IP address associated with the Elastic IP address.            |
| `publicIp`<br/>*boolean*         | The Elastic IP address.            |
| `state`<br/>*boolean*         | The attachment state of the Elastic IP. Can be either Associated or Available.            |


<!-------------------- RETRIEVE AN ELASTIC IP -------------------->

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-env/elasticips/elasticip_id"
```
> The above command returns a JSON structured like this:

```json
{
   "data":{
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
<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/elasticips/:id</code>

Retrieve an elastic ip in a given [environment](#administration-environments).
| Attributes                        | &nbsp;                                                                                                                                                                                                                   |
|-----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `id`<br/>*string*                 | The ID of the Elastic IP.                                                                                                                                                                                                  |
| `name`<br/>*string*               | The name of the Elastic IP.                                                                                                                                                                                                |
| `associationId`<br/>*string*            | The ID of the association between the Elastic IP and instance.                                                                                                                                                   |
| `domain`<br/>*string*    | Indicates whether this Elastic IP address is for use with instances in EC2-Classic (standard) or instances in a VPC (vpc).                                                                                                                                                  |
| `instanceId`<br/>*string*          | The ID of the instance that the address is associated with (if any).                                                                                                                                                                     |
| `instanceName`<br/>*string*      | The name of the instance that the address is associated with (if any).                                                                                 |
| `networkBorderGroup`<br/>*string*              | The name of the unique set of Availability Zones, Local Zones, or Wavelength Zones from which AWS advertises IP addresses.                                                                                                                                                                                   |
| `networkInterfaceId`<br/>*boolean*         | The ID of the network interface.            |
| `privateIpAddress`<br/>*boolean*         | The private IP address associated with the Elastic IP address.            |
| `publicIp`<br/>*boolean*         | The Elastic IP address.            |
| `state`<br/>*boolean*         | The attachment state of the Elastic IP. Can be either Associated or Available.            |
