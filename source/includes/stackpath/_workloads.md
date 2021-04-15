## Workloads

StackPath Edge Computing uses the concept of workloads to organize different applications. A workload can consist of one container or virtual machine image that is deployed to one or many locations.

Deploy and manage your workloads.


<!-------------------- LIST WORKLOADS -------------------->

### List workloads

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/workloads"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "name": "container-workload",
      "stackId": "a397735b-66d2-49ba-b665-e77acb944481",
      "slug": "container-workload",
      "version": "1",
      "created": "2021-02-22T17:32:27.202428099Z",
      "type": "CONTAINER",
      "network": "default",
      "cpu": "1",
      "memory": "2Gi",
      "isRemoteManagementEnabled": false,
      "image": "nginx",
      "addImagePullCredentialsOption": false,
      "environmentVariables": [
        {
          "key": "USER",
          "value": "my-user"
        }
      ],
      "secretEnvironmentVariables": [
        {
          "key": "PASSWORD",
          "value": "[REDACTED]"
        }
      ],
      "addAnyCastIpAddress": false,
      "anycastIpAddress": "185.85.196.7",
      "commands": [
        "/bin/sh -c \"sleep 50\""
      ],
      "specs": "SP-1",
      "persistenceStoragePath": "/lib/data/newFolder",
      "persistenceStorageSize": 1,
      "deployments": [
        {
          "name": "deployment-lax",
          "pops": [
            "LAX"
          ],
          "enableAutoScaling": true,
          "cpuUtilization": 50,
          "minInstancesPerPop": "1",
          "maxInstancesPerPop": "2"
        }, {
          "name": "deployment-mia",
          "pops": [
            "MIA"
          ],
          "enableAutoScaling": false,
          "instancesPerPop": "1",
          "cpuUtilization": 0,
        }
      ],
      "id": "af951a00-5d1f-4c0a-85a4-b0714e833cd1",
      "status": "ACTIVE"
    }, {
      "id": "419be644-b2e7-4574-aad9-52e1cc0e6199",
      "name": "vm-workload",
      "stackId": "4f246958-595d-4ead-ae56-a88cff334b97",
      "slug": "vm-workload",
      "version": "10",
      "created": "2020-11-27T20:11:09.563675315Z",
      "type": "VM",
      "network": "default",
      "specs": "SP-1",
      "cpu": "1",
      "memory": "2Gi",
      "isRemoteManagementEnabled": false,
      "image": "stackpath-edge/centos-7:v202007311835",
      "addAnyCastIpAddress": false,
      "anycastIpAddress": "None",
      "firstBootSshKey": "ssh-rsa...",
      "persistenceStorageSize": 2,
      "persistenceStoragePath": "/var/lib/data",
      "deploymentName": "deployment-name",
      "deploymentPops": [
        "YYZ"
      ],
      "enableAutoScaling": false,
      "deploymentInstancePerPops": 3,
      "status": "ACTIVE"
    }
  ],
  "metadata": {
    "recordCount": 2
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/workloads</code>

Retrieve a list of all workloads in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`addImagePullCredentialsOption`<br/>*boolean* | It is used to indicate if additional credentials to pull container image are provided or not. Only applicable to workloads of `type` 'CONTAINER'.
`anycastIpAddress`<br/>*string* | The anycast IP address assigned to a workload. If there is no IP assigned to the workload then the value of this attribute will be `None`.
`commands`<br/>*Array[string]* | The commands that start a container. Only applicable to workloads of `type` 'CONTAINER'.
`containerEmail` <br/>*string* | The email address to use for the docker registry account. Only applicable to workloads of `type` 'CONTAINER' and `addImagePullCredentialsOption` is 'true'.
`containerServer` <br/>*string* | The server that the credentials should be used with. This value will default to the docker hub registry when not set. Only applicable to workloads of `type` 'CONTAINER' and `addImagePullCredentialsOption` is 'true'.
`containerUsername` <br/>*string* | The username used to authenticate the image pull. Only applicable to workloads of `type` 'CONTAINER' and `addImagePullCredentialsOption` is 'true'.
`cpu`<br/>*string* | The number of vCPUs for the workload's instance.
`created`<br/>*string* | Creation timestamp of the workload.
`deployments.cpuUtilization` <br/>*int* | The percentage of CPU utilization. Only applicable if autoscaling is enabled.
`deployments.enableAutoScaling` <br/>*boolean* | Specifies if autoscaling is enabled. If enabled, then `cpuUtilization` , `minInstancesPerPop` and `maxInstancesPerPop` are shown.
`deployments.instancesPerPop`<br/>*int* | The number of instances per point of presence. Only applicable if autoscaling is not enabled.
`deployments.maxInstancesPerPop` <br/>*int* | The maximum number of instances per PoP. Only applicable if autoscaling is enabled. Should be greater than zero and less than 50.
`deployments.minInstancesPerPop` <br/>*int* | The minimum number of instances per PoP. Only applicable if autoscaling is enabled. Should be greater than zero and less than 50.
`deployments.name`<br/>*string* | The name of the deployment.
`deployments.pops`<br/>*Array[string]* | The points of presence of a deployment. In the regex format `[A-Z]{3, 3}`.
`deployments`<br/>*Array[Object]* | The list of deployment targets.
`environmentVariables.key` <br/>*string* | The location to obtain a value for an environment variable. When editing a workload, include keys you wish to preserve. Keys not included in the body will be removed.
`environmentVariables.value` <br/>*string* | An environment variable's value.
`environmentVariables` <br/>*Array[Object]* | A list of environment variables. Only applicable to workloads of `type` 'CONTAINER'.
`firstBootSshKey`<br/>*string* | The ssh key(s) for the VM image. Keys are delimited by a newline, `\n`. Only applicable to workloads of `type` 'VM'.
`id`<br/>*string* | A workload's unique identifier.
`image`<br/>*string* | The workload's instance operating system image.
`isRemoteManagementEnabled`<br/>*boolean* | Specifies if remote management is enabled on workload instance or not.
`memory`<br/>*string* | The memory size for the workload's instance.
`name`<br/>*string* | The display name of the workload.
`network`<br/>*string* | Network interfaces to bind to the workload's instances.
`persistenceStoragePath`<br/>*string* | The path in an instance to mount a volume.
`persistenceStorageSize`<br/>*int* | The size of the mounted volume (in GB).
`secretEnvironmentVariables.key` <br/>*string* | The location to obtain a value for a secret environment variable. When editing a workload, include keys you wish to preserve. Keys not included in the body will be removed.
`secretEnvironmentVariables.value` <br/>*string* | A secret environment variable's value. When editing a workload, setting an existing environment variable's value to `[REDACTED]` will preserve the existing secret.
`secretEnvironmentVariables` <br/>*Array[Object]* | A list of sensitive environment variables. Only applicable to workloads of `type` 'CONTAINER'.
`slug`<br/>*string* | A workload's programmatic name. Workload slugs are used to build its instances names.
`specs`<br/>*string* | Specification type for resources which are allocated to each instance in a workload.
`stackId`<br/>*string* | The ID of the stack that a workload belongs to.
`status`<br/>*string* | The status of the workload. It can be either `ACTIVE` or `DISABLED`.
`type`<br/>*string* | Specify whether a workload is a VM-based workload or container-based.
`version`<br/>*string* | A version number for the workload. Versions start at 1 when they are created and increment by 1 every time they are updated.


<!-------------------- RETRIEVE A WORKLOAD -------------------->

### Retrieve a workload

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/workloads/1b932678-1038-4ab4-9fa4-c4c06e696e20"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "name": "container-workload",
    "stackId": "a397735b-66d2-49ba-b665-e77acb944481",
    "slug": "container-workload",
    "version": "1",
    "created": "2021-02-22T17:32:27.202428099Z",
    "type": "CONTAINER",
    "network": "default",
    "cpu": "1",
    "memory": "2Gi",
    "isRemoteManagementEnabled": false,
    "image": "nginx",
    "addImagePullCredentialsOption": false,
    "environmentVariables": [
      {
        "key": "USER",
        "value": "my-user"
      }
    ],
    "secretEnvironmentVariables": [
      {
        "key": "PASSWORD",
        "value": "[REDACTED]"
      }
    ],
    "addAnyCastIpAddress": false,
    "anycastIpAddress": "None",
    "commands": [
      "/bin/sh -c \"sleep 50\""
    ],
    "specs": "SP-1",
    "persistenceStoragePath": "/lib/data/newFolder",
    "persistenceStorageSize": 1,
    "deployments": [
      {
        "name": "deployment-lax",
        "pops": [
          "LAX"
        ],
        "enableAutoScaling": true,
        "cpuUtilization": 50,
        "minInstancesPerPop": "1",
        "maxInstancesPerPop": "2"
      }, {
        "name": "deployment-mia",
        "pops": [
          "MIA"
        ],
        "enableAutoScaling": false,
        "instancesPerPop": "1",
        "cpuUtilization": 0,
      }
    ],
    "id": "af951a00-5d1f-4c0a-85a4-b0714e833cd1",
    "status": "ACTIVE"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/workloads/:id</code>

Retrieve a workload in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`addImagePullCredentialsOption`<br/>*boolean* | It is used to indicate if additional credentials to pull container image are provided or not. Only applicable to workloads of `type` 'CONTAINER'.
`anycastIpAddress`<br/>*string* | The anycast IP address assigned to a workload. If there is no IP assigned to the workload then the value of this attribute will be `None`.
`commands`<br/>*Array[string]* | The commands that start a container. Only applicable to workloads of `type` 'CONTAINER'.
`containerEmail` <br/>*string* | The email address to use for the docker registry account. Only applicable to workloads of `type` 'CONTAINER' and `addImagePullCredentialsOption` is 'true'.
`containerServer` <br/>*string* | The server that the credentials should be used with. This value will default to the docker hub registry when not set. Only applicable to workloads of `type` 'CONTAINER' and `addImagePullCredentialsOption` is 'true'.
`containerUsername` <br/>*string* | The username used to authenticate the image pull. Only applicable to workloads of `type` 'CONTAINER' and `addImagePullCredentialsOption` is 'true'.
`cpu`<br/>*string* | The number of vCPUs for the workload's instance.
`created`<br/>*string* | Creation timestamp of the workload.
`deployments.cpuUtilization` <br/>*int* | The percentage of CPU utilization. Only applicable if autoscaling is enabled.
`deployments.enableAutoScaling` <br/>*boolean* | Specifies if autoscaling is enabled. If enabled, then `cpuUtilization` , `minInstancesPerPop` and `maxInstancesPerPop` are shown.
`deployments.instancesPerPop`<br/>*int* | The number of instances per point of presence. Only applicable if autoscaling is not enabled.
`deployments.maxInstancesPerPop` <br/>*int* | The maximum number of instances per PoP. Only applicable if autoscaling is enabled. Should be greater than zero and less than 50.
`deployments.minInstancesPerPop` <br/>*int* | The minimum number of instances per PoP. Only applicable if autoscaling is enabled. Should be greater than zero and less than 50.
`deployments.name`<br/>*string* | The name of the deployment.
`deployments.pops`<br/>*Array[string]* | The points of presence of a deployment. In the regex format `[A-Z]{3, 3}`.
`deployments`<br/>*Array[Object]* | The list of deployment targets.
`environmentVariables.key` <br/>*string* | The location to obtain a value for an environment variable. When editing a workload, include keys you wish to preserve. Keys not included in the body will be removed.
`environmentVariables.value` <br/>*string* | An environment variable's value.
`environmentVariables` <br/>*Array[Object]* | A list of environment variables. Only applicable to workloads of `type` 'CONTAINER'.
`firstBootSshKey`<br/>*string* | The ssh key(s) for the VM image. Keys are delimited by a newline, `\n`. Only applicable to workloads of `type` 'VM'.
`id`<br/>*string* | A workload's unique identifier.
`image`<br/>*string* | The workload's instance operating system image.
`isRemoteManagementEnabled`<br/>*boolean* | Specifies if remote management is enabled on workload instance or not.
`memory`<br/>*string* | The memory size for the workload's instance.
`name`<br/>*string* | The display name of the workload.
`network`<br/>*string* | Network interfaces to bind to the workload's instances.
`persistenceStoragePath`<br/>*string* | The path in an instance to mount a volume.
`persistenceStorageSize`<br/>*int* | The size of the mounted volume (in GB).
`secretEnvironmentVariables.key` <br/>*string* | The location to obtain a value for a secret environment variable. When editing a workload, include keys you wish to preserve. Keys not included in the body will be removed.
`secretEnvironmentVariables.value` <br/>*string* | A secret environment variable's value. When editing a workload, setting an existing environment variable's value to `[REDACTED]` will preserve the existing secret.
`secretEnvironmentVariables` <br/>*Array[Object]* | A list of sensitive environment variables. Only applicable to workloads of `type` 'CONTAINER'.
`slug`<br/>*string* | A workload's programmatic name. Workload slugs are used to build its instances names.
`specs`<br/>*string* | Specification type for resources which are allocated to each instance in a workload.
`stackId`<br/>*string* | The ID of the stack that a workload belongs to.
`status`<br/>*string* | The status of the workload. It can be either `ACTIVE` or `DISABLED`.
`type`<br/>*string* | Specify whether a workload is a VM-based workload or container-based.
`version`<br/>*string* | A version number for the workload. Versions start at 1 when they are created and increment by 1 every time they are updated.

<!-------------------- CREATE A WORKLOAD -------------------->

### Create a workload

```shell
curl -X POST \
    -H "MC-Api-Key: your_api_key" \
    -d "request_body" \
    "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/workloads"
```
> Request body example for a VM Workload type:

```json
{
  "name":"vm-workload",
  "slug":"vm-workload",
  "type":"VM",
  "image":"stackpath-edge/centos-7-cpanel:v201905241955",
  "addAnyCastIpAddress":false,
  "ports": [
    {
      "publicPort": "80",
      "protocol": "TCP",
      "publicPortDesc": "rule-name"
    }
  ],
  "firstBootSshKey":"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDcYr9OnzsDfYVW2I1kX/iYJ0mPG490bI5mbxbOAKPLMuWLguxRohX804j1XbwZJ+Sna+9rSfxaYA8vgd1MoYX10l9cnMLx/MMbYp4ZquauN4pGY3WoDeCqsTss3VUMW+7RFBILpU3SJTlDV02FI36D3IXb4A8XymCyU3KC99XXTfTQsuKC+WFRMsTWtklrasqCVd5yEG90i/aJc6A3TZGOYgPFNEeVYvNDaJmIkb3y4FfShoBIMgZRt0ay7SvWZUvyfvyNmK5W9ePdhZZ58R+7tQNmCzjQ4v0suWRuGJ/XL3+03w3HEsDdQx+noL+R+qAjoNFwc0spBBhJK+Q4ADqr nothing@gmail.com \nssh-rsa...",
  "specs":"SP-1",
  "persistenceStoragePath":"/lib/data/newFolder",
  "persistenceStorageSize":1,
  "deployments": [
    {
      "name": "deployment-name",
      "enableAutoScaling": false,
      "pops": ["MIA"],
      "instancesPerPop": "1"
    }
  ]
}
```

> Request body example for a CONTAINER Workload type:

```json
{
  "type": "CONTAINER",
  "name": "container-workload",
  "slug": "container-workload",
  "image": "nginx",
  "addAnyCastIpAddress": false,
  "ports": [
    {
      "publicPort": "80",
      "protocol": "TCP",
      "publicPortDesc": "rule-name"
    }
  ],
  "specs": "SP-1",
  "persistenceStoragePath": "/lib/data/newFolder",
  "persistenceStorageSize": 1,
  "commands": [
    "/bin/sh -c \"sleep 50\""
  ],
  "environmentVariables": [
    {
      "key": "USER",
      "value": "my-user"
    }
  ],
  "secretEnvironmentVariables": [
    {
      "key": "PASSWORD",
      "value": "my-password"
    }
  ],
  "deployments": [
    {
      "name": "deployment-mia",
      "enableAutoScaling": false,
      "pops": [
        "MIA"
      ],
      "instancesPerPop": "1"
    },
    {
      "name": "deployment-lax",
      "pops": [
        "LAX"
      ],
      "enableAutoScaling": true,
      "minInstancesPerPop": 1,
      "maxInstancesPerPop": 2,
      "cpuUtilization": 50
    }
  ]
}
```
> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/workloads</code>

Create a new workload in a given [environment](#administration-environments).

Required | &nbsp;
------- | -----------
`deployments.enableAutoScaling` <br/>*boolean* | Specifies if autoscaling is enabled. If enabled, then `cpuUtilization` , `minInstancesPerPop` and `maxInstancesPerPop` are required.
`deployments.name`<br/>*string* | The name of the deployment.
`deployments.pops`<br/>*Array[string]* | The points of presence of a deployment. In the regex format `[A-Z]{3, 3}`.
`deployments`<br/>*Array[Object]* | The list of deployment targets.
`firstBootSshKey`<br/>*string* | If creating a VM-based workload, SSH keys are required. Multiple SSH keys can be separated by newlines `\n`.
`image`<br/>*string* | Either the location of a Docker image to run as a container or the image to use for the virtual machine. If for a virtual machine, this is in the format of /[:]. If the image tag portion is omitted, 'default' is assumed which is the most recently created, ready, and non-deprecated image of that slug. A set of common images is present on the 'stackpath-edge' stack.
`name`<br/>*string* | The name of the workload. The workload name must not exceed 18 characters.
`specs`<br/>*string* | Specification type for resources which are allocated to each instance in a workload. Supported specifications are `SP-1 (1 vCPU, 2 GB RAM)`,`SP-2 (2 vCPU, 4 GB RAM)`,`SP-3 (2 vCPU, 8GB RAM)`,`SP-4 (4 vCPU, 16 GB RAM)`,`SP-5 (8 vCPU, 32 GB RAM)`.
`type`<br/>*string* | Specify whether a workload is a VM-based workload or container-based. Can be either `VM` or `CONTAINER`.
 
 Optional | &nbsp;
 ------- | -----------
`addAnyCastIpAddress`<br/>*boolean* | Option to AnyCast IP Address.
`addImagePullCredentialsOption` <br/>*boolean* | It is used to indicate if additional credentials to pull container image are provided or not.
`commands`<br/>*Array[string]* | The commands that start a container. Only applicable to workloads of `type` 'CONTAINER'. Commands cannot be updated or removed after workload creation.
`containerEmail` <br/>*string* | The email address to use for the docker registry account
`containerPassword` <br/>*string* | The password used to authenticate the image pull.
`containerServer` <br/>*string* | The server that the credentials should be used with. This value will default to the docker hub registry when not set.
`containerUsername` <br/>*string* | The username used to authenticate the image pull.
`deployments.cpuUtilization` <br/>*int* | The percentage of CPU utilization. Only applicable if autoscaling is enabled.
`deployments.instancesPerPop`<br/>*int* | The number of instances per point of presence. Only applicable if autoscaling is not enabled.
`deployments.maxInstancesPerPop` <br/>*int* | The maximum number of instances per PoP. Only applicable if autoscaling is enabled. Should be greater than zero and less than 50.
`deployments.minInstancesPerPop` <br/>*int* | The minimum number of instances per PoP. Only applicable if autoscaling is enabled. Should be greater than zero and less than 50.
`environmentVariables.key` <br/>*string* | The location to obtain a value for an environment variable. When editing a workload, include keys you wish to preserve. Keys not included in the body will be removed.
`environmentVariables.value` <br/>*string* | An environment variable's value.
`environmentVariables` <br/>*Array[Object]* | A list of environment variables. Only applicable to workloads of `type` 'CONTAINER'.
`persistenceStoragePath`<br/>*string* | The path in an instance to mount a volume.
`persistenceStorageSize`<br/>*int* | The size of the mounted volume (in GB).
`ports.protocol`<br/>*string* | Protocol for the network policy rule. Supported protocols are: `TCP`, `UDP` and `TCP_UDP`.
`ports.publicPort`<br/>*string* | A single port, such as 80 or a port range, such as 1024-65535 for which a network policy rule will be created for the workload.
`ports.publicPortDesc`<br/>*string* | A summary of what the network policy rule does or a name for it. It is highly recommended to give a unique description to easily identify a network policy rule. Defaults to an empty string if not provided.
`ports.publicPortSrc`<br/>*string* | A subnet that will define all the IPs allowed by the network policy rule. Defaults to `0.0.0.0/0` if not specified.
`ports` <br/>*Array[Object]* | A list of network interfaces that will be created for each workload instance.
`secretEnvironmentVariables.key` <br/>*string* | The location to obtain a value for a secret environment variable. When editing a workload, include keys you wish to preserve. Keys not included in the body will be removed.
`secretEnvironmentVariables.value` <br/>*string* | A secret environment variable's value. When editing a workload, setting an existing environment variable's value to `[REDACTED]` will preserve the existing secret.
`secretEnvironmentVariables` <br/>*Array[Object]* | A list of sensitive environment variables. Only applicable to workloads of `type` 'CONTAINER'.
`slug`<br/>*string* | A workload's programmatic name. Workload slugs are used to build its instances names. If not provided, defaults to workload's name. It must not exceed 18 characters.

<aside class="notice">
A workload can be added without any `ports`. However, `ports.publicPort` and `ports.protocol` are required to open a port or port range at workload creation.
</aside>

<!-------------------- EDIT A WORKLOAD -------------------->

### Edit a workload

```shell
curl -X PUT \
  -H "MC-Api-Key: your_api_key" \
  -d "request_body" \
  "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/workloads/1b932678-1038-4ab4-9fa4-c4c06e696e20"
```
> Request body example for a VM Workload type:

```json
{
  "name": "my-vm-workload",
  "type": "VM",
  "specs": "SP-1",
  "deployments": [
    {
      "name": "toronto-1",
      "pops": [
        "YYZ"
      ],
      "enableAutoScaling": true,
      "minInstancesPerPop": 1,
      "maxInstancesPerPop": 2,
      "cpuUtilization": 50
    }
  ]
}
```
> Request body example for a CONTAINER Workload type:

```js
{
  "name": "my-container-workload",
  "type": "CONTAINER",
  "image": "redis:alpine",
  "secretEnvironmentVariables": [
    {
      "key": "PASSWORD",
      "value": "my-password"
    },
    {
      // set value to [REDACTED] to preserve existing secret
      "key": "PRIVATE-KEY",
      "value": "[REDACTED]"
    }
  ],
  "addImagePullCredentialsOption": true,
  "containerUsername": "username",
  "containerServer": "container.server.io",
  "containerEmail": "myemail@email.com",
  "containerPassword": "my-password",
  "specs": "SP-2",
  "deployments": [
    {
      "name": "toronto-1",
      "enableAutoScaling": false,
      "pops": [
        "YYZ"
      ],
      "instancesPerPop": "1"
    }
  ]
}
```

> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```
<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/workloads/:id</code>

Edit a workload in a given [environment](#administration-environments).

Required | &nbsp;
------- | -----------
`deployments.enableAutoScaling` <br/>*boolean* | Specifies if autoscaling is enabled. If enabled, then `cpuUtilization` , `minInstancesPerPop` and `maxInstancesPerPop` are required.
`deployments.name`<br/>*string* | The name of the deployment.
`deployments.pops`<br/>*Array[string]* | The points of presence of a deployment. In the regex format `[A-Z]{3, 3}`.
`deployments`<br/>*Array[Object]* | The list of deployment targets.
`image`<br/>*string* | The location of a Docker image to run as a container. Only editable when `type` is equal to `CONTAINER`.
`name`<br/>*string* | The name of the workload. The workload name must not exceed 18 characters.
`specs`<br/>*string* | Specification type for resources which are allocated to each instance in a workload.
`type`<br/>*string* | Specify whether a workload is a VM-based workload or container-based. Can be either `VM` or `CONTAINER`.

Optional | &nbsp;
------- | -----------
`addImagePullCredentialsOption`<br/>*boolean* | It is used to indicate if additional credentials to pull container image are provided or not. Only available when `type` is equal to `CONTAINER`.
`containerEmail`<br/>*string* | The password that should be used to authenticate the image pull. Only available when `type` is equal to `CONTAINER`.
`containerPassword`<br/>*string* | The password that should be used to authenticate the image pull. Only available when `type` is equal to `CONTAINER`.
`containerServer`<br/>*string* | The server that the credentials should be used with. This value will default to the docker hub registry when not set. Only available when `type` is equal to `CONTAINER`.
`containerUsername`<br/>*string* | The username that should be used for authenticate the image pull. Only available when `type` is equal to `CONTAINER`.
`deployments.cpuUtilization`<br/>*integer* | The average CPU utlilization threshold to be reached before deploying a new instance. Only required if autoscaling is enabled.
`deployments.instancesPerPop`<br/>*integer* | The number of deployments per point of presence. Only required if autoscaling is not enabled.
`deployments.maxInstancesPerPop`<br/>*integer* | The maximum number of instances per point of presence. Only required if autoscaling is enabled.
`deployments.minInstancesPerPop`<br/>*integer* | The minimum number of instances per point of presence. Only required if autoscaling is enabled.
`environmentVariables.key` <br/>*string* | The location to obtain a value for an environment variable. When editing a workload, include keys you wish to preserve. Keys not included in the body will be removed.
`environmentVariables.value` <br/>*string* | An environment variable's value.
`environmentVariables` <br/>*Array[Object]* | A list of environment variables. Only applicable to workloads of `type` 'CONTAINER'.
`secretEnvironmentVariables.key` <br/>*string* | The location to obtain a value for a secret environment variable. When editing a workload, include keys you wish to preserve. Keys not included in the body will be removed.
`secretEnvironmentVariables.value` <br/>*string* | A secret environment variable's value. When editing a workload, setting an existing environment variable's value to `[REDACTED]` will preserve the existing secret.
`secretEnvironmentVariables` <br/>*Array[Object]* | A list of sensitive environment variables. Only applicable to workloads of `type` 'CONTAINER'.

<!-------------------- DELETE A WORKLOAD -------------------->

### Delete a workload

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/workloads/1b932678-1038-4ab4-9fa4-c4c06e696e20"
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
