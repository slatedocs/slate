#### Target proxies

Target proxies route incoming request to either a URL map (HTTP(S) load balancing) or a backend service (SSL/TCP load balancing).

<!-------------------- LIST TARGET PROXIES -------------------->

##### List target proxies

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/targetproxies"

# Example:
```

```json
{
  "data": [
    {
       "creationTimestamp": "2019-10-01T08:52:41.664-07:00",
       "id": "2137054791002409126",
       "kind": "compute#targetHttpProxy",
       "name": "targetProxyName",
       "selfLink": "https://www.googleapis.com/compute/v1/projects/testAreaName/global/targetHttpProxies/targetProxyName",
       "urlMap": "https://www.googleapis.com/compute/v1/projects/testAreaName/global/urlMaps/urlMapName",
       "type": "HTTP",
       "shortUrlMap": "urlMapName"
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/targetproxies</code>

Retrieve a list of all target proxies in an [environment](#administration-environments).

| Attributes                       | &nbsp; |
| -------------------------------- | ------ |
| `creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format. |
| `id`<br/>*UUID*                  | The id of the backend service. |
| `kind`<br/>*string*              | Type of the resource. Either compute#targetHttpProxy, compute#targetHttpsProxy, compute#targetSslProxy or compute#TargetTcpProxy for target proxies. |
| `name`<br/>*string*              | Name of the resource. |
| `selfLink`<br/>*string*          | Server-defined URL for the resource. |
| `shortUrlMap`<br/>*string*       | A short version of the URL map. |
| `shortCertificates`<br/>*string* | A short version of the SSL certificates. |
| `type`<br/>*enum*                | A short version of the kind of resource. Either HTTP, HTTPS, SSL or TCP. |
| `urlMap`<br/>*string*            | URL to the UrlMap resource that defines the mapping from URL to the BackendService. |

<!-------------------- RETRIEVE A TARGET PROXY -------------------->

##### Retrieve a target proxy

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/targetproxies/2137054791002409126"

# Example:
```

```json
{
    "data": {
         "creationTimestamp": "2019-10-01T08:52:41.664-07:00",
         "id": "2137054791002409126",
         "kind": "compute#targetHttpsProxy",
         "name": "targetProxyName",
         "selfLink": "https://www.googleapis.com/compute/v1/projects/testAreaName/global/targetHttpsProxies/targetProxyName",
         "sslCertificates": [
           "https://www.googleapis.com/compute/v1/projects/testAreaName/global/sslCertificates/sslCertificateName1"
         ],
         "type": "HTTPS",
         "urlMap": "https://www.googleapis.com/compute/v1/projects/testAreaName/global/urlMaps/urlMapName",
         "shortUrlMap": "urlMapName",
         "shortCertificates": "sslCertificateName"
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/targetproxies/:id</code>

Retrieve a target proxy in an [environment](#administration-environments).

| Attributes                       | &nbsp; |
| -------------------------------- | ------ |
| `creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format. |
| `id`<br/>*UUID*                  | The id of the backend service. |
| `kind`<br/>*string*              | Type of the resource. Either compute#targetHttpProxy, compute#targetHttpsProxy, compute#targetSslProxy or compute#TargetTcpProxy for target proxies. |
| `name`<br/>*string*              | Name of the resource. |
| `selfLink`<br/>*string*          | Server-defined URL for the resource. |
| `shortUrlMap`<br/>*string*       | A short version of the URL map. |
| `shortCertificates`<br/>*string* | A short version of the SSL certificates. |
| `type`<br/>*enum*                | A short version of the kind of resource. Either HTTP, HTTPS, SSL or TCP. |
| `urlMap`<br/>*string*            | URL to the UrlMap resource that defines the mapping from URL to the BackendService. |

<!-------------------- CREATE A TARGET PROXY -------------------->

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/targetProxies"

# Examples:
```

```json
{
   "name": "targetProxyName",
   "type": "HTTPS",
   "shortUrlMap": "urlMapName",
   "shortCertificates": "sslCertificateName"
}
```

```json
{
   "name": "targetProxyName",
   "type": "HTTPS",
   "shortBackend": "backendServicesName",
   "shortCertificates": "sslCertificateName"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/targetProxies</code>

Create a new target proxy

| Attributes | &nbsp;|
| --- | --- |
| `name`<br/>*string*              | Name of the resource. |
| `shortBackend`<br/>*string*      | A short version of the backend service. |
| `shortCertificates`<br/>*string* | A short version of the SSL certificates. |
| `shortUrlMap`<br/>*string*       | A short version of the URL map. |
| `type`<br/>*enum*                | A short version of the kind of resource. Either HTTP, HTTPS, SSL or TCP. |

<aside class="notice">
A SSL certificate is required when creating an HTTPS target proxy.
</aside>

<aside class="notice">
A backend service or URL map is required, but not both. A URL map will be created when passing a backend service.
</aside>

<!-------------------- DELETE A TARGET PROXY -------------------->

##### Delete a target proxy

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/targetproxies/2137054791002409126"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/targetproxies/:id</code>

Delete an existing target proxy. A target proxy can only be deleted if it is not used in any [urlMap](#gcp-urlMaps).
