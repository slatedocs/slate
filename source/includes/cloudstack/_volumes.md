### Volumes
A volume is a virtual disk that provide storage for your instances. An OS volumes is created for every instance and it holds the OS of the instance. The size of this volume is usually pretty. A data volume is a volume that can be created and attached to an instance. It can also be detached and reattached to another instance.


<!-------------------- LIST VOLUMES -------------------->

#### List volumes

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/volumes"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "1bd672f4-b274-4371-a792-b0a6c6778cc7",
      "name": "DOUGLAS-ADM",
      "type": "os",
      "creationDate": "2016-10-19T14:25:41-0400",
      "instanceId": "b6145e8b-abd3-456c-832c-f3db86a6acfe",
      "instanceName": "i-douglas-ADM",
      "zoneId": "04afdbd1-e32d-4999-86d0-96703736dded",
      "zoneName": "QC-1",
      "state": "Ready",
      "sizeInGb": 40
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/volumes</code>

Retrieve a list of all volumes in an environment.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the volume
`name`<br/>*string* | The name of the volume
`type`<br/>*string* | The type of the volume. `os` if it is a root volume of an [instance](#cloudstack-instances), `data` otherwise
`creationDate`<br/>*string* | The creation date of the volume
`instanceId`<br/>*UUID* | The id of the [instance](#cloudstack-instances) to which the volume is attached
`instanceName`<br/>*string* | The name of the [instance](#cloudstack-instances) to which the volume is attached
`zoneId`<br/>*UUID* | The id of the [zone](#cloudstack-zones) where the volume was created
`zoneName`<br/>*string* | The name of the [zone](#cloudstack-zones) where the volume was created
`state`<br/>*string* | The state of the volume
`sizeInGb`<br/>*integer* | The size in gigabytes of the volume

<!-- iops<br/>*integer* | The number of IOPS of the volume -->

Query Parameters | &nbsp;
---------- | -----
`type`<br/>*string* | Filter the list to only retrieve the volumes of a specific type (`os` or `data`)
`instance_id`<br/>*UUID* | Filter the list to only retrieve the volumes of a specific [instance](#cloudstack-instances)

<!-------------------- RETRIEVE A VOLUME -------------------->

#### Retrieve a volume

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/volumes/1bd672f4-b274-4371-a792-b0a6c6778cc7"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "1bd672f4-b274-4371-a792-b0a6c6778cc7",
    "name": "deep_thought_42",
    "type": "data",
    "creationDate": "2016-10-19T14:25:41-0400",
    "instanceId": "b6145e8b-abd3-456c-832c-f3db86a6acfe",
    "instanceName": "i-douglas-ADM",
    "zoneId": "04afdbd1-e32d-4999-86d0-96703736dded",
    "zoneName": "QC-1",
    "diskOfferingId": "21ba9c9b-a31e-496e-983f-e3041525bf95",
    "diskOfferingName": "50GB - 50 IOPS Min.",
    "state": "Ready",
    "sizeInGb": 40
  }
}
```
<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/volumes/:id</code>

Retrieve information about an volume.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the volume
`name`<br/>*string* | The name of the volume
`type`<br/>*string* | The type of the volume. `os` if it is a root volume of an [instance](#cloudstack-instances), `data` otherwise
`creationDate`<br/>*string* | The creation date of the volume
`instanceId`<br/>*UUID* | The id of the [instance](#cloudstack-instances) to which the volume is attached
`instanceName`<br/>*string* | The name of the [instance](#cloudstack-instances) to which the volume is attached
`zoneId`<br/>*UUID* | The id of the [zone](#cloudstack-zones) where the volume was created
`zoneName`<br/>*string* | The name of the [zone](#cloudstack-zones) where the volume was created
`state`<br/>*string* | The state of the volume
`sizeInGb`<br/>*integer* | The size in gigabytes of the volume

<!-- iops<br/>*integer* | The number of IOPS of the volume -->


<!-------------------- CREATE A VOLUME -------------------->

#### Create a volume

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/testing/volumes"
```
> Request body example:

```json
{
   "name": "my_volume",
   "diskOfferingId": "166f85eb-b4a2-4000-8e0c-24104d551f60",
   "instanceId": "c043e651-8b3f-4941-b47f-5ecb77f3423b"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/volumes</code>

Create a volume in an environment. It will attached to the specified [instance](#cloudstack-instances).

Required | &nbsp;
---------- | -----
name<br/>*string* | The name of the new volume
diskOfferingId<br/>*UUID* | The [disk offering](#disk-offerings) to use for the volume
instanceId<br/>*UUID* | The id of the [instance](#cloudstack-instances) to which the created volume will be attached


<!-------------------- DELETE A VOLUME -------------------->


#### Delete a volume

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/volumes/e922e5fc-8fee-4688-ad93-c9ef5d7eb685"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/volumes/:id</code>

Destroy an existing data volume. A volume can only be deleted if it's not attached to an [instance](#cloudstack-instances).


<!-------------------- ATTACH A VOLUME -------------------->


#### Attach a volume to an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/testing/volumes/e922e5fc-8fee-4688-ad93-c9ef5d7eb685?operation=attachToInstance"
```
> Request body example:

```json
{
   "instanceId": "c043e651-8b3f-4941-b47f-5ecb77f3423b"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/volumes/:id?operation=attachToInstance</code>

Attach an existing data volume to an [instance](#cloudstack-instances).

Required | &nbsp;
---------- | -----
instanceId<br/>*UUID* | The id of the [instance](#cloudstack-instances) to which the created volume should be attached


<!-------------------- DETACH A VOLUME -------------------->


#### Detach a volume from an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/testing/volumes/e922e5fc-8fee-4688-ad93-c9ef5d7eb685?operation=detachFromInstance"
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/volumes/:id?operation=detachFromInstance</code>

Detach a data volume from an [instance](#cloudstack-instances).


<!-------------------- CREATE A SNAPSHOT OF A VOLUME -------------------->


#### Create a volume snapshot

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/testing/volumes/4fe54594-a788-442c-b7a8-0237f7a4f70d?operation=createSnapshotFromVolume"
```
> Request body example:

```json
{
   "snapshot": {
      "name": "PreMigrationState",
      "rapid": true
   }
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/volumes/:id?operation=createSnapshotFromVolume</code>

Create a snapshot of an existing [volume](#cloudstack-storage). Note that the volume must be in its *READY* state to be able to take a snapshot of it. 

Optional | &nbsp;
------ | -----------
`name`<br/>*string* | A ***unique name*** to be given to the newly created **snapshot**. If this parameter is not provided then by default the concatenation of the *instance name*, *volume name* and the *current timestamp* is used. <br/><br/>*Eg:*<br/>&nbsp;&nbsp;&nbsp;&nbsp;*[instance.name]\_[volume.name]\_[timestamp]*<br/>&nbsp;&nbsp;&nbsp;&nbsp;***i-root-6E7_RapidVol_20190117153537***
`rapid`<br/>*boolean* | Indicates the ***location*** as to where the snapshot is supposed to be made. <br/><br/>Setting this to **true** will ensure that the snapshot is created in the same primary storage as where the volume is. If **false**, then the snapshot is created in a secondary storage. <br/><br/>*Note: Rapid snapshots enable much faster volume and template creation than from regular snapshots, but at a higher expense. Not all volumes support the* **rapid** *snapshot option.*
