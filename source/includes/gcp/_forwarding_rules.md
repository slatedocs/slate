#### Forwarding rules

A forwarding rule and its corresponding IP address represent the frontend configuration of a load balancer.

<!-------------------- LIST FORWARDING RULES -------------------->
##### List forwarding rules

```shell
curl -X GET \
  -H 'MC-Api-key: your_api_key'
  "https://cloudmc_endpoint/api/v1/services/gcp/test-area/forwardingrules"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "creationTimestamp": "2019-10-22T15:23:35.006-07:00",
      "description": "",
      "IPAddress": "35.227.251.25",
      "IPProtocol": "TCP",
      "ipVersion": "IPV4",
      "kind": "compute#forwardingRule",
      "loadBalancingScheme": "EXTERNAL",
      "networkTier": "PREMIUM",
      "portRange": "80-80",
      "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area/global/forwardingRules/my-forwarding-rule",
      "target": "https://www.googleapis.com/compute/v1/projects/test-area/global/targetHttpProxies/my-target-proxy",
      "shortTarget": "my-target-proxy",
      "id": "4724455712741277576",
      "name": "my-forwarding-rule"
   }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>
   GET /service/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/forwardingrules
</code>

Retrieve a list of all forwarding rules.

Attributes | &nbsp;
------- | -----------
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`description` <br/>*string* | An optional description of this resource.
`id`<br/>*string* | The unique identifier for the resource. This identifier is defined by the server.
`IPAddress`<br/>*string* | The IP address that this forwarding rule serves. 
`IPProtocol`<br/>*string* | The IP protocol to which this rule applies. The default protocol is TCP.
`ipVersion`<br/>*string* | The IP version that will be used by this forwarding rule. The default IP version is IPV4.
`kind`<br/>*string* | Type of the resource.
`loadBalancingScheme`<br/>*string* | Specifies the forwarding rule type. The default value is EXTERNAL.
`name`<br/>*string* | Name of the resource. Provided by the client when the resource is created.
`networkTier`<br/>*string* | This signifies the networking tier used for configuring this load balancer.
`portRange`<br/>*string* | The destination ports that this forwarding rule forwards packets with.
`selfLink`<br/>*string* | Server-defined URL for this resource.
`shortTarget`<br/>*string* | The name of the target resource.
`target`<br/>*string* | The URL of the target resource to receive the matched traffic.

<!-------------------- RETRIEVE A FORWARDING RULE -------------------->

##### Retrieve a forwarding rule

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/forwardingrules/4724455712741277576"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
      "creationTimestamp": "2019-10-22T15:23:35.006-07:00",
      "description": "",
      "IPAddress": "35.227.251.25",
      "IPProtocol": "TCP",
      "ipVersion": "IPV4",
      "kind": "compute#forwardingRule",
      "loadBalancingScheme": "EXTERNAL",
      "networkTier": "PREMIUM",
      "portRange": "80-80",
      "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area/global/forwardingRules/my-forwarding-rule",
      "target": "https://www.googleapis.com/compute/v1/projects/test-area/global/targetHttpProxies/my-target-proxy",
      "shortTarget": "my-target-proxy",
      "id": "4724455712741277576",
      "name": "my-forwarding-rule"
   }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/forwardingrules/:id</code>

Retrieve a forwarding rule in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`description` <br/>*string* | An optional description of this resource.
`id`<br/>*string* | The unique identifier for the resource. This identifier is defined by the server.
`IPAddress`<br/>*string* | The IP address that this forwarding rule serves. 
`IPProtocol`<br/>*string* | The IP protocol to which this rule applies. The default protocol is TCP.
`ipVersion`<br/>*string* | The IP version that will be used by this forwarding rule. The default IP version is IPV4.
`kind`<br/>*string* | Type of the resource.
`loadBalancingScheme`<br/>*string* | Specifies the forwarding rule type. The default value is EXTERNAL.
`name`<br/>*string* | Name of the resource. Provided by the client when the resource is created.
`networkTier`<br/>*string* | This signifies the networking tier used for configuring this load balancer.
`portRange`<br/>*string* | The destination ports that this forwarding rule forwards packets with.
`selfLink`<br/>*string* | Server-defined URL for this resource.
`shortTarget`<br/>*string* | The name of the target resource.
`target`<br/>*string* | The URL of the target resource to receive the matched traffic.

<!-------------------- CREATE A FORWARDING RULE -------------------->
##### Create a forwarding rule

```shell
curl -X POST \
  -H 'MC-Api-Key: your_api_key' \
  -H "Content-Type: application/json" \
  -d "request _body" \
  "https://cloudmc_endpoint/api/v1/services/gcp/test-area/forwardingrules"
```
> Request body examples:

```js
// Creating a forwarding rule with ephemeral IP
{
  "portRange": "80",
  "name": "my-forwarding-name",
  "shortTarget": "my-target-proxy"
}

// Creating a forwarding rule with new static IP
{
  "portRange": "80",
  "name": "my-forwarding-name",	
  "shortTarget": "my-target-proxy",
  "reserveStaticIP": true
}

// Creating a forwarding rule with ephemeral IP
{
  "portRange": "80",  
  "name": "my-forwarding-name",
  "shortTarget": "my-target-proxy",  
  "shortIPAddress": "my-IP-address"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/forwardingrules</code>

Create a new forwarding rule.

Required | &nbsp;
------- | -----------
`name`<br/>*string* | The display name of the forwarding rule.
`portRange`<br/>*string* | The port which will be allocated to the forwarding rule. Supported ports are: 80 or 8080 (HTTP) and 443 (HTTPS).
`shortTarget`<br/>*string* | The name of the target resource.

Optional | &nbsp;
------- | -----------
`description`<br/>*string* | Description of the forwarding rule.
`reserveStaticIP`<br/>*boolean* | If the value is false and if no shortIPAddress is provided, an ephemeral external IP address will be assigned. 
`shortIPAddress`<br/>*string* | The name of an existing global external IP address assigned to the rule. This argument is only valid in conjunction with reserveStaticIP being false. If the value is false and shortIPAddress is provided, then the existing external IP address will be assigned. If the value is true, a new external static IP will be reserved and assigned.

<!-------------------- DELETE A FORWARDING RULE -------------------->

##### Delete a forwarding rule

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/forwardingrules/5459493658413662148"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/forwardingrules/:id</code>

Destroy an existing global forwarding rule.
