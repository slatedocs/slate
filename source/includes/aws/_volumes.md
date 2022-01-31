### Volumes

Deploy and manage your volumes.

<!-------------------- LIST INSTANCES -------------------->

#### List instances

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

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances</code>

Retrieve a list of all volumes in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | The ID of the volume.
`name`<br/>*string* | The volume name of the root device volume (for example, /dev/sda1 ).
`attachments` <br/>*Array[object]* | The list of instances to which the volume is attached.
`availabilityZone` <br/>*string* | The Availability Zone of the volume.
`createTime` <br/>*object* | The time stamp when the volume was created.
`encrypted` <br/>*boolean* | Indicates whether the volume is encrypted (true | false).
`size` <br/>*int* | The size of the volume, in GiB.
`snapshotId` <br/>*string* | The snapshot from which the volume was created.
`state` <br/>*string* | The state of the volume (creating | available | in-use | deleting | deleted | error).
`volumeId` <br/>*string* | The volume ID.
`iops` <br/>*int* | Describes the maximum number of input/output operations per second (IOPS) that the volume should provide.
`tags` <br/>*Array[object]* | Any tags assigned to the volume. Tags are key value pairs.
`volumeType` <br/>*string* | The Amazon EBS volume type (gp2 | gp3 | io1 | io2 | st1 | sc1| standard).
`fastRestored` <br/>*boolean* | Indicates whether the volume was created from a snapshot that is enabled for fast snapshot restore (true | false).
`multiAttachEnabled` <br/>*boolean* | Indicates whether the volume is enabled for Multi-Attach (true | false).

<!-------------------- RETRIEVE A VOLUME -------------------->
<!-- MC-17105 -->

<!-------------------- CREATE VOLUMES -------------------->
<!-- MC-17106 -->
