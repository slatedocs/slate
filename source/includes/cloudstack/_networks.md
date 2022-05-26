### Networks

A network is an isolated network with its own VLANs and CIDR list, where you can place groups of resources, such as [instances](#cloudstack-instances). They can exist as VPC subnets, or as simple isolated networks, provided the appropriate network offerings exist.

<!-------------------- LIST NETWORK -------------------->


#### List networks

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/networks"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [{
    "id": "8ef7539c-c9ba-49f3-a484-a08f4ffb2234",
    "name": "Frontend",
    "description": "default network",
    "vpcId": "12b8c150-b444-482a-8411-c08eaccb0a3b",
    "vpcName": "SomeVPC",
    "zoneId": "04afdbd1-e32d-4999-86d0-96703736dded",
    "zoneName": "QC-1",
    "cidr": "10.169.254.0/24",
    "gateway": "10.169.254.1",
    "netmask": "255.255.255.0",
    "networkAclId": "9ba3ec65-2e1d-11e4-8e05-42a29a39fc92",
    "networkAclName": "default_allow",
    "networkOfferingId": "9593f0df-573a-43c4-a107-a5c704a7cfee",
    "networkOfferingName": "Load Balanced Network",
    "networkOfferingDescription": "Offering for Isolated Vpc networks with Source Nat service enabled",
    "state": "Implemented"
  }],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networks</code>

