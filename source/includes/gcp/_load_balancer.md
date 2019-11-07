#### Load balancer

HTTP(S) load balancing can balance HTTP and HTTPS traffic across multiple backend instances, across multiple regions. Your entire app is available via a single global IP address, resulting in a simplified DNS setup. HTTP(S) load balancing is scalable, fault-tolerant, requires no pre-warming, and enables content-based load balancing. For HTTPS traffic, it provides SSL termination and load balancing.

<!-------------------- LIST LOAD BALANCERS -------------------->

##### List load balancers

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/loadbalancers"

# The above command returns JSON structured like this:
```

```json
{
    "data": [
        {
            "id": "5538770461112637304",
            "forwardingRule": "https://www.googleapis.com/compute/v1/projects/test-project/global/forwardingRules/my-forwarding-rule",
            "targetProxy": "https://www.googleapis.com/compute/v1/projects/test-project/global/targetHttpsProxies/my-target-proxy",
            "urlMap": "https://www.googleapis.com/compute/v1/projects/test-project/global/urlMaps/my-url",
            "backendService": "https://www.googleapis.com/compute/v1/projects/test-project/global/backendServices/my-backendServices",
            "sslCertificates": [
                "https://www.googleapis.com/compute/v1/projects/test-project/global/sslCertificates/my-ssl-cert"
            ],
            "name": "my-loadbalancer",
            "protocol": "HTTPS",
            "publicAddress": "*.random.net",
            "backends": [
                "instance-group-1",
                "instance-group-2"
            ],
            "shortBackends": "instance-group-1, instance-group-2"
        }
    ],
    "metadata": {
        "recordCount": 1
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/loadbalancers</code>

Retrieve a list of all load balancers in a given [environment](#administration-environments)

Attributes | &nbsp;
------- | -----------
`backends`<br/>*List<String>* | The list of backends for this resource
`backendService`<br/>*String* | Server-defined URL for corresponding backend service
`forwardingRule`<br/>*String* | Server-defined URL for corresponding forwarding rule
`id`<br/>*String* | The id of this resource, which should be the same id as corresponding forwarding rule
`name`<br/>*String* | The name of this resource
`protocol`<br/>*String* | The protocol of this resource
`publicAddress`<br/>*String* | The public address which allow user access their service quickly
`shortBackends`<br/>*String* | The list of backends for this resource in string format 
`targetProxy`<br/>*String* | Server-defined URL for corresponding target proxy
`urlMap`<br/>*String* | Server-defined URL for corresponding url map


<!-------------------- RETRIEVE A LOAD BALANCER -------------------->

##### Retrieve a load balancer

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/loadbalancers/4546012045076151143"

# The above command returns JSON structured like this:
```

```json
{
  "data": {
    "id": "4546012045076151143",
     "forwardingRule": "https://www.googleapis.com/compute/v1/projects/test-project/global/forwardingRules/my-forwarding-rule",
    "targetProxy": "https://www.googleapis.com/compute/v1/projects/test-project/global/targetHttpsProxies/my-target-proxy",
    "urlMap": "https://www.googleapis.com/compute/v1/projects/test-project/global/urlMaps/my-url",
    "backendService": "https://www.googleapis.com/compute/v1/projects/test-project/global/backendServices/my-backendServices",
    "backendServices": [
      "https://www.googleapis.com/compute/v1/projects/cmc-gcp-env-jamie-hvh/global/backendServices/abackendservice"
    ],
    "name": "my-loadbalancer",
    "protocol": "HTTP",
    "publicAddress": "*.random.net",
    "reserveStaticIP": false,
    "shortBackends": "my-backend-service"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/loadbalancers/:id</code>

Retrieve a load balancer in a given [environment](#administration-environments)

Attributes | &nbsp;
------- | -----------
`backends`<br/>*List<String>* | The list of backends for this resource
`backendService`<br/>*String* | Server-defined URL for corresponding backend service
`forwardingRule`<br/>*String* | Server-defined URL for corresponding forwarding rule
`id`<br/>*String* | The id of this resource, which should be the same id as corresponding forwarding rule
`name`<br/>*String* | The name of this resource
`protocol`<br/>*String* | The protocol of this resource
`publicAddress`<br/>*String* | The public address which allow user access their service quickly
`shortBackends`<br/>*String* | The list of backends for this resource in string format 
`targetProxy`<br/>*String* | Server-defined URL for corresponding target proxy
`urlMap`<br/>*String* | Server-defined URL for corresponding url map

<!-------------------- CREATE A LOADBALANCER -------------------->
##### Create a load balancer

```shell
curl -X POST \
  -H 'MC-Api-Key: your_api_key' \
  -H "Content-Type: application/json" \
  -d "request _body" \
  "https://cloudmc_endpoint/v1/services/gcp/test-area/loadbalancers"
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/loadbalancers</code>

Create a new load balancer

Required | &nbsp;
------- | -----------
`name`<br/>*string* | The display name of the load balancer
`shortBackend`<br/>*string* | The existing backend serivce that will be attached to this load balancer.
`shortProtocol`<br/>*string* | The protocol of this resource.
`shortPort`<br/>*string* | The port number of this resource.

Optional | &nbsp;
------- | -----------
`reserveStaticIP`<br/>*boolean* | If the value is false and if no shortIP is provided, an ephemeral external IP address will be assigned. If the value is true, a new static IP would be reserved and provide to the resource.
`shortIP`<br/>*string* | The name of an existing global external IP address assigned to the frontend. This argument is only valid in conjunction with reserveStaticIP being false. If the value is false and shortIP is provided, then the existing external IP address will be assigned. If the value is true, a new external static IP will be reserved and assigned.




