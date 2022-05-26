### Snapshots

Snapshots are point in time copies of volumes that can be used to create other volumes.

#### List Snapshots

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v2/services/compute-os/devel/snapshots"
```
> The above command returns a JSON structured like this:

```json
{
   "data": [
      {
        "id": "4b41c7de-b2a8-4cb7-82ce-46685b07921d",
        "name": "s-web-data-CJ6",
        "volumeId": "52cfc2f8-5b1f-4833-83cd-a77f55c5ed24",
        "volumeName": "web-data",
        "sizeInGB": 50,
        "state": "available"
      }
   ],
   "metadata": {
      "recordCount": 1
   }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/snapshots</code>

Retrieve a list of snapshots.

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | The snapshot's id.
`name`<br/>*string* | The snapshot name.
`volumeId`<br/>*UUID* | The volume's id.
`volumeName`<br/>*string* | The volume's name.
`sizeInGB`<br/>*integer* | The snapshot's size in GB.
`state`<br/>*string* | The snapshot's state.

#### Retrieve a snapshot

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v2/services/compute-os/devel/snapshots/4b41c7de-b2a8-4cb7-82ce-46685b07921d"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "4b41c7de-b2a8-4cb7-82ce-46685b07921d",
    "name": "s-web-data-CJ6",
    "volumeId": "52cfc2f8-5b1f-4833-83cd-a77f55c5ed24",
    "volumeName": "web-data",
    "sizeInGB": 50,
    "state": "available"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/snapshots/:id</code>

Retrieve information about a snapshot.

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | The snapshot's id.
`name`<br/>*string* | The snapshot name.
`volumeId`<br/>*UUID* | The volume's id.
`volumeName`<br/>*string* | The volume's name.
`sizeInGB`<br/>*integer* | The snapshot's size in GB.
`state`<br/>*string* | The snapshot's state.

#### Delete a snapshot

```shell
curl -X DELETE \
    -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v2/services/compute-os/devel/snapshots/4b41c7de-b2a8-4cb7-82ce-46685b07921d"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/snapshots/:id</code>

Delete a snapshot.