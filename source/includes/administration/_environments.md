## Environments

Environments allow you to manage resources of a specific service and to manage your [users'](#administration-users) access to them. With [environment roles](#administration-roles), you have tight control of what a user is allowed to do in your environment. A general use case of environments is to split your resources into different [deployment environments](https://en.wikipedia.org/wiki/Deployment_environment) (e.g. dev, staging and production). The advantage is that resources of different deployments are isolated from each other and you can restrict user access to your most critical resources.


<!-------------------- LIST ENVIRONMENTS -------------------->

### List environments

`GET /environments`

```shell
# Retrieve visible environments
curl "https://cloudmc_endpoint/v1/environments" \
   -H "MC-Api-Key: your_api_key"

# Response body example
```
```json
{
  "data": [{
    "id": "1ee5cd43-8395-4cd5-a20f-0f1e83b7f8bd",
    "name": "cheyenne_mountain",
    "description": "Environment for base at Cheyenne Mountain",
    "membership": "MANY_USERS",
    "creationDate": "2017-08-15T12:00:00.000Z",
    "organization": {
      "id": "a9f93785-0545-4876-8241-3b19b9a86721",
      "name": "sg1",
      "entryPoint": "sg1"
    },
    "serviceConnection": {
      "id": "adfbdb51-493b-45b1-8802-3f6327afb9e6",
      "name": "Compute - Québec"
    },
    "roles": [{
      "id": "951b768b-e91c-4d20-8b52-d4a2ab5a538a",
      "name": "Environment Admin",
      "isDefault": true,
      "users": [{
        "id": "9f84a6ce-7be1-4a08-a25b-edc6e57fb7e3",
        "name": "jack_oneill"
      }]
    }]
  }]
}
```
List environments that you have access to. It will only return environments that you're member of if you're not assigned the `Environments read` permission.


Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the environment
`name`<br/>*string* | The name of the environment
`description`<br/>*string* | The description of the environment
`membership`<br/>*string* | Type of membership of the environment. (e.g. ALL_ORG_USERS, MANY_USERS)
`creationDate`<br/>*string* | The date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) that the environment was created
`organization`<br/>*[Organization](#administration-organizations)* | The organization of the environment<br/>*includes*: `id`, `name`, `entryPoint`
`serviceConnection`<br/>*[ServiceConnection](#administration-service-connections)* | The service connection of the environment<br/>*includes*: `id`, `name`
`roles`<br/>*Array[[Role](#administration-roles)]* | The roles of the environment with all the users assigned to them.<br/>*includes*: `id`, `name`, `isDefault`, `users.id`, `users.name`



<!-------------------- GET ENVIRONMENT -------------------->

### Retrieve an environment

`GET /environments/:id`

```shell
# Retrieve visible environment

curl "https://cloudmc_endpoint/v1/environment/[environment-id]" \
   -H "MC-Api-Key: your_api_key"

# Response body example
```
```json
{
  "data": {
    "id": "487a2745-bb8a-44bc-adb1-e3b048f6def2",
    "name": "galactica",
    "description": "Environment for the Galactica",
    "membership": "MANY_USERS",
    "creationDate": "2017-08-15T12:00:00.000Z",
    "organization": {
      "id": "a3340a89-8f60-407d-8a49-f5cfe81eef8f",
      "name": "kobol",
      "entryPoint": "kobol"
    },
    "serviceConnection": {
      "id": "adfbdb51-493b-45b1-8802-3f6327afb9e6",
      "name": "Compute - Québec"
    },
    "users": [{
      "id": "6e84ab70-4c62-4db1-bbd8-343636a34647",
      "userName": "starbuck"
    }],
    "roles": [{
      "id": "b04b8a7c-6e89-4dba-9734-74d9f1b7be04",
      "name": "Environment Admin",
      "isDefault": true,
      "users": [{
        "id": "6e84ab70-4c62-4db1-bbd8-343636a34647",
        "name": "starbuck"
      }]
    }]
  }
}
```

Retrieve an environment you have access to. You can always retrieve environments that you're member of but to access other environments you will need the `Environments read` permission.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the environment
`name`<br/>*string* | The name of the environment
`description`<br/>*string* | The description of the environment
`membership`<br/>*string* | Type of membership of the environment. (e.g. ALL_ORG_USERS, MANY_USERS)
`creationDate`<br/>*string* | The date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) that the environment was created
`organization`<br/>*[Organization](#administration-organizations)* | The organization of the environment<br/>*includes*: `id`, `name`, `entryPoint`
`serviceConnection`<br/>*[ServiceConnection](#administration-service-connections)* | The service connection of the environment<br/>*includes*: `id`, `name`
`users`<br/>*Array[[User](#administration-users)]* | The users that are members of the environment<br/>*includes*: `id`, `username`
`roles`<br/>*Array[[Role](#administration-roles)]* | The roles of the environment with all the users assigned to them.<br/>*includes*: `id`, `name`, `isDefault`, `users.id`, `users.name`

<!-------------------- CREATE ENVIRONMENT -------------------->


### Create environment

`POST /environments`

```shell
# Create an environment

curl -X POST "https://cloudmc_endpoint/v1/environments" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "[request_body]"

# Request body example
```
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
  },
  "roles": [{
    "name": "Environment Admin",
    "isDefault": true,
    "users": [{
      "id": "73b17dab-1705-45f1-84e2-997e2af5641b"
    }]
  }]
}
```

Create a new environment in a specific service and organization. You will need the `Environments create` permission to execute this operation.

Required | &nbsp;
-------- | -----------
`name`<br/>*string* | The name of the new environment. Should be unique in the environment and only contain lower case characters, numbers, dashes and underscores.
`description`<br/>*string* | The description of the new environment.
`serviceConnection`<br/>*[ServiceConnection](#administration-service-connections)* | The service connection that the environment should be created in<br/>*required*: `id`

Optional | &nbsp;
-------- | -----------
`organization`<br/>*[Organization](#administration-organizations)* | The organization that the environment should be created in. *Defaults to your organization*<br/>*required*: `id`
`membership`<br/>*string* | Type of membership of the environment. ALL_ORG_USERS will add every user in the organization to this environment with the default role. MANY_USERS will allow you to  choose the users you want in the environment and assigned them specific roles. *Defaults to MANY_USERS*
`roles`<br/>*Array[[Role](#administration-roles)]* | The roles of the environment and the users assigned to them. Also, defines the default role of the environment.<br/>*required*: `name`, `users.id`<br/>*optional*: `isDefault`


The responses' `data` field contains the updated [environment](#administration-environments).


<!-------------------- UPDATE ENVIRONMENT -------------------->


### Update environment

`PUT /environments/:id`

```shell
# Update an environment
curl -X POST "https://cloudmc_endpoint/v1/environments/[environment-id]" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "[request_body]"

# Request body example
```
```json
{
  "name": "skynet-beta",
  "description": "Environment for the Skynet project",
  "roles": [{
    "id": "f9dea588-d7ab-4f42-b6e6-4b85f273f3db",
    "users": [{
      "id": "07e02355-d05b-47cf-860d-f69cf0432276"
    }]
  }]
}
```


Optional | &nbsp;
-------- | -----------
`name`<br/>*string* | The updated name of the environment. Should be unique in the environment and only contain lower case characters, numbers, dashes and underscores.
`description`<br/>*string* | The updated description of the environment
`membership`<br/>*string* | Type of membership of the environment. ALL_ORG_USERS will add every user in the organization to this environment with the default role. MANY_USERS will allow you to  choose the users you want in the environment and assigned them specific roles. *Defaults to MANY_USERS*
`roles`<br/>*Array[[Role](#administration-roles)]* | Update the users roles in the environment. Also, can also update the default role.<br/>*required*: `name`, `users.id`<br/>*optional*: `isDefault`


You will need the `Environments update` permission to execute this operation.

<!-------------------- DELETE ENVIRONMENT -------------------->


### Delete environment

`DELETE /environments/:id`

```shell
# Delete an environment

curl "https://cloudmc_endpoint/v1/environments/[environment-id]" \
   -X DELETE -H "MC-Api-Key: your_api_key"

```

Delete a specific environment. You will need a [role](#administration-roles) with the `Delete an existing environment	` permission to execute this operation.

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
    },
  ]
}
```

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the binding between the user and the environment
`creationDate`<br/>*string* | The date the user membership was either created or updated.
`role`<br/>*[Role](#administration-roles)* | The role of the user in the environment<br/>*includes*: `id` and `name`
`user`<br/>*[User](#administration-users)* | A member of the environmment<br/>*includes*: `id`, `firstName`, `lastName`, `userName` and `email`
`metadata.membership`<br/>*UUID* | "All" if automatically added from the ALL_ORG_USERS membership. "Many" if added manually to the org.

You will need to either be owner on the environment or have the `Admin environments` permission to execute this operation.

### Add member

`POST /environments/:id/members`

```shell
# Update an environment
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

Required | &nbsp;
-------- | -----------
`user.id`<br/>*UUID* | The user that will be added to the environment.
`role.id`<br/>*UUID* | The role that the user will have in the environment.

You will need to either be owner on the environment or have the `Admin environments` permission to execute this operation.

### Update member

`PUT /environments/:env_id/members/:user_id`

```shell
# Update an environment
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

Required | &nbsp;
-------- | -----------
`role.id`<br/>*UUID* | The new role that the user will have in the environment.


You will need to either be owner on the environment or have the `Admin environments` permission to execute this operation.

### Remove member

`DELETE /environments/:env_id/members/:user_id`

```shell
# Update an environment
curl -X DELETE "https://cloudmc_endpoint/v2/environments/[environment-id]/members/[user-id]" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" 

```

You will need to either be owner on the environment or have the `Admin environments` permission to execute this operation.

### Default environment membership

`PUT /environments/:id/membership`

```shell
# Update an environment
curl -X POST "https://cloudmc_endpoint/v2/environments/[environment-id]/membership" \
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

Optional | &nbsp;
-------- | -----------
`membership`<br/>*string* | ALL_ORG_USERS if you want all users of the organization to be member of the environment. MANY_USERS if you want to manually manage members of the environment.
`defaultRole.id`<br/>*UUID* | The default role to give to a user that was added to the environment.

You will need to either be owner on the environment or have the `Admin environments` permission to execute this operation.
