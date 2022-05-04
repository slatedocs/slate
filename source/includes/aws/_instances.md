### Instances

Deploy and manage your instances.

<!-------------------- LIST INSTANCES -------------------->

#### List instances

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-env/instances"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "i-03dffc71c7d649bb1",
      "name": "NameOfMyInstance",
      "rootDeviceName": "/dev/xvda",
      "imageId": "ami-0947d2ba12ee1ff75",
      "instanceType": "t2.micro",
      "launchTime": "2022-01-11T20:57:30Z",
      "availabilityZone": "us-east-1a",
      "privateDnsName": "ip-172-31-90-212.ec2.internal",
      "privateIpAddress": "172.31.90.212",
      "publicDnsName": "ec2-54-210-168-154.compute-1.amazonaws.com",
      "publicIpAddress": "54.210.168.154",
      "state": "running",
      "subnetId": "subnet-0ac78483b1159f7e9",
      "vpcId": "vpc-040e8c412dc149b2a",
      "architecture": "x86_64",
      "clientToken": "7fe789d0-1e84-4c6a-886a-828b99f8525b",
      "rootDeviceType": "ebs",
      "virtualizationType": "hvm",
      "tags": [
        {
          "name": "NameOfMyInstance",
          "tag2": "wowASecondValueIdkNotRequired"
        }
      ],
      "coreCount": 1,
      "threadsPerCore": 1,
      "securityGroupName": "default",
      "minCount": 0,
      "maxCount": 0,
      "region": "us-east-1",
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
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances</code>

