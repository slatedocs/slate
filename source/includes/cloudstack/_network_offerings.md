### Network offerings

Network offerings determine which services are available to each provisioned [network](#cloudstack-networks).

#### List network offerings

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/networkofferings"
```
> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "id": "89724d35-b69c-418c-be81-7d83fcfc9da9",
            "name": "Load Balanced Tier",
            "vpcOnly": true,
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
            "state": "ENABLED"
        },
        {
            "id": "087502ea-cb42-421b-9bd9-9cf9ae5d1b89",
            "name": "Standard Tier",
            "vpcOnly": true,
            "services": [
                "PortForwarding",
                "Vpn",
                "SourceNat",
                "Dhcp",
                "NetworkACL",
                "Dns",
                "UserData",
                "StaticNat"
            ],
            "state": "ENABLED"
        },
        {
            "id": "0f1b9d72-b842-11e7-abc4-cec278b6b50a",
            "name": "Isolated network",
            "vpcOnly": false,
            "services": [
                "PortForwarding",
                "SourceNat",
                "Dhcp",
                "Dns",
                "UserData",
                "StaticNat"
            ],
            "state": "ENABLED"
        }
    ],
    "metadata": {
        "recordCount": 3
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networkofferings</code>

Retrieve a list of available network offerings.

Attributes                     | &nbsp;
------------------------------ | ------
`id`<br/>*UUID*                | The id of the network offering
`name`<br/>*string*            | The name of the network offering
`vpcOnly`<br/>*boolean*        | Whether or not the offering is for VPC subnets
`services`<br/>*Array[string]* | The services provided by the offering
`state`<br/>*string*           | The state of the offering

#### Retrieve a network offering

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/networkofferings/89724d35-b69c-418c-be81-7d83fcfc9da9"
```
> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": "89724d35-b69c-418c-be81-7d83fcfc9da9",
        "name": "Load Balanced Tier",
        "vpcOnly": true,
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
        "state": "ENABLED"
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networkofferings/:id</code>

Retrieve a network offering.

Attributes                     | &nbsp;
------------------------------ | ------
`id`<br/>*UUID*                | The id of the network offering
`name`<br/>*string*            | The name of the network offering
`vpcOnly`<br/>*boolean*        | Whether or not the offering is for VPC subnets
`services`<br/>*Array[string]* | The services provided by the offering
`state`<br/>*string*           | The state of the offering
