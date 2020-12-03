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
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/routers"
```

> The above command returns a JSON structured like this:

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
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/routers/0569972416436922364"
```

> The above command returns a JSON structured like this:

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

<!-------------------- CREATE A ROUTER -------------------->

#### Create a router

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/routers"
```

> Request body example:

```json
{
  "name": "cmc-c-router",
  "shortNetwork": "cmc-vpc",
  "shortRegion": "us-central1",
  "bgp": {
    "asn": 65510
  }
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/routers</code>

Create a new router

| Required                    | &nbsp;                                                                                                                          |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `name`<br/>_string_         | The display name of the router.                                                                                                 |
| `shortRegion`<br/>_string_  | A short version of the region name.                                                                                             |
| `shortNetwork`<br/>_string_ | A shortened version of the network name that the router is attached to.                                                         |
| `bgp.asn`<br/>_string_      | The BGP Autonomous System Number (ASN) that is to be assigned to this router. _Must be a valid ASN between 64512–65534_. |

| Optional               | &nbsp;                                                                                   |
| ---------------------- | ---------------------------------------------------------------------------------------- |
| `region`<br/>_string_  | Instead of the `shortRegion`, the long URI version of the region can also be provided.   |
| `network`<br/>_string_ | Instead of the `shortNetwork`, the long URI version of the network can also be provided. |

<!-------------------- ADD VPN TUNNEL INTERFACES -------------------->

#### Add router interface(s)

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/routers/5333546534174463697?operation=addvpntunnelinterface"
```

> Request body example:

```json
{
  "interfaces": [
    {
      "name": "if-cmc-srx-bgp-interface",
      "ipRange": "169.254.13.1/30",
      "linkedVpnTunnel": "https://www.googleapis.com/compute/v1/projects/cmc-junniper-lab-ses/regions/us-central1/vpnTunnels/cmc-srx-vpn-tunnel"
    }
  ]
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/routers/:id?operation=addvpntunnelinterface</code>

Add one or more interfaces associated to existing [Vpn Tunnel(s)](#gcp-vpn-tunnels).

| Required                                     | &nbsp;                                                                                                                                                                            |
| -------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `interfaces`<br/>_Array_                     | An array of interfaces to be added to the selected router.                                                                                                                        |
| `interfaces[*].name`<br/>_string_            | The name of the interface on the router.                                                                                                                                          |
| `interfaces[*].ipRange`<br/>_string_         | IP address and range of the interface. The IP range must be in the RFC3927 link-local IP address space. The value must be a CIDR-formatted string, _for example: 169.254.0.1/30_. |
| `interfaces[*].linkedVpnTunnel`<br/>_string_ | URI of the linked VPN tunnel, which must be in the same region as the router.                                                                                                     |

<!-------------------- ADD BGP PEERS -------------------->

#### Add BGP peer(s)

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/routers/5333546534174463697?operation=addbgppeer"
```

> Request body example:

```json
{
  "bgpPeers": [
    {
      "name": "juniper-srx-bgp-5th-p2",
      "interfaceName": "if-juniper-srx-bgp-3rd-exp",
      "ipAddress": "169.254.13.1",
      "peerIpAddress": "169.254.13.2",
      "peerAsn": 64999
    }
  ]
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/routers/:id?operation=addbgppeer</code>

Add one or more BGP peers associated to existing router interface(s)

| Required                                 | &nbsp;                                                                                       |
| ---------------------------------------- | -------------------------------------------------------------------------------------------- |
| `bgpPeers`<br/>_Array_                   | An array of BGP peers to be added to the selected router.                                    |
| `bgpPeers[*].name`<br/>_string_          | The name of the BGP peer association.                                                        |
| `bgpPeers[*].interfaceName`<br/>_string_ | The router interface through which this BGP peering will be realized.                        |
| `bgpPeers[*].ipAddress`<br/>_string_     | The router's IP address on the above interface for this BGP peering. Only IPv4 is supported. |
| `bgpPeers[*].peerIpAddress`<br/>_string_ | The peer IP address that the BGP peering will try to connect to. Only IPv4 is supported.     |
| `bgpPeers[*].peerAsn`<br/>_string_       | Peer BGP Autonomous System Number (ASN). Each BGP interface may use a different value.       |

<!-------------------- DELETE A ROUTER -------------------->

#### Delete a Router

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/routers/5333546534174463697"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/routers/:id</code>

Delete an existing cloud router from the [environment](#administration-environments).

| Optional                | &nbsp;                                                                                                                                                                                                                           |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `selfLink`<br/>_string_ | The partially qualified Google Cloud `selfLink` of this router. This should include the projectId, region and the router name delimited by the URL path separator. `Ex: project-id/regions/<short-region>/routers/<router-name>` |
