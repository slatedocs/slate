<!-- Load balancer rules -->

### Load balancer rules

#### List load balancer rules

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/loadbalancerrules?public_ip_id=eb763d03-9935-4cd4-8a42-99134e242ccb"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
     {
        "id": "32804ef2-dea6-4b07-b507-b3562bb9844a",
        "name": "web_lbr",
        "networkId": "394873ef-8655-49b6-8096-58b99c4e2347",
        "publicIp": "172.31.3.202",
        "publicIpId": "44ebac5d-18cc-4eea-ab59-7a2af0691c88",
        "publicPort": "80",
        "privatePort": "80",
        "algorithm": "roundrobin",
        "protocol": "ssl",
        "stickinessMethod": "AppCookie",
        "instanceIds": [
           "d7048640-35d4-4a4f-8193-f4837da7e861"
        ],
        "sslCertificateId": "b1bea50a-e5f0-4b1e-bc0d-1dde909ac49a",
        "stickinessPolicyId": "217c1140-4146-4af0-92e9-ad47d4ff5ba9",
        "stickinessPolicyParameters": {
           "mode": "test",
           "indirect": "false",
           "domain": "some_domain",
           "postonly": "false",
           "nocache": "true",
           "cookieName": "test"
        }
     }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```
<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/loadbalancerrules?public_ip_id=:public_ip_id</code>

Retrieve a list of load balancer rules.

Attributes                 | &nbsp;
---------------------------|-------
`id`<br/>*UUID*            | The id of the load balancer rule
`name`<br/>*string*        | The name of the load balancer rule
`networkId`<br/>*string*   | The [network](#cloudstack-networks) id of the load balancer rule
`publicIp`<br/>*UUID*      | The [public IP](#cloudstack-public-ips) of this load balancer rule
`publicIpId`<br/>*string*  | The id of the [public IP](#cloudstack-public-ips) of this load balancer rule
`publicPort`<br/>*int*     | The public port of this load balancer rule
`privatePort`<br/>*int*    | The private port of this load balancer rule
`algorithm`<br/>*string*   | The algorithm to use for this load balancer rule
`protocol`<br/>*string*    | The protocol to load balance
`stickinessMethod`<br/>*string* |  The stickiness policy of the load balancer rule
`stickinessPolicyParameters`<br/>*Map[string,string]* |  The stickiness policy parameters of the load balancer rule
`instanceIds`<br/>*Array[string]*   |  The ids of the instances being load balanced


Query Parameters | &nbsp;
---------- | -----
`public_ip_id`<br/>*UUID* | Filter the list to only retrieve the load balancer rules of a [public IP](#cloudstack-public-ips)

#### Retrieve a load balancer rule

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/loadbalancerrules/f8ed7f44-449c-4510-848c-dc18e6665db1"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
      "id": "f8ed7f44-449c-4510-848c-dc18e6665db1",
      "name": "web_lbr",
      "networkId": "394873ef-8655-49b6-8096-58b99c4e2347",
      "publicIp": "172.31.3.202",
      "publicIpId": "44ebac5d-18cc-4eea-ab59-7a2af0691c88",
      "publicPort": "22",
      "privatePort": "22",
      "algorithm": "roundrobin",
      "protocol": "tcp",
      "stickinessMethod": "LbCookie",
      "instanceIds": [
         "056cbb23-9021-4df7-b458-721ed9153ba9"
      ],
      "stickinessPolicyId": "29a1946c-5b59-4ab1-b9b8-5c73444b1c10",
      "stickinessPolicyParameters": {
         "mode": "test",
         "indirect": "false",
         "domain": "some_domain",
         "postonly": "false",
         "nocache": "true",
         "cookieName": "test"
      }
   }
}
```
<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/loadbalancerrules/:id</code>

Retrieve a specific load balancer rule by its id.

