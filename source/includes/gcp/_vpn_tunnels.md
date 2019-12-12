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
      "creationTimestamp": "2019-12-12T06:34:44.930-08:00",
      "description": "",
      "region": "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1",
      "targetVpnGateway": "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/targetVpnGateways/test-vpn-gw",
      "vpnGatewayInterface": 0,
      "peerExternalGatewayInterface": 0,
      "peerIp": "69.196.164.138",
      "sharedSecret": "*************",
      "sharedSecretHash": "AG9FPaFV_aT2jaIN4cdrnDunzHL8",
      "status": "ESTABLISHED",
      "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/vpnTunnels/vt-epk",
      "ikeVersion": 2,
      "detailedStatus": "Tunnel is up and running.",
      "localTrafficSelector": [
        "10.128.0.0/20"
      ],
      "remoteTrafficSelector": [
        "10.177.132.0/22"
      ],
      "kind": "compute#vpnTunnel",
      "gcpVpnGateway": {
        "creationTimestamp": "2019-08-27T06:37:19.149-07:00",
        "description": "",
        "region": "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1",
        "network": "https://www.googleapis.com/compute/v1/projects/test-area/global/networks/default",
        "tunnels": [
          "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/vpnTunnels/vt-epk"
        ],
        "status": "READY",
        "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/targetVpnGateways/test-vpn-gw",
        "forwardingRules": [
          "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/forwardingRules/test-vpn-gw-rule-esp",
          "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/forwardingRules/test-vpn-gw-rule-udp4500",
          "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/forwardingRules/test-vpn-gw-rule-udp500"
        ],
        "kind": "compute#targetVpnGateway",
        "externalIp": {
          "creationTimestamp": "2019-08-22T06:58:28.039-07:00",
          "description": "",
          "address": "34.66.131.105",
          "prefixLength": 0,
          "status": "IN_USE",
          "region": "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1",
          "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/addresses/test-vpn-gw-ip",
          "users": [
            "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/forwardingRules/test-vpn-gw-rule-esp",
            "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/forwardingRules/test-vpn-gw-rule-udp500",
            "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/forwardingRules/test-vpn-gw-rule-udp4500"
          ],
          "networkTier": "PREMIUM",
          "addressType": "EXTERNAL",
          "kind": "compute#address",
          "shortUsers": [
            "test-vpn-gw-rule-esp",
            "test-vpn-gw-rule-udp500",
            "test-vpn-gw-rule-udp4500"
          ],
          "type": "STATIC",
          "id": "7691460107706769771",
          "name": "test-vpn-gw-ip",
          "shortRegion": "us-central1"
        },
        "tunnelsName": [
          "vt-test-epk"
        ],
        "reserveStaticIP": false,
        "id": "3112849056897469664",
        "name": "test-vpn-gw",
        "shortRegion": "us-central1"
      },
      "shortVpnGateway": "test-vpn-gw",
      "address": "34.66.131.105",
      "type": "CLASSIC",
      "id": "8211895554244865771",
      "name": "vt-test-epk",
      "shortRegion": "us-central1"
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
`id`<br/>*UUID* | Unique identifier for this resource
`ikeVersion`<br/>*integer* | IKE protocol version to use when establishing the VPN tunnel with the peer VPN gateway. Acceptable IKE versions are 1 or 2. The default version is 2
`localTrafficSelector`<br/>*string* | Local traffic selector to use when establishing the VPN tunnel with the peer VPN gateway. The value should be a CIDR formatted string. Only IPv4 is supported. By default it's the CIDR associated with the region in which the VPN gateway resides.
`name`<br/>*string* | The display name of the address
`peerIp`<br/>*string* | IP address of the peer VPN gateway in another VPC
`region`<br/>*string* | The URL of the region where the VPN tunnel is
`remoteTrafficSelector`<br/>*string* | Remote traffic selectors to use when establishing the VPN tunnel with the peer VPN gateway. The value should be a CIDR formatted string. Only IPv4 is supported. The CIDR associated with the `peerIp`.
`sharedSecret`<br/>*string* | Shared secret used to set the secure session between the Cloud VPN gateway and the peer VPN gateway.
`status`<br/>*string* | The status of the VPN tunnel
`selfLink`<br/>*string* | Server-defined URL for the resource
`targetVpnGateway`<br/>*string* | The URL of the Target VPN gateway with which this VPN tunnel is associated
`type`<br/>*string* | The type of this VPN Tunnel. Only CLASSIC is supported.

<!-------------------- RETRIEVE A VPN TUNNEL -------------------->

#### Retrieve a VPN tunnel

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/vpntunnels/8211895554244865771"

