### VPN gateways

VPN gateway is used to send encrypted traffic between an virtual network and an on-premises location over the public Internet.

<!-------------------- LIST VPN GATEWAYS-------------------->

#### List VPN gateways

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/vpngateways"

# Example:
```

```json
{
  "data": [
    {
      "creationTimestamp": "2019-12-17T06:56:55.724-08:00",
      "description": "",
      "region": "https://www.googleapis.com/compute/v1/projects/test-area/regions/northamerica-northeast1",
      "network": "https://www.googleapis.com/compute/v1/projects/test-area/global/networks/default",
      "status": "READY",
      "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area/regions/northamerica-northeast1/targetVpnGateways/your-vpngateway",
      "forwardingRules": [
        "https://www.googleapis.com/compute/v1/projects/test-area/regions/northamerica-northeast1/forwardingRules/your-forwarding-rule"
      ],
      "kind": "compute#targetVpnGateway",
      "externalIp": {
        "creationTimestamp": "2019-12-16T13:43:29.481-08:00",
        "description": "",
        "address": "35.203.1.33",
        "prefixLength": 0,
        "status": "IN_USE",
        "region": "https://www.googleapis.com/compute/v1/projects/test-area/regions/northamerica-northeast1",
        "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area/regions/northamerica-northeast1/addresses/your-external-ip",
        "users": [
          "https://www.googleapis.com/compute/v1/projects/test-area/regions/northamerica-northeast1/forwardingRules/your-forwarding-rule"
        ],
        "networkTier": "PREMIUM",
        "addressType": "EXTERNAL",
        "kind": "compute#address",
        "shortUsers": [
          "your-forwarding-rule"
        ],
        "type": "STATIC",
        "id": "1355427342211236974",
        "name": "your-external=ip",
        "shortRegion": "northamerica-northeast1"
      },
      "tunnelsName": [],
      "reserveStaticIP": false,
      "id": "7559452436722963032",
      "name": "your-vpngateway",
      "shortRegion": "northamerica-northeast1"
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpngateways</code>

Retrieve a list of all VPN gateways in an [environment](#administration-environments).


| Attributes                       | &nbsp; |
| -------------------------------- | ------ |
| `creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format. |
| `description`<br/>*string*       | An optional description of the address.|
| `region`<br/>*string*            | The self link of the region |
| `network`<br/>*string*           | The self link of the network |
| `status`<br/>*string*            | The status of the this resource. One of the following values: CREATING, READY, FAILED, DELETING.|
| `selfLink`<br/>*string*          | Server-defined URL for the resource. |
| `forwardingRules`<br/>*List<Objects>*  | The forwarding rules that this resource attached to |
| `kind`<br/>*string*              | Type of the resource. |
| `externalIp`<br/>*Object*        | The [external IP](#gcp-external-ips) this resource is attached to |
| `tunnelsName`<br/>*List<String>* | The VPN tunnels that attach to this resource |
| `reserveStaticIP`<br/>*boolean*  | If the value is false and if no shortIP is provided, an ephemeral external IP address will be assigned. If the value is true, a new static IP would be reserved and provided to the resource. |
| `id`<br/>*UUID*                  | The id of the backend service. |
| `name`<br/>*string*              | Name of the resource. |
| `shortRegion`<br/>*string*       | A short version of the region name. |

<!-------------------- RETRIEVE A VPN GATEWAY -------------------->

#### Retrieve a VPN gateway

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/vpngateways/7559452436722963032"

# Example:
```

```json
{
    "data": {
      "creationTimestamp": "2019-12-17T06:56:55.724-08:00",
      "description": "",
      "region": "https://www.googleapis.com/compute/v1/projects/test-area/regions/northamerica-northeast1",
      "network": "https://www.googleapis.com/compute/v1/projects/test-area/global/networks/default",
      "status": "READY",
      "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area/regions/northamerica-northeast1/targetVpnGateways/your-vpngateway",
      "forwardingRules": [
        "https://www.googleapis.com/compute/v1/projects/test-area/regions/northamerica-northeast1/forwardingRules/your-forwarding-rule"
      ],
      "kind": "compute#targetVpnGateway",
      "externalIp": {
        "creationTimestamp": "2019-12-16T13:43:29.481-08:00",
        "description": "",
        "address": "35.203.1.33",
        "prefixLength": 0,
        "status": "IN_USE",
        "region": "https://www.googleapis.com/compute/v1/projects/test-area/regions/northamerica-northeast1",
        "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area/regions/northamerica-northeast1/addresses/your-external-ip",
        "users": [
          "https://www.googleapis.com/compute/v1/projects/test-area/regions/northamerica-northeast1/forwardingRules/your-forwarding-rule"
        ],
        "networkTier": "PREMIUM",
        "addressType": "EXTERNAL",
        "kind": "compute#address",
        "shortUsers": [
          "your-forwarding-rule"
        ],
        "type": "STATIC",
        "id": "1355427342211236974",
        "name": "your-external=ip",
        "shortRegion": "northamerica-northeast1"
      },
      "tunnelsName": [],
      "reserveStaticIP": false,
      "id": "7559452436722963032",
      "name": "your-vpngateway",
      "shortRegion": "northamerica-northeast1"
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpngateways/:id</code>

Retrieve a VPN gatewau in an [environment](#administration-environments).

| Attributes                       | &nbsp; |
| -------------------------------- | ------ |
| `creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format. |
| `description`<br/>*string*       | An optional description of the address.|
| `region`<br/>*string*            | The self link of the region |
| `network`<br/>*string*           | The self link of the network |
| `status`<br/>*string*            | The status of the this resource. One of the following values: CREATING, READY, FAILED, DELETING.|
| `selfLink`<br/>*string*          | Server-defined URL for the resource. |
| `forwardingRules`<br/>*List<Objects>*  | The forwarding rules that this resource attached to |
| `kind`<br/>*string*              | Type of the resource. |
| `externalIp`<br/>*Object*        | The [external IP](#gcp-external-ips) this resource is attached to |
| `tunnelsName`<br/>*List<String>* | The VPN tunnels that attach to this resource |
| `reserveStaticIP`<br/>*boolean*  | If the value is false and if no shortIP is provided, an ephemeral external IP address will be assigned. If the value is true, a new static IP would be reserved and provided to the resource. |
| `id`<br/>*UUID*                  | The id of the backend service. |
| `name`<br/>*string*              | Name of the resource. |
| `shortRegion`<br/>*string*       | A short version of the region name. |

<!-------------------- CREATE A VPN GATEWAY -------------------->

#### Create a VPN gateway

Creates a VPN gateway in the specified project and region using the data included in the request

```shell
# Example request: Specifying an existing URL map
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   -d '{ "name": "vpngateway-name", "reserveStaticIP": "false", "shortRegion": "region-name", "shortIP": "external-ip-name" }' \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/vpngateways"
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpngateways</code>

Create a new VPN gateway

| Required                         | &nbsp; |
| -------------------------------- | ------ |
| `name`<br/>*string*              | Name of the resource. |
| `shortRegion`<br/>*string*       | A short version of the kind of resource. |

| Optional                         | &nbsp; |
| -------------------------------- | ------ |
| `shortIP`<br/>*string*           | The name of the external IP attached to this resource. |
| `reserveStaticIP`<br/>*boolean*  | If the value is false and if no shortIP is provided, an ephemeral external IP address will be assigned. If the value is true, a new static IP would be reserved and provided to the resource. |
