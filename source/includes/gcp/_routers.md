### Routers

Cloud Router allows to programs custom dynamic routes and it scales with your network traffic. Cloud Router isn't a physical device that might cause a bottleneck. It can't be used by itself. But, it is required or recommended in the following cases:

- Required for Cloud NAT
- Required for Cloud Interconnect and High Availability (HA) VPN
- A recommended configuration option for Classic VPN

<!-------------------- LIST ROUTERS -------------------->

#### List Routers

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/routers"
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "4369223640569972416",
      "name": "c-router-failover",
      "kind": "compute#router",
      "shortRegion": "europe-west4",
      "description": "Router specific to internal failover VPC",
      "shortNetwork": "failover-vpc-network",
      "network": "https://www.googleapis.com/compute/v1/projects/cmc-junniper-lab-ses/global/networks/failover-vpc-network",
      ....
      ....
    },
    {
      "id": "0569972416436922364",
      "name": "c-router-main",
      "kind": "compute#router",
      "shortRegion": "europe-west2",
      "description": "Router specific to the main VPC",
      "shortNetwork": "main-vpc-network",
      "network": "https://www.googleapis.com/compute/v1/projects/cmc-junniper-lab-ses/global/networks/main-vpc-network",
    },
    .....
    .....
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/routers</code>

Retrieve a list of all cloud routers in a given [environment](#administration-environments).

| Attributes                 | &nbsp;                                                                                                                                     |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `data`<br/>_Array[Object]_ | List of cloud routers available in the current environment                                                                                 |
| `metadata`<br/>_Array_     | A list of meta information about the response data. Contains `recordCount` which is an indication of the number of routers in the response |

<!-------------------- RETRIEVE A ROUTER -------------------->

#### Retrieve a Router

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/routers/0569972416436922364"
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "4369223640569972416",
    "name": "c-router-failover",
    "kind": "compute#router",
    "shortRegion": "europe-west4",
    "description": "Router specific to internal failover VPC",
    "shortNetwork": "failover-vpc-network",
    "network": "https://www.googleapis.com/compute/v1/projects/cmc-junniper-lab-ses/global/networks/failover-vpc-network",
    "region": "https://www.googleapis.com/compute/v1/projects/cmc-junniper-lab-ses/regions/europe-west4",
    "selfLink": "https://www.googleapis.com/compute/v1/projects/cmc-junniper-lab-ses/regions/europe-west4/routers/c-router-failover",
    "bgp": {
      "advertiseMode": "DEFAULT",
      "asn": 65510
    },
    "bgpPeers": [
      {
        "advertiseMode": "DEFAULT",
        "interfaceName": "if-failover-bgp-session",
        "ipAddress": "169.254.11.1",
        "name": "failover-bgp-session",
        "peerAsn": 64999,
        "peerIpAddress": "169.254.11.2"
      }
    ],
    "interfaces": [
      {
        "name": "if-failover-bgp-session",
        "ipRange": "169.254.11.1/30",
        "linkedVpnTunnel": "https://www.googleapis.com/compute/v1/projects/cmc-junniper-lab-ses/regions/europe-west4/vpnTunnels/failover-vpn-tunnel"
      }
    ]
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/routers/:id</code>

Retrieve a cloud router in a given [environment](#administration-environments).

| Attributes                       | &nbsp;                                                                                                                                       |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| `id`<br/>_UUID_                  | Unique identifier for this resource.                                                                                                         |
| `name`<br/>_string_              | The display name of the VPN gateway.                                                                                                         |
| `kind`<br/>_string_              | The type of GCP compute resource.                                                                                                            |
| `description`<br/>_string_       | A user-friendly description about the router and its purpose.                                                                                |
| `shortRegion`<br/>_string_       | The specific region in which the router resides in.                                                                                          |
| `shortNetwork`<br/>_string_      | The VPC network to which the router is attached to.                                                                                          |
| `network`<br/>_string_           | The URI of the VPC network to which the touter is attached to.                                                                               |
| `region`<br/>_string_            | The URI of the region in which the router resided in.                                                                                        |
| `selfLink`<br/>_string_          | Server-defined URL for the resource.                                                                                                         |
| `bgp`<br/>_Object_               | BGP information specific to this router.                                                                                                     |
| `bgpPeers`<br/>_Object_          | BGP information that is configured into the routing stack to establish BGP peering. _(Includes: `Peer ASN`, `Interface name`, `IP address`)_ |
| `interfaces`<br/>_Array[Object]_ | Router interfaces. Each interface contains either one linked resource or IP address and IP address range.                                    |
