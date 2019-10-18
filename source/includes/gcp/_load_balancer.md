#### Load balancer

HTTP(S) load balancing can balance HTTP and HTTPS traffic across multiple backend instances, across multiple regions. Your entire app is available via a single global IP address, resulting in a simplified DNS setup. HTTP(S) load balancing is scalable, fault-tolerant, requires no pre-warming, and enables content-based load balancing. For HTTPS traffic, it provides SSL termination and load balancing.

<!-------------------- LIST LOAD BALANCERS -------------------->

#### List instance groups

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
            "forwardingRule": "https://www.googleapis.com/compute/v1/projects/cmc-gcp-htu/global/forwardingRules/forward123",
            "targetProxy": "https://www.googleapis.com/compute/v1/projects/cmc-gcp-htu/global/targetHttpsProxies/hellowrold-target-proxy",
            "urlMap": "https://www.googleapis.com/compute/v1/projects/cmc-gcp-htu/global/urlMaps/hellowrold",
            "backendService": "https://www.googleapis.com/compute/v1/projects/cmc-gcp-htu/global/backendServices/tes1",
            "sslCertificates": [
                "https://www.googleapis.com/compute/v1/projects/cmc-gcp-htu/global/sslCertificates/ssl-root-frx"
            ],
            "name": "hellowrold",
            "protocol": "HTTPS",
            "publicAddress": "*.fadam.products.cloudops.net",
            "backends": [
                "instance-group-1",
                "instance-group-test"
            ],
            "shortBackends": "instance-group-1, instance-group-test"
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
`id`<br/>*String* | The id of this resource, which should be the same id as corresponding forwarding rule
`forwardingRule`<br/>*String* | Server-defined URL for corresponding forwarding rule
`targetProxy`<br/>*String* | Server-defined URL for corresponding target proxy
`urlMap`<br/>*String* | Server-defined URL for corresponding url map
`backendService`<br/>*String* | Server-defined URL for corresponding backend service
`name`<br/>*String* | The name of this resource
`protocol`<br/>*String* | The protocol of this resource
`publicAddress`<br/>*String* | The public address which allow user access their service quickly
`backends`<br/>*List<String>* | The list of backends for this resource
