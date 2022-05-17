### Floating IPs

Floating IPs are public IP addresses that a user can acquire and use in an environment.

#### List floating IPs

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v1/services/compute-os/devel/floatingips"
```
> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "id": "287a3963-983b-4602-9dea-4dff89e9dc10",
            "floatingIpAddress": "10.182.56.27",
            "fixedIpAddress": "10.0.0.8",
            "externalNetworkId": "963b6966-d9d7-48a8-8141-f414a809dbf4"
        }
    ],
    "metadata": {
        "recordCount": 1
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/floatingips</code>

Retrieve a list of all floating IPs in an environment.

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | The floating IP's id.
`floatingIpAddress`<br/>*string* | The floating IP's public IP address.
`fixedIpAddress`<br/>*string* | The fixed IP to which the floating IP is associated. This may be empty if the floating IP is not associated with an instance.
`externalNetworkId`<br/>*UUID* | The id of the external network to which the floating IP belongs.

#### Retrieve a floating IP

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v1/services/compute-os/devel/floatingips/287a3963-983b-4602-9dea-4dff89e9dc10"
```
> The above command returns a JSON structured like this:

```json
{
    "data": {
         "id": "287a3963-983b-4602-9dea-4dff89e9dc10",
         "floatingIpAddress": "10.182.56.27",
         "fixedIpAddress": "10.0.0.8",
         "externalNetworkId": "963b6966-d9d7-48a8-8141-f414a809dbf4"
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/floatingips/:id</code>

Retrieve information about a floating IP.

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | The floating IP's id.
`floatingIpAddress`<br/>*string* | The floating IP's public IP address.
`fixedIpAddress`<br/>*string* | The fixed IP to which the floating IP is associated. This may be empty if the floating IP is not associated with an instance.
`externalNetworkId`<br/>*UUID* | The id of the external network to which the floating IP belongs.

#### Acquire a floating IP

```shell
curl -X POST \
    -H "MC-Api-Key: your_api_key" \ 
    -d "request_body" \
    "https://cloudmc_endpoint/api/v1/services/compute-os/devel/floatingips"
```
> Request body example:

```json
{
    "externalNetworkId": "networkId",
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/floatingips</code>

Acquire a floating IP in an environment.

Optional | &nbsp;
------ | -----------
`externalNetworkId`<br/>*string* | The external network id to associate the new floating ip. If there is more than one network, it will be required to specify it.


#### Release a floating IP

```shell
curl -X DELETE \
    -H "MC-Api-Key: your_api_key"
    "https://cloudmc_endpoint/api/v1/services/compute-os/devel/floatingips/287a3963-983b-4602-9dea-4dff89e9dc10"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/floatingips/:id</code>

Release a floating IP.
