### Public IP addresses

Deploy and manage your public ip addresses.

<!-------------------- LIST PUBLIC IPS -------------------->

#### List public IP addresses

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/azure/example/publicipaddresses"

# The above command returns JSON structured like this:
```

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
`id` <br/>*string* | The id of the public IP address. This is a canonized id from azure which is the form of `/subscriptions/:subscriptionid/resourceGroups/:resourcegroup/providers/`Microsoft.Network/publicIPAddresses/:publicIpName
`name` <br/>*string* | The name of the public IP address
`state` <br/>*string* | The state of the public IP address. Possible state: `ATTACHED`, `DETACHED`
`ipAddress` <br/>*string* | The IP address of the public IP. If the public IP has never been associated before, then you won't have an ip address yet.
`region` <br/>*string* | The region where the public IP address is located
`sku`  <br /> *string* | The sku of the public IP
`domainName` <br/>*string* | The subdomain part of the fqdn. This is only present if one is defined.
`fqn` <br/>*string* | The fqdn which points to the public IP
`allocationMethod` <br/>*string* | Allocation method of the public IP address. Possible values: `DYNAMIC`, `STATIC`
`ipVersion` <br/>*string* |  IP version of the public IP address. Possible values: `IPV4`, `IPV6`

<!-------------------- RETRIEVE A PUBLIC IP -------------------->

#### Retrieve a public ip address

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/azure/example/publicipaddresses/subscriptions/subscriptionId/resourceGroups/cmc-example/providers/Microsoft.Network/publicIPAddresses/some-public-ip"

# The above command returns JSON structured like this:
```

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
    "allocationMethod": "DYNAMIC",
    "ipVersion": "IPV4"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/publicipaddresses/:id</code>

Retrieve a public IP address in a given [environment](#administration-environments)

Attributes | &nbsp;
------- | -----------
`id` <br/>*string* | The id of the public IP address. This is a canonized id from azure which is the form of `/subscriptions/:subscriptionid/resourceGroups/:resourcegroup/providers/`Microsoft.Network/publicIPAddresses/:publicIpName
`name` <br/>*string* | The name of the public IP address
`state` <br/>*string* | The state of the public IP address. Possible state: `ATTACHED`, `DETACHED`
`ipAddress` <br/>*string* | The IP address of the public IP. If the public IP has never been associated before, then you won't have an ip address yet.
`region` <br/>*string* | The region where the public IP address is located
`sku`  <br /> *string* | The sku of the public IP
`domainName` <br/>*string* | The subdomain part of the fqdn. This is only present if one is defined.
`fqn` <br/>*string* | The fqdn which points to the public IP
`allocationMethod` <br/>*string* | Allocation method of the public IP address. Possible values: `DYNAMIC`, `STATIC`
`ipVersion` <br/>*string* |  IP version of the public IP address. Possible values: `IPV4`, `IPV6`