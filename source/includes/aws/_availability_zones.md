### Availability Zones

Amazon EC2 is hosted in multiple locations world-wide. Each Region is a separate geographic area, where Availability Zones are multiple, isolated locations within each Region. The code for Availability Zone is its Region code followed by a letter identifier.

When you launch an instance, you select a Region and a virtual private cloud (VPC), and then you can either select a subnet from one of the displayed Availability Zones or leave blank for the default zone. If you distribute your instances across multiple Availability Zones and one instance fails, you can design your application so that an instance in another Availability Zone can handle requests. You can also use Elastic IP addresses to mask the failure of an instance in one Availability Zone by rapidly remapping the address to an instance in another Availability Zone.

<!-------------------- LIST Availability Zones -------------------->

#### List Availability Zones

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-env/availabilityzones"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "use1-az2",
      "name": "us-east-1a",
      "groupName": "us-east-1",
      "networkBorderGroup": "us-east-1",
      "state": "available"
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/availabilityzones</code>

Retrieve a list of all availability zones for a caller context.

| Attributes                        | &nbsp;                                                                                                              |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `id`<br/>_string_                 | The ID of the Availability Zone.                                                                                    |
| `name`<br/>_string_               | The name of the Availability Zone.                                                                                  |
| `groupName`<br/>_string_          | For Availability Zones, this is the Region name.                                                                    |
| `networkBorderGroup`<br/>_string_ | A unique set of Availability Zones or Local Zones from which AWS advertises public IP addresses.                    |
| `state`<br/>_boolean_             | The state of the zone. This will always be available (Valid states: available, information, impaired, unavailable ) |

<!-------------------- RETRIEVE AN Availability Zone -------------------->

#### Retrieve an Availability Zone

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-env/availabilityzones/us-east-1a"
```

> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": "use1-az2",
        "name": "us-east-1a",
        "groupName": "us-east-1",
        "networkBorderGroup": "us-east-1",
        "state": "available"
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/availabilityzones/name</code>

Retrieve a list of all availability zones for a caller context.

| Attributes                        | &nbsp;                                                                                                              |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `id`<br/>_string_                 | The ID of the Availability Zone.                                                                                    |
| `name`<br/>_string_               | The name of the Availability Zone.                                                                                  |
| `groupName`<br/>_string_          | For Availability Zones, this is the Region name.                                                                    |
| `networkBorderGroup`<br/>_string_ | A unique set of Availability Zones or Local Zones from which AWS advertises public IP addresses.                    |
| `state`<br/>_boolean_             | The state of the zone. This will always be available (Valid states: available, information, impaired, unavailable ) |

