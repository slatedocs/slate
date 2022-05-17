### External IPs

External IP address to an instance or a forwarding rule if you need to communicate with the Internet, with resources in another network, or need to communicate with a resource outside of Compute Engine.

<!-------------------- LIST EXTERNAL IPs -------------------->

#### List external IPs

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/externalips"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "address": "35.203.89.240",
      "prefixLength": 0,
      "status": "IN_USE",
      "region": "https://www.googleapis.com/compute/v1/projects/test-env-qyu/zones/northamerica-northeast1-a",
      "users": [
        "https://www.googleapis.com/compute/v1/projects/test-env-qyu/zones/northamerica-northeast1-a/instances/i-root-fjt"
      ],
      "shortUsers": [
        "i-root-fjt"
      ],
      "shortRegion": "northamerica-northeast1",
      "type": "EPHEMERAL"
    },
    {
      "id": "5737719067147816064",
      "creationTimestamp": "2019-06-06T13:07:11.430-07:00",
      "name": "address1",
      "description": "",
      "address": "35.232.24.253",
      "prefixLength": 0,
      "status": "RESERVED",
      "region": "https://www.googleapis.com/compute/v1/projects/test-env-qyu/regions/us-central1",
      "selfLink": "https://www.googleapis.com/compute/v1/projects/test-env-qyu/regions/us-central1/addresses/address1",
      "networkTier": "PREMIUM",
      "addressType": "EXTERNAL",
      "kind": "compute#address",
      "shortRegion": "us-central1",
      "type": "STATIC"
    }
  ],
  "metadata": {
    "recordCount": 2
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/externalips</code>

Retrieve a list of all external IPs in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | Unique identifier for this ressource. Only present for static IPs.
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`name`<br/>*string* | The display name of the address.
`description`<br/>*string* | An optional description of the address.
`address`<br/>*string* | The IP address.
`prefixLength`<br/>*number* | The prefix length if the resource reprensents an IP range.
`status`<br/>*string* | The status of the external IP address. One of the following: IN_USE, RESERVED, RESERVING.
`region`<br/>*string* | The URL of the region where the regional address resides.
`selfLink`<br/>*string* | Server-defined URL for this resource.
`users`<br/>*Array[string]* | Links to the instances the IP address is attached to.
`networkTier`<br/>*string | Network tier used to configure that address. One of PREMIUM or STANDARD. Defaulted to PREMIER.
`addressType`<br/>*string* | The type of address to reserve, either INTERNAL or EXTERNAL. We only list EXTERNAL addresses.
`kind`<br/>*string* | Type of the resource. Always compute#address for addresses.
`shortUsers`<br/>*Array[string]* | The names of the instances the IP address is attached to.
`shortRegion`<br/>*string* | A short version of the region name.
`type`<br/>*string* | One of EPHEMERAL or STATIC. EPHEMERAL are linked to an instance and are released automatically when an instance is deleted.

<!-------------------- RETRIEVE AN EXTERNAL IP -------------------->

#### Retrieve a regional static IP address

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/externalips/8516891730356002156"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "8516891730356002156",
    "creationTimestamp": "2019-06-06T12:03:31.935-07:00",
    "name": "address1",
    "description": "",
    "address": "35.203.23.132",
    "prefixLength": 0,
    "status": "IN_USE",
    "region": "https://www.googleapis.com/compute/v1/projects/test-env-qyu/regions/northamerica-northeast1",
    "selfLink": "https://www.googleapis.com/compute/v1/projects/test-env-qyu/regions/northamerica-northeast1/addresses/address1",
    "users": [
      "https://www.googleapis.com/compute/v1/projects/test-env-qyu/zones/northamerica-northeast1-a/instances/i-root-caf"
    ],
    "networkTier": "PREMIUM",
    "addressType": "EXTERNAL",
    "kind": "compute#address",
    "shortUsers": [
      "i-root-caf"
    ],
    "shortRegion": "northamerica-northeast1",
    "type": "STATIC"
  }
}

```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/externalips/:id</code>

Retrieve an external IP in a given [environment](#administration-environments). Only for static IPs.

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | Unique identifier for this ressource. Only present for static IPs.
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`name`<br/>*string* | The display name of the address.
`description`<br/>*string* | An optional description of the address.
`address`<br/>*string* | The IP address.
`prefixLength`<br/>*number* | The prefix length if the resource reprensents an IP range.
`status`<br/>*string* | The status of the external IP address. One of the following: IN_USE, RESERVED, RESERVING.
`region`<br/>*string* | The URL of the region where the regional address resides.
`selfLink`<br/>*string* | Server-defined URL for this resource.
`users`<br/>*Array[string]* | Links to the instances the IP address is attached to.
`networkTier`<br/>*string* | Network tier used to configure that address. One of PREMIUM or STANDARD. Defaulted to PREMIER.
`addressType`<br/>*string* | The type of address to reserve, either INTERNAL or EXTERNAL. We only list EXTERNAL addresses.
`kind`<br/>*string* | Type of the resource. Always compute#address for addresses.
`shortUsers`<br/>*Array[string]* | The names of the instances the IP address is attached to.
`shortRegion`<br/>*string* | A short version of the region name.
`type`<br/>*string* | One of EPHEMERAL or STATIC. EPHEMERAL are linked to an instance and are released automatically when an instance is deleted.

<!-------------------- RESERVE AN EXTERNAL IP -------------------->

#### Reserve a regional external IP

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/externalips?operation=reserve"
```
> Request body example:

```json
{
  "name": "my-static-ip",
  "shortRegion": "northamerica-northeast1",
  "shortInstance": "my-instance-name"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/externalips</code>

Reserve a new external static IP in a given [environment](#administration-environments).
If `shortInstance` is provided, the IP will be reserved and attached to this instance.

Required | &nbsp;
------- | -----------
`name`<br/>*string* | The display name of the external ip.
`shortRegion`<br/>*string* | A short version of the region name.

Optional | &nbsp;
------- | -----------
`shortInstance`<br/>*string* | The instance name to attach the new external ip address to.

<!-------------------- RELEASE AN EXTERNAL IP -------------------->

#### Release a static IP address

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/externalips/8516891730356002156"
```

<aside class="notice">
You cannot release an external IP which is currently attached to an instance.
</aside>

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/externalips/:id</code>

Release an existing external IP. The external IP goes back to the reserved pool, and is available to be attached to another instance.
