### Health checks

<!-------------------- List HEALTH CHECK -------------------->
#### List health Checks

```shell
curl --request GET \
  --url http://cloudmc_endpoint/api/v2/services/your_service/your_environment/healthchecks \
  --header 'mc-api-key: your_api_keys'
  # The above command returns JSON structured like this:
```

```json
{
  "data": [
    {
      "checkIntervalSec": 10,
      "creationTimestamp": "2019-09-18T12:39:48.982-07:00",
      "description": "",
      "healthyThreshold": 2,
      "id": "5930212998788364011",
      "kind": "compute#healthCheck",
      "name": "firsthealthcheck",
      "selfLink": "https://www.googleapis.com/compute/v1/projects/cmc-gcp-env-jamie-hvh/global/healthChecks/firsthealthcheck",
      "tcpHealthCheck": {
        "port": 80,
        "proxyHeader": "NONE",
        "request": "",
        "response": ""
      },
      "timeoutSec": 5,
      "type": "TCP",
      "unhealthyThreshold": 3,
      "portNumber": "80"
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>
   GET /service/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/healthchecks
</code>

Retrieve a list of all healtch checks

Attributes | &nbsp;
------- | -----------
`checkIntervalSec`<br/>*int* | How often (in seconds) to send a health check. The default value is 5 seconds
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format
`description` <br/>*string* | An optional description of this resource. Provide this property when you create the resource.
`healthyThreshold`<br/>*int* | A so-far unhealthy instance will be marked healthy after this many consecutive successes. The default value is 2.
`id`<br/>*string* | The unique identifier for the resource. This identifier is defined by the server.ATTACHED, DETACHING, RESIZING, DELETING, and DEPRECATED.
`kind`<br/>*string* | Type of the resource.
`name`<br/>*string* | Name of the resource. Provided by the client when the resource is created.
`selfLink`<br/>*string* | Server-defined URL for this resource.
`tcpHealthCheck`<br/>*string* | object
`physicalBlockSizeBytes`<br/>*string* | Physical block size of the persistent disk, in bytes. Currently supported sizes are 4096 and 16384.
`timeoutSec`<br/>*int* | How long (in seconds) to wait before claiming failure. The default value is 5 seconds. It is invalid for timeoutSec to have greater value than checkIntervalSec.
`type`<br/>*string* | Specifies the type of the healthCheck, either TCP, SSL, HTTP, HTTPS or HTTP2. If not specified, the default is Http. Exactly one of the protocol-specific health check field must be specified, which must match type field.
`unhealthyThreshold`<br/>*int* | A so-far healthy instance will be marked unhealthy after this many consecutive failures. The default value is 2.
`portNumber`<br/>*string* | The port number for health check

<!-------------------- Create A HEALTH CHECK -------------------->
#### Create a health Check
```shell
curl --request POST \
  --url 'http://cloudmc_endpoint/rest/services/your_gcp_connection/your_gcp_environment/healthchecks?operation=create

  --header 'MC-Api-Key: your_api_key'\
  --data '{"name":"health_check_name","portNumber":"your_port_number","type":"your_protocol_type"}'
```
<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/healthchecks</code>

Create a new health check

Required | &nbsp;
------- | -----------
`name`<br/>*string* | The display name of the health check
`Type`<br/>*string* | Specifies the type of the healthCheck, either HTTP or HTTPS. If not specified, the default is HTTP. 
`portNumber`<br/>*string* | The port number for the health check. The default is 80.

Optional | &nbsp;
------- | -----------
`description`<br/>*string* | Decription of the health check


<!-------------------- DELETE A HEALTH CHECK -------------------->

#### Delete a health check

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/healthchecks/6938691570659391640"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/healthchecks/:id</code>

Destroy an existing health check. A health check can only be deleted if it's not used by a [backend service](#gcp-backend-services).


