### Router interfaces

Router interfaces connect a router to a network.

#### List router interfaces

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v2/services/compute-os/devel/routerinterfaces?routerid=3de4f523-06ce-4955-acb0-b8e3d61ec582"
```
> The above command returns a JSON structured like this:

```json
{
	"data": [
		{
			"id": "b5f0cbbf-45f3-4e77-8a5c-90351f83e5f9",
			"networkName": "test2",
			"networkId": "d507486c-eacb-48ff-841e-e3938213d95f",
			"portId": "b5f0cbbf-45f3-4e77-8a5c-90351f83e5f9",
			"privateIp": "10.182.15.1",
			"routerId": "3de4f523-06ce-4955-acb0-b8e3d61ec582",
			"routerName": "routeName1"
		}
	],
	"metadata": {
		"recordCount": 1
	}
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/routerinterfaces?routerid=<a href="#routers">:routerid</a></code>

Retrieve a list of router interfaces associated with a router in an OpenStack environment.

 Attributes                    | Description                         
 ----------------------------- | -----------------------------------
 `id`<br/>*UUID*               | The router interface's ID.
 `networkName`<br/>*string*    | The name of the connected network.
 `networkId`<br/>*UUID*        | The ID of the connected network.
 `portId`<br/>*UUID*           | The ID of the port the interface is connected to (same as interface ID).
 `privateIp`<br/>*string*      | The private IP of the router interface.
 `routerId`<br/>*UUID*         | The ID of the parent router.
 `routerName`<br/>*UUID*       | The name of the parent router.

#### Retrieve a router interface

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v2/services/compute-os/devel/routerinterfaces/b5f0cbbf-45f3-4e77-8a5c-90351f83e5f9"
```
> The above command returns a JSON structured like this:

```json
{
	"data": {
		"id": "b5f0cbbf-45f3-4e77-8a5c-90351f83e5f9",
		"networkName": "test2",
		"networkId": "d507486c-eacb-48ff-841e-e3938213d95f",
		"portId": "b5f0cbbf-45f3-4e77-8a5c-90351f83e5f9",
		"privateIp": "10.182.15.1",
		"routerId": "3de4f523-06ce-4955-acb0-b8e3d61ec582",
		"routerName": "routeName1"
	}
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/routerinterfaces/:id</code>

Retrieve a single router interface in an OpenStack environment.

Attributes                    | Description                         
----------------------------- | -----------------------------------
`id`<br/>*UUID*               | The router interface's ID.
`networkName`<br/>*string*    | The name of the connected network.
`networkId`<br/>*UUID*        | The ID of the connected network.
`portId`<br/>*UUID*           | The ID of the port the interface is connected to (same as interface ID).
`privateIp`<br/>*string*      | The private IP of the router interface.
`routerId`<br/>*UUID*         | The ID of the parent router.
`routerName`<br/>*UUID*       | The name of the parent router.

#### Create a router interface

```shell
curl -X POST \
    -H "MC-Api-Key: your_api_key" \
    -H "Content-Type: application/json" \
    -d "request_body" \
    "https://cloudmc_endpoint/api/v2/services/compute-os/devel/routerinterfaces"
```
> Request body example:

```json
{
	"networkId": "d507486c-eacb-48ff-841e-e3938213d95f",
	"routerId": "3de4f523-06ce-4955-acb0-b8e3d61ec582"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/routerinterfaces</code>

Create a router interface.

Required          | Description                          
--------------------------   | ------------------------------------
`networkId`<br/>*UUID*        | The ID of the network that is being connected. 
`routerId`<br/>*UUID*         | The ID of the router.


#### Delete a router interface

```shell
curl -X DELETE \
    -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v2/services/compute-os/devel/routerinterfaces/c14ed06b-6de9-4b3e-aac9-9e6c1406de9e"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/routerinterfaces/:id</code>

Delete a router interface.