# The above command returns JSON structured like this:
```

```json
{
  "data": 
    {
      "creationTimestamp": "2019-12-12T06:34:44.930-08:00",
      "description": "",
      "region": "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1",
      "targetVpnGateway": "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/targetVpnGateways/test-vpn-gw",
      "vpnGatewayInterface": 0,
      "peerExternalGatewayInterface": 0,
      "peerIp": "69.196.164.138",
      "sharedSecret": "*************",
      "sharedSecretHash": "AG9FPaFV_aT2jaIN4cdrnDunzHL8",
      "status": "ESTABLISHED",
      "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/vpnTunnels/vt-epk",
      "ikeVersion": 2,
      "detailedStatus": "Tunnel is up and running.",
      "localTrafficSelector": [
        "10.128.0.0/20"
      ],
      "remoteTrafficSelector": [
        "10.177.132.0/22"
      ],
      "kind": "compute#vpnTunnel",
      "gcpVpnGateway": {
        "creationTimestamp": "2019-08-27T06:37:19.149-07:00",
        "description": "",
        "region": "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1",
        "network": "https://www.googleapis.com/compute/v1/projects/test-area/global/networks/default",
        "tunnels": [
          "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/vpnTunnels/vt-epk"
        ],
        "status": "READY",
        "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/targetVpnGateways/test-vpn-gw",
        "forwardingRules": [
          "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/forwardingRules/test-vpn-gw-rule-esp",
          "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/forwardingRules/test-vpn-gw-rule-udp4500",
          "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/forwardingRules/test-vpn-gw-rule-udp500"
        ],
        "kind": "compute#targetVpnGateway",
        "externalIp": {
          "creationTimestamp": "2019-08-22T06:58:28.039-07:00",
          "description": "",
          "address": "34.66.131.105",
          "prefixLength": 0,
          "status": "IN_USE",
          "region": "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1",
          "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/addresses/test-vpn-gw-ip",
          "users": [
            "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/forwardingRules/test-vpn-gw-rule-esp",
            "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/forwardingRules/test-vpn-gw-rule-udp500",
            "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/forwardingRules/test-vpn-gw-rule-udp4500"
          ],
          "networkTier": "PREMIUM",
          "addressType": "EXTERNAL",
          "kind": "compute#address",
          "shortUsers": [
            "test-vpn-gw-rule-esp",
            "test-vpn-gw-rule-udp500",
            "test-vpn-gw-rule-udp4500"
          ],
          "type": "STATIC",
          "id": "7691460107706769771",
          "name": "test-vpn-gw-ip",
          "shortRegion": "us-central1"
        },
        "tunnelsName": [
          "vt-test-epk"
        ],
        "reserveStaticIP": false,
        "id": "3112849056897469664",
        "name": "test-vpn-gw",
        "shortRegion": "us-central1"
      },
      "shortVpnGateway": "test-vpn-gw",
      "address": "34.66.131.105",
      "type": "CLASSIC",
      "id": "8211895554244865771",
      "name": "vt-test-epk",
      "shortRegion": "us-central1"
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpntunnels/:id</code>

Retrieve a VPN tunnel in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`description`<br/>*string* | An optional description
`id`<br/>*UUID* | Unique identifier for this resource
`ikeVersion`<br/>*integer* | IKE protocol version to use when establishing the VPN tunnel with the peer VPN gateway. Acceptable IKE versions are 1 or 2. The default version is 2
`localTrafficSelector`<br/>*string* | Local traffic selector to use when establishing the VPN tunnel with the peer VPN gateway. The value should be a CIDR formatted string. Only IPv4 is supported. By default it's the CIDR associated with the region in which the VPN gateway resides.
`name`<br/>*string* | The display name of the address
`peerIp`<br/>*string* | IP address of the peer VPN gateway in another VPC
`region`<br/>*string* | The URL of the region where the VPN tunnel is
`remoteTrafficSelector`<br/>*string* | Remote traffic selectors to use when establishing the VPN tunnel with the peer VPN gateway. The value should be a CIDR formatted string. Only IPv4 is supported. The CIDR associated with the `peerIp`.
`sharedSecret`<br/>*string* | Shared secret used to set the secure session between the Cloud VPN gateway and the peer VPN gateway.
`status`<br/>*string* | The status of the VPN tunnel
`selfLink`<br/>*string* | Server-defined URL for the resource
`targetVpnGateway`<br/>*string* | The URL of the Target VPN gateway with which this VPN tunnel is associated
`type`<br/>*string* | The type of this VPN Tunnel. Only CLASSIC is supported.

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
   "https://cloudmc_endpoint/v1/services/gcp/test-area/vpntunnels/8211895554244865771"
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
