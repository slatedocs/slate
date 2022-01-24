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
      "id": "i-0d1f9106cd0e0dff7",
      "rootDeviceName": "/dev/xvda",
      "imageId": "ami-0947d2ba12ee1ff75",
      "instanceType": "t2.micro",
      "launchTime": "2020-11-19T03:41:51Z",
      "availabilityZone": "us-east-1e",
      "privateDnsName": "ip-172-31-55-223.ec2.internal",
      "privateIpAddress": "172.31.55.223",
      "publicDnsName": "ec2-54-237-115-182.compute-1.amazonaws.com",
      "publicIpAddress": "54.237.115.182",
      "state": "running",
      "subnetId": "subnet-775e9c46",
      "vpcId": "vpc-4aaf6537",
      "architecture": "x86_64",
      "clientToken": "be7d840f-09e5-46b7-96ed-e6eb9fsaf133",
      "rootDeviceType": "ebs",
      "virtualizationType": "hvm",
      "tags": [],
      "coreCount": 1,
      "threadsPerCore": 1
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances</code>

Retrieve a list of all instances in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | The ID of the instance.
`rootDeviceName`<br/>*string* | The device name of the root device volume (for example, /dev/sda1 ).
`imageId`<br/>*string* | The ID of the AMI used to launch the instance.
`instanceType`<br/>*string* | The instance type.
`launchTime`<br/>*string* | The time the instance was launched.
`availabilityZone`<br/>*string* | The Availability Zone of the instance.
`privateDnsName`<br/>*string* | (IPv4 only) The private DNS hostname name assigned to the instance. This DNS hostname can only be used inside the Amazon EC2 network. This name is not available until the instance enters the running state.
`privateIpAddress`<br/>*string* | The private IPv4 address assigned to the instance.
`publicDnsName`<br/>*string* | (IPv4 only) The public DNS name assigned to the instance. This name is not available until the instance enters the running state. For EC2-VPC, this name is only available if you've enabled DNS hostnames for your VPC.
`publicIpAddress`<br/>*string* | The public IPv4 address, or the Carrier IP address assigned to the instance, if applicable.
`state`<br/>*string* | The current state of the instance.
`subnetId`<br/>*string* | [EC2-VPC] The ID of the subnet in which the instance is running.
`vpcId`<br/>*string* | [EC2-VPC] The ID of the VPC in which the instance is running.
`architecture`<br/>*string* | The architecture of the image.
`clientToken`<br/>*string* | The idempotency token you provided when you launched the instance, if applicable.
`rootDeviceType`<br/>*string* | The root device type used by the AMI. The AMI can use an EBS volume or an instance store volume.
`virtualizationType`<br/>*string* | The virtualization type of the instance.
`tags`<br/>*Array[object]* | Any tags assigned to the instance. Tags are key value pairs.
`coreCount`<br/>*int* | The number of CPU cores for the instance.
`threadsPerCore`<br/>>*int* | The number of threads per CPU core.


<!-------------------- RETRIEVE AN INSTANCE -------------------->

#### Retrieve an instance

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/aws/test-area/instances/i-0d1f9106cd0e0dff7"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "i-0d1f9106cdde0dff7",
    "rootDeviceName": "/dev/xvda",
    "imageId": "ami-0947d2ba12ee1ff75",
    "instanceType": "t2.micro",
    "launchTime": "2020-11-19T03:41:51Z",
    "availabilityZone": "us-east-1e",
    "privateDnsName": "ip-172-31-55-223.ec2.internal",
    "privateIpAddress": "172.31.55.223",
    "publicDnsName": "ec2-54-237-115-182.compute-1.amazonaws.com",
    "publicIpAddress": "54.237.115.182",
    "state": "running",
    "subnetId": "subnet-775e9c46",
    "vpcId": "vpc-4aaf6537",
    "architecture": "x86_64",
    "clientToken": "be7d840f-09e5-46b7-96ed-e6eb9f0af133",
    "rootDeviceType": "ebs",
    "virtualizationType": "hvm",
    "tags": [],
    "coreCount": 1,
    "threadsPerCore": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id</code>

