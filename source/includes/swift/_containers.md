### Containers or Buckets

Create and manage your containers/buckets.

<!-------------------- LIST CONTAINERS -------------------->

#### List containers/buckets

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/swift/example/buckets"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "private",
      "name": "private",
      "isPublic": false,
      "displaySize": {
        "value": "0",
        "unitKey": "units.filesizes.B"
      },
      "size": 0,
      "objectCount": 0,
      "accessType": "private",
      "locked": false,
      "storagePolicy": "Quebec"
    },
    {
      "id": "public",
      "name": "public",
      "isPublic": true,
      "displaySize": {
        "value": "81",
        "unitKey": "units.filesizes.B"
      },
      "size": 81,
      "objectCount": 6,
      "accessType": "public",
      "locked": false,
      "storagePolicy": "Quebec"
    }
  ],
  "metadata": {
    "recordCount": 2
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/buckets</code>

Retrieve a list of all containers in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id` <br/>*string* | The id of the container.
`name` <br/>*string* | The name of the container.
`isPublic`<br/>*boolean* | Specifies if the container is public or not.
`displaySize`<br/>*Object* | Object containing the information to display the size in the UI.
`size`<br/>*string* | The size in bytes of the container.
`objectCount`<br/>*string* | The number of object which are part of the container.
`accessType`<br/>*string* | The access type of the container. It can either be public or private.
`locked`<br/>*string* | Identify if the container is locked or not.
`storePolicy`<br/>*string* | The store policy applying to the container.


<!-------------------- RETRIEVE A CONTAINER -------------------->

#### Retrieve a container

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/swift/example/buckets/private"
```
> The above command returns a JSON structured like this:

```json
{
  "id": "private",
  "name": "private",
  "isPublic": false,
  "displaySize": {
    "value": "0",
    "unitKey": "units.filesizes.B"
  },
  "size": 0,
  "objectCount": 0,
  "accessType": "private",
  "locked": false,
  "storagePolicy": "Quebec"
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/buckets/:id</code>

Retrieve a container in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id` <br/>*string* | The id of the container.
`name` <br/>*string* | The name of the container.
`isPublic`<br/>*boolean* | Specifies if the container is public or not.
`displaySize`<br/>*Object* | Object containing the information to display the size in the UI.
`size`<br/>*string* | The size in bytes of the container.
`objectCount`<br/>*string* | The number of object which are part of the container.
`accessType`<br/>*string* | The access type of the container. It can either be public or private.
`locked`<br/>*boolean* | Identify if the container is locked or not.
`storePolicy`<br/>*string* | The store policy applying to the container.

<!-------------------- CREATE A CONTAINER -------------------->

#### Create a container

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/swift/example/buckets"
```
> Request body example:

```json
{
  "name": "newBucket",
  "isPublic": true
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/buckets</code>

Create a new container.

Required | &nbsp;
------- | -----------
`name` <br/>*string* | The name of the container. It cannot exceed 256 characters and cannot contain '/'.

Optional | &nbsp;
------- | -----------
`isPublic`<br/>*boolean* | Specifies if the container is public or private. The default value is false.

<!-------------------- DELETE A CONTAINER -------------------->

#### Delete a container

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/swift/example/buckets/containerToDelete"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/buckets/:id</code>

Delete an existing container.

<!-------------------- RENAME CONTAINER -------------------->

#### Rename a container

Rename the container to a new name.

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/swift/example/buckets/containerToRename?operation=rename"
```
> Request body example:

```json
{
  "name": "newContainerName"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/buckets/:id?operation=rename</code>

<aside class="notice">
Renaming does not exist in Swift. It instead consists of the creation of a new container, a copy of all objects into this new container, and the deletion of the old container.
</aside>

Required | &nbsp;
------ | -----------
`name`<br/>*string* | The new name of the container.

