### Instances

Deploy and manage your instances.

For information regarding bare metal instances, please see [bare metal instances](#cloudstack-bare-metal-instances).

<!-------------------- LIST INSTANCES -------------------->

#### List instances

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/instances"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "9db8ff2f-b49b-466d-a2f3-c1e6def408f4",
      "name": "my_instance",
      "affinityGroupIds": [],
      "computeOfferingId": "3caab5ed-b5a2-4d8a-82e4-51c46168ee6c",
      "computeOfferingName": "1vCPU.512MB",
      "cpuCount": 1,
      "hostname": "my_instance",
      "imageId": "5f968ad6-56d0-4d0d-ad7e-f8f4a5b5d986",
      "imageName": "CentOS 6.8 PV",
      "ipAddress": "10.164.212.68",
      "isPasswordEnabled": true,
      "macAddress": "02:00:2b:67:00:30",
      "memoryInMB": 512,
      "networkId": "d5a68379-a9ee-404f-9492-a1964b374d6f",
      "networkName": "Web-test_area",
      "state": "Running",
      "username": "cca-user",
      "vpcId": "9eb1592c-f92f-4ddd-9799-b58caf896328",
      "vpcName": "prod-VPC",
      "zoneId": "04afdbd1-e32d-4999-86d0-96703736dded",
      "zoneName": "QC-1"
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
`id`<br/>*UUID* | The id of the instance
`name`<br/>*string* | The display name of the instance
`affinityGroupIds`<br/>*Array[UUID]* | The id(s) of the [affinity groups](#cloudstack-affinity-groups) to which the instance is associated.
`computeOfferingId`<br/>*UUID* | The [compute offering](#cloudstack-compute-offerings) id of the instance
`computeOfferingName`<br/>*string* | The [compute offering](#cloudstack-compute-offerings) name of the instance
`cpuCount`<br/>*int* | The number of vCPUs associated with the instance's [compute offering](#cloudstack-compute-offerings)
`hostname`<br/>*string* | The host name of the instance
`imageId`<br/>*UUID* | The [image](#cloudstack-images) id of the instance
`imageName`<br/>*string* | The [image](#cloudstack-images) name of the instance
`ipAddress`<br/>*string* | The instance's private IPv4 address
`isPasswordEnabled`<br/>*boolean* | Indicate whether a password can be used for remote connections
`macAddress`<br/>*string* | The instance's MAC address
`memoryInMB`<br/>*int* | The number of megabytes associated with the instance's [compute offering](#cloudstack-compute-offerings)
`networkId`<br/>*UUID* | The id of the [network](#cloudstack-networks) where instance is deployed
`networkName`<br/>*string* | The name of the [network](#cloudstack-networks) where instance is deployed
`state`<br/>*string* | The current state of the instance
`username`<br/>*string* | The username that can be used to connect to the instance
`vpcId`<br/>*UUID* | The id of the associated [VPC](#cloudstack-vpcs)
`vpcName`<br/>*string* | The name of associated [VPC](#cloudstack-vpcs)
`zoneId`<br/>*UUID* | The id of the [zone](#cloudstack-zones) where instance is deployed
`zoneName`<br/>*string* | The name of associated [zone](#cloudstack-zones)

<!-------------------- RETRIEVE AN INSTANCE -------------------->

#### Retrieve an instance

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/instances/5951c2b8-e901-4c01-8ae0-cb8d7c508d29"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "9db8ff2f-b49b-466d-a2f3-c1e6def408f4",
    "name": "backup_instance",
    "affinityGroupIds": [],
    "computeOfferingId": "3caab5ed-b5a2-4d8a-82e4-51c46168ee6c",
    "computeOfferingName": "1vCPU.512MB",
    "cpuCount": 1,
    "hostname": "backup_instance",
    "imageId": "5f968ad6-56d0-4d0d-ad7e-f8f4a5b5d986",
    "imageName": "CentOS 6.8 PV",
    "ipAddress": "10.164.212.68",
    "isPasswordEnabled": true,
    "macAddress": "02:00:2b:67:00:30",
    "memoryInMB": 512,
    "networkId": "d5a68379-a9ee-404f-9492-a1964b374d6f",
    "networkName": "Web-test_area",
    "state": "Running",
    "userData": "",
    "username": "cca-user",
    "vpcId": "9eb1592c-f92f-4ddd-9799-b58caf896328",
    "vpcName": "prod-VPC",
    "zoneId": "04afdbd1-e32d-4999-86d0-96703736dded",
    "zoneName": "QC-1",
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

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id</code>

Retrieve information about a specific instance.

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | The id of the instance
`name`<br/>*string* | The display name of the instance
`affinityGroupIds`<br/>*Array[UUID]* | The id(s) of the [affinity groups](#cloudstack-affinity-groups) to which the instance is associated.
`computeOfferingId`<br/>*UUID* | The [compute offering](#cloudstack-compute-offerings) id of the instance
`computeOfferingName`<br/>*string* | The [compute offering](#cloudstack-compute-offerings) name of the instance
`cpuCount`<br/>*int* | The number of vCPUs associated with the instance's [compute offering](#cloudstack-compute-offerings)
`hostname`<br/>*string* | The host name of the instance
`imageId`<br/>*UUID* | The image id of the instance
`imageName`<br/>*string* | The image name of the instance
`ipAddress`<br/>*string* | The instance's private IPv4 address
`isPasswordEnabled`<br/>*boolean* | Indicate whether a password can be used for remote connections
`macAddress`<br/>*string* | The instance's MAC address
`memoryInMB`<br/>*int* | The number of megabytes associated with the instance's [compute offering](#cloudstack-compute-offerings)
`networkId`<br/>*UUID* | The id of the [network](#cloudstack-networks) where instance is deployed
`networkName`<br/>*string* | The name of the [network](#cloudstack-networks) where instance is deployed
`nics`<br/>*Array[[NIC](#cloudstack-nics)]* | The NICs of the instance<br/>*includes:* `id`, `isDefault`, `networkId`
`publicIps`<br/>*Array[[PublicIp](#cloudstack-public-ips)]* | The public IP addresses associated to the instance<br/>*includes:* `id`, `purposes`, `ipAddress`, `ports`
`state`<br/>*string* | The current state of the instance
`userData`<br/>*string* | The user data of the instance
`username`<br/>*string* | The username that can be used to connect to the instance
`vpcId`<br/>*UUID* | The id of the associated [VPC](#cloudstack-vpcs)
`vpcName`<br/>*string* | The name of associated [VPC](#cloudstack-vpcs)
`zoneId`<br/>*UUID* | The id of the [zone](#cloudstack-zones) where instance is deployed
`zoneName`<br/>*string* | The name of associated [zone](#cloudstack-zones)

<!-------------------- CREATE AN INSTANCE -------------------->

#### Create an instance

```shell

# Here is the absolute minimum information required to create a new instance:
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/instances"
```
> Request body example:

```json
{
   "name": "jarvis",
   "additionalDiskIops": 1000,
   "additionalDiskSizeInGb": 20,
   "affinityGroupId": "1c0bfd2b-d609-4892-a43e-273654532d26",
   "computeOfferingId": "3caab5ed-b5a2-4d8a-82e4-51c46168ee6c",
   "diskOfferingId": "f16f7f1b-462d-47b9-97bb-25a19e47a648",
   "networkId": "55ccea7f-8286-479e-a648-dd4a45866daf",
   "portsToForward": ["80", "9999"],
   "rootVolumeSizeInGb": 60,
   "sshKeyName": "mysshkey",
   "templateId": "5f968ad6-56d0-4d0d-ad7e-f8f4a5b5d986",
   "userData": "#!/bin/bash\necho 'hello world'",
   "volumeIdToAttach": "2478012b-3cf3-4eef-a8d6-85eb8599df6d"
}
```

 <code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances</code>

Create an instance in an [environment](#administration-environments). This endpoint allows you to easily attach a new or existing data volume and add port forwarding rules to the new instance without doing additional API calls. 

In order to create [bare metal instances](#cloudstack-bare-metal-instances), please see the [acquire](#cloudstack-acquire-a-bare-metal-instance) operation.

Required | &nbsp;
------ | -----------
`name`<br/>*string* | Name of the newly created instance
`computeOfferingId`<br/>*UUID* | The [compute offering](#cloudstack-compute-offerings) will determine the number of CPU and RAM of your instance
`networkId`<br/>*UUID* | The [network](#cloudstack-networks) in which the instance will be created. If you don't have a network, it can be created through the [create network](#cloudstack-create-network) api.
`templateId`<br/>*UUID* | The [template](#cloudstack-templates) to use for this instance

Optional | &nbsp;
------ | -----------
`additionalDiskIops`<br/>*int* | The number of IOPS the additional disk should have. You must choose a [disk offering](#cloudstack-disk-offerings) with custom IOPS enabled.
`additionalDiskSizeInGb`<br/>*int* | The number of GB the additional disk should have. You must choose a [disk offering](#cloudstack-disk-offerings) with custom disk size enabled.
`affinityGroupId`<br/>*UUID* | The [affinity group](#cloudstack-affinity-groups) where to create the instance.
`cpuCount`<br/>*int* | If the [compute offering](#cloudstack-compute-offerings) requires custom values (i.e. `"custom": true`), this value must be provided.
`diskOfferingId`<br/>*UUID* | The [disk offering](#cloudstack-disk-offerings) to be used for a new volume to attach to this instance
`ipAddress`<br/>*string* | Private IPv4 address of this instance, must be within network's CIDR and not collide with other instances on the network.
`memoryInMB`<br/>*int* | If the [compute offering](#cloudstack-compute-offerings) requires custom values (i.e. `"custom": true`), this value must be provided.
`portsToForward`<br/>*array[string]* | The [ports](#port-forwarding-rules) you would like to open on the instance. It will try to use an existing [public IP address](#cloudstack-public-ips), if it can't find one it will [acquire a new public IP](#cloudstack-acquire-a-public-ip).
`publicKey`<br/>*string* | The public key to use for this instance.
`rootVolumeSizeInGb`<br/>*int* | The number of GB of the root volume. You must choose a [template](#cloudstack-templates) that allows the resize of root volume. If none specified, then the default one of the template will be used.
`sshKeyName`<br/>*string* | The name of the [SSH key](#cloudstack-ssh-keys) to use for this instance. If you don't have an SSH key registered, you can do so through this [api](#cloudstack-create-ssh-key).
`userData`<br/>*string* | User data is data that can be accessed and interpreted in the instance.
`volumeIdToAttach`<br/>*UUID* | The [volume](#cloudstack-volumes) to attach to this instance.

<!-------------------- UPDATE AN INSTANCE -------------------->

#### Update an instance

```shell

# Here is the absolute minimum information required to create a new instance:
curl -X PUT \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/instances/5951c2b8-e901-4c01-8ae0-cb8d7c508d29"
```
> Request body example:

```json
{
   "name": "hal",
   "hostname": "hal_9000"
}
```

 <code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id</code>

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
   -d "request_body" \
   "https://cloudmc_endpoint:443/v1/services/compute-on/test_area/instances/5bf7352c-eed2-43dc-83f1-89917fb893ca" 
```
> Request body example:

```json
{
   "deleteSnapshots":true,
   "purgeImmediately":true,
   "publicIpIdsToRelease":[
      "fe446d61-a22c-403a-87bf-5351e65dc54d"
   ],
   "volumeIdsToDelete":[
      "e3d4045d-3ef7-464d-92a3-fc18269f36e2"
   ]
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id</code>

Destroys an existing instance. The instance needs to be in the *Running*, *Stopped* or *Error* state for the operation to work. This endpoint allows you to do additional cleanup of resources attached to this instance such as [public IPs](#cloudstack-public-ips), [volumes](#cloudstack-volumes) and [snapshots](#cloudstack-snapshots). If the purgeImmediately flag is not true, then it will not completely remove the instance from the [environment](#administration-environments). (i.e. the instance could still be recovered).

In order to destory [bare metal instances](#cloudstack-bare-metal-instances), please see the [release](#cloudstack-release-a-bare-metal-instance) operation.

Optional | &nbsp;
------ | -----------
`deleteSnapshots`<br/>*boolean* | Will delete all [snapshots](#cloudstack-snapshots) of volumes attached to this instance if true, will keep snapshots otherwise.
`publicIpIdsToRelease`<br/>*Array[UUID]* | List of IDs of the [public IP addresses](#cloudstack-public-ips) to release with the instance. Can only release public IPs of the instance being destroyed and they must not be used by other instances.
`purgeImmediately`<br/>*boolean* | Will destroy and purge the instance if true, puts the instance in destroyed state otherwise. An instance that wasn't purged can be recovered.
`volumeIdsToDelete`<br/>*Array[UUID]* | List of IDs of the [data volumes](#cloudstack-volumes) to delete with the instance. Can only destroy data volumes that are attached to this instance.

<!-------------------- START AN INSTANCE -------------------->

#### Start an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/instances/5951c2b8-e901-4c01-8ae0-cb8d7c508d29?operation=start"
```

 <code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=start</code>

Start an existing instance. The instance must be in the *Stopped* state for this operation to work.

<!-------------------- STOP AN INSTANCE -------------------->

#### Stop an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/instances/5951c2b8-e901-4c01-8ae0-cb8d7c508d29?operation=stop"
```
> Request body example:

```json
{
   "forceStop":true
}
```

 <code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=stop</code>

 Stop an existing instance. The instance must be in either the *Running* or *Stopping* state for this operation to work. The default behavior is that the instance (denote by **id**) will be stopped gracefully. An *additional* parameter can be passed with the call to *force stop* an instance. If the API is invoked on an instance that is already in the *Stopping* state, then a *force stop* is enforced regardless of whether this *optional* parameter was provided or not.

Optional | &nbsp;
------ | -----------
`forceStop`<br/>*boolean* | Setting it to **true** will force stop an instance that is either *Running* or in the process of *Stopping*

<!-------------------- REBOOT AN INSTANCE -------------------->

#### Reboot an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/instances/5951c2b8-e901-4c01-8ae0-cb8d7c508d29?operation=reboot"
```

 <code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=reboot</code>

Reboot an existing instance. The instance must be in the *Running* or *Stopped* state for this operation to work.

<!-------------------- PURGE AN INSTANCE -------------------->

#### Purge an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/instances/5951c2b8-e901-4c01-8ae0-cb8d7c508d29?operation=purge"
```

 <code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=purge</code>

Purges an existing instance (i.e. completely remove it from the environment). The instance must be in a *Destroyed* state.

<!-------------------- RECOVER AN INSTANCE -------------------->

#### Recover an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/instances/5951c2b8-e901-4c01-8ae0-cb8d7c508d29?operation=recover"
```

 <code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=recover</code>

Recover an existing instance that was previously destroyed. The instance must be in a *Destroyed* state.

<!-------------------- CHANGE COMPUTE OFFERING OF AN INSTANCE -------------------->

#### Change the compute offering of an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/instances/5951c2b8-e901-4c01-8ae0-cb8d7c508d29?operation=changeComputeOffering"
```

 <code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=changeComputeOffering</code>

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

<!-------------------- RESET PASSWORD OF AN INSTANCE -------------------->

#### Reset the password of an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/instances/5951c2b8-e901-4c01-8ae0-cb8d7c508d29?operation=resetPassword"
```

 <code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=resetPassword</code>

Reset the password of the default user of an existing instance. The new password of the instance will be in the task result.

<!-------------------- CHANGE NETWORK OF AN INSTANCE -------------------->

#### Change network of an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/instances/5951c2b8-e901-4c01-8ae0-cb8d7c508d29?operation=changeNetwork"
```

 <code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=changeNetwork</code>

Move an instance to another network. NOTE: This will destroy all port forwarding rules associated to this instance and remove the instance from all load balancing rules. Additionally, it will reboot your instance.

Required | &nbsp;
------ | -----------
`networkId`<br/>*UUID* | The destination [network](#cloudstack-networks).

<!-------------------- ASSOCIATE AN SSH KEY TO AN INSTANCE -------------------->

#### Associate an SSH key to an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/instances/5951c2b8-e901-4c01-8ae0-cb8d7c508d29?operation=associateSSHKey"
```
> Request body example:

```json
{
   "sshKeyName": "my_ssh_key"
}
```

 <code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=associateSSHKey</code>

Associate a new [SSH key](#cloudstack-ssh-keys) to the default user of an existing instance. This will override any other [SSH key](#cloudstack-ssh-keys) associated to the instance for the default user. You can register a new SSH key with the [register SSH key](#cloudstack-register-an-ssh-key) endpoint.

Required | &nbsp;
------ | -----------
`sshKeyName`<br/>*string* | The name of the [SSH key](#cloudstack-ssh-keys) to associate to the instance

#### Attach an ISO to an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/testing/instances/5951c2b8-e901-4c01-8ae0-cb8d7c508d29?operation=attachIso"
```
> Request body example:

```json
{
   "isoId": "f092a051-8b3f-4941-b47f-5ecb77f3423b"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=attachIso</code>

Attach an existing, non-bootable [ISO](#cloudstack-isos) to an instance. Each instance may have only one ISO attached at a time.

Required                | &nbsp;                                                  
------------------------|----------------------------------------------------------
`isoId`<br/>*UUID*      | The id of the ISO to attach

#### Detach the ISO from an instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/testing/instances/e922e5fc-8fee-4688-ad93-c9ef5d7eb685?operation=detachIso"

# No parameters required
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=detachIso</code>

Detach the currently attached [ISO](#cloudstack-isos) from an instance.
