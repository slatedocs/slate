## Workloads

StackPath Edge Computing uses the concept of workloads to organize different applications. A workload can consist of one container or virtual machine image that is deployed to one or many locations.

Deploy and manage your workloads.


<!-------------------- LIST WORKLOADS -------------------->

### List workloads

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/stackpath/test-area/workloads"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "1b932678-1038-4ab4-9fa4-c4c06e696e20",
      "name": "stackpath_wl_01",
      "stackId": "3e651d2e-b1f4-44ad-b21a-ebcd0bf79ca1",
      "slug": "stackpath-workload-01",
      "status": "ACTIVE",
      "specs": "SP-2",
      "version": "3",
      "created": "2020-11-06T18:48:36.850115786Z",
      "type": "VM",
      "network": "default",
      "cpu": "2",
      "memory": "4Gi",
      "isRemoteManagementEnabled": false,
      "image": "stackpath-edge/centos-7:v202007311835"
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/workloads</code>

Retrieve a list of all workloads in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | A workload's unique identifier.
`name`<br/>*string* | The display name of the workload.
`stackId`<br/>*string* | The ID of the stack that a workload belongs to.
`slug`<br/>*string* | A workload's programmatic name. Workload slugs are used to build its instances names.
`status`<br/>*string* | The status of the workload. It can be either ACTIVE or DISABLED.
`specs`<br/>*string* | Specification type for resources which are allocated to each instance in a workload.
`version`<br/>*string* | A version number for the workload. Versions start at 1 when they are created and increment by 1 every time they are updated.
`created`<br/>*string* | Creation timestamp of the workload.
`type`<br/>*string* | Specify whether a workload is a VM-based workload or container-based.
`network`<br/>*string* | Network interfaces to bind to the workload's instances.
`cpu`<br/>*string* | The number of vCPUs for the workload's instance.
`memory`<br/>*string* | The memory size for the workload's instance.
`isRemoteManagementEnabled`<br/>*boolean* | Specify if remote management is enabled on workload instance or not.
`image`<br/>*string* | The workload's instance operating system image.


<!-------------------- RETRIEVE A WORKLOAD -------------------->

### Retrieve a workload

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/stackpath/test-area/workloads/1b932678-1038-4ab4-9fa4-c4c06e696e20"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "bf9fd2ac-f761-46ef-88e0-b61ef68f8619",
    "name": "stackpath-wl-01",
    "stackId": "3e651d2e-b1f4-44ad-b21a-ebcd0bf79ca1",
    "slug": "stackpath-workload-01",
    "status": "ACTIVE",
    "specs": "SP-1",
    "version": "3",
    "created": "2020-11-09T08:28:45.185278507Z",
    "type": "Container",
    "network": "default",
    "cpu": "1",
    "memory": "2Gi",
    "isRemoteManagementEnabled": false,
    "image": "nginx:latest"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/workloads/:id</code>

Retrieve a workload in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | A workload's unique identifier.
`name`<br/>*string* | The display name of the workload.
`stackId`<br/>*string* | The ID of the stack that a workload belongs to.
`slug`<br/>*string* | A workload's programmatic name. Workload slugs are used to build its instances names.
`status`<br/>*string* | The status of the workload. It can be either ACTIVE or DISABLED.
`specs`<br/>*string* | Specification type for resources which are allocated to each instance in a workload.
`version`<br/>*string* | A version number for the workload. Versions start at 1 when they are created and increment by 1 every time they are updated.
`created`<br/>*string* | Creation timestamp of the workload.
`type`<br/>*string* | Specify whether a workload is a VM-based workload or container-based.
`network`<br/>*string* | Network interfaces to bind to the workload's instances.
`cpu`<br/>*string* | The number of vCPUs for the workload's instance.
`memory`<br/>*string* | The memory size for the workload's instance.
`isRemoteManagementEnabled`<br/>*boolean* | Specify if remote management is enabled on workload instance or not.
`image`<br/>*string* | The workload's instance operating system image.

