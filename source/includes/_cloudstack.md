# CloudStack API

The CloudStack API provides endpoints for carrying out operations on CloudMC compute and networking entities. While each operation has its own validation and required fields, all operations need to specify the service code and environment in which they should be carried out. The following example URL describes how to specify this information for all entities.

<code>https://cloudmc_endpoint/v1/services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/:entity_type</code>

The two CloudStack service codes currently available in CloudMC correspond to compute regions: `compute-qc` for Québec, and `compute-on` for Ontario.

<aside class="notice">
An easy way to remember the structure of API endpoints is that going from left to right, the scope gets progressively more specific. First service, then environment of that service, then entity type, then operation on that entity type, etc.
</aside>

## Working with sub-organizations

*If you don't know what a sub-organization is, you can safely skip this section.*

When listing entities or carrying out an operation in an organization other than your own, make sure to specify the `org_id` query parameter in your request. For operations, this looks like:

<code>https://cloudmc_endpoint/v1/services/:service_code/:environment_name/:entity_type/:entity_id?operation=:operation&<strong>org_id=:org_id</strong></code>

and for listing entities, looks like:

<code>https://cloudmc_endpoint/v1/services/:service_code/:environment_name/:entity_type?<strong>org_id=:org_id</strong></code>

## Tasks

```shell
# The above command returns JSON structured like this:
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

`GET https://cloudmc_endpoint/v1/tasks/:id`

A task has three different status: `PENDING`, `FAILED` and `SUCCESS`. On a successful completion of the task (i.e. it's in the `SUCCESS` state), the response will contain a `result` field which will contain the result of the operation. It is important to note that we don't persist our task, a task will only stay alive for 30 minutes (in general).
