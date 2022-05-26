### Public IP addresses

Deploy and manage your public ip addresses.

<!-------------------- LIST PUBLIC IPS -------------------->

#### List public IP addresses

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/azure/example/publicipaddresses"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "/subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Network/publicIPAddresses/some-public-ip",
      "name": "some-public-ip",
      "state": "DETACHED",
      "ipAddress": "52.122.12.1",
      "region": "eastus",
      "domainName": "somepublicip",
      "fqdn": "somepublicip.eastus.cloudapp.azure.com",
      "sku": "BASIC",
      "idleTimeout": 7,
      "allocationMethod": "DYNAMIC",
      "ipVersion": "IPV4"
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/publicipaddresses</code>

Retrieve a list of all public IP addresses in a given [environment](#administration-environments)

Attributes | &nbsp;
------- | -----------
`id` <br/>*string* | The id of the public IP address. This is a canonized id from azure which is the form of `/subscriptions/:subscriptionid/resourceGroups/:resourcegroup/providers/`Microsoft.Network/publicIPAddresses/:publicIpName.
`name` <br/>*string* | The name of the public IP address.
`state` <br/>*string* | The state of the public IP address. Possible state: `ATTACHED`, `DETACHED`, `UPDATING`, `DELETING`.
`ipAddress` <br/>*string* | The IP address of the public IP. If the public IP has never been associated before, then you won't have an ip address yet.
`region` <br/>*string* | The region where the public IP address is located.
`sku`  <br /> *string* | The sku of the public IP. Possible values: `BASIC`, `STANDARD`.
`domainName` <br/>*string* | The subdomain part of the fqdn. This is only present if one is defined.
`fqn` <br/>*string* | The fqdn which points to the public IP.
`idleTimeout` <br/>*integer* | The number of minutes for the idleTimeout. It can be between 4 and 30 minutes.
`allocationMethod` <br/>*string* | Allocation method of the public IP address. Possible values: `DYNAMIC`, `STATIC`.
`ipVersion` <br/>*string* |  IP version of the public IP address. Possible values: `IPV4`, `IPV6`.

<!-------------------- RETRIEVE A PUBLIC IP -------------------->

#### Retrieve a public ip address

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/azure/example/publicipaddresses/subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Network/publicIPAddresses/some-public-ip"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "/subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Network/publicIPAddresses/some-public-ip",
    "name": "some-public-ip",
    "state": "DETACHED",
    "ipAddress": "52.122.12.1",
    "region": "eastus",
    "domainName": "somepublicip",
    "fqdn": "somepublicip.eastus.cloudapp.azure.com",
    "sku": "BASIC",
    "idleTimeout": 7,
    "allocationMethod": "DYNAMIC",
    "ipVersion": "IPV4"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/publicipaddresses/:id</code>

Retrieve a public IP address in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id` <br/>*string* | The id of the public IP address. This is a canonized id from azure which is the form of `/subscriptions/:subscriptionid/resourceGroups/:resourcegroup/providers/`Microsoft.Network/publicIPAddresses/:publicIpName.
`name` <br/>*string* | The name of the public IP address.
`state` <br/>*string* | The state of the public IP address. Possible state: `ATTACHED`, `DETACHED`, `UPDATING`, `DELETING`.
`ipAddress` <br/>*string* | The IP address of the public IP. If the public IP has never been associated before, then you won't have an ip address yet.
`region` <br/>*string* | The region where the public IP address is located.
`sku`  <br /> *string* | The sku of the public IP. Possible values: `BASIC`, `STANDARD`.
`domainName` <br/>*string* | The subdomain part of the fqdn. This is only present if one is defined.
`fqn` <br/>*string* | The fqdn which points to the public IP.
`idleTimeout` <br/>*integer* | The number of minutes for the idleTimeout. It can be between 4 and 30 minutes.
`allocationMethod` <br/>*string* | Allocation method of the public IP address. Possible values: `DYNAMIC`, `STATIC`.
`ipVersion` <br/>*string* |  IP version of the public IP address. Possible values: `IPV4`, `IPV6`.

<!-------------------- CREATE A PUBLIC IP -------------------->

#### Create a public ip address

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body"
   "https://cloudmc_endpoint/api/v2/services/azure/example/publicipaddresses"
```
> Request body example:

```json
{
	"name":"samplePublicIP",
	"region" : "canadacentral",
	"sku": "BASIC",
	"allocationMethod" : "DYNAMIC",
	"idleTimeout" : 30,
	"domainName" : "samplePublicIP"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/publicipaddresses</code>

Create a public IP address in a given [environment](#administration-environments).

Required | &nbsp;
------- | -----------
`name` <br/>*string* | The name of the public IP address.
`region` <br/>*string* | The region where the public IP address is located.

Optional | &nbsp;
------- | -----------
`sku`  <br /> *string* | The sku of the public IP. Possible values: `BASIC`, `STANDARD`. Default value is `BASIC`.
`allocationMethod` <br/>*string* | Allocation method of the public IP address. Possible values: `DYNAMIC`, `STATIC`. Default value is `DYNAMIC` for SKU `BASIC`, and `STATIC` for SKU `STANDARD`.
`idleTimeout` <br/>*integer* | The number of minutes for the idleTimeout. It can be between 4 and 30 minutes. Default value is 4 minutes.
`domainName` <br/>*string* | The subdomain part of the fqdn.

<!-------------------- ASSOCIATE A PUBLIC IP -------------------->

#### Associate a public ip address

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body"
   "https://cloudmc_endpoint/api/v2/services/azure/example/publicipaddresses?operation=associate"
```
> Request body example:

```json
{
	"networkInterfaceId": "subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Network/networkInterfaces/nic68108672c3b"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/publicipaddresses?operation=associate</code>

Associate a public IP address in a given [environment](#administration-environments) to a network interface.

Required | &nbsp;
------- | -----------
`networkInterfaceId` <br/>*string* | Id of the network interface associated to an instance. Th network interface must be in the same region as the public IP address. 


<!-------------------- DELETE A PUBLIC IP -------------------->

#### Delete a public IP address

```shell 
curl -X DELETE \
  'http://cloudmc_endpoint/v1/services/azure/example/publicipaddresses/subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Network/publicIPAddresses/some-public-ip' \
  -H 'mc-api-key: your_api_key'
  ```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/publicipaddresses/:id</code>

Delete an existing public IP address.

<!-------------------- UPDATE A PUBLIC IP -------------------->

#### Update a public ip address

```shell
curl -X PUT \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body"
   "https://cloudmc_endpoint/api/v2/services/azure/example/publicipaddresses//subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Network/publicIPAddresses/some-public-ip"
```
> Request body example:

```json
{
	"allocationMethod" : "DYNAMIC",
	"idleTimeout" : 30,
	"domainName" : "samplePublicIP"
}
```

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/publicipaddresses/:id</code>

Update a public IP address in a given [environment](#administration-environments).

Attribute | &nbsp;
------- | -----------
`allocationMethod` <br/>*string* | Allocation method of the public IP address. Possible values: `DYNAMIC`, `STATIC`. Not providing it will keep the actual value. Cannot be change for Standard SKU public IP address.
`idleTimeout` <br/>*integer* | The number of minutes for the idleTimeout. It can be between 4 and 30 minutes. Not providing it will keep the actual value.
`domainName` <br/>*string* | The subdomain part of the fqdn. If it is empty or not provided, the entry will be removed from the DNS.
