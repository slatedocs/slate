#### Target proxies

Target proxies route incoming request to either a URL map (HTTP(S) load balancing) or a backend service (SSL/TCP load balancing).

<!-------------------- LIST TARGET PROXIES -------------------->

##### List target proxies

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/targetproxies"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
       "creationTimestamp": "2019-10-01T08:52:41.664-07:00",
       "id": "2137054791002409126",
       "kind": "compute#targetHttpProxy",
       "name": "targetProxyName",
       "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area-oox/global/targetHttpProxies/targetProxyName",
       "urlMap": "https://www.googleapis.com/compute/v1/projects/test-area-oox/global/urlMaps/urlMapName",
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
| `kind`<br/>*string*              | Type of the resource. Either compute#targetHttpProxy or compute#targetHttpsProxy for target proxies. |
| `name`<br/>*string*              | Name of the resource. |
| `selfLink`<br/>*string*          | Server-defined URL for the resource. |
| `shortUrlMap`<br/>*string*       | A short version of the URL map name. |
| `shortCertificates`<br/>*string* | A short version of the SSL certificate name. |
| `type`<br/>*enum*                | A short version of the kind of resource. Either HTTP or HTTPS. |
| `urlMap`<br/>*string*            | URL to the UrlMap resource that defines the mapping from URL to the BackendService. |

<!-------------------- RETRIEVE A TARGET PROXY -------------------->

##### Retrieve a target proxy

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/targetproxies/2137054791002409126"
```
> The above command returns a JSON structured like this:

```json
{
    "data": {
         "creationTimestamp": "2019-10-01T08:52:41.664-07:00",
         "id": "2137054791002409126",
         "kind": "compute#targetHttpsProxy",
         "name": "targetProxyName",
         "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area-oox/global/targetHttpsProxies/targetProxyName",
         "sslCertificates": [
           "https://www.googleapis.com/compute/v1/projects/test-area-oox/global/sslCertificates/sslCertificateName"
         ],
         "type": "HTTPS",
         "urlMap": "https://www.googleapis.com/compute/v1/projects/test-area-oox/global/urlMaps/urlMapName",
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
| `kind`<br/>*string*              | Type of the resource. Either compute#targetHttpProxy or compute#targetHttpsProxy for target proxies. |
| `name`<br/>*string*              | Name of the resource. |
| `selfLink`<br/>*string*          | Server-defined URL for the resource. |
| `shortUrlMap`<br/>*string*       | A short version of the URL map name. |
| `shortCertificates`<br/>*string* | A short version of the SSL certificate name. |
| `type`<br/>*enum*                | A short version of the kind of resource. Either HTTP or HTTPS. |
| `urlMap`<br/>*string*            | URL to the UrlMap resource that defines the mapping from URL to the BackendService. |

<!-------------------- CREATE A TARGET PROXY -------------------->

##### Create a target proxy

```shell
# Example request: Specifying an existing URL map
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/targetProxies"
```
> Request body examples:

```js
// Specifying an existing URL map
{
   "name": "targetProxyName",
   "type": "HTTPS",
   "shortUrlMap": "urlMapName",
   "shortCertificates": "sslCertificateName"
}
```

```js
// Specifying a backend service, a default URL map will be created automatically
{
   "name": "targetProxyName",
   "type": "HTTPS",
   "shortBackend": "backendServicesName",
   "shortCertificates": "sslCertificateName"
}
```


<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/targetProxies</code>

Create a new target proxy.

| Required                         | &nbsp; |
| -------------------------------- | ------ |
| `name`<br/>*string*              | Name of the resource. |
| `type`<br/>*enum*                | A short version of the kind of resource. |
| `shortBackend`<br/>*string*      | A short version of the backend service name. The `shortBackend` and `shortUrlMap` attributes are mutually exclusive. |
| `shortCertificates`<br/>*string* | A short version of the SSL certificate name. Specifying an SSL certificate is only required when creating an HTTPS target proxy.|
| `shortUrlMap`<br/>*string*       | A short version of the URL map name. The `shortBackend` and `shortUrlMap` attributes are mutually exclusive. |

<!-------------------- DELETE A TARGET PROXY -------------------->

##### Delete a target proxy

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/targetproxies/2137054791002409126"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/targetproxies/:id</code>

Delete an existing target proxy. A target proxy can only be deleted if it is not used in any [urlMap](#gcp-urlMaps).
