### CIDR Reservations

A range of allowed IPv4 addresses in a subnet.

<!-------------------- LIST CIDR RESERVATIONS BY SUBNET -------------------->

#### Get CIDR Reservations by Subnet

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-env/cidrreservations?subnetId=:subnet_id"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "scr-062b86003e2a05fd1",
      "cidrBlock": "10.0.1.0/24",
      "reservationType": "prefix",
      "subnetId": "subnet-0b66921f149046e14"
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/cidrreservations</code>

| Required Query Parameters | &nbsp;                              |
| ------------------------- | ----------------------------------- |
| `subnetID`<br/>_string_   | Get CIDR block by Subnet identifier |

Retrieve a list of all CIDR reservations associated to the Subnet.

| Attributes                 | &nbsp;                                                                                                                      |
| -------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `id`<br/>_string_          | The CIDR Reservation ID                                                                                                              |
| `cidrBlock`<br/>_string_       | The associated CIDR block |
| `addressType`<br/>_string_ | The address reservation type (prefix, explicit)                                                                   |
