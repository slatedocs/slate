### Volumes

Create an Amazon EBS volume to attach to any EC2 instance in the same Availability Zone.

<!-------------------- LIST INSTANCES -------------------->

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
            "attachments": [],
            "availabilityZone": "us-east-1a",
            "createTime": {
                "seconds": 1643393043,
                "nanos": 527000000
            },
            "encrypted": false,
            "size": 1,
            "snapshotId": "",
            "state": "available",
            "volumeId": "vol-02929c8a1bcbf5f5f",
            "iops": 100,
            "tags": [
                {
                    "key": "Name",
                    "value": "api-volume"
                }
            ],
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

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | The ID of the volume.
`name`<br/>*string* | The volume name of the root device volume (for example, /dev/sda1).
`attachments` <br/>*Array[object]* | The list of instances to which the volume is attached.
`availabilityZone` <br/>*string* | The Availability Zone of the volume.
`createTime` <br/>*object* | The timestamp when the volume was created.
`encrypted` <br/>*boolean* | Indicates whether the volume is encrypted.
`size` <br/>*int* | The size of the volume in GiB.
`snapshotId` <br/>*string* | The snapshot from which the volume was created.
`state` <br/>*string* | The state of the volume (creating, available, in-use, deleting, deleted, error).
`volumeId` <br/>*string* | The volume ID.
`iops` <br/>*int* | Describes the maximum number of input/output operations per second (IOPS) that the volume should provide.
`tags` <br/>*Array[object]* | Any tags assigned to the volume. Tags are key value pairs.
`volumeType` <br/>*string* | The Amazon EBS volume type (gp2, gp3, io1, io2, st1, sc1, standard).
`fastRestored` <br/>*boolean* | Indicates whether the volume was created from a snapshot that is enabled for fast snapshot restore.
`multiAttachEnabled` <br/>*boolean* | Indicates whether the volume is enabled for Multi-Attach.

<!-------------------- RETRIEVE A VOLUME -------------------->
<!-- MC-17105 -->

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

Attributes | &nbsp;
------- | -----------
`name`<br/>*string* | The volume name.
`availabilityZone` <br/>*string* | The Availability Zone of the volume within the service connection's default region policy.
`size` <br/>*int* | The size of the volume in GiB. Size is a required field for all volume types.
`iops` <br/>*int* | Describes the maximum number of input/output operations per second (IOPS) that the volume should provide. This field is only valid for gp3, io1, and io2 volume types. It is mandatory for io1 and io2 volumes.
`throughput` <br/>*int* | The throughput performance in MiB/s that the volume can support. This field is only valid for gp3 volumes.
`multiAttachEnabled` <br/>*boolean* | Indicates whether the volume is enabled for Multi-Attach. This is only supported for io1 and io2 volume types.
`volumeType` <br/>*string* | The Amazon EBS volume type. Below is a list of the possible volume types and the limits for their respective fields.

- gp2 (1-16,384 GiB Size)
- gp3 (1-16,384 GiB Size, 3,000-16,000 IOPS, 125-1000 MiB/s Throughput)
- io1 (4-16,384 GiB Size, 100-64,000 IOPS, 50:1 IOPS/GiB ratio)
- io2 (4-16,384 GiB Size, 100-256,000 IOPS, 1000:1 IOPS/GiB ratio)
- sc1 (125-16,384 GiB Size)
- sc2 (125-16,384 GiB Size)
- standard (1-1,024 GiB Size)
