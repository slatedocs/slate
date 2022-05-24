## Environments

Environments allow you to manage resources of a specific service and to manage your [users'](#administration-users) access to them. With [environment roles](#administration-roles), you have tight control of what a user is allowed to do in your environment. A general use case of environments is to split your resources into different [deployment environments](https://en.wikipedia.org/wiki/Deployment_environment) (e.g. dev, staging and production). The advantage is that resources of different deployments are isolated from each other and you can restrict user access to your most critical resources.


<!-------------------- LIST ENVIRONMENTS -------------------->

### List environments

`GET /environments`

```shell
# Retrieve visible environments
curl "https://cloudmc_endpoint/api/v2/environments" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [{
    "id": "1ee5cd43-8395-4cd5-a20f-0f1e83b7f8bd",
    "name": "cheyenne_mountain",
    "description": "Environment for base at Cheyenne Mountain",
    "metadata": {
      "mode": "project"
    },
    "defaultRole": {
      "creationDate": "2020-01-02T16:04:27.000Z",
      "version": 1,
      "isSystem": false,
      "isDefault": false,
      "deleted": false,
      "name": "Owner",
      "alias": "owner",
      "id": "b7c48102-350e-40b9-9a3e-b7a0b3cfa535",
      "isFixed": true,
      "defaultScope": "ENV"
    },
    "membership": "MANY_USERS",
    "creationDate": "2017-08-15T12:00:00.000Z",
    "organization": {
      "id": "a9f93785-0545-4876-8241-3b19b9a86721",
      "name": "sg1",
      "entryPoint": "sg1"
    },
    "allowExternalMembers": false,
    "state": "PROVISIONED",
    "serviceConnection": {
      "id": "adfbdb51-493b-45b1-8802-3f6327afb9e6",
      "name": "Compute - Québec"
    },
  }]
}
```
List environments that you have access to. It will only return environments that you're member of if you're not assigned the `Environments read` permission.


Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the environment
`name`<br/>*string* | The name of the environment
`description`<br/>*string* | The description of the environment
`metadata`<br/>*object* | Additional information about the environment
`membership`<br/>*string* | Type of membership of the environment. (e.g. ALL_ORG_USERS, MANY_USERS)
`creationDate`<br/>*string* | The date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) that the environment was created
`organization`<br/>*[Organization](#administration-organizations)* | The organization of the environment<br/>*includes*: `id`, `name`, `entryPoint`
`allowExternalMembers`<br/>*boolean* | Indicates if the environment supports external members or not
`defaultRole`<br/>*object* | The role that will be assigned to new users logging into the organization
`state`<br/>*string* | Indicates the state of the environment. Possible states are PROVISIONING, PROVISIONED, ERROR_PROVISIONING, PURGED, PURGING, ERROR_PURGING, and PENDING.
`serviceConnection`<br/>*[ServiceConnection](#administration-service-connections)* | The service connection of the environment<br/>*includes*: `id`, `name`, `serviceCode`, `type`


<!-------------------- GET ENVIRONMENT -------------------->

### Retrieve an environment

`GET /environments/:id`

```shell
# Retrieve visible environment

curl "https://cloudmc_endpoint/api/v2/environments/487a2745-bb8a-44bc-adb1-e3b048f6def2" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "1ee5cd43-8395-4cd5-a20f-0f1e83b7f8bd",
    "name": "cheyenne_mountain",
    "description": "Environment for base at Cheyenne Mountain",
    "metadata": {
      "mode": "project"
    },
    "defaultRole": {
      "creationDate": "2020-01-02T16:04:27.000Z",
      "version": 1,
      "isSystem": false,
      "isDefault": false,
      "deleted": false,
      "name": "Owner",
      "alias": "owner",
      "id": "b7c48102-350e-40b9-9a3e-b7a0b3cfa535",
      "isFixed": true,
      "defaultScope": "ENV"
    },
    "membership": "MANY_USERS",
    "creationDate": "2017-08-15T12:00:00.000Z",
    "organization": {
      "id": "a9f93785-0545-4876-8241-3b19b9a86721",
      "name": "sg1",
      "entryPoint": "sg1"
    },
    "allowExternalMembers": false,
    "state": "PROVISIONING",
    "serviceConnection": {
      "id": "adfbdb51-493b-45b1-8802-3f6327afb9e6",
      "name": "Compute - Québec"
    },
  }
}
```

Retrieve an environment you have access to. You can always retrieve environments that you're a member of but to access other environments you will need the `Environments read` permission.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the environment
`name`<br/>*string* | The name of the environment
`description`<br/>*string* | The description of the environment
`metadata`<br/>*object* | Additional information about the environment
`membership`<br/>*string* | Type of membership of the environment. (e.g. ALL_ORG_USERS, MANY_USERS)
`creationDate`<br/>*string* | The date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) that the environment was created
`organization`<br/>*[Organization](#administration-organizations)* | The organization of the environment<br/>*includes*: `id`, `name`, `entryPoint`
`allowExternalMembers`<br/>*boolean* | Indicates if the environment supports external members or not
`defaultRole`<br/>*object* | The role that will be assigned to new users logging into the organization
`state`<br/>*string* | Indicates the state of the environment. Possible states are PROVISIONING, PROVISIONED, ERROR_PROVISIONING, PURGED, PURGING, ERROR_PURGING, and PENDING.
`serviceConnection`<br/>*[ServiceConnection](#administration-service-connections)* | The service connection of the environment<br/>*includes*: `id`, `name`, `serviceCode`, `type`


<!-------------------- CREATE ENVIRONMENT -------------------->


### Create environment

`POST /environments`

Environments are created asynchronously on the underlying service. When creating an environment any underlying actions performed by the plugin is done asynchronously to the creation of the model, and its progress is reflected in the state of the environment. 

```shell
# Create an environment

curl -X POST "https://cloudmc_endpoint/api/v2/environments" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "request_body"
```
> Request body example:

```json
{
  "name": "glados",
  "description": "Environment property of Aperture Science",
  "membership": "MANY_USERS",
  "organization": {
    "id": "2fd60d6f-1fee-4fe5-8ec6-46d8776acc6f"
  },
  "serviceConnection": {
    "id": "7f0fa906-490a-467b-bc44-e2382d43015e"
  }
}
```

Required | &nbsp;
-------- | -----------
`name`<br/>*string* | The name of the new environment. Should be unique in the environment and only contain lower case characters, numbers, dashes and underscores.
`serviceConnection`<br/>*[ServiceConnection](#administration-service-connections)* | The service connection that the environment should be created in<br/>*required*: `id`

Optional | &nbsp;
-------- | -----------
`description`<br/>*string* | The description of the new environment.
`organization`<br/>*[Organization](#administration-organizations)* | The organization that the environment should be created in. *Defaults to your organization*<br/>*required*: `id`
`membership`<br/>*string* | Type of membership of the environment. ALL_ORG_USERS will add every user in the organization to this environment with the default role. MANY_USERS will allow you to  choose the users you want in the environment and assigned them specific roles. *Defaults to MANY_USERS*


Response | &nbsp;
---------- | -----------
`taskId`<br/>*UUID* | The id of the task
`taskStatus`<br/>*string* | The status of the task
`data`<br/>*[Environment](#administration-environments)* | The information about the created environment


```shell
# Response body example
```
```json
{
  "data": {
    "defaultRole": {
      "creationDate": "2019-09-04T19:40:11.000Z",
      "version": 1,
      "isSystem": false,
      "isDefault": false,
      "deleted": false,
      "name": "Owner",
      "alias": "owner",
      "id": "9f4d940d-708d-4784-98bd-926195691e34",
      "isFixed": true,
      "defaultScope": "ENV"
    },
    "membership": "MANY_USERS",
    "deleted": false,
    "organization": {
      "name": "organization-name",
      "id": "52fd201e-aa82-4a27-86b3-ea9650a7fb1e",
      "entryPoint": "system"
    },
    "name": "environment-name",
    "id": "a83e131f-4114-432b-a3fb-fd4c58907860",
    "allowExternalMembers": false,
    "state": "PENDING",
    "serviceConnection": {
      "id": "95ed7fa3-6f51-405e-b2c3-de43f20de2c3"
    }
  },
  "taskId": "a82113b9-7f76-4354-ae27-b18b0204d50f",
  "status": "PENDING"
}
```


<!-------------------- UPDATE ENVIRONMENT -------------------->


### Update environment

Environments are updated asynchronously on the underlying service. When updating an environment any underlying actions performed by the plugin is done asynchronously to the update of the model. The state of the environment will remain in the PROVISIONED state. The task returned in the response can be used to track the progress of the asynchronous update. 

If the membership mode is changed, users will also be added or removed asynchronously to / from the environment. The progress of the task can be tracked via the task id. 

`PUT /environments/:id`

```shell
# Update an environment
curl -X POST "https://cloudmc_endpoint/api/v2/environments/f9dea588-d7ab-4f42-b6e6-4b85f273f3db" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "request_body"
```
> Request body example:

```json
{
  "name": "skynet-beta-v2",
  "description": "Environment for the Skynet project (updated)",
}
```


Optional | &nbsp;
-------- | -----------
`name`<br/>*string* | The updated name of the environment. Should be unique in the environment and only contain lower case characters, numbers, dashes and underscores.
`description`<br/>*string* | The updated description of the environment
`membership`<br/>*string* | Type of membership of the environment. ALL_ORG_USERS will add every user in the organization to this environment with the default role. MANY_USERS will allow you to  choose the users you want in the environment and assigned them specific roles. *Defaults to MANY_USERS*

Response | &nbsp;
---------- | -----------
`taskId`<br/>*UUID* | The id of the task
`taskStatus`<br/>*string* | The status of the task
`data`<br/>*[Environment](#administration-environments)* | The information about the updated environment

```shell
# Response body example
```
```json
{
  "data": {
    "metadata": {
      "mode": "project"
    },
    "defaultRole": {
      "creationDate": "2020-01-02T16:04:27.000Z",
      "version": 1,
      "isSystem": false,
      "isDefault": false,
      "deleted": false,
      "name": "Owner",
      "alias": "owner",
      "id": "b7c48102-350e-40b9-9a3e-b7a0b3cfa535",
      "isFixed": true,
      "defaultScope": "ENV"
    },
    "description": "Environment for the Skynet project (updated)",
    "membership": "MANY_USERS",
    "creationDate": "2020-02-27T16:23:20.000Z",
    "deleted": false,
    "organization": {
      "name": "System",
      "id": "f6ece376-de9e-45d5-8719-82a279664ea9",
      "entryPoint": "system"
    },
    "name": "skynet-beta-v2",
    "id": "d77de7ad-274e-4ec9-8776-8d748b0671fd",
    "allowExternalMembers": false,
    "state": "PROVISIONED",
    "serviceConnection": {
      "serviceCode": "acs-dev-1",
      "name": "acs-dev-1",
      "id": "8901494c-01ee-4d6b-bd12-cd5347127039",
      "type": "cloudstack"
    }
  },
  "taskId": "105cddf8-4507-4131-87eb-fe383bbd882b",
  "taskStatus": "PENDING"
}
```

You will need the `Environments update` permission to execute this operation.

<!-------------------- DELETE ENVIRONMENT -------------------->


### Delete environment

`DELETE /environments/:id`

Environments are deleted asynchronously on the underlying service. The environment model will only be deleted if the environment is deleted sucessfully in the underlying service. 

If deleting an environment fails in the underlying service, subsequent delete attempts are considered a "force delete". A force delete entails attempting deleting the environment from the underlying service and then deleting the environment model regardless of the response from the underlying service. 

```shell
# Delete an environment
curl "https://cloudmc_endpoint/api/v2/environments/f9dea588-d7ab-4f42-b6e6-4b85f273f3db" \
   -X DELETE -H "MC-Api-Key: your_api_key"

# Response body example
```

Delete a specific environment. You will need a [role](#administration-roles) with the `Delete an existing environment	` permission to execute this operation.

```json
{
  "taskId": "1ac94e11-a8cf-45d9-ba0c-6bd7f797a8a4",
  "taskStatus": "PENDING"
}
```

Attributes | &nbsp;
---------- | -----------
`taskId`<br/>*UUID* | The id of the task
`taskStatus`<br/>*string* | The status of the task

<aside class="warning">
  <strong>Be careful:</strong> This will destroy all the resources in your environment.
</aside>


### List members

`GET /environments/:id/members`

```shell
# Retrieve visible user

curl "https://cloudmc_endpoint/v2/environments/[env-id]/members" \
   -H "MC-Api-Key: your_api_key"

# Response body example
```
```json
{
  "data": [
    {
      "id": "00977373-3eae-4d26-84df-68817f97b072",
      "creationDate": "2019-05-16T20:39:28.000Z",
      "state": "PROVISIONED",
      "role": {
        "id": "46fb36d8-6888-48ed-ab13-711fd19f0873",
        "name": "viewer",
      },
      "user": {
        "id": "ae3f1a72-e2b6-4865-856b-b3cf47ab8eb7",
        "firstName": "patatat",
        "lastName": "patatat",
        "userName": "patatat",
        "email": "pdube@cloudops.com"
      },
      "metadata": {
        "membership": "All"
      },
      "environment": {
				"id": "094e1dee-164b-4b32-be29-e6b4e27e7713"
			},
      "scopeQualifier": "ENV"
    },
  ]
}
```

List all the users in an environment that you have access to.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the binding between the user and the environment
`creationDate`<br/>*string* | The date the user membership was either created or updated.
`role`<br/>*[Role](#administration-roles)* | The role of the user in the environment<br/>*includes*: `id` and `name`
`user`<br/>*[User](#administration-users)* | A member of the environmment<br/>*includes*: `id`, `firstName`, `lastName`, `userName` and `email`
`metadata.membership`<br/>*string* | "All" if automatically added from the ALL_ORG_USERS membership. "Many" if added manually to the org.
`environment.id`<br/>*UUID* | The id of the environment the user is part of.
`scopeQualifier`<br/>*string* | The scope qualifier for the user. Possible value: ENV.

You will need to either be owner on the environment or have the `Environments: Own All` permission to execute this operation.

### Add member

`POST /environments/:id/members`

```shell
# Add an environment member
curl -X POST "https://cloudmc_endpoint/v2/environments/[environment-id]/members" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "[request_body]"

# Request body example
```
```json
{
  "user": {
    "id": "e3f01d38-c9e7-4959-9580-a8e84af2add1"
  },
  "role": {
    "id": "9ffd4630-4e2b-4c84-b200-3240d7c26dc6"
  }
}
```

```shell
# Response body example
```
```json
{
  "taskId": "a82113b9-7f76-4354-ae27-b18b0204d50f",
  "status": "PENDING"
}
```

Add a user to an environment that you have access to.

Required | &nbsp;
-------- | -----------
`user.id`<br/>*UUID* | The user that will be added to the environment.
`role.id`<br/>*UUID* | The role that the user will have in the environment.

You will need to either be owner on the environment or have the `Environments: Own All` permission to execute this operation.

### Update member

`PUT /environments/:env_id/members/:user_id`

```shell
# Update an environment member
curl -X PUT "https://cloudmc_endpoint/v2/environments/[environment-id]/members/[user-id]" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "[request_body]"

# Request body example
```
```json
{
  "role": {
    "id": "9ffd4630-4e2b-4c84-b200-3240d7c26dc6"
  }
}
```

Update a user in an environment that you have access to.

Required | &nbsp;
-------- | -----------
`role.id`<br/>*UUID* | The new role that the user will have in the environment.


You will need to either be owner on the environment or have the `Environments: Own All` permission to execute this operation.

### Remove member

Members of environment are deleted asynchronously on the underlying service. The environment member will only be deleted if the member is deleted sucessfully in the underlying environment service. 

If deleting an member fails in the underlying environment service, subsequent delete attempts are considered a "force delete". A force delete entails attempting deleting the member from the underlying environment service and then deleting the member model regardless of the response from the underlying service. 

`DELETE /environments/:env_id/members/:user_id`

```shell
# Remove a member from an environment
curl -X DELETE "https://cloudmc_endpoint/v2/environments/[environment-id]/members/[user-id]" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" 

```

```shell
# Response body example
```
```json
{
  "taskId": "a82113b9-7f76-4354-ae27-b18b0204d50f",
  "status": "PENDING"
}
```

Attributes | &nbsp;
---------- | -----------
`taskId`<br/>*UUID* | The id of the task
`taskStatus`<br/>*string* | The status of the task

You will need to either be owner on the environment or have the `Environments: Own All` permission to execute this operation.

### Default environment membership

`PUT /environments/:id/membership`

```shell
# Update default environment membership
curl -X PUT "https://cloudmc_endpoint/v2/environments/[environment-id]/membership" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "[request_body]"

# Request body example
```
```json
{
  "membership": "ALL_ORG_USERS",
  "defaultRole": {
    "id": "f05ff413-0d6d-4054-bbee-a720de5f1a4c"
  }
}
```

Update the default membership of an environment that you own.

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "1ee5cd43-8395-4cd5-a20f-0f1e83b7f8bd",
    "name": "cheyenne_mountain",
    "description": "Environment for base at Cheyenne Mountain",
    "metadata": {
      "mode": "project"
    },
    "defaultRole": {
      "creationDate": "2020-01-02T16:04:27.000Z",
      "version": 1,
      "isSystem": false,
      "isDefault": false,
      "deleted": false,
      "name": "Owner",
      "alias": "owner",
      "id": "b7c48102-350e-40b9-9a3e-b7a0b3cfa535",
      "isFixed": true,
      "defaultScope": "ENV"
    },
    "membership": "MANY_USERS",
    "creationDate": "2017-08-15T12:00:00.000Z",
    "organization": {
      "id": "a9f93785-0545-4876-8241-3b19b9a86721",
      "name": "sg1",
      "entryPoint": "sg1"
    },
    "allowExternalMembers": false,
    "state": "PROVISIONING",
    "serviceConnection": {
      "id": "adfbdb51-493b-45b1-8802-3f6327afb9e6",
      "name": "Compute - Québec"
    },
  }
}
```

Optional | &nbsp;
-------- | -----------
`membership`<br/>*string* | ALL_ORG_USERS if you want all users of the organization to be member of the environment. MANY_USERS if you want to manually manage members of the environment.
`defaultRole.id`<br/>*UUID* | The default role to give to a user that was added to the environment.

You will need to either be owner on the environment or have the `Environments: Own All` permission to execute this operation.
