### Instances
Deploy and manage your instances.

<!-------------------- LIST INSTANCES -------------------->

#### List instances

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/compute-on/test_area/instances"

# The above command returns JSON structured like this:
```
```json
{
  "data": [
    {
      "id": "9db8ff2f-b49b-466d-a2f3-c1e6def408f4",
      "name": "my_instance",
      "state": "Running",
      "zoneId": "04afdbd1-e32d-4999-86d0-96703736dded",
      "zoneName": "QC-1",
      "templateId": "5f968ad6-56d0-4d0d-ad7e-f8f4a5b5d986",
      "templateName": "CentOS 6.8 PV",
      "computeOfferingId": "3caab5ed-b5a2-4d8a-82e4-51c46168ee6c",
      "computeOfferingName": "1vCPU.512MB",
      "networkId": "d5a68379-a9ee-404f-9492-a1964b374d6f",
      "networkName": "Web-test_area",
      "vpcId": "9eb1592c-f92f-4ddd-9799-b58caf896328",
      "vpcName": "prod-VPC",
      "ipAddress": "10.164.212.68",
      "isPasswordEnabled": true,
      "macAddress": "02:00:2b:67:00:30",
      "cpuCount": 1,
      "memoryInMB": 512,
      "hostname": "my_instance",
      "username": "cca-user",
      "affinityGroupIds": []
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```
```go
resources, _ := ccaClient.GetResources("compute-on", "test_area")
ccaResources := resources.(cloudca.Resources)
instances, err := ccaResources.Instances.List()
```
<code>GET /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/instances</code>

Retrieve a list of all instances in a given [environment](#environments)

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | The id of the instance
`name`<br/>*string* | The display name of the instance
`state`<br/>*string* | The current state of the instance
`templateId`<br/>*UUID* | The [template](#templates) id of the instance
`templateName`<br/>*string* | The [template](#templates) name of the instance
`computeOfferingId`<br/>*UUID* | The [compute offering](#compute-offerings) id of the instance
`computeOfferingName`<br/>*string* | The [compute offering](#compute-offerings) name of the instance
`cpuCount`<br/>*int* | The number of vCPUs associated with the instance's [compute offering](#compute-offerings)
`memoryInMB`<br/>*int* | The number of megabytes associated with the instance's [compute offering](#compute-offerings)
`networkId`<br/>*UUID* | The id of the [network](#networks) where instance is deployed
`networkName`<br/>*string* | The name of the [network](#networks) where instance is deployed
`hostname`<br/>*string* | The host name of the instance
`username`<br/>*string* | The username that can be used to connect to the instance
`affinityGroupIds`<br/>*Array[UUID]* | The id(s) of the [affinity groups](#affinity-groups) to which the instance is associated.
`zoneId`<br/>*UUID* | The id of the [zone](#zones) where instance is deployed
`zoneName`<br/>*string* | The name of associated [zone](#zones)
`vpcId`<br/>*UUID* | The id of the associated [VPC](#vpcs)
`vpcName`<br/>*string* | The name of associated [VPC](#vpcs)
`ipAddress`<br/>*string* | The instance's private IPv4 address
`isPasswordEnabled`<br/>*boolean* | Indicate whether a password can be used for remote connections
`macAddress`<br/>*string* | The instance's MAC address

<!-------------------- RETRIEVE AN INSTANCE -------------------->

#### Retrieve an instance

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/compute-on/test_area/instances/5951c2b8-e901-4c01-8ae0-cb8d7c508d29"


# The above command returns JSON structured like this:
```
```json
{
  "data": {
    "id": "9db8ff2f-b49b-466d-a2f3-c1e6def408f4",
    "name": "backup_instance",
    "state": "Running",
    "zoneId": "04afdbd1-e32d-4999-86d0-96703736dded",
    "zoneName": "QC-1",
    "templateId": "5f968ad6-56d0-4d0d-ad7e-f8f4a5b5d986",
    "templateName": "CentOS 6.8 PV",
    "computeOfferingId": "3caab5ed-b5a2-4d8a-82e4-51c46168ee6c",
    "computeOfferingName": "1vCPU.512MB",
    "networkId": "d5a68379-a9ee-404f-9492-a1964b374d6f",
    "networkName": "Web-test_area",
    "vpcId": "9eb1592c-f92f-4ddd-9799-b58caf896328",
    "vpcName": "prod-VPC",
    "ipAddress": "10.164.212.68",
    "isPasswordEnabled": true,
    "macAddress": "02:00:2b:67:00:30",
    "cpuCount": 1,
    "memoryInMB": 512,
    "hostname": "backup_instance",
    "username": "cca-user",
    "affinityGroupIds": [],
    "userData": "",
    "publicIps": [{
      "id": "7a204b7f-1039-4867-8971-c1e4f778ef33",
      "ipAddress": "199.215.226.46",
      "purposes": [
        "PORT_FORWARDING"
      ],
      "ports": [
        "22"
      ]
    }],
    "nics": [{
      "id": "f401d989-b149-4870-99f3-1991fec31454",
      "isDefault": true,
      "networkId": "d5a68379-a9ee-404f-9492-a1964b374d6f"
    }]
  }
}
```
```go
resources, _ := ccaClient.GetResources("compute-on", "test_area")
ccaResources := resources.(cloudca.Resources)
instance, err := ccaResources.Instances.Get("9db8ff2f-b49b-466d-a2f3-c1e6def408f4")
```
<code>GET /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/instances/:id</code>

Retrieve information about a specific instance.

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | The id of the instance
`name`<br/>*string* | The display name of the instance
`state`<br/>*string* | The current state of the instance
`templateId`<br/>*UUID* | The [template](#templates) id of the instance
`templateName`<br/>*string* | The [template](#templates) name of the instance
`computeOfferingId`<br/>*UUID* | The [compute offering](#compute-offerings) id of the instance
`computeOfferingName`<br/>*string* | The [compute offering](#compute-offerings) name of the instance
`cpuCount`<br/>*int* | The number of vCPUs associated with the instance's [compute offering](#compute-offerings)
`memoryInMB`<br/>*int* | The number of megabytes associated with the instance's [compute offering](#compute-offerings)
`networkId`<br/>*UUID* | The id of the [network](#networks) where instance is deployed
`networkName`<br/>*string* | The name of the [network](#networks) where instance is deployed
`hostname`<br/>*string* | The host name of the instance
`username`<br/>*string* | The username that can be used to connect to the instance
`affinityGroupIds`<br/>*Array[UUID]* | The id(s) of the [affinity groups](#affinity-groups) to which the instance is associated.
`zoneId`<br/>*UUID* | The id of the [zone](#zones) where instance is deployed
`zoneName`<br/>*string* | The name of associated [zone](#zones)
`vpcId`<br/>*UUID* | The id of the associated [VPC](#vpcs)
`vpcName`<br/>*string* | The name of associated [VPC](#vpcs)
`ipAddress`<br/>*string* | The instance's private IPv4 address
`isPasswordEnabled`<br/>*boolean* | Indicate whether a password can be used for remote connections
`macAddress`<br/>*string* | The instance's MAC address
`userData`<br/>*string* | The user data of the instance
`publicIps`<br/>*Array[[PublicIp](#public-ips)]* | The public IP addresses associated to the instance<br/>*includes:* `id`, `purposes`, `ipAddress`, `ports`
`nics`<br/>*Array[[NIC](#nics)]* | The NICs of the instance<br/>*includes:* `id`, `isDefault`, `networkId`

<!-------------------- CREATE AN INSTANCE -------------------->

#### Create an instance

```shell

# Here is the absolute minimum information required to create a new instance:

curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/v1/services/compute-on/test_area/instances"

# Request should look like this
```
```json
{
   "name": "jarvis",
   "templateId": "5f968ad6-56d0-4d0d-ad7e-f8f4a5b5d986",
   "computeOfferingId": "3caab5ed-b5a2-4d8a-82e4-51c46168ee6c",
   "networkId": "55ccea7f-8286-479e-a648-dd4a45866daf",
   "diskOfferingId": "f16f7f1b-462d-47b9-97bb-25a19e47a648",
   "additionalDiskSizeInGb": 20,
   "additionalDiskIops": 1000,
   "sshKeyName": "mysshkey",
   "volumeIdToAttach": "2478012b-3cf3-4eef-a8d6-85eb8599df6d",
   "affinityGroupId": "1c0bfd2b-d609-4892-a43e-273654532d26",
   "portsToForward": ["80", "9999"],
   "userData": "#!/bin/bash\necho 'hello world'"
}
```
```go
resources, _ := ccaClient.GetResources("compute-on", "test_area")
ccaResources := resources.(cloudca.Resources)
createdInstance, err := ccaResources.Instances.Create(cloudca.Instance{
        Name: "jarvis",
        TemplateId: "5f968ad6-56d0-4d0d-ad7e-f8f4a5b5d986",
        ComputeOfferingId:"3caab5ed-b5a2-4d8a-82e4-51c46168ee6c",
        NetworkId:"55ccea7f-8286-479e-a648-dd4a45866daf",
    })
```
```dart
resource "cloudca_instance" "my_instance" {
    service_code = "compute-on"
    environment_name = "test_area"
    name = "jarvis"
    network_id = "55ccea7f-8286-479e-a648-dd4a45866daf"
    template = "CentOS 6.8 PV"
    compute_offering = "1vCPU.512MB"
    ssh_key_name = "my_ssh_key"
}
```
 <code>POST /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/instances</code>

Create an instance in an [environment](#environments). This endpoint allows you to easily attach a new or existing data volume and add port forwarding rules to the new instance without doing additional API calls.

Required | &nbsp;
------ | -----------
`name`<br/>*string* | Name of the newly created instance
`templateId`<br/>*UUID* | The [template](#templates) to use for this instance
`computeOfferingId`<br/>*UUID* | The [compute offering](#compute-offerings) will determine the number of CPU and RAM of your instance
`networkId`<br/>*UUID* | The [network](#networks) in which the instance will be created. If you don't have a network, it can be created through the [create network](#create-network) api.

Optional | &nbsp;
------ | -----------
`diskOfferingId`<br/>*UUID* | The [disk offering](#disk-offerings) to be used for a new volume to attach to this instance
`additionalDiskSizeInGb`<br/>*int* | The number of GB the additional disk should have. You must choose a [disk offering](#disk-offerings) with custom disk size enabled.
`additionalDiskIops`<br/>*int* | The number of IOPS the additional disk should have. You must choose a [disk offering](#disk-offerings) with custom IOPS enabled.
`sshKeyName`<br/>*string* | The name of the [SSH key](#ssh-keys) to use for this instance. If you don't have an SSH key registered, you can do so through this [api](#create-ssh-key).
`publicKey`<br/>*string* | The public key to use for this instance.
`volumeIdToAttach`<br/>*UUID* | The [volume](#volumes) to attach to this instance.
`affinityGroupId`<br/>*UUID* | The [affinity group](#affinity-groups) where to create the instance.
`portsToForward`<br/>*array[string]* | The [ports](#port-forwarding-rules) you would like to open on the instance. It will try to use an existing [public IP address](#public-ips), if it can't find one it will [acquire a new public IP](#acquire-a-public-ip).
`userData`<br/>*string* | User data is data that can be accessed and interpreted in the instance.
`cpuCount`<br/>*int* | If the [compute offering](#compute-offerings) requires custom values (i.e. `"custom": true`), this value must be provided.
`memoryInMB`<br/>*int* | If the [compute offering](#compute-offerings) requires custom values (i.e. `"custom": true`), this value must be provided.



<!-------------------- UPDATE AN INSTANCE -------------------->


#### Update an instance


```shell

# Here is the absolute minimum information required to create a new instance:

curl -X PUT \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/v1/services/compute-on/test_area/instances/5951c2b8-e901-4c01-8ae0-cb8d7c508d29"

# Request example:
```
```json
{
   "name": "hal",
   "hostname": "hal_9000"
}
```

 <code>POST /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/instances/:id</code>

Update the name and hostname of an existing instance.
<aside class="caution">
  Changing the hostname will force a reboot of your instance.
</aside>

Optional | &nbsp;
------ | -----------
`name`<br/>*string* | Updated name of instance
`hostname`<br/>*string* | Updated hostname of instance.


<!-------------------- DELETE AN INSTANCE -------------------->

#### Destroy an instance

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint:443/v1/services/compute-on/test_area/instances/5bf7352c-eed2-43dc-83f1-89917fb893ca" \

# Request example:
```
```json
{
   "purgeImmediately":true,
   "deleteSnapshots":true,
   "publicIpIdsToRelease":[
      "fe446d61-a22c-403a-87bf-5351e65dc54d"
   ],
   "volumeIdsToDelete":[
      "e3d4045d-3ef7-464d-92a3-fc18269f36e2"
   ]
}
```
```go
resources, _ := ccaClient.GetResources("compute-on", "test_area")
ccaResources := resources.(cloudca.Resources)
success, err := ccaResources.Instances.Destroy("5951c2b8-e901-4c01-8ae0-cb8d7c508d29", true) // purge flag
```

<code>DELETE /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/instances/:id</code>

Destroys an existing instance. The instance needs to be in the *Running*, *Stopped* or *Error* state for the operation to work. This endpoint allows you to do additional cleanup of resources attached to this instance such as [public IPs](#public-ips), [volumes](#volumes) and [snapshots](#snapshots). If the purgeImmediately flag is not true, then it will not completely remove the instance from the [environment](#environments). (i.e. the instance could still be recovered).


Optional | &nbsp;
------ | -----------
`purgeImmediately`<br/>*boolean* | Will destroy and purge the instance if true, puts the instance in destroyed state otherwise. An instance that wasn't purged can be recovered.
`deleteSnapshots`<br/>*boolean* | Will delete all [snapshots](#snapshots) of volumes attached to this instance if true, will keep snapshots otherwise.
`publicIpIdsToRelease`<br/>*Array[UUID]* | List of IDs of the [public IP addresses](#public-ips) to release with the instance. Can only release public IPs of the instance being destroyed and they must not be used by other instances.
`volumeIdsToDelete`<br/>*Array[UUID]* | List of IDs of the [data volumes](#volumes) to delete with the instance. Can only destroy data volumes that are attached to this instance.

<!-------------------- START AN INSTANCE -------------------->


#### Start an instance


```shell

# Example:

curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/compute-on/test_area/instances/5951c2b8-e901-4c01-8ae0-cb8d7c508d29?operation=start"

```
```go
resources, _ := ccaClient.GetResources("compute-on", "test_area")
ccaResources := resources.(cloudca.Resources)
success, err := ccaResources.Instances.Start("5951c2b8-e901-4c01-8ae0-cb8d7c508d29")
```

 <code>POST /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/instances/:id?operation=start</code>

Start an existing instance. The instance must be in the *Stopped* state for this operation to work.


<!-------------------- STOP AN INSTANCE -------------------->


#### Stop an instance


```shell

# Example:

curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/compute-on/test_area/instances/5951c2b8-e901-4c01-8ae0-cb8d7c508d29?operation=stop"
```
```go
resources, _ := ccaClient.GetResources("compute-on", "test_area")
ccaResources := resources.(cloudca.Resources)
success, err := ccaResources.Instances.Stop("5951c2b8-e901-4c01-8ae0-cb8d7c508d29")
```

 <code>POST /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/instances/:id?operation=stop</code>

 Stop an existing instance. The instance must be in the *Running* state for this operation to work.

<!-------------------- REBOOT AN INSTANCE -------------------->


#### Reboot an instance


```shell

# Example:

curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/compute-on/test_area/instances/5951c2b8-e901-4c01-8ae0-cb8d7c508d29?operation=reboot"
```
```go
resources, _ := ccaClient.GetResources("compute-on", "test_area")
ccaResources := resources.(cloudca.Resources)
success, err := ccaResources.Instances.Reboot("5951c2b8-e901-4c01-8ae0-cb8d7c508d29")
```

 <code>POST /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/instances/:id?operation=reboot</code>

Reboot an existing instance. The instance must be in the *Running* or *Stopped* state for this operation to work.

<!-------------------- PURGE AN INSTANCE -------------------->


#### Purge an instance


```shell

# Example:

curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/compute-on/test_area/instances/5951c2b8-e901-4c01-8ae0-cb8d7c508d29?operation=purge"
```
```go
resources, _ := ccaClient.GetResources("compute-on", "test_area")
ccaResources := resources.(cloudca.Resources)
success, err := ccaResources.Instances.Purge("5951c2b8-e901-4c01-8ae0-cb8d7c508d29")
```
 <code>POST /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/instances/:id?operation=purge</code>

Purges an existing instance (i.e. completely remove it from the environment). The instance must be in a *Destroyed* state.

<!-------------------- RECOVER AN INSTANCE -------------------->


#### Recover an instance


```shell

# Example:

curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/compute-on/test_area/instances/5951c2b8-e901-4c01-8ae0-cb8d7c508d29?operation=recover"
```
```go
resources, _ := ccaClient.GetResources("compute-on", "test_area")
ccaResources := resources.(cloudca.Resources)
success, err := ccaResources.Instances.Recover("instance_id")
```
 <code>POST /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/instances/:id?operation=recover</code>

Recover an existing instance that was previously destroyed. The instance must be in a *Destroyed* state.

<!-------------------- CHANGE COMPUTE OFFERING OF AN INSTANCE -------------------->


#### Change the compute offering of an instance


```shell

# Example:

curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/compute-on/test_area/instances/5951c2b8-e901-4c01-8ae0-cb8d7c508d29?operation=changeComputeOffering"
```
```go
resources, _ := ccaClient.GetResources("compute-on", "test_area")
ccaResources := resources.(cloudca.Resources)
success, err := ccaResources.Instances.ChangeComputeOffering(Instance {
   Id: "instance_id",
   ComputeOfferingId: "new_compute_offering_id"})
```

 <code>POST /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/instances/:id?operation=changeComputeOffering</code>

Change the compute offering of an existing instance.

<aside class="caution">
  This will force a reboot of your instance.
</aside>

Required | &nbsp;
------ | -----------
`computeOfferingId`<br/>*UUID* | Id of the new compute offering for the instnace

Required | (if custom compute offering)
------ | -----------
`cpuCount`<br/>*integer* | Number of CPUs for the instance
`memoryInMB`<br/>*integer* | Amount of memory in MB for the instance

<!-------------------- CHANGE COMPUTE OFFERING OF AN INSTANCE -------------------->


#### Reset the password of an instance


```shell

# Example:

curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/compute-on/test_area/instances/5951c2b8-e901-4c01-8ae0-cb8d7c508d29?operation=resetPassword"
```
```go
resources, _ := ccaClient.GetResources("compute-on", "test_area")
ccaResources := resources.(cloudca.Resources)
password, err := ccaResources.Instances.ResetPassword("instance_id")
```

 <code>POST /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/instances/:id?operation=resetPassword</code>

Reset the password of the default user of an existing instance. The new password of the instance will be in the task result.


<!-------------------- ASSOCIATE AN SSH KEY TO AN INSTANCE -------------------->


#### Associate an SSH key to an instance


```shell

# Example:

curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/compute-on/test_area/instances/5951c2b8-e901-4c01-8ae0-cb8d7c508d29?operation=associateSSHKey"

# Request example:
```
```json
{
   "sshKeyName": "my_ssh_key"
}
```
```go
resources, _ := ccaClient.GetResources("compute-on", "test_area")
ccaResources := resources.(cloudca.Resources)
success, err := ccaResources.Instances.AssociateSSHKey("5951c2b8-e901-4c01-8ae0-cb8d7c508d29", "my_ssh_key")
```

 <code>POST /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/instances/:id?operation=associateSSHKey</code>

Associate a new [SSH key](#ssh-keys) to the default user of an existing instance. This will override any other [SSH key](#ssh-keys) associated to the instance for the default user. You can register a new SSH key with the [register SSH key](#register-an-ssh-key) endpoint.

Required | &nbsp;
------ | -----------
`sshKeyName`<br/>*string* | The name of the [SSH key](#ssh-keys) to associate to the instance
