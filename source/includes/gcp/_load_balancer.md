#### Load balancer

HTTP(S) load balancing can balance HTTP and HTTPS traffic across multiple backend instances, across multiple regions. Your entire app is available via a single global IP address, resulting in a simplified DNS setup. HTTP(S) load balancing is scalable, fault-tolerant, requires no pre-warming, and enables content-based load balancing. For HTTPS traffic, it provides SSL termination and load balancing.

<!-------------------- LIST LOAD BALANCERS -------------------->

##### List load balancers

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/loadbalancers"
```
> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "id": "8268558443601303519",
            "forwardingRules": [
                "https://www.googleapis.com/compute/v1/projects/test-area/global/forwardingRules/gfr-test-cme",
                "https://www.googleapis.com/compute/v1/projects/test-area/global/forwardingRules/gfr-test-qxq"
            ],
            "targetProxies": [
                "https://www.googleapis.com/compute/v1/projects/test-area/global/targetHttpProxies/tp-test-fkb",
                "https://www.googleapis.com/compute/v1/projects/test-area/global/targetHttpsProxies/tp-test-rqi"
            ],
            "urlMap": "https://www.googleapis.com/compute/v1/projects/test-area/global/urlMaps/um-test-dfr",
            "backendServices": [
                "https://www.googleapis.com/compute/v1/projects/test-area/global/backendServices/be-test-jik"
            ],
            "name": "um-test-dfr"
        }
    ],
    "metadata": {
        "recordCount": 1
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/loadbalancers</code>

Retrieve a list of all load balancers in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`backendServices`<br/>*List<String>* | The list of backends for this resource.
`forwardingRules`<br/>*List<String>* | The list of forwarding rules for this resource.
`id`<br/>*String* | The id of this resource, which should be the same id as corresponding Url Map.
`name`<br/>*String* | The name of this resource.
`targetProxies`<br/>*List<String>* | The list of target proxies for this resource.
`urlMap`<br/>*String* | Server-defined URL for corresponding url map.

<!-------------------- RETRIEVE A LOAD BALANCER -------------------->

#### Retrieve a load balancer

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/loadbalancers/8268558443601303519"
```
> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": "8268558443601303519",
        "forwardingRules": [
            "https://www.googleapis.com/compute/v1/projects/test-area/global/forwardingRules/gfr-test-cme",
            "https://www.googleapis.com/compute/v1/projects/test-area/global/forwardingRules/gfr-test-qxq"
        ],
        "targetProxies": [
            "https://www.googleapis.com/compute/v1/projects/test-area/global/targetHttpProxies/tp-test-fkb",
            "https://www.googleapis.com/compute/v1/projects/test-area/global/targetHttpsProxies/tp-test-rqi"
        ],
        "urlMap": "https://www.googleapis.com/compute/v1/projects/test-area/global/urlMaps/um-test-dfr",
        "backendServices": [
            "https://www.googleapis.com/compute/v1/projects/test-area/global/backendServices/be-test-jik"
        ],
        "name": "um-test-dfr"
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/loadbalancers/:id</code>

Retrieve a load balancer in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`backendServices`<br/>*List<String>* | The list of backends for this resource.
`forwardingRules`<br/>*List<String>* | The list of forwarding rules for this resource.
`id`<br/>*String* | The id of this resource, which should be the same id as corresponding Url Map.
`name`<br/>*String* | The name of this resource.
`targetProxies`<br/>*List<String>* | The list of target proxies for this resource.
`urlMap`<br/>*String* | Server-defined URL for corresponding url map.

<!-------------------- CREATE A LOADBALANCER -------------------->
##### Create a load balancer

```shell
curl -X POST \
  -H 'MC-Api-Key: your_api_key' \
  -H "Content-Type: application/json" \
  -d "request_body" \
  "https://cloudmc_endpoint/api/v2/services/gcp/test-area/loadbalancers"
```
> Request body examples:

```js
// Creating loadbalancer with ephemeral IP
{
	"name":"my-loadbalancer-name",
	"shortBackend": "my-backend-backend",
	"shortProtocol": "HTTP",
	"shortPort": "80"
}

// Creating loadbalancer with existing IP
{
	"name":"my-loadbalancer-name",
	"shortBackend": "my-backend-backend",
	"shortProtocol": "HTTP",
	"shortPort": "80",
    "shortIP": "my-ip-name",
}

// Creating loadbalancer with new static IP
{
	"name":"my-loadbalancer-name",
	"shortBackend": "my-backend-backend",
	"shortProtocol": "HTTP",
	"shortPort": "80",
    "reserveStaticIP": true
}

// Creating loadbalancer with HTTPS protocol
{
	...
    "shortPort": "443",
    "shortCertificate": "my-SSL-certificate"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/loadbalancers</code>

Create a new load balancer.

Required | &nbsp;
------- | -----------
`name`<br/>*string* | The display name of the load balancer.
`shortBackend`<br/>*string* | The existing backend serivce that will be attached to this load balancer.
`shortProtocol`<br/>*string* | The protocol of this resource.
`shortPort`<br/>*string* | The port number of this resource.

Optional | &nbsp;
------- | -----------
`reserveStaticIP`<br/>*boolean* | If the value is false and if no shortIP is provided, an ephemeral external IP address will be assigned. If the value is true, a new static IP would be reserved and provided to the resource.
`shortIP`<br/>*string* | The name of an existing global external IP address assigned to the frontend. This argument is only valid in conjunction with reserveStaticIP being false. If the value is false and shortIP is provided, then the existing external IP address will be assigned. If the value is true, a new external static IP will be reserved and assigned.
`shortCertificate`<br/>*string* | The name of the SSL certificate that will be attached to the target proxy if HTTPS is selected. (Required if HTTPS is selected for shortProtocol)

<!-------------------- DELETE A LOAD BALANCER -------------------->

#### Delete a load balancer

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/gcp/test-area/loadbalancers/8268558443601303519"
```
> The above command returns a JSON structured like this:

```json
{
  "shortBackendsToDelete": ["be-test-jik", "be-other-srd"],
  "shortHealthChecksToDelete": ["hc-test-olp", "hc-other-kop"],
  "shortSslCertificatesToDelete": ["sc-test-ert"]
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/loadbalancers/:id</code>

Delete an existing load balancer.

<aside class="notice">
By default the forwarding rules, target proxies and url map will be deleted.
</aside>

<aside class="notice">
If a health check is specified, the backend(s) using this health check in the load balancer, will also be selected for deletion.
</aside>

<aside class="notice">
Any specified optional resources to be removed will be deleted if they can be deleted. If any other resource outside of the current load balancer is using them, the delete will not happen. The overall delete operation will still be marked as successful.
</aside>

Optional | &nbsp;
------ | -----------
`shortBackendsToDelete`<br/>*List<String>* | A list of backend services to delete.
`shortHealthChecksToDelete`<br/>*List<String>* | A list of health checks to delete.
`shortSslCertificatesToDelete`<br/>*List<String>* | A list of SSL certificates to delete.
