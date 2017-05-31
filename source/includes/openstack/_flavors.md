### Flavors

Flavors are available hardware configurations for instances. They store the information for compute and memory capacity.

#### List flavors

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://api.your.cloudmc/v1/services/compute-os/devel/flavors"

Response body:
```
```json
{
   "data": [
      {
         "id": "1d547941-1738-4d7b-a70b-b52a44ff18e5",
         "name": "1vCPU.256MB"
      },
      {
         "id": "921e8296-c801-498c-90a9-4398cd44681f",
         "name": "1vCPU.512MB"
      }
   ],
   "metadata": {
      "recordCount": 2
   }
}
```

<code>GET /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/flavors</code>

Retrieve a list of available flavors.

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | The flavor's id
`name`<br/>*string* | The flavor name

#### Retrieve a flavor

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://api.your.cloudmc/v1/services/compute-os/devel/flavors/1d547941-1738-4d7b-a70b-b52a44ff18e5"

Response body:
```
```json
{
   "data": {
      "id": "1d547941-1738-4d7b-a70b-b52a44ff18e5",
      "name": "1vCPU.256MB"
   }
}
```

<code>GET /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/flavors/:id</code>

Retrieve information about a flavor

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | The flavor's id
`name`<br/>*string* | The flavor name
