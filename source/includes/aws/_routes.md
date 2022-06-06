### Routes

A route table contains a set of rules, called routes, that determine where network traffic from a gateway is directed.
A route within a route table for a subnet specifies a <b>destination</b> and a <b>target</b>.

The destination for the route is represented by a IPV4 CIDR block (e.g: 0.0.0.0/0, which represents all IPv4 addresses).
The target is the internet gateway that's attached to your VPC.

<!-------------------- CREATE ROUTES -------------------->

#### Create Route

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-env/routes"
```

> Request body example for an instance with custom security group:

```json
{
  "cidrBlock": "0.0.0.0/0",
  "routeTableId": "rtb-0c43fead9b67edc8b"
}
```

> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/routes</code>

Create a new route in a route table, must have an attached internet gateway to perform the operation.

| Required     | &nbsp;                                                                                                                                                                           |
| ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| cidrBlock    | IPv4 range of the traffic you want to direct. Malformed IPv4 addresses, addresses within within AWS’s link-local address space, and CIDR blocks with invalid masks are rejected. |
| routeTableId | The ID of the route table you want to add the route to.                                                                                                                           |

CIDR blocks undergo validation and correction when creating a route, below are examples of the possible transformations. When a new route is created with a CIDR block that is the same as an existing route, the existing route is overridden. 

| Input CIDR              | Output CIDR      | &nbsp;                                                                                                                                                |
| ----------------------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| `53.100.233.76/32`        | `53.100.233.76/32` | Properly formatted CIDRs are unchanged.                                                                                                                |
| `53.100.233.76/16`        | `53.100.0.0/16`    | CIDRs with less specific masks than the IP are truncated to adhere to the CIDR mask.                                                                   |
| `53.100.233.76`           | `53.100.233.76/32` | Valid IPv4 addresses without a CIDR mask are automatically appended the most specific CIDR mask.                                                       |
| `00.300.01.9/32`          | Rejected         | Invalid IPv4 address.                                                                                                                                  |
| `53.100.233.76/70`        | Rejected         | Invalid CIDR mask.                                                                                                                                     |
| `169.254.169.0/22`        | Rejected         | Any CIDR blocks under `169.254.169.0/22` are rejected because they are within AWS's link local address space. Overlapping blocks such as `169.254.0.0/16` are fine, but the traffic within `169.254.169.0/22` is still reserved to AWS. |
| `2001:db8:1234:1a00::/56` | Rejected         | IPv6 CIDR blocks, even if they are properly formatted, are not supported at this time.                                                                 |

<!-------------------- DELETE ROUTES -------------------->

#### Delete a Route
```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/aws-tesv/routes/0.0.0.0/0?operation=delete&routeTableId=rtb-04703a509a773f41b"
```

> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/routes/:cidrBlock?operation=delete&routeTableId=:routeTableId</code>

Delete a route defined by its IPv4 CIDR block within the provided route table in a given [environment](#administration-environments).

| Attributes                 | &nbsp;                                        |
|----------------------------|-----------------------------------------------|
| `taskId` <br/>*string*     | The [task ID](#tasks) for the delete route operation. |
| `taskStatus` <br/>*string* | The status of the operation.                  |

| Required Query Parameters     | &nbsp;                                        |
|-------------------------------|-----------------------------------------------|
| `routeTableId` <br/>*string*  | The ID of the Route Table for this route.     |


<aside class="notice">
The local route within the Route table cannot be deleted as it is the default route for communication within the VPC.
</aside>
