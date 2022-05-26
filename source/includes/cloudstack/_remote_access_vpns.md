### Remote access VPNs

Remote access VPNs allow users to connect to [VPCs](#cloudstack-vpcs) through secure connections.

#### List remote access VPNs
```shell
curl -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/remoteaccessvpns"
```
> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "id": "10001e7d-b4ef-489b-836e-0619a383bc8d",
            "publicIpAddress": "69.196.164.31",
            "publicIpAddressId": "10001e7d-b4ef-489b-836e-0619a383bc8d",
            "state": "Disabled"
        },
        {
            "id": "8925406c-8051-467e-a0ca-c48caa5bf670",
            "presharedKey": "Kwth4JYUfXXmtMG4X7vAwRPH",
            "publicIpAddress": "69.196.164.223",
            "publicIpAddressId": "8925406c-8051-467e-a0ca-c48caa5bf670",
            "state": "Enabled"
        }
    ],
    "metadata": {
        "recordCount": 2
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/remoteaccessvpns</code>

List remote access VPNs.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the remote access VPN
`presharedKey`<br/>*string* | The VPN's preshared key
`publicIpAddress`<br/>*string* | The [public IP](#cloudstack-public-ips) (e.g. 208.80.154.224)
`publicIpAddressId`<br/>*string* | The id of the [public IP](#cloudstack-public-ips)
`state`<br/>*string* | The state.<br/>*Possible values:* `Enabled`, `Disabled.`

Query Parameters | &nbsp;
---------- | -----
`vpc_id`<br/>*UUID* | Filter the list to only retrieve the VPN information of a specific [VPC](#cloudstack-vpcs)
`network_id`<br/>*UUID* | Filter the list to only retrieve the VPN information of a specific [Network](#cloudstack-networks)

#### Retrieve a remote access VPN
```shell
curl -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/remoteaccessvpns/10001e7d-b4ef-489b-836e-0619a383bc8d"
```
> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": "10001e7d-b4ef-489b-836e-0619a383bc8d",
        "publicIpAddress": "69.196.164.31",
        "publicIpAddressId": "10001e7d-b4ef-489b-836e-0619a383bc8d",
        "state": "Disabled"
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/remoteaccessvpns/:id</code>

Retrieve a remote access VPN.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the remote access VPN
`presharedKey`<br/>*string* | The VPN's preshared key
`publicIpAddress`<br/>*string* | The [public IP](#cloudstack-public-ips) (e.g. 208.80.154.224)
`publicIpAddressId`<br/>*string* | The id of the [public IP](#cloudstack-public-ips)
`state`<br/>*string* | The state.<br/>*Possible values:* `Enabled`, `Disabled.`