Retrieve a list of all instances in a given [environment](#administration-environments).

| Attributes                        | &nbsp;                                                                                                                                                                                                                   |
|-----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `id`<br/>*string*                 | The ID of the instance.                                                                                                                                                                                                  |
| `name`<br/>*string*               | The name of the instance.                                                                                                                                                                                                |
| `rootDeviceName`<br/>*string*     | The device name of the root device volume (for example, /dev/sda1 ).                                                                                                                                                     |
| `imageId`<br/>*string*            | The ID of the AMI used to launch the instance.                                                                                                                                                                           |
| `instanceType`<br/>*string*       | The instance type.                                                                                                                                                                                                       |
| `launchTime`<br/>*string*         | The time the instance was launched.                                                                                                                                                                                      |
| `availabilityZone`<br/>*string*   | The Availability Zone of the instance.                                                                                                                                                                                   |
| `privateDnsName`<br/>*string*     | (IPv4 only) The private DNS hostname name assigned to the instance. This DNS hostname can only be used inside the Amazon EC2 network. This name is not available until the instance enters the running state.            |
| `privateIpAddress`<br/>*string*   | The private IPv4 address assigned to the instance.                                                                                                                                                                       |
| `publicDnsName`<br/>*string*      | (IPv4 only) The public DNS name assigned to the instance. This name is not available until the instance enters the running state. For EC2-VPC, this name is only available if you've enabled DNS hostnames for your VPC. |
| `publicIpAddress`<br/>*string*    | The public IPv4 address, or the Carrier IP address assigned to the instance, if applicable.                                                                                                                              |
| `state`<br/>*string*              | The current state of the instance.                                                                                                                                                                                       |
| `subnetId`<br/>*string*           | [EC2-VPC] The ID of the subnet in which the instance is running.                                                                                                                                                         |
| `vpcId`<br/>*string*              | [EC2-VPC] The ID of the VPC in which the instance is running.                                                                                                                                                            |
| `architecture`<br/>*string*       | The architecture of the image.                                                                                                                                                                                           |
| `clientToken`<br/>*string*        | The idempotency token you provided when you launched the instance, if applicable.                                                                                                                                        |
| `rootDeviceType`<br/>*string*     | The root device type used by the AMI. The AMI can use an EBS volume or an instance store volume.                                                                                                                         |
| `virtualizationType`<br/>*string* | The virtualization type of the instance.                                                                                                                                                                                 |
| `tags`<br/>*Array[object]*        | Any tags assigned to the instance. Tags are key value pairs.                                                                                                                                                             |
| `coreCount`<br/>*int*             | The number of CPU cores for the instance.                                                                                                                                                                                |
| `threadsPerCore`<br/>>*int*       | The number of threads per CPU core.                                                                                                                                                                                      |
| `securityGroupName`<br/>*string*  | The name of the security group.                                                                                                                                                                                          |
| `maxCount`<br/>*integer*          | The maximum number of instances to create. Cannot be greater than 20.                                                                                                                                                    |
| `minCount`<br/>*integer*          | The minimum number of instances to create. Should be greater than 1.                                                                                                                                                     |
| `region`<br/>*string*             | The region where the instance will be deployed.                                                                                                                                                                          |
| `attachments`<br/>*Array[object]* | The list of volumes to which the instance is attached.                                                                                                                                                                   |


<!-------------------- RETRIEVE AN INSTANCE -------------------->

#### Retrieve an instance

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-area/instances/i-03dffc71c7d649bb1"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "i-03dffc71c7d649bb1",
    "name": "NameOfMyInstance",
    "rootDeviceName": "/dev/xvda",
    "imageId": "ami-0947d2ba12ee1ff75",
    "instanceType": "t2.micro",
    "launchTime": "2022-01-11T20:57:30Z",
    "availabilityZone": "us-east-1a",
    "privateDnsName": "ip-172-31-90-212.ec2.internal",
    "privateIpAddress": "172.31.90.212",
    "publicDnsName": "ec2-54-210-168-154.compute-1.amazonaws.com",
    "publicIpAddress": "54.210.168.154",
    "state": "running",
    "subnetId": "subnet-0ac78483b1159f7e9",
    "vpcId": "vpc-040e8c412dc149b2a",
    "architecture": "x86_64",
    "clientToken": "7fe789d0-1e84-4c6a-886a-828b99f8525b",
    "rootDeviceType": "ebs",
    "virtualizationType": "hvm",
    "tags": [
      {
        "name": "NameOfMyInstance",
        "tag2": "wowASecondValueIdkNotRequired"
      }
    ],
    "coreCount": 1,
    "threadsPerCore": 1,
    "securityGroupName": "default",
    "minCount": 0,
    "maxCount": 0,
    "region": "us-east-1",
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
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id</code>

Retrieve an instance in a given [environment](#administration-environments).

| Attributes                        | &nbsp;                                                                                                                                                                                                                   |
|-----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `id`<br/>*string*                 | The ID of the instance.                                                                                                                                                                                                  |
| `name`<br/>*string*               | The name of the instance.                                                                                                                                                                                                |
| `rootDeviceName`<br/>*string*     | The device name of the root device volume (for example, /dev/sda1 ).                                                                                                                                                     |
| `imageId`<br/>*string*            | The ID of the AMI used to launch the instance.                                                                                                                                                                           |
| `instanceType`<br/>*string*       | The instance type.                                                                                                                                                                                                       |
| `launchTime`<br/>*string*         | The time the instance was launched.                                                                                                                                                                                      |
| `availabilityZone`<br/>*string*   | The Availability Zone of the instance.                                                                                                                                                                                   |
| `privateDnsName`<br/>*string*     | (IPv4 only) The private DNS hostname name assigned to the instance. This DNS hostname can only be used inside the Amazon EC2 network. This name is not available until the instance enters the running state.            |
| `privateIpAddress`<br/>*string*   | The private IPv4 address assigned to the instance.                                                                                                                                                                       |
| `publicDnsName`<br/>*string*      | (IPv4 only) The public DNS name assigned to the instance. This name is not available until the instance enters the running state. For EC2-VPC, this name is only available if you've enabled DNS hostnames for your VPC. |
| `publicIpAddress`<br/>*string*    | The public IPv4 address, or the Carrier IP address assigned to the instance, if applicable.                                                                                                                              |
| `state`<br/>*string*              | The current state of the instance.                                                                                                                                                                                       |
| `subnetId`<br/>*string*           | [EC2-VPC] The ID of the subnet in which the instance is running.                                                                                                                                                         |
| `vpcId`<br/>*string*              | [EC2-VPC] The ID of the VPC in which the instance is running.                                                                                                                                                            |
| `architecture`<br/>*string*       | The architecture of the image.                                                                                                                                                                                           |
| `clientToken`<br/>*string*        | The idempotency token you provided when you launched the instance, if applicable.                                                                                                                                        |
| `rootDeviceType`<br/>*string*     | The root device type used by the AMI. The AMI can use an EBS volume or an instance store volume.                                                                                                                         |
| `virtualizationType`<br/>*string* | The virtualization type of the instance.                                                                                                                                                                                 |
| `tags`<br/>*Array[object]*        | Any tags assigned to the instance. Tags are key value pairs.                                                                                                                                                             |
| `coreCount`<br/>*int*             | The number of CPU cores for the instance.                                                                                                                                                                                |
| `threadsPerCore`<br/>>*int*       | The number of threads per CPU core.                                                                                                                                                                                      |
| `securityGroupName`<br/>*string*  | The name of the security group.                                                                                                                                                                                          |
| `maxCount`<br/>*integer*          | The maximum number of instances to create. Cannot be greater than 20.                                                                                                                                                    |
| `minCount`<br/>*integer*          | The minimum number of instances to create. Should be greater than 1.                                                                                                                                                     |
| `region`<br/>*string*             | The region where the instance will be deployed.                                                                                                                                                                          |
| `attachments`<br/>*Array[object]* | The list of volumes to which the instance is attached.                                                                                                                                                                   |

<!-------------------- CREATE AN INSTANCE -------------------->

#### Create an instance
```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-area/instances"
```
> Request body example for an instance with custom security group:

```json
{
  "name": "name-of-the-instance",
  "imageId": "ami-08e4e35cccc6189f4",
  "instanceType": "t2.micro",
  "securityGroupScope": "CUSTOM",
  "securityGroupName": "sc-custom-user-iklp",
  "securityGroupDescription": "Custom: allow only port 8085",
  "minCount": 1,
  "maxCount": 1,
  "region": "us-east-1",
  "sshKey": {
    "keyName": "user ssh key"
  },
  "ipPolicies": [{
    "ipRange": "0.0.0.0/0",
    "protocol": "TCP",
    "portRange": "5200-5220"
  }],
  "blockDeviceMappings": [{
    "type": "Root",
    "attachmentDeviceName": "/dev/xvda",
    "deleteOnTermination": true,
    "size": 30,
    "volumeType": "gp3",
    "iops": 3000,
    "throughput": 250
  }],
  "vpcId": "vpc-0b23fed563eebe635",
  "subnetId": "subnet-0d4d9d813e763d403",
  "volumesToAttach": [{
    "volumeId": "vol-1",
    "device": "/dev/sdg",
  }]
}
```

> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances</code>

Create a new instance in a given [environment](#administration-environments).

| Required                                | &nbsp;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `name`<br/>*string*                     | The name of the instance.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `region`<br/>*string*                   | The region where the instance will be deployed.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| `imageId` <br/>*string*                 | The imageId to be used deployed with the instance. Represents the unique identifier of an amazon machine image (AMI). The imageId needs to be compatible with the machine type. The imageId needs to be available in the given region of the instance.                                                                                                                                                                                                                                                                                                                                                                           |
| `instanceType`<br/>*string*             | The type of the instance. Represents the specification of the instance (cpu, memory, storage). The instance type needs to be available in the given region of the instance.                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| `securityGroupScope`<br/>*enum*         | Possible values are CUSTOM, DEFAULT and ALL. Represents the scope of the security group. CUSTOM scope implies that an IP policy will be provided with the payload indicating the custom ports and IP range to use. It indicates that only traffic matching the IP policy will be able to reach the instance. ALL scope allows all traffic from all sources. It is the default scope for an instance. No need to provide an IP policy if that is the selected scope. Default allows HTTP, HTTPS and SSH traffic by opening ports 80, 443 and 22 to all public IPs. No need to provide an IP policy if that is the selected scope. |
| `securityGroupName`<br/>*string*        | The name of the security group.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| `securityGroupDescription`<br/>*string* | The description of the security group.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| `maxCount`<br/>*integer*                | The maximum number of instances to create. Cannot be greater than 20.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| `minCount`<br/>*integer*                | The minimum number of instances to create. Should be greater than 1.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| `sshKey.keyName`<br/>*string*           | The name of the SSH key to be used to connect to this instance via SSH.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| `blockDeviceMappings`<br/>*Array*       | Volumes to attached to the instance on launch. To be left empty if the default root volume should be used.  
| `volumesToAttach`<br/>*Array*       | Volumes to attached to the instance after it is launched. Only volumes in the same availability zone as the subnet can be attached.      


| Optional                                                | &nbsp;                                                                                                                                                             |
|---------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `ipPolicies`<br/>*Array*                                | The IP policy to use for the security group if the security group scope is CUSTOM.                                                                                 |
| `ipPolicies.ipRange`<br/>*string*                       | The IP range in CIDR block notation of an IPV4 compatible string. Indicates the allowed IP(s) to reach the instance.                                               |
| `ipPolicies.protocol`<br/>*enum*                        | Possible values are UDP, TCP and ICMP. Indicates the allowed protocol to use to reach the instance.                                                                |
| `ipPolicies.portRange`<br/>*integer*                    | The allowed IP range. Can be a single port or a port range, such as 1024-65535                                                                                     |
| `blockDeviceMappings.type`<br/>*string*                 | Indicates whether the volume is "Root" or "EBS", used to calculate minimum sizing.                                                                                 |
| `blockDeviceMappings.attachmentDeviceName`<br/>*string* | The device name for the attached volume.                                                                                                                           |
| `blockDeviceMappings.deleteOnTermination`<br/>*boolean* | Whether or not the volume should be deleted alongside the instance.                                                                                           |
| `blockDeviceMappings.size`<br/>*integer*                | The required size of the attached volume.                                                                                                                          |
| `blockDeviceMappings.volumeType`<br/>*string*           | The Amazon EBS volume type (gp2, gp3, io1, io2, st1, sc1, standard). Refer to "Create Volume" docs to see volume types & limits for their respective fields.       |
| `blockDeviceMappings.iops`<br/>*integer*                | Describes the maximum number of input/output operations per second (IOPS) supported by the volume type. This field is only valid for volume types gp3, io1, and io2. |
| `blockDeviceMappings.throughput`<br/>*integer*          | The throughput performance in MiB/s supported by the volume type. This field is only valid for gp3 volumes.                                                          |
| `vpcId` <br/>*string* | The id of the VPC in which the instance will be deployed. This must be specified if there is no default VPC in the selected region or if you decide to provide a subnet. |
|`subnetId` <br/>*string* | The id of the subnet in which the instance will be deployed. If this is not specified, the instance will be deployed in one of the default subnets in the default VPC. The subnet specified must belong to the VPC specified.



<aside class="notice">
If the security group scope of the instance is CUSTOM, then the ipPolicies field is required.
</aside>

<aside class="notice">
<br/>Linux device names: /dev/sdf through /dev/sdp<br/>
Windows device names: /dev/xvdf through /dev/xvdz<br/>
For root device name:<br/>
Linux: /dev/sda1 or /dev/xvda (depending on the AMI)<br/>
Windows: /dev/sda1<br/>
</aside>

<!-------------------- DELETE AN INSTANCE -------------------->

#### Delete an instance

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-area/instances/i-0d1f9106cd0e0dff7"
```
> The above command returns a JSON structured like this:

```json
{
    "taskId": "30121175-926a-4fd2-991b-ff303ffdf905",
    "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id</code>

| Attributes                 | &nbsp;                                        |
|----------------------------|-----------------------------------------------|
| `taskId` <br/>*string*     | The task id related to the instance deletion. |
| `taskStatus` <br/>*string* | The status of the operation.                  |

<!-------------------- START AN INSTANCE -------------------->

#### Start an instance

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-area/instances/i-0d1f9106cd0e0dff7?operation=start"
```
> The above command returns a JSON structured like this:

```json
{
    "taskId": "30121175-926a-4fd2-991b-ff303ffdf905",
    "taskStatus": "PENDING"
}
```

<code>START /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id</code>

| Attributes                 | &nbsp;                                        |
|----------------------------|-----------------------------------------------|
| `taskId` <br/>*string*     | The task id related to the instance to be started. |
| `taskStatus` <br/>*string* | The status of the operation.                  |

<!-------------------- STOP AN INSTANCE -------------------->

#### Stop an instance

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-area/instances/i-0d1f9106cd0e0dff7?operation=stop"
```
> The above command returns a JSON structured like this:

```json
{
    "taskId": "30121175-926a-4fd2-991b-ff303ffdf905",
    "taskStatus": "PENDING"
}
```

<code>STOP /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id</code>

| Attributes                 | &nbsp;                                        |
|----------------------------|-----------------------------------------------|
| `taskId` <br/>*string*     | The task id related to the instance to be stopped. |
| `taskStatus` <br/>*string* | The status of the operation.                  |

<!-------------------- DISASSOCIATE AN ELASTIC IP FROM AN INSTANCE -------------------->

#### Disassociate an Elastic IP from an instance

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-area/instances/i-0d1f9106cd0e0dff7?operation=disassociate"
```
> The above command returns a JSON structured like this:

```json
{
    "taskId": "30121175-926a-4fd2-991b-ff303ffdf905",
    "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=disassociate</code>

| Attributes                 | &nbsp;                                        |
|----------------------------|-----------------------------------------------|
| `taskId` <br/>*string*     | The task id related to the instance to be disassociated. |
| `taskStatus` <br/>*string* | The status of the operation.                  |


