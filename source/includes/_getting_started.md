# Getting started

The CloudMC API allows you to manage your environments and provision resources in a simple programmatic way using standard HTTP requests.

The API is  [RESTful](https://en.wikipedia.org/wiki/Representational_state_transfer). Responses, successful or not, are returned in [JSON](http://www.json.org/). Request bodies must be [JSON](http://www.json.org/), and should be made over SSL.

API endpoint : `https://cloudmc_endpoint/api/v2`

## Authentication

```shell
## To authenticate, add a header
## Make sure to replace `your_api_key` with your API key.
curl "https://cloudmc_endpoint/api/v2/organizations" \
   -H "MC-Api-Key: your_api_key"
```

API endpoints are secured by the same role-based access control (RBAC) as the CloudMC portal. To identify who is making the requests, it is required to add a header to your HTTP requests:

`MC-Api-Key: your_api_key`

<aside class="notice">
You must replace <code>your_api_key</code> with your personal API key.
</aside>

The API key is found from the API keys section under the user profile menu. If you don't see CloudMC API keys section, contact your system administrator as you may not have the permission to see that section. **Your API key carries the same privileges as your CloudMC account, so be sure to keep it secret**. If you think your API has been compromised, regenerate your API key from the API keys section.

## Working with sub-organizations

*If you don't know what a sub-organization is, you can safely skip this section.*

When using the API in an organization other than your own, make sure to specify the `org_id` query parameter in your request. This looks like:

<code>https://cloudmc_endpoint/api/v2/users&<strong>org_id=:org_id</strong></code>

## HTTP verbs
The CloudMC API can be used by any tool that is fluent in HTTP. The appropriate HTTP method should be used depending on the desired action.

Verbs | Purpose
------ | -------
`GET` | Used to retrieve information about a resource.
`POST` | Used to create (or provision) a new resource or perform an operation on it.
`PUT` | Used to update a resource.
`DELETE` | Used to delete a resource.

## Responses

### Success response

<!--
```json
{
  "data": [
    { "_comment" : "JSON representation of first object goes here" },
    { "_comment" : "JSON representation of second object goes here" }
  ],
  "metadata": {
    "pageSize": 2,
    "pageCurrent": 1,
    "recordCount": 2,
    "sortField": "templateName",
    "sortOrder": "ASC"
  }
}
```
-->

```shell
# Example without tasks
```

```json
{
  "data": [
    { "_comment" : "JSON representation of first object goes here" },
    { "_comment" : "JSON representation of second object goes here" }
  ]
}
```

```shell
# Example of compute API call with task
```

```json
{
  "taskId": "c2c13744-8610-4012-800a-0907bea110a5",
  "taskStatus": "PENDING"
}
```

When an API request is successful, the response body will contain the `data` field with the result of the API call. If you're using the [compute API](#compute-api), the `data` field might be empty since most of the operations are asynchronous. The response will contain the `taskId` and `taskStatus` fields so that you can retrieve the result of the operation you executed through the [task API](#tasks).

Attributes | &nbsp;
--- | ---
`data` | The data field contains the object requested by the API caller.
`taskId` | The [task id](#tasks) of an operation executed through the services API.
`taskStatus` | The status of a [task](#tasks) of an operation executed the services API.
<!--
`metadata` | The metadata is an optionally returned field containing paging and sorting information
-->

<aside class="notice">
If the response contains the "errors" field, the request was <strong>not</strong> successful.
</aside>

### Error response

```shell
# Example of error response
```

```json
{
  "errors": [
    {
      "code": 2012,
      "message": "Cannot stop an instance that isn't in the running state",
      "context": {
        "id": "4534cc36-bc46-48bc-ac5c-3ee4e42f0a44",
        "currentState": "Stopped",
        "expectedStates": [
          "Running"
        ],
        "type": "instances"
      }
    }
  ]
}
```

When an API request is unsuccessful, the response body will contain the `errors` field :

Attributes | &nbsp;
--- | ---
`errors` | A list of errors objects that contain information about each error.

Each error has additional fields to describe it :

Attributes | &nbsp;
--- | ---
`code` | The CloudMC error code.
`message` | A human readable explanation of the error code.
`context` | Additional information.

The HTTP status codes of error responses :

Status code | Reason
----------- | -------
`200` | The request was successful.
`204` | The request was successful and the response body is empty.
`400` | Bad request -- Occurs when invalid parameters are provided or when quota limit is exceeded.
`403` | Forbidden -- Not authorized to perform this request.
`404` | Not Found -- Cannot locate the specified endpoint.
`405` | Method not allowed -- Cannot use that HTTP verb on the specified endpoint.
`500` | An unexpected error occurred.
<!--
## Paging & sorting
All `GET` endpoints returning a list of objects support pagination. The desired page of result is specified by providing the following HTTP query parameters:

Name | Description
------------------- | -----------
`page_number` | The page of data to retrieve
`page_size` | The number of items to display per page
`sort_by` | The field name to sort by
`sort_order` | The sort order (ASC or DESC)
-->

## Tasks

```shell
# Example of an asynchronus operation response
```

```json
{
  "taskId": "b2f82e2a-123e-4f86-a4c7-dc9b850dd11e",
  "taskStatus": "PENDING"
}
```

Some operations take longer to execute, and to avoid blocking on the response until it is fully completed, these are treated in an asynchronous fashion. This means the API will return immediately, and provide you a `taskId` that is your reference to the ongoing background task. Using the tasks API, you can query the task's status to find if it has completed and obtain the result of the operation.

### Retrieve a task

```shell
# Example of success response
```

```json
{
  "taskId": "b2f82e2a-123e-4f86-a4c7-dc9b850dd11e",
  "taskStatus": "SUCCESS",
  "result": {
    "id": "8f064230-82a6-4f93-a17d-9cf9623b0cb5",
    "name": "morty"
  }
}
```

`GET https://cloudmc_endpoint/api/v2/tasks/:id`

A task has three different status: `PENDING`, `FAILED` and `SUCCESS`. On a successful completion of the task (i.e. it's in the `SUCCESS` state), the response will contain a `result` field which will contain the result of the operation. It is important to note that we don't persist our task, a task will only stay alive for 30 minutes (in general).

