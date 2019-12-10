### VPN tunnels

With Classic VPN, your on-premises hosts communicate through one or more IPsec VPN tunnels to Compute Engine Virtual Machine (VM) instances in your project's VPC networks.


<!-------------------- LIST VPN TUNNELS -------------------->

#### List VPN tunnels

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/vpngateways"

# The above command returns JSON structured like this:
```

```json
{
  "data": [
    {

    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpntunnels</code>

Retrieve a list of all VPN tunnels in a given [environment](#administration-environments)

Attributes | &nbsp;
------- | -----------
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`description`<br/>*string* | An optional description
`id`<br/>*UUID* | Unique identifier for this resource.
`name`<br/>*string* | The display name of the address.
`region`<br/>*string* | The URL of the region where the VPN tunnel is.
`status`<br/>*string* | The status of the VPN tunnel. One of the following: READY, CREATING, FAILED and DELETING.
`selfLink`<br/>*string* | Server-defined URL for the resource.

<!-------------------- RETRIEVE A VPN TUNNEL -------------------->

#### Retrieve a VPN tunnel

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/vpntunnels/3112849056897469664"

# The above command returns JSON structured like this:
```

```json
{
  "data": 
  {

  }
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpntunnels/:id</code>

Retrieve a VPN tunnel in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`description`<br/>*string* | An optional description
`id`<br/>*UUID* | Unique identifier for this resource.
`name`<br/>*string* | The display name of the address.
`region`<br/>*string* | The URL of the region where the VPN tunnel is.
`status`<br/>*string* | The status of the VPN tunnel. One of the following: READY, CREATING, FAILED and DELETING.
`selfLink`<br/>*string* | Server-defined URL for the resource.

<!-------------------- CREATE A VPN TUNNEL -------------------->

#### Create a VPN tunnel

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/vpntunnels"

# Request examples:
```

```json
{
    "name": "test-my-vpn-tunnel",
    "description": "my VPN tunnel",
    "targetVpnGateway": "http://long/url/to/my-vpn-gw",
    "peerIP": "",
    "ikeVersion": 2,
    "sharedSecret": "mysecret",
    "remoteTrafficSelector": "",
    "localTrafficSelector": ""
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpntunnels</code>

Create a new Classic VPN tunnel in a given [environment](#administration-environments).

Required | &nbsp;
------- | -----------
`name`<br/>*string* | The display name of the VPN tunnel
`ikeVersion`<br/>*string* | KE protocol version to use when establishing the VPN tunnel with the peer VPN gateway. Acceptable IKE versions are 1 or 2. The default version is 2
`peerIP`<br/>*string* | The IP address of the Virtual Private Cloud (VPC) the tunnel will connect to
`remoteTrafficSelector`<br/>*string* | Remote traffic selectors to use when establishing the VPN tunnel with the peer VPN gateway. The value should be a CIDR formatted string
`sharedSecret`<br/>*string* | TShared secret used to set the secure session between the Cloud VPN gateway and the peer VPN gateway.
`targetVpnGateway`<br/>*string* | URL of the Target VPN gateway with which this VPN tunnel is associated

Optional | &nbsp;
------- | -----------
`description`<br/>*string* | An optional description
`localTrafficSelector`<br/>*string* | Local traffic selector to use when establishing the VPN tunnel with the peer VPN gateway. The value should be a CIDR formatted string

<!-------------------- DELETE VPN GATEWAY -------------------->

#### Delete VPN gateway

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/vpntunnels/3112849056897469664"
```

```json
{
    "vpnGatewayToDelete": "3932849056897469665",
    "gcpVpnGateway": {
        "externalIpToRelease": ["32.45.23.54"]
        }
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpntunnels/:id</code>

Delete a Classic VPN tunnel in a given [environment](#administration-environments)

Optional | &nbsp;
------- | -----------
`vpnGatewayToDelete`<br/>*string* | The ID of the VPN gateway to delete after deleting the VPN tunnel
`gcpVpnGateway.externalIpToRelease`<br/>*Array* | A list with only one element specifying the IP address to release.
