### Routers

Routers route traffic between networks, including the public internet.

#### List routers

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v2/services/compute-os/devel/routers"
```
> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "id": "212eb8d8-80ee-4edd-8bae-1efed8bc5c71",
            "name": "external-router",
            "externalNetworkId": "167bea1e-f15a-41bd-8d54-44b613bfa36c",
            "externalNetworkName": "public-net",
            "networkNames": [
                "web",
                "data"
            ],
            "networkIds": [
                "4beaf851-c0d8-4ab7-9003-3b7c0e59f3d9",
                "68f97fb0-6a71-4be1-87bf-1c805940d2cb"
            ]
        }
    ],
    "metadata": {
        "recordCount": 1
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/routers</code>

Retrieve a list of routers in an OpenStack environment.

| Attributes                            | Description                         |
| ------------------------------------- | ----------------------------------- |
| `id`<br/>*UUID*                         | The router's ID.                     |
| `name`<br/>*string*                     | The router's name.                   |
| `networkIds`<br/>*Array[UUID]*          | The router's internal network IDs.   |
| `networkNames`<br/>*Array[string]*      | The router's internal network names. |
| `externalNetworkId`<br/>*UUID*          | The router's external network ID.    |
| `externalNetworkName`<br/>*string*      | The router's external network name.  |

#### Retrieve a router

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v2/services/compute-os/devel/routers/212eb8d8-80ee-4edd-8bae-1efed8bc5c71"
```
> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": "212eb8d8-80ee-4edd-8bae-1efed8bc5c71",
        "name": "external-router",
        "externalNetworkId": "167bea1e-f15a-41bd-8d54-44b613bfa36c",
        "externalNetworkName": "public-net",
        "networkNames": [
            "web",
            "data"
        ],
        "networkIds": [
            "4beaf851-c0d8-4ab7-9003-3b7c0e59f3d9",
            "68f97fb0-6a71-4be1-87bf-1c805940d2cb"
        ]
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/routers/:id</code>

Retrieve a single router in an OpenStack environment.

| Attributes                            | Description                         |
| ------------------------------------- | ----------------------------------- |
| `id`<br/>*UUID*                         | The router's ID.                     |
| `name`<br/>*string*                     | The router's name.                   |
| `networkIds`<br/>*Array[UUID]*          | The router's internal network IDs.   |
| `networkNames`<br/>*Array[string]*      | The router's internal network names. |
| `externalNetworkId`<br/>*UUID*          | The router's external network ID.    |
| `externalNetworkName`<br/>*string*      | The router's external network name.  |

#### Create a router

```shell
curl -X POST \
    -H "MC-Api-Key: your_api_key" \
    -H "Content-Type: application/json" \
    -d "request_body" \
    "https://cloudmc_endpoint/api/v2/services/compute-os/devel/routers"
```
> Request body example:

```json
{
    "name": "external-router",
    "externalNetworkId": "167bea1e-f15a-41bd-8d54-44b613bfa36c"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/routers</code>

Create a router.

| Attributes                            | Description                         |
| ------------------------------------- | ----------------------------------- |
| `name`<br/>*string*                     | The router's name.                   |
| `externalNetworkId`<br/>*UUID*          | The router's external network ID.   |

#### Add a router interface

```shell
curl -X POST \
    -H "MC-Api-Key: your_api_key" \
    -H "Content-Type: application/json" \
    -d "request_body" \
    "https://cloudmc_endpoint/api/v2/services/compute-os/devel/routers/212eb8d8-80ee-4edd-8bae-1efed8bc5c71?operation=addRouterInterface"
```
> Request body example:

```json
{
    "networkId": "471eb361-c028-45f5-bd1a-6d05a057624f",
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/routers/:id?operation=addRouterInterface</code>

Connect a router to a network.

| Attributes                            | Description                         |
| ------------------------------------- | ----------------------------------- |
| `networkId`<br/>*UUID*                | The ID of the network to connect.    |


#### Delete a router

```shell
curl -X DELETE \
    -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v2/services/compute-os/devel/routers/212eb8d8-80ee-4edd-8bae-1efed8bc5c71"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/routers/:id</code>

Delete a router.
