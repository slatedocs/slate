### VPN gateways

With Classic VPN, your on-premises hosts communicate through one or more IPsec VPN tunnels to Compute Engine Virtual Machine (VM) instances in your project's VPC networks.

<!-------------------- LIST VPN GATEWAYS -------------------->

#### List VPN gateways

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/vpngateways"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "creationTimestamp": "2019-08-27T06:37:19.149-07:00",
      "description": "",
      "region": "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1",
      "network": "https://www.googleapis.com/compute/v1/projects/test-area/global/networks/default",
      "status": "READY",
      "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/targetVpnGateways/test-vpn-gw",
      "forwardingRules": [
        "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/forwardingRules/test-vpn-gw-rule-udp500",
        "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/forwardingRules/test-vpn-gw-rule-udp4500",
        "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/forwardingRules/test-vpn-gw-rule-esp"
      ],
      "kind": "compute#targetVpnGateway",
      "externalIp": {},
      "tunnelsName": [],
      "reserveStaticIP": false,
      "id": "3112849056897469664",
      "name": "test-vpn-gw",
      "shortRegion": "us-central1"
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpngateways</code>

Retrieve a list of all VPN gateways in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`description`<br/>*string* | An optional description.
`externalIp`<br/>*Object* | The external IP attached to this VPN gateway.
`forwardingRules`<br/>Array | List of the forwarding rules which are defined for this VPN gateway.
`id`<br/>*UUID* | Unique identifier for this resource.
`name`<br/>*string* | The display name of the VPN gateway.
`network`<br/>*string* | URL of the network to which this VPN gateway is attached.
`region`<br/>*string* | The URL of the region where the VPN gateway is.
`status`<br/>*string* | The status of the VPN gateway. One of the following: READY, CREATING, FAILED and DELETING.
`selfLink`<br/>*string* | Server-defined URL for the resource.

<!-------------------- RETRIEVE A VPN GATEWAY -------------------->

#### Retrieve a VPN gateway

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/vpngateways/3112849056897469664"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "creationTimestamp": "2019-08-27T06:37:19.149-07:00",
    "description": "",
    "region": "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1",
    "network": "https://www.googleapis.com/compute/v1/projects/test-area/global/networks/default",
    "status": "READY",
    "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/targetVpnGateways/test-vpn-gw",
    "forwardingRules": [
        "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/forwardingRules/test-vpn-gw-rule-udp500",
        "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/forwardingRules/test-vpn-gw-rule-udp4500",
        "https://www.googleapis.com/compute/v1/projects/test-area/regions/us-central1/forwardingRules/test-vpn-gw-rule-esp"
    ],
    "kind": "compute#targetVpnGateway",
    "externalIp": {},
    "tunnelsName": [],
    "reserveStaticIP": false,
    "id": "3112849056897469664",
    "name": "test-vpn-gw",
    "shortRegion": "us-central1"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpngateways/:id</code>

Retrieve a VPN gateway in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`description`<br/>*string* | An optional description.
`externalIp`<br/>*Object* | The external IP attached to this VPN gateway.
`forwardingRules`<br/>Array | List of the forwarding rules which are defined for this VPN gateway.
`id`<br/>*UUID* | Unique identifier for this resource.
`name`<br/>*string* | The display name of the VPN gateway.
`network`<br/>*string* | URL of the network to which this VPN gateway is attached.
`region`<br/>*string* | The URL of the region where the VPN gateway is.
`status`<br/>*string* | The status of the VPN gateway. One of the following: READY, CREATING, FAILED and DELETING.
`selfLink`<br/>*string* | Server-defined URL for the resource.

<!-------------------- CREATE A VPN GATEWAY -------------------->

#### Create a VPN gateway

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/vpngateways"
```
> Request body examples:

```json
{
  "name": "test-my-vpn-gw",
  "description": "my VPN gateway",
  "shortRegion": "us-east4",
  "reserveStaticIP": true
}
```

```json
{
  "name": "test-other-vpn-gw",
  "description": "my other VPN gateway",
  "shortRegion": "us-east4",
  "shortIP": "my-vpn-gw-ip"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpngateways</code>

Create a new Classic VPN gateway in a given [environment](#administration-environments).

Required | &nbsp;
------- | -----------
`name`<br/>*string* | The display name of the VPN gateway.
`shortRegion`<br/>*string* | A short version of the region name.

Optional | &nbsp;
------- | -----------
`description`<br/>*string* | An optional description.
`shortIP`<br/>*string* | The name of the external static IP to use for the VPN gateway.
`reserveStaticIP`<br/>*string* | A flag to indicate if a new external static IP needs to be reserved for the VPN gateway. This option is mutually exclusive with `shortIP`.

<!-------------------- DELETE VPN GATEWAY -------------------->

#### Delete VPN gateway

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/vpngateways/3112849056897469664"
```
> The above command returns a JSON structured like this:

```json
{
  "externalIpToRelease": ["32.45.23.54"]
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpngateways/:id</code>

Delete a Classic VPN gateway in a given [environment](#administration-environments).

Optional | &nbsp;
------- | -----------
`externalIpToRelease`<br/>*Array* | A list with only one element specifying the IP address to release.