<!-------------------- CREATE A WORKLOAD -------------------->
### Create a workload
```shell
curl -X POST \
    -H "MC-Api-Key: your_api_key" \
    -d "request_body" \
    "https://cloudmc_endpoint/v1/services/stackpath/test-area/workloads"
```
> Request body example for a VM:
```json
{
   "name":"w-user-zwg",
   "slug":"w-user-zwg",
   "type":"VM",
   "image":"stackpath-edge/centos-7-cpanel:v201905241955",
   "vpc":"Default",
   "addAnyCastIpAddress":false,
   "publicPorts":"80",
   "protocol":"TCP",
   "firstBootSshKey":"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDcYr9OnzsDfYVW2I1kX/iYJ0mPG490bI5mbxbOAKPLMuWLguxRohX804j1XbwZJ+Sna+9rSfxaYA8vgd1MoYX10l9cnMLx/MMbYp4ZquauN4pGY3WoDeCqsTss3VUMW+7RFBILpU3SJTlDV02FI36D3IXb4A8XymCyU3KC99XXTfTQsuKC+WFRMsTWtklrasqCVd5yEG90i/aJc6A3TZGOYgPFNEeVYvNDaJmIkb3y4FfShoBIMgZRt0ay7SvWZUvyfvyNmK5W9ePdhZZ58R+7tQNmCzjQ4v0suWRuGJ/XL3+03w3HEsDdQx+noL+R+qAjoNFwc0spBBhJK+Q4ADqr nothing@gmail.com",
   "specs":"SP-1",
   "persistenceStoragePath":"",
   "persistenceStorageSize":1,
   "deploymentName":"wi-root-ion",
   "deploymentInstancePerPops":1,
   "enableAutoScaling":false,
   "deploymentPops":"YYZ"
}
```
> Request body example for a Container:
```json
{
   "name":"w-user-pah",
   "type":"CONTAINER",
   "image":"nginx:latest",
   "addImagePullCredentialsOption":true,
   "containerUsername":"test.username",
   "containerPassword":"test-password",
   "containerServer":null,
   "containerEmail":null,
   "secretEnvironmentVariableKey":null,
   "secretEnvironmentVariableValue":null,
   "vpc":"Default",
   "addAnyCastIpAddress":false,
   "publicPorts":"80-200",
   "protocol":"UDP",
   "specs":"SP-3",
   "persistenceStoragePath":null,
   "persistenceStorageSize":1,
   "deploymentName":"wi-root-pxa",
   "deploymentInstancePerPops":1,
   "deploymentPops":"FRA",
   "enableAutoScaling":true,
   "cpuUtilization":50,
   "minInstancesPerPop":1,
   "maxInstancesPerPop":2
}
```
<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networkpolicyrules</code>

Create a new workload

Required | &nbsp;
------- | -----------
`Required | &nbsp;
 ------- | -----------
 `name`<br/>*string* | The name of the workload.
 `stackId`<br/>*UUID* | The ID of the stack that a workload belongs to.
 `slug`<br/>*string* | A workload's programmatic name. Workload slugs are used to build its instances names.
 `version`<br/>*string* | A version number for the workload. Versions start at 1 when they are created and increment by 1 every time they are updated.
 `type`<br/>*string* | Specify whether a workload is a VM-based workload or container-based.
 `isRemoteManagementEnabled` <br/>*boolean* | Specify if you would like to manage your instances remotely via serial console or VNC.
 `image`<br/>*string* | Either the location of a Docker image to run as a container or the image to use for the virtual machine. If for a virtual machine, this is in the format of /[:]. If the image tag portion is omitted, 'default' is assumed which is the most recently created, ready, and non-deprecated image of that slug. A set of common images is present on the 'stackpath-edge' stack.
 `cpu`<br/>*string* | The number of vCPUs for the workload's instance.
 `memory`<br/>*string* | The memory size for the workload's instance.
 `specs`<br/>*string* | Specification type for resources which are allocated to each instance in a workload.
 `deploymentName`<br/>*string* | The name of the deployment.
 `deploymentPops`<br/>*string* | The point of presence of a deployment. In the format [A-Z][A-Z][A-Z]. I
 `enableAutoScaling` <br/>*boolean* | Specify if you would like to enable autoscaling.
 `id`<br/>*string* | A workload's unique identifier.
 `status`<br/>*string* | The status of the workload. It can be either ACTIVE or DISABLED.

<!-------------------- EDIT A WORKLOAD -------------------->

### EDIT a workload

```shell
curl -X PUT \
  -H "MC-Api-Key: your_api_key" \
  -d "request_body" \
  "https://cloudmc_endpoint/v1/services/stackpath/test-area/workloads/1b932678-1038-4ab4-9fa4-c4c06e696e20"
