### Instances

Manage your workload instances.

<!-------------------- LIST INSTANCES -------------------->

#### List instances

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/instances?workloadId=e485fe8c-e1de-40f7-b3b3-a43700441e0e"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "stackId": "asd04459-1ccf-4a0d-8aaa-98d0f52dd2f3",
      "workloadId": "e485fe8c-e1de-40f7-b3b3-a43700441e0e",
      "name": "test-dep1-lax-0",
      "ipAddress": "10.128.16.2",
      "publicIpAddress": "151.139.71.25",
      "location": "Los Angeles",
      "createdDate": "2020-11-10T16:52:15Z",
      "startedDate": "2020-11-10T16:52:15Z",
      "id": "e485fe8c-e1de-40f7-b3b3-a43700441e0e/instance-name-1",
      "status": "RUNNING"
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instance?workloadId=:workloadId</code>

Retrieve a list of all workload instance in a given [environment](#administration-environments) for a given workload ID.

Query Params | &nbsp;
---- | -----------
`workloadId`<br/>*string* | The workload ID to get the instances for. It is mandatory.

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | The instance ID. It is the combination of <workloadId>/<name>.
`name`<br/>*string* | The instance name.
`status`<br/>*string* | The instance status. Possible values are: RUNNING, STARTING, SCHEDULING.
`stackId`<br/>*UUID* | The stack ID to which this instance belongs.
`workloadId`<br/>*UUID* | The workload ID to which this instance belongs.
`ipAddress`<br/>*string* | The internal IP address associated with the instance.
`publicIpAddress`<br/>*string* | The public IP address associated with the instance.
`location`<br/>*string* | The instance location.
`createdDate`<br/>*string* | The instance creation date.
`startedDate`<br/>*string* | The instance started date.


<!-------------------- RETRIEVE AN INSTANCE -------------------->

#### Retrieve an instance

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/instances/e485fe8c-e1de-40f7-b3b3-a43700441e0e/instance-name-1"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "stackId": "asd04459-1ccf-4a0d-8aaa-98d0f52dd2f3",
    "workloadId": "e485fe8c-e1de-40f7-b3b3-a43700441e0e",
    "name": "instance-name-1",
    "ipAddress": "10.128.16.2",
    "publicIpAddress": "151.139.71.25",
    "location": "Los Angeles",
    "createdDate": "2020-11-10T16:52:15Z",
    "startedDate": "2020-11-10T16:52:15Z",
    "id": "e485fe8c-e1de-40f7-b3b3-a43700441e0e/instance-name-1",
    "status": "RUNNING"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id</code>

Retrieve an instance in a given [environment](#administration-environments) with the specific ID.

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | The instance ID. It is the combination of <workloadId>/<name>.
`name`<br/>*string* | The instance name.
`status`<br/>*string* | The instance status. Possible values are: RUNNING, STARTING, SCHEDULING.
`stackId`<br/>*UUID* | The stack ID to which this instance belongs.
`workloadId`<br/>*UUID* | The workload ID to which this instance belongs.
`ipAddress`<br/>*string* | The internal IP address associated with the instance.
`publicIpAddress`<br/>*string* | The public IP address associated with the instance.
`location`<br/>*string* | The instance location.
`createdDate`<br/>*string* | The instance creation date.
`startedDate`<br/>*string* | The instance started date.

<!-------------------- RESTART AN INSTANCE -------------------->

#### Restart an instance

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/instances/workload-id1/instance-name-1?operation=restart"
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=restart</code>

Restart an instance in a given [environment](#administration-environments) with the specific ID.

<!-------------------- ACCESS AN INSTANCE CONSOLE -------------------->

#### Access the console of an instance

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/instances/workload-id1/instance-name-1?operation=accessconsole"
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/instances/:id?operation=accessconsole</code>

Access the console of an instance in a given [environment](#administration-environments) with the specific ID.

For container type instances, the `containerRemoteAccessCommand` is required. For VM type instances, the `vmRemoteAccessType` is required. 

Required | &nbsp;
------- | -----------
`id` <br/>*string* | The ID of the instance to be accessed
`containerRemoteAccessCommand`<br/>*string* | The command to execute on the container instance. ex. /bin/bash
`vmRemoteAccessType`<br/>*VmRemoteAccessType* | The remote access type. Can be either SERIAL or VNC. 