Attributes                 | &nbsp;
---------------------------|-------
`id`<br/>*UUID*            | The id of the load balancer rule
`name`<br/>*string*        | The name of the load balancer rule
`networkId`<br/>*string*   | The [network](#cloudstack-networks) id of the load balancer rule
`publicIp`<br/>*UUID*      | The [public IP](#cloudstack-public-ips) of this load balancer rule
`publicIpId`<br/>*string*  | The id of the [public IP](#cloudstack-public-ips) of this load balancer rule
`publicPort`<br/>*int*     | The public port of this load balancer rule
`privatePort`<br/>*int*    | The private port of this load balancer rule
`algorithm`<br/>*string*   | The algorithm to use for this load balancer rule
`protocol`<br/>*string*    | The protocol to load balance
`stickinessMethod`<br/>*string* |  The stickiness policy of the load balancer rule
`stickinessPolicyParameters`<br/>*Map[string,string]* |  The stickiness policy parameters of the load balancer rule
`instanceIds`<br/>*Array[string]*   |  The ids of the instances being load balanced

#### Create a load balancer rule

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/loadbalancerrules"
```
> Request body example:

```json
{
   "name": "test",
   "publicIpId": "44ebac5d-18cc-4eea-ab59-7a2af0691c88",
   "networkId": "093f6208-8a56-4035-8e71-3e39029fc5aa",
   "publicPort": "80",
   "privatePort": "80",
   "algorithm": "roundrobin",
   "protocol": "ssl",
   "stickinessMethod": "AppCookie",
   "instanceIds": [
      "d7048640-35d4-4a4f-8193-f4837da7e861"
   ],
   "sslCertificateId": "b1bea50a-e5f0-4b1e-bc0d-1dde909ac49a",
   "stickinessPolicyParameters": {
      "holdtime": 3600000
   }
}
```
<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/loadbalancerrules</code>

Create a new load balancer rule associated to a public IP.

Required                   | &nbsp;
---------------------------|-------
`name`<br/>*string*        | The name of the load balancer rule
`publicIpId`<br/>*string*  | The id of the [public IP](#cloudstack-public-ips) of this load balancer rule
`publicPort`<br/>*int*     | The public port of this load balancer rule
`privatePort`<br/>*int*    | The private port of this load balancer rule
`algorithm`<br/>*string*   | The algorithm to use for this load balancer rule (roundrobin, leastconn or source)
`protocol`<br/>*string*    | The protocol to load balance (TCP, UDP or TCP-PROXY)

Optional (required if [public IP](#cloudstack-public-ips) already assigned a [network](#cloudstack-networks)) | &nbsp;
---------------------------|-------
`networkId`<br/>*string*   | The [network](#cloudstack-networks) id of the load balancer rule

Optional                 | &nbsp;
---------------------------|-------
`stickinessMethod`<br/>*string* |  The stickiness policy of the load balancer rule
`stickinessPolicyParameters`<br/>*Map[string, object]* |  The stickiness policy parameters of the load balancer rule
`instanceIds`<br/>*Array[string]*   |  The ids of the instances being load balanced
`sslCertificateId`<br/>*UUID* | The id of the SSL certificate for the load balancer rule. Can only be used with SSL protocol.

LbCookie parameters            | &nbsp;
---------------------------|-------
`cookieName`<br/>*string*  | Name of the cookie to be inserted by the load balancer for load balancing
`mode`<br/>*string*        | rewrite, insert or prefix. rewrite: This keyword indicates that the cookie will be provided by the server and that the load balancer will have to modify its value to set the server's identifier in it. insert: This keyword indicates that the persistence cookie will have to be inserted by the load balancer in server responses if the client did not already have a cookie that would have permitted it to access this server. prefix: This keyword indicates that instead of relying on a dedicated cookie for the persistence, an existing one will be completed.
`nocache`<br/>*boolean*    | This option is recommended in conjunction with the insert mode when there is a cache between the client and the load balancer, as it ensures that a cacheable response will be tagged non-cacheable if a cookie needs to be inserted.
`indirect`<br/>*boolean*   | When this option is specified, no cookie will be emitted to a client which already has a valid one for the server which has processed the request.
`postonly`<br/>*boolean*   | This option ensures that cookie insertion will only be performed on responses to POST requests.
`domain`<br/>*string*     | This option allows to specify the domain at which a cookie is inserted.

AppCookie parameters            | &nbsp;
---------------------------|-------
`cookieName`<br/>*string*  | Name of the cookie to be inserted by the application for load balancing.
`mode`<br/>*string*        | This option allows to change the URL parser mode. `path-parameters`(default) will look for the appsession cookie in the path parameters. `query-parameters` will look for the appsession cookie in the query parameters.
`length`<br/>*string*      | The maximum number of characters to check in the cookie value.
`holdtime`<br/>*boolean*   |  Time in milliseconds that the cookie should be saved.
`requestLearn`<br/>*boolean*   | If true, then it will be able to learn the cookie found in the request in case the server does not specify any in response.
`prefix`<br/>*string*     | If true, then it will match on the cookie prefix (or URL parameter prefix). The appsession value is the data following this prefix.

SourceBased parameters     | &nbsp;
---------------------------|-------
`tableSize`<br/>*string*   | The maximum number of entries that can be stored in the table.
`expires`<br/>*string*     | Defines the maximum duration of an entry in the table since it was last created, refreshed or matched. The expiration delay is defined using the standard time format, similarly as the various timeouts.

For more information, please consult section 4.2 of the HAProxy [configuration manual](https://cbonte.github.io/haproxy-dconv/1.5/configuration.html). ([AppCookie](https://cbonte.github.io/haproxy-dconv/1.5/configuration.html#4.2-appsession), [LbCookie](https://cbonte.github.io/haproxy-dconv/1.5/configuration.html#4.2-cookie), [SourceBased](https://cbonte.github.io/haproxy-dconv/1.5/configuration.html#4.2-stick-table))

#### Update a load balancer rule

```shell
curl -X PUT \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/loadbalancerrules/3247167a-e7e7-11e3-9187-06669c0000ad"
```
> Request body example:

```json
{
   "name": "test",
   "algorithm": "roundrobin"
}
```

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/loadbalancerrules/:id</code>

Update a load balancer rule.

Optional                   | &nbsp;
---------------------------|-------
`name`<br/>*string*        | The name of the load balancer rule
`algorithm`<br/>*string*   | The algorithm of the load balancer rule (roundrobin, leastconn or source)

#### Update instances of a load balancer rule

```shell
curl -X PUT \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/loadbalancerrules/3247167a-e7e7-11e3-9187-06669c0000ad"
```
> Request body example:

```json
{
   "instanceIds": [
      "95d034b5-b902-440c-b430-120efaed9caf", "60df0bc2-f59b-4608-8147-1b8ac4a39add"
   ]
}
```
<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/loadbalancerrules/:id?operation=updateInstances</code>

Update instances of a load balancer rule.

Required                   | &nbsp;
---------------------------|-------
`instanceIds`<br/>*Array[String]*        | The instances of the load balancer rule

#### Update stickiness policy of a load balancer rule

```shell
curl -X PUT \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/loadbalancerrules/3247167a-e7e7-11e3-9187-06669c0000ad"
```
> Request body example:

```json
{
   "stickinessMethod": "LbCookie",
   "stickinessPolicyParameters": {
      "mode": "test",
      "indirect": "false",
      "domain": "some_domain",
      "postonly": "false",
      "nocache": "true",
      "cookieName": "test"
   }
}
```
<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/loadbalancerrules/:id?operation=updateStickiness</code>

Update instances of a load balancer rule.

Required                   | &nbsp;
---------------------------|-------
`stickinessMethod`<br/>*string*        | The stickiness policy for the load balancer rule
`stickinessPolicyParameters`<br/>*Map[String, String]*        | The parameters for the stickiness policy of the load balancer rule

See [Create a load balance rule](#cloudstack-create-a-load-balancer-rule) for stickiness policy parameters documentation.

#### Delete a load balancer rule

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/loadbalancerrules/736d0c2e-d6b5-43fc-bcf0-732fce9a509e"
```
<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/loadbalancerrules/:id</code>

Delete a load balancer rule.
