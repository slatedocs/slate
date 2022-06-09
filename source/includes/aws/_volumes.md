### Volumes

Create an Amazon EBS volume to attach to any EC2 instance in the same Availability Zone.

<!-------------------- LIST VOLUMES -------------------->

#### List Volumes

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-env/volumes"
```
> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "id": "vol-02929c8a1bcbf5f5f",
            "name": "api-volume",
            "attachments": [
              {
                "attachTime": "2022-01-11T20:57:31Z",
                "device": "/dev/xvda",
                "instanceId": "i-03dffc71c7d649bb1",
                "state": "attached",
                "volumeId": "vol-02929c8a1bcbf5f5f",
                "deleteOnTermination": true
              }
            ],
            "availabilityZone": "us-east-1a",
            "createTime": "2020-11-19T03:41:51Z",
            "encrypted": false,
            "size": 1,
            "snapshotId": "",
            "state": "available",
            "iops": 100,
            "tags": [],
            "volumeType": "gp2",
            "fastRestored": false,
            "multiAttachEnabled": false
        }
    ],
    "metadata": {
        "recordCount": 1
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/volumes</code>

Retrieve a list of all volumes in a given [environment](#administration-environments).

| Attributes                          | &nbsp;                                                                                                    |
|-------------------------------------|-----------------------------------------------------------------------------------------------------------|
| `id`<br/>*string*                   | The ID of the volume.                                                                                     |
| `name`<br/>*string*                 | The volume name of the root device volume (for example, /dev/sda1).                                       |
| `attachments` <br/>*Array[object]*  | The list of instances to which the volume is attached.                                                    |
| `availabilityZone` <br/>*string*    | The Availability Zone of the volume.                                                                      |
| `createTime` <br/>*string*          | The timestamp when the volume was created.                                                                |
| `encrypted` <br/>*boolean*          | Indicates whether the volume is encrypted.                                                                |
| `size` <br/>*int*                   | The size of the volume in GiB.                                                                            |
| `snapshotId` <br/>*string*          | The snapshot from which the volume was created.                                                           |
| `state` <br/>*string*               | The state of the volume (creating, available, in-use, deleting, deleted, error).                          |
| `iops` <br/>*int*                   | Describes the maximum number of input/output operations per second (IOPS) that the volume should provide. |
| `tags` <br/>*Array[object]*         | Any tags assigned to the volume. Tags are key value pairs.                                                |
| `volumeType` <br/>*string*          | The Amazon EBS volume type (gp2, gp3, io1, io2, st1, sc1, standard).                                      |
| `fastRestored` <br/>*boolean*       | Indicates whether the volume was created from a snapshot that is enabled for fast snapshot restore.       |
| `multiAttachEnabled` <br/>*boolean* | Indicates whether the volume is enabled for Multi-Attach.                                                 |

<!-------------------- RETRIEVE A VOLUME -------------------->
#### Retrieve a volume

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-area/volumes/vol-0c8dd88e0743c368b"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "vol-0c8dd88e0743c368b",
    "name": "vol-0c8dd88e0743c368b",
    "attachments": [
      {
          "attachTime": "2022-01-11T20:57:31Z",
          "device": "/dev/xvda",
          "instanceId": "i-03dffc71c7d649bb1",
          "state": "attached",
          "volumeId": "vol-0c8dd88e0743c368b",
          "deleteOnTermination": true
      }
    ],
    "availabilityZone": "us-east-1a",
    "createTime": "2022-01-11T20:57:31.675Z",
    "encrypted": false,
    "size": 8,
    "snapshotId": "snap-0299d083f0ce6cd12",
    "state": "in-use",
    "iops": 100,
    "tags": [],
    "volumeType": "gp2",
    "fastRestored": false,
    "multiAttachEnabled": false
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/volumes/:id</code>

Retrieve a volume in a given [environment](#administration-environments).

| Attributes                          | &nbsp;                                                                                                    |
|-------------------------------------|-----------------------------------------------------------------------------------------------------------|
| `id`<br/>*string*                   | The ID of the volume.                                                                                     |
| `name`<br/>*string*                 | The volume name of the root device volume (for example, /dev/sda1).                                       |
| `attachments` <br/>*Array[object]*  | The list of instances to which the volume is attached.                                                    |
| `availabilityZone` <br/>*string*    | The Availability Zone of the volume.                                                                      |
| `createTime` <br/>*string*          | The timestamp when the volume was created.                                                                |
| `encrypted` <br/>*boolean*          | Indicates whether the volume is encrypted.                                                                |
| `size` <br/>*int*                   | The size of the volume in GiB.                                                                            |
| `snapshotId` <br/>*string*          | The snapshot from which the volume was created.                                                           |
| `state` <br/>*string*               | The state of the volume (creating, available, in-use, deleting, deleted, error).                          |
| `iops` <br/>*int*                   | Describes the maximum number of input/output operations per second (IOPS) that the volume should provide. |
| `tags` <br/>*Array[object]*         | Any tags assigned to the volume. Tags are key value pairs.                                                |
| `volumeType` <br/>*string*          | The Amazon EBS volume type (gp2, gp3, io1, io2, st1, sc1, standard).                                      |
| `fastRestored` <br/>*boolean*       | Indicates whether the volume was created from a snapshot that is enabled for fast snapshot restore.       |
| `multiAttachEnabled` <br/>*boolean* | Indicates whether the volume is enabled for Multi-Attach.                                                 |

<!-------------------- CREATE VOLUMES -------------------->
#### Create Volume

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-env/volumes"
```

