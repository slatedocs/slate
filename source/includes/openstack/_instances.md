### Instances

Deploy and manage your instances. Instances are virtual machines or physical machines managed by OpenStack.

#### List instances

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v2/services/compute-os/devel/instances"
```
> The above command returns a JSON structured like this:

```json
{
    "data": [
      {
         "id": "30fca349-68b0-48c2-9ada-1f60f57fa44e",
         "name": "nginx",
         "cpuCount": 2,
         "memoryInMB": 2048,
         "state": "active",
         "flavorId": "1d547941-1738-4d7b-a70b-b52a44ff18e5",
         "flavorName": "2vCPU.2GB",
         "imageId": "68f9027d-cf64-4648-a0fa-4667d5618b6b",
         "imageName": "ubuntu",
         "networkName": "web",
         "privateIpAddress": "192.168.0.11",
         "securityGroupNames": [
             "webServerSecGroup",
             "sshSecGroup"
         ],
        "updatedDate": "2020-04-15 14:38:32",
        "createdDate": "2020-04-15 14:37:53",
        "addresses": [
          {
            "networkId": "738f3944-e44c-4729-9fca-c6ade9235850",
            "networkName": "web",
            "portId": "08e7fabd-33ad-400c-a973-7bbf8cff51bc",
            "macAddress": "fa:16:3e:02:de:ae",
            "ipAddress": "10.55.84.72",
            "ipType": "fixed",
            "ipVersion": 4
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

Retrieve a list of all instances in an environment.

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | The id of the instance.
`name`<br/>*string* | The name of the instance.
`state`<br/>*string* | The current state of the instance.
`flavorId`<br/>*UUID* | The [flavor](#openstack-flavors) id of the instance.
`flavorName`<br/>*string* | The [flavor](#openstack-flavors) name of the instance.
`imageId`<br/>*UUID* | The [image](#openstack-images) id of the instance.
`imageName`<br/>*string* | The [image](#openstack-images)  name of the instance.
`cpuCount`<br/>*int* | The number of vCPUs associated with the instance's [flavor](#openstack-flavors).
`memoryInMB`<br/>*int* | The number of megabytes associated with the instance's [flavor](#openstack-flavors).
`networkId`<br/>*UUID* | The id of the network where instance is deployed.
`networkName`<br/>*string* | The name of the network where instance is deployed.
`privateIpAddress`<br/>*string* | The instance's private IP address.
`securityGroupNames`<br/>*Array[string]* | The list of [security groups](#openstack-security-groups) associated to the instance.
`createdDate`<br/>*string* | The date the instance was created.
`updatedDate`<br/>*string* | The date the instance was updated.
`addresses`:<br/>*Array[Object]* | The list of addresses attached to the instance.
`addresses.networkId`:<br/>*string* | The id of the network.
`addresses.networkName`:<br/>*string* | The name of the network.
`addresses.portId`:<br/>*string* | The id of the port.
`addresses.macAddress`:<br/>*string* | The MAC address associated to the address.
`addresses.ipAddress`:<br/>*string* | The IP address.
`addresses.ipType`:<br/>*string* | The type of address. Possible values : fixed, floating.
`addresses.ipVersion`:<br/>*integer* | The version of the IP protocol.
     

#### Retrieve an instance

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v2/services/compute-os/devel/instances/30fca349-68b0-48c2-9ada-1f60f57fa44e"
```
> The above command returns a JSON structured like this:

```json
{
   "data": {
      "id": "30fca349-68b0-48c2-9ada-1f60f57fa44e",
      "name": "nginx",
      "cpuCount": 2,
      "memoryInMB": 2048,
      "state": "active",
      "flavorId": "1d547941-1738-4d7b-a70b-b52a44ff18e5",
      "flavorName": "2vCPU.2GB",
      "imageId": "68f9027d-cf64-4648-a0fa-4667d5618b6b",
      "imageName": "ubuntu",
      "networkName": "web",
      "privateIpAddress": "192.168.0.11",
      "securityGroupNames": [
          "webServerSecGroup",
          "sshSecGroup"
      ],
      "updatedDate": "2020-04-15 14:38:32",
      "createdDate": "2020-04-15 14:37:53",
      "addresses": [
        {
          "networkId": "738f3944-e44c-4729-9fca-c6ade9235850",
          "networkName": "web",
          "portId": "08e7fabd-33ad-400c-a973-7bbf8cff51bc",
          "macAddress": "fa:16:3e:02:de:ae",
          "ipAddress": "10.55.84.72",
          "ipType": "fixed",
          "ipVersion": 4
        }
      ]
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id</code>

Retrieve information about an instance.

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | The id of the instance.
`name`<br/>*string* | The name of the instance.
`state`<br/>*string* | The current state of the instance.
`flavorId`<br/>*UUID* | The [flavor](#openstack-flavors) id of the instance.
`flavorName`<br/>*string* | The [flavor](#openstack-flavors) name of the instance.
`imageId`<br/>*UUID* | The [image](#openstack-images) id of the instance.
`imageName`<br/>*string* | The [image](#openstack-images)  name of the instance.
`cpuCount`<br/>*int* | The number of vCPUs associated with the instance's [flavor](#openstack-flavors).
`memoryInMB`<br/>*int* | The number of megabytes associated with the instance's [flavor](#openstack-flavors).
`networkId`<br/>*UUID* | The id of the network where instance is deployed.
`networkName`<br/>*string* | The name of the network where instance is deployed.
`privateIpAddress`<br/>*string* | The instance's private IP address.
`securityGroupNames`<br/>*Array[string]* | The list of [security groups](#openstack-security-groups) associated to the instance.
`createdDate`<br/>*string* | The date the instance was created.
`updatedDate`<br/>*string* | The date the instance was updated.
`addresses`:<br/>*Array[Object]* | The list of addresses attached to the instance.
`addresses.networkId`:<br/>*string* | The id of the network.
`addresses.networkName`:<br/>*string* | The name of the network.
`addresses.portId`:<br/>*string* | The id of the port.
`addresses.macAddress`:<br/>*string* | The MAC address associated to the address.
`addresses.ipAddress`:<br/>*string* | The IP address.
`addresses.ipType`:<br/>*string* | The type of address. Possible values : fixed, floating.
`addresses.ipVersion`:<br/>*integer* | The version of the IP protocol.

#### Create an instance

```shell
curl -X POST \
    -H "MC-Api-Key: your_api_key" \
    -H "Content-Type: application/json" \
    -d "request_body" \
    "https://cloudmc_endpoint/api/v2/services/compute-os/devel/instances"
```
> Request body example:

```json
{
    "name": "web1",
    "imageId": "1d547941-1738-4d7b-a70b-b52a44ff18e5",
    "flavorId": "68f9027d-cf64-4648-a0fa-4667d5618b6b",
    "networkId": "2fc5a74b-26c9-4541-af3f-84ee4c75eb0c",
    "securityGroupNames": ["secGroupA", "secGroupB"]
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances</code>

Create an instance in an environment.

Required | &nbsp;
------ | -----------
`imageId`<br/>*UUID* | The [image](#openstack-images) to use for this instance.
`flavorId`<br/>*UUID* | The [flavor](#openstack-flavors) will determine the number of CPU and RAM of your instance.
`networkId`<br/>*UUID* | The network in which the instance will be created. If you don't have a network, it can be created through the create network API.
`securityGroupNames`<br/>*Array[string]* | The list of [security groups](#openstack-security-groups) to be associated to the instance.

Optional | &nbsp;
------ | -----------
`name`<br/>*string* | Name of the instance.
`userData`<br/>*string* | Data that the user can specify when they launch an instance. User data can be used in the cloud-init system as a script that is run during the initial launch. The user data field can be used to configure SSH keys, user settings, or run a script.
`sshKeyName`<br/>*string* | Name of the ssh key to link to the instance.
`volumeToAttach`<br>*Object* | Specifies that a volume must be attached a volume needs to be attached to the instance.
`volumeToAttach.id`<br>*Object* | Id of an existing volume to attach to the instance.
`volumeToAttach.sizeInGB`<br>*Object* | The size in GB of the new disk to attached to the instance.

#### Associate a floating IP

```shell
curl -X POST \
    -H "MC-Api-Key: your_api_key" \
    -H "Content-Type: application/json" \
    -d "request_body" \
    "https://cloudmc_endpoint/api/v2/services/compute-os/devel/instances/30fca349-68b0-48c2-9ada-1f60f57fa44e?operation=associate"
```
> Request body example:

```json
{
  "floatingIpId": "287a3963-983b-4602-9dea-4dff89e9dc10"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=associate</code>

Associate a floating IP to an instance in your environment.

Required                  | Description
------------------------- | -------------------------------------------
`floatingIpId`<br/>*UUID* | The ID of a previously-acquired floating IP.

#### Change security groups
```shell
curl -X POST \
    -H "MC-Api-Key: your_api_key" \
    -H "Content-Type: application/json" \
    -d "request_body" \
    "https://cloudmc_endpoint/api/v2/services/compute-os/devel/instances/30fca349-68b0-48c2-9ada-1f60f57fa44e?operation=changeSecurityGroups"
```
> Request body example:

```json
{
  "securityGroupNames": [ "securityGroupNameA", "securityGroupNameB"]
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=changeSecurityGroups</code>

Change the security groups of an instance to the ones specified in the request.

Required                                 | Description
---------------------------------------- | -------------------------------------------
`securityGroupNames`<br/>*Array[string]* | A list of security group names that should be associated to the instance


#### Delete an instance

```shell
curl -X DELETE \
    -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v2/services/compute-os/devel/instances/30fca349-68b0-48c2-9ada-1f60f57fa44e"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id</code>

Delete an instance.
