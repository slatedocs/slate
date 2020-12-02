### Bare metal instances

Deploy and manage your bare metal instances.

For information regarding virtual instances, please see [instances](#cloudstack-instances).

#### List bare metal instances

Identical to virtual instances, please see [list instances](#cloudstack-list-instances).

#### Retrieve a bare metal instance

Identical to virtual instances, please see [retrieve an instance](#cloudstack-retrieve-an-instance).

#### Acquire a bare metal instance

```shell
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
   "computeOfferingId": "3caab5ed-b5a2-4d8a-82e4-51c46168ee6c",
   "networkId": "55ccea7f-8286-479e-a648-dd4a45866daf",
   "portsToForward": ["80", "9999"],
   "sshKeyName": "mysshkey",
   "templateId": "5f968ad6-56d0-4d0d-ad7e-f8f4a5b5d986",
   "userData": "#!/bin/bash\necho 'hello world'"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances?operation=acquireBareMetal</code>

Acquire a bare metal instance in an [environment](#administration-environments). This endpoint allows you to easily add [port forwarding rules](#port-forwarding-rules) and user data to the instance without doing additional API calls. This operation is analogous to the [create an instance](#cloudstack-create-an-instance) operation for virtual instances.

Required | &nbsp;
------ | -----------
`name`<br/>*string* | Name of the newly created instance
`computeOfferingId`<br/>*UUID* | The [compute offering](#cloudstack-compute-offerings) will determine the hardware specifications of your instance.
`networkId`<br/>*UUID* | The [network](#cloudstack-networks) in which the instance will be created. If you don't have a network, it can be created through the [create network](#cloudstack-create-network) api.
`sshKeyName`<br/>*string* | The name of the [SSH key](#cloudstack-ssh-keys) to use for this instance. If you don't have an SSH key registered, you can do so through this [api](#cloudstack-create-ssh-key).
`templateId`<br/>*UUID* | The [template](#cloudstack-templates) to use for this instance.

Optional | &nbsp;
------ | -----------
`ipAddress`<br/>*string* | Private IPv4 address of this instance, must be within network's CIDR and not collide with other instances on the network.
`portsToForward`<br/>*array[string]* | The [ports](#port-forwarding-rules) you would like to open on the instance. It will try to use an existing [public IP address](#cloudstack-public-ips), if it can't find one it will [acquire a new public IP](#cloudstack-acquire-a-public-ip).
`userData`<br/>*string* | User data is data that can be accessed and interpreted in the instance.

#### Release a bare metal instance

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/instances/5951c2b8-e901-4c01-8ae0-cb8d7c508d29?operation=releaseBareMetal"
```
> Request body example:

```json
{
   "publicIpIdsToRelease":[
      "fe446d61-a22c-403a-87bf-5351e65dc54d"
   ]  
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=releaseBareMetal</code>

Release an acquired bare metal instance from the [environment](#administration-environments). The instance will be immediatedly released. This operation is analogous to the [destroy an instance](#cloudstack-destroy-an-instance) operation with the purgeImmediately flag set to true (i.e. the instance will not be recovered).

#### Associate an SSH key to an instance

Identical to virtual instances, please see [associate an SSH key](##cloudstack-associate-an-ssh-key-to-an-instance).
