### Workloads

Deploy and manage your workloads.

<!-------------------- LIST WORKLOADS -------------------->

#### List workloads

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
      "spec": "SP-2",
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
`spec`<br/>*string* | Specification type for resources which are allocated to each instance in a workload.
`version`<br/>*string* | A version number for the workload. Versions start at 1 when they are created and increment by 1 every time they are updated.
`created`<br/>*string* | Creation timestamp of the workload.
`type`<br/>*string* | Specify whether a workload is a VM based workload or container based.
`network`<br/>*string* | Network interfaces to bind to the workload's instances.
`cpu`<br/>*string* | The number of vCPUs for the workload's instance.
`memory`<br/>*string* | The memory size for the workload's instance.
`isRemoteManagementEnabled`<br/>*boolean* | Specify if remote management is enabled on workload instance or not.
`image`<br/>*string* | The workload's instance operating system image.


<!-------------------- RETRIEVE A WORKLOAD -------------------->

#### Retrieve an instance

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
    "spec": "SP-1",
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

Retrieve an instance in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | A workload's unique identifier.
`name`<br/>*string* | The display name of the workload.
`stackId`<br/>*string* | The ID of the stack that a workload belongs to.
`slug`<br/>*string* | A workload's programmatic name. Workload slugs are used to build its instances names.
`status`<br/>*string* | The status of the workload. It can be either ACTIVE or DISABLED.
`spec`<br/>*string* | Specification type for resources which are allocated to each instance in a workload.
`version`<br/>*string* | A version number for the workload. Versions start at 1 when they are created and increment by 1 every time they are updated.
`created`<br/>*string* | Creation timestamp of the workload.
`type`<br/>*string* | Specify whether a workload is a VM based workload or container based.
`network`<br/>*string* | Network interfaces to bind to the workload's instances.
`cpu`<br/>*string* | The number of vCPUs for the workload's instance.
`memory`<br/>*string* | The memory size for the workload's instance.
`isRemoteManagementEnabled`<br/>*boolean* | Specify if remote management is enabled on workload instance or not.
`image`<br/>*string* | The workload's instance operating system image.