> Request body example for a volume:
```json
{
    "name": "api-volume",
    "availabilityZone": "us-east-1a",
    "size": 1,
    "iops": 100,
    "throughput": 125,
    "volumeType": "gp3",
    "multiAttachEnabled": false
}
```

> The above command returns a JSON structured like this:

```json
{
    "taskId": "35d38672-8772-4b04-b1ca-1b13b97638ca",
    "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/volumes</code>

Retrieve a list of all volumes in a given [environment](#administration-environments).

| Attributes                       | &nbsp;                                                                                                               |
|----------------------------------|----------------------------------------------------------------------------------------------------------------------|
| `availabilityZone` <br/>*string* | The Availability Zone of the volume within the service connection's default region policy.                           |
| `size` <br/>*int*                | The size of the volume in GiB. Size is a required field for all volume types.                                        |
| `volumeType` <br/>*string*       | The Amazon EBS volume type. Below is a list of the possible volume types and the limits for their respective fields. |

- gp2 (1-16,384 GiB Size)
- gp3 (1-16,384 GiB Size, 3,000-16,000 IOPS, 125-1000 MiB/s Throughput)
- io1 (4-16,384 GiB Size, 100-64,000 IOPS, 50:1 IOPS/GiB ratio)
- io2 (4-16,384 GiB Size, 100-256,000 IOPS, 1000:1 IOPS/GiB ratio)
- sc1 (125-16,384 GiB Size)
- sc2 (125-16,384 GiB Size)
- standard (1-1,024 GiB Size)

| Optional                            | &nbsp;                                                                                                                                                                                                          |
|-------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `name`<br/>*string*                 | The volume name. A default name will be created if there isn't one provided.                                                                                                                                    |
| `iops` <br/>*int*                   | Describes the maximum number of input/output operations per second (IOPS) that the volume should provide. This field is only valid for gp3, io1, and io2 volume types. It is mandatory for io1 and io2 volumes. |
| `throughput` <br/>*int*             | The throughput performance in MiB/s that the volume can support. This field is required for gp3 volumes.                                                                                                        |
| `multiAttachEnabled` <br/>*boolean* | Indicates whether the volume is enabled for Multi-Attach. This is only supported for io1 and io2 volume types.                                                                                                  |

<!-------------------- MODIFY VOLUMES -------------------->

#### Modify Volume
```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-area/volumes/vol-0c8dd88e0743c368b"
```
> Request body example for a volume:
```json
{
    "name": "api-volume",
    "id": "vol-0c8dd88e0743c368b",
    "size": 1,
    "iops": 100,
    "throughput": 125,
    "volumeType": "gp3",
    "multiAttachEnabled": false, 
    "attachments": [
      {
        "attachTime": "2022-01-11T20:57:31Z",
        "device": "/dev/xvda",
        "instanceId": "i-03dffc71c7d649bb1",
        "state": "attached",
        "volumeId": "vol-0c8dd88e0743c368b",
        "deleteOnTermination": true
      }
    ]
}
```
> The above command returns a JSON structured like this:

```json
{
    "taskId": "35d38672-8772-4b04-b1ca-1b13b97638ca",
    "taskStatus": "PENDING"
}
```
<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/volumes/:id</code>

Modify a volume in a given environment [environment](#administration-environments).

| Attributes                          | &nbsp;                                                                                                    |
|-------------------------------------|-----------------------------------------------------------------------------------------------------------|
| `id`<br/>*string*                   | The ID of the volume.                                                                                     |
| `name`<br/>*string*                 | The volume name of the root device volume (for example, /dev/sda1).                                       |
| `attachments` <br/>*Array[object]*  | The list of instances to which the volume is attached.                                                    |                                                                                                                                  |
| `size` <br/>*int*                   | The size of the volume in GiB.                                                                            |
| `iops` <br/>*int*                   | Describes the maximum number of input/output operations per second (IOPS) that the volume should provide. |
| `volumeType` <br/>*string*          | The Amazon EBS volume type (gp2, gp3, io1, io2, st1, sc1, standard).                                      |
| `multiAttachEnabled` <br/>*boolean* | Indicates whether the volume is enabled for Multi-Attach.                                                 |


<!-------------------- DELETE A VOLUME -------------------->

#### Delete a volume

Note: only volumes in an "available" state can be deleted

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-area/volumes/vol-0d1f9106cd0e0dff7"
```
> The above command returns a JSON structured like this:

```json
{
    "taskId": "30121175-926a-4fd2-991b-ff303ffdf905",
    "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/volumes/:id</code>

| Attributes                 | &nbsp;                                        |
|----------------------------|-----------------------------------------------|
| `taskId` <br/>*string*     | The task id related to the instance deletion. |
| `taskStatus` <br/>*string* | The status of the operation.                  |


<!-------------------- ATTACH A VOLUME -------------------->

#### Attach a volume

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-area/volumes/vol-0d1f9106cd0e0dff7?operation=attach"
```

> Request body example for a volume:
```json
{
    "instanceIdToAttach": "i-0b4e945ee65072b8a",
    "attachmentDeviceName": "/dev/sda1"
}
```
| Attributes                 | &nbsp;                                          |
|----------------------------|-------------------------------------------------|
| `instanceIdToAttach` <br/>*string*   | Id of the instance the volume will be attached to (must be in the same availability zone). |
| `attachmentDeviceName` <br/>*string* |  The device name that you assign is used by Amazon EC2. The device names that you're allowed to assign depends on the virtualization type of the selected instance.                  |
- Linux device names: ***/dev/sdf*** through ***/dev/sdp***
- Windows device names: ***/dev/xvdf*** through ***/dev/xvdz***
- Linux root device names: ***/dev/sda1*** or ***/dev/xvda*** (depending on the AMI)
- Windows root device names: ***/dev/sda1***


> The above command returns a JSON structured like this:
```json
{
    "taskId": "c8f44de4-e36f-456d-9802-3fb59cce3de2",
    "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/volumes/:id</code>

| Attributes                 | &nbsp;                                          |
|----------------------------|-------------------------------------------------|
| `taskId` <br/>*string*     | The task id related to the instance attachment. |
| `taskStatus` <br/>*string* | The status of the operation.                    |

<!-------------------- DETACH A VOLUME -------------------->

#### Detach a volume

Note: Only attached volumes can be detached. Detaching a root device volume will result in stopping the instance before detaching the volume.

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-area/volumes/vol-0d1f9106cd0e0dff7?operation=detach"
```

> Request body example for a volume:
```json
{
    "instanceIdToDetach": "i-0e0d3jh110d1f9106"
}
```

> The above command returns a JSON structured like this:
```json
{
    "taskId": "30121175-926a-4fd2-991b-ff303ffdf905",
    "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/volumes/:id</code>

| Attributes                 | &nbsp;                                          |
|----------------------------|-------------------------------------------------|
| `taskId` <br/>*string*     | The task id related to the instance detachment. |
| `taskStatus` <br/>*string* | The status of the operation.                    |

