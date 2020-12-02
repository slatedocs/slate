#### Backend services

A backend service directs traffic to backends, such as [instance groups](#gcp-instance-groups).

<!-------------------- LIST BACKEND SERVICES -------------------->

##### List backend services

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/backendservices"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "affinityCookieTtlSec": 0,
      "backends": [
        {
          "balancingMode": "UTILIZATION",
          "capacityScaler": 1.0,
          "description": "",
          "group": "https://www.googleapis.com/compute/v1/projects/testAreaName/zones/us-central1-a/instanceGroups/instanceGroupName",
          "maxUtilization": 0.8
        }
      ],
      "connectionDraining": {
        "drainingTimeoutSec": 300
      },
      "creationTimestamp": "2019-09-23T12:57:58.039-07:00",
      "description": "",
      "enableCDN": false,
      "fingerprint": "nH5X-L6Fovs=",
      "healthChecks": [
        "https://www.googleapis.com/compute/v1/projects/testAreaName/global/healthChecks/healthCheckName"
      ],
      "kind": "compute#backendService",
      "loadBalancingScheme": "EXTERNAL",
      "port": 80,
      "portName": "http",
      "protocol": "HTTP",
      "selfLink": "https://www.googleapis.com/compute/v1/projects/testAreaName/global/backendServices/backendServiceName",
      "sessionAffinity": "NONE",
      "timeoutSec": 30,
      "shortHealthChecks": "healthCheckName",
      "shortBackends": "instanceGroupName",
      "id": "526709884866305321",
      "name": "backendServiceName"
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/backendservices</code>

Retrieve a list of all backend services in an [environment](#administration-environments).

| Attributes                          | &nbsp; |
| ----------------------------------- | ------ |
| `affinityCookieTtlSec`<br/>*number* | If set to 0, the cookie is non-persistent and lasts only until the end of the browser session (or equivalent). The maximum allowed value is one day (86,400).|
| `backends`<br/>*object*             | The list of backends that serve this BackendService.|
| `connectionDraining`<br/>*object*   | - |
| `creationTimestamp`<br/>*string*    | Creation timestamp in RFC3339 text format. |
| `description`<br/>*string*          | An optional description of the resource. |
| `enableCDN`<br/>*boolean*           | If true, enables Cloud CDN for the backend service. Only applicable if the `loadBalancingScheme` is EXTERNAL and the protocol is HTTP or HTTPS. |
| `fingerprint`<br/>*string*          | Fingerprint of this resource. A hash of the contents stored in this object. |
| `healthChecks`<br/>*string*         | The list of URLs to the HttpHealthCheck or HttpsHealthCheck resource for health checking this BackendService. Currently at most one health check can be specified. |
| `id`<br/>*UUID*                     | The id of the backend service. |
| `kind`<br/>*string*                 | Type of the resource. Always compute#backendService for backend services.|
| `loadBalancingScheme`<br/>*enum*    | Indicates whether the backend service will be used with internal or external load balancing. Possible values are INTERNAL and EXTERNAL.|
| `name`<br/>*string*                 | Name of the resource. |
| `portName`<br/>*string*             | A named port on a backend instance group representing the port for communication to the backend VMs in that group. |
| `protocol`<br/>*enum*               | The protocol this BackendService uses to communicate with backends. Possible values are HTTP or HTTPS. |
| `selfLink`<br/>*string*             | Server-defined URL for the resource. |
| `sessionAffinity`<br/>*enum*        | Type of session affinity to use. The default is NONE. |
| `shortBackends`<br/>*string*        | A short version of the list of backends. |
| `shortHealthChecks`<br/>*string*    | A short version of the health checks. |
| `timeoutSec`<br/>*number*           | The default is 30 seconds. |

<!-------------------- RETRIEVE A BACKEND SERVICE -------------------->

##### Retrieve a backend service

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/backendservices"
```
> The above command returns a JSON structured like this:

```json
{
    "data": {
      "affinityCookieTtlSec": 0,
      "backends": [
        {
          "balancingMode": "UTILIZATION",
          "capacityScaler": 1.0,
          "description": "",
          "group": "https://www.googleapis.com/compute/v1/projects/testAreaName/zones/us-central1-a/instanceGroups/instanceGroupName",
          "maxUtilization": 0.8
        }
      ],
      "connectionDraining": {
        "drainingTimeoutSec": 300
      },
      "creationTimestamp": "2019-09-23T12:57:58.039-07:00",
      "description": "",
      "enableCDN": false,
      "fingerprint": "nH5X-L6Fovs=",
      "healthChecks": [
        "https://www.googleapis.com/compute/v1/projects/testAreaName/global/healthChecks/healthCheckName"
      ],
      "kind": "compute#backendService",
      "loadBalancingScheme": "EXTERNAL",
      "port": 80,
      "portName": "http",
      "protocol": "HTTP",
      "selfLink": "https://www.googleapis.com/compute/v1/projects/testAreaName/global/backendServices/backendServiceName",
      "sessionAffinity": "NONE",
      "timeoutSec": 30,
      "shortHealthChecks": "healthCheckName",
      "shortBackends": "instanceGroupName",
      "id": "526709884866305321",
      "name": "backendServiceName"
    }  
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/backendservices/:id</code>

Retrieve a backend service in an [environment](#administration-environments).

| Attributes                          | &nbsp; |
| ----------------------------------- | ------ |
| `affinityCookieTtlSec`<br/>*number* | If set to 0, the cookie is non-persistent and lasts only until the end of the browser session (or equivalent). The maximum allowed value is one day (86,400).|
| `backends`<br/>*object*             | The list of backends that serve this BackendService.|
| `connectionDraining`<br/>*object*   | - |
| `creationTimestamp`<br/>*string*    | Creation timestamp in RFC3339 text format. |
| `description`<br/>*string*          | An optional description of the resource. |
| `enableCDN`<br/>*boolean*           | If true, enables Cloud CDN for the backend service. Only applicable if the `loadBalancingScheme` is EXTERNAL and the protocol is HTTP or HTTPS. |
| `fingerprint`<br/>*string*          | Fingerprint of this resource. A hash of the contents stored in this object. |
| `healthChecks`<br/>*string*         | The list of URLs to the HttpHealthCheck or HttpsHealthCheck resource for health checking this BackendService. Currently at most one health check can be specified. |
| `id`<br/>*UUID*                     | The id of the backend service. |
| `kind`<br/>*string*                 | Type of the resource. Always compute#backendService for backend services.|
| `loadBalancingScheme`<br/>*enum*    | Indicates whether the backend service will be used with internal or external load balancing. Possible values are INTERNAL and EXTERNAL.|
| `name`<br/>*string*                 | Name of the resource. |
| `portName`<br/>*string*             | A named port on a backend instance group representing the port for communication to the backend VMs in that group. |
| `protocol`<br/>*enum*               | The protocol this BackendService uses to communicate with backends. Possible values are HTTP or HTTPS. |
| `selfLink`<br/>*string*             | Server-defined URL for the resource. |
| `sessionAffinity`<br/>*enum*        | Type of session affinity to use. The default is NONE. |
| `shortBackends`<br/>*string*        | A short version of the list of backends. |
| `shortHealthChecks`<br/>*string*    | A short version of the health checks. |
| `timeoutSec`<br/>*number*           | The default is 30 seconds. |

<!-------------------- CREATE A BACKEND SERVICE -------------------->

##### Create backend service

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/backendservices"
```
> Request body example:

```json
{
  "name": "my-instance",
  "shortRegion": "northamerica-northeast1",
  "shortZone": "northamerica-northeast1-a",
  "bootDiskType": "pd-standard",
  "bootDiskSizeInGb": "10",
  "cpuCount": "2",
  "memoryInGB": "4.5",
  "osImageSelfLink": "https://www.googleapis.com/compute/v1/projects/debian-cloud/global/images/debian-9-stretch-v20190514",
  "externalIp": {
    "id": "3645738160550100933"
  }
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/backendservices</code>

Create a new backend service.

| Required | &nbsp;|
| --- | --- |
| `name`<br/>*string* | The display name of the backend service. |
| `shortBackends`<br/>*string* | A short version of the list of backends. |
| `shortHealthChecks`<br/>*string* | A short version of the health checks. |

<!-------------------- DELETE A BACKEND SERVICE -------------------->

##### Delete a backend service

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/backendservices/2570199154720991429"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/backendservices/:id</code>

Delete an existing backend service. A backend service can only be deleted if it is not used in any [urlMap](#gcp-urlMaps).