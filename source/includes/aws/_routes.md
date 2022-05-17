### Routes

A route within a route table for a subnet specifies a <b>destination</b> and a <b>target</b>.

A route has to be configured within your route table for your subnet to access the internet through an internet gateway.

The destination for the route is represented by a IPV4 CIDR block (e.g: 0.0.0.0/0, which represents all IPv4 addresses).
The target is the internet gateway that's attached to your VPC.

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