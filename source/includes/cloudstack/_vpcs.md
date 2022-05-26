### VPCs

A Virtual Private Cloud (VPC) is a logically isolated section of CloudMC, where you can build a multi-network application architecture.

<!-------------------- LIST VPCS -------------------->


#### List VPCs

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/vpcs"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [{
    "id": "9fe8e398-06d6-482c-8f55-b805bde4d3cc",
    "name": "MyVPC",
    "description": "Some VPC",
    "cidr": "10.155.24.0/22",
    "zoneId": "04afdbd1-e32d-4999-86d0-96703736dded",
    "zoneName": "QC-1",
    "state": "Enabled",
    "networkDomain": "hello.world",
    "vpcOfferingId": "21a40b85-5fa9-440f-ab77-5e560073b584",
    "requiresUpgrade": false,
    "sourceNatIp": "172.31.3.253",
    "vpnStatus": "Disabled"
  }],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpcs</code>

Retrieve a list of all VPCs of an [environment](#administration-environments).

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the VPC
`name`<br/>*string* | The name of the VPC
`description`<br/>*string* | The description of the VPC
`cidr`<br/>*string* | The CIDR of a VPC
`zoneId`<br/>*string* | The id of the [zone](#cloudstack-zones) where the VPC was created
`zoneName`<br/>*string* | The name of the [zone](#cloudstack-zones) where the VPC was created
`state`<br/>*string* | The state of the VPC
`networkDomain`<br/>*string* | A custom DNS suffix at the level of a network
`requiresUpgrade`<br/>*string* | true if the VPC needs to be upgraded
`sourceNatIp`<br/>*string* | The source NAT IP of the VPC
`vpnStatus`<br/>*string* | The status of the [VPN](#cloudstack-remote-access-vpns). The status can be `ENABLED` or `DISABLED`


<!-------------------- RETRIEVE A VPC -------------------->


#### Retrieve a VPC

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/vpcs/ad5bcae8-ee8b-4ee8-a7a4-381c25444b8e"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "9fe8e398-06d6-482c-8f55-b805bde4d3cc",
    "name": "MyVPC",
    "description": "Some VPC",
    "cidr": "10.155.24.0/22",
    "zoneId": "04afdbd1-e32d-4999-86d0-96703736dded",
    "zoneName": "QC-1",
    "state": "Enabled",
    "networkDomain": "hello.world",
    "vpcOfferingId": "21a40b85-5fa9-440f-ab77-5e560073b584",
    "requiresUpgrade": false,
    "sourceNatIp": "172.31.3.253",
    "vpnStatus": "Disabled"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpcs/:id</code>

Retrieve information about a VPC.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the VPC
`name`<br/>*string* | The name of the VPC
`description`<br/>*string* | The description of the VPC
`cidr`<br/>*string* | The CIDR of a VPC
`zoneId`<br/>*string* | The id of the [zone](#cloudstack-zones) where the VPC was created
`zoneName`<br/>*string* | The name of the [zone](#cloudstack-zones) where the VPC was created
`state`<br/>*string* | The state of the VPC
`networkDomain`<br/>*string* | A custom DNS suffix at the level of a network
`requiresUpgrade`<br/>*string* | true if the VPC needs to be upgraded
`sourceNatIp`<br/>*string* | The source NAT IP of the VPC
`vpnStatus`<br/>*string* | The status of the [VPN](#cloudstack-remote-access-vpns). The status can be `ENABLED` or `DISABLED`


<!-------------------- CREATE A VPC -------------------->


#### Create a VPC


```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/vpcs"
```
> Request body example:

```json
{
  "name": "my_vpc",
  "description": "My prod VPC",
  "vpcOfferingId": "21a40b85-5fa9-440f-ab77-5e560073b584",
  "networkDomain": "hello.world"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpcs</code>

Create a VPC in an [environment](#administration-environments).

Required | &nbsp;
------ | -----------
`name`<br/>*string* | The name of the new VPC
`description`<br/>*string* | The description of the new VPC
`vpcOfferingId`<br/>*UUID* | The id of the [VPC offering](#cloudstack-vpc-offerings) to use for the new VPC

Optional | &nbsp;
------ | -----------
`networkDomain`<br/>*string* | A custom DNS suffix at the level of a network


<!-------------------- UPDATE A VPC -------------------->


#### Update a VPC


```shell
curl -X PUT \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/vpcs/d77e1ab1-0320-4504-83c5-e78b431c7577"
```
> Request body example:

```json
{
  "name": "my_updated_vpc",
  "description": "My prod VPC"
}
```

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpcs</code>

Update an existing VPC in your [environment](#administration-environments).

Optional | &nbsp;
------ | ---- | -----------
`name`<br/>*string* | The new name of the VPC
`description`<br/>*string* | The new description of the VPC


<!-------------------- DELETE A VPC -------------------->


#### Destroy a VPC


```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/vpcs/ad5bcae8-ee8b-4ee8-a7a4-381c25444b8e"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpcs/:id</code>

Destroy an existing VPC. To delete a VPC, you must first delete all the [networks](#cloudstack-networks) in the VPC.

<!-------------------- RESTART A VPC -------------------->


#### Restart a VPC


```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/vpcs/ad5bcae8-ee8b-4ee8-a7a4-381c25444b8e?operation=restart"
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpcs/:id?operation=restart</code>

Restart the router of a VPC.
