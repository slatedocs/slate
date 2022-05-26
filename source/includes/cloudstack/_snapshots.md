### Snapshots

 A volume snapshot is a full image of a volume. They are often considered as backups, but in reality this is not 100% true since you have only the data written on disk. Volume Snapshots are typically used to derive new templates out of a running instance.

<!-------------------- LIST SNAPSHOTS -------------------->

#### List snapshots

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/snapshots"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "33a27b8d-5a27-42a5-aec4-37606e372bda",
      "name": "i-douglas-ADM_foo_20161116211009",
      "state": "BackedUp",
      "intervalType": "MANUAL",
      "volumeId": "c779ca42-6966-41af-a7dc-23db4e41d4ee",
      "volume": "ROOT-35545",
      "volumeType": "ROOT-35545"
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/snapshots</code>

Retrieve a list of all snapshots in an [environment](#administration-environments).

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the snapshot
`name`<br/>*string* | The name of the snapshot
`state`<br/>*string* | The state of the snapshot
`intervalType`<br/>*string* | The interval type. `MANUAL` means that you created the snapshot manually (i.e. it's not a recurring snapshot)
`volumeId`<br/>*UUID* | The id of the [volume](#cloudstack-volumes) that was snapshotted
`volume`<br/>*string* | The name of the [volume](#cloudstack-volumes) that was snapshotted
`volumeType`<br/>*string* | The type of the [volume](#cloudstack-volumes) that was snapshotted

Query Parameters | &nbsp;
---------- | -----
`volume_id`<br/>*UUID* | Filter the list to only retrieve the snapshots of a specific [volume](#cloudstack-volumes)

<!-------------------- RETRIEVE A SNAPSHOT -------------------->

#### Retrieve a snapshot

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/snapshots/1bd672f4-b274-4371-a792-b0a6c6778cc7"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "33a27b8d-5a27-42a5-aec4-37606e372bda",
    "name": "i-douglas-ADM_foo_20161116211009",
    "state": "BackedUp",
    "intervalType": "MANUAL",
    "volumeId": "c779ca42-6966-41af-a7dc-23db4e41d4ee",
    "volume": "ROOT-35545",
    "volumeType": "ROOT-35545"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/snapshots/:id</code>

Retrieve information about a snapshot.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the snapshot
`name`<br/>*string* | The name of the snapshot
`state`<br/>*string* | The state of the snapshot
`intervalType`<br/>*string* | The interval type. `MANUAL` means that you created the snapshot manually (i.e. it's not a recurring snapshot)
`volumeId`<br/>*UUID* | The id of the [volume](#cloudstack-volumes) that was snapshotted
`volume`<br/>*string* | The name of the [volume](#cloudstack-volumes) that was snapshotted
`volumeType`<br/>*string* | The type of the [volume](#cloudstack-volumes) that was snapshotted


<!-------------------- CREATE A SNAPSHOT OF A VOLUME -------------------->


#### Create a snapshot

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/testing/snapshots?operation=create"
```
> Request body example:

```json
{
  "volumeId": "4fe54594-a788-442c-b7a8-0237f7a4f70d",
  "name": "BeforeUpgradeToV2",
  "rapid": true
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/snapshots?operation=create</code>

Create a snapshot of an existing [volume](#cloudstack-storage). Note that the volume must be in its *READY* state to be able to take a snapshot of it. You can get a list of volumes using [this](#cloudstack-list-volumes) API.

Required | &nbsp;
---------- | -----
`volumeId`<br/>*UUID* | The id of the [volume](#cloudstack-storage) on which the snapshot is to be taken.

Optional | &nbsp;
------ | -----------
`name`<br/>*string* | A ***unique name*** to be given to the newly created **snapshot**. If this parameter is not provided then by default the concatenation of the *instance name*, *volume name* and the *current timestamp* is used. <br/><br/>*Eg:*<br/>&nbsp;&nbsp;&nbsp;&nbsp;*[instance.name]\_[volume.name]\_[timestamp]*<br/>&nbsp;&nbsp;&nbsp;&nbsp;***i-root-6E7_RapidVol_20190117153537***
`rapid`<br/>*boolean* | Indicates the ***location*** as to where the snapshot is supposed to be created. <br/><br/>Setting this to **true** will ensure that the snapshot is created in the same primary storage as where the volume is. If **false**, then the snapshot is created in a secondary storage. 