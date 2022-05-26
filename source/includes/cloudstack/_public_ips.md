### Public IPs

#### List public IPs

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/publicipaddresses"
```
> The above command returns a JSON structured like this:

```json
{
   "data": [
      {
         "id": "0ed72307-e33d-4d41-90b7-7d2b4f0d1ae0",
         "instances": [
            {
               "id": "986cfea3-4a94-407d-b915-eb2d49e4323f",
               "name": "i-pdube-F49"
            }
         ],
         "ipAddress": "69.196.164.98",
         "networkId": "def89cb6-f897-435a-ad7f-6b2d05ab11e6",
         "networkName": "web",
         "purposes": [
            "PORT_FORWARDING"
         ],
         "state": "Allocated",
         "vpcId": "0687f5ce-89f9-47c8-9f58-c522455d56eb",
         "vpcName": "secondary",
         "zoneId": "ea901007-056b-4c50-bb3a-2dd635fce2ab",
         "zoneName": "ON-1"
      },
      {
         "id": "10001e7d-b4ef-489b-836e-0619a383bc8d",
         "ipAddress": "208.80.152.201",
         "purposes": [
            "SOURCE_NAT"
         ],
         "state": "Allocated",
         "vpcId": "0687f5ce-89f9-47c8-9f58-c522455d56eb",
         "vpcName": "primary",
         "zoneId": "ea901007-056b-4c50-bb3a-2dd635fce2ab",
         "zoneName": "ON-1"
      }
   ],
   "metadata": {
      "recordCount": 2
   }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/publicipaddresses</code>

List allocated public IP addresses.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the public IP
`instances`<br/>*Array[[Instance](#cloudstack-instances)]* | The associated [instances](#cloudstack-instances) <br/>*includes*: `id`,`name`
`ipAddress`<br/>*string* | The IP address (e.g. 208.80.154.224)
`networkId`<br/>*UUID* | The associated [network](#cloudstack-networks) id
`networkName`<br/>*string* | The associated [network](#cloudstack-networks) name
`purposes`<br/>*Array[string]* | The list of purposes of the IP address.</br>*Possible values:* `STATIC_NAT`, `PORT_FORWARDING`, `LOAD_BALANCING`, `SOURCE_NAT` or `SOURCE_NAT` and `VPN`
`state`<br/>*string* | The state of the public IP
`vpcId`<br/>*UUID* | The id of the [VPC](#cloudstack-vpcs)
`vpcName`<br/>*string* | The name of the [VPC](#cloudstack-vpcs)
`zoneId`<br/>*UUID* | The id of the [zone](#cloudstack-zones)
`zoneName`<br/>*string* | The name of the [zone](#cloudstack-zones)

Query Parameters | &nbsp;
---------- | -----
`vpc_id`<br/>*UUID* | Filter the list to only retrieve the public IPs in a specific [VPC](#cloudstack-vpcs)
`instance_id`<br/>*UUID* | Filter the list to only retrieve the public IPs associated to a specific [instance](#cloudstack-instances)

#### Retrieve a public IP

```shell
curl -X GET -H "MC-Api-Key: your_api_key"
"https://cloudmc_endpoint/api/v2/services/compute-on/test_area/publicipaddresses/10001e7d-b4ef-489b-836e-0619a383bc8d"
```
> The above command returns a JSON structured like this:

```json
{
   "data": {
      "id": "10001e7d-b4ef-489b-836e-0619a383bc8d",
      "ipAddress": "208.80.152.201",
      "purposes": [
          "SOURCE_NAT"
      ],
      "state": "Allocated",
      "vpcId": "0687f5ce-89f9-47c8-9f58-c522455d56eb",
      "vpcName": "primary",
      "zoneId": "ea901007-056b-4c50-bb3a-2dd635fce2ab",
      "zoneName": "ON-1"
   }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/publicipaddresses/:id</code>

Retrieve a public IP address.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the public IP
`instances`<br/>*Array[[Instance](#cloudstack-instances)]* | The associated [instances](#cloudstack-instances) <br/>*includes*: `id`,`name`
`ipAddress`<br/>*string* | The IP address (e.g. 208.80.154.224)
`networkId`<br/>*UUID* | The associated [network](#cloudstack-networks) id
`networkName`<br/>*string* | The associated [network](#cloudstack-networks) name
`purposes`<br/>*Array[string]* | The list of purposes of the IP address.</br>*Possible values:* `STATIC_NAT`, `PORT_FORWARDING`, `LOAD_BALANCING`, `SOURCE_NAT` or `SOURCE_NAT` and `VPN`
`state`<br/>*string* | The state of the public IP
`vpcId`<br/>*UUID* | The id of the [VPC](#cloudstack-vpcs)
`vpcName`<br/>*string* | The name of the [VPC](#cloudstack-vpcs)
`zoneId`<br/>*UUID* | The id of the [zone](#cloudstack-zones)
`zoneName`<br/>*string* | The name of the [zone](#cloudstack-zones)

#### Acquire a public IP

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/publicipaddresses"
```
> Request body example:

```json
{
   "vpcId": "0687f5ce-89f9-47c8-9f58-c522455d56eb"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/publicipaddresses</code>

Acquire a public IP address for a [VPC](#cloudstack-vpcs).

Required | &nbsp;
---------- | -----
`vpcId`<br/>*UUID* | The id of the [VPC](#cloudstack-vpcs) where to acquire the public IP


#### Release a public IP

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/publicipaddresses/a723b2b1-e343-4ea1-afe0-bf345a99a92b"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/publicipaddresses/:id</code>

Release a public IP. When acquiring a public IP, you are not guaranteed to receive a previously owned public IP, so be careful when releasing public IPs.

#### Enable static NAT

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/publicipaddresses/a723b2b1-e343-4ea1-afe0-bf345a99a92b?operation=enableStaticNat"
```
> Request body example:

```json
{
   "privateIpId": "5e30609d-7098-4d93-8317-3ecfe316ed00"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/publicipaddresses/:id?operation=enableStaticNat</code>

Enable static NAT on a public IP address.

Required | &nbsp;
---------- | -----
`privateIpId`<br/>*string* | The private IP id of the [instance](#cloudstack-instances) which is to be available on that IP. It can also be done on a secondary IP id.

#### Disable static NAT

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/publicipaddresses/a723b2b1-e343-4ea1-afe0-bf345a99a92b?operation=disableStaticNat"

```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/publicipaddresses/:id?operation=disableStaticNat</code>

Disable static NAT on that public IP.
