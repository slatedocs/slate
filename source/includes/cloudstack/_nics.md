### NICs


<!-------------------- LIST NICS -------------------->


#### List NICs


```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/nics"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [{
    "id": "fff1f45a-8350-4c87-be43-947b96d01ebd",
    "name": "NIC-0",
    "ipAddress": "10.169.253.165",
    "isDefault": true,
    "networkId": "d2243d4c-0dd8-4f8c-9ab4-4b1d285d5642",
    "networkName": "Backend",
    "gateway": "10.169.253.1",
    "netmask": "255.255.255.0",
    "instanceId": "b6145e8b-abd3ta-456c-832c-f3db86a6acfe",
    "vpcId": "5aa9f5d7-55a9-43bf-bd2c-78a6bae1b267",
    "vpcName": "default-vpc",
    "secondaryIps": [
      {
        "id": "9c28e297-5d23-41a3-a167-34dc24f1df19",
        "ipAddress": "10.169.253.124"
      }
    ]
  }],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET <a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/nics</code>

Retrieve a list of all NICs.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the NIC
`name`<br/>*string* | The name of the NIC
`ipAddress`<br/>*string* | The IP address of the NIC
`isDefault`<br/>*string* | true if it's the default NIC of the [instance](#cloudstack-instances) (i.e. it will be the private IP on the instance)
`networkId`<br/>*UUID* | The id of the [network](#cloudstack-networks) of the NIC
`networkName`<br/>*string* | The name of the [network](#cloudstack-networks) of the NIC
`gateway`<br/>*string* | The gateway of the [network](#cloudstack-networks) associated with the NIC
`netmask`<br/>*string* | The netmask of the [network](#cloudstack-networks) associated with the NIC
`instanceId`<br/>*string* | The id of the instance associated with the NIC
`vpcId`<br/>*string* | The id of the [VPC](#cloudstack-vpcs) associated with the NIC
`vpcName`<br/>*string* | The name of the [VPC](#cloudstack-vpcs) associated with the NIC
`secondaryIps`<br/>*SecondaryIP* | The list of secondary IPs of the NIC<br/>*includes:* `id`, `ipAddress`

Query Parameters | &nbsp;
---------- | -----
`instance_id`<br/>*UUID* | Filter the list to only retrieve the NICs of a specific [instance](#cloudstack-instances)
`network_id`<br/>*UUID* | Filter the list to only retrieve the NICs of a specific [network](#cloudstack-networks)


<!-------------------- RETRIEVE A NIC -------------------->


#### Retrieve a NIC


```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/nics/fff1f45a-8350-4c87-be43-947b96d01ebd"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "fff1f45a-8350-4c87-be43-947b96d01ebd",
    "name": "NIC-0",
    "ipAddress": "10.169.253.165",
    "isDefault": true,
    "networkId": "d2243d4c-0dd8-4f8c-9ab4-4b1d285d5642",
    "networkName": "Backend",
    "gateway": "10.169.253.1",
    "netmask": "255.255.255.0",
    "instanceId": "b6145e8b-abd3ta-456c-832c-f3db86a6acfe",
    "vpcId": "5aa9f5d7-55a9-43bf-bd2c-78a6bae1b267",
    "vpcName": "default-vpc",
    "secondaryIps": [
      {
        "id": "9c28e297-5d23-41a3-a167-34dc24f1df19",
        "ipAddress": "10.169.253.124"
      }
    ]
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/nics/:id</code>

Retrieve an existing NIC.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the NIC
`name`<br/>*string* | The name of the NIC
`ipAddress`<br/>*string* | The IP address of the NIC
`isDefault`<br/>*string* | true if it's the default NIC of the [instance](#cloudstack-instances) (i.e. it will be the private IP on the instance)
`networkId`<br/>*UUID* | The id of the [network](#cloudstack-networks) of the NIC
`networkName`<br/>*string* | The name of the [network](#cloudstack-networks) of the NIC
`gateway`<br/>*string* | The gateway of the [network](#cloudstack-networks) associated with the NIC
`netmask`<br/>*string* | The netmask of the [network](#cloudstack-networks) associated with the NIC
`instanceId`<br/>*string* | The id of the [instance](#cloudstack-instances) associated with the NIC
`vpcId`<br/>*string* | The id of the [VPC](#cloudstack-vpcs) associated with the NIC
`vpcName`<br/>*string* | The name of the [VPC](#cloudstack-vpcs) associated with the NIC
`secondaryIps`<br/>*SecondaryIP* | The list of secondary IPs of the NIC<br/>*includes:* `id`, `ipAddress`


<!-------------------- CREATE A NIC -------------------->


#### Create a NIC


```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/nics"
```
> Request body example:

```json
{
  "networkId": "d67e986d-fe04-4827-836e-1697ede8ed30",
  "instanceId": "96330eea-4424-46ca-825c-82fdd051d8c3"
}
```


<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/nics</code>

Create a NIC for an [instance](#cloudstack-instances) in a specific network. You can only have one NIC per [network](#cloudstack-networks).

Required | &nbsp;
------ | -----------
`networkId`<br/>*string* | The id of the [network](#cloudstack-networks) where to create the NIC
`instanceId`<br/>*string* | The id of the [instance](#cloudstack-instances) where to attach the NIC


<!-------------------- DELETE A NIC -------------------->


#### Delete a NIC


```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/nics/63ef1efe-225f-4e05-bc79-b3e457a041e2"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/nics/:id</code>

Delete an existing NIC. The NIC you're trying to delete must not be the default one and must not be associated to a load balancing rule and/or a port forwarding rule.


<!-------------------- SET A NIC AS DEFAULT -------------------->


#### Set a NIC as default


```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/nics/63ef1efe-225f-4e05-bc79-b3e457a041e2?operation=setDefault"
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/nics/:id?operation=setDefault</code>

Set an existing NIC as the default NIC of an [instance](#cloudstack-instances).
