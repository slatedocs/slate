### VPC offerings

VPC offerings determine which services are available to provisioned [VPCs](#cloudstack-vpcs).

#### List VPC offerings

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/vpcofferings"
```
> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "id": "41ac6ba0-6172-4bc4-bff6-b0831b91677c",
            "name": "Default VPC offering",
            "services": [
                "PortForwarding",
                "Vpn",
                "SourceNat",
                "Dhcp",
                "NetworkACL",
                "Dns",
                "Lb",
                "UserData",
                "StaticNat"
            ],
            "state": "Enabled"
        }
    ],
    "metadata": {
        "recordCount": 1
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpcofferings</code>

Retrieve a list of available VPC offerings.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the VPC offering
`name`<br/>*string* | The name of the VPC offering
`services`<br/>*Array[string]* | The services provided by the offering
`state`<br/>*string* | The state of the offering

#### Retrieve a VPC offering

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/vpcofferings/41ac6ba0-6172-4bc4-bff6-b0831b91677c"
```
> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": "41ac6ba0-6172-4bc4-bff6-b0831b91677c",
        "name": "Default VPC offering",
        "services": [
            "PortForwarding",
            "Lb",
            "NetworkACL",
            "SourceNat",
            "Dns",
            "StaticNat",
            "Vpn",
            "Dhcp",
            "UserData"
        ],
        "state": "Enabled"
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpcofferings/:id</code>

Retrieve a VPC offering.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the VPC offering
`name`<br/>*string* | The name of the VPC offering
`services`<br/>*Array[string]* | The services provided by the offering
`state`<br/>*string* | The state of the offering
