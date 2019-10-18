#### Load balancer

HTTP(S) load balancing can balance HTTP and HTTPS traffic across multiple backend instances, across multiple regions. Your entire app is available via a single global IP address, resulting in a simplified DNS setup. HTTP(S) load balancing is scalable, fault-tolerant, requires no pre-warming, and enables content-based load balancing. For HTTPS traffic, it provides SSL termination and load balancing.

<!-------------------- LIST LOAD BALANCERS -------------------->

#### List load balancers

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





