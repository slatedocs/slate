### Port forwarding rules

Port forwarding allows traffic from external hosts to services offered by applications in your [VPCs](#vpcs). A port forwarding rule is a mapping of public IP ports to [private IP](#nics) ports (i.e. forwards traffic from a public IP to an instance).

<!-------------------- LIST PORT FORWARDING RULES -------------------->

#### List port forwarding rules

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/compute-on/test_area/portforwardingrules"

# Example response:
```
```json
{
  "data": [{
    "id": "bf145d1e-7beb-42b8-bd2c-1a316aeb9aef",
    "ipAddress": "74.121.244.23",
    "ipAddressId": "747e30d0-a0cd-48ba-b7d8-77a2f7e10504",
    "privatePortStart": "8080",
    "privatePortEnd": "8080",
    "publicPortStart": "80",
    "publicPortEnd": "80",
    "protocol": "TCP",
    "instanceId": "d7328dd9-882e-4d08-8ad2-c74c2d493689",
    "instanceName": "my_app_instance",
    "networkId": "7388f551-4163-4467-b49b-58e9310d7207",
    "vpcId": "39907f0a-c253-42b8-b02d-337e00e9851e",
    "privateIp": "10.155.24.145",
    "privateIpId": "10.155.24.145	"
  }],
  "metadata": {
    "recordCount": 1
  }
}
```
```go
resources, _ := ccaClient.GetResources("compute-on", "test_area")
ccaResources := resources.(cloudca.Resources)
portForwardingRules, err := ccaResources.PortForwardingRules.List()
```

<code>GET /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/portforwardingrules</code>

Retrieve a list of all port forwarding rules of an environment.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the port forwarding rule
`ipAddress`<br/>*string* | The ip address of the [public IP](#public-ips) associated to this port forwarding rule
`ipAddressId`<br/>*UUID* | The id of the [public IP](#public-ips) associated to this port forwarding rule
`privatePortStart`<br/>*string* | The start of the private port range
`privatePortEnd`<br/>*string* | The end of the private port range
`publicPortStart`<br/>*string* | The start of the public port range
`publicPortEnd`<br/>*string* | The end of the public port range
`protocol`<br/>*string* | The protocol of the port forwarding rule (e.g. TCP, UDP)
`instanceId`<br/>*UUID* | The id of the [instance](#instances) of the port forwarding rule
`instanceName`<br/>*string* | The name of the [instance](#instances) of the port forwarding rule
`networkId`<br/>*UUID* | The id of the [network](#networks) of the port forwarding rule
`vpcId`<br/>*UUID* | The id of the [VPC](#vpcs) of the port forwarding rule
`privateIp`<br/>*string* | The private IP address of the [instance](#instances) where the traffic will be forwarded
`privateIpId`<br/>*UUID* | The id of private IP address of the [instance](#instances) where traffic will be forwarded

Query Parameters | &nbsp;
---------- | -----
`instance_id`<br/>*UUID* | Filter the list to only retrieve the port forwarding rules of an [instance](#instances)

<!-------------------- RETRIEVE A PORT FORWARDING RULE -------------------->


#### Retrieve a port forwarding rule

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/compute-on/test_area/portforwardingrules/ad5bcae8-ee8b-4ee8-a7a4-381c25444b8e"

# Example response:
```
```json
{
  "data": {
    "id": "bf145d1e-7beb-42b8-bd2c-1a316aeb9aef",
    "ipAddress": "74.121.244.23",
    "ipAddressId": "747e30d0-a0cd-48ba-b7d8-77a2f7e10504",
    "privatePortStart": "8080",
    "privatePortEnd": "8080",
    "publicPortStart": "80",
    "publicPortEnd": "80",
    "protocol": "TCP",
    "instanceName": "my_app_instance",
    "instanceId": "d7328dd9-882e-4d08-8ad2-c74c2d493689",
    "networkId": "7388f551-4163-4467-b49b-58e9310d7207",
    "vpcId": "39907f0a-c253-42b8-b02d-337e00e9851e",
    "privateIp": "10.155.24.145",
    "privateIpId": "fc9d60a5-a8f8-4d01-a63f-f1731440063f"
  }
}
```
```go
resources, _ := ccaClient.GetResources("compute-on", "test_area")
ccaResources := resources.(cloudca.Resources)
portForwardingRule, err := ccaResources.PortForwardingRule.Get("bf145d1e-7beb-42b8-bd2c-1a316aeb9aef")
```

<code>GET /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/portforwardingrules/:id</code>

Retrieve information about a port forwarding rule.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the port forwarding rule
`ipAddress`<br/>*string* | The ip address of the [public IP](#public-ips) associated to this port forwarding rule
`ipAddressId`<br/>*UUID* | The id of the [public IP](#public-ips) associated to this port forwarding rule
`privatePortStart`<br/>*string* | The start of the private port range
`privatePortEnd`<br/>*string* | The end of the private port range
`publicPortStart`<br/>*string* | The start of the public port range
`publicPortEnd`<br/>*string* | The end of the public port range
`protocol`<br/>*string* | The protocol of the port forwarding rule (e.g. TCP, UDP)
`instanceId`<br/>*UUID* | The id of the [instance](#instances) of the port forwarding rule
`instanceName`<br/>*string* | The name of the [instance](#instances) of the port forwarding rule
`networkId`<br/>*UUID* | The id of the [network](#networks) of the port forwarding rule
`vpcId`<br/>*UUID* | The id of the [VPC](#vpcs) of the port forwarding rule
`privateIp`<br/>*string* | The private IP address of the [instance](#instances) where requests will be forwarded
`privateIpId`<br/>*UUID* | The id of private IP address of the [instance](#instances) where requests will be forwarded


<!-------------------- CREATE A PORT FORWARDING RULE -------------------->


#### Create a port forwarding rule


```shell

# Example:

curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/v1/services/compute-on/test_area/portforwardingrules"

# Request example:
```
```json
{
  "ipAddressId": "4daf6ce5-a8b1-47d2-96b3-8edda63d891c",
  "instanceId": "0ec9ee23-f9dd-4830-acb6-7f8d4469673a",
  "protocol": "TCP",
  "privatePortStart": "8080",
  "privatePortEnd": "8080",
  "publicPortStart": "80",
  "publicPortEnd": "80"
}
```
```go
resources, _ := ccaClient.GetResources("compute-on", "test_area")
ccaResources := resources.(cloudca.Resources)
createdVpc, err := ccaResources.PortForwardingRules.Create(cloudca.PortForwardingRule{
        PublicIpId: "4daf6ce5-a8b1-47d2-96b3-8edda63d891c"
        InstanceId: "0ec9ee23-f9dd-4830-acb6-7f8d4469673a",
        Protocol: "TCP",
        PrivatePortStart: "8080",
        PrivatePortEnd: "8080",
        PublicPortStart: "80",
        PublicPortEnd: "80"
    })
```
```dart
resource "cloudca_port_forwarding_rule" "web_pfr" {
    service_code = "compute-on"
    environment_name = "test_area"

    public_ip_id = "4daf6ce5-a8b1-47d2-96b3-8edda63d891c"
    public_port_start = 80
    private_ip_id = "30face92-f1cf-4064-aa7f-008ea09ef7f0"
    private_port_start = 8080
    protocol = "TCP"
}
```

<code>POST /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/portforwardingrules</code>

Create a port forwarding rule for a [public IP](#public-ips).

Required | &nbsp;
------ | -----------
`ipAddressId`<br/>*UUID* | The id of the [public IP](#public-ips) where the port forwarding should be created
`protocol`<br/>*string* | The protocol (e.g. TCP, UDP) to forward
`privatePortStart`<br/>*string* | The start of the private port range
`privatePortEnd`<br/>*string* | The end of the private port range
`publicPortStart`<br/>*string* | The start of the public port range
`publicPortEnd`<br/>*string* | The end of the public port range

Optional | &nbsp;
------ | -----------
`instanceId`<br/>*UUID* | The id of the [instance](#instances) that will have a port forwarded (it will use the default private port)
`privateIpId`<br/>*UUID* | The id of the private IP to forward


<!-------------------- DELETE A PORT FORWARDING RULE -------------------->


#### Delete a port forwarding rule


```shell

# Example:

curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/compute-on/test_area/portforwardingrules/7d22b390-cbb3-4df6-96c6-52901ccb63c0"
```
```go
resources, _ := ccaClient.GetResources("compute-on", "test_area")
ccaResources := resources.(cloudca.Resources)
success, err := ccaResources.PortForwardingRules.Delete("7d22b390-cbb3-4df6-96c6-52901ccb63c0")
```

<code>DELETE /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/portforwardingrules/:id</code>

Delete an existing port forwarding rule.