Retrieve a list of all networks of an [environment](#administration-environments).

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the network
`name`<br/>*string* | The name of the network
`description`<br/>*string* | The description of the network
`vpcId`<br/>*UUID* | The id of the [VPC](#cloudstack-vpcs) where the network was created
`vpcName`<br/>*string* | The name of the [VPC](#cloudstack-vpcs) where the network was created
`zoneId`<br/>*string* | The id of the [zone](#cloudstack-zones) where the network was created
`zoneName`<br/>*string* | The name of the [zone](#cloudstack-zones) where the network was created
`cidr`<br/>*string* | The cidr of the network
`gateway`<br/>*string* | The gateway of the network
`netmask`<br/>*string* | The netmask of the network
`networkAclId`<br/>*UUID* | The id of the [network ACL](#cloudstack-network-acls) of the network
`networkAclName`<br/>*string* | The name of the [network ACL](#cloudstack-network-acls) of the network
`networkOfferingId`<br/>*UUID* | The id of the [network offering](#cloudstack-network-offerings) of the network
`networkOfferingName`<br/>*string* | The name of the [network offering](#cloudstack-network-offerings) of the network
`networkOfferingDescription`<br/>*string* | The description of the [network offering](#cloudstack-network-offerings) of the network
`state`<br/>*string* | The state of the network. `Allocated` if no instances where created in the network yet, `Implemented` otherwise.

Query Parameters | &nbsp;
---------- | -----
`vpc_id`<br/>*UUID* | Filter the list to only retrieve the networks of a [VPC](#cloudstack-vpcs)
`zone_id`<br/>*UUID* | Filter the list to only retrieve the networks in a specific [zone](#cloudstack-zones)


<!-------------------- RETRIEVE A NETWORK -------------------->


#### Retrieve a network

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/networks/ad5bcae8-ee8b-4ee8-a7a4-381c25444b8e"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "8ef7539c-c9ba-49f3-a484-a08f4ffb2234",
    "name": "Frontend",
    "description": "default network",
    "vpcId": "12b8c150-b444-482a-8411-c08eaccb0a3b",
    "vpcName": "SomeVPC",
    "zoneId": "04afdbd1-e32d-4999-86d0-96703736dded",
    "zoneName": "QC-1",
    "cidr": "10.169.254.0/24",
    "gateway": "10.169.254.1",
    "netmask": "255.255.255.0",
    "networkAclId": "9ba3ec65-2e1d-11e4-8e05-42a29a39fc92",
    "networkAclName": "default_allow",
    "networkOfferingId": "9593f0df-573a-43c4-a107-a5c704a7cfee",
    "networkOfferingName": "Load Balanced Network",
    "networkOfferingDescription": "Offering for Isolated Vpc networks with Source Nat service enabled",
    "state": "Implemented"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networks/:id</code>

Retrieve information about a network.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the network
`name`<br/>*string* | The name of the network
`description`<br/>*string* | The description of the network
`vpcId`<br/>*UUID* | The id of the [VPC](#cloudstack-vpcs) where the network was created
`vpcName`<br/>*string* | The name of the [VPC](#cloudstack-vpcs) where the network was created
`zoneId`<br/>*string* | The id of the [zone](#cloudstack-zones) where the network was created
`zoneName`<br/>*string* | The name of the [zone](#cloudstack-zones) where the network was created
`cidr`<br/>*string* | The cidr of the network
`gateway`<br/>*string* | The gateway of the network
`netmask`<br/>*string* | The netmask of the network
`networkAclId`<br/>*UUID* | The id of the [network ACL](#cloudstack-network-acls) of the network
`networkAclName`<br/>*string* | The name of the [network ACL](#cloudstack-network-acls) of the network
`networkOfferingId`<br/>*UUID* | The id of the [network offering](#cloudstack-network-offerings) of the network
`networkOfferingName`<br/>*string* | The name of the [network offering](#cloudstack-network-offerings) of the network
`networkOfferingDescription`<br/>*string* | The description of the [network offering](#cloudstack-network-offerings) of the network
`state`<br/>*string* | The state of the network. `Allocated` if no instances where created in the network yet, `Implemented` otherwise.


<!-------------------- CREATE A NETWORK -------------------->


#### Create a network


```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/networks"
```
> Request body example:

```json
{
  "name": "my_network",
  "description": "My production network",
  "vpcId": "b1932c7c-0b85-450f-92b9-bfdeb3e80804",
  "networkOfferingId": "c5d4ffcd-56e2-407a-8b4d-06082b7365c4",
  "networkAclId": "9ba3ec65-2e1d-11e4-8e05-42a29a39fc92"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networks</code>

Create a network in an [environment](#administration-environments).

If the network offering is a VPC subnet offering (indicated by the `vpcOnly` flag on the offering), the vpcId and networkAclId are required fields.

Required                       | &nbsp;
------------------------------ | ------
`name`<br/>*string*            | The name of the new network
`description`<br/>*string*     | The description of the new network
`networkOfferingId`<br/>*UUID* | The id of the [network offering](#cloudstack-network-offerings) to use for the network

Required (if VPC subnet)  | &nbsp;
------------------------- | ------
`vpcId`<br/>*UUID*        | The id of the VPC where to create the network
`networkAclId`<br/>*UUID* | The id of the [network ACL](#cloudstack-network-acls) to use for the network

For isolated networks  | &nbsp;
-----------------------|-------
`netmask`<br/>*string* | The netmask to use for this network. e.g. 255.255.255.0
`gateway`<br/>*string* | The network's gateway. e.g. 10.0.0.1

<aside class="notice">
  Note that netmask and gateway are optional, but they must either both be omitted, or both be provided.
</aside>

<!-------------------- UPDATE A NETWORK -------------------->

#### Update a network


```shell
curl -X PUT \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/networks/9572d2ea-a60d-478a-a75e-8ed31f2641f1"
```
> Request body example:

```json
{
  "name": "my_updated_network",
  "description": "My updated production network"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networks/:id</code>

Update an existing network in an [environment](#administration-environments).

Required | &nbsp;
------ | -----------
`name`<br/>*string* | The updated name of the network
`description`<br/>*string* | The updated description of the network


<!-------------------- DELETE A NETWORK -------------------->


#### Delete a network


```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/networks/9572d2ea-a60d-478a-a75e-8ed31f2641f1"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networks/:id</code>

Delete an existing network in an [environment](#administration-environments) To delete a network, you must first delete all the [instances](#cloudstack-instances) in the network.


<!-------------------- REPLACE THE NETWORK ACL OF A NETWORK -------------------->


#### Replace the network ACL


```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/networks/9572d2ea-a60d-478a-a75e-8ed31f2641f1?operation=replace"
```
> Request body example:

```json
{
  "name": "my_updated_network",
  "description": "My updated production network"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networks/:id?operation=replace</code>

Replace the [network ACL](#cloudstack-network-acls) for a VPC subnet.
<aside class="caution">
  This operation is not allowed on isolated networks.
</aside>

Required | &nbsp;
------ | -----------
`networkAclId`<br/>*string* | The id of the [network ACL](#cloudstack-network-acls) to use for the network