Retrieve an instance in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | The ID of the instance.
`rootDeviceName`<br/>*string* | The device name of the root device volume (for example, /dev/sda1 ).
`imageId`<br/>*string* | The ID of the AMI used to launch the instance.
`instanceType`<br/>*string* | The instance type.
`launchTime`<br/>*string* | The time the instance was launched.
`availabilityZone`<br/>*string* | The Availability Zone of the instance.
`privateDnsName`<br/>*string* | (IPv4 only) The private DNS hostname name assigned to the instance. This DNS hostname can only be used inside the Amazon EC2 network. This name is not available until the instance enters the running state.
`privateIpAddress`<br/>*string* | The private IPv4 address assigned to the instance.
`publicDnsName`<br/>*string* | (IPv4 only) The public DNS name assigned to the instance. This name is not available until the instance enters the running state. For EC2-VPC, this name is only available if you've enabled DNS hostnames for your VPC.
`publicIpAddress`<br/>*string* | The public IPv4 address, or the Carrier IP address assigned to the instance, if applicable.
`state`<br/>*string* | The current state of the instance.
`subnetId`<br/>*string* | [EC2-VPC] The ID of the subnet in which the instance is running.
`vpcId`<br/>*string* | [EC2-VPC] The ID of the VPC in which the instance is running.
`architecture`<br/>*string* | The architecture of the image.
`clientToken`<br/>*string* | The idempotency token you provided when you launched the instance, if applicable.
`rootDeviceType`<br/>*string* | The root device type used by the AMI. The AMI can use an EBS volume or an instance store volume.
`virtualizationType`<br/>*string* | The virtualization type of the instance.
`tags`<br/>*Array[object]* | Any tags assigned to the instance. Tags are key value pairs.
`coreCount`<br/>*int* | The number of CPU cores for the instance.
`threadsPerCore`<br/>>*int* | The number of threads per CPU core.


<!-------------------- CREATE AN INSTANCE -------------------->

#### Create an instance
```shell
curl -X DELETE \
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
			"fromPort": 8085,
			"toPort": 8085
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

Required | &nbsp;
 ------- | -----------
`name`<br/>*string* | The name of the instance.
`region`<br/>*string* | The region where the instance will be deployed.
`imageId` <br/>*string* | The imageId to be used deployed with the instance. Represents the unique identifier of an amazon machine image (AMI). The imageId needs to be compatible with the machine type. The imageId needs to be available in the given region of the instance.
`instanceType`<br/>*string* | The instance type for the instance. Represents the specification of the instance (cpu, memory, storage). The instance type needs to be available in the given region of the instance.
`securityGroupScope`<br/>*enum* | Possible values are CUSTOM, DEFAULT and ALL. Represents the scope of the security group. CUSTOM scope implies that an IP policy will be provided with the payload indicating the custom ports and IP range to use. It indicates that only traffic matching the IP policy will be able to reach the instance. ALL scope allows all traffic from all sources. It is the default scope for an instance. No need to provide an IP policy if that is the selected scope. Default allows HTTP, HTTPS and SSH traffic by opening ports 80, 443 and 22 to all public IPs. No need to provide an IP policy if that is the selected scope.
`securityGroupName`<br/>*string* | The name of the security group.
`securityGroupDescription`<br/>*string* | The description of the security group.
`maxCount`<br/>*integer* | The maximum number of instances to create. Cannot be greater than 20.
`minCount`<br/>*integer* | The minimum number of instances to create. Should be greater than 1.
`sshKey.keyName`<br/>*string* | The name of the SSH key to be used to connect to this instance via SSH.

 Optional | &nbsp;
 ------- | -----------
`ipPolicies`<br/>*Array* | The IP policy to use for the security group if the security group scope is CUSTOM.
`ipPolicies.ipRange`<br/>*string* | The IP range in CIDR block notation of an IPV4 compatible string. Indicates the allowed IP(s) to reach the instance.
`ipPolicies.protocol`<br/>*enum* | Possible values are UDP, TCP and ICMP. Indicates the allowed protocol to use to reach the instance.
`ipPolicies.fromPort`<br/>*integer* | The allowed origin port of the IP range.
`ipPolicies.toPort`<br/>*integer* | The allowed destination port of the IP range.

<aside class="notice">
If the security group scope of the instance is CUSTOM, then the ipPolicies field is required.
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

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the instance deletion.
`taskStatus` <br/>*string* | The status of the operation.