```

> Request body example for a Container:
```json
{
  "name": "my-vm-workload",
  "stackId": "2f661cf6-8d08-42d0-918c-c20362fc9940",
  "slug": "my-vm-workload",
  "version": "8",
  "type": "CONTAINER",
  "isRemoteManagementEnabled": false,
  "image": "stackpath-edge/centos-7-cpanel:v201905241955",
  "cpu": "1",
  "memory": "2Gi",
  "specs": "SP-1",
  "firstBootSshKey": "ssh-rsa...",
  "deploymentName": "chicago-1",
  "deploymentPops": "ORD",
  "enableAutoScaling": true,
  "cpuUtilization": 50,
  "minInstancesPerPop": 2,
  "maxInstancesPerPop": 3,
  "id": "4b23edf3-9847-4400-b779-f94203227324",
  "status": "ACTIVE"
}
```

> Request body example for a Container:
```json
{
  "name": "my-container-workload",
  "stackId": "2f661cf6-8d08-42d0-918c-c20362fc9940",
  "slug": "my-container-workload",
  "version": "1",
  "type": "Container",
  "isRemoteManagementEnabled": false,
  "image": "redis:alpine",
  "addImagePullCredentialsOption": true,
  "containerUsername": "username",
  "containerServer": "container.server.io",
  "containerEmail": "myemail@email.com",
  "containerPassword": "my-password",
  "cpu": "2",
  "memory": "4Gi",
  "specs": "SP-2",
  "deploymentName": "toronto-1",
  "deploymentPops": "YYZ",
  "enableAutoScaling": false,
  "deploymentInstancePerPops": 2,
  "id": "e5f95455-1b50-4da1-86e1-6f9293f818a9",
  "status": "ACTIVE"
}
```

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/networkpolicyrules/:id</code>

Edit a new network policy rule.

Required | &nbsp;
------- | -----------
`name`<br/>*string* | The name of the workload.
`stackId`<br/>*UUID* | The ID of the stack that a workload belongs to.
`slug`<br/>*string* | A workload's programmatic name. Workload slugs are used to build its instances names.
`version`<br/>*string* | A version number for the workload. Versions start at 1 when they are created and increment by 1 every time they are updated.
`type`<br/>*string* | Specify whether a workload is a VM-based workload or container-based.
`isRemoteManagementEnabled` <br/>*boolean* | Specify if you would like to manage your instances remotely via serial console or VNC.
`image`<br/>*string* | Either the location of a Docker image to run as a container or the image to use for the virtual machine. If for a virtual machine, this is in the format of /[:]. If the image tag portion is omitted, 'default' is assumed which is the most recently created, ready, and non-deprecated image of that slug. A set of common images is present on the 'stackpath-edge' stack.
`cpu`<br/>*string* | The number of vCPUs for the workload's instance.
`memory`<br/>*string* | The memory size for the workload's instance.
`specs`<br/>*string* | Specification type for resources which are allocated to each instance in a workload.
`deploymentName`<br/>*string* | The name of the deployment.
`deploymentPops`<br/>*string* | The point of presence of a deployment. In the format [A-Z][A-Z][A-Z]. I
`enableAutoScaling` <br/>*boolean* | Specify if you would like to enable autoscaling.
`id`<br/>*string* | A workload's unique identifier.
`status`<br/>*string* | The status of the workload. It can be either ACTIVE or DISABLED.

Optional | &nbsp;
------- | -----------
`addImagePullCredentialsOption`<br/>*boolean* | Specify if there are credentials neededed to pull a container image. Defaults to false. Only appicable for containers.
`containerUsername`<br/>*string* | The username that should be used for authenticate the image pull.
`containerEmail`<br/>*string* | The password that should be used to authenticate the image pull.
`containerServer`<br/>*string* | The server that the credentials should be used with. This value will default to the docker hub registry when not set.
`containerPassword`<br/>*string* | The password that should be used to authenticate the image pull.
`firstBootSshKey`<br/>*string* | The first boot SSH key.
`deploymentInstancePerPops`<br/>*integer* | The number of deployments per point of presence. Only required if autoscaling is not enabled.
`cpuUtilization`<br/>*integer* | The average CPU utlilization threshold to be reached before deploying a new instance. Only required if autoscaling is enabled.
`minInstancesPerPop`<br/>*integer* | The minimum number of instances per point of presence. Only required if autoscaling is enabled.
`maxInstancesPerPop`<br/>*integer* | The maximum number of instances per point of presence. Only required if autoscaling is enabled.

<!-------------------- DELETE A WORKLOAD -------------------->

### Delete a workload

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/stackpath/test-area/workloads/1b932678-1038-4ab4-9fa4-c4c06e696e20"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "ef70cafa-0544-4709-a66a-c68595ee105a",
  "taskStatus": "SUCCESS"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/workloads/:id</code>

Delete a workload in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the workload deletion.
`taskStatus` <br/>*string* | The status of the operation